local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local v4 = require(game.ReplicatedStorage.Modules.Skills);
local v5 = require(script.Parent.Parent.MobileBase);
local l_PlayerModule_0 = require(l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule"));
local _ = l_LocalPlayer_0:GetMouse();
local _ = l_PlayerModule_0:GetControls();
local v9 = setmetatable({}, v5);
v9.__index = v9;
v9.new = function(_) --[[ Line: 21 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy), v9 (copy), l_LocalPlayer_0 (copy)
    local v11 = setmetatable(v5.new(script.Name), v9);
    v11.Cooldowns = {
        smash = false, 
        float = false
    };
    v11.PlayAnimation = function(v12) --[[ Line: 26 ]]
        -- upvalues: l_LocalPlayer_0 (ref)
        local l_Character_0 = l_LocalPlayer_0.Character;
        local l_Humanoid_0 = l_Character_0.Humanoid;
        local l_l_Character_0_FirstChild_0 = l_Character_0:FindFirstChild(script.Name .. "Sword");
        local v16 = {};
        table.insert(v16, l_Humanoid_0:LoadAnimation(v12));
        if l_l_Character_0_FirstChild_0 then
            local l_AnimationController_0 = l_l_Character_0_FirstChild_0:FindFirstChild("AnimationController");
            if l_AnimationController_0 then
                table.insert(v16, l_AnimationController_0:LoadAnimation(v12));
            end;
        end;
        local v24 = {
            Stop = function(_) --[[ Line: 43 ]] --[[ Name: Stop ]]
                -- upvalues: v16 (copy)
                for v19 = 1, #v16 do
                    v16[v19]:Stop();
                end;
            end, 
            PauseAnim = function(_, ...) --[[ Line: 49 ]] --[[ Name: PauseAnim ]]
                -- upvalues: v16 (copy)
                for v21 = 1, #v16 do
                    _G.PauseAnim(v16[v21], ...);
                end;
            end, 
            AdjustSpeed = function(_, ...) --[[ Line: 55 ]] --[[ Name: AdjustSpeed ]]
                -- upvalues: v16 (copy)
                for v23 = 1, #v16 do
                    v16[v23]:AdjustSpeed(...);
                end;
            end
        };
        for v25 = 1, #v16 do
            v16[v25]:Play();
        end;
        return v24;
    end;
    return v11;
end;
v9.UmbrellaThrust = function(v26, v27) --[[ Line: 71 ]] --[[ Name: UmbrellaThrust ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v4 (copy)
    local l_Cooldowns_0 = v26.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.smash == false and _G.check:inspect(l_Character_1) == true then
        local v31 = v4.GetM("Umbrella Thrust");
        local l_cd_0 = v31.cd;
        if _G.StamCheck("Umbrella Thrust") == false then
            return;
        elseif v31.statreq and _G.MeetReq(v31.statreq) == false then
            return;
        else
            _G.canuse = false;
            l_Cooldowns_0.smash = true;
            local v33 = game.ReplicatedStorage.Events.Skill:InvokeServer("Umbrella Thrust");
            local v34 = v26.PlayAnimation(script.thrust);
            v34:PauseAnim(0.5, 1);
            v26:ChargeSkill(v27, {
                Key = Enum.KeyCode.R, 
                CheckFunction = function() --[[ Line: 100 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_1 (copy)
                    l_Character_1.Humanoid.WalkSpeed = 4;
                end, 
                EndFunction = function() --[[ Line: 109 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_1 (copy)
                    if l_Character_1:FindFirstChild(script.Name) == nil then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v34:AdjustSpeed(1);
            l_Character_1.Humanoid.WalkSpeed = 0;
            if v33 then
                local _ = nil;
                v33:InvokeServer(l_Character_1.HumanoidRootPart.CFrame);
            end;
            v34:Stop();
            l_Character_1.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Umbrella Thrust", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.smash = false;
        end;
    end;
end;
v9.UmbrellaFloat = function(v36, v37) --[[ Line: 139 ]] --[[ Name: UmbrellaFloat ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v4 (copy), l_TweenService_0 (copy)
    local l_Cooldowns_1 = v36.Cooldowns;
    local l_Character_2 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.float == false and _G.check:inspect(l_Character_2) == true then
        local v41 = v4.GetM("Umbrella Float");
        local l_cd_1 = v41.cd;
        if _G.StamCheck("Umbrella Float") == false then
            return;
        elseif v41.statreq and _G.MeetReq(v41.statreq) == false then
            return;
        else
            _G.canuse = false;
            l_Cooldowns_1.float = true;
            local _ = tick();
            local v44 = v36.PlayAnimation(script.floatStartup);
            local l_PrimaryPart_0 = l_Character_2.PrimaryPart;
            local v46 = Vector3.new(0, game.Workspace.Gravity, 0) * l_PrimaryPart_0.AssemblyMass;
            if v46 ~= v46 then
                v46 = Vector3.new(0, game.Workspace.Gravity, 0) * 20;
            end;
            local v47 = nil;
            do
                local l_v47_0 = v47;
                task.spawn(function() --[[ Line: 171 ]]
                    -- upvalues: l_v47_0 (ref)
                    l_v47_0 = game.ReplicatedStorage.Events.Skill:InvokeServer("Umbrella Float");
                end);
                local l_BodyVelocity_0 = Instance.new("BodyVelocity");
                l_BodyVelocity_0.MaxForce = Vector3.new(0, 99999997952, 0, 0);
                l_BodyVelocity_0.Name = "geppo";
                l_BodyVelocity_0.Parent = l_Character_2.PrimaryPart;
                l_BodyVelocity_0.Velocity = Vector3.new(0, 5, 0, 0);
                local v50 = script.LinearVelocity:Clone();
                v50.Attachment0 = l_PrimaryPart_0:FindFirstChild("RootRigAttachment");
                v50.Parent = l_PrimaryPart_0;
                v50.VectorVelocity = Vector3.new(0, 2, 0, 0);
                l_TweenService_0:Create(v50, TweenInfo.new(0.48000000000000004, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    VectorVelocity = Vector3.new(0, _G.ScaleWithHPChar(l_Character_2, 50), 0)
                }):Play();
                task.delay(0.537, function() --[[ Line: 188 ]]
                    -- upvalues: l_BodyVelocity_0 (copy)
                    l_BodyVelocity_0.MaxForce = Vector3.new();
                end);
                task.wait(0.437);
                local _ = l_Character_2.Humanoid;
                local l_PrimaryPart_1 = l_Character_2.PrimaryPart;
                l_PrimaryPart_1.AssemblyLinearVelocity = l_PrimaryPart_1.AssemblyLinearVelocity + Vector3.new(0, 50, 0, 0);
                task.wait(0.48000000000000004);
                v44:Stop();
                l_PrimaryPart_1 = tick();
                local v53 = v36.PlayAnimation(script.floatLoop);
                v36:ChargeSkill(v37, {
                    Key = Enum.KeyCode.E, 
                    CheckFunction = function(_) --[[ Line: 205 ]] --[[ Name: checkFunction ]]
                        -- upvalues: l_Character_2 (copy)
                        l_Character_2.Humanoid.WalkSpeed = 35;
                        if l_Character_2.PrimaryPart.AssemblyLinearVelocity.Y <= 2 then
                            local l_PrimaryPart_2 = l_Character_2.PrimaryPart;
                            l_PrimaryPart_2.AssemblyLinearVelocity = l_PrimaryPart_2.AssemblyLinearVelocity + Vector3.new(0, 2, 0, 0);
                        end;
                    end, 
                    EndFunction = function() --[[ Line: 215 ]] --[[ Name: endFunction ]]
                        -- upvalues: l_Character_2 (copy), l_PrimaryPart_1 (copy), v53 (copy)
                        if l_Character_2:FindFirstChild(script.Name) == nil then
                            return true;
                        elseif tick() - l_PrimaryPart_1 >= 4 then
                            return true;
                        elseif _G.check:inspect(l_Character_2) == false then
                            v53:Stop();
                            return true;
                        else
                            return;
                        end;
                    end
                });
                l_BodyVelocity_0:Destroy();
                v53:Stop();
                v50:Destroy();
                if l_v47_0 then
                    l_v47_0:InvokeServer();
                end;
                l_Character_2.Humanoid.WalkSpeed = 16;
                _G.canuse = true;
                _G.keysetup:cooldown("Umbrella Float", l_cd_1);
                _G.fw(l_cd_1);
                l_Cooldowns_1.float = false;
            end;
        end;
    end;
end;
return v9;