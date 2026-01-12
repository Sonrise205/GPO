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
        heal = false, 
        jug = false
    };
    return v10;
end;
v8.HealingRhyme = function(v11, _) --[[ Line: 28 ]] --[[ Name: HealingRhyme ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v11.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.heal == false and _G.check:inspect(l_Character_0) == true then
        local v16 = v3.GetM("Healing Rhyme");
        local l_cd_0 = v16.cd;
        if _G.StamCheck("Healing Rhyme") == false then
            return;
        elseif v16.statreq and _G.MeetReq(v16.statreq) == false then
            return;
        else
            local v18 = l_Character_0.Humanoid.Animator:LoadAnimation(script.heal);
            v18:Play();
            v18:AdjustWeight(2);
            l_Cooldowns_0.heal = true;
            local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Healing Rhyme");
            _G.canuse = true;
            _G.keysetup:cooldown("Healing Rhyme", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.heal = false;
        end;
    end;
end;
return v8;