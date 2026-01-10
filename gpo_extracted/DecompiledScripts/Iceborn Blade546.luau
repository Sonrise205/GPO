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
        lunge = false, 
        nado = false
    };
    return v10;
end;
v8["Hellheim'sStorm"] = function(v11, _) --[[ Line: 28 ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v11.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.lunge == false and _G.check:inspect(l_Character_0) == true then
        local v16 = v3.GetM("Hellheim's Storm");
        local l_cd_0 = v16.cd;
        if _G.StamCheck("Hellheim's Storm") == false then
            return;
        elseif v16.statreq and _G.MeetReq(v16.statreq) == false then
            return;
        else
            l_Cooldowns_0.lunge = true;
            _G.canuse = false;
            l_Character_0.HumanoidRootPart.Anchored = true;
            l_Character_0.Humanoid.AutoRotate = true;
            l_Character_0.PrimaryPart.Anchored = true;
            local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Hellheim's Storm", l_Character_0.PrimaryPart.CFrame);
            l_Character_0.HumanoidRootPart.Anchored = false;
            l_Character_0.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Hellheim's Storm", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.lunge = false;
        end;
    end;
end;
v8.FlamesOfFrost = function(v19, _) --[[ Line: 62 ]] --[[ Name: FlamesOfFrost ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v19.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.nado == false and _G.check:inspect(l_Character_1) == true then
        local v24 = v3.GetM("Flames Of Frost");
        local l_cd_1 = v24.cd;
        if _G.StamCheck("Flames Of Frost") == false then
            return;
        elseif v24.statreq and _G.MeetReq(v24.statreq) == false then
            return;
        else
            l_Cooldowns_1.nado = true;
            _G.canuse = false;
            l_Character_1.Humanoid.WalkSpeed = 4;
            l_Character_1.PrimaryPart.Anchored = true;
            local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Flames Of Frost", l_Character_1.PrimaryPart.CFrame);
            task.wait(0.3);
            l_Character_1.PrimaryPart.Anchored = false;
            l_Character_1.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Flames Of Frost", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1.nado = false;
        end;
    end;
end;
return v8;