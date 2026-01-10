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
        slash = false, 
        flash = false
    };
    return v10;
end;
local _ = function(v11) --[[ Line: 28 ]] --[[ Name: knockback ]]
    task.spawn(function() --[[ Line: 29 ]]
        -- upvalues: v11 (copy)
        local l_CFrame_0 = v11.HumanoidRootPart.CFrame;
        local _, v14 = _G.raycast:cast(v11.HumanoidRootPart.CFrame.p, v11.HumanoidRootPart.CFrame.lookVector * -10, {
            workspace.Islands, 
            workspace.Ships, 
            workspace.Env
        });
        local l_magnitude_0 = (l_CFrame_0.p - v14).magnitude;
        if l_magnitude_0 > 1 then
            l_magnitude_0 = l_magnitude_0 - 1;
        end;
        _G.tween(v11.HumanoidRootPart, {
            0.15, 
            "Sine", 
            Enum.EasingDirection.Out, 
            0, 
            false, 
            0
        }, {
            CFrame = v11.HumanoidRootPart.CFrame * CFrame.new(0, 0, l_magnitude_0)
        });
    end);
end;
local function _(v17) --[[ Line: 40 ]] --[[ Name: checkWeapon ]]
    local l_v17_FirstChild_0 = v17:FindFirstChild(script.Name .. "Sword");
    local l_v17_FirstChild_1 = v17:FindFirstChild("Prestige " .. script.Name .. "Sword");
    if not l_v17_FirstChild_0 and not l_v17_FirstChild_1 then
        return nil;
    elseif l_v17_FirstChild_0 then
        return l_v17_FirstChild_0;
    else
        return l_v17_FirstChild_1;
    end;
end;
v8.FireworkRocket = function(v21, _) --[[ Line: 55 ]] --[[ Name: FireworkRocket ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v21.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.slash == false and _G.check:inspect(l_Character_0) == true then
        local v26 = v3.GetM("Firework Rocket");
        local l_cd_0 = v26.cd;
        if _G.StamCheck("Firework Rocket") == false then
            return;
        elseif v26.statreq and _G.MeetReq(v26.statreq) == false then
            return;
        else
            local l_l_Character_0_FirstChild_0 = l_Character_0:FindFirstChild(script.Name .. "Sword");
            local l_l_Character_0_FirstChild_1 = l_Character_0:FindFirstChild("Prestige " .. script.Name .. "Sword");
            local v30 = if not not l_l_Character_0_FirstChild_0 or l_l_Character_0_FirstChild_1 then l_l_Character_0_FirstChild_0 or l_l_Character_0_FirstChild_1 else nil;
            if v30 == nil then
                return;
            else
                l_Cooldowns_0.slash = true;
                _G.canuse = false;
                l_l_Character_0_FirstChild_0 = l_Character_0.Humanoid:LoadAnimation(script.shoot);
                l_l_Character_0_FirstChild_0:Play(0);
                l_l_Character_0_FirstChild_0.Priority = Enum.AnimationPriority.Action4;
                l_l_Character_0_FirstChild_0:AdjustWeight(5);
                l_Character_0.PrimaryPart.Anchored = true;
                l_l_Character_0_FirstChild_1 = v21:GetMouseCFrame();
                l_Character_0:SetPrimaryPartCFrame(CFrame.new(l_Character_0.PrimaryPart.Position, l_l_Character_0_FirstChild_1.p));
                task.wait(0.05);
                local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Firework Rocket", {
                    mouseCF = l_l_Character_0_FirstChild_1, 
                    startCF = v30.Blade.BackSmoke.WorldCFrame, 
                    charCF = l_Character_0.PrimaryPart.CFrame
                });
                task.spawn(function() --[[ Line: 29 ]]
                    -- upvalues: l_Character_0 (copy)
                    local l_CFrame_1 = l_Character_0.HumanoidRootPart.CFrame;
                    local _, v34 = _G.raycast:cast(l_Character_0.HumanoidRootPart.CFrame.p, l_Character_0.HumanoidRootPart.CFrame.lookVector * -10, {
                        workspace.Islands, 
                        workspace.Ships, 
                        workspace.Env
                    });
                    local l_magnitude_1 = (l_CFrame_1.p - v34).magnitude;
                    if l_magnitude_1 > 1 then
                        l_magnitude_1 = l_magnitude_1 - 1;
                    end;
                    _G.tween(l_Character_0.HumanoidRootPart, {
                        0.15, 
                        "Sine", 
                        Enum.EasingDirection.Out, 
                        0, 
                        false, 
                        0
                    }, {
                        CFrame = l_Character_0.HumanoidRootPart.CFrame * CFrame.new(0, 0, l_magnitude_1)
                    });
                end);
                task.wait(0.25);
                l_Character_0.PrimaryPart.Anchored = false;
                l_Character_0.Humanoid.AutoRotate = true;
                l_Character_0.Humanoid.WalkSpeed = 16;
                _G.canuse = true;
                _G.keysetup:cooldown("Firework Rocket", l_cd_0);
                _G.fw(l_cd_0);
                l_Cooldowns_0.slash = false;
            end;
        end;
    end;
end;
v8.SkyhighFireworkRocket = function(v36, _) --[[ Line: 102 ]] --[[ Name: SkyhighFireworkRocket ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v36.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.flash == false and _G.check:inspect(l_Character_1) == true then
        local v41 = v3.GetM("Skyhigh Firework Rocket");
        local l_cd_1 = v41.cd;
        if _G.StamCheck("Skyhigh Firework Rocket") == false then
            return;
        elseif v41.statreq and _G.MeetReq(v41.statreq) == false then
            return;
        else
            local l_l_Character_1_FirstChild_0 = l_Character_1:FindFirstChild(script.Name .. "Sword");
            local l_l_Character_1_FirstChild_1 = l_Character_1:FindFirstChild("Prestige " .. script.Name .. "Sword");
            local v45 = if not not l_l_Character_1_FirstChild_0 or l_l_Character_1_FirstChild_1 then l_l_Character_1_FirstChild_0 or l_l_Character_1_FirstChild_1 else nil;
            if v45 == nil then
                return;
            else
                l_Cooldowns_1.flash = true;
                _G.canuse = false;
                l_l_Character_1_FirstChild_0 = l_Character_1.Humanoid:LoadAnimation(script.shoot);
                l_l_Character_1_FirstChild_0:Play(0);
                l_l_Character_1_FirstChild_0.Priority = Enum.AnimationPriority.Action4;
                l_l_Character_1_FirstChild_0:AdjustWeight(5);
                l_Character_1.PrimaryPart.Anchored = true;
                l_l_Character_1_FirstChild_1 = v36:GetMouseCFrame();
                l_Character_1:SetPrimaryPartCFrame(CFrame.new(l_Character_1.PrimaryPart.Position, l_l_Character_1_FirstChild_1.p));
                task.wait(0.05);
                local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Skyhigh Firework Rocket", {
                    mouseCF = l_l_Character_1_FirstChild_1, 
                    startCF = v45.Blade.BackSmoke.WorldCFrame, 
                    charCF = l_Character_1.PrimaryPart.CFrame
                });
                task.spawn(function() --[[ Line: 29 ]]
                    -- upvalues: l_Character_1 (copy)
                    local l_CFrame_2 = l_Character_1.HumanoidRootPart.CFrame;
                    local _, v49 = _G.raycast:cast(l_Character_1.HumanoidRootPart.CFrame.p, l_Character_1.HumanoidRootPart.CFrame.lookVector * -10, {
                        workspace.Islands, 
                        workspace.Ships, 
                        workspace.Env
                    });
                    local l_magnitude_2 = (l_CFrame_2.p - v49).magnitude;
                    if l_magnitude_2 > 1 then
                        l_magnitude_2 = l_magnitude_2 - 1;
                    end;
                    _G.tween(l_Character_1.HumanoidRootPart, {
                        0.15, 
                        "Sine", 
                        Enum.EasingDirection.Out, 
                        0, 
                        false, 
                        0
                    }, {
                        CFrame = l_Character_1.HumanoidRootPart.CFrame * CFrame.new(0, 0, l_magnitude_2)
                    });
                end);
                task.wait(0.25);
                l_Character_1.PrimaryPart.Anchored = false;
                _G.canuse = true;
                _G.keysetup:cooldown("Skyhigh Firework Rocket", l_cd_1);
                _G.fw(l_cd_1);
                l_Cooldowns_1.flash = false;
            end;
        end;
    end;
end;
return v8;