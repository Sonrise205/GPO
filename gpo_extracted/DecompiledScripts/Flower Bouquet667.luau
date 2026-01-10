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
        Smell = false, 
        Wave = false
    };
    return v10;
end;
v8.FlowerSmell = function(v11, _) --[[ Line: 28 ]] --[[ Name: FlowerSmell ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v11.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.Smell == false and _G.check:inspect(l_Character_0) == true then
        local v16 = v3.GetM("Flower Smell");
        local l_cd_0 = v16.cd;
        if _G.StamCheck("Flower Smell") == false then
            return;
        elseif v16.statreq and _G.MeetReq(v16.statreq) == false then
            return;
        else
            _G.canuse = false;
            l_Cooldowns_0.Smell = true;
            local v18 = l_Character_0.Humanoid.Animator:LoadAnimation(script.smell);
            v18:Play();
            v18:AdjustWeight(2);
            game.ReplicatedStorage.Events.Skill:InvokeServer("Flower Smell");
            _G.canuse = true;
            _G.keysetup:cooldown("Flower Smell", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.Smell = false;
        end;
    end;
end;
v8.FlowerCharm = function(v19, _) --[[ Line: 57 ]] --[[ Name: FlowerCharm ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v19.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.Wave == false and _G.check:inspect(l_Character_1) == true then
        local v24 = v3.GetM("Flower Charm");
        local l_cd_1 = v24.cd;
        if _G.StamCheck("Flower Charm") == false then
            return;
        elseif v24.statreq and _G.MeetReq(v24.statreq) == false then
            return;
        else
            _G.canuse = false;
            l_Cooldowns_1.Wave = true;
            local v26 = l_Character_1.Humanoid.Animator:LoadAnimation(script.wave);
            v26:Play();
            v26:AdjustWeight(2);
            l_Character_1.Humanoid.WalkSpeed = 4;
            local v27 = tick();
            game.ReplicatedStorage.Events.Skill:InvokeServer("Flower Charm");
            repeat
                game["Run Service"].Heartbeat:Wait();
                l_Character_1.Humanoid.WalkSpeed = 4;
            until tick() - v27 >= 2.75;
            l_Character_1.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Flower Charm", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1.Wave = false;
        end;
    end;
end;
return v8;