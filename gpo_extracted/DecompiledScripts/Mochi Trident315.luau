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
        pull = false, 
        impale = false
    };
    return v10;
end;
v8.MochiTridentDrill = function(v11, v12) --[[ Line: 28 ]] --[[ Name: MochiTridentDrill ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v11.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.impale == false and _G.check:inspect(l_Character_0) == true then
        local v16 = v3.GetM("Mochi Trident Drill");
        local l_cd_0 = v16.cd;
        if _G.StamCheck("Mochi Trident Drill") == false then
            return;
        elseif v16.statreq and _G.MeetReq(v16.statreq) == false then
            return;
        else
            l_Cooldowns_0.impale = true;
            _G.canuse = false;
            local v18 = game.ReplicatedStorage.Events.Skill:InvokeServer("Mochi Trident Drill");
            local v19 = l_Character_0.Humanoid:LoadAnimation(script.drillWindup);
            v19:Play();
            v19:AdjustWeight(2);
            v19.Priority = Enum.AnimationPriority.Action3;
            l_Character_0.Humanoid.WalkSpeed = 4;
            _G.PauseAnim(v19, 0.12, 1);
            v19:AdjustSpeed(0);
            local v20 = tick();
            v11:ChargeSkill(v12, {
                Key = Enum.KeyCode.E, 
                CheckFunction = function() --[[ Line: 61 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_0 (copy)
                    if _G.check:inspect(l_Character_0) == false then
                        return true;
                    else
                        l_Character_0.Humanoid.WalkSpeed = 4;
                        return;
                    end;
                end, 
                EndFunction = function() --[[ Line: 68 ]] --[[ Name: endFunction ]]
                    -- upvalues: v11 (copy), l_Character_0 (copy), v20 (copy), v18 (copy)
                    if v11.Tool.Parent ~= l_Character_0 or tick() - v20 >= 3 or _G.check:inspect(l_Character_0) == false or v18 == nil then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v19:AdjustSpeed(1);
            task.wait(0.1);
            if v18 then
                v18:FireServer(l_Character_0.HumanoidRootPart.CFrame);
            end;
            task.wait(0.45);
            l_Character_0.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Mochi Trident Drill", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.impale = false;
        end;
    end;
end;
v8.MochiTridentThrow = function(v21, v22) --[[ Line: 96 ]] --[[ Name: MochiTridentThrow ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v21.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.pull == false and _G.check:inspect(l_Character_1) == true then
        local v26 = v3.GetM("Mochi Trident Throw");
        local l_cd_1 = v26.cd;
        if _G.StamCheck("Mochi Trident Throw") == false then
            return;
        elseif v26.statreq and _G.MeetReq(v26.statreq) == false then
            return;
        else
            _G.canuse = false;
            l_Cooldowns_1.pull = true;
            _G.FaceMouse = true;
            local v28 = game.ReplicatedStorage.Events.Skill:InvokeServer("Mochi Trident Throw");
            local v29 = l_Character_1.Humanoid.Animator:LoadAnimation(script.throw);
            v29:Play();
            v29:AdjustWeight(2);
            v29.Priority = Enum.AnimationPriority.Action3;
            _G.PauseAnim(v29, 0.57, 1);
            local v30 = tick();
            v21:ChargeSkill(v22, {
                Key = Enum.KeyCode.R, 
                CheckFunction = function() --[[ Line: 129 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_1 (copy)
                    if _G.check:inspect(l_Character_1) == false then
                        return true;
                    else
                        return;
                    end;
                end, 
                EndFunction = function() --[[ Line: 135 ]] --[[ Name: endFunction ]]
                    -- upvalues: v30 (copy)
                    if tick() - v30 >= 3 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            local l_Position_0 = _G.MouseCF.Position;
            _G.FaceMouse = false;
            l_Character_1.HumanoidRootPart.Anchored = true;
            l_Character_1.Humanoid.AutoRotate = false;
            v29:AdjustSpeed(1);
            task.wait(0.43000000000000005);
            l_Character_1.Humanoid.AutoRotate = false;
            local l_l_Character_1_FirstChild_0 = l_Character_1:FindFirstChild(script.Name .. "Sword");
            if v28 then
                local v33 = nil;
                if l_l_Character_1_FirstChild_0 then
                    v33 = l_l_Character_1_FirstChild_0:FindFirstChild("Blade");
                end;
                if v33 then
                    v33.Transparency = 1;
                end;
                v28:InvokeServer({
                    swordCFrame = l_l_Character_1_FirstChild_0 and l_l_Character_1_FirstChild_0.Blade.CFrame or l_Character_1.PrimaryPart.CFrame, 
                    aimPosition = l_Position_0
                });
                if v33 then
                    v33.Transparency = 0;
                end;
            end;
            task.wait(0.2);
            l_Character_1.HumanoidRootPart.Anchored = false;
            l_Character_1.Humanoid.AutoRotate = true;
            _G.canuse = true;
            _G.keysetup:cooldown("Mochi Trident Throw", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1.pull = false;
        end;
    end;
end;
return v8;