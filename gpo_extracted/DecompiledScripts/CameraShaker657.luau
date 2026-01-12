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
v0.new = function(v10, v11, v12) --[[ Line: 25 ]] --[[ Name: new ]]
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
        _callback = v11, 
        _forceShake = v12
    }, v0));
end;
v0.Start = function(v13) --[[ Line: 47 ]] --[[ Name: Start ]]
    -- upvalues: l_profilebegin_0 (copy), l_profileend_0 (copy)
    if v13._running then
        return;
    else
        v13._running = true;
        local l__callback_0 = v13._callback;
        game:GetService("RunService"):BindToRenderStep(v13._renderName, v13._renderPriority, function(v15) --[[ Line: 52 ]]
            -- upvalues: v13 (copy), l_profilebegin_0 (ref), l_profileend_0 (ref), l__callback_0 (copy)
            if _G.cameraShakeEnabled == false and v13._forceShake == nil then
                return;
            else
                l_profilebegin_0("CameraShakerUpdate");
                local v16 = v13:Update(v15);
                l_profileend_0();
                l__callback_0(v16);
                return;
            end;
        end);
        return;
    end;
end;
v0.Stop = function(v17) --[[ Line: 64 ]] --[[ Name: Stop ]]
    if not v17._running then
        return;
    else
        game:GetService("RunService"):UnbindFromRenderStep(v17._renderName);
        v17._running = false;
        return;
    end;
end;
v0.StopSustained = function(v18, v19) --[[ Line: 71 ]] --[[ Name: StopSustained ]]
    for _, v21 in pairs(v18._camShakeInstances) do
        if v21.fadeOutDuration == 0 then
            v21:StartFadeOut(v19 or v21.fadeInDuration);
        end;
    end;
end;
v0.Update = function(v22, v23) --[[ Line: 80 ]] --[[ Name: Update ]]
    -- upvalues: v7 (copy), l_CameraShakeState_0 (copy), l_new_1 (copy), l_Angles_0 (copy), l_rad_0 (copy)
    local l__camShakeInstances_0 = v22._camShakeInstances;
    if _G.cameraShakeEnabled == false and v22._forceShake == nil then
        for v25 = 1, #l__camShakeInstances_0 do
            v22._removeInstances[#v22._removeInstances + 1] = v25;
        end;
        for v26 = #v22._removeInstances, 1, -1 do
            local v27 = v22._removeInstances[v26];
            table.remove(l__camShakeInstances_0, v27);
            v22._removeInstances[v26] = nil;
        end;
        return CFrame.new();
    else
        local l_v7_0 = v7;
        local l_v7_1 = v7;
        v23 = math.clamp(v23, 0, 0.016666666666666666);
        for v30 = 1, #l__camShakeInstances_0 do
            local v31 = l__camShakeInstances_0[v30];
            local l_v31_State_0 = v31:GetState();
            if l_v31_State_0 == l_CameraShakeState_0.Inactive and v31.DeleteOnInactive then
                v22._removeInstances[#v22._removeInstances + 1] = v30;
            elseif l_v31_State_0 ~= l_CameraShakeState_0.Inactive then
                local v33 = v31:UpdateShake(v23);
                l_v7_0 = l_v7_0 + v33 * v31.PositionInfluence;
                l_v7_1 = l_v7_1 + v33 * v31.RotationInfluence;
            end;
        end;
        for v34 = #v22._removeInstances, 1, -1 do
            local v35 = v22._removeInstances[v34];
            table.remove(l__camShakeInstances_0, v35);
            v22._removeInstances[v34] = nil;
        end;
        return l_new_1(l_v7_0) * l_Angles_0(0, l_rad_0(l_v7_1.Y), 0) * l_Angles_0(l_rad_0(l_v7_1.X), 0, (l_rad_0(l_v7_1.Z)));
    end;
end;
v0.Shake = function(v36, v37) --[[ Line: 132 ]] --[[ Name: Shake ]]
    local v38 = false;
    if type(v37) == "table" then
        v38 = v37._camShakeInstance;
    end;
    assert(v38, "ShakeInstance must be of type CameraShakeInstance");
    v36._camShakeInstances[#v36._camShakeInstances + 1] = v37;
    return v37;
end;
v0.ShakeSustain = function(v39, v40) --[[ Line: 139 ]] --[[ Name: ShakeSustain ]]
    local v41 = false;
    if type(v40) == "table" then
        v41 = v40._camShakeInstance;
    end;
    assert(v41, "ShakeInstance must be of type CameraShakeInstance");
    v39._camShakeInstances[#v39._camShakeInstances + 1] = v40;
    v40:StartFadeIn(v40.fadeInDuration);
    return v40;
end;
v0.ShakeOnce = function(v42, v43, v44, v45, v46, v47, v48) --[[ Line: 147 ]] --[[ Name: ShakeOnce ]]
    -- upvalues: v8 (copy)
    local v49 = v8.new(v43, v44, v45, v46);
    v49.PositionInfluence = typeof(v47) == "Vector3" and v47 or Vector3.new(0.15000000596046448, 0.15000000596046448, 0.15000000596046448, 0);
    v49.RotationInfluence = typeof(v48) == "Vector3" and v48 or Vector3.new(1, 1, 1, 0);
    v42._camShakeInstances[#v42._camShakeInstances + 1] = v49;
    return v49;
end;
v0.StartShake = function(v50, v51, v52, v53, v54, v55) --[[ Line: 159 ]] --[[ Name: StartShake ]]
    -- upvalues: v8 (copy)
    local v56 = v8.new(v51, v52, v53);
    v56.PositionInfluence = typeof(v54) == "Vector3" and v54 or Vector3.new(0.15000000596046448, 0.15000000596046448, 0.15000000596046448, 0);
    v56.RotationInfluence = typeof(v55) == "Vector3" and v55 or Vector3.new(1, 1, 1, 0);
    v56:StartFadeIn(v53);
    v50._camShakeInstances[#v50._camShakeInstances + 1] = v56;
    return v56;
end;
return v0;