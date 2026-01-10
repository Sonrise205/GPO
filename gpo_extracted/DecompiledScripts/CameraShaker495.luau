local v0 = {};
v0.__index = v0;
local l_profilebegin_0 = debug.profilebegin;
local l_profileend_0 = debug.profileend;
local l_new_0 = Vector3.new;
local l_new_1 = CFrame.new;
local l_Angles_0 = CFrame.Angles;
local l_rad_0 = math.rad;
local v7 = l_new_0();
local v8 = require(script.CameraShakeInstance);
local l_CameraShakeState_0 = v8.CameraShakeState;
v0.CameraShakeInstance = v8;
v0.Presets = require(script.CameraShakePresets);
v0.new = function(v10, v11) --[[ Line: 27 ]] --[[ Name: new ]]
    -- upvalues: v7 (copy), v0 (copy)
    assert(type(v10) == "number", "RenderPriority must be a number (e.g.: Enum.RenderPriority.Camera.Value)");
    assert(type(v11) == "function", "Callback must be a function");
    return (setmetatable({
        _running = false, 
        _renderName = "CameraShaker", 
        _renderPriority = v10, 
        _posAddShake = v7, 
        _rotAddShake = v7, 
        _camShakeInstances = {}, 
        _removeInstances = {}, 
        _callback = v11
    }, v0));
end;
v0.Start = function(v12) --[[ Line: 48 ]] --[[ Name: Start ]]
    -- upvalues: l_profilebegin_0 (copy), l_profileend_0 (copy)
    if v12._running then
        return;
    else
        v12._running = true;
        local l__callback_0 = v12._callback;
        game:GetService("RunService"):BindToRenderStep(v12._renderName, v12._renderPriority, function(v14) --[[ Line: 52 ]]
            -- upvalues: l_profilebegin_0 (ref), v12 (copy), l_profileend_0 (ref), l__callback_0 (copy)
            l_profilebegin_0("CameraShakerUpdate");
            local v15 = v12:Update(v14);
            l_profileend_0();
            l__callback_0(v15);
        end);
        return;
    end;
end;
v0.Stop = function(v16) --[[ Line: 61 ]] --[[ Name: Stop ]]
    if not v16._running then
        return;
    else
        game:GetService("RunService"):UnbindFromRenderStep(v16._renderName);
        v16._running = false;
        return;
    end;
end;
v0.Update = function(v17, v18) --[[ Line: 68 ]] --[[ Name: Update ]]
    -- upvalues: v7 (copy), l_CameraShakeState_0 (copy), l_new_1 (copy), l_Angles_0 (copy), l_rad_0 (copy)
    local l_v7_0 = v7;
    local l_v7_1 = v7;
    local l__camShakeInstances_0 = v17._camShakeInstances;
    v18 = math.clamp(v18, 0, 0.016666666666666666);
    for v22 = 1, #l__camShakeInstances_0 do
        local v23 = l__camShakeInstances_0[v22];
        local l_v23_State_0 = v23:GetState();
        if l_v23_State_0 == l_CameraShakeState_0.Inactive and v23.DeleteOnInactive then
            v17._removeInstances[#v17._removeInstances + 1] = v22;
        elseif l_v23_State_0 ~= l_CameraShakeState_0.Inactive then
            l_v7_0 = l_v7_0 + v23:UpdateShake(v18) * v23.PositionInfluence;
            l_v7_1 = l_v7_1 + v23:UpdateShake(v18) * v23.RotationInfluence;
        end;
    end;
    for v25 = #v17._removeInstances, 1, -1 do
        local v26 = v17._removeInstances[v25];
        table.remove(l__camShakeInstances_0, v26);
        v17._removeInstances[v25] = nil;
    end;
    return l_new_1(l_v7_0) * l_Angles_0(0, l_rad_0(l_v7_1.Y), 0) * l_Angles_0(l_rad_0(l_v7_1.X), 0, (l_rad_0(l_v7_1.Z)));
end;
v0.Shake = function(v27, v28) --[[ Line: 104 ]] --[[ Name: Shake ]]
    local v29 = false;
    if type(v28) == "table" then
        v29 = v28._camShakeInstance;
    end;
    assert(v29, "ShakeInstance must be of type CameraShakeInstance");
    v27._camShakeInstances[#v27._camShakeInstances + 1] = v28;
    return v28;
end;
v0.ShakeSustain = function(v30, v31) --[[ Line: 111 ]] --[[ Name: ShakeSustain ]]
    local v32 = false;
    if type(v31) == "table" then
        v32 = v31._camShakeInstance;
    end;
    assert(v32, "ShakeInstance must be of type CameraShakeInstance");
    v30._camShakeInstances[#v30._camShakeInstances + 1] = v31;
    v31:StartFadeIn(v31.fadeInDuration);
    return v31;
end;
v0.ShakeOnce = function(v33, v34, v35, v36, v37, v38, v39) --[[ Line: 119 ]] --[[ Name: ShakeOnce ]]
    -- upvalues: v8 (copy)
    local v40 = v8.new(v34, v35, v36, v37);
    v40.PositionInfluence = typeof(v38) == "Vector3" and v38 or Vector3.new(0.15000000596046448, 0.15000000596046448, 0.15000000596046448, 0);
    v40.RotationInfluence = typeof(v39) == "Vector3" and v39 or Vector3.new(1, 1, 1, 0);
    v33._camShakeInstances[#v33._camShakeInstances + 1] = v40;
    return v40;
end;
v0.StartShake = function(v41, v42, v43, v44, v45, v46) --[[ Line: 128 ]] --[[ Name: StartShake ]]
    -- upvalues: v8 (copy)
    local v47 = v8.new(v42, v43, v44);
    v47.PositionInfluence = typeof(v45) == "Vector3" and v45 or Vector3.new(0.15000000596046448, 0.15000000596046448, 0.15000000596046448, 0);
    v47.RotationInfluence = typeof(v46) == "Vector3" and v46 or Vector3.new(1, 1, 1, 0);
    v47:StartFadeIn(v44);
    v41._camShakeInstances[#v41._camShakeInstances + 1] = v47;
    return v47;
end;
return v0;