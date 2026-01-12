local function v6(v0, v1, _) --[[ Line: 2 ]] --[[ Name: AlignCFrame ]]
    local l_p_0 = v0.p;
    local l_Unit_0 = v0.LookVector:Cross(v1).Unit;
    l_Unit_0 = (l_Unit_0.Magnitude > 0.001 and l_Unit_0 or v0.RightVector).Unit;
    local l_Unit_1 = l_Unit_0:Cross(v1).Unit.Unit;
    return CFrame.fromMatrix(l_p_0, l_Unit_0, v1, l_Unit_1);
end;
local v7 = 0;
local l_FootstepSounds_0 = game.ReplicatedStorage:WaitForChild("Assets"):WaitForChild("FootstepSounds");
local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_footstep_0 = l_ReplicatedStorage_0.Events.footstep;
local l_Effects_0 = workspace.Effects;
local l_Terrain_0 = workspace.Terrain;
local l_Air_0 = Enum.Material.Air;
_G.footstep = function(v16, _, v18, v19, v20) --[[ Line: 28 ]]
    -- upvalues: l_LocalPlayer_0 (copy), v7 (ref), l_Effects_0 (copy), l_Air_0 (copy), l_FootstepSounds_0 (copy), l_footstep_0 (copy), l_Terrain_0 (copy), v6 (copy)
    local l_Character_0 = l_LocalPlayer_0.Character;
    local v22 = v18 or l_Character_0;
    if not v22 then
        return;
    else
        local v23 = v22 == l_Character_0;
        if v23 and tick() - v7 <= 0.05 then
            return;
        elseif v22.Parent == l_Effects_0 and not v19 then
            return;
        else
            local l_Humanoid_0 = v22:FindFirstChild("Humanoid");
            local v25 = false;
            if v20 == nil then
                v25 = l_Humanoid_0 and l_Humanoid_0:IsA("Humanoid");
            end;
            local l_HumanoidRootPart_0 = v22:FindFirstChild("HumanoidRootPart");
            if not l_HumanoidRootPart_0 then
                return;
            else
                local v27 = nil;
                local v28 = nil;
                local v29 = nil;
                if v25 and l_Humanoid_0.FloorMaterial == l_Air_0 and v16 ~= "land" then
                    return;
                else
                    if v16 == "land" then
                        local v30, v31, v32 = _G.getRayFloor(CFrame.new(l_HumanoidRootPart_0.Position), 13);
                        v27 = v30;
                        v28 = v31;
                        v29 = v32;
                        if not v27 then
                            return;
                        end;
                    end;
                    local l_LeftFoot_0 = v22:FindFirstChild("LeftFoot");
                    local l_RightFoot_0 = v22:FindFirstChild("RightFoot");
                    if not l_LeftFoot_0 or not l_RightFoot_0 then
                        return;
                    else
                        local v35 = nil;
                        if v25 then
                            v35 = l_Humanoid_0.FloorMaterial;
                        elseif not v20 then
                            local v36, v37, v38 = _G.getRayFloor(CFrame.new(l_HumanoidRootPart_0.Position), 6);
                            v27 = v36;
                            v28 = v37;
                            v29 = v38;
                        else
                            v35 = v20;
                        end;
                        if v27 then
                            v35 = v27.Material;
                        end;
                        local v39 = string.sub(tostring(v35), 15);
                        v39 = string.gsub(v39, "%s+", "");
                        if v39 == "SmoothPlastic" or v39 == "Plastic" then
                            local v40, v41, v42 = _G.getRayFloor(CFrame.new(l_HumanoidRootPart_0.Position), 6);
                            v27 = v40;
                            v28 = v41;
                            v29 = v42;
                        end;
                        if v27 and v27.MaterialVariant and v27.MaterialVariant:match("Water") ~= nil then
                            v39 = "Water";
                        end;
                        if v27 and v27:GetAttribute("isWaterMaterial") then
                            v39 = "Water";
                        end;
                        local l_l_FootstepSounds_0_FirstChild_0 = l_FootstepSounds_0:FindFirstChild(v39);
                        if not l_l_FootstepSounds_0_FirstChild_0 then
                            return;
                        else
                            local l_SeaLevel_0 = _G.SeaLevel;
                            if l_SeaLevel_0 then
                                local v45 = l_SeaLevel_0 - 4;
                                local l_Y_0 = l_LeftFoot_0.Position.Y;
                                if (l_Y_0 <= l_SeaLevel_0 or l_RightFoot_0.Position.Y <= l_SeaLevel_0) and v45 < l_Y_0 then
                                    v39 = "Water";
                                    l_l_FootstepSounds_0_FirstChild_0 = l_FootstepSounds_0:FindFirstChild(v39);
                                end;
                            end;
                            local l_PrimaryPart_0 = v22.PrimaryPart;
                            if v16 == "land" then
                                if v23 then
                                    l_footstep_0:FireServer("land");
                                end;
                                local l_Falls_0 = l_l_FootstepSounds_0_FirstChild_0:FindFirstChild("Falls");
                                if l_Falls_0 then
                                    local l_l_Falls_0_Children_0 = l_Falls_0:GetChildren();
                                    _G.PlaySound(l_PrimaryPart_0, l_l_Falls_0_Children_0[math.random(1, #l_l_Falls_0_Children_0)], {
                                        Pitch = math.random(90, 110) / 100
                                    }).Parent = l_PrimaryPart_0;
                                    return;
                                else
                                    _G.PlaySound(l_PrimaryPart_0, l_l_FootstepSounds_0_FirstChild_0:FindFirstChildWhichIsA("Sound"), {
                                        Pitch = math.random(90, 110) / 100
                                    }).Parent = l_PrimaryPart_0;
                                    return;
                                end;
                            else
                                local l_Children_0 = l_l_FootstepSounds_0_FirstChild_0.Steps:GetChildren();
                                local v51 = l_Children_0[math.random(1, #l_Children_0)]:Clone();
                                local v52 = 16;
                                if v25 then
                                    v52 = l_Humanoid_0.WalkSpeed;
                                else
                                    local l_v22_Attribute_0 = v22:GetAttribute("WalkSpeed");
                                    if l_v22_Attribute_0 then
                                        v52 = l_v22_Attribute_0;
                                    end;
                                end;
                                if v18 and not l_PrimaryPart_0.Anchored then
                                    v52 = l_PrimaryPart_0.Velocity.Magnitude;
                                end;
                                v51.Pitch = v51.Pitch / (16 / (v52 / 4 + 10));
                                v51.Volume = 0.2;
                                v51.RollOffMaxDistance = 300;
                                local l_Attachment_0 = Instance.new("Attachment");
                                if v23 then
                                    v51.Volume = 0.095;
                                    l_Attachment_0.Parent = l_PrimaryPart_0;
                                else
                                    l_Attachment_0.WorldCFrame = l_PrimaryPart_0.CFrame;
                                    v51.RollOffMinDistance = 25;
                                    v51.Volume = 0.1;
                                    l_Attachment_0.Parent = l_Terrain_0;
                                end;
                                v51.Parent = l_Attachment_0;
                                v51:Play();
                                _G.destroy(l_Attachment_0, 3);
                                if v23 then
                                    v7 = tick();
                                end;
                                local l_l_RightFoot_0_0 = l_RightFoot_0;
                                if v16 == "step1" then
                                    l_l_RightFoot_0_0 = l_LeftFoot_0;
                                end;
                                if v39 == "Sand" then
                                    local v56 = Ray.new(l_l_RightFoot_0_0.Position, (Vector3.new(0, -3, 0, 0)));
                                    local v57, v58, v59 = _G.raycastWhitelist(v56, {
                                        workspace.Islands, 
                                        workspace.Env, 
                                        workspace.Ships
                                    });
                                    if v57 then
                                        local v60 = script.FootStep:Clone();
                                        v60.CFrame = v6(CFrame.new(Vector3.new(), l_l_RightFoot_0_0.CFrame.LookVector) + v58, v59);
                                        v60.Color = v57.Color;
                                        v60.Attachment.sm2.Color = ColorSequence.new(v57.Color);
                                        v60.Parent = l_Effects_0;
                                        _G.customEmit(v60);
                                        _G.destroy(v60, 2);
                                    end;
                                elseif v39 == "Water" then
                                    local v61 = script.waterSplash:Clone();
                                    v61.CFrame = CFrame.new(l_l_RightFoot_0_0.Position);
                                    if v27 then
                                        _G.recolorParticles(v61, v27.Color);
                                    end;
                                    v61.Parent = l_Effects_0;
                                    _G.customEmit(v61);
                                    _G.destroy(v61, 2);
                                end;
                                if v23 then
                                    l_footstep_0:FireServer();
                                end;
                                return;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;