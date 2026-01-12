local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("RunService");
local v2 = require(game.ReplicatedStorage.Modules.Skills);
local v3 = require(script.Parent.Parent.MobileBase);
local _ = require(l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule"));
local _ = l_LocalPlayer_0:GetMouse();
local v6 = setmetatable({}, v3);
v6.__index = v6;
v6.new = function(_) --[[ Line: 18 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v6 (copy)
    local v8 = setmetatable(v3.new(script.Name), v6);
    v8.Cooldowns = {
        powerCord = false, 
        amp = false
    };
    return v8;
end;
v6.PowerChord = function(v9, v10) --[[ Line: 30 ]] --[[ Name: PowerChord ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_0 = v9.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    if l_Cooldowns_0.powerCord == false and _G.check:inspect(l_Character_0) == true and _G.StamCheck("Power Chord") == true then
        local v13 = v2.GetM("Power Chord");
        local l_cd_0 = v13.cd;
        if _G.StamCheck("Power Chord") == false then
            return;
        elseif v13.statreq and _G.MeetReq(v13.statreq) == false then
            return;
        else
            l_Cooldowns_0.powerCord = true;
            _G.canuse = false;
            local v15 = l_Character_0.Humanoid:LoadAnimation(script.play);
            v15:Play();
            v15:AdjustWeight(2);
            v15:AdjustSpeed(0);
            _G.FaceMouse = true;
            local v16 = tick();
            v9:ChargeSkill(v10, {
                Key = Enum.KeyCode.R, 
                CheckFunction = function() --[[ Line: 55 ]] --[[ Name: checkFunction ]]

                end, 
                EndFunction = function() --[[ Line: 59 ]] --[[ Name: endFunction ]]
                    -- upvalues: v9 (copy), l_Character_0 (copy), v16 (copy)
                    if v9.Tool.Parent ~= l_Character_0 or tick() - v16 >= 10 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v15:AdjustSpeed(1);
            _G.FaceMouse = false;
            l_Character_0.PrimaryPart.Anchored = true;
            if _G.castingSkill(l_Character_0, 0.5) == true then
                game.ReplicatedStorage.Events.Skill:InvokeServer("Power Chord", l_Character_0.PrimaryPart.CFrame);
            end;
            task.wait(0.65);
            l_Character_0.PrimaryPart.Anchored = false;
            _G.canuse = true;
            _G.keysetup:cooldown("Power Chord", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.powerCord = false;
        end;
    end;
end;
v6["AmpItUp!"] = function(v17, _) --[[ Line: 88 ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_1 = v17.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    if l_Cooldowns_1.amp == false and _G.check:inspect(l_Character_1) == true and _G.StamCheck("Amp It Up!") == true then
        local v21 = v2.GetM("Amp It Up!");
        local l_cd_1 = v21.cd;
        if _G.StamCheck("Amp It Up!") == false then
            return;
        elseif v21.statreq and _G.MeetReq(v21.statreq) == false then
            return;
        else
            local v23, _, _ = _G.getRayFloor(l_Character_1.PrimaryPart.CFrame, 7);
            if v23 == nil then
                _G.displayMessage("<Color=Red>I have to touch the ground");
                return nil;
            else
                l_Cooldowns_1.amp = true;
                _G.canuse = false;
                local v26 = l_Character_1.Humanoid:LoadAnimation(script.amp);
                v26:Play();
                v26:AdjustWeight(2);
                l_Character_1.PrimaryPart.Anchored = true;
                game.ReplicatedStorage.Events.Skill:InvokeServer("Amp It Up!", l_Character_1.PrimaryPart.CFrame);
                task.wait(0.85);
                task.wait(0.65);
                l_Character_1.PrimaryPart.Anchored = false;
                _G.canuse = true;
                _G.keysetup:cooldown("Amp It Up!", l_cd_1);
                _G.fw(l_cd_1);
                l_Cooldowns_1.amp = false;
            end;
        end;
    end;
end;
return v6;