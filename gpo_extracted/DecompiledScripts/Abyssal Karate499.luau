local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("RunService");
local v2 = require(game.ReplicatedStorage.Modules.Skills);
local v3 = require(script.Parent.Parent.MobileBase);
local _ = require(l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule"));
local _ = l_LocalPlayer_0:GetMouse();
local v6 = setmetatable({}, v3);
v6.__index = v6;
v6.new = function(_) --[[ Line: 17 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v6 (copy)
    local v8 = setmetatable(v3.new(script.Name), v6);
    v8.Cooldowns = {
        BrickFist = false, 
        SeaSplit = false, 
        Dive = false, 
        Surge = false, 
        Feeding = false, 
        trans = false, 
        ult = false
    };
    return v8;
end;
local _ = {
    Fishman1 = "Shark1", 
    Fishman2 = "Shark2", 
    Fishman3 = "Shark1", 
    Fishman4 = "Shark1", 
    Fishman5 = "Armor1", 
    Fishman6 = "Octopus1", 
    Fishman7 = "Shark2", 
    Fishman8 = "Shark1", 
    Fishman9 = "Shark1", 
    Fishman10 = "Dolphin1", 
    Fishman11 = "Dolphin1", 
    Fishman12 = "Dolphin1", 
    Fishman13 = "Armor1"
};
v6.DemonBrickFist = function(v10, v11) --[[ Line: 47 ]] --[[ Name: DemonBrickFist ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_0 = v10.Cooldowns;
    local _ = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_0 = l_LocalPlayer_0.Character;
    if l_Cooldowns_0.BrickFist == false and _G.StamCheck("Demon Brick Fist") == true and _G.canuse == true and _G.check:inspect(l_Character_0) == true then
        local v15 = v2.GetM("Demon Brick Fist");
        local l_cd_0 = v15.cd;
        if v15.statreq and _G.MeetReq(v15.statreq) == false then
            return;
        else
            l_Cooldowns_0.BrickFist = true;
            _G.canuse = false;
            local v17 = l_Character_0.Humanoid:LoadAnimation(script.brickCharge);
            v17:Play();
            v17:AdjustWeight(3);
            local v18 = tick();
            _G.FaceMouse = true;
            local v19 = game.ReplicatedStorage.Events.Skill:InvokeServer("Demon Brick Fist");
            v10:ChargeSkill(v11, {
                Key = Enum.KeyCode.E, 
                CheckFunction = function() --[[ Line: 69 ]] --[[ Name: checkFunction ]]

                end, 
                EndFunction = function() --[[ Line: 73 ]] --[[ Name: endFunction ]]
                    -- upvalues: v10 (copy), l_Character_0 (copy), v18 (copy), v19 (copy)
                    if v10.Tool.Parent ~= l_Character_0 or tick() - v18 >= 3 or v19 == nil then
                        return true;
                    else
                        return;
                    end;
                end, 
                HoldDuration = 0.425
            });
            v17:Stop();
            local v20 = l_Character_0.Humanoid:LoadAnimation(script.brickRelease);
            v20:Play();
            v20:AdjustWeight(3);
            v20:AdjustSpeed(1.25);
            _G.FaceMouse = false;
            l_Character_0.PrimaryPart.Anchored = true;
            if v19 then
                v19:FireServer(l_Character_0.PrimaryPart.CFrame, v10:GetMouseCFrame().Position);
            end;
            task.wait(0.75);
            l_Character_0.PrimaryPart.Anchored = false;
            v20:Stop(0);
            l_Character_0.Humanoid.WalkSpeed = 16;
            _G.keysetup:cooldown("Demon Brick Fist", l_cd_0);
            _G.canuse = true;
            _G.fw(l_cd_0);
            l_Cooldowns_0.BrickFist = false;
        end;
    end;
end;
v6.SplittingSeaFist = function(v21, v22) --[[ Line: 110 ]] --[[ Name: SplittingSeaFist ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_1 = v21.Cooldowns;
    local _ = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_1 = l_LocalPlayer_0.Character;
    if l_Cooldowns_1.SeaSplit == false and _G.StamCheck("Splitting Sea Fist") == true and _G.canuse == true and _G.check:inspect(l_Character_1) == true then
        local v26 = v2.GetM("Splitting Sea Fist");
        local l_cd_1 = v26.cd;
        if v26.statreq and _G.MeetReq(v26.statreq) == false then
            return;
        else
            local v28, _, _ = _G.getRayFloor(l_Character_1.PrimaryPart.CFrame, 5);
            if v28 == nil then
                _G.displayMessage("<Color=Red>I have to touch the ground");
                return nil;
            else
                l_Cooldowns_1.SeaSplit = true;
                _G.canuse = false;
                local v31 = l_Character_1.Humanoid:LoadAnimation(script.splitCharge);
                v31:Play();
                v31:AdjustWeight(3);
                local v32 = tick();
                _G.mouseLevel = true;
                _G.FaceMouse = true;
                local v33 = game.ReplicatedStorage.Events.Skill:InvokeServer("Splitting Sea Fist");
                v21:ChargeSkill(v22, {
                    Key = Enum.KeyCode.R, 
                    CheckFunction = function() --[[ Line: 140 ]] --[[ Name: checkFunction ]]

                    end, 
                    EndFunction = function() --[[ Line: 144 ]] --[[ Name: endFunction ]]
                        -- upvalues: v21 (copy), l_Character_1 (copy), v32 (copy), v33 (copy)
                        if v21.Tool.Parent ~= l_Character_1 or tick() - v32 >= 3 or v33 == nil then
                            return true;
                        else
                            return;
                        end;
                    end, 
                    HoldDuration = 0.7
                });
                v31:Stop(0);
                _G.mouseLevel = nil;
                _G.FaceMouse = false;
                l_Character_1.PrimaryPart.Anchored = true;
                local v34 = l_Character_1.Humanoid:LoadAnimation(script.splitRelease);
                v34:Play();
                if v33 then
                    v33:FireServer(l_Character_1.PrimaryPart.CFrame);
                end;
                task.wait(0.65);
                v34:Stop(0);
                l_Character_1.PrimaryPart.Anchored = false;
                l_Character_1.Humanoid.WalkSpeed = 16;
                _G.keysetup:cooldown("Splitting Sea Fist", l_cd_1);
                _G.canuse = true;
                _G.fw(l_cd_1);
                l_Cooldowns_1.SeaSplit = false;
            end;
        end;
    end;
end;
v6.DivingTides = function(v35, _) --[[ Line: 181 ]] --[[ Name: DivingTides ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_2 = v35.Cooldowns;
    local _ = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_2 = l_LocalPlayer_0.Character;
    if l_Cooldowns_2.Dive == false and _G.StamCheck("Diving Tides") == true and _G.canuse == true and _G.check:inspect(l_Character_2) == true then
        local v40 = v2.GetM("Diving Tides");
        local l_cd_2 = v40.cd;
        if v40.statreq and _G.MeetReq(v40.statreq) == false then
            return;
        else
            l_Cooldowns_2.Dive = true;
            _G.canuse = false;
            local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Diving Tides");
            _G.keysetup:cooldown("Diving Tides", l_cd_2);
            _G.canuse = true;
            _G.fw(l_cd_2);
            l_Cooldowns_2.Dive = false;
        end;
    end;
end;
v6.SurgingBermuda = function(v43, _) --[[ Line: 205 ]] --[[ Name: SurgingBermuda ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_3 = v43.Cooldowns;
    local _ = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_3 = l_LocalPlayer_0.Character;
    if l_Cooldowns_3.Surge == false and _G.StamCheck("Surging Bermuda") == true and _G.canuse == true and _G.check:inspect(l_Character_3) == true then
        local v48 = v2.GetM("Surging Bermuda");
        local l_cd_3 = v48.cd;
        if v48.statreq and _G.MeetReq(v48.statreq) == false then
            return;
        else
            l_Cooldowns_3.Surge = true;
            _G.canuse = false;
            local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Surging Bermuda", l_Character_3.PrimaryPart.CFrame);
            _G.keysetup:cooldown("Surging Bermuda", l_cd_3);
            _G.canuse = true;
            _G.fw(l_cd_3);
            l_Cooldowns_3.Surge = false;
        end;
    end;
end;
v6.FeedingFrenzy = function(v51, v52) --[[ Line: 230 ]] --[[ Name: FeedingFrenzy ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_4 = v51.Cooldowns;
    local _ = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_4 = l_LocalPlayer_0.Character;
    if l_Cooldowns_4.Feeding == false and _G.StamCheck("Feeding Frenzy") == true and _G.canuse == true and _G.check:inspect(l_Character_4) == true then
        local v56 = v2.GetM("Feeding Frenzy");
        local l_cd_4 = v56.cd;
        if v56.statreq and _G.MeetReq(v56.statreq) == false then
            return;
        else
            l_Cooldowns_4.Feeding = true;
            _G.canuse = false;
            local v58 = l_Character_4.Humanoid:LoadAnimation(script.barrageCharge);
            v58:Play();
            v58:AdjustWeight(3);
            local v59 = tick();
            _G.FaceMouse = true;
            _G.mouseLevel = true;
            local v60 = game.ReplicatedStorage.Events.Skill:InvokeServer("Feeding Frenzy");
            v51:ChargeSkill(v52, {
                Key = Enum.KeyCode.X, 
                CheckFunction = function() --[[ Line: 253 ]] --[[ Name: checkFunction ]]

                end, 
                EndFunction = function() --[[ Line: 257 ]] --[[ Name: endFunction ]]
                    -- upvalues: v51 (copy), l_Character_4 (copy), v59 (copy), v60 (copy)
                    if v51.Tool.Parent ~= l_Character_4 or tick() - v59 >= 3.5 or v60 == nil or _G.check:inspect(l_Character_4) == false then
                        return true;
                    else
                        return;
                    end;
                end, 
                HoldDuration = 0.25, 
                IgnoreInstantCastSetting = true
            });
            v58:Stop();
            local v61 = l_Character_4.Humanoid:LoadAnimation(script.barrageFire);
            v61:Play();
            v61:AdjustWeight(3);
            _G.FaceMouse = false;
            l_Character_4.PrimaryPart.Anchored = true;
            _G.mouseLevel = nil;
            if v60 then
                v60:InvokeServer(l_Character_4.PrimaryPart.CFrame);
            end;
            task.wait(0.45);
            l_Character_4.PrimaryPart.Anchored = false;
            l_Character_4.Humanoid.WalkSpeed = 16;
            _G.keysetup:cooldown("Feeding Frenzy", l_cd_4);
            _G.canuse = true;
            _G.fw(l_cd_4);
            l_Cooldowns_4.Feeding = false;
        end;
    end;
end;
v6.AbyssalAwakening = function(v62, _) --[[ Line: 296 ]] --[[ Name: AbyssalAwakening ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_5 = v62.Cooldowns;
    local _ = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_5 = l_LocalPlayer_0.Character;
    if l_Cooldowns_5.trans == false and _G.StamCheck("Abyssal Awakening") == true and _G.canuse == true and _G.check:inspect(l_Character_5) == true then
        local v67 = v2.GetM("Abyssal Awakening");
        local l_cd_5 = v67.cd;
        if v67.statreq and _G.MeetReq(v67.statreq) == false then
            return;
        else
            local v69 = l_Character_5:GetAttribute("FishmanTransform") or false;
            local v70 = l_Character_5:GetAttribute(v62.Tool:GetAttribute("damageName")) or 0;
            if v69 == false and v70 < require(game.ReplicatedStorage.Modules.Skills.Modes["Abyssal Karate"])(l_LocalPlayer_0) * v62.Tool:GetAttribute("modePercent") then
                _G.displayMessage("<Color=Red>My transformation bar (80%) isnt full enough!");
                return;
            else
                l_Cooldowns_5.trans = true;
                _G.canuse = false;
                local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Abyssal Awakening", l_Character_5.PrimaryPart.CFrame);
                _G.keysetup:cooldown("Abyssal Awakening", l_cd_5);
                _G.canuse = true;
                _G.fw(l_cd_5);
                l_Cooldowns_5.trans = false;
            end;
        end;
    end;
end;
v6.LeviathanPlunge = function(v72, _) --[[ Line: 327 ]] --[[ Name: LeviathanPlunge ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_6 = v72.Cooldowns;
    local _ = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_6 = l_LocalPlayer_0.Character;
    if l_Cooldowns_6.ult == false and _G.StamCheck("Leviathan Plunge") == true and _G.canuse == true and _G.check:inspect(l_Character_6) == true then
        local v77 = v2.GetM("Leviathan Plunge");
        local l_cd_6 = v77.cd;
        if v77.statreq and _G.MeetReq(v77.statreq) == false then
            return;
        else
            l_Cooldowns_6.ult = true;
            _G.canuse = false;
            local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Leviathan Plunge", {
                charCF = l_Character_6.PrimaryPart.CFrame, 
                mouseCF = v72:GetMouseCFrame()
            });
            _G.keysetup:cooldown("Leviathan Plunge", l_cd_6);
            _G.canuse = true;
            _G.fw(l_cd_6);
            l_Cooldowns_6.ult = false;
        end;
    end;
end;
return v6;