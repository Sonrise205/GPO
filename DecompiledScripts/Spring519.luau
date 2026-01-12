local v0 = {};
v0.__index = v0;
v0.new = function(v1, v2) --[[ Line: 74 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v3 = v1 or 0;
    local v4 = v2 or os.clock;
    return (setmetatable({
        _clock = v4, 
        _time0 = v4(), 
        _position0 = v3, 
        _velocity0 = 0 * v3, 
        _target = v3, 
        _damper = 1, 
        _speed = 1
    }, v0));
end;
v0.Impulse = function(v5, v6) --[[ Line: 96 ]] --[[ Name: Impulse ]]
    v5.Velocity = v5.Velocity + v6;
end;
v0.TimeSkip = function(v7, v8) --[[ Line: 105 ]] --[[ Name: TimeSkip ]]
    local v9 = v7._clock();
    local v10, v11 = v7:_positionVelocity(v9 + v8);
    v7._position0 = v10;
    v7._velocity0 = v11;
    v7._time0 = v9;
end;
v0.SetTarget = function(v12, v13, v14) --[[ Line: 119 ]] --[[ Name: SetTarget ]]
    if v14 then
        local v15 = v12._clock();
        v12._position0 = v13;
        v12._velocity0 = 0 * v13;
        v12._target = v13;
        v12._time0 = v15;
        return;
    else
        v12.Target = v13;
        return;
    end;
end;
v0.__index = function(v16, v17) --[[ Line: 212 ]]
    -- upvalues: v0 (copy)
    if v0[v17] then
        return v0[v17];
    elseif v17 == "Value" or v17 == "Position" or v17 == "p" then
        local v18, _ = v16:_positionVelocity(v16._clock());
        return v18;
    elseif v17 == "Velocity" or v17 == "v" then
        local _, v21 = v16:_positionVelocity(v16._clock());
        return v21;
    elseif v17 == "Target" or v17 == "t" then
        return v16._target;
    elseif v17 == "Damper" or v17 == "d" then
        return v16._damper;
    elseif v17 == "Speed" or v17 == "s" then
        return v16._speed;
    elseif v17 == "Clock" then
        return v16._clock;
    else
        error(string.format("%q is not a valid member of Spring", (tostring(v17))), 2);
        return;
    end;
end;
v0.__newindex = function(v22, v23, v24) --[[ Line: 234 ]] --[[ Name: __newindex ]]
    local v25 = v22._clock();
    if v23 == "Value" or v23 == "Position" or v23 == "p" then
        local _, v27 = v22:_positionVelocity(v25);
        v22._position0 = v24;
        v22._velocity0 = v27;
        v22._time0 = v25;
        return;
    elseif v23 == "Velocity" or v23 == "v" then
        local v28, _ = v22:_positionVelocity(v25);
        v22._position0 = v28;
        v22._velocity0 = v24;
        v22._time0 = v25;
        return;
    elseif v23 == "Target" or v23 == "t" then
        local v30, v31 = v22:_positionVelocity(v25);
        v22._position0 = v30;
        v22._velocity0 = v31;
        v22._target = v24;
        v22._time0 = v25;
        return;
    elseif v23 == "Damper" or v23 == "d" then
        local v32, v33 = v22:_positionVelocity(v25);
        v22._position0 = v32;
        v22._velocity0 = v33;
        v22._damper = v24;
        v22._time0 = v25;
        return;
    elseif v23 == "Speed" or v23 == "s" then
        local v34, v35 = v22:_positionVelocity(v25);
        v22._position0 = v34;
        v22._velocity0 = v35;
        v22._speed = v24 < 0 and 0 or v24;
        v22._time0 = v25;
        return;
    elseif v23 == "Clock" then
        local v36, v37 = v22:_positionVelocity(v25);
        v22._position0 = v36;
        v22._velocity0 = v37;
        v22._clock = v24;
        v22._time0 = v24();
        return;
    else
        error(string.format("%q is not a valid member of Spring", (tostring(v23))), 2);
        return;
    end;
end;
v0._positionVelocity = function(v38, v39) --[[ Line: 276 ]] --[[ Name: _positionVelocity ]]
    local l__position0_0 = v38._position0;
    local l__velocity0_0 = v38._velocity0;
    local l__target_0 = v38._target;
    local l__damper_0 = v38._damper;
    local l__speed_0 = v38._speed;
    local v45 = l__speed_0 * (v39 - v38._time0);
    local v46 = l__damper_0 * l__damper_0;
    local v47 = nil;
    local v48 = nil;
    local v49 = nil;
    if v46 < 1 then
        v47 = math.sqrt(1 - v46);
        local v50 = math.exp(-l__damper_0 * v45) / v47;
        v49 = v50 * math.cos(v47 * v45);
        v48 = v50 * math.sin(v47 * v45);
    elseif v46 == 1 then
        v47 = 1;
        local v51 = math.exp(-l__damper_0 * v45) / v47;
        v49 = v51;
        v48 = v51 * v45;
    else
        v47 = math.sqrt(v46 - 1);
        local v52 = math.exp((-l__damper_0 + v47) * v45) / (2 * v47);
        local v53 = math.exp((-l__damper_0 - v47) * v45) / (2 * v47);
        v49 = v52 + v53;
        v48 = v52 - v53;
    end;
    local v54 = v47 * v49 + l__damper_0 * v48;
    local v55 = 1 - (v47 * v49 + l__damper_0 * v48);
    local v56 = v48 / l__speed_0;
    local v57 = -l__speed_0 * v48;
    local v58 = l__speed_0 * v48;
    local v59 = v47 * v49 - l__damper_0 * v48;
    return v54 * l__position0_0 + v55 * l__target_0 + v56 * l__velocity0_0, v57 * l__position0_0 + v58 * l__target_0 + v59 * l__velocity0_0;
end;
return v0;