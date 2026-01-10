local v0 = {};
local _ = game:GetService("PhysicsService");
v0.start = function(_, v3) --[[ Line: 5 ]] --[[ Name: start ]]
    local l_char_0 = v3.char;
    if l_char_0 == nil then
        return;
    elseif l_char_0.PrimaryPart == nil then
        return;
    elseif _G.checkRenderDistance(l_char_0.HumanoidRootPart.CFrame.p) == false then
        return;
    else
        local v5 = {};
        local function v19(v6, v7) --[[ Line: 17 ]] --[[ Name: trans ]]
            -- upvalues: l_char_0 (copy), v5 (ref)
            local v8 = nil;
            v8 = v6 ~= 1;
            local l_l_char_0_Descendants_0 = l_char_0:GetDescendants();
            if #v5 == 0 then
                for v10 = 1, #l_l_char_0_Descendants_0 do
                    if (l_l_char_0_Descendants_0[v10]:IsA("BasePart") or l_l_char_0_Descendants_0[v10]:IsA("Decal")) and l_l_char_0_Descendants_0[v10].Transparency ~= v6 then
                        table.insert(v5, l_l_char_0_Descendants_0[v10]);
                        if v7 == true and l_l_char_0_Descendants_0[v10]:IsA("BasePart") then
                            local v11 = l_l_char_0_Descendants_0[v10]:Clone();
                            v11:BreakJoints();
                            v11.Anchored = true;
                            v11.CanCollide = false;
                            v11.Material = Enum.Material.Glass;
                            _G.setCollisionGroup(v11, "noclip");
                            local l_v11_Descendants_0 = v11:GetDescendants();
                            for v13 = 1, #l_v11_Descendants_0 do
                                local v14 = l_v11_Descendants_0[v13];
                                if v14:IsA("Script") or v14:IsA("LocalScript") or v14:IsA("Weld") or v14:IsA("Motor6D") or v14:IsA("Beam") then
                                    v14:Destroy();
                                end;
                            end;
                            v11.Parent = workspace.Effects;
                            local v15 = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0);
                            local v16 = {
                                Transparency = 1
                            };
                            game:GetService("TweenService"):Create(v11, v15, v16):Play();
                            _G.destroy(v11, 0.25);
                        end;
                        l_l_char_0_Descendants_0[v10].Transparency = v6;
                    elseif l_l_char_0_Descendants_0[v10]:IsA("BillboardGui") and l_l_char_0_Descendants_0[v10].Enabled ~= v8 then
                        table.insert(v5, l_l_char_0_Descendants_0[v10]);
                        l_l_char_0_Descendants_0[v10].Enabled = v8;
                    end;
                end;
                return;
            else
                for v17 = 1, #v5 do
                    local v18 = v5[v17];
                    if v18:IsA("BillboardGui") == false and v18.Transparency ~= v6 then
                        v18.Transparency = v6;
                    elseif v18:IsA("BillboardGui") and v18.Enabled ~= v8 then
                        v18.Enabled = v8;
                    end;
                end;
                v5 = {};
                return;
            end;
        end;
        local v20 = script.sorun:Clone();
        v20.CFrame = l_char_0.HumanoidRootPart.CFrame;
        v20.Parent = workspace.Effects;
        v20.ParticleEmitter:Emit(20);
        local _ = l_char_0.HumanoidRootPart;
        if game.Players.LocalPlayer.PlayerGui.HealthBars:FindFirstChild(l_char_0.Name) then
            game.Players.LocalPlayer.PlayerGui.HealthBars:FindFirstChild(l_char_0.Name).Enabled = false;
        end;
        _G.destroy(v20, 0.5);
        v19(1, true);
        return function() --[[ Line: 87 ]]
            -- upvalues: l_char_0 (copy), v19 (copy)
            if game.Players.LocalPlayer.PlayerGui.HealthBars:FindFirstChild(l_char_0.Name) then
                game.Players.LocalPlayer.PlayerGui.HealthBars:FindFirstChild(l_char_0.Name).Enabled = true;
            end;
            v19(0);
        end;
    end;
end;
return v0;