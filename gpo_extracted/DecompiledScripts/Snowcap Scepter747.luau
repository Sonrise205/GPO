local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v3 = require(game.ReplicatedStorage.Modules.Skills);
local v4 = require(script.Parent.Parent.MobileBase);
local _ = require(l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule"));
local _ = l_LocalPlayer_0:GetMouse();
local v7 = setmetatable({}, v4);
v7.__index = v7;
v7.new = function(_) --[[ Line: 18 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v7 (copy)
    local v9 = setmetatable(v4.new(script.Name), v7);
    v9.Cooldowns = {
        snowball = false, 
        storm = false
    };
    v9.CurrentBall = 0;
    v9.doingSlash = false;
    return v9;
end;
v7.ScepterSnowball = function(v10, _) --[[ Line: 29 ]] --[[ Name: ScepterSnowball ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v10.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.snowball == false and _G.check:inspect(l_Character_0) == true and _G.StamCheck("Scepter Snowball") == true then
        local v15 = v3.GetM("Scepter Snowball");
        local l_cd_0 = v15.cd;
        if _G.StamCheck("Scepter Snowball") == false then
            return;
        elseif v15.statreq and _G.MeetReq(v15.statreq) == false then
            return;
        else
            l_Cooldowns_0.snowball = true;
            _G.canuse = false;
            local v17 = game.ReplicatedStorage.Events.Skill:InvokeServer("Scepter Snowball");
            local v18 = l_Character_0.Humanoid:LoadAnimation(script.projectileSkill);
            v18:Play(0);
            v18:AdjustSpeed(2);
            v18:AdjustWeight(2);
            task.wait(0.2);
            if v17 then
                v17:FireServer(l_Character_0.PrimaryPart.CFrame, v10:GetMouseCFrame());
            end;
            v10.CurrentBall = v10.CurrentBall + 1;
            task.wait(0.1);
            if v10.CurrentBall >= 3 then
                l_cd_0 = 10;
                v10.CurrentBall = 0;
            end;
            _G.keysetup:cooldown("Scepter Snowball", l_cd_0);
            _G.canuse = true;
            _G.fw(l_cd_0);
            l_Cooldowns_0.snowball = false;
        end;
    end;
end;
v7.ScepterStorm = function(v19, _) --[[ Line: 76 ]] --[[ Name: ScepterStorm ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v19.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.storm == false and _G.check:inspect(l_Character_1) == true and _G.StamCheck("Scepter Storm") == true then
        local v24 = v3.GetM("Scepter Storm");
        local l_cd_1 = v24.cd;
        if _G.StamCheck("Scepter Storm") == false then
            return;
        elseif v24.statreq and _G.MeetReq(v24.statreq) == false then
            return;
        else
            l_Cooldowns_1.storm = true;
            _G.canuse = false;
            local v26 = game.ReplicatedStorage.Events.Skill:InvokeServer("Scepter Storm", l_Character_1.PrimaryPart.CFrame);
            local v27 = l_Character_1.Humanoid:LoadAnimation(script.startUp);
            v27:Play();
            task.wait(0.4);
            if v26 then
                v27:Stop();
                local v28 = l_Character_1.Humanoid:LoadAnimation(script.spinAnim);
                v28:Play();
                v26:InvokeServer(l_Character_1.PrimaryPart.CFrame);
                v28:Stop();
            else
                v27:Stop();
            end;
            _G.keysetup:cooldown("Scepter Storm", l_cd_1);
            _G.canuse = true;
            _G.fw(l_cd_1);
            l_Cooldowns_1.storm = false;
        end;
    end;
end;
return v7;