local v0 = {};
v0.new = function(v1) --[[ Line: 30 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({
        _accel = v1 or 1, 
        _t0 = 0, 
        _y0 = 0, 
        _a0 = 0, 
        _t1 = 0, 
        _y1 = 0, 
        _a1 = 0
    }, v0));
end;
v0.__index = function(v2, v3) --[[ Line: 81 ]] --[[ Name: __index ]]
    -- upvalues: v0 (copy)
    if v0[v3] then
        return v0[v3];
    elseif v3 == "p" then
        local v4, _ = v2:_getstate(tick());
        return v4;
    elseif v3 == "v" then
        local _, v7 = v2:_getstate(tick());
        return v7;
    elseif v3 == "a" then
        return v2._accel;
    elseif v3 == "t" then
        return v2._y1;
    elseif v3 == "rtime" then
        local v8 = tick();
        return v8 < v2._t1 and v2._t1 - v8 or 0;
    else
        error(("Bad index %q"):format((tostring(v3))));
        return;
    end;
end;
v0.__newindex = function(v9, v10, v11) --[[ Line: 102 ]] --[[ Name: __newindex ]]
    if v10 == "p" then
        v9:_setstate(v11, nil, nil, nil);
        return;
    elseif v10 == "v" then
        v9:_setstate(nil, v11, nil, nil);
        return;
    elseif v10 == "a" then
        v9:_setstate(nil, nil, v11, nil);
        return;
    elseif v10 == "t" then
        v9:_setstate(nil, nil, nil, v11);
        return;
    elseif v10 == "pt" then
        v9:_setstate(v11, 0, nil, v11);
        return;
    else
        error(("Bad index %q"):format((tostring(v10))));
        return;
    end;
end;
v0._getstate = function(v12, v13) --[[ Line: 118 ]] --[[ Name: _getstate ]]
    if v13 < (v12._t0 + v12._t1) / 2 then
        local v14 = v13 - v12._t0;
        return v12._y0 + v14 * v14 / 2 * v12._a0, v14 * v12._a0;
    elseif v13 < v12._t1 then
        local v15 = v13 - v12._t1;
        return v12._y1 + v15 * v15 / 2 * v12._a1, v15 * v12._a1;
    else
        return v12._y1, 0;
    end;
end;
v0._setstate = function(v16, v17, v18, v19, v20) --[[ Line: 130 ]] --[[ Name: _setstate ]]
    local v21 = tick();
    local v22, v23 = v16:_getstate(v21);
    v22 = v17 or v22;
    v23 = v18 or v23;
    v16._accel = v19 or v16._accel;
    local v24 = v20 or v16._y1;
    if v16._accel * v16._accel < 1.0E-8 then
        local v25 = 0;
        local v26 = 0;
        v16._t0 = v25;
        v16._y0 = v22;
        v16._a0 = v26;
        v25 = 1e999;
        v26 = 0;
        v16._t1 = v25;
        v16._y1 = v24;
        v16._a1 = v26;
        return;
    else
        local v27 = v24 < v22;
        local v28 = v23 < 0;
        local v29 = v22 - v23 * v23 / (2 * v16._accel) < v24;
        local v30 = v22 + v23 * v23 / (2 * v16._accel) < v24;
        if v27 and v28 and v29 or not v27 and (v28 or not v28 and v30) then
            v16._a0 = v16._accel;
            v16._t1 = v21 + ((2 * v23 * v23 + 4 * v16._accel * (v24 - v22)) ^ 0.5 - v23) / v16._accel;
        else
            v16._a0 = -v16._accel;
            v16._t1 = v21 + ((2 * v23 * v23 - 4 * v16._accel * (v24 - v22)) ^ 0.5 + v23) / v16._accel;
        end;
        v16._t0 = v21 - v23 / v16._a0;
        v16._y0 = v22 - v23 * v23 / (2 * v16._a0);
        v16._y1 = v24;
        v16._a1 = -v16._a0;
        return;
    end;
end;
return v0;