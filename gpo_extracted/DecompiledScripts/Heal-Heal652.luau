local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("UserInputService");
local v4 = require(game.ReplicatedStorage.Modules.Skills);
local v5 = require(script.Parent.Parent.MobileBase);
local _ = require(l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule"));
local _ = l_LocalPlayer_0:GetMouse();
local v8 = setmetatable({}, v5);
v8.__index = v8;
v8.new = function(_) --[[ Line: 19 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy), v8 (copy)
    local v10 = setmetatable(v5.new(script.Name), v8);
    v10.Cooldowns = {
        aoeHeal = false, 
        support = false, 
        orb = false
    };
    return v10;
end;
v8.HealingField = function(v11, _) --[[ Line: 27 ]] --[[ Name: HealingField ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v4 (copy)
    local l_Cooldowns_0 = v11.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.aoeHeal == false and _G.check:inspect(l_Character_0) == true and _G.StamCheck("Healing Field") == true then
        local v16 = v4.GetM("Healing Field");
        local l_cd_0 = v16.cd;
        if _G.StamCheck("Healing Field") == false then
            return;
        elseif v16.statreq and _G.MeetReq(v16.statreq) == false then
            return;
        else
            l_Cooldowns_0.aoeHeal = true;
            _G.canuse = false;
            local v18 = l_Character_0.Humanoid:LoadAnimation(script.ult);
            v18:Play();
            v18:AdjustWeight(2);
            task.wait(0.4);
            if game.ReplicatedStorage.Events.Skill:InvokeServer("Healing Field", l_Character_0.PrimaryPart.CFrame) then
                task.wait(2.25);
            end;
            _G.canuse = true;
            _G.keysetup:cooldown("Healing Field", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.aoeHeal = false;
        end;
    end;
end;
v8.HealingSupport = function(v19, _) --[[ Line: 59 ]] --[[ Name: HealingSupport ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v4 (copy)
    local l_Cooldowns_1 = v19.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.support == false and _G.check:inspect(l_Character_1) == true and _G.StamCheck("Healing Support") == true then
        local v24 = v4.GetM("Healing Support");
        local l_cd_1 = v24.cd;
        if _G.StamCheck("Healing Support") == false then
            return;
        elseif v24.statreq and _G.MeetReq(v24.statreq) == false then
            return;
        else
            l_Cooldowns_1.support = true;
            _G.canuse = false;
            local v26 = l_Character_1.Humanoid:LoadAnimation(script.orbHeal);
            v26:Play();
            v26:AdjustWeight(2);
            if game.ReplicatedStorage.Events.Skill:InvokeServer("Healing Support", l_Character_1.PrimaryPart.CFrame) then
                task.wait(2.25);
            end;
            _G.canuse = true;
            _G.keysetup:cooldown("Healing Support", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1.support = false;
        end;
    end;
end;
v8.HealingOrb = function(v27, _) --[[ Line: 92 ]] --[[ Name: HealingOrb ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v4 (copy)
    local l_Cooldowns_2 = v27.Cooldowns;
    local l_Character_2 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_2.orb == false and _G.check:inspect(l_Character_2) == true and _G.StamCheck("Healing Orb") == true then
        local v32 = v4.GetM("Healing Orb");
        local l_cd_2 = v32.cd;
        if _G.StamCheck("Healing Orb") == false then
            return;
        elseif v32.statreq and _G.MeetReq(v32.statreq) == false then
            return;
        else
            l_Cooldowns_2.orb = true;
            _G.canuse = false;
            local v34 = l_Character_2.Humanoid:LoadAnimation(script.orb);
            v34:Play();
            v34:AdjustSpeed(1.5);
            v34:AdjustWeight(2);
            task.wait(0.2);
            local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Healing Orb", v27:GetMouseCFrame());
            _G.canuse = true;
            _G.keysetup:cooldown("Healing Orb", l_cd_2);
            _G.fw(l_cd_2);
            l_Cooldowns_2.orb = false;
        end;
    end;
end;
return v8;