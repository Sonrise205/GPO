local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v3 = require(game.ReplicatedStorage.Modules.Skills);
local v4 = require(script.Parent.Parent.MobileBase);
local l_PlayerModule_0 = require(l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule"));
local _ = l_LocalPlayer_0:GetMouse();
local _ = l_PlayerModule_0:GetControls();
local v8 = setmetatable({}, v4);
v8.__index = v8;
v8.new = function(_) --[[ Line: 20 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v8 (copy)
    local v10 = setmetatable(v4.new(script.Name), v8);
    v10.Cooldowns = {
        Grasp = false, 
        strike = false
    };
    return v10;
end;
v8.ReapingStrike = function(v11, _) --[[ Line: 28 ]] --[[ Name: ReapingStrike ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v11.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.strike == false and _G.check:inspect(l_Character_0) == true then
        local v16 = v3.GetM("Reaping Strike");
        local l_cd_0 = v16.cd;
        if _G.StamCheck("Reaping Strike") == false then
            return;
        elseif v16.statreq and _G.MeetReq(v16.statreq) == false then
            return;
        else
            l_Cooldowns_0.strike = true;
            _G.canuse = false;
            game.ReplicatedStorage.Events.Skill:InvokeServer("Reaping Strike", l_Character_0.PrimaryPart.CFrame);
            l_Character_0.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Reaping Strike", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.strike = false;
        end;
    end;
end;
v8.ReapingGrasp = function(v18, _) --[[ Line: 56 ]] --[[ Name: ReapingGrasp ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v18.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.Grasp == false and _G.check:inspect(l_Character_1) == true then
        local v23 = v3.GetM("Reaping Grasp");
        local l_cd_1 = v23.cd;
        if _G.StamCheck("Reaping Grasp") == false then
            return;
        elseif v23.statreq and _G.MeetReq(v23.statreq) == false then
            return;
        else
            l_Cooldowns_1.Grasp = true;
            _G.canuse = false;
            game.ReplicatedStorage.Events.Skill:InvokeServer("Reaping Grasp", l_Character_1.PrimaryPart.CFrame);
            l_Character_1.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Reaping Grasp", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1.Grasp = false;
        end;
    end;
end;
return v8;