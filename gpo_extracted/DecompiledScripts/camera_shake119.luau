local l_RunService_0 = game:GetService("RunService");
local v1 = require("./mod/tween");
local v2 = require("./mod/utility");
local v3 = require("./obj/Shake");
local v4 = {};
local l_identity_0 = CFrame.identity;
local function v16() --[[ Line: 13 ]] --[[ Name: updateCamera ]]
    -- upvalues: v4 (ref), l_RunService_0 (copy), l_identity_0 (ref)
    if #v4 == 0 then
        return;
    else
        local l_CurrentCamera_0 = workspace.CurrentCamera;
        if not l_RunService_0:IsRunning() then
            l_CurrentCamera_0.CFrame = l_CurrentCamera_0.CFrame * l_identity_0:Inverse();
            local l_CFrame_0 = l_CurrentCamera_0.CFrame;
            local v8, v9 = l_CFrame_0:ToOrientation();
            l_CurrentCamera_0.CFrame = CFrame.new(l_CFrame_0.Position) * CFrame.fromOrientation(v8, v9, 0);
        end;
        local v10 = Vector3.new(0, 0, 0, 0);
        local l_identity_1 = CFrame.identity;
        local v12 = {};
        for _, v14 in v4 do
            if not v14.done then
                v10 = v10 + v14.pos;
                l_identity_1 = l_identity_1 * CFrame.Angles(v14.rot.x, v14.rot.y, v14.rot.z);
                table.insert(v12, v14);
            end;
        end;
        v4 = v12;
        local v15 = CFrame.new(v10) * l_identity_1;
        if not l_RunService_0:IsRunning() then
            l_identity_0 = v15;
        end;
        l_CurrentCamera_0.CFrame = l_CurrentCamera_0.CFrame * v15;
        return;
    end;
end;
local v17 = {};
local v18 = nil;
local v19 = nil;
v17.init = function() --[[ Line: 63 ]] --[[ Name: init ]]
    -- upvalues: v18 (ref), l_RunService_0 (copy), v19 (ref), v16 (copy)
    if v18 then
        return;
    else
        if l_RunService_0:IsRunning() then
            v18 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 69 ]]
                -- upvalues: v19 (ref)
                if not v19 then
                    return;
                else
                    workspace.CurrentCamera.CFrame = v19;
                    return;
                end;
            end);
        end;
        l_RunService_0:BindToRenderStep("forge_updateCameraShake", Enum.RenderPriority.Last.Value + 1, v16);
        return;
    end;
end;
v17.deinit = function() --[[ Line: 81 ]] --[[ Name: deinit ]]
    -- upvalues: v18 (ref), l_RunService_0 (copy)
    if v18 then
        v18:Disconnect();
        v18 = nil;
    end;
    l_RunService_0:UnbindFromRenderStep("forge_updateCameraShake");
end;
v17.emit = function(v20, v21) --[[ Line: 90 ]] --[[ Name: emit ]]
    -- upvalues: v2 (copy), v3 (copy), v1 (copy), l_RunService_0 (copy), v4 (ref), v19 (ref)
    local v22 = v2.getAttribute(v20, "EmitDelay", 0);
    local v23 = v2.getAttribute(v20, "EmitDuration", 0);
    local v24 = v2.getAttribute(v20, "Amplitude", 2.5);
    local v25 = v2.getAttribute(v20, "Frequency", 0.2);
    local v26 = v2.getAttribute(v20, "FadeInTime", 0.3);
    local v27 = v2.getAttribute(v20, "FadeOutTime", 2);
    local v28 = v2.getAttribute(v20, "SustainTime", 1);
    local v29 = v2.getAttribute(v20, "PositionInfluence", (Vector3.new(1, 1, 1, 0)));
    local v30 = v2.getAttribute(v20, "RotationInfluence", (Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224, 0)));
    local v31 = v2.getAttribute(v20, "Speed_Start", 1);
    local v32 = v2.getAttribute(v20, "Speed_End", 1);
    local v33 = v23 > 0;
    local v34 = v3.new();
    v34.Sustain = v33;
    v34.Amplitude = v24;
    v34.Frequency = v25;
    v34.FadeInTime = v26;
    v34.FadeOutTime = v27;
    v34.SustainTime = v28;
    v34.PositionInfluence = v29;
    v34.RotationInfluence = v30;
    local v35 = 1;
    local v36 = 0;
    v34.TimeFunction = function() --[[ Line: 123 ]]
        -- upvalues: v36 (ref)
        return v36;
    end;
    if v31 ~= v32 then
        speedTween = v1.fromParams(v2.getAttribute(v20, "Speed_Curve", v2.default_bezier), v2.getAttribute(v20, "Speed_Duration", 0.1), function(v37, v38) --[[ Line: 131 ]]
            -- upvalues: v35 (ref), v2 (ref), v31 (copy), v32 (copy)
            v35 = v2.lerp(v31, v32, v37);
            return v38;
        end);
        table.insert(v21, speedTween);
    end;
    table.insert(v21, l_RunService_0.RenderStepped:Connect(function(v39) --[[ Line: 142 ]]
        -- upvalues: v36 (ref), v35 (ref)
        v36 = v36 + v39 * v35;
    end));
    local v40 = {
        done = false, 
        pos = Vector3.new(0, 0, 0, 0), 
        rot = Vector3.new(0, 0, 0, 0)
    };
    task.wait(v22);
    table.insert(v4, v40);
    local v41 = coroutine.running();
    v34:BindToRenderStep(v3.NextRenderName(), v2.RENDER_PRIORITY + v21.depth, function(v42, v43, v44) --[[ Line: 159 ]]
        -- upvalues: v19 (ref), v20 (copy), v40 (copy), v41 (copy)
        local l_CurrentCamera_1 = workspace.CurrentCamera;
        v19 = l_CurrentCamera_1.CFrame;
        local v46 = v20:FindFirstAncestorOfClass("Attachment") or v20:FindFirstAncestorWhichIsA("BasePart");
        if v46 then
            local v47 = 1 - math.clamp((l_CurrentCamera_1.CFrame.Position - (v46:IsA("Attachment") and v46.WorldPosition or v46.Position)).Magnitude / 30, 0, 1);
            v42 = v42 * v47;
            v43 = v43 * v47;
        end;
        v40.pos = v42;
        v40.rot = v43;
        v40.done = v44;
        if v44 then
            v19 = nil;
            task.spawn(v41);
        end;
    end);
    v34:Start();
    if v33 then
        task.wait(v23);
        v34:StopSustain();
    end;
    if not v40.done then
        coroutine.yield();
    end;
end;
return v17;