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
        jesterbox = false
    };
    return v8;
end;
v6.JackintheBox = function(v9, _) --[[ Line: 28 ]] --[[ Name: JackintheBox ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_0 = v9.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    if l_Cooldowns_0.jesterbox == false and _G.check:inspect(l_Character_0) == true and _G.StamCheck("Jack in the Box") == true then
        local v13 = v2.GetM("Jack in the Box");
        local l_cd_0 = v13.cd;
        if _G.StamCheck("Jack in the Box") == false then
            return;
        elseif v13.statreq and _G.MeetReq(v13.statreq) == false then
            return;
        else
            l_Cooldowns_0.jesterbox = true;
            _G.canuse = false;
            local v15 = l_Character_0.Humanoid:LoadAnimation(script.PLACE);
            v15:Play();
            v15:AdjustWeight(2);
            l_Character_0.Humanoid.WalkSpeed = 2;
            task.wait(0.4);
            local l_CFrame_0 = l_Character_0.PrimaryPart.CFrame;
            if v9.Tool then
                l_CFrame_0 = v9.Tool.JesterBox.PrimaryPart.CFrame;
            end;
            game.ReplicatedStorage.Events.Skill:InvokeServer("Jack in the Box", l_CFrame_0);
            task.wait(0.25);
            l_Character_0.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Jack in the Box", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.jesterbox = false;
        end;
    end;
end;
return v6;