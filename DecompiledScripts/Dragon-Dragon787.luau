local l_LocalPlayer_0 = game.Players.LocalPlayer;
local l_RunService_0 = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v3 = require(game.ReplicatedStorage.Modules.Skills);
local v4 = require(script.Parent.Parent.MobileBase);
local _ = require(l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule"));
local _ = game:GetService("UserInputService");
local _ = l_LocalPlayer_0:GetMouse();
local v8 = setmetatable({}, v4);
v8.__index = v8;
v8.new = function(_) --[[ Line: 20 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v8 (copy), l_LocalPlayer_0 (copy), l_RunService_0 (copy)
    local v10 = setmetatable(v4.new(script.Name), v8);
    v10.Cooldowns = {
        ["Hellfire Ring"] = false
    };
    local l_Character_0 = l_LocalPlayer_0.Character;
    v10.PlayAnim = function(_, v13, v14, v15) --[[ Line: 27 ]] --[[ Name: PlayAnim ]]
        -- upvalues: l_Character_0 (copy), l_RunService_0 (ref)
        local v16 = l_Character_0.Humanoid:LoadAnimation(v13);
        local l_l_Character_0_FirstChild_0 = l_Character_0:FindFirstChild("DragonTailController", true);
        local v18 = nil;
        if l_l_Character_0_FirstChild_0 ~= nil then
            v18 = l_l_Character_0_FirstChild_0:LoadAnimation(v13);
        end;
        v16:Play();
        local v19 = nil;
        if v18 then
            v18:Play();
            if v14 == nil then
                v19 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 45 ]]
                    -- upvalues: v16 (copy), v18 (ref), v15 (copy), v19 (ref)
                    if v16.IsPlaying == true and v18.IsPlaying == false then
                        v18:Play();
                        v18.TimePosition = v16.TimePosition;
                    elseif v16.IsPlaying == false and v18.IsPlaying == true then
                        v18:Stop();
                        if v15 == nil and v19 then
                            v19:Disconnect();
                            v19 = nil;
                        end;
                        return;
                    end;
                    v18.TimePosition = v16.TimePosition;
                    v18:AdjustSpeed(v16.Speed);
                end);
                v16.Stopped:Connect(function() --[[ Line: 65 ]]
                    -- upvalues: v18 (ref), v15 (copy), v19 (ref)
                    v18:Stop();
                    if v15 == nil and v19 then
                        v19:Disconnect();
                        v19 = nil;
                    end;
                end);
                if v15 == nil then
                    task.delay(15, function() --[[ Line: 76 ]]
                        -- upvalues: v19 (ref)
                        if v19 then
                            v19:Disconnect();
                            v19 = nil;
                        end;
                    end);
                end;
            end;
            v16.Destroying:Connect(function() --[[ Line: 85 ]]
                -- upvalues: v19 (ref), v18 (ref)
                if v19 then
                    v19:Disconnect();
                    v19 = nil;
                end;
                v18:Stop();
                v18:Destroy();
            end);
        end;
        return v16;
    end;
    return v10;
end;
v8.HellfireRing = function(v20, _) --[[ Line: 101 ]] --[[ Name: HellfireRing ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v20.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.check:inspect(l_Character_1) == true then
        if l_Cooldowns_0["Hellfire Ring"] == true then
            return;
        else
            local v25 = v3.GetM("Hellfire Ring");
            local l_cd_0 = v25.cd;
            if _G.StamCheck("Hellfire Ring") == false then
                return;
            elseif v25.statreq and _G.MeetReq(v25.statreq) == false then
                return;
            else
                _G.canuse = false;
                l_Cooldowns_0["Hellfire Ring"] = true;
                l_Character_1.Humanoid.WalkSpeed = 4;
                local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Hellfire Ring", {
                    cf = v20:GetMouseCFrame()
                });
                l_Character_1.Humanoid.WalkSpeed = 16;
                _G.canuse = true;
                _G.keysetup:cooldown("Hellfire Ring", l_cd_0);
                _G.fw(l_cd_0);
                l_Cooldowns_0["Hellfire Ring"] = false;
            end;
        end;
    end;
end;
v8.DraconicWarcry = function(v28, _) --[[ Line: 136 ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v28.Cooldowns;
    local l_Character_2 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.check:inspect(l_Character_2) == true then
        if l_Cooldowns_1["Draconic Warcry"] == true then
            return;
        else
            local v33 = v3.GetM("Draconic Warcry");
            local l_cd_1 = v33.cd;
            if _G.StamCheck("Draconic Warcry") == false then
                return;
            elseif v33.statreq and _G.MeetReq(v33.statreq) == false then
                return;
            else
                _G.canuse = false;
                l_Cooldowns_1["Draconic Warcry"] = true;
                l_Character_2.Humanoid.WalkSpeed = 4;
                local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Draconic Warcry", l_Character_2.PrimaryPart.CFrame);
                l_Character_2.Humanoid.WalkSpeed = 16;
                _G.canuse = true;
                _G.keysetup:cooldown("Draconic Warcry", l_cd_1);
                _G.fw(l_cd_1);
                l_Cooldowns_1["Draconic Warcry"] = false;
            end;
        end;
    end;
end;
v8.DraconicCataclysm = function(v36, _) --[[ Line: 171 ]] --[[ Name: DraconicCataclysm ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_2 = v36.Cooldowns;
    local l_Character_3 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.check:inspect(l_Character_3) == true then
        if l_Cooldowns_2["Draconic Cataclysm"] == true then
            return;
        else
            local v41 = v3.GetM("Draconic Cataclysm");
            local l_cd_2 = v41.cd;
            if _G.StamCheck("Draconic Cataclysm") == false then
                return;
            elseif v41.statreq and _G.MeetReq(v41.statreq) == false then
                return;
            else
                l_Cooldowns_2["Draconic Cataclysm"] = true;
                l_Character_3.Humanoid.WalkSpeed = 4;
                _G.canuse = false;
                local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Draconic Cataclysm");
                l_Character_3.Humanoid.WalkSpeed = 16;
                _G.canuse = true;
                _G.keysetup:cooldown("Draconic Cataclysm", l_cd_2);
                _G.fw(l_cd_2);
                l_Cooldowns_2["Draconic Cataclysm"] = false;
            end;
        end;
    end;
end;
v8.DraconicThunderfall = function(v44, v45) --[[ Line: 206 ]] --[[ Name: DraconicThunderfall ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_3 = v44.Cooldowns;
    local l_Character_4 = l_LocalPlayer_0.Character;
    local v48 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.check:inspect(l_Character_4) == true then
        if l_Cooldowns_3["Draconic Thunderfall"] == true then
            return;
        else
            local v49 = v3.GetM("Draconic Thunderfall");
            local l_cd_3 = v49.cd;
            if _G.StamCheck("Draconic Thunderfall") == false then
                return;
            elseif v49.statreq and _G.MeetReq(v49.statreq) == false then
                return;
            else
                _G.canuse = false;
                l_Cooldowns_3["Draconic Thunderfall"] = true;
                l_Character_4.Humanoid.WalkSpeed = 4;
                local v51 = game.ReplicatedStorage.Events.Skill:InvokeServer("Draconic Thunderfall");
                local v52 = v44:PlayAnim(script.thunderFall);
                task.spawn(function() --[[ Line: 238 ]]
                    -- upvalues: v52 (copy)
                    _G.PauseAnim(v52, 0.4, 1);
                end);
                local v53 = _G.castingSkill(l_Character_4, 0.4, true);
                local v54 = tick();
                v44:ChargeSkill(v45, {
                    Key = Enum.KeyCode.R, 
                    EndFunction = function() --[[ Line: 246 ]] --[[ Name: endFunction ]]
                        -- upvalues: l_Character_4 (copy), v53 (copy), v54 (copy), v44 (copy), v48 (copy)
                        l_Character_4.Humanoid.WalkSpeed = 4;
                        if v53 == false then
                            return true;
                        elseif tick() - v54 >= 3 or v44.Tool.Parent ~= l_Character_4 or l_Character_4.Parent == nil or l_Character_4.Parent ~= workspace.PlayerCharacters or v48.Stamina.Value <= 0 then
                            return true;
                        else
                            return;
                        end;
                    end, 
                    IgnoreInstantCastSetting = true
                });
                if v53 == true then
                    v52:AdjustSpeed(1);
                else
                    v52:Stop();
                end;
                if v51 then
                    v51:FireServer(v53);
                end;
                task.wait(1.3);
                l_Character_4.Humanoid.WalkSpeed = 16;
                _G.canuse = true;
                _G.keysetup:cooldown("Draconic Thunderfall", l_cd_3);
                _G.fw(l_cd_3);
                l_Cooldowns_3["Draconic Thunderfall"] = false;
            end;
        end;
    end;
end;
v8.HellfireRay = function(v55, v56) --[[ Line: 282 ]] --[[ Name: HellfireRay ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_4 = v55.Cooldowns;
    local l_Character_5 = l_LocalPlayer_0.Character;
    local v59 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.check:inspect(l_Character_5) == true then
        if l_Cooldowns_4["Hellfire Ray"] == true then
            return;
        else
            local v60 = v3.GetM("Hellfire Ray");
            local l_cd_4 = v60.cd;
            if _G.StamCheck("Hellfire Ray") == false then
                return;
            elseif v60.statreq and _G.MeetReq(v60.statreq) == false then
                return;
            else
                _G.FaceMouse = true;
                l_Cooldowns_4["Hellfire Ray"] = true;
                local v62 = tick();
                local v63 = game.ReplicatedStorage.Events.Skill:InvokeServer("Hellfire Ray");
                v55:ChargeSkill(v56, {
                    Key = Enum.KeyCode.C, 
                    EndFunction = function() --[[ Line: 314 ]] --[[ Name: endFunction ]]
                        -- upvalues: v62 (copy), v55 (copy), l_Character_5 (copy), v59 (copy)
                        if tick() - v62 >= 4 or v55.Tool.Parent ~= l_Character_5 or _G.check:inspect(l_Character_5) == false or l_Character_5.Parent == nil or l_Character_5.Parent ~= workspace.PlayerCharacters or v59.Stamina.Value <= 0 or l_Character_5:FindFirstChild("PB") then
                            return true;
                        else
                            return;
                        end;
                    end, 
                    IgnoreInstantCastSetting = true
                });
                if v63 ~= nil then
                    v63:FireServer("release");
                    _G.FaceMouse = false;
                    l_Character_5.PrimaryPart.Anchored = true;
                    task.wait(0.75);
                    l_Character_5.PrimaryPart.Anchored = false;
                else
                    _G.FaceMouse = false;
                end;
                _G.canuse = true;
                _G.keysetup:cooldown("Hellfire Ray", l_cd_4);
                _G.fw(l_cd_4);
                l_Cooldowns_4["Hellfire Ray"] = false;
            end;
        end;
    end;
end;
v8.ThunderclawRush = function(v64, _) --[[ Line: 344 ]] --[[ Name: ThunderclawRush ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_5 = v64.Cooldowns;
    local l_Character_6 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.check:inspect(l_Character_6) == true then
        if l_Cooldowns_5["Thunderclaw Rush"] == true then
            return;
        else
            local v69 = v3.GetM("Thunderclaw Rush");
            local l_cd_5 = v69.cd;
            if _G.StamCheck("Thunderclaw Rush") == false then
                return;
            elseif v69.statreq and _G.MeetReq(v69.statreq) == false then
                return;
            else
                _G.canuse = false;
                l_Cooldowns_5["Thunderclaw Rush"] = true;
                l_Character_6.Humanoid.WalkSpeed = 4;
                _G.canuse = false;
                local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Thunderclaw Rush");
                l_Character_6.Humanoid.WalkSpeed = 16;
                _G.canuse = true;
                _G.keysetup:cooldown("Thunderclaw Rush", l_cd_5);
                _G.fw(l_cd_5);
                l_Cooldowns_5["Thunderclaw Rush"] = false;
            end;
        end;
    end;
end;
v8.DraconicAscension = function(v72, v73) --[[ Line: 381 ]] --[[ Name: DraconicAscension ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy), l_RunService_0 (copy)
    local l_Cooldowns_6 = v72.Cooldowns;
    local l_Character_7 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.check:inspect(l_Character_7) == true then
        if l_Cooldowns_6["Draconic Ascension"] == true then
            return;
        else
            local v77 = v3.GetM("Draconic Ascension");
            local l_cd_6 = v77.cd;
            if _G.StamCheck("Draconic Ascension") == false then
                return;
            elseif v77.statreq and _G.MeetReq(v77.statreq) == false then
                return;
            else
                local l_l_Character_7_Attribute_0 = l_Character_7:GetAttribute("BeastType");
                local v80 = "Human";
                local l_Attribute_0 = v72.Tool:GetAttribute("halfModePercent");
                local l_Attribute_1 = v72.Tool:GetAttribute("modePercent");
                local v83 = require(game.ReplicatedStorage.Modules.Skills.Modes.Dragon)(l_LocalPlayer_0);
                local v84 = true;
                local v85 = 0;
                if l_Character_7:GetAttribute("dragonDamage") then
                    v85 = math.ceil((l_Character_7:GetAttribute("dragonDamage")));
                end;
                l_Cooldowns_6["Draconic Ascension"] = true;
                _G.canuse = false;
                if l_l_Character_7_Attribute_0 == "Human" or l_l_Character_7_Attribute_0 == "Hybird" then
                    local v86 = tick();
                    local v87 = tick();
                    local l_v86_0 = v86 --[[ copy: 14 -> 18 ]];
                    do
                        local l_v87_0 = v87;
                        v72:ChargeSkill(v73, {
                            Key = Enum.KeyCode.T, 
                            IgnoreInstantCastSetting = true, 
                            EndFunction = function() --[[ Line: 425 ]] --[[ Name: EndFunction ]]
                                -- upvalues: l_v87_0 (ref), l_v86_0 (copy)
                                l_v87_0 = tick() - l_v86_0;
                                return l_v87_0 > 0.25;
                            end
                        });
                        v80 = l_v87_0 > 0.25 == true and "Full" or l_l_Character_7_Attribute_0 == "Human" and "Hybird" or "Human";
                    end;
                else
                    v80 = "Human";
                end;
                if v80 == "Hybird" then
                    if v85 < v83 * l_Attribute_0 then
                        _G.displayMessage((("<Color=/>I need <Color=Orange>%*%%<Color=/> Rage for Hybrid mode."):format(l_Attribute_0 * 100)));
                        v84 = false;
                    end;
                elseif v80 == "Full" and v85 < v83 * l_Attribute_1 then
                    _G.displayMessage((("<Color=/>I need <Color=Orange>%*%%<Color=/> Rage for Full mode."):format(l_Attribute_1 * 100)));
                    v84 = false;
                end;
                if v84 == false then
                    script.DragonNotCharged:Play();
                    _G.canuse = true;
                    _G.keysetup:cooldown("Draconic Ascension", l_cd_6);
                    _G.fw(l_cd_6);
                    l_Cooldowns_6["Draconic Ascension"] = false;
                    return;
                else
                    local function v90() --[[ Line: 466 ]] --[[ Name: stopHybird ]]
                        -- upvalues: v72 (copy), l_Character_7 (copy)
                        if v72.hybirdIdle then
                            v72.hybirdIdle:Disconnect();
                        end;
                        l_Character_7:SetAttribute("CustomRunSpeed", nil);
                        v72.Tool:SetAttribute("customRun", nil);
                        if v72.hybirdIdleAnim then
                            task.delay(0.1, function() --[[ Line: 475 ]]
                                -- upvalues: v72 (ref)
                                if v72.hybirdIdleAnim then
                                    v72.hybirdIdleAnim:Stop();
                                    v72.hybirdIdleAnim:Destroy();
                                    v72.hybirdIdleAnim = nil;
                                end;
                                if v72.hybirdRunAnim then
                                    v72.hybirdRunAnim:Stop();
                                    v72.hybirdRunAnim:Destroy();
                                    v72.hybirdRunAnim = nil;
                                end;
                            end);
                        end;
                    end;
                    v90();
                    if v80 == "Hybird" and v84 == true then
                        _G.toolLocked = v72.Tool;
                    end;
                    local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Draconic Ascension", v80);
                    local l_Humanoid_0 = l_Character_7.Humanoid;
                    _G.toolLocked = nil;
                    if v80 == "Hybird" and l_Character_7:GetAttribute("BeastType") == "Hybird" then
                        v72.hybirdIdle = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 503 ]]
                            -- upvalues: l_Character_7 (copy), v72 (copy), l_Humanoid_0 (copy), v90 (copy)
                            if l_Character_7:GetAttribute("BeastType") == "Hybird" then
                                if v72.hybirdIdleAnim == nil then
                                    v72.hybirdIdleAnim = v72:PlayAnim(script.hybirdIdle, true, true);
                                end;
                                if v72.hybirdRunAnim == nil then
                                    v72.hybirdRunAnim = v72:PlayAnim(script.hybirdRun, nil, true);
                                    v72.hybirdRunAnim.KeyframeReached:Connect(function(v93) --[[ Line: 513 ]]
                                        -- upvalues: l_Character_7 (ref)
                                        if l_Character_7.PrimaryPart.Anchored == true then
                                            return;
                                        else
                                            if v93:match("step") and v93 ~= "step" and _G.footstep then
                                                _G.footstep(v93);
                                            end;
                                            return;
                                        end;
                                    end);
                                end;
                                v72.Tool:SetAttribute("customRun", true);
                                l_Character_7:SetAttribute("CustomRunSpeed", 35);
                                local l_hybirdIdleAnim_0 = v72.hybirdIdleAnim;
                                local l_hybirdRunAnim_0 = v72.hybirdRunAnim;
                                local v96 = _G.check:inspect(l_Character_7) == false;
                                local v97 = l_Humanoid_0.FloorMaterial ~= Enum.Material.Air;
                                local v98 = v72.Tool.Parent == l_Character_7;
                                local function _() --[[ Line: 532 ]] --[[ Name: stopAllAnims ]]
                                    -- upvalues: l_hybirdIdleAnim_0 (copy), l_hybirdRunAnim_0 (copy)
                                    if l_hybirdIdleAnim_0.IsPlaying == true then
                                        l_hybirdIdleAnim_0:Stop();
                                    end;
                                    if l_hybirdRunAnim_0.IsPlaying == true then
                                        l_hybirdRunAnim_0:Stop();
                                    end;
                                end;
                                if v98 == false then
                                    if l_hybirdIdleAnim_0.IsPlaying == true then
                                        l_hybirdIdleAnim_0:Stop();
                                    end;
                                    if l_hybirdRunAnim_0.IsPlaying == true then
                                        l_hybirdRunAnim_0:Stop();
                                    end;
                                    return;
                                elseif l_Humanoid_0.MoveDirection == Vector3.new() and v97 and v96 == false then
                                    if l_hybirdIdleAnim_0.IsPlaying == false then
                                        l_hybirdIdleAnim_0:Play();
                                    end;
                                    if l_hybirdRunAnim_0.IsPlaying == true then
                                        l_hybirdRunAnim_0:Stop();
                                        return;
                                    end;
                                elseif l_Humanoid_0.MoveDirection ~= Vector3.new() and v97 and v96 == false then
                                    if l_hybirdIdleAnim_0.IsPlaying == true then
                                        l_hybirdIdleAnim_0:Stop();
                                    end;
                                    if l_Humanoid_0.WalkSpeed >= 25 then
                                        if l_hybirdRunAnim_0.IsPlaying == false then
                                            l_hybirdRunAnim_0:Play();
                                            l_hybirdRunAnim_0:AdjustSpeed(1.5);
                                            return;
                                        end;
                                    elseif l_hybirdRunAnim_0.IsPlaying == true then
                                        l_hybirdRunAnim_0:Stop();
                                        return;
                                    end;
                                else
                                    if l_hybirdIdleAnim_0.IsPlaying == true then
                                        l_hybirdIdleAnim_0:Stop();
                                    end;
                                    if l_hybirdRunAnim_0.IsPlaying == true then
                                        l_hybirdRunAnim_0:Stop();
                                        return;
                                    end;
                                end;
                            else
                                v90();
                            end;
                        end);
                    elseif l_Character_7:GetAttribute("BeastType") == "Full" then
                        _G.toolLocked = v72.Tool;
                        local v100 = nil;
                        do
                            local l_v100_0 = v100;
                            l_v100_0 = l_Character_7:GetAttributeChangedSignal("BeastType"):Connect(function() --[[ Line: 583 ]]
                                -- upvalues: l_Character_7 (copy), l_v100_0 (ref)
                                if l_Character_7:GetAttribute("BeastType") ~= "Full" then
                                    _G.toolLocked = nil;
                                    l_v100_0:Disconnect();
                                    l_v100_0 = nil;
                                end;
                            end);
                        end;
                    end;
                    task.wait(0.5);
                    _G.canuse = true;
                    _G.keysetup:cooldown("Draconic Ascension", l_cd_6);
                    _G.fw(l_cd_6);
                    l_Cooldowns_6["Draconic Ascension"] = false;
                end;
            end;
        end;
    end;
end;
v8.HellfireBlastBreath = function(v102, _) --[[ Line: 600 ]] --[[ Name: HellfireBlastBreath ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_7 = v102.Cooldowns;
    local l_Character_8 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.check:inspect(l_Character_8) == true then
        if l_Cooldowns_7["Hellfire Blast Breath"] == true then
            return;
        else
            local v107 = v3.GetM("Hellfire Blast Breath");
            local l_cd_7 = v107.cd;
            if _G.StamCheck("Hellfire Blast Breath") == false then
                return;
            elseif v107.statreq and _G.MeetReq(v107.statreq) == false then
                return;
            else
                l_Cooldowns_7["Hellfire Blast Breath"] = true;
                _G.FaceMouse = true;
                local v109 = game.ReplicatedStorage.Events.Skill:InvokeServer("Hellfire Blast Breath", v102:GetMouseCFrame().Position);
                if v109 then
                    repeat
                        v109:FireServer(v102:GetMouseCFrame().Position);
                        task.wait();
                    until v109:IsDescendantOf(game) == false or v109:GetAttribute("GoalPosition") ~= nil;
                    l_Character_8.PrimaryPart.Anchored = true;
                    _G.moveFaceMouse = nil;
                    task.wait(1);
                    l_Character_8.PrimaryPart.Anchored = false;
                end;
                _G.FaceMouse = false;
                _G.canuse = true;
                _G.keysetup:cooldown("Hellfire Blast Breath", l_cd_7);
                _G.fw(l_cd_7);
                l_Cooldowns_7["Hellfire Blast Breath"] = false;
            end;
        end;
    end;
end;
v8.DraconicTailSlam = function(v110, v111) --[[ Line: 649 ]] --[[ Name: DraconicTailSlam ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_8 = v110.Cooldowns;
    local l_Character_9 = l_LocalPlayer_0.Character;
    local v114 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.check:inspect(l_Character_9) == true then
        if l_Cooldowns_8["Draconic Tail Slam"] == true then
            return;
        else
            local v115 = v3.GetM("Draconic Tail Slam");
            local l_cd_8 = v115.cd;
            if _G.StamCheck("Draconic Tail Slam") == false then
                return;
            elseif v115.statreq and _G.MeetReq(v115.statreq) == false then
                return;
            else
                _G.FaceMouse = true;
                _G.MouseLevel = true;
                l_Cooldowns_8["Draconic Tail Slam"] = true;
                local v117 = tick();
                local v118 = v110:PlayAnim(script.TailSlam.leapCharge);
                local v119 = game.ReplicatedStorage.Events.Skill:InvokeServer("Draconic Tail Slam");
                v110:ChargeSkill(v111, {
                    Key = Enum.KeyCode.E, 
                    EndFunction = function() --[[ Line: 682 ]] --[[ Name: endFunction ]]
                        -- upvalues: v117 (copy), v110 (copy), l_Character_9 (copy), v114 (copy)
                        if tick() - v117 >= 3 or v110.Tool.Parent ~= l_Character_9 or l_Character_9.Parent == nil or l_Character_9.Parent ~= workspace.PlayerCharacters or v114.Stamina.Value <= 0 then
                            return true;
                        else
                            return;
                        end;
                    end, 
                    HoldDuration = 0.1
                });
                v118:Stop();
                local _ = v110:PlayAnim(script.TailSlam.leap);
                _G.MouseLevel = nil;
                _G.FaceMouse = false;
                local l_v110_MouseCFrame_0 = v110:GetMouseCFrame();
                local l_BodyVelocity_0 = Instance.new("BodyVelocity");
                l_BodyVelocity_0.MaxForce = Vector3.new(1e999, 1e999, 1e999, 0);
                l_BodyVelocity_0.Velocity = Vector3.new();
                l_BodyVelocity_0.Parent = l_Character_9.PrimaryPart;
                if v119 then
                    v119:FireServer("Jump", l_Character_9.PrimaryPart.CFrame, {
                        goalCFrame = l_v110_MouseCFrame_0
                    });
                end;
                task.wait(0.1);
                local v123 = v110:PlayAnim(script.TailSlam.leapLoop);
                if v119 ~= nil then
                    v119:GetAttributeChangedSignal("clientSmashed"):Wait();
                    if v123 then
                        v123:Stop();
                    end;
                    local _ = v110:PlayAnim(script.TailSlam.leapSlam);
                    task.wait(0.3);
                    l_BodyVelocity_0:Destroy();
                    l_Character_9.Humanoid.AutoRotate = true;
                    l_Character_9.PrimaryPart.Anchored = false;
                else
                    if v123 then
                        v123:Stop();
                    end;
                    l_BodyVelocity_0:Destroy();
                end;
                _G.canuse = true;
                _G.keysetup:cooldown("Draconic Tail Slam", l_cd_8);
                _G.fw(l_cd_8);
                l_Cooldowns_8["Draconic Tail Slam"] = false;
            end;
        end;
    end;
end;
v8.DraconicCyclone = function(v125, v126) --[[ Line: 746 ]] --[[ Name: DraconicCyclone ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy), l_RunService_0 (copy)
    local l_Cooldowns_9 = v125.Cooldowns;
    local l_Character_10 = l_LocalPlayer_0.Character;
    local v129 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.check:inspect(l_Character_10) == true then
        if l_Cooldowns_9["Draconic Cyclone"] == true then
            return;
        else
            local v130 = v3.GetM("Draconic Cyclone");
            local l_cd_9 = v130.cd;
            if _G.StamCheck("Draconic Cyclone") == false then
                return;
            elseif v130.statreq and _G.MeetReq(v130.statreq) == false then
                return;
            else
                l_Cooldowns_9["Draconic Cyclone"] = true;
                local v132 = tick();
                local l_PrimaryPart_0 = l_Character_10.PrimaryPart;
                local l_Position_0 = l_PrimaryPart_0.Position;
                local v135 = 0;
                local v136 = 0;
                local v137 = nil;
                local function _(v138) --[[ Line: 785 ]] --[[ Name: easeOutCubic ]]
                    return 1 - (1 - v138) ^ 3;
                end;
                _G.canuse = false;
                local v140 = game.ReplicatedStorage.Events.Skill:InvokeServer("Draconic Cyclone", l_Position_0);
                local l_Part_0 = Instance.new("Part");
                l_Part_0.Position = l_Position_0;
                l_Part_0.Anchored = true;
                l_Part_0.CanCollide = false;
                l_Part_0.Transparency = 1;
                l_Part_0.CanQuery = false;
                l_Part_0.Parent = workspace.Effects;
                workspace.CurrentCamera.CameraSubject = l_Part_0;
                l_Character_10:SetAttribute("DragonFaceRoot", true);
                local v142 = RaycastParams.new();
                v142.FilterType = Enum.RaycastFilterType.Include;
                v142.FilterDescendantsInstances = {
                    workspace.Islands, 
                    workspace.Ships, 
                    workspace.Env
                };
                local v143 = Vector3.new(0, 0, 0, 0);
                do
                    local l_v135_0, l_v136_0, l_v143_0 = v135, v136, v143;
                    v137 = l_RunService_0.Heartbeat:Connect(function(v147) --[[ Line: 812 ]]
                        -- upvalues: l_v136_0 (ref), l_v135_0 (ref), l_Position_0 (copy), v142 (copy), l_v143_0 (ref), l_PrimaryPart_0 (copy)
                        l_v136_0 = l_v136_0 + v147;
                        l_v135_0 = 1 - (1 - math.min(1, l_v136_0 / 1)) ^ 3;
                        local v148 = Vector3.new(0, 1, 0, 0) * math.noise(l_v136_0 * 2) * 15;
                        local v149 = (50 + math.noise(l_v136_0) * 25) * l_v135_0;
                        local v150 = l_v136_0 * 2 * 3.141592653589793 / 1 * 2;
                        local v151 = Vector3.new(math.sin(v150), 0, -math.cos(v150)) * v149;
                        local v152 = l_Position_0 + v151 + v148;
                        local v153 = workspace:Raycast(l_Position_0, v152 - l_Position_0, v142);
                        local v154 = Vector3.new(0, 0, 0, 0);
                        if v153 then
                            v154 = v153.Position + v153.Normal * 5 - v152;
                        end;
                        l_v143_0 = l_v143_0:Lerp(v154, (math.min(1, v147 * 10)));
                        l_PrimaryPart_0.CFrame = CFrame.new(v152 + l_v143_0) * CFrame.Angles(0, -v150 - 1.5707963267948966, 0);
                    end);
                    v125:ChargeSkill(v126, {
                        Key = Enum.KeyCode.Z, 
                        EndFunction = function() --[[ Line: 834 ]] --[[ Name: endFunction ]]
                            -- upvalues: v132 (copy), v125 (copy), l_Character_10 (copy), v129 (copy)
                            if tick() - v132 >= 6 or v125.Tool.Parent ~= l_Character_10 or l_Character_10.Parent == nil or l_Character_10.Parent ~= workspace.PlayerCharacters or v129.Stamina.Value <= 0 then
                                return true;
                            else
                                return;
                            end;
                        end, 
                        HoldDuration = 0.5, 
                        IgnoreInstantCastSetting = true
                    });
                    _G.canuse = true;
                    v137:Disconnect();
                    v137 = nil;
                    l_Character_10:SetAttribute("DragonFaceRoot", nil);
                    if v140 ~= nil then
                        v140:FireServer("release");
                    end;
                    workspace.CurrentCamera.CameraSubject = l_Character_10.Humanoid;
                    l_Part_0:Destroy();
                    _G.canuse = true;
                    _G.keysetup:cooldown("Draconic Cyclone", l_cd_9);
                    _G.fw(l_cd_9);
                    l_Cooldowns_9["Draconic Cyclone"] = false;
                end;
            end;
        end;
    end;
end;
v8.HellfireMode = function(v155, _) --[[ Line: 866 ]] --[[ Name: HellfireMode ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_10 = v155.Cooldowns;
    local l_Character_11 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.check:inspect(l_Character_11) == true then
        if l_Cooldowns_10["Hellfire Mode"] == true then
            return;
        else
            local v160 = v3.GetM("Hellfire Mode");
            local l_cd_10 = v160.cd;
            if _G.StamCheck("Hellfire Mode") == false then
                return;
            elseif v160.statreq and _G.MeetReq(v160.statreq) == false then
                return;
            else
                l_Cooldowns_10["Hellfire Mode"] = true;
                local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Hellfire Mode", v155:GetMouseCFrame().Position);
                _G.keysetup:cooldown("Hellfire Mode", l_cd_10);
                _G.fw(l_cd_10);
                l_Cooldowns_10["Hellfire Mode"] = false;
            end;
        end;
    end;
end;
v8.DraconicTempestSpiral = function(v163, _) --[[ Line: 899 ]] --[[ Name: DraconicTempestSpiral ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_11 = v163.Cooldowns;
    local l_Character_12 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.check:inspect(l_Character_12) == true then
        if l_Cooldowns_11["Draconic Tempest Spiral"] == true then
            return;
        else
            local v168 = v3.GetM("Draconic Tempest Spiral");
            local l_cd_11 = v168.cd;
            if _G.StamCheck("Draconic Tempest Spiral") == false then
                return;
            elseif v168.statreq and _G.MeetReq(v168.statreq) == false then
                return;
            else
                l_Cooldowns_11["Draconic Tempest Spiral"] = true;
                _G.canuse = false;
                local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Draconic Tempest Spiral", v163:GetMouseCFrame().Position);
                _G.customDragonFlightForce = l_Character_12.PrimaryPart.CFrame.LookVector * 5000;
                task.wait(0.5);
                _G.customDragonFlightForce = nil;
                _G.canuse = true;
                _G.keysetup:cooldown("Draconic Tempest Spiral", l_cd_11);
                _G.fw(l_cd_11);
                l_Cooldowns_11["Draconic Tempest Spiral"] = false;
            end;
        end;
    end;
end;
v8.DraconicThundercry = function(v171, _) --[[ Line: 939 ]] --[[ Name: DraconicThundercry ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_12 = v171.Cooldowns;
    local l_Character_13 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.check:inspect(l_Character_13) == true then
        if l_Cooldowns_12["Draconic Thundercry"] == true then
            return;
        else
            local v176 = v3.GetM("Draconic Thundercry");
            local l_cd_12 = v176.cd;
            if _G.StamCheck("Draconic Thundercry") == false then
                return;
            elseif v176.statreq and _G.MeetReq(v176.statreq) == false then
                return;
            else
                l_Cooldowns_12["Draconic Thundercry"] = true;
                _G.canuse = false;
                _G.customDragonFlightMult = 0.3;
                local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Draconic Thundercry", v171:GetMouseCFrame().Position);
                _G.canuse = true;
                _G.customDragonFlightMult = 1;
                _G.keysetup:cooldown("Draconic Thundercry", l_cd_12);
                _G.fw(l_cd_12);
                l_Cooldowns_12["Draconic Thundercry"] = false;
            end;
        end;
    end;
end;
v8.ThundercladVeil = function(v179, _) --[[ Line: 975 ]] --[[ Name: ThundercladVeil ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_13 = v179.Cooldowns;
    local l_Character_14 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.check:inspect(l_Character_14) == true then
        if l_Cooldowns_13["Thunderclad Veil"] == true then
            return;
        else
            local v184 = v3.GetM("Thunderclad Veil");
            local l_cd_13 = v184.cd;
            if _G.StamCheck("Thunderclad Veil") == false then
                return;
            elseif v184.statreq and _G.MeetReq(v184.statreq) == false then
                return;
            elseif l_Character_14:FindFirstChild("DragonDefenseBind") then
                return;
            else
                l_Cooldowns_13["Thunderclad Veil"] = true;
                _G.canuse = false;
                l_Character_14.Humanoid.WalkSpeed = 0;
                local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Thunderclad Veil", v179:GetMouseCFrame().Position);
                _G.canuse = true;
                l_Character_14.Humanoid.WalkSpeed = 16;
                repeat
                    task.wait();
                until l_Character_14:FindFirstChild("DragonDefenseBind") == nil;
                _G.keysetup:cooldown("Thunderclad Veil", l_cd_13);
                _G.fw(l_cd_13);
                l_Cooldowns_13["Thunderclad Veil"] = false;
            end;
        end;
    end;
end;
return v8;