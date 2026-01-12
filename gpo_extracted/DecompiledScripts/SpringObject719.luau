local v0 = require(script.Parent.loader).load(script);
local l_RunService_0 = game:GetService("RunService");
local v2 = v0("Spring");
local v3 = v0("Maid");
local v4 = v0("Signal");
local v5 = v0("StepUtils");
local v6 = v0("Observable");
local v7 = v0("SpringUtils");
local v8 = v0("Blend");
local v9 = v0("Rx");
local v10 = {
    ClassName = "SpringObject"
};
v10.__index = v10;
v10.new = function(v11, v12, v13) --[[ Line: 29 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v4 (copy), v10 (copy)
    local v14 = setmetatable({
        _maid = v3.new(), 
        Changed = v4.new()
    }, v10);
    v14._maid:GiveTask(v14.Changed);
    if v11 then
        v14.Target = v11;
    else
        v14:_getSpringForType(0);
    end;
    if v12 then
        v14.Speed = v12;
    end;
    if v13 then
        v14.Damper = v13;
    end;
    return v14;
end;
v10.isSpringObject = function(v15) --[[ Line: 64 ]] --[[ Name: isSpringObject ]]
    -- upvalues: v10 (copy)
    local v16 = false;
    if type(v15) == "table" then
        v16 = getmetatable(v15) == v10;
    end;
    return v16;
end;
v10.ObserveRenderStepped = function(v17) --[[ Line: 72 ]] --[[ Name: ObserveRenderStepped ]]
    -- upvalues: l_RunService_0 (copy)
    return v17:ObserveOnSignal(l_RunService_0.RenderStepped);
end;
v10.ObserveVelocityOnRenderStepped = function(v18) --[[ Line: 76 ]] --[[ Name: ObserveVelocityOnRenderStepped ]]
    -- upvalues: l_RunService_0 (copy)
    return v18:ObserveVelocityOnSignal(l_RunService_0.RenderStepped);
end;
v10.ObserveVelocityOnSignal = function(v19, v20) --[[ Line: 80 ]] --[[ Name: ObserveVelocityOnSignal ]]
    -- upvalues: v6 (copy), v3 (copy), v5 (copy), v7 (copy)
    return v6.new(function(v21) --[[ Line: 81 ]]
        -- upvalues: v3 (ref), v5 (ref), v20 (copy), v7 (ref), v19 (copy)
        local v22 = v3.new();
        local v24, v25 = v5.bindToSignal(v20, function() --[[ Line: 84 ]]
            -- upvalues: v7 (ref), v19 (ref), v21 (copy)
            local v23 = v7.animating(v19._currentSpring);
            if v23 then
                v21:Fire(v7.fromLinearIfNeeded(v19._currentSpring.Velocity));
                return v23;
            else
                v21:Fire(v7.fromLinearIfNeeded(0 * v19._currentSpring.Velocity));
                return v23;
            end;
        end);
        v22:GiveTask(v25);
        v22:GiveTask(v19.Changed:Connect(v24));
        v24();
        return v22;
    end);
end;
v10.ObserveOnSignal = function(v26, v27) --[[ Line: 107 ]] --[[ Name: ObserveOnSignal ]]
    -- upvalues: v6 (copy), v3 (copy), v5 (copy), v7 (copy)
    return v6.new(function(v28) --[[ Line: 108 ]]
        -- upvalues: v3 (ref), v5 (ref), v27 (copy), v7 (ref), v26 (copy)
        local v29 = v3.new();
        local v32, v33 = v5.bindToSignal(v27, function() --[[ Line: 111 ]]
            -- upvalues: v7 (ref), v26 (ref), v28 (copy)
            local v30, v31 = v7.animating(v26._currentSpring);
            v28:Fire(v7.fromLinearIfNeeded(v31));
            return v30;
        end);
        v29:GiveTask(v33);
        v29:GiveTask(v26.Changed:Connect(v32));
        v32();
        return v29;
    end);
end;
v10.IsAnimating = function(v34) --[[ Line: 129 ]] --[[ Name: IsAnimating ]]
    -- upvalues: v7 (copy)
    return (v7.animating(v34._currentSpring));
end;
v10.Impulse = function(v35, v36) --[[ Line: 140 ]] --[[ Name: Impulse ]]
    -- upvalues: v7 (copy)
    v35._currentSpring:Impulse(v7.toLinearIfNeeded(v36));
    v35.Changed:Fire();
end;
v10.TimeSkip = function(v37, v38) --[[ Line: 150 ]] --[[ Name: TimeSkip ]]
    assert(type(v38) == "number", "Bad delta");
    v37._currentSpring:TimeSkip(v38);
    v37.Changed:Fire();
end;
v10.__index = function(v39, v40) --[[ Line: 157 ]] --[[ Name: __index ]]
    -- upvalues: v7 (copy), v10 (copy)
    if v40 == "Value" or v40 == "Position" or v40 == "p" then
        return v7.fromLinearIfNeeded(v39._currentSpring.Value);
    elseif v40 == "Velocity" or v40 == "v" then
        return v7.fromLinearIfNeeded(v39._currentSpring.Velocity);
    elseif v40 == "Target" or v40 == "t" then
        return v7.fromLinearIfNeeded(v39._currentSpring.Target);
    elseif v40 == "Damper" or v40 == "d" then
        return v39._currentSpring.Damper;
    elseif v40 == "Speed" or v40 == "s" then
        return v39._currentSpring.Speed;
    elseif v40 == "Clock" then
        return v39._currentSpring.Clock;
    elseif v10[v40] then
        return v10[v40];
    else
        error(("%q is not a member of SpringObject"):format((tostring(v40))));
        return;
    end;
end;
v10.__newindex = function(v41, v42, v43) --[[ Line: 177 ]] --[[ Name: __newindex ]]
    -- upvalues: v8 (copy), v9 (copy), v7 (copy)
    if v42 == "Value" or v42 == "Position" or v42 == "p" then
        local v44 = v8.toPropertyObservable(v43) or v9.of(v43);
        v41._maid._valueSub = v44:Subscribe(function(v45) --[[ Line: 181 ]]
            -- upvalues: v7 (ref), v41 (copy)
            local v46 = v7.toLinearIfNeeded(v45);
            v41:_getSpringForType(v46).Value = v46;
            v41.Changed:Fire();
        end);
        return;
    elseif v42 == "Velocity" or v42 == "v" then
        local v47 = v8.toPropertyObservable(v43) or v9.of(v43);
        v41._maid._velocitySub = v47:Subscribe(function(v48) --[[ Line: 189 ]]
            -- upvalues: v7 (ref), v41 (copy)
            local v49 = v7.toLinearIfNeeded(v48);
            v41:_getSpringForType(0 * v49).Velocity = v49;
            v41.Changed:Fire();
        end);
        return;
    elseif v42 == "Target" or v42 == "t" then
        local v50 = v8.toPropertyObservable(v43) or v9.of(v43);
        v41._maid._targetSub = v50:Subscribe(function(v51) --[[ Line: 198 ]]
            -- upvalues: v7 (ref), v41 (copy)
            local v52 = v7.toLinearIfNeeded(v51);
            v41:_getSpringForType(v52).Target = v52;
            v41.Changed:Fire();
        end);
        return;
    elseif v42 == "Damper" or v42 == "d" then
        local v53 = assert(v8.toNumberObservable(v43), "Invalid damper");
        v41._maid._damperSub = v53:Subscribe(function(v54) --[[ Line: 207 ]]
            -- upvalues: v41 (copy)
            assert(type(v54) == "number", "Bad damper");
            v41._currentSpring.Damper = v54;
            v41.Changed:Fire();
        end);
        return;
    elseif v42 == "Speed" or v42 == "s" then
        local v55 = assert(v8.toNumberObservable(v43), "Invalid speed");
        v41._maid._speedSub = v55:Subscribe(function(v56) --[[ Line: 216 ]]
            -- upvalues: v41 (copy)
            assert(type(v56) == "number", "Bad damper");
            v41._currentSpring.Speed = v56;
            v41.Changed:Fire();
        end);
        return;
    elseif v42 == "Clock" then
        assert(type(v43) == "function", "Bad clock value");
        v41._currentSpring.Clock = v43;
        v41.Changed:Fire();
        return;
    else
        error(("%q is not a member of SpringObject"):format((tostring(v42))));
        return;
    end;
end;
v10._getSpringForType = function(v57, v58) --[[ Line: 231 ]] --[[ Name: _getSpringForType ]]
    -- upvalues: v2 (copy), v7 (copy)
    if rawget(v57, "_currentSpring") == nil then
        rawset(v57, "_currentSpring", v2.new(v58));
        return v57._currentSpring;
    elseif typeof(v7.fromLinearIfNeeded(v57._currentSpring.Value)) == typeof(v58) then
        return v57._currentSpring;
    else
        local l_d_0 = v57._currentSpring.d;
        local l_s_0 = v57._currentSpring.s;
        v57._currentSpring = v2.new(v58);
        v57._currentSpring.Speed = l_s_0;
        v57._currentSpring.Damper = l_d_0;
        return v57._currentSpring;
    end;
end;
v10.Destroy = function(v61) --[[ Line: 255 ]] --[[ Name: Destroy ]]
    v61._maid:DoCleaning();
    setmetatable(v61, nil);
end;
return v10;