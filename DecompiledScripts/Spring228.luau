local v0 = {};
v0.new = function(v1, v2) --[[ Line: 49 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v3 = v1 or 0;
    v2 = v2 or os.clock;
    return (setmetatable({
        _clock = v2, 
        _time0 = v2(), 
        _position0 = v3, 
        _velocity0 = 0 * v3, 
        _target = v3, 
        _damper = 1, 
        _speed = 1
    }, v0));
end;
v0.Impulse = function(v4, v5) --[[ Line: 70 ]] --[[ Name: Impulse ]]
    v4.Velocity = v4.Velocity + v5;
end;
v0.TimeSkip = function(v6, v7) --[[ Line: 79 ]] --[[ Name: TimeSkip ]]
    local v8 = v6._clock();
    local v9, v10 = v6:_positionVelocity(v8 + v7);
    v6._position0 = v9;
    v6._velocity0 = v10;
    v6._time0 = v8;
end;
v0.__index = function(v11, v12) --[[ Line: 168 ]] --[[ Name: __index ]]
    -- upvalues: v0 (copy)
    if v0[v12] then
        return v0[v12];
    elseif v12 == "Value" or v12 == "Position" or v12 == "p" then
        local v13, _ = v11:_positionVelocity(v11._clock());
        return v13;
    elseif v12 == "Velocity" or v12 == "v" then
        local _, v16 = v11:_positionVelocity(v11._clock());
        return v16;
    elseif v12 == "Target" or v12 == "t" then
        return v11._target;
    elseif v12 == "Damper" or v12 == "d" then
        return v11._damper;
    elseif v12 == "Speed" or v12 == "s" then
        return v11._speed;
    elseif v12 == "Clock" then
        return v11._clock;
    else
        error(("%q is not a valid member of Spring"):format((tostring(v12))), 2);
        return;
    end;
end;
v0.__newindex = function(v17, v18, v19) --[[ Line: 190 ]] --[[ Name: __newindex ]]
    local v20 = v17._clock();
    if v18 == "Value" or v18 == "Position" or v18 == "p" then
        local _, v22 = v17:_positionVelocity(v20);
        v17._position0 = v19;
        v17._velocity0 = v22;
        v17._time0 = v20;
        return;
    elseif v18 == "Velocity" or v18 == "v" then
        local v23, _ = v17:_positionVelocity(v20);
        v17._position0 = v23;
        v17._velocity0 = v19;
        v17._time0 = v20;
        return;
    elseif v18 == "Target" or v18 == "t" then
        local v25, v26 = v17:_positionVelocity(v20);
        v17._position0 = v25;
        v17._velocity0 = v26;
        v17._target = v19;
        v17._time0 = v20;
        return;
    elseif v18 == "Damper" or v18 == "d" then
        local v27, v28 = v17:_positionVelocity(v20);
        v17._position0 = v27;
        v17._velocity0 = v28;
        v17._damper = v19;
        v17._time0 = v20;
        return;
    elseif v18 == "Speed" or v18 == "s" then
        local v29, v30 = v17:_positionVelocity(v20);
        v17._position0 = v29;
        v17._velocity0 = v30;
        v17._speed = v19 < 0 and 0 or v19;
        v17._time0 = v20;
        return;
    elseif v18 == "Clock" then
        local v31, v32 = v17:_positionVelocity(v20);
        v17._position0 = v31;
        v17._velocity0 = v32;
        v17._clock = v19;
        v17._time0 = v19();
        return;
    else
        error(("%q is not a valid member of Spring"):format((tostring(v18))), 2);
        return;
    end;
end;
v0._positionVelocity = function(v33, v34) --[[ Line: 232 ]] --[[ Name: _positionVelocity ]]
    local l__position0_0 = v33._position0;
    local l__velocity0_0 = v33._velocity0;
    local l__target_0 = v33._target;
    local l__damper_0 = v33._damper;
    local l__speed_0 = v33._speed;
    local v40 = l__speed_0 * (v34 - v33._time0);
    local v41 = l__damper_0 * l__damper_0;
    local v42 = nil;
    local v43 = nil;
    local v44 = nil;
    if v41 < 1 then
        v42 = math.sqrt(1 - v41);
        local v45 = math.exp(-l__damper_0 * v40) / v42;
        v44 = v45 * math.cos(v42 * v40);
        v43 = v45 * math.sin(v42 * v40);
    elseif v41 == 1 then
        v42 = 1;
        local v46 = math.exp(-l__damper_0 * v40) / v42;
        v44 = v46;
        v43 = v46 * v40;
    else
        v42 = math.sqrt(v41 - 1);
        local v47 = math.exp((-l__damper_0 + v42) * v40) / (2 * v42);
        local v48 = math.exp((-l__damper_0 - v42) * v40) / (2 * v42);
        v44 = v47 + v48;
        v43 = v47 - v48;
    end;
    local v49 = v42 * v44 + l__damper_0 * v43;
    local v50 = 1 - (v42 * v44 + l__damper_0 * v43);
    local v51 = v43 / l__speed_0;
    local v52 = -l__speed_0 * v43;
    local v53 = l__speed_0 * v43;
    local v54 = v42 * v44 - l__damper_0 * v43;
    return v49 * l__position0_0 + v50 * l__target_0 + v51 * l__velocity0_0, v52 * l__position0_0 + v53 * l__target_0 + v54 * l__velocity0_0;
end;
return v0;