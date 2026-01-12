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
        spin = false, 
        blessing = false
    };
    return v10;
end;
v8["Cupid'sWrath"] = function(v11, _) --[[ Line: 28 ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v11.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.spin == false and _G.check:inspect(l_Character_0) == true then
        local v16 = v3.GetM("Cupid's Wrath");
        local l_cd_0 = v16.cd;
        if _G.StamCheck("Cupid's Wrath") == false then
            return;
        elseif v16.statreq and _G.MeetReq(v16.statreq) == false then
            return;
        else
            l_Cooldowns_0.spin = true;
            _G.canuse = false;
            local v18 = l_Character_0.Humanoid.Animator:LoadAnimation(script.cloudSummon);
            v18:Play();
            v18:AdjustWeight(2);
            l_Character_0.Humanoid.WalkSpeed = 4;
            task.wait(0.5);
            local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Cupid's Wrath", {
                cf = v11:GetMouseCFrame()
            });
            task.wait(0.4);
            l_Character_0.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Cupid's Wrath", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.spin = false;
        end;
    end;
end;
v8["Cupid'sBlessing"] = function(v20, _) --[[ Line: 61 ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v20.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.blessing == false and _G.check:inspect(l_Character_1) == true then
        local v25 = v3.GetM("Cupid's Blessing");
        local l_cd_1 = v25.cd;
        if _G.StamCheck("Cupid's Blessing") == false then
            return;
        elseif v25.statreq and _G.MeetReq(v25.statreq) == false then
            return;
        else
            _G.canuse = false;
            l_Cooldowns_1.blessing = true;
            local v27 = l_Character_1.Humanoid.Animator:LoadAnimation(script.heal);
            v27:Play();
            v27:AdjustWeight(2);
            l_Character_1.Humanoid.WalkSpeed = 4;
            local v28 = game.ReplicatedStorage.Events.Skill:InvokeServer("Cupid's Blessing");
            task.wait(0.4);
            if v28 then
                v28:FireServer();
            end;
            task.wait(0.25);
            l_Character_1.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Cupid's Blessing", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1.blessing = false;
        end;
    end;
end;
return v8;