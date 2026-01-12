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
        smash = false, 
        spin = false
    };
    return v10;
end;
v8.EggsplosiveRift = function(v11, v12) --[[ Line: 28 ]] --[[ Name: EggsplosiveRift ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v11.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.smash == false and _G.check:inspect(l_Character_0) == true then
        local v16 = v3.GetM("Eggsplosive Rift");
        local l_cd_0 = v16.cd;
        if _G.StamCheck("Eggsplosive Rift") == false then
            return;
        elseif v16.statreq and _G.MeetReq(v16.statreq) == false then
            return;
        else
            _G.FaceMouse = true;
            _G.mouseLevel = true;
            _G.canuse = false;
            l_Cooldowns_0.smash = true;
            local v18 = game.ReplicatedStorage.Events.Skill:InvokeServer("Eggsplosive Rift");
            local v19 = l_Character_0.Humanoid.Animator:LoadAnimation(script.smash);
            v19:Play();
            v19:AdjustWeight(2);
            _G.PauseAnim(v19, 0.48, 1);
            v11:ChargeSkill(v12, {
                Key = Enum.KeyCode.E, 
                CheckFunction = function() --[[ Line: 57 ]] --[[ Name: checkFunction ]]

                end, 
                EndFunction = function() --[[ Line: 62 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_0 (copy), v19 (copy)
                    if l_Character_0:FindFirstChild(script.Name) == nil then
                        return true;
                    elseif _G.check:inspect(l_Character_0) == false then
                        v19:Stop();
                        return true;
                    else
                        return;
                    end;
                end
            });
            v19:AdjustSpeed(1);
            l_Character_0.PrimaryPart.Anchored = true;
            _G.FaceMouse = false;
            _G.mouseLevel = nil;
            if v18 then
                local v20 = nil;
                v20 = l_Character_0.HumanoidRootPart.CFrame;
                if _G.check:inspect(l_Character_0) == true then
                    v18:InvokeServer({
                        cf = v20, 
                        targetPosition = v11:GetMouseCFrame().Position
                    });
                else
                    v18:InvokeServer({
                        Cancel = true
                    });
                end;
            end;
            task.wait(0.3);
            v19:Stop(0.25);
            l_Character_0.PrimaryPart.Anchored = false;
            _G.canuse = true;
            _G.keysetup:cooldown("Eggsplosive Rift", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.smash = false;
        end;
    end;
end;
v8.Eggsweeper = function(v21, v22) --[[ Line: 107 ]] --[[ Name: Eggsweeper ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v21.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local v25 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.spin == false and _G.check:inspect(l_Character_1) == true then
        local v26 = v3.GetM("Eggsweeper");
        local l_cd_1 = v26.cd;
        if _G.StamCheck("Eggsweeper") == false then
            return;
        elseif v26.statreq and _G.MeetReq(v26.statreq) == false then
            return;
        else
            l_Cooldowns_1.spin = true;
            _G.canuse = false;
            local v28 = game.ReplicatedStorage.Events.Skill:InvokeServer("Eggsweeper");
            local v29 = tick();
            local v30 = Instance.new("BodyVelocity", l_Character_1.HumanoidRootPart);
            v30.MaxForce = Vector3.new(1000000, 0, 1000000, 0);
            v21:ChargeSkill(v22, {
                Key = Enum.KeyCode.R, 
                CheckFunction = function() --[[ Line: 131 ]] --[[ Name: checkFunction ]]
                    -- upvalues: v25 (copy), l_Character_1 (copy), v30 (copy)
                    if v25.Stamina.Value <= 0 or l_Character_1:GetAttribute("BloSpin") == nil then
                        return true;
                    else
                        v30.Velocity = l_Character_1.HumanoidRootPart.CFrame.lookVector * 35;
                        return;
                    end;
                end, 
                EndFunction = function() --[[ Line: 139 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_1 (copy), v29 (copy)
                    if l_Character_1:FindFirstChild(script.Name) == nil or tick() - v29 >= 3 or l_Character_1:GetAttribute("BloSpin") == nil then
                        return true;
                    else
                        return;
                    end;
                end, 
                IgnoreInstantCastSetting = true
            });
            v30:Destroy();
            if v28 then
                v28:FireServer();
            end;
            l_Character_1.Humanoid.WalkSpeed = 0;
            task.wait(1);
            l_Character_1.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Eggsweeper", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1.spin = false;
        end;
    end;
end;
return v8;