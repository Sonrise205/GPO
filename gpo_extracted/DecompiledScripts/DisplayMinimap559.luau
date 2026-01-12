local v0 = {};
local v1 = {
    SeasonsOrg = {
        Center = Vector2.new(-4393.885, -7016.61), 
        ImageID = "rbxassetid://13787016890", 
        Resolution = {
            11001, 
            11001
        }
    }, 
    SeasonsHollow = {
        Center = Vector2.new(-4393.885, -7016.61), 
        ImageID = "rbxassetid://13787016890", 
        Resolution = {
            11001, 
            11001
        }
    }, 
    SeasonsWinter2023 = {
        Center = Vector2.new(-4073.159, -6883.714), 
        ImageID = "rbxassetid://112804128877322", 
        Resolution = {
            11000, 
            11000
        }
    }, 
    ["Winter Wonderland"] = {
        Center = Vector2.new(753.633, 5392.918), 
        ImageID = "rbxassetid://11903004814", 
        Resolution = {
            11001, 
            11001
        }
    }, 
    ["Grassy Planes"] = {
        Center = Vector2.new(-4440.4345703125, -7302.380859375), 
        ImageID = "rbxassetid://11230987489", 
        Resolution = {
            11001, 
            11001
        }
    }, 
    ["Four Seasons"] = {
        Center = Vector2.new(-4031.985, -6658.461), 
        ImageID = "rbxassetid://18446323822", 
        Resolution = {
            12856.2, 
            12856.2
        }
    }, 
    ["Four SeasonsHallow"] = {
        Center = Vector2.new(-4031.985, -6658.461), 
        ImageID = "rbxassetid://18446323822", 
        Resolution = {
            12856.2, 
            12856.2
        }
    }, 
    ["Icy Bastion"] = {
        Center = Vector2.new(-3942.18, -6986.803), 
        ImageID = "rbxassetid://137321229185572", 
        Resolution = {
            10362.968, 
            10362.968
        }, 
        HasTrain = true
    }, 
    ["Four SeasonsWinter"] = {
        Center = Vector2.new(-4031.985, -6658.461), 
        ImageID = "rbxassetid://92103528259255", 
        Resolution = {
            12856.2, 
            12856.2
        }, 
        HasTrain = true
    }, 
    Spring2025Map = {
        Center = Vector2.new(-4031.985, -6658.46), 
        ImageID = "rbxassetid://115023830732486", 
        Resolution = {
            13070.802, 
            13070.802
        }, 
        HasTrain = true
    }, 
    ["Founding Archipelago"] = {
        Center = Vector2.new(-4031.985, -6658.46), 
        ImageID = "rbxassetid://112457455677193", 
        Resolution = {
            12856.2, 
            12856.2
        }
    }, 
    FirstSeaBRMap = {
        Center = Vector2.new(-3734.453, -7205.174), 
        ImageID = "rbxassetid://103940818429433", 
        Resolution = {
            14000, 
            14000
        }
    }, 
    DBZMap = {
        Center = Vector2.new(-4142.077, -6903.197), 
        ImageID = "rbxassetid://132731077216738", 
        Resolution = {
            11000, 
            11000
        }
    }
};
v0.Display = function(_, v3) --[[ Line: 77 ]] --[[ Name: Display ]]
    -- upvalues: v1 (copy)
    if not v1[v3] then
        warn("cant find map ", v3);
        return;
    else
        local v4 = v1[v3];
        local l_Minimap_0 = script.Minimap;
        l_Minimap_0.GuiElements.Map.Image = v4.ImageID;
        l_Minimap_0.LocalScript:SetAttribute("Center", v4.Center);
        l_Minimap_0.LocalScript:SetAttribute("Resolution", game:GetService("HttpService"):JSONEncode(v4.Resolution));
        l_Minimap_0.LocalScript:SetAttribute("MapName", v3);
        l_Minimap_0:SetAttribute("Resolution", game:GetService("HttpService"):JSONEncode(v4.Resolution));
        _G.stormResolution = v4.Resolution;
        l_Minimap_0.LocalScript.Disabled = false;
        if v4.HasTrain == true then
            task.spawn(function() --[[ Line: 94 ]]
                local l_new_0 = Ray.new;
                local l_RunService_0 = game:GetService("RunService");
                local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
                local _ = l_LocalPlayer_0.Character;
                local v10 = nil;
                local v11 = nil;
                local _ = l_RunService_0.Heartbeat:Connect(function(_, _) --[[ Line: 103 ]]
                    -- upvalues: l_LocalPlayer_0 (copy), l_new_0 (copy), v11 (ref), v10 (ref)
                    local l_Character_1 = l_LocalPlayer_0.Character;
                    if l_Character_1 == nil then
                        return;
                    else
                        local l_PrimaryPart_0 = l_Character_1.PrimaryPart;
                        if l_PrimaryPart_0 then
                            local v16 = l_new_0(l_PrimaryPart_0.CFrame.p, (Vector3.new(0, -25, 0, 0)));
                            local l_workspace_PartOnRayWithWhitelist_0 = workspace:FindPartOnRayWithWhitelist(v16, {
                                workspace.Ships
                            });
                            if l_workspace_PartOnRayWithWhitelist_0 then
                                if not v11 then
                                    v11 = l_workspace_PartOnRayWithWhitelist_0;
                                end;
                                if l_workspace_PartOnRayWithWhitelist_0 == v11 then
                                    if not v10 then
                                        v10 = l_workspace_PartOnRayWithWhitelist_0.CFrame;
                                    end;
                                else
                                    v10 = l_workspace_PartOnRayWithWhitelist_0.CFrame;
                                end;
                                local v18 = l_workspace_PartOnRayWithWhitelist_0.CFrame * v10:inverse();
                                v10 = l_workspace_PartOnRayWithWhitelist_0.CFrame;
                                if l_Character_1.Humanoid.Sit == false then
                                    l_workspace_PartOnRayWithWhitelist_0.AssemblyLinearVelocity = Vector3.new();
                                    l_workspace_PartOnRayWithWhitelist_0.AssemblyAngularVelocity = Vector3.new();
                                    l_PrimaryPart_0.CFrame = v18 * l_PrimaryPart_0.CFrame;
                                end;
                                v11 = l_workspace_PartOnRayWithWhitelist_0;
                                return;
                            else
                                v10 = nil;
                            end;
                        end;
                        return;
                    end;
                end);
            end);
        end;
        return;
    end;
end;
v0.MapData = v1;
return v0;