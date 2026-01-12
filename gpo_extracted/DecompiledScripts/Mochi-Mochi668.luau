local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v3 = require(game.ReplicatedStorage.Modules.Skills);
local v4 = require(script.Parent.Parent.MobileBase);
local l_PlayerModule_0 = require(l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule"));
local _ = game:GetService("UserInputService");
local _ = l_PlayerModule_0:GetControls();
local _ = l_LocalPlayer_0:GetMouse();
local v9 = setmetatable({}, v4);
v9.__index = v9;
local v10 = require(game:GetService("ReplicatedStorage").Modules.sBeat);
local v11 = 1;
local v12 = nil;
FindBoneReference = function(v13) --[[ Line: 28 ]] --[[ Name: FindBoneReference ]]
    -- upvalues: v12 (ref)
    local function v14(v15, v16) --[[ Line: 29 ]] --[[ Name: recurse_to ]]
        -- upvalues: v12 (ref), v14 (copy)
        if v16 <= 0 then
            v12 = v15;
            return v15;
        else
            v14(v15:GetChildren()[1], v16 - 1);
            return;
        end;
    end;
    return v14(v13.RootPart.MochiArmJoints, 9);
end;
set_buzzcut_length = function(v17, v18, v19) --[[ Line: 40 ]] --[[ Name: set_buzzcut_length ]]
    if v19 > 3 then
        return;
    else
        set_buzzcut_length(v17:FindFirstChildOfClass("Bone"), v18, v19 + 1);
        if v19 > 0 then
            v17.CFrame = CFrame.new(v17:GetAttribute("OrigPos")) * CFrame.new(0, v18, 0);
        end;
        return;
    end;
end;
v9.new = function(_) --[[ Line: 48 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v9 (copy)
    local v21 = setmetatable(v4.new(script.Name), v9);
    v21.Cooldowns = {
        barrage = false, 
        drops = false, 
        burn = false, 
        buzz = false, 
        roll = false, 
        chest = false, 
        punch = false
    };
    return v21;
end;
v9.MochiBarrage = function(v22, v23) --[[ Line: 56 ]] --[[ Name: MochiBarrage ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v22.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.barrage == false and _G.check:inspect(l_Character_0) == true and _G.StamCheck("Mochi Barrage") == true then
        local v27 = v3.GetM("Mochi Barrage");
        local l_cd_0 = v27.cd;
        if _G.StamCheck("Mochi Barrage") == false then
            return;
        elseif v27.statreq and _G.MeetReq(v27.statreq) == false then
            return;
        else
            l_Cooldowns_0.barrage = true;
            local v29 = l_Character_0.Humanoid:LoadAnimation(script.barrage);
            v29:Play();
            v29:AdjustWeight(2);
            v29:AdjustSpeed(2);
            _G.canuse = false;
            l_Character_0.Humanoid.WalkSpeed = 4;
            task.wait(0.375);
            v29:AdjustSpeed(0.25);
            local v30 = game.ReplicatedStorage.Events.Skill:InvokeServer("Mochi Barrage", v22:GetMouseCFrame().p);
            local v31 = tick();
            v22:ChargeSkill(v23, {
                Key = Enum.KeyCode.E, 
                CheckFunction = function() --[[ Line: 83 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_0 (copy)
                    l_Character_0.Humanoid.WalkSpeed = 4;
                end, 
                EndFunction = function() --[[ Line: 88 ]] --[[ Name: endFunction ]]
                    -- upvalues: v31 (copy), v30 (copy)
                    if tick() - v31 >= 2 or v30 == nil then
                        return true;
                    else
                        return;
                    end;
                end
            });
            l_Character_0.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Mochi Barrage", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.barrage = false;
        end;
    end;
end;
v9.MochiDrops = function(v32, v33) --[[ Line: 110 ]] --[[ Name: MochiDrops ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v32.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local v36 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.drops == false and _G.check:inspect(l_Character_1) == true and _G.StamCheck("Mochi Drops") == true then
        local v37 = v3.GetM("Mochi Drops");
        local l_cd_1 = v37.cd;
        if _G.StamCheck("Mochi Drops") == false then
            return;
        elseif v37.statreq and _G.MeetReq(v37.statreq) == false then
            return;
        else
            l_Cooldowns_1.drops = true;
            local v39 = l_Character_1.Humanoid:LoadAnimation(script.drop);
            v39:Play();
            v39:AdjustWeight(2);
            l_Character_1.Humanoid.WalkSpeed = 4;
            _G.canuse = false;
            _G.PauseAnim(v39, 0.4, 1.2000000000000002);
            local v40 = tick();
            v32:ChargeSkill(v33, {
                Key = Enum.KeyCode.Y, 
                CheckFunction = function() --[[ Line: 136 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_1 (copy)
                    l_Character_1.Humanoid.WalkSpeed = 4;
                end, 
                EndFunction = function() --[[ Line: 141 ]] --[[ Name: endFunction ]]
                    -- upvalues: v40 (copy), v32 (copy), l_Character_1 (copy), v36 (copy)
                    if tick() - v40 >= 10 or v32.Tool.Parent ~= l_Character_1 or l_Character_1.Parent == nil or l_Character_1.Parent ~= workspace.PlayerCharacters or v36.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v39:AdjustSpeed(1);
            local l_p_0 = v32:GetMouseCFrame().p;
            game.ReplicatedStorage.Events.Skill:InvokeServer("Mochi Drops", l_p_0);
            local _ = tick();
            _G.canuse = false;
            v39:AdjustSpeed(0.7);
            task.wait(0.6);
            _G.canuse = true;
            l_Character_1.Humanoid.WalkSpeed = 16;
            _G.keysetup:cooldown("Mochi Drops", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1.drops = false;
        end;
    end;
end;
v9.MochiDonutRoll = function(v43, v44) --[[ Line: 169 ]] --[[ Name: MochiDonutRoll ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_2 = v43.Cooldowns;
    local l_Character_2 = l_LocalPlayer_0.Character;
    local v47 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_2.roll == false and _G.grounded == false and _G.check:inspect(l_Character_2) == true and _G.StamCheck("Mochi Donut Roll") == true then
        local v48 = v3.GetM("Mochi Donut Roll");
        local l_cd_2 = v48.cd;
        if _G.StamCheck("Mochi Donut Roll") == false then
            return;
        elseif v48.statreq and _G.MeetReq(v48.statreq) == false then
            return;
        else
            l_Cooldowns_2.roll = true;
            local l_CurrentCamera_0 = workspace.CurrentCamera;
            local v51 = l_Character_2.Humanoid:LoadAnimation(script.wheelStart);
            v51:Play(0);
            v51:AdjustSpeed(1.35);
            v51:AdjustWeight(2);
            _G.canuse = false;
            task.wait(0.4);
            l_CurrentCamera_0.CameraType = Enum.CameraType.Attach;
            local v52 = game.ReplicatedStorage.Events.Skill:InvokeServer("Mochi Donut Roll");
            local v53 = tick();
            v43:ChargeSkill(v44, {
                Key = Enum.KeyCode.T, 
                CheckFunction = function() --[[ Line: 199 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_2 (copy)
                    l_Character_2.Humanoid.WalkSpeed = 4;
                end, 
                EndFunction = function() --[[ Line: 204 ]] --[[ Name: endFunction ]]
                    -- upvalues: v53 (copy), v43 (copy), l_Character_2 (copy), v47 (copy)
                    if tick() - v53 >= 20 or v43.Tool.Parent ~= l_Character_2 or l_Character_2.Parent == nil or l_Character_2.Parent ~= workspace.PlayerCharacters or v47.Stamina.Value <= 0 or _G.check:inspect(l_Character_2) == false then
                        return true;
                    else
                        return;
                    end;
                end, 
                IgnoreInstantCastSetting = true
            });
            l_Character_2:SetAttribute("inWheel", false);
            if v52 then
                v52:FireServer();
            end;
            l_CurrentCamera_0.CameraType = Enum.CameraType.Custom;
            local v54 = l_Character_2.Humanoid:LoadAnimation(script.wheelEnd);
            v54:Play(0);
            v54:AdjustWeight(2);
            local _ = tick();
            _G.canuse = true;
            l_Character_2.Humanoid.WalkSpeed = 16;
            _G.keysetup:cooldown("Mochi Donut Roll", l_cd_2);
            _G.fw(l_cd_2);
            l_Cooldowns_2.roll = false;
        end;
    end;
end;
v9.BurningMochiPunch = function(v56, v57) --[[ Line: 234 ]] --[[ Name: BurningMochiPunch ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_3 = v56.Cooldowns;
    local l_Character_3 = l_LocalPlayer_0.Character;
    local v60 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_3.burn == false and _G.check:inspect(l_Character_3) == true and _G.StamCheck("Burning Mochi Punch") == true then
        local v61 = v3.GetM("Burning Mochi Punch");
        local l_cd_3 = v61.cd;
        if _G.StamCheck("Burning Mochi Punch") == false then
            return;
        elseif v61.statreq and _G.MeetReq(v61.statreq) == false then
            return;
        else
            l_Cooldowns_3.burn = true;
            local v63 = l_Character_3.Humanoid:LoadAnimation(script.burnStart);
            v63:Play();
            v63:AdjustWeight(2);
            l_Character_3.Humanoid.WalkSpeed = 4;
            _G.FaceMouse = true;
            _G.canuse = false;
            local v64 = game.ReplicatedStorage.Events.Skill:InvokeServer("Burning Mochi Punch");
            _G.PauseAnim(v63, 0.4166666666666667, 0.8);
            local v65 = tick();
            v56:ChargeSkill(v57, {
                Key = Enum.KeyCode.X, 
                EndFunction = function() --[[ Line: 263 ]] --[[ Name: endFunction ]]
                    -- upvalues: v56 (copy), l_Character_3 (copy), v60 (copy), v65 (copy)
                    if v56.Tool.Parent ~= l_Character_3 or l_Character_3.Parent == nil or l_Character_3.Parent ~= workspace.PlayerCharacters or v60.Stamina.Value <= 0 or tick() - v65 >= 7 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v63:AdjustSpeed(1);
            _G.FaceMouse = false;
            l_Character_3.HumanoidRootPart.Anchored = true;
            if v64 then
                v64:FireServer(l_Character_3.HumanoidRootPart.CFrame);
                task.spawn(function() --[[ Line: 280 ]]
                    -- upvalues: l_Character_3 (copy)
                    task.wait(0.53);
                    local l_CFrame_0 = l_Character_3.HumanoidRootPart.CFrame;
                    local _, v68 = _G.raycast:cast(l_Character_3.HumanoidRootPart.CFrame.p, l_Character_3.HumanoidRootPart.CFrame.lookVector * -5, {
                        workspace.Islands, 
                        workspace.Ships, 
                        workspace.Env
                    });
                    local l_magnitude_0 = (l_CFrame_0.p - v68).magnitude;
                    _G.tween(l_Character_3.HumanoidRootPart, {
                        0.28, 
                        "Sine", 
                        Enum.EasingDirection.Out, 
                        0, 
                        false, 
                        0
                    }, {
                        CFrame = l_Character_3.HumanoidRootPart.CFrame * CFrame.new(0, 0, l_magnitude_0)
                    });
                end);
            end;
            task.wait(0.98);
            l_Character_3.HumanoidRootPart.Anchored = false;
            _G.canuse = true;
            l_Character_3.Humanoid.WalkSpeed = 16;
            _G.keysetup:cooldown("Burning Mochi Punch", l_cd_3);
            _G.fw(l_cd_3);
            l_Cooldowns_3.burn = false;
        end;
    end;
end;
v9.MochiBuzzcut = function(v70, v71) --[[ Line: 299 ]] --[[ Name: MochiBuzzcut ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy), v11 (ref), v10 (copy)
    local l_Cooldowns_4 = v70.Cooldowns;
    local l_Character_4 = l_LocalPlayer_0.Character;
    local v74 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_4.buzz == false and _G.check:inspect(l_Character_4) == true and _G.StamCheck("Mochi Buzzcut") == true then
        local v75 = v3.GetM("Mochi Buzzcut");
        local l_cd_4 = v75.cd;
        if _G.StamCheck("Mochi Buzzcut") == false then
            return;
        elseif v75.statreq and _G.MeetReq(v75.statreq) == false then
            return;
        else
            l_Cooldowns_4.buzz = true;
            v11 = 1;
            local v77 = l_Character_4.Humanoid:LoadAnimation(script.buzzcutstart);
            v77:Play();
            v77:AdjustWeight(2);
            v77.Priority = Enum.AnimationPriority.Action4;
            l_Character_4.Humanoid.WalkSpeed = 4;
            _G.canuse = false;
            local v78 = game.ReplicatedStorage.Events.Skill:InvokeServer("Mochi Buzzcut");
            local v79 = nil;
            if v78 then
                task.wait(2.37);
                v79 = l_Character_4.Humanoid:LoadAnimation(script.buzzcutloop);
                v79:Play(0);
                v79.Priority = Enum.AnimationPriority.Action4;
            end;
            local v80 = tick();
            local v81 = true;
            local v82 = 0;
            do
                local l_v82_0 = v82;
                local function v84() --[[ Line: 343 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_v82_0 (ref), v78 (copy), l_Character_4 (copy), v80 (copy), v70 (copy), v74 (copy)
                    _G.canuse = false;
                    if tick() - l_v82_0 >= 0.58083333 then
                        l_v82_0 = tick();
                        if v78 then
                            v78:FireServer(true);
                        end;
                    end;
                    l_Character_4.Humanoid.WalkSpeed = 4;
                    if tick() - v80 >= 7 or v70.Tool.Parent ~= l_Character_4 or l_Character_4.Parent == nil or l_Character_4.Parent ~= workspace.PlayerCharacters or v74.Stamina.Value <= 0 then
                        return false;
                    else
                        return;
                    end;
                end;
                v70:ChargeSkill(v71, {
                    Key = Enum.KeyCode.C, 
                    IgnoreInstantCastSetting = true, 
                    CheckFunction = v84
                });
                v81 = false;
                if v78 then
                    v79:Stop();
                    local v85 = l_Character_4.Humanoid:LoadAnimation(script.buzzcutend);
                    v85:Play();
                    v85.Priority = Enum.AnimationPriority.Action4;
                    v85:AdjustWeight(2);
                    l_Character_4.Humanoid.WalkSpeed = 0;
                    v78:FireServer();
                    v10(3);
                    v10(40);
                    v10(77);
                    v10(53);
                    v10(60);
                end;
                l_Character_4.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0, 0);
                l_Character_4.HumanoidRootPart.Anchored = false;
                _G.canuse = true;
                l_Character_4.Humanoid.WalkSpeed = 16;
                _G.keysetup:cooldown("Mochi Buzzcut", l_cd_4);
                _G.fw(l_cd_4);
                l_Cooldowns_4.buzz = false;
            end;
        end;
    end;
end;
v9.ChestnutMochi = function(v86, v87) --[[ Line: 402 ]] --[[ Name: ChestnutMochi ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_5 = v86.Cooldowns;
    local l_Character_5 = l_LocalPlayer_0.Character;
    local v90 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_5.chest == false and _G.check:inspect(l_Character_5) == true and _G.StamCheck("Chestnut Mochi") == true then
        local v91 = v3.GetM("Chestnut Mochi");
        local l_cd_5 = v91.cd;
        if _G.StamCheck("Chestnut Mochi") == false then
            return;
        elseif v91.statreq and _G.MeetReq(v91.statreq) == false then
            return;
        else
            l_Cooldowns_5.chest = true;
            local v93 = l_Character_5.Humanoid:LoadAnimation(script.cheststart);
            v93:Play();
            v93:AdjustWeight(2);
            v93:AdjustSpeed(0.5);
            l_Character_5.Humanoid.WalkSpeed = 4;
            _G.FaceMouse = true;
            _G.mouseLevel = true;
            _G.canuse = false;
            local v94 = game.ReplicatedStorage.Events.Skill:InvokeServer("Chestnut Mochi", l_Character_5.PrimaryPart.CFrame);
            task.wait(1.4);
            local v95 = l_Character_5.Humanoid:LoadAnimation(script.chestloop);
            v95:Play();
            v95:AdjustWeight(2);
            local v96 = tick();
            v86:ChargeSkill(v87, {
                Key = Enum.KeyCode.Z, 
                EndFunction = function() --[[ Line: 434 ]] --[[ Name: endFunction ]]
                    -- upvalues: v86 (copy), l_Character_5 (copy), v90 (copy), v96 (copy)
                    if v86.Tool.Parent ~= l_Character_5 or l_Character_5.Parent == nil or l_Character_5.Parent ~= workspace.PlayerCharacters or v90.Stamina.Value <= 0 or tick() - v96 >= 10 then
                        return true;
                    else
                        return;
                    end;
                end, 
                IgnoreInstantCastSetting = true
            });
            _G.mouseLevel = false;
            v95:Stop();
            _G.FaceMouse = false;
            if v94 then
                v94:FireServer();
            end;
            _G.canuse = true;
            l_Character_5.Humanoid.WalkSpeed = 16;
            _G.keysetup:cooldown("Chestnut Mochi", l_cd_5);
            _G.fw(l_cd_5);
            l_Cooldowns_5.chest = false;
        end;
    end;
end;
v9.PowerMochi = function(v97, v98) --[[ Line: 461 ]] --[[ Name: PowerMochi ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_6 = v97.Cooldowns;
    local l_Character_6 = l_LocalPlayer_0.Character;
    local v101 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_6.punch == false and _G.check:inspect(l_Character_6) == true and _G.StamCheck("Power Mochi") == true then
        local v102 = v3.GetM("Power Mochi");
        local l_cd_6 = v102.cd;
        if _G.StamCheck("Power Mochi") == false then
            return;
        elseif v102.statreq and _G.MeetReq(v102.statreq) == false then
            return;
        else
            l_Cooldowns_6.punch = true;
            local v104 = l_Character_6.Humanoid:LoadAnimation(script.punch);
            v104:Play();
            v104:AdjustWeight(5);
            l_Character_6.Humanoid.WalkSpeed = 4;
            _G.FaceMouse = true;
            _G.canuse = false;
            local v105 = game.ReplicatedStorage.Events.Skill:InvokeServer("Power Mochi");
            _G.PauseAnim(v104, 0.43, 1);
            local v106 = tick();
            v97:ChargeSkill(v98, {
                Key = Enum.KeyCode.R, 
                IgnoreInstantCastSetting = true, 
                EndFunction = function() --[[ Line: 489 ]] --[[ Name: endFunction ]]
                    -- upvalues: v97 (copy), l_Character_6 (copy), v101 (copy), v106 (copy)
                    if v97.Tool.Parent ~= l_Character_6 or l_Character_6.Parent == nil or l_Character_6.Parent ~= workspace.PlayerCharacters or v101.Stamina.Value <= 0 or tick() - v106 >= 10 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v104:AdjustSpeed(1);
            local v107 = l_Character_6.HumanoidRootPart.CFrame * CFrame.new(0, 0, -5);
            _G.FaceMouse = false;
            l_Character_6.HumanoidRootPart.Anchored = true;
            task.wait(0.2);
            if v105 then
                v105:FireServer(v107);
            end;
            task.wait(0.75);
            l_Character_6.HumanoidRootPart.Anchored = false;
            _G.canuse = true;
            l_Character_6.Humanoid.WalkSpeed = 16;
            _G.keysetup:cooldown("Power Mochi", l_cd_6);
            _G.fw(l_cd_6);
            l_Cooldowns_6.punch = false;
        end;
    end;
end;
return v9;