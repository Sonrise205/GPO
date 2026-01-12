local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local _ = workspace.Env.WaterStuff.Falls.Position.Y - 1;
local v3 = {};
local function v8(v4, v5) --[[ Line: 9 ]] --[[ Name: enable ]]
    for _, v7 in v4:GetChildren() do
        if v7:IsA("Beam") or v7:IsA("ParticleEmitter") then
            v7.Enabled = v5;
        end;
    end;
end;
v3.start = function(_, _, v11) --[[ Line: 20 ]] --[[ Name: start ]]
    -- upvalues: v8 (copy), l_RunService_0 (copy), l_TweenService_0 (copy)
    local l_Character_0 = v11.Character;
    if l_Character_0 and _G.checkRenderDistance(l_Character_0.PrimaryPart.Position) == false then
        return;
    else
        local l_Duration_0 = v11.Duration;
        local l_Potion_0 = v11.Potion;
        local l_Color_0 = v11.Color;
        local l_Bottom_0 = l_Potion_0.Handle.Bottom;
        local l_Top_0 = l_Potion_0.Handle.Top;
        if l_Color_0 then
            for _, v19 in l_Potion_0.Handle.Beams:GetChildren() do
                v19.Color = l_Color_0;
            end;
        end;
        v8(l_Potion_0.Handle.Beams, true);
        local v20 = false;
        local v21 = os.clock();
        local v22 = nil;
        _G.tween(l_Potion_0.Part.Mesh, {
            l_Duration_0, 
            Enum.EasingStyle.Sine, 
            Enum.EasingDirection.InOut, 
            0, 
            false, 
            0
        }, {
            Scale = Vector3.new(1, 0, 1, 0), 
            Offset = Vector3.new(0, 0.6050000190734863, 0, 0)
        });
        _G.destroy(l_Potion_0.Part, 5);
        l_Potion_0.Part.Parent = workspace.Effects;
        l_Bottom_0.Parent = workspace.Terrain;
        v22 = l_RunService_0.Heartbeat:Connect(function(_) --[[ Line: 49 ]]
            -- upvalues: l_Potion_0 (copy), v22 (ref), v21 (copy), l_Duration_0 (copy), l_Character_0 (copy), v8 (ref), l_Bottom_0 (copy), l_TweenService_0 (ref), l_Top_0 (copy), v20 (ref)
            if not l_Potion_0:FindFirstChild("Handle") then
                v22:Disconnect();
                v22 = nil;
                return;
            else
                local l_Position_0 = l_Potion_0.Handle.Position;
                if os.clock() - v21 >= l_Duration_0 - 0.5 or l_Potion_0.Parent ~= l_Character_0 then
                    v22:Disconnect();
                    v22 = nil;
                    local l_Children_0 = l_Potion_0.Handle.Beams:GetChildren();
                    for v26 = 1, #l_Children_0 do
                        _G.tween(l_Children_0[v26], {
                            0.25, 
                            Enum.EasingStyle.Sine, 
                            Enum.EasingDirection.InOut, 
                            0, 
                            false, 
                            0
                        }, {
                            Width0 = 0, 
                            Width1 = 0
                        });
                    end;
                    v8(l_Bottom_0, false);
                    l_TweenService_0:Create(l_Top_0, TweenInfo.new(0.5), {
                        WorldPosition = l_Bottom_0.WorldPosition
                    }):Play();
                    _G.destroy(l_Bottom_0, 3);
                    return;
                else
                    local v27 = _G.getWavePosition(l_Position_0);
                    if l_Position_0.Y < v27 then
                        local _, v29, _ = _G.getRayFloor(CFrame.new(l_Position_0), 100);
                        v27 = v29.Y;
                    end;
                    local v31 = math.min((os.clock() - v21) / 0.5, 1);
                    l_Bottom_0.WorldCFrame = CFrame.new((CFrame.Angles(0, 1.5707963267948966, 0) + l_Top_0.WorldPosition - Vector3.new(0, 1, 0, 0) * (l_Top_0.WorldPosition.Y - v27) * v31 + Vector3.new(0, 1, 0, 0)).Position);
                    if v31 == 1 then
                        v20 = true;
                        v8(l_Bottom_0, true);
                        l_Bottom_0.WorldCFrame = CFrame.new(l_Bottom_0.WorldCFrame.X, v27, l_Bottom_0.WorldCFrame.Z);
                    end;
                    return;
                end;
            end;
        end);
        return;
    end;
end;
return v3;