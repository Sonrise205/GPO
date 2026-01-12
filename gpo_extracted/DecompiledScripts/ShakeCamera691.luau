local l_CurrentCamera_0 = workspace.CurrentCamera;
local l_CameraShaker_0 = require(script:WaitForChild("CameraShaker"));
local v3 = l_CameraShaker_0.new(Enum.RenderPriority.Camera.Value, function(v2) --[[ Line: 4 ]]
    -- upvalues: l_CurrentCamera_0 (copy)
    l_CurrentCamera_0.CFrame = l_CurrentCamera_0.CFrame * v2;
end);
v3:Start();
return function(v4) --[[ Line: 10 ]]
    -- upvalues: v3 (copy), l_CameraShaker_0 (copy)
    v4 = v4 or {};
    if _G.cameraShakeEnabled == false then
        return;
    elseif type(v4) == "table" then
        local v5 = v4.RotationInfluence or Vector3.new(0, 1, 1, 0);
        local v6 = v4.PositionInfluence or Vector3.new(0.25, 0.25, 0.25, 0);
        local v7 = v4.Magnitude or 5;
        local v8 = v4.Roughness or 5;
        local v9 = v4.FadeIn or 1;
        local v10 = v4.FadeOut or 1;
        v3:ShakeOnce(v7, v8, v9, v10, v6, v5);
        return;
    else
        if type(v4) == "string" then
            v3:Shake(l_CameraShaker_0.Presets[v4]);
        end;
        return;
    end;
end;