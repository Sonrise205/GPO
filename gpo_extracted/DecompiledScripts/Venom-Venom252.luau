local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v3 = require(game.ReplicatedStorage.Modules.Skills);
local v4 = require(script.Parent.Parent.MobileBase);
local _ = require(l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule"));
local _ = game:GetService("UserInputService");
local _ = l_LocalPlayer_0:GetMouse();
local v8 = setmetatable({}, v4);
v8.__index = v8;
local v9 = {
    {
        "Block", 
        "f"
    }, 
    {
        "Venom Spit", 
        "e"
    }, 
    {
        "Venom Hydra", 
        "r"
    }, 
    {
        "Venom Road", 
        "t"
    }, 
    {
        "Venom Discharge", 
        "z"
    }, 
    {
        "Venom Aura", 
        "x"
    }, 
    {
        "Venom Demon", 
        "c"
    }
};
v8.new = function(_) --[[ Line: 21 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v8 (copy), l_LocalPlayer_0 (copy)
    local v11 = setmetatable(v4.new(script.Name), v8);
    v11.Cooldowns = {
        spit = false, 
        hydra = false, 
        road = false, 
        cloak = false, 
        swipe = false, 
        demon = false, 
        rush = false, 
        gas = false, 
        slam = false, 
        grab = false
    };
    local l_Character_0 = l_LocalPlayer_0.Character;
    v11.demonMode = l_Character_0:GetAttribute("VenomDemonActive") or false;
    l_Character_0:GetAttributeChangedSignal("VenomDemonActive"):Connect(function() --[[ Line: 31 ]]
        -- upvalues: v11 (copy), l_Character_0 (copy)
        v11.demonMode = l_Character_0:GetAttribute("VenomDemonActive") or false;
    end);
    v11.slam = 0;
    return v11;
end;
v8.VenomSpit = function(v13, v14) --[[ Line: 39 ]] --[[ Name: VenomSpit ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v13.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local v17 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if v13.demonMode == false and l_Cooldowns_0.spit == false and _G.check:inspect(l_Character_1) == true and _G.StamCheck("Venom Spit") == true then
        local v18 = v3.GetM("Venom Spit");
        local l_cd_0 = v18.cd;
        if _G.StamCheck("Venom Spit") == false then
            return;
        elseif v18.statreq and _G.MeetReq(v18.statreq) == false then
            return;
        else
            l_Cooldowns_0.spit = true;
            local v20 = l_Character_1.Humanoid:LoadAnimation(script.spitCharge);
            v20:Play();
            v20:AdjustWeight(2);
            v20:AdjustSpeed(1);
            _G.FaceMouse = true;
            _G.canuse = false;
            local v21 = game.ReplicatedStorage.Events.Skill:InvokeServer("Venom Spit");
            _G.PauseAnim(v20, 0.99, 3);
            local v22 = tick();
            v13:ChargeSkill(v14, {
                Key = Enum.KeyCode.E, 
                CheckFunction = function() --[[ Line: 66 ]] --[[ Name: checkFunction ]]
                    -- upvalues: v21 (copy)
                    if v21 == nil then
                        return false;
                    else
                        return;
                    end;
                end, 
                EndFunction = function() --[[ Line: 72 ]] --[[ Name: endFunction ]]
                    -- upvalues: v21 (copy), v13 (copy), l_Character_1 (copy), v22 (copy), v17 (copy)
                    if v21 == nil or v13.Tool.Parent ~= l_Character_1 or tick() - v22 >= 10 or l_Character_1.Parent == nil or l_Character_1.Parent ~= workspace.PlayerCharacters or v17.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            _G.FaceMouse = false;
            if v21 then
                v21:FireServer(l_Character_1.PrimaryPart.CFrame);
            end;
            v20:Stop();
            local v23 = l_Character_1.Humanoid:LoadAnimation(script.spit);
            v23:Play();
            v23:AdjustWeight(2);
            v23:AdjustSpeed(1.5);
            l_Character_1.PrimaryPart.Anchored = true;
            task.wait(0.35);
            l_Character_1.PrimaryPart.Anchored = false;
            _G.keysetup:cooldown("Venom Spit", l_cd_0);
            _G.canuse = true;
            _G.fw(l_cd_0);
            l_Cooldowns_0.spit = false;
        end;
    end;
end;
v8.VenomHydra = function(v24, v25) --[[ Line: 108 ]] --[[ Name: VenomHydra ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v24.Cooldowns;
    local l_Character_2 = l_LocalPlayer_0.Character;
    local v28 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.hydra == false and _G.check:inspect(l_Character_2) == true and _G.StamCheck("Venom Hydra") == true then
        local v29 = v3.GetM("Venom Hydra");
        local l_cd_1 = v29.cd;
        if _G.StamCheck("Venom Hydra") == false then
            return;
        elseif v29.statreq and _G.MeetReq(v29.statreq) == false then
            return;
        else
            l_Cooldowns_1.hydra = true;
            _G.canuse = false;
            local v31 = l_Character_2.Humanoid:LoadAnimation(script.QuickCast);
            v31:Play();
            v31:AdjustWeight(2);
            v31:AdjustSpeed(0);
            if not v24.demonMode then
                _G.FaceMouse = true;
            end;
            local v32 = false;
            local v33 = game.ReplicatedStorage.Events.Skill:InvokeServer("Venom Hydra");
            if v24.demonMode == true then
                local v34 = l_Character_2.VenomDemonModel.AnimationController.Animator:LoadAnimation(script.demonHydra);
                v34:Play();
                v34:AdjustSpeed(1);
            end;
            local v35 = tick();
            if v24.demonMode == true then
                v32 = true;
            end;
            do
                local l_v31_0, l_v32_0 = v31, v32;
                local function v38() --[[ Line: 149 ]] --[[ Name: checkFunction ]]
                    -- upvalues: v35 (copy), l_v32_0 (ref), l_v31_0 (ref), l_Character_2 (copy), v33 (copy)
                    if tick() - v35 >= 0.7 and l_v32_0 == false then
                        l_v31_0:Stop();
                        l_v31_0 = l_Character_2.Humanoid:LoadAnimation(script.HeldCast);
                        l_v31_0:Play();
                        l_v31_0:AdjustWeight(2);
                        l_v31_0:AdjustSpeed(0);
                        if v33 then
                            v33:FireServer("tripleCast");
                        end;
                        l_v32_0 = true;
                    end;
                end;
                local function v39() --[[ Line: 163 ]] --[[ Name: endFunction ]]
                    -- upvalues: v24 (copy), l_Character_2 (copy), v35 (copy), v28 (copy)
                    if v24.Tool.Parent ~= l_Character_2 or tick() - v35 >= 10 or l_Character_2.Parent == nil or l_Character_2.Parent ~= workspace.PlayerCharacters or v28.Stamina.Value <= 0 then
                        warn("released");
                        return true;
                    else
                        return;
                    end;
                end;
                task.wait(0.1);
                warn("demon mode", (tostring(v24.demonMode)));
                if v24.demonMode == false then
                    v24:ChargeSkill(v25, {
                        Key = Enum.KeyCode.R, 
                        CheckFunction = v38, 
                        IgnoreInstantCastSetting = true, 
                        EndFunction = v39
                    });
                end;
                _G.FaceMouse = false;
                if v33 then
                    local v40 = _G.getTargetNearMouse(300);
                    if v40 then
                        v40 = v40.Parent;
                    end;
                    if not v24.demonMode then
                        l_Character_2:PivotTo(CFrame.new(l_Character_2.PrimaryPart.Position, v24:GetMouseCFrame().p));
                    end;
                    v33:FireServer(l_Character_2.PrimaryPart.CFrame, v40, l_v32_0, v24:GetMouseCFrame());
                end;
                l_v31_0:AdjustSpeed(1);
                l_Character_2.PrimaryPart.Anchored = true;
                task.wait(0.5);
                if v24.demonMode == true then
                    task.wait(0.2);
                elseif l_v32_0 == true then
                    task.wait(0.4);
                end;
                l_Character_2.PrimaryPart.Anchored = false;
                _G.keysetup:cooldown("Venom Hydra", l_cd_1);
                _G.canuse = true;
                _G.fw(l_cd_1);
                l_Cooldowns_1.hydra = false;
            end;
        end;
    end;
end;
v8.VenomRoad = function(v41, _) --[[ Line: 215 ]] --[[ Name: VenomRoad ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_2 = v41.Cooldowns;
    local l_Character_3 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if v41.demonMode == false and _G.grounded == false and l_Cooldowns_2.road == false and _G.check:inspect(l_Character_3) == true and _G.StamCheck("Venom Road") == true then
        local v46 = v3.GetM("Venom Road");
        local l_cd_2 = v46.cd;
        if _G.StamCheck("Venom Road") == false then
            return;
        elseif v46.statreq and _G.MeetReq(v46.statreq) == false then
            return;
        else
            l_Cooldowns_2.road = true;
            _G.canuse = false;
            local l_v41_MouseCFrame_0 = v41:GetMouseCFrame();
            local l_Magnitude_0 = (l_Character_3.PrimaryPart.Position - l_v41_MouseCFrame_0.Position).Magnitude;
            local v50 = Ray.new(l_Character_3.PrimaryPart.Position, (l_Character_3.PrimaryPart.Position - l_v41_MouseCFrame_0.Position).unit * -l_Magnitude_0);
            local _, v52 = _G.raycastWhitelist(v50, {
                workspace.Islands, 
                workspace.Ships, 
                workspace.Env
            });
            l_v41_MouseCFrame_0 = CFrame.new(v52);
            if (l_Character_3.HumanoidRootPart.Position - l_v41_MouseCFrame_0.p).magnitude >= 150 then
                local v53 = Ray.new(l_Character_3.HumanoidRootPart.Position, (l_Character_3.HumanoidRootPart.Position - l_v41_MouseCFrame_0.p).unit * -150);
                local _, v55 = _G.raycastIgnoreList(v53, {
                    workspace
                });
                l_v41_MouseCFrame_0 = CFrame.new(v55);
            end;
            local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Venom Road", l_v41_MouseCFrame_0);
            _G.keysetup:cooldown("Venom Road", l_cd_2);
            _G.canuse = true;
            _G.fw(l_cd_2);
            l_Cooldowns_2.road = false;
        end;
    end;
end;
v8.VenomDischarge = function(v57, _) --[[ Line: 256 ]] --[[ Name: VenomDischarge ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_3 = v57.Cooldowns;
    local l_Character_4 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if v57.demonMode == false and l_Cooldowns_3.cloak == false and _G.check:inspect(l_Character_4) == true and _G.StamCheck("Venom Discharge") == true then
        local v62 = v3.GetM("Venom Discharge");
        local l_cd_3 = v62.cd;
        if _G.StamCheck("Venom Discharge") == false then
            return;
        elseif v62.statreq and _G.MeetReq(v62.statreq) == false then
            return;
        else
            l_Cooldowns_3.cloak = true;
            l_Character_4.Humanoid:LoadAnimation(script.counterCast):Play();
            task.spawn(function() --[[ Line: 275 ]]
                local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Venom Discharge");
            end);
            _G.keysetup:cooldown("Venom Discharge", l_cd_3);
            _G.canuse = true;
            _G.fw(l_cd_3);
            l_Cooldowns_3.cloak = false;
        end;
    end;
end;
v8.VenomAura = function(v65, _) --[[ Line: 288 ]] --[[ Name: VenomAura ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_4 = v65.Cooldowns;
    local l_Character_5 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if v65.demonMode == false and l_Cooldowns_4.swipe == false and _G.check:inspect(l_Character_5) == true and _G.StamCheck("Venom Aura") == true then
        local v70 = v3.GetM("Venom Aura");
        local l_cd_4 = v70.cd;
        if _G.StamCheck("Venom Aura") == false then
            return;
        elseif v70.statreq and _G.MeetReq(v70.statreq) == false then
            return;
        else
            l_Cooldowns_4.swipe = true;
            local v72 = l_Character_5.Humanoid:LoadAnimation(script.swipe);
            v72:Play();
            v72:AdjustWeight(2);
            v72:AdjustSpeed(1);
            _G.canuse = false;
            l_Character_5.Humanoid.WalkSpeed = 4;
            local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Venom Aura");
            _G.keysetup:cooldown("Venom Aura", l_cd_4);
            _G.canuse = true;
            l_Character_5.Humanoid.WalkSpeed = 16;
            _G.fw(l_cd_4);
            l_Cooldowns_4.swipe = false;
        end;
    end;
end;
v8.VenomDemon = function(v74, v75) --[[ Line: 320 ]] --[[ Name: VenomDemon ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy), v9 (copy)
    local l_Cooldowns_5 = v74.Cooldowns;
    local l_Character_6 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Character_6:FindFirstChild("VenomDemonModel") == nil and l_Cooldowns_5.demon == false and _G.check:inspect(l_Character_6) == true and _G.StamCheck("Venom Demon") == true then
        local v79 = v3.GetM("Venom Demon");
        local l_cd_5 = v79.cd;
        if _G.StamCheck("Venom Demon") == false then
            return;
        elseif v79.statreq and _G.MeetReq(v79.statreq) == false then
            return;
        else
            local v81 = 0;
            if l_Character_6:GetAttribute("venomDamage") then
                v81 = math.ceil((l_Character_6:GetAttribute("venomDamage")));
            end;
            if v81 < require(game.ReplicatedStorage.Modules.Skills.Modes.Venom)(l_LocalPlayer_0) * v74.Tool:GetAttribute("modePercent") then
                _G.displayMessage((("<Color=/>I need <Color=Red>%*%%<Color=/> Rage for full mode."):format(v74.Tool:GetAttribute("modePercent") * 100)));
                return;
            else
                local v82, _, _ = _G.getRayFloor(l_Character_6.PrimaryPart.CFrame, 5);
                if v82 == nil then
                    _G.displayMessage("<Color=Red>You must be grounded!");
                    return nil;
                else
                    l_Cooldowns_5.demon = true;
                    _G.canuse = false;
                    local v85 = game.ReplicatedStorage.Events.Skill:InvokeServer("Venom Demon", l_Character_6.PrimaryPart.CFrame);
                    if v85 then
                        pcall(function() --[[ Line: 354 ]]
                            if _G.keysetup then
                                _G.keysetup:Destroy();
                                _G.keysetup:setup("Venom Demon", {
                                    {
                                        "Block", 
                                        "f"
                                    }, 
                                    {
                                        "Venom Rush", 
                                        "q"
                                    }, 
                                    {
                                        "Venom Slam", 
                                        "e"
                                    }, 
                                    {
                                        "Venom Hydra", 
                                        "r"
                                    }, 
                                    {
                                        "Venom Poisonous Gas", 
                                        "z"
                                    }, 
                                    {
                                        "Venom Grab", 
                                        "x"
                                    }, 
                                    {
                                        "Venom Demon", 
                                        "c"
                                    }
                                });
                            end;
                        end);
                        v74:DoubleCastSkill(v75, {
                            Key = Enum.KeyCode.C, 
                            SkipTap = true, 
                            CompleteFunction = function() --[[ Line: 366 ]] --[[ Name: CompleteFunction ]]
                                -- upvalues: v85 (copy)
                                if v85 then
                                    warn("UNTRASNFORM VENOM DEMON HERE");
                                    _G.canuse = false;
                                    local v86 = tick();
                                    local v87 = false;
                                    do
                                        local l_v87_0 = v87;
                                        task.spawn(function() --[[ Line: 372 ]]
                                            -- upvalues: v85 (ref), l_v87_0 (ref)
                                            v85:InvokeServer();
                                            l_v87_0 = true;
                                        end);
                                        repeat
                                            task.wait();
                                        until l_v87_0 == true or tick() - v86 >= 1.4;
                                        _G.canuse = true;
                                        warn("UNTRASNFORM VENOM DEMON FINISHED");
                                    end;
                                end;
                            end, 
                            PassFunction = function() --[[ Line: 384 ]] --[[ Name: PassFunction ]]
                                -- upvalues: v74 (copy), l_Character_6 (copy)
                                local v89 = false;
                                if v74.Tool.Parent == l_Character_6 then
                                    v89 = false;
                                    if _G.check:inspect(l_Character_6) == true then
                                        v89 = _G.canuse == true;
                                    end;
                                end;
                                return v89;
                            end
                        });
                        task.spawn(function() --[[ Line: 389 ]]
                            -- upvalues: l_Character_6 (copy), v74 (copy), l_LocalPlayer_0 (ref), v9 (ref)
                            repeat
                                l_Character_6.Humanoid.Jump = false;
                                l_Character_6.Humanoid.WalkSpeed = 35;
                                local l_Tool_0 = l_Character_6:FindFirstChildWhichIsA("Tool");
                                if l_Tool_0 and l_Tool_0 ~= v74.Tool then
                                    task.defer(function() --[[ Line: 395 ]]
                                        -- upvalues: l_Tool_0 (copy), l_LocalPlayer_0 (ref)
                                        l_Tool_0.Parent = l_LocalPlayer_0.Backpack;
                                    end);
                                end;
                                if l_Character_6.PrimaryPart.Velocity.Magnitude >= 150 then
                                    l_Character_6.PrimaryPart.Velocity = Vector3.new(0, 0, 0, 0);
                                    l_Character_6.PrimaryPart.RotVelocity = Vector3.new(0, 0, 0, 0);
                                end;
                                _G.toolLocked = v74.Tool;
                                game["Run Service"].RenderStepped:Wait();
                            until l_Character_6:GetAttribute("VenomDemonActive") == false;
                            _G.toolLocked = nil;
                            _G.keysetup:Destroy();
                            _G.keysetup:setup(script.Name, v9);
                        end);
                    end;
                    _G.canuse = true;
                    _G.keysetup:cooldown("Venom Demon", l_cd_5);
                    _G.fw(l_cd_5);
                    l_Cooldowns_5.demon = false;
                end;
            end;
        end;
    end;
end;
v8.VenomRush = function(v91, _) --[[ Line: 423 ]] --[[ Name: VenomRush ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_6 = v91.Cooldowns;
    local l_Character_7 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if v91.demonMode == true and l_Cooldowns_6.rush == false and _G.check:inspect(l_Character_7) == true and _G.StamCheck("Venom Rush") == true then
        local v96 = v3.GetM("Venom Rush");
        local l_cd_6 = v96.cd;
        if _G.StamCheck("Venom Rush") == false then
            return;
        elseif v96.statreq and _G.MeetReq(v96.statreq) == false then
            return;
        else
            l_Cooldowns_6.rush = true;
            _G.canuse = false;
            local v98 = l_Character_7.VenomDemonModel.AnimationController.Animator:LoadAnimation(script.Rush);
            v98:Play();
            v98:AdjustSpeed(1.3);
            game.ReplicatedStorage.Events.Skill:InvokeServer("Venom Rush");
            task.wait(0.5);
            _G.keysetup:cooldown("Venom Rush", l_cd_6);
            _G.canuse = true;
            _G.fw(l_cd_6);
            l_Cooldowns_6.rush = false;
        end;
    end;
end;
v8.VenomPoisonousGas = function(v99, _) --[[ Line: 454 ]] --[[ Name: VenomPoisonousGas ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_7 = v99.Cooldowns;
    local l_Character_8 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if v99.demonMode == true and l_Cooldowns_7.gas == false and _G.check:inspect(l_Character_8) == true and _G.StamCheck("Venom Poisonous Gas") == true then
        local v104 = v3.GetM("Venom Poisonous Gas");
        local l_cd_7 = v104.cd;
        if _G.StamCheck("Venom Poisonous Gas") == false then
            return;
        elseif v104.statreq and _G.MeetReq(v104.statreq) == false then
            return;
        else
            l_Cooldowns_7.gas = true;
            _G.canuse = false;
            local v106 = l_Character_8.VenomDemonModel.AnimationController.Animator:LoadAnimation(script.demonGas);
            v106:Play();
            v106:AdjustSpeed(1.3);
            l_Character_8.PrimaryPart.Anchored = true;
            task.delay(1.5, function() --[[ Line: 483 ]]
                -- upvalues: l_Character_8 (copy)
                l_Character_8.PrimaryPart.Anchored = false;
            end);
            game.ReplicatedStorage.Events.Skill:InvokeServer("Venom Poisonous Gas");
            task.wait(1.5);
            _G.keysetup:cooldown("Venom Poisonous Gas", l_cd_7);
            _G.canuse = true;
            _G.fw(l_cd_7);
            l_Cooldowns_7.gas = false;
        end;
    end;
end;
v8.VenomSlam = function(v107, _) --[[ Line: 498 ]] --[[ Name: VenomSlam ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_8 = v107.Cooldowns;
    local l_Character_9 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if v107.demonMode == true and l_Cooldowns_8.slam == false and _G.check:inspect(l_Character_9) == true and _G.StamCheck("Venom Slam") == true then
        local v112 = v3.GetM("Venom Slam");
        local l_cd_8 = v112.cd;
        if _G.StamCheck("Venom Slam") == false then
            return;
        elseif v112.statreq and _G.MeetReq(v112.statreq) == false then
            return;
        else
            l_Cooldowns_8.slam = true;
            _G.canuse = false;
            v107.slam = v107.slam + 1;
            if v107.slam >= 3 then
                v107.slam = 1;
            end;
            local v114 = l_Character_9.VenomDemonModel.AnimationController.Animator:LoadAnimation(script["slam" .. v107.slam]);
            v114:Play();
            v114:AdjustSpeed(1);
            local v115 = game.ReplicatedStorage.Events.Skill:InvokeServer("Venom Slam", v107.slam);
            task.wait(1.1);
            if v115 then
                v115:FireServer(l_Character_9.PrimaryPart.CFrame);
            end;
            task.wait(0.2);
            _G.keysetup:cooldown("Venom Slam", l_cd_8);
            _G.canuse = true;
            _G.fw(l_cd_8);
            l_Cooldowns_8.slam = false;
        end;
    end;
end;
v8.VenomGrab = function(v116, _) --[[ Line: 538 ]] --[[ Name: VenomGrab ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_9 = v116.Cooldowns;
    local l_Character_10 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if v116.demonMode == true and l_Cooldowns_9.grab == false and _G.check:inspect(l_Character_10) == true and _G.StamCheck("Venom Grab") == true then
        local v121 = v3.GetM("Venom Grab");
        local l_cd_9 = v121.cd;
        if _G.StamCheck("Venom Grab") == false then
            return;
        elseif v121.statreq and _G.MeetReq(v121.statreq) == false then
            return;
        else
            l_Cooldowns_9.grab = true;
            _G.canuse = false;
            local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Venom Grab", l_Character_10.PrimaryPart.CFrame);
            task.wait(0.2);
            _G.keysetup:cooldown("Venom Grab", l_cd_9);
            _G.canuse = true;
            _G.fw(l_cd_9);
            l_Cooldowns_9.grab = false;
        end;
    end;
end;
return v8;