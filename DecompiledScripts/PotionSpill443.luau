local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local v2 = {};
local function v7(v3, v4) --[[ Line: 7 ]] --[[ Name: toggleEffects ]]
    for _, v6 in ipairs(v3:GetChildren()) do
        if v6:IsA("Beam") or v6:IsA("ParticleEmitter") then
            v6.Enabled = v4;
        end;
    end;
end;
v2.start = function(_, v9) --[[ Line: 17 ]] --[[ Name: start ]]
    -- upvalues: v7 (copy), l_RunService_0 (copy), l_TweenService_0 (copy)
    local l_Character_0 = v9.Character;
    if l_Character_0 and not _G.checkRenderDistance(l_Character_0.PrimaryPart.Position) then
        return;
    else
        local l_Tool_0 = v9.Tool;
        local l_Duration_0 = v9.Duration;
        local l_Handle_0 = l_Tool_0.Handle;
        local l_Beams_0 = l_Handle_0.Beams;
        for _, v16 in ipairs(l_Beams_0:GetChildren()) do
            v16.Width0 = 0.4;
            v16.Width1 = 1;
        end;
        v7(l_Beams_0, true);
        local l_Bottom_0 = l_Handle_0.Bottom;
        local l_Top_0 = l_Handle_0.Top;
        l_Bottom_0.CFrame = l_Bottom_0:GetAttribute("OriginalCFrame");
        l_Top_0.CFrame = l_Top_0:GetAttribute("OriginalCFrame");
        local v19 = os.clock();
        local v20 = nil;
        v20 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 44 ]]
            -- upvalues: v19 (copy), l_Duration_0 (copy), l_Tool_0 (copy), v20 (ref), l_Beams_0 (copy), v7 (ref), l_Bottom_0 (copy), l_TweenService_0 (ref), l_Top_0 (copy), l_Handle_0 (copy)
            local v21 = os.clock() - v19;
            local _ = math.min(1, v21 / l_Duration_0);
            if l_Duration_0 - 0.5 <= v21 or not l_Tool_0:GetAttribute("Pouring") then
                v20:Disconnect();
                for _, v24 in l_Beams_0:GetChildren() do
                    _G.tween(v24, {
                        0.25, 
                        Enum.EasingStyle.Sine, 
                        Enum.EasingDirection.InOut
                    }, {
                        Width0 = 0, 
                        Width1 = 0
                    });
                end;
                v7(l_Bottom_0, false);
                l_TweenService_0:Create(l_Top_0, TweenInfo.new(0.5), {
                    WorldPosition = l_Bottom_0.WorldPosition
                }):Play();
                return;
            else
                local v25 = _G.getWavePosition(l_Handle_0.Position) + 0.1;
                local v26 = math.min(1, v21 / 0.5);
                l_Bottom_0.WorldCFrame = CFrame.new((CFrame.Angles(0, 1.5707963267948966, 0) + l_Top_0.WorldPosition - Vector3.new(0, 1, 0, 0) * (l_Top_0.WorldPosition.Y - v25) * v26 + Vector3.new(0, 1, 0, 0)).Position);
                if v26 == 1 then
                    v7(l_Bottom_0, true);
                    l_Bottom_0.WorldCFrame = CFrame.new(l_Bottom_0.WorldCFrame.X, v25, l_Bottom_0.WorldCFrame.Z);
                end;
                return;
            end;
        end);
        return;
    end;
end;
return v2;