local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("RunService");
local _ = game:GetService("ReplicatedStorage");
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
        FlameChompers = false, 
        deathRocket = false
    };
    return v10;
end;
v8.MonkeyChompers = function(v11, v12) --[[ Line: 28 ]] --[[ Name: MonkeyChompers ]]
    -- upvalues: l_LocalPlayer_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v11.Cooldowns;
    local _ = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_0 = l_LocalPlayer_0.Character;
    if l_Cooldowns_0.FlameChompers == false and _G.check:inspect(l_Character_0) == true then
        local v16 = v3.GetM("Monkey Chompers");
        local l_cd_0 = v16.cd;
        if _G.StamCheck("Monkey Chompers") == false then
            return;
        elseif v16.statreq and _G.MeetReq(v16.statreq) == false then
            return;
        else
            l_Cooldowns_0.FlameChompers = true;
            _G.canuse = false;
            l_Character_0.Humanoid.WalkSpeed = 10;
            local v18 = l_Character_0.Humanoid.Animator:LoadAnimation(script.strikeWindup);
            v18:Play(0);
            v18:AdjustWeight(2);
            _G.PauseAnim(v18, 0.33, 1.3);
            local v19 = tick();
            v11:ChargeSkill(v12, {
                Key = Enum.KeyCode.E, 
                EndFunction = function() --[[ Line: 56 ]] --[[ Name: endFunction2 ]]
                    -- upvalues: l_Character_0 (copy), v11 (copy), v19 (copy)
                    l_Character_0.Humanoid.WalkSpeed = 10;
                    if v11.Tool.Parent ~= l_Character_0 or tick() - v19 >= 5 or _G.check:inspect(l_Character_0) == false then
                        return true;
                    else
                        return;
                    end;
                end, 
                IgnoreInstantCastSetting = true
            });
            v18:AdjustSpeed(1.3);
            task.wait(0.05384615384615385);
            local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Monkey Chompers", l_Character_0.HumanoidRootPart.CFrame);
            l_Character_0.Humanoid.WalkSpeed = 16;
            l_Character_0.Humanoid.AutoRotate = true;
            _G.canuse = true;
            _G.keysetup:cooldown("Monkey Chompers", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.FlameChompers = false;
        end;
    end;
end;
v8["SUPERMEGADEATHROCKET!"] = function(v21, v22) --[[ Line: 83 ]]
    -- upvalues: l_LocalPlayer_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v21.Cooldowns;
    local _ = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_1 = l_LocalPlayer_0.Character;
    if l_Cooldowns_1.deathRocket == false and _G.check:inspect(l_Character_1) == true then
        local v26 = v3.GetM("SUPER MEGA DEATH ROCKET!");
        local l_cd_1 = v26.cd;
        if _G.StamCheck("SUPER MEGA DEATH ROCKET!") == false then
            return;
        elseif v26.statreq and _G.MeetReq(v26.statreq) == false then
            return;
        elseif l_Character_1:FindFirstChild(script.Name .. "Sword") == nil then
            return;
        else
            l_Cooldowns_1.deathRocket = true;
            _G.canuse = false;
            _G.FaceMouse = true;
            local v28 = game.ReplicatedStorage.Events.Skill:InvokeServer("SUPER MEGA DEATH ROCKET!", {
                cf = l_Character_1.HumanoidRootPart.CFrame
            });
            local v29 = tick();
            v21:ChargeSkill(v22, {
                Key = Enum.KeyCode.R, 
                EndFunction = function() --[[ Line: 108 ]] --[[ Name: endFunction2 ]]
                    -- upvalues: v21 (copy), l_Character_1 (copy), v29 (copy)
                    if v21.Tool.Parent ~= l_Character_1 or tick() - v29 >= 5 or l_Character_1.Parent ~= workspace.PlayerCharacters then
                        return true;
                    else
                        return;
                    end;
                end, 
                HoldDuration = 1, 
                IgnoreInstantCastSetting = true
            });
            local l_Position_0 = l_Character_1.PrimaryPart.Position;
            local l_l_Character_1_FirstChild_0 = l_Character_1:FindFirstChild(script.Name .. "Sword");
            if l_l_Character_1_FirstChild_0 then
                local l_l_l_Character_1_FirstChild_0_FirstChild_0 = l_l_Character_1_FirstChild_0:FindFirstChild("mouth", true);
                if l_l_l_Character_1_FirstChild_0_FirstChild_0 then
                    l_Position_0 = l_l_l_Character_1_FirstChild_0_FirstChild_0.WorldPosition;
                end;
            end;
            if v28 then
                v28:FireServer(l_Position_0, _G.MouseCF);
            end;
            l_Character_1.PrimaryPart.Anchored = true;
            _G.FaceMouse = false;
            task.wait(1);
            l_Character_1.PrimaryPart.Anchored = false;
            _G.canuse = true;
            _G.keysetup:cooldown("SUPER MEGA DEATH ROCKET!", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1.deathRocket = false;
        end;
    end;
end;
return v8;