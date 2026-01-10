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
v8.new = function(_, v10) --[[ Line: 20 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v8 (copy)
    local v11 = setmetatable(v4.new(), v8);
    v11.Tool = v10;
    v11.Cooldowns = {
        throw = false, 
        ground = false
    };
    return v11;
end;
v8.SlayerCrossSlash = function(v12, v13) --[[ Line: 29 ]] --[[ Name: SlayerCrossSlash ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v12.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.throw == false and _G.check:inspect(l_Character_0) == true then
        local v17 = v3.GetM("Slayer Cross Slash");
        local l_cd_0 = v17.cd;
        if _G.StamCheck("Slayer Cross Slash") == false then
            return;
        elseif v17.statreq and _G.MeetReq(v17.statreq) == false then
            return;
        else
            local v19 = l_Character_0.Humanoid.Animator:LoadAnimation(script.throw);
            v19:Play();
            v19:AdjustWeight(2);
            l_Cooldowns_0.throw = true;
            _G.canuse = false;
            l_Character_0.Humanoid.WalkSpeed = 4;
            _G.PauseAnim(v19, 0.25, 2);
            local v20 = game.ReplicatedStorage.Events.Skill:InvokeServer("Slayer Cross Slash");
            local v21 = tick();
            v12:ChargeSkill(v13, {
                Key = Enum.KeyCode.R, 
                CheckFunction = function() --[[ Line: 55 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_0 (copy)
                    l_Character_0.Humanoid.WalkSpeed = 4;
                end, 
                EndFunction = function() --[[ Line: 60 ]] --[[ Name: endFunction ]]
                    -- upvalues: v12 (copy), l_Character_0 (copy), v21 (copy)
                    if v12.Tool.Parent ~= l_Character_0 or tick() - v21 >= 10 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v19:AdjustSpeed(1);
            task.wait(0.245);
            if v20 and _G.check:inspect(l_Character_0) == true then
                v20:FireServer();
            end;
            l_Character_0.Humanoid.WalkSpeed = 4;
            task.wait(1.25);
            l_Character_0.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Slayer Cross Slash", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.throw = false;
        end;
    end;
end;
v8.EternalFlow = function(v22, v23) --[[ Line: 88 ]] --[[ Name: EternalFlow ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v22.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.ground == false and _G.check:inspect(l_Character_1) == true then
        local v27 = v3.GetM("Eternal Flow");
        local l_cd_1 = v27.cd;
        if _G.StamCheck("Eternal Flow") == false then
            return;
        elseif v27.statreq and _G.MeetReq(v27.statreq) == false then
            return;
        else
            local v29 = l_Character_1.Humanoid.Animator:LoadAnimation(script.ground);
            v29:Play();
            v29:AdjustWeight(2);
            l_Cooldowns_1.ground = true;
            _G.canuse = false;
            l_Character_1.Humanoid.WalkSpeed = 4;
            local v30 = nil;
            v30 = game.ReplicatedStorage.Events.Skill:InvokeServer("Eternal Flow");
            _G.PauseAnim(v29, 0.7, 1);
            local v31 = tick();
            v22:ChargeSkill(v23, {
                Key = Enum.KeyCode.E, 
                CheckFunction = function() --[[ Line: 119 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_1 (copy), v29 (copy)
                    if _G.check:inspect(l_Character_1) == false then
                        v29:Stop();
                        return true;
                    else
                        l_Character_1.Humanoid.WalkSpeed = 0;
                        l_Character_1.Humanoid.Jump = false;
                        return;
                    end;
                end, 
                EndFunction = function() --[[ Line: 128 ]] --[[ Name: endFunction ]]
                    -- upvalues: v22 (copy), l_Character_1 (copy), v31 (copy)
                    if v22.Tool.Parent ~= l_Character_1 or tick() - v31 >= 5 or _G.check:inspect(l_Character_1) == false then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v29:Stop(0.25);
            if v30 then
                v30:FireServer();
            end;
            task.wait(0.4);
            l_Character_1.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Eternal Flow", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1.ground = false;
        end;
    end;
end;
return v8;