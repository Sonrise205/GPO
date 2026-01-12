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
        tune = false
    };
    return v8;
end;
v6.FreezingTune = function(v9, _) --[[ Line: 28 ]] --[[ Name: FreezingTune ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_0 = v9.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    if l_Cooldowns_0.tune == false and _G.check:inspect(l_Character_0) == true and _G.StamCheck("Jack in the Box") == true then
        local v13 = v2.GetM("Freezing Tune");
        local l_cd_0 = v13.cd;
        if _G.StamCheck("Freezing Tune") == false then
            return;
        elseif v13.statreq and _G.MeetReq(v13.statreq) == false then
            return;
        else
            l_Cooldowns_0.tune = true;
            _G.canuse = false;
            l_Character_0.Humanoid.WalkSpeed = 4;
            local v15 = l_Character_0.Humanoid:LoadAnimation(script.play);
            v15:Play();
            v15:AdjustWeight(2);
            v15:AdjustSpeed(1.25);
            task.wait(0.75);
            game.ReplicatedStorage.Events.Skill:InvokeServer("Freezing Tune", l_Character_0.PrimaryPart.CFrame);
            local v16 = tick();
            while true do
                l_Character_0.Humanoid.WalkSpeed = 4;
                if _G.check:inspect(l_Character_0) == false then
                    v15:Stop();
                    break;
                else
                    _G.canuse = false;
                    task.wait();
                    if tick() - v16 >= 1.75 then
                        break;
                    end;
                end;
            end;
            l_Character_0.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Freezing Tune", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.tune = false;
        end;
    end;
end;
return v6;