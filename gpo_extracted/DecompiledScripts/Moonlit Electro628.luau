local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("RunService");
local v2 = require(game.ReplicatedStorage.Modules.Skills);
local v3 = require(script.Parent.Parent.MobileBase);
local _ = require(l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule"));
local _ = l_LocalPlayer_0:GetMouse();
local v6 = setmetatable({}, v3);
v6.__index = v6;
v6.new = function(_) --[[ Line: 17 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v6 (copy)
    local v8 = setmetatable(v3.new(script.Name), v6);
    v8.Cooldowns = {
        blows = false, 
        wind = false, 
        tackle = false, 
        drill = false, 
        bite = false, 
        ult = false
    };
    return v8;
end;
v6.ThunderousRoar = function(v9, v10) --[[ Line: 26 ]] --[[ Name: ThunderousRoar ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_0 = v9.Cooldowns;
    local v12 = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_0 = l_LocalPlayer_0.Character;
    if l_Cooldowns_0.blows == false and _G.StamCheck("Thunderous Roar") == true and _G.canuse == true and _G.check:inspect(l_Character_0) == true then
        local v14 = v2.GetM("Thunderous Roar");
        local l_cd_0 = v14.cd;
        if _G.StamCheck("Thunderous Roar") == false then
            return;
        elseif v14.statreq and _G.MeetReq(v14.statreq) == false then
            return;
        else
            _G.canuse = false;
            l_Cooldowns_0.blows = true;
            local v16 = tick();
            _G.FaceMouse = true;
            _G.mouseLevel = true;
            local v17 = game.ReplicatedStorage.Events.Skill:InvokeServer("Thunderous Roar", {
                cf = l_Character_0.PrimaryPart.CFrame
            });
            v9:ChargeSkill(v10, {
                Key = Enum.KeyCode.E, 
                CheckFunction = function() --[[ Line: 49 ]] --[[ Name: checkFunction ]]

                end, 
                EndFunction = function() --[[ Line: 53 ]] --[[ Name: endFunction ]]
                    -- upvalues: v9 (copy), l_Character_0 (copy), v16 (copy), v12 (copy)
                    if v9.Tool.Parent ~= l_Character_0 or tick() - v16 >= 10 or l_Character_0.Parent == nil or l_Character_0.Parent ~= workspace.PlayerCharacters or v12.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end, 
                HoldDuration = 0.5
            });
            l_Character_0.HumanoidRootPart.Anchored = true;
            _G.FaceMouse = false;
            _G.mouseLevel = false;
            if v17 then
                v17:FireServer(l_Character_0.PrimaryPart.CFrame);
            end;
            task.wait(0.9);
            l_Character_0.HumanoidRootPart.Anchored = false;
            _G.canuse = true;
            _G.keysetup:cooldown("Thunderous Roar", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.blows = false;
        end;
    end;
end;
v6.ThunderousWhirlwind = function(v18, _) --[[ Line: 83 ]] --[[ Name: ThunderousWhirlwind ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_1 = v18.Cooldowns;
    local _ = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_1 = l_LocalPlayer_0.Character;
    if l_Cooldowns_1.wind == false and _G.StamCheck("Thunderous Whirlwind") == true and _G.canuse == true and _G.check:inspect(l_Character_1) == true then
        local v23 = v2.GetM("Thunderous Whirlwind");
        local l_cd_1 = v23.cd;
        if _G.StamCheck("Thunderous Whirlwind") == false then
            return;
        elseif v23.statreq and _G.MeetReq(v23.statreq) == false then
            return;
        else
            _G.canuse = false;
            l_Cooldowns_1.wind = true;
            local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Thunderous Whirlwind", {
                Start = l_Character_1.PrimaryPart.CFrame, 
                Goal = v18:GetMouseCFrame()
            });
            task.wait(0.1);
            _G.canuse = true;
            _G.keysetup:cooldown("Thunderous Whirlwind", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1.wind = false;
        end;
    end;
end;
v6.ThunderousTackle = function(v26, v27) --[[ Line: 109 ]] --[[ Name: ThunderousTackle ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_2 = v26.Cooldowns;
    local v29 = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_2 = l_LocalPlayer_0.Character;
    if l_Cooldowns_2.tackle == false and _G.StamCheck("Thunderous Tackle") == true and _G.canuse == true and _G.check:inspect(l_Character_2) == true then
        local v31 = v2.GetM("Thunderous Tackle");
        local l_cd_2 = v31.cd;
        if _G.StamCheck("Thunderous Tackle") == false then
            return;
        elseif v31.statreq and _G.MeetReq(v31.statreq) == false then
            return;
        else
            l_Cooldowns_2.tackle = true;
            local v33 = tick();
            _G.FaceMouse = true;
            _G.canuse = false;
            local v34 = l_Character_2.Humanoid:LoadAnimation(script.Tackle);
            v34:Play();
            v34:AdjustSpeed(0);
            local v35 = game.ReplicatedStorage.Events.Skill:InvokeServer("Thunderous Tackle", {
                cf = l_Character_2.PrimaryPart.CFrame
            });
            v26:ChargeSkill(v27, {
                Key = Enum.KeyCode.T, 
                CheckFunction = function() --[[ Line: 135 ]] --[[ Name: checkFunction ]]

                end, 
                EndFunction = function() --[[ Line: 139 ]] --[[ Name: endFunction ]]
                    -- upvalues: v26 (copy), l_Character_2 (copy), v33 (copy), v29 (copy)
                    if v26.Tool.Parent ~= l_Character_2 or tick() - v33 >= 10 or l_Character_2.Parent == nil or l_Character_2.Parent ~= workspace.PlayerCharacters or v29.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            l_Character_2.HumanoidRootPart.Anchored = true;
            _G.FaceMouse = false;
            v34:AdjustSpeed(3);
            if v35 then
                v35:InvokeServer(v26:GetMouseCFrame());
            end;
            task.wait(0.75);
            l_Character_2.HumanoidRootPart.Anchored = false;
            _G.canuse = true;
            _G.keysetup:cooldown("Thunderous Tackle", l_cd_2);
            _G.fw(l_cd_2);
            l_Cooldowns_2.tackle = false;
        end;
    end;
end;
v6.ThunderousDrill = function(v36, _) --[[ Line: 169 ]] --[[ Name: ThunderousDrill ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_3 = v36.Cooldowns;
    local _ = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_3 = l_LocalPlayer_0.Character;
    if l_Cooldowns_3.drill == false and _G.StamCheck("Thunderous Drill") == true and _G.canuse == true and _G.check:inspect(l_Character_3) == true then
        local v41 = v2.GetM("Thunderous Drill");
        local l_cd_3 = v41.cd;
        if _G.StamCheck("Thunderous Drill") == false then
            return;
        elseif v41.statreq and _G.MeetReq(v41.statreq) == false then
            return;
        else
            _G.canuse = false;
            l_Cooldowns_3.drill = true;
            local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Thunderous Drill", {
                Start = l_Character_3.PrimaryPart.CFrame, 
                Goal = v36:GetMouseCFrame()
            });
            _G.canuse = true;
            _G.keysetup:cooldown("Thunderous Drill", l_cd_3);
            _G.fw(l_cd_3);
            l_Cooldowns_3.drill = false;
        end;
    end;
end;
v6.ThunderousBite = function(v44, v45) --[[ Line: 195 ]] --[[ Name: ThunderousBite ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_4 = v44.Cooldowns;
    local v47 = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_4 = l_LocalPlayer_0.Character;
    if l_Cooldowns_4.bite == false and _G.StamCheck("Thunderous Bite") == true and _G.canuse == true and _G.check:inspect(l_Character_4) == true then
        local v49 = v2.GetM("Thunderous Bite");
        local l_cd_4 = v49.cd;
        if _G.StamCheck("Thunderous Bite") == false then
            return;
        elseif v49.statreq and _G.MeetReq(v49.statreq) == false then
            return;
        else
            l_Cooldowns_4.bite = true;
            local v51 = tick();
            _G.FaceMouse = true;
            _G.mouseLevel = true;
            _G.canuse = false;
            local v52 = l_Character_4.Humanoid:LoadAnimation(script.dash);
            v52:Play();
            v52:AdjustSpeed(0);
            local v53 = game.ReplicatedStorage.Events.Skill:InvokeServer("Thunderous Bite", {
                cf = l_Character_4.PrimaryPart.CFrame
            });
            local v54 = nil;
            local v55 = nil;
            if v53 then
                local v56, v57 = unpack(v53);
                v54 = v56;
                v55 = v57;
            end;
            _G.PauseAnim(v52, 0.2, 1.5);
            v44:ChargeSkill(v45, {
                Key = Enum.KeyCode.X, 
                CheckFunction = function() --[[ Line: 227 ]] --[[ Name: checkFunction ]]

                end, 
                EndFunction = function() --[[ Line: 231 ]] --[[ Name: endFunction ]]
                    -- upvalues: v44 (copy), l_Character_4 (copy), v51 (copy), v47 (copy)
                    if v44.Tool.Parent ~= l_Character_4 or tick() - v51 >= 10 or l_Character_4.Parent == nil or l_Character_4.Parent ~= workspace.PlayerCharacters or v47.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            _G.FaceMouse = false;
            _G.mouseLevel = false;
            l_Character_4.PrimaryPart.Anchored = true;
            v52:AdjustSpeed(1.5);
            l_Character_4.Humanoid.AutoRotate = false;
            local l_CFrame_0 = l_Character_4.PrimaryPart.CFrame;
            if v54 then
                v54:FireServer(l_CFrame_0, l_CFrame_0 * CFrame.new(0, 0, -100));
            end;
            task.wait(0.13333333333333333);
            local l_LinearVelocity_0 = Instance.new("LinearVelocity");
            l_LinearVelocity_0.Attachment0 = l_Character_4.PrimaryPart.RootRigAttachment;
            l_LinearVelocity_0.MaxForce = 100000000000;
            l_LinearVelocity_0.VelocityConstraintMode = Enum.VelocityConstraintMode.Vector;
            l_LinearVelocity_0.VectorVelocity = l_CFrame_0.LookVector * 300;
            l_LinearVelocity_0.RelativeTo = Enum.ActuatorRelativeTo.World;
            l_LinearVelocity_0.Parent = l_Character_4;
            local l_AlignOrientation_0 = Instance.new("AlignOrientation");
            l_AlignOrientation_0.Attachment0 = l_Character_4.PrimaryPart.RootRigAttachment;
            l_AlignOrientation_0.Mode = 0;
            l_AlignOrientation_0.CFrame = l_CFrame_0;
            l_AlignOrientation_0.Responsiveness = 100;
            l_AlignOrientation_0.MaxTorque = 100000000000;
            l_AlignOrientation_0.Parent = l_Character_4;
            _G.tween(l_LinearVelocity_0, {
                0.25, 
                "Linear", 
                Enum.EasingDirection.Out
            }, {
                VectorVelocity = Vector3.new(0, 0, 0, 0)
            });
            _G.destroy(l_LinearVelocity_0, 0.5);
            _G.destroy(l_AlignOrientation_0, 0.75);
            l_Character_4.PrimaryPart.Anchored = false;
            l_Character_4.PrimaryPart.Velocity = Vector3.new();
            l_Character_4.Humanoid.AutoRotate = false;
            local v61 = nil;
            local _ = false;
            do
                local l_v55_0, l_v61_0 = v55, v61;
                local function v67(v65) --[[ Line: 280 ]] --[[ Name: hitfound ]]
                    -- upvalues: l_v55_0 (ref), l_Character_4 (copy), l_LinearVelocity_0 (copy), l_AlignOrientation_0 (copy), v52 (copy), l_v61_0 (ref)
                    if l_v55_0 then
                        local v66 = l_Character_4.PrimaryPart.CFrame * CFrame.new(0, 0, -5);
                        l_LinearVelocity_0:Destroy();
                        l_AlignOrientation_0:Destroy();
                        l_Character_4.PrimaryPart.Anchored = true;
                        v52:Stop();
                        l_v55_0:FireServer(v65.Parent, CFrame.new(l_Character_4.PrimaryPart.Position, (Vector3.new(v66.X, l_Character_4.PrimaryPart.Position.Y, v66.Z))));
                        l_v61_0 = true;
                    end;
                end;
                _G.hitbox:start(l_Character_4, Vector3.new(8, 8, 8, 0), 0.5, CFrame.new(0, 0, 0), v67);
                task.wait(0.5);
                if l_Character_4:FindFirstChild("GrabTag") == nil then
                    l_Character_4.Humanoid.AutoRotate = true;
                end;
                _G.canuse = true;
                _G.keysetup:cooldown("Thunderous Bite", l_cd_4);
                _G.fw(l_cd_4);
                l_Cooldowns_4.bite = false;
            end;
        end;
    end;
end;
v6.ThunderousBlitz = function(v68, v69) --[[ Line: 307 ]] --[[ Name: ThunderousBlitz ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_5 = v68.Cooldowns;
    local v71 = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_5 = l_LocalPlayer_0.Character;
    if l_Cooldowns_5.ult == false and _G.StamCheck("Thunderous Blitz") == true and _G.canuse == true and _G.check:inspect(l_Character_5) == true then
        local v73 = v2.GetM("Thunderous Blitz");
        local l_cd_5 = v73.cd;
        if _G.StamCheck("Thunderous Blitz") == false then
            return;
        elseif v73.statreq and _G.MeetReq(v73.statreq) == false then
            return;
        else
            _G.canuse = false;
            l_Cooldowns_5.ult = true;
            local v75 = l_Character_5.Humanoid:LoadAnimation(script.ultWindup);
            v75:Play();
            l_Character_5.Humanoid.WalkSpeed = 4;
            local v76 = tick();
            _G.PauseAnim(v75, 0.4, 1.5);
            v68:ChargeSkill(v69, {
                Key = Enum.KeyCode.C, 
                CheckFunction = function() --[[ Line: 338 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_5 (copy)
                    l_Character_5.Humanoid.WalkSpeed = 4;
                end, 
                EndFunction = function() --[[ Line: 342 ]] --[[ Name: endFunction ]]
                    -- upvalues: v68 (copy), l_Character_5 (copy), v76 (copy), v71 (copy)
                    if v68.Tool.Parent ~= l_Character_5 or tick() - v76 >= 10 or l_Character_5.Parent == nil or l_Character_5.Parent ~= workspace.PlayerCharacters or v71.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v75:Stop();
            local v77 = l_Character_5.Humanoid:LoadAnimation(script.dash);
            v77:Play(0);
            v77:AdjustWeight(5);
            v77:AdjustSpeed(4);
            local v78 = Ray.new(l_Character_5.HumanoidRootPart.Position, l_Character_5.PrimaryPart.CFrame.lookVector * 15);
            local _, v80 = _G.raycastWhitelist(v78, {
                workspace.Islands, 
                workspace.Ships, 
                workspace.Env
            });
            local l_magnitude_0 = (l_Character_5.HumanoidRootPart.Position - v80).magnitude;
            local l_CFrame_1 = l_Character_5.PrimaryPart.CFrame;
            l_Character_5.PrimaryPart.Anchored = true;
            l_Character_5:SetPrimaryPartCFrame(l_Character_5.PrimaryPart.CFrame * CFrame.new(0, 0, -l_magnitude_0));
            game.ReplicatedStorage.Events.Skill:InvokeServer("Thunderous Blitz", {
                l_CFrame_1, 
                l_Character_5.PrimaryPart.CFrame
            });
            l_Character_5.Humanoid.AutoRotate = false;
            task.wait(0.3);
            l_Character_5.Humanoid.WalkSpeed = 16;
            l_Character_5.Humanoid.AutoRotate = true;
            l_Character_5.PrimaryPart.Anchored = false;
            _G.canuse = true;
            _G.keysetup:cooldown("Thunderous Blitz", l_cd_5);
            _G.fw(l_cd_5);
            l_Cooldowns_5.ult = false;
        end;
    end;
end;
return v6;