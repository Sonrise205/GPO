local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v3 = require(game.ReplicatedStorage.Modules.Skills);
local v4 = require(script.Parent.Parent.MobileBase);
local _ = require(l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule"));
local _ = l_LocalPlayer_0:GetMouse();
local v7 = setmetatable({}, v4);
v7.__index = v7;
v7.new = function(_) --[[ Line: 18 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v7 (copy)
    local v9 = setmetatable(v4.new(script.Name), v7);
    v9.Cooldowns = {
        punch = false, 
        taunt = false, 
        head = false, 
        air = false, 
        sea = false
    };
    return v9;
end;
v7.ShockPunch = function(v10, v11) --[[ Line: 32 ]] --[[ Name: ShockPunch ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v10.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local v14 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.punch == false and _G.check:inspect(l_Character_0) == true and _G.StamCheck("Shock Punch") == true then
        local v15 = v3.GetM("Shock Punch");
        local l_cd_0 = v15.cd;
        if _G.StamCheck("Shock Punch") == false then
            return;
        elseif v15.statreq and _G.MeetReq(v15.statreq) == false then
            return;
        else
            _G.canuse = false;
            local v17 = game.ReplicatedStorage.Events.Skill:InvokeServer("Shock Punch", {
                cf = v10:GetMouseCFrame()
            });
            if v17 == nil then
                _G.canuse = true;
                return;
            else
                l_Cooldowns_0.punch = true;
                local v18 = l_Character_0.Humanoid:LoadAnimation(script.punch);
                v18:Play();
                v18:AdjustWeight(2);
                _G.canuse = false;
                _G.FaceMouse = true;
                _G.PauseAnim(v18, 0.42, 1);
                local v19 = tick();
                v10:ChargeSkill(v11, {
                    Key = Enum.KeyCode.E, 
                    EndFunction = function() --[[ Line: 69 ]] --[[ Name: EndFunction ]]
                        -- upvalues: v19 (copy), l_Character_0 (copy), v14 (copy)
                        local v20 = true;
                        if tick() - v19 < 10 then
                            v20 = not l_Character_0:FindFirstChild("Gura-Gura") or l_Character_0.Parent == nil or l_Character_0.Parent ~= workspace.PlayerCharacters or v14.Stamina.Value <= 0;
                        end;
                        return v20;
                    end
                });
                l_Character_0.HumanoidRootPart.Anchored = true;
                _G.FaceMouse = false;
                v18:AdjustSpeed(1);
                l_Character_0.HumanoidRootPart.Anchored = true;
                task.wait(0.1);
                if v17 then
                    v17:FireServer(l_Character_0.HumanoidRootPart.CFrame);
                end;
                task.wait(0.7);
                l_Character_0.HumanoidRootPart.Anchored = false;
                _G.canuse = true;
                _G.keysetup:cooldown("Shock Punch", l_cd_0);
                _G.fw(l_cd_0);
                l_Cooldowns_0.punch = false;
            end;
        end;
    end;
end;
v7.ComeATme = function(v21, _) --[[ Line: 91 ]] --[[ Name: ComeATme ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v21.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.taunt == false and _G.check:inspect(l_Character_1) == true and _G.StamCheck("Come AT me") == true then
        local v26 = v3.GetM("Come AT me");
        local l_cd_1 = v26.cd;
        if _G.StamCheck("Come AT me") == false then
            return;
        elseif v26.statreq and _G.MeetReq(v26.statreq) == false then
            return;
        else
            _G.canuse = false;
            l_Cooldowns_1.taunt = true;
            local v28 = l_Character_1.Humanoid:LoadAnimation(script.taunt);
            v28:Play();
            _G.canuse = false;
            game.ReplicatedStorage.Events.Skill:InvokeServer("Come AT me");
            task.wait(0.5);
            v28:Stop();
            task.wait(0.5);
            _G.canuse = true;
            _G.keysetup:cooldown("Come AT me", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1.taunt = false;
        end;
    end;
end;
v7.HeadCrusher = function(v29, v30) --[[ Line: 124 ]] --[[ Name: HeadCrusher ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_2 = v29.Cooldowns;
    local l_Character_2 = l_LocalPlayer_0.Character;
    local v33 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_2.head == false and _G.check:inspect(l_Character_2) == true and _G.StamCheck("Head Crusher") == true then
        local v34 = v3.GetM("Head Crusher");
        local l_cd_2 = v34.cd;
        if _G.StamCheck("Head Crusher") == false then
            return;
        elseif v34.statreq and _G.MeetReq(v34.statreq) == false then
            return;
        else
            _G.canuse = false;
            l_Cooldowns_2.head = true;
            local v36 = l_Character_2.Humanoid:LoadAnimation(script.grab);
            v36:Play();
            v36:AdjustWeight(2);
            _G.canuse = false;
            l_Character_2.Humanoid.WalkSpeed = 4;
            _G.PauseAnim(v36, 0.35, 1);
            local v37 = tick();
            v29:ChargeSkill(v30, {
                Key = Enum.KeyCode.Z, 
                EndFunction = function() --[[ Line: 155 ]] --[[ Name: EndFunction ]]
                    -- upvalues: v37 (copy), l_Character_2 (copy), v33 (copy)
                    local v38 = true;
                    if tick() - v37 < 10 then
                        v38 = not l_Character_2:FindFirstChild("Gura-Gura") or l_Character_2.Parent == nil or l_Character_2.Parent ~= workspace.PlayerCharacters or v33.Stamina.Value <= 0;
                    end;
                    return v38;
                end
            });
            v36:AdjustSpeed(1);
            l_Character_2.Humanoid.WalkSpeed = 16;
            game.ReplicatedStorage.Events.Skill:InvokeServer("Head Crusher", {
                cf = l_Character_2.HumanoidRootPart.CFrame
            });
            _G.canuse = true;
            _G.keysetup:cooldown("Head Crusher", l_cd_2);
            _G.fw(l_cd_2);
            l_Cooldowns_2.head = false;
        end;
    end;
end;
v7.BlastClutcher = function(v39, v40) --[[ Line: 170 ]] --[[ Name: BlastClutcher ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_3 = v39.Cooldowns;
    local l_Character_3 = l_LocalPlayer_0.Character;
    local v43 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_3.air == false and _G.check:inspect(l_Character_3) == true and _G.StamCheck("Blast Clutcher") == true then
        local v44 = v3.GetM("Blast Clutcher");
        local l_cd_3 = v44.cd;
        if _G.StamCheck("Blast Clutcher") == false then
            return;
        elseif v44.statreq and _G.MeetReq(v44.statreq) == false then
            return;
        else
            _G.canuse = false;
            l_Cooldowns_3.air = true;
            local v46 = l_Character_3.Humanoid:LoadAnimation(script.airgrab);
            v46:Play();
            _G.canuse = false;
            _G.FaceMouse = true;
            _G.mouseLevel = true;
            _G.PauseAnim(v46, 0.4, 1);
            local v47 = game.ReplicatedStorage.Events.Skill:InvokeServer("Blast Clutcher");
            local v48 = tick();
            local v49 = false;
            do
                local l_v49_0 = v49;
                v39:ChargeSkill(v40, {
                    Key = Enum.KeyCode.X, 
                    EndFunction = function() --[[ Line: 203 ]] --[[ Name: EndFunction ]]
                        -- upvalues: v48 (copy), l_v49_0 (ref), v47 (copy), l_Character_3 (copy), v43 (copy)
                        if tick() - v48 >= 4.2 and l_v49_0 == false then
                            l_v49_0 = true;
                            if v47 then
                                v47:FireServer("maxed");
                            end;
                        end;
                        local v51 = true;
                        if tick() - v48 < 7 then
                            v51 = not l_Character_3:FindFirstChild("Gura-Gura") or l_Character_3.Parent == nil or l_Character_3.Parent ~= workspace.PlayerCharacters or v43.Stamina.Value <= 0;
                        end;
                        return v51;
                    end, 
                    IgnoreInstantCastSetting = true
                });
                v46:AdjustSpeed(1);
                _G.mouseLevel = nil;
                _G.FaceMouse = false;
                l_Character_3.HumanoidRootPart.Anchored = true;
                if v47 then
                    v47:FireServer();
                end;
                task.wait(0.35);
                task.wait(1);
                l_Character_3.HumanoidRootPart.Anchored = false;
                _G.canuse = true;
                _G.keysetup:cooldown("Blast Clutcher", l_cd_3);
                _G.fw(l_cd_3);
                l_Cooldowns_3.air = false;
            end;
        end;
    end;
end;
v7.SeaQuake = function(v52, v53) --[[ Line: 234 ]] --[[ Name: SeaQuake ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_4 = v52.Cooldowns;
    local l_Character_4 = l_LocalPlayer_0.Character;
    local v56 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_4.sea == false and _G.check:inspect(l_Character_4) == true and _G.StamCheck("Sea Quake") == true then
        local v57 = v3.GetM("Sea Quake");
        local l_cd_4 = v57.cd;
        if _G.StamCheck("Sea Quake") == false then
            return;
        elseif v57.statreq and _G.MeetReq(v57.statreq) == false then
            return;
        else
            _G.canuse = false;
            local v59 = game.ReplicatedStorage.Events.Skill:InvokeServer("Sea Quake", {
                cf = v52:GetMouseCFrame()
            });
            if v59 == nil then
                _G.canuse = true;
                return;
            else
                l_Cooldowns_4.sea = true;
                local v60 = l_Character_4.Humanoid:LoadAnimation(script.seaQuake);
                v60:Play();
                v60:AdjustWeight(2);
                _G.canuse = false;
                _G.mouseLevel = true;
                _G.FaceMouse = true;
                _G.PauseAnim(v60, 0, 1);
                local v61 = tick();
                v52:ChargeSkill(v53, {
                    Key = Enum.KeyCode.C, 
                    EndFunction = function() --[[ Line: 272 ]] --[[ Name: EndFunction ]]
                        -- upvalues: v61 (copy), l_Character_4 (copy), v56 (copy)
                        local v62 = true;
                        if tick() - v61 < 10 then
                            v62 = not l_Character_4:FindFirstChild("Gura-Gura") or l_Character_4.Parent == nil or l_Character_4.Parent ~= workspace.PlayerCharacters or v56.Stamina.Value <= 0;
                        end;
                        return v62;
                    end
                });
                l_Character_4.HumanoidRootPart.Anchored = true;
                _G.FaceMouse = false;
                _G.mouseLevel = nil;
                v60:AdjustSpeed(1);
                l_Character_4.HumanoidRootPart.Anchored = true;
                task.wait(0.5);
                if v59 then
                    v59:FireServer(l_Character_4.HumanoidRootPart.CFrame);
                end;
                task.wait(0.7);
                l_Character_4.HumanoidRootPart.Anchored = false;
                _G.canuse = true;
                _G.keysetup:cooldown("Sea Quake", l_cd_4);
                _G.fw(l_cd_4);
                l_Cooldowns_4.sea = false;
            end;
        end;
    end;
end;
return v7;