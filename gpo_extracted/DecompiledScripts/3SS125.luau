local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v3 = require(game.ReplicatedStorage.Modules.Skills);
local v4 = require(script.Parent.Parent.MobileBase);
local l_PlayerModule_0 = require(l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule"));
local _ = l_LocalPlayer_0:GetMouse();
local _ = l_PlayerModule_0:GetControls();
local v8 = require(game.ReplicatedStorage.Modules.SwordHandle.SwordInfo);
local v9 = setmetatable({}, v4);
v9.__index = v9;
v9.new = function(_) --[[ Line: 21 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v9 (copy), l_LocalPlayer_0 (copy), v3 (copy), v8 (copy)
    local v11 = setmetatable(v4.new(script.Name), v9);
    local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
    v11.getTools = function() --[[ Line: 26 ]]
        -- upvalues: l_LocalPlayer_0 (ref)
        local v13 = nil;
        local l_Children_0 = l_LocalPlayer_0.Backpack:GetChildren();
        for v15 = 1, #l_Children_0 do
            if l_Children_0[v15]:IsA("Tool") and l_Children_0[v15]:FindFirstChild("SwordEquip") and l_Children_0[v15].Name ~= "3SS" then
                return l_Children_0[v15].Name;
            end;
        end;
        return v13;
    end;
    local v16 = 0;
    local v17 = {};
    local v18 = v3.GetM("Billion-Fold World");
    v11.excuteVFX = {};
    v11.HeartbeatConnection = game["Run Service"].Heartbeat:Connect(function() --[[ Line: 56 ]]
        -- upvalues: v16 (ref), l_LocalPlayer_0 (ref), v18 (copy), l_FirstChild_0 (copy), v17 (copy), v11 (copy)
        if tick() - v16 >= 0.1 then
            v16 = tick();
            local v19 = {};
            local l_Attribute_0 = l_LocalPlayer_0.Character:GetAttribute("3SSExcuteDMG");
            if _G.MeetReq(v18, nil, true) == true and l_Attribute_0 then
                local v21 = _G.getTargets(l_LocalPlayer_0.Character);
                local v22 = math.clamp(l_FirstChild_0.Stats.SwordMastery.Value / 100 / 100, 0, 0.1) + 0.02;
                for v23 = 1, #v21 do
                    local l_Parent_0 = v21[v23].Parent;
                    if l_Parent_0 ~= nil and l_Parent_0.Parent ~= nil and l_Parent_0.Parent:IsA("Model") ~= false and l_Parent_0.Parent ~= workspace.NPCs and l_Parent_0.Parent ~= workspace.Ragdolls and l_Parent_0:IsA("Model") ~= false and l_Parent_0.PrimaryPart ~= nil and (l_Parent_0.PrimaryPart.Position - workspace.CurrentCamera.CFrame.Position).Magnitude <= 600 then
                        local l_Humanoid_0 = l_Parent_0:FindFirstChild("Humanoid");
                        if l_Humanoid_0 and (l_Humanoid_0.Health - l_Attribute_0) / l_Humanoid_0.MaxHealth <= v22 then
                            if v17[l_Parent_0] then
                                v19[l_Parent_0] = true;
                            else
                                local v26 = script.excuVFX.vfx:Clone();
                                v26.Parent = l_Parent_0.UpperTorso;
                                table.insert(v11.excuteVFX, v26);
                                v17[l_Parent_0] = v26;
                                v19[l_Parent_0] = true;
                            end;
                        end;
                    end;
                end;
            end;
            for v27, v28 in pairs(v17) do
                if v19[v27] == nil then
                    _G.PlayEffect("TweenParticles", nil, v28, NumberSequence.new(0), 0.25);
                    _G.particleEnabled(v28, false);
                    _G.destroy(v28, 3);
                    v17[v27] = nil;
                    for v29 = 1, #v11.excuteVFX do
                        if v11.excuteVFX[v29] == v28 then
                            table.remove(v11.excuteVFX, v29);
                        end;
                    end;
                end;
            end;
        end;
    end);
    local v30 = {};
    local v31 = v8[script.Name];
    v31 = if v31 == nil then v8.Katana.keys else v31.keys;
    for v32 = 1, #v31 do
        v30[v31[v32][1]] = false;
    end;
    v11.Cooldowns = v30;
    return v11;
end;
v9.TigerHunt = function(v33, _) --[[ Line: 143 ]] --[[ Name: TigerHunt ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v33.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0["Tiger Hunt"] == false and _G.check:inspect(l_Character_0) == true then
        local v38 = v3.GetM("Tiger Hunt");
        local l_cd_0 = v38.cd;
        if _G.StamCheck("Tiger Hunt") == false then
            return;
        elseif v38.statreq and _G.MeetReq(v38.statreq) == false then
            return;
        else
            l_Cooldowns_0["Tiger Hunt"] = true;
            _G.canuse = false;
            local v40 = game.ReplicatedStorage.Events.Skill:InvokeServer("Tiger Hunt");
            local v41 = l_Character_0.Humanoid:LoadAnimation(script.tigerHunt);
            v41:Play();
            v41:AdjustWeight(2);
            v41:AdjustSpeed(1.25);
            l_Character_0.Humanoid.WalkSpeed = 6;
            local v42 = _G.castingSkill(l_Character_0, 0.6264000000000001, true);
            if v40 and v42 == true then
                v40:InvokeServer(l_Character_0.PrimaryPart.CFrame);
            elseif v40 then
                v40:InvokeServer(nil);
            end;
            v41:Stop();
            l_Character_0.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Tiger Hunt", l_cd_0);
            require(script.Parent.SwordStyleSwapping):matchCooldowns(l_Cooldowns_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0["Tiger Hunt"] = false;
        end;
    end;
end;
v9.Onigiri = function(v43, v44) --[[ Line: 190 ]] --[[ Name: Onigiri ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v43.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.Onigiri == false and _G.check:inspect(l_Character_1) == true then
        local v48 = v3.GetM("Onigiri");
        local l_cd_1 = v48.cd;
        if _G.StamCheck("Onigiri") == false then
            return;
        elseif v48.statreq and _G.MeetReq(v48.statreq) == false then
            return;
        else
            l_Cooldowns_1.Onigiri = true;
            _G.canuse = false;
            _G.FaceMouse = true;
            local v50 = game.ReplicatedStorage.Events.Skill:InvokeServer("Onigiri", l_Character_1.PrimaryPart.CFrame);
            local v51 = l_Character_1.Humanoid:LoadAnimation(script.onigiri);
            v51:Play();
            v51:AdjustWeight(2);
            local v52 = tick();
            v43:ChargeSkill(v44, {
                Key = Enum.KeyCode.R, 
                EndFunction = function() --[[ Line: 219 ]] --[[ Name: endFunction ]]
                    -- upvalues: v43 (copy), l_Character_1 (copy), v52 (copy), v50 (copy)
                    if v43.Tool.Parent ~= l_Character_1 or tick() - v52 >= 0.5 or v50 == nil then
                        return true;
                    else
                        return;
                    end;
                end, 
                HoldDuration = 0.5
            });
            l_Character_1.PrimaryPart.Anchored = true;
            _G.FaceMouse = false;
            l_Character_1.Humanoid.AutoRotate = false;
            v51:AdjustSpeed(0);
            v51.TimePosition = 0.5;
            if v50 then
                v50:InvokeServer(l_Character_1.PrimaryPart.CFrame);
            end;
            v51:AdjustSpeed(1);
            task.wait(0.75);
            l_Character_1.PrimaryPart.Anchored = false;
            l_Character_1.Humanoid.AutoRotate = true;
            l_Character_1.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Onigiri", l_cd_1);
            require(script.Parent.SwordStyleSwapping):matchCooldowns(l_Cooldowns_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1.Onigiri = false;
        end;
    end;
end;
v9["1080PoundPhoenix"] = function(v53, v54) --[[ Line: 257 ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_2 = v53.Cooldowns;
    local l_Character_2 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_2["1080 Pound Phoenix"] == false and _G.check:inspect(l_Character_2) == true then
        local v58 = v3.GetM("1080 Pound Phoenix");
        local l_cd_2 = v58.cd;
        if _G.StamCheck("1080 Pound Phoenix") == false then
            return;
        elseif v58.statreq and _G.MeetReq(v58.statreq) == false then
            return;
        else
            l_Cooldowns_2["1080 Pound Phoenix"] = true;
            _G.canuse = false;
            _G.FaceMouse = true;
            local v60 = game.ReplicatedStorage.Events.Skill:InvokeServer("1080 Pound Phoenix");
            local v61 = l_Character_2.Humanoid:LoadAnimation(script.poundPhoenix);
            v61:Play();
            v61:AdjustWeight(2);
            _G.PauseAnim(v61, 0.517, 1.75);
            local v62 = tick();
            v53:ChargeSkill(v54, {
                Key = Enum.KeyCode.E, 
                EndFunction = function() --[[ Line: 287 ]] --[[ Name: endFunction ]]
                    -- upvalues: v53 (copy), l_Character_2 (copy), v62 (copy), v60 (copy)
                    if v53.Tool.Parent ~= l_Character_2 or tick() - v62 >= 3 or v60 == nil or _G.check:inspect(l_Character_2) == false then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v61:AdjustSpeed(1.75);
            l_Character_2.PrimaryPart.Anchored = true;
            _G.FaceMouse = false;
            l_Character_2.Humanoid.AutoRotate = false;
            task.wait(0.104);
            if v60 then
                v60:InvokeServer(l_Character_2.PrimaryPart.CFrame);
            end;
            v61:Stop();
            l_Character_2.PrimaryPart.Anchored = false;
            l_Character_2.Humanoid.AutoRotate = true;
            l_Character_2.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("1080 Pound Phoenix", l_cd_2);
            require(script.Parent.SwordStyleSwapping):matchCooldowns(l_Cooldowns_2);
            _G.fw(l_cd_2);
            l_Cooldowns_2["1080 Pound Phoenix"] = false;
        end;
    end;
end;
v9.DragonTwister = function(v63, v64) --[[ Line: 319 ]] --[[ Name: DragonTwister ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_3 = v63.Cooldowns;
    local l_Character_3 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_3["Dragon Twister"] == false and _G.check:inspect(l_Character_3) == true then
        local v68 = v3.GetM("Dragon Twister");
        local l_cd_3 = v68.cd;
        if _G.StamCheck("Dragon Twister") == false then
            return;
        elseif v68.statreq and _G.MeetReq(v68.statreq) == false then
            return;
        else
            l_Cooldowns_3["Dragon Twister"] = true;
            require(script.Parent.SwordStyleSwapping):matchCooldowns(l_Cooldowns_3);
            _G.canuse = false;
            l_Character_3.Humanoid.WalkSpeed = 4;
            local v70 = game.ReplicatedStorage.Events.Skill:InvokeServer("Dragon Twister");
            local v71 = l_Character_3.Humanoid:LoadAnimation(script.twisterStartup);
            v71:Play();
            v71:AdjustWeight(2);
            v71:AdjustSpeed(1.5);
            task.wait(0.7446666666666667);
            local v72 = l_Character_3.Humanoid:LoadAnimation(script.twisterLoop);
            v72:Play();
            v72:AdjustWeight(2);
            local v73 = tick();
            v63:ChargeSkill(v64, {
                Key = Enum.KeyCode.T, 
                EndFunction = function() --[[ Line: 356 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_3 (copy), v63 (copy), v73 (copy), v70 (copy)
                    l_Character_3.Humanoid.WalkSpeed = 35;
                    if v63.Tool.Parent ~= l_Character_3 or tick() - v73 >= 3 or v70 == nil or _G.check:inspect(l_Character_3) == false then
                        return true;
                    else
                        return;
                    end;
                end, 
                HoldDuration = 0.25, 
                IgnoreInstantCastSetting = true
            });
            v72:Stop(0);
            local v74 = l_Character_3.Humanoid:LoadAnimation(script.twisterEnd);
            v74:Play(0);
            v74:AdjustSpeed(2);
            v74:AdjustWeight(2);
            l_Character_3.Humanoid.WalkSpeed = 4;
            if v70 then
                v70:InvokeServer(l_Character_3.PrimaryPart.CFrame);
            end;
            task.wait(0.3);
            l_Character_3.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Dragon Twister", l_cd_3);
            require(script.Parent.SwordStyleSwapping):matchCooldowns(l_Cooldowns_3);
            _G.fw(l_cd_3);
            l_Cooldowns_3["Dragon Twister"] = false;
        end;
    end;
end;
v9.CrossingSixPaths = function(v75, v76) --[[ Line: 394 ]] --[[ Name: CrossingSixPaths ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_4 = v75.Cooldowns;
    local l_Character_4 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_4["Crossing Six Paths"] == false and _G.check:inspect(l_Character_4) == true then
        local v80 = v3.GetM("Crossing Six Paths");
        local l_cd_4 = v80.cd;
        if _G.StamCheck("Crossing Six Paths") == false then
            return;
        elseif v80.statreq and _G.MeetReq(v80.statreq) == false then
            return;
        else
            l_Cooldowns_4["Crossing Six Paths"] = true;
            _G.canuse = false;
            _G.FaceMouse = true;
            task.delay(1.01, function() --[[ Line: 413 ]]
                _G.FaceMouse = false;
            end);
            local v82 = game.ReplicatedStorage.Events.Skill:InvokeServer("Crossing Six Paths", l_Character_4.PrimaryPart.CFrame);
            if v82 then
                v75:DoubleCastSkill(v76, {
                    Key = Enum.KeyCode.X, 
                    SkipTap = true, 
                    CompleteFunction = function() --[[ Line: 422 ]] --[[ Name: CompleteFunction ]]
                        -- upvalues: v82 (copy), l_Character_4 (copy)
                        if v82 and l_Character_4:FindFirstChild("GrabTag") == nil then
                            v82:FireServer("forceCancel");
                        end;
                    end, 
                    PassFunction = function() --[[ Line: 427 ]] --[[ Name: PassFunction ]]
                        -- upvalues: l_Character_4 (copy)
                        return l_Character_4:FindFirstChild(script.Name) and l_Character_4:GetAttribute("crossingsixStarted") == true;
                    end
                });
                repeat
                    task.wait();
                until v82:IsDescendantOf(game) == false;
            end;
            _G.FaceMouse = false;
            _G.canuse = true;
            _G.keysetup:cooldown("Crossing Six Paths", l_cd_4);
            require(script.Parent.SwordStyleSwapping):matchCooldowns(l_Cooldowns_4);
            _G.fw(l_cd_4);
            l_Cooldowns_4["Crossing Six Paths"] = false;
        end;
    end;
end;
v9["Billion-FoldWorld"] = function(v83, _) --[[ Line: 446 ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_5 = v83.Cooldowns;
    local l_Character_5 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_5["Billion-Fold World"] == false and _G.check:inspect(l_Character_5) == true then
        local v88 = v3.GetM("Billion-Fold World");
        local l_cd_5 = v88.cd;
        if _G.StamCheck("Billion-Fold World") == false then
            return;
        elseif v88.statreq and _G.MeetReq(v88.statreq) == false then
            return;
        else
            l_Cooldowns_5["Billion-Fold World"] = true;
            _G.canuse = false;
            local v90 = game.ReplicatedStorage.Events.Skill:InvokeServer("Billion-Fold World");
            if v90 then
                repeat
                    task.wait();
                until v90:IsDescendantOf(game) == false;
            end;
            _G.canuse = true;
            _G.keysetup:cooldown("Billion-Fold World", l_cd_5);
            require(script.Parent.SwordStyleSwapping):matchCooldowns(l_Cooldowns_5);
            _G.fw(l_cd_5);
            l_Cooldowns_5["Billion-Fold World"] = false;
        end;
    end;
end;
v9.SwordStyleSwap = function(v91, _) --[[ Line: 485 ]] --[[ Name: SwordStyleSwap ]]
    require(script.Parent.SwordStyleSwapping):swap(v91);
end;
return v9;