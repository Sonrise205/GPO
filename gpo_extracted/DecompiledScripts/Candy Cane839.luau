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
        freeze = false
    };
    return v10;
end;
v8.SweetTreat = function(v11, _) --[[ Line: 28 ]] --[[ Name: SweetTreat ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v11.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.heal == false and _G.check:inspect(l_Character_0) == true then
        local v16 = v3.GetM("Sweet Treat");
        local l_cd_0 = v16.cd;
        if _G.StamCheck("Sweet Treat") == false then
            return;
        elseif v16.statreq and _G.MeetReq(v16.statreq) == false then
            return;
        else
            _G.canuse = false;
            l_Cooldowns_0.heal = true;
            game.ReplicatedStorage.Events.Skill:InvokeServer("Sweet Treat");
            _G.canuse = true;
            _G.keysetup:cooldown("Sweet Treat", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.heal = false;
        end;
    end;
end;
v8.FlashFreeze = function(v18, v19) --[[ Line: 54 ]] --[[ Name: FlashFreeze ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v18.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.freeze == false and _G.check:inspect(l_Character_1) == true then
        local v23 = v3.GetM("Flash Freeze");
        local l_cd_1 = v23.cd;
        if _G.StamCheck("Flash Freeze") == false then
            return;
        elseif v23.statreq and _G.MeetReq(v23.statreq) == false then
            return;
        else
            _G.canuse = false;
            local v25 = l_Character_1.Humanoid.Animator:LoadAnimation(script.freeze);
            v25:Play();
            v25:AdjustWeight(2);
            l_Character_1.Humanoid.WalkSpeed = 4;
            _G.PauseAnim(v25, 0.4, 1);
            local function v26() --[[ Line: 76 ]] --[[ Name: checkFunction ]]
                -- upvalues: l_Character_1 (copy), v25 (copy)
                if _G.check:inspect(l_Character_1) == false then
                    v25:Stop();
                    return true;
                else
                    return;
                end;
            end;
            local function v27() --[[ Line: 83 ]] --[[ Name: endFunction ]]
                -- upvalues: l_Character_1 (copy)
                if l_Character_1:FindFirstChild(script.Name) == nil then
                    return true;
                else
                    return;
                end;
            end;
            l_Cooldowns_1.freeze = true;
            v18:ChargeSkill(v19, {
                Key = Enum.KeyCode.R, 
                CheckFunction = v26, 
                EndFunction = v27
            });
            v25:AdjustSpeed(1);
            task.wait(0.2);
            game.ReplicatedStorage.Events.Skill:InvokeServer("Flash Freeze");
            task.wait(0.2);
            l_Character_1.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Flash Freeze", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1.freeze = false;
        end;
    end;
end;
return v8;