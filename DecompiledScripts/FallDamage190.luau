local l_Players_0 = game:GetService("Players");
local l_CollectionService_0 = game:GetService("CollectionService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local v4 = false;
local _ = l_ReplicatedStorage_0:WaitForChild("Events"):WaitForChild("FallDmg");
if not l_Players_0.LocalPlayer then
    l_Players_0.PlayerAdded:Wait();
end;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v7 = l_LocalPlayer_0.Character or l_LocalPlayer_0.CharacterAdded:Wait();
local v8 = v7:WaitForChild("Humanoid", 10);
if not v8 or v8.Health <= 0 then
    return;
else
    local _ = v8:WaitForChild("Animator", 10) or v8;
    local v10 = v7:WaitForChild("HumanoidRootPart", 10);
    if not v10 then
        return;
    elseif game.ReplicatedStorage:FindFirstChild("tradingHUB") then
        return;
    else
        local _ = Random.new();
        local v12 = 0;
        local v13 = 0;
        local l_Jumping_0 = Enum.HumanoidStateType.Jumping;
        local l_Landed_0 = Enum.HumanoidStateType.Landed;
        local l_Freefall_0 = Enum.HumanoidStateType.Freefall;
        local _ = l_ReplicatedStorage_0:WaitForChild("LandAnimation");
        local l_Sound_0 = Instance.new("Sound");
        l_Sound_0.SoundId = "rbxassetid://147397876";
        l_Sound_0.Name = "HurtSoundDamage";
        l_Sound_0.Parent = v10;
        local l_Sound_1 = Instance.new("Sound");
        l_Sound_1.SoundId = "rbxassetid://1161221108";
        l_Sound_1.Name = "LandingSFX";
        l_Sound_1.Volume = 0.25;
        l_Sound_1.Parent = v10;
        local v20 = RaycastParams.new();
        v20.FilterType = Enum.RaycastFilterType.Include;
        v20.RespectCanCollide = true;
        v20.IgnoreWater = false;
        v20.FilterDescendantsInstances = {
            workspace:WaitForChild("Env"), 
            workspace:WaitForChild("Islands"), 
            workspace:WaitForChild("Ships")
        };
        local v21 = 0;
        local function v33(v22, _) --[[ Line: 58 ]] --[[ Name: StateChange ]]
            -- upvalues: v4 (ref), v10 (copy), v21 (ref), v7 (copy), l_CollectionService_0 (copy), v8 (copy)
            if v22 and not v4 then
                local l_v10_FirstAncestorWhichIsA_0 = v10:FindFirstAncestorWhichIsA("AlignPosition");
                if l_v10_FirstAncestorWhichIsA_0 and l_v10_FirstAncestorWhichIsA_0.Enabled then
                    return;
                elseif v10:FindFirstChild("geppo") then
                    return;
                elseif _G.canuse == false then
                    return;
                else
                    v4 = true;
                    local l_Y_0 = v10.Position.Y;
                    local v26 = tick();
                    local function v29() --[[ Line: 76 ]] --[[ Name: validFall ]]
                        -- upvalues: v10 (ref), v21 (ref), v7 (ref), l_CollectionService_0 (ref), v8 (ref)
                        local v27 = true;
                        local l_v10_FirstAncestorWhichIsA_1 = v10:FindFirstAncestorWhichIsA("AlignPosition");
                        if l_v10_FirstAncestorWhichIsA_1 and l_v10_FirstAncestorWhichIsA_1.Enabled == true then
                            v27 = false;
                        end;
                        if v10:FindFirstChild("geppo") then
                            v27 = false;
                            v21 = tick();
                        end;
                        if v7.LowerTorso:FindFirstChild("geppo") then
                            v27 = false;
                            v21 = tick();
                        end;
                        if v7:FindFirstChild("SafeFF") then
                            v27 = false;
                        end;
                        if l_CollectionService_0:HasTag(v7, "AirBypass") then
                            v27 = false;
                            v21 = tick();
                        end;
                        if _G.swimming then
                            v27 = false;
                        end;
                        if v8.SeatPart then
                            v27 = false;
                        end;
                        if v7:GetAttribute("FlyBypass") ~= nil then
                            v27 = false;
                            v21 = tick();
                        end;
                        if v8.SeatPart ~= nil then
                            v27 = false;
                        end;
                        if tick() - v21 < 3 then
                            v27 = false;
                        end;
                        return v27;
                    end;
                    while v4 == true do
                        local l_Y_1 = v10.Position.Y;
                        if l_Y_0 < l_Y_1 then
                            l_Y_0 = l_Y_1;
                            v26 = tick();
                        end;
                        if v29() ~= false then
                            task.wait();
                        else
                            break;
                        end;
                    end;
                    local l_v10_FirstAncestorWhichIsA_2 = v10:FindFirstAncestorWhichIsA("AlignPosition");
                    if v29() == true then
                        if l_v10_FirstAncestorWhichIsA_2 and l_v10_FirstAncestorWhichIsA_2.Enabled then
                            return;
                        else
                            local v32 = math.abs(v10.Position.Y - l_Y_0) / 1.5;
                            if v10:FindFirstChild("rolling") then
                                v32 = v32 / 2;
                                return;
                            end;
                        end;
                    end;
                end;
            elseif not v22 then
                v4 = false;
            end;
        end;
        v8.StateChanged:Connect(function(_, v35) --[[ Line: 153 ]]
            -- upvalues: l_Landed_0 (copy), v12 (ref), v13 (ref), v10 (copy), v8 (copy), l_Jumping_0 (copy), l_Freefall_0 (copy)
            if v35 == l_Landed_0 and tick() - v12 >= 1 and v13 - v10.Position.Y >= 10 then
                local v36 = false;
                if v8:GetStateEnabled(l_Jumping_0) then
                    v36 = true;
                    v8:SetStateEnabled(l_Jumping_0, false);
                end;
                v12 = tick();
                task.wait(0.5);
                if v36 then
                    v8:SetStateEnabled(l_Jumping_0, true);
                    return;
                end;
            elseif v35 == l_Freefall_0 then
                v13 = v10.Position.Y;
            end;
        end);
        while v8.Health > 0 and v7.Parent do
            local v37 = CFrame.new(v10.Position).UpVector * -(v8.HipHeight * 2);
            local v38 = workspace:Raycast(v10.Position, v37, v20);
            if (not v38 or v38 and not v38.Instance) and not v10.Anchored then
                task.spawn(v33, true);
                repeat
                    task.wait();
                    local v39 = CFrame.new(v10.Position).UpVector * -(v8.HipHeight * 2);
                    local v40 = workspace:Raycast(v10.Position, v39, v20);
                until v40 and v40.Instance and v40.Instance.CanCollide or v10.Anchored;
                v4 = false;
            end;
            l_RunService_0.Stepped:Wait();
        end;
        return;
    end;
end;