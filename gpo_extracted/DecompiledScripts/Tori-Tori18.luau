local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v3 = require(game.ReplicatedStorage.Modules.Skills);
local v4 = require(script.Parent.Parent.MobileBase);
local l_PlayerModule_0 = require(l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule"));
local _ = game:GetService("UserInputService");
local _ = l_LocalPlayer_0:GetMouse();
local l_l_PlayerModule_0_Controls_0 = l_PlayerModule_0:GetControls();
local v9 = setmetatable({}, v4);
v9.__index = v9;
local v10 = {
    {
        "Block", 
        "f"
    }, 
    {
        "Triple Talon Kick", 
        "e"
    }, 
    {
        "Talon Barrage", 
        "r"
    }, 
    {
        "Phoenix Pyreapple", 
        "t"
    }, 
    {
        "Phoenix Transformation", 
        "z"
    }, 
    {
        "Phoenix Burst", 
        "x"
    }, 
    {
        "Phoenix Dive Bomb", 
        "c"
    }
};
local function _(v11) --[[ Line: 22 ]] --[[ Name: getLargestAxis ]]
    if math.abs(v11.X) > math.abs(v11.Y) and math.abs(v11.X) > math.abs(v11.Z) then
        return v11.X > 0 and "Right" or "Left", (math.abs(v11.X));
    elseif math.abs(v11.Z) > math.abs(v11.X) and math.abs(v11.Z) > math.abs(v11.Y) then
        return v11.Z > 0 and "Down" or "Up", (math.abs(v11.Z));
    else
        return "None", 0;
    end;
end;
v9.new = function(_) --[[ Line: 32 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v9 (copy), l_LocalPlayer_0 (copy), l_l_PlayerModule_0_Controls_0 (copy)
    local v14 = setmetatable(v4.new(script.Name), v9);
    v14.Cooldowns = {
        trans = false, 
        carry = false, 
        rapid = false, 
        talon = false, 
        heal = false, 
        block = false, 
        burst = false, 
        brand = false, 
        bomb = false, 
        pburst = false
    };
    local l_Character_0 = l_LocalPlayer_0.Character;
    local v16 = 50;
    local v17 = 0;
    local l_CFrame_0 = l_Character_0.HumanoidRootPart.CFrame;
    local l_BodyVelocity_0 = Instance.new("BodyVelocity");
    l_BodyVelocity_0.Name = "geppo";
    l_BodyVelocity_0.P = 1e999;
    l_BodyVelocity_0.MaxForce = Vector3.new(1e999, 1e999, 1e999, 0);
    l_BodyVelocity_0.Velocity = Vector3.new();
    local l_BodyGyro_0 = Instance.new("BodyGyro");
    l_BodyGyro_0.P = 100000;
    l_BodyGyro_0.D = 2000;
    l_BodyGyro_0.MaxTorque = Vector3.new(99999997952, 99999997952, 99999997952, 0);
    v14.bv = l_BodyVelocity_0;
    v14.bg = l_BodyGyro_0;
    local l_flap_0 = v14.Tool:WaitForChild("flap");
    local v22 = {
        idle = l_Character_0.Humanoid:LoadAnimation(script.Flights.Half.idle), 
        fly = l_Character_0.Humanoid:LoadAnimation(script.Flights.Half.fly), 
        fullidle = nil, 
        fullfly = nil
    };
    local v23 = {};
    local v24 = {};
    v14.busy = false;
    v14.preTransformCNT = nil;
    v14.transformed = false;
    local function _(v25, v26) --[[ Line: 74 ]] --[[ Name: clearCnts ]]
        -- upvalues: l_Character_0 (copy)
        if v26 and l_Character_0:FindFirstChild(v26) == nil then
            return;
        else
            pcall(function() --[[ Line: 78 ]]
                -- upvalues: v25 (copy)
                for v27 = 1, #v25 do
                    if v25[v27] then
                        v25[v27]:Disconnect();
                        v25[v27] = nil;
                    end;
                end;
                table.clear(v25);
            end);
            return;
        end;
    end;
    local function _(v29, v30) --[[ Line: 90 ]] --[[ Name: connectFlap ]]
        -- upvalues: v23 (copy), l_flap_0 (copy)
        v23[v30] = v29:GetMarkerReachedSignal("Flap"):Connect(function() --[[ Line: 91 ]]
            -- upvalues: l_flap_0 (ref)
            if _G.canuse == false then
                return;
            else
                l_flap_0:FireServer();
                return;
            end;
        end);
    end;
    l_Character_0:GetAttributeChangedSignal("Transformed"):Connect(function() --[[ Line: 99 ]]
        -- upvalues: v14 (copy), l_Character_0 (copy)
        v14.transformed = l_Character_0:GetAttribute("Transformed") or false;
    end);
    v14.setFlaps = function(_) --[[ Line: 103 ]]
        -- upvalues: v23 (copy), l_Character_0 (copy), v22 (copy), l_flap_0 (copy)
        task.spawn(function() --[[ Line: 104 ]]
            -- upvalues: v23 (ref), l_Character_0 (ref), v22 (ref), l_flap_0 (ref)
            local l_v23_0 = v23;
            local l_l_v23_0_0 = l_v23_0 --[[ copy: 0 -> 1 ]];
            pcall(function() --[[ Line: 78 ]]
                -- upvalues: l_l_v23_0_0 (copy)
                for v35 = 1, #l_l_v23_0_0 do
                    if l_l_v23_0_0[v35] then
                        l_l_v23_0_0[v35]:Disconnect();
                        l_l_v23_0_0[v35] = nil;
                    end;
                end;
                table.clear(l_l_v23_0_0);
            end);
            if l_Character_0.PhoenixFullForm.Body.Transparency == 1 then
                v23[1] = v22.fly:GetMarkerReachedSignal("Flap"):Connect(function() --[[ Line: 91 ]]
                    -- upvalues: l_flap_0 (ref)
                    if _G.canuse == false then
                        return;
                    else
                        l_flap_0:FireServer();
                        return;
                    end;
                end);
                v23[2] = v22.idle:GetMarkerReachedSignal("Flap"):Connect(function() --[[ Line: 91 ]]
                    -- upvalues: l_flap_0 (ref)
                    if _G.canuse == false then
                        return;
                    else
                        l_flap_0:FireServer();
                        return;
                    end;
                end);
                return;
            else
                repeat
                    game["Run Service"].Heartbeat:Wait();
                until v22.fullfly ~= nil;
                l_v23_0 = v23;
                pcall(function() --[[ Line: 78 ]]
                    -- upvalues: l_v23_0 (copy)
                    for v36 = 1, #l_v23_0 do
                        if l_v23_0[v36] then
                            l_v23_0[v36]:Disconnect();
                            l_v23_0[v36] = nil;
                        end;
                    end;
                    table.clear(l_v23_0);
                end);
                v23[1] = v22.fullfly:GetMarkerReachedSignal("Flap"):Connect(function() --[[ Line: 91 ]]
                    -- upvalues: l_flap_0 (ref)
                    if _G.canuse == false then
                        return;
                    else
                        l_flap_0:FireServer();
                        return;
                    end;
                end);
                v23[2] = v22.fullidle:GetMarkerReachedSignal("Flap"):Connect(function() --[[ Line: 91 ]]
                    -- upvalues: l_flap_0 (ref)
                    if _G.canuse == false then
                        return;
                    else
                        l_flap_0:FireServer();
                        return;
                    end;
                end);
                return;
            end;
        end);
    end;
    v14.HeartbeatConnection = game["Run Service"].RenderStepped:Connect(function() --[[ Line: 122 ]]
        -- upvalues: l_Character_0 (copy), v14 (copy), l_BodyGyro_0 (copy), l_BodyVelocity_0 (copy), v17 (ref), v16 (ref), v22 (copy), l_l_PlayerModule_0_Controls_0 (ref), v24 (copy), l_CFrame_0 (ref)
        local v37 = false;
        if l_Character_0:GetAttribute("Transformed") == true then
            v37 = true;
        end;
        if v37 == true then
            local l_Tool_0 = l_Character_0:FindFirstChildWhichIsA("Tool");
            if l_Tool_0 and l_Tool_0 ~= v14.Tool then
                task.defer(function() --[[ Line: 131 ]]
                    -- upvalues: l_Character_0 (ref)
                    l_Character_0.Humanoid:UnequipTools();
                end);
            end;
            if _G.FaceMouse == true then
                l_BodyGyro_0.CFrame = CFrame.new(l_Character_0.HumanoidRootPart.Position, v14:GetMouseCFrame().p);
                l_BodyVelocity_0.Velocity = Vector3.new();
                return;
            else
                pcall(function() --[[ Line: 140 ]]
                    -- upvalues: l_Character_0 (ref)
                    l_Character_0.Humanoid.PlatformStand = false;
                    l_Character_0.Humanoid.SeatPart:Sit(nil);
                end);
            end;
        end;
        if v37 == true and _G.FaceMouse == false then
            v17 = math.clamp(v17 + 1, 0, v16);
            l_BodyGyro_0.Parent = l_Character_0.HumanoidRootPart;
            l_BodyVelocity_0.Parent = l_Character_0.LowerTorso;
            local v39 = nil;
            local v40 = nil;
            local l_PhoenixFullForm_0 = l_Character_0:FindFirstChild("PhoenixFullForm");
            if l_PhoenixFullForm_0 and l_PhoenixFullForm_0.Body.Transparency == 0 then
                if v22.fullfly == nil then
                    v22.fullfly = l_PhoenixFullForm_0.AnimationController:LoadAnimation(script.Flights.Full.fly);
                end;
                if v22.fullidle == nil then
                    v22.fullidle = l_PhoenixFullForm_0.AnimationController:LoadAnimation(script.Flights.Full.idle);
                end;
                v39 = v22.fullidle;
                v40 = v22.fullfly;
                v16 = 50;
            else
                v39 = v22.idle;
                v40 = v22.fly;
                v16 = 35;
            end;
            local v42 = v17 * (l_Character_0.Humanoid.Health / l_Character_0.Humanoid.MaxHealth);
            local l_Blocking_0 = l_Character_0:FindFirstChild("Blocking");
            if _G.canuse == false then
                l_Blocking_0 = true;
            end;
            if l_Character_0:FindFirstChild("Stun") or l_Blocking_0 ~= nil then
                v42 = 5;
            end;
            if v14.busy == true then
                v42 = 0;
            end;
            local v44 = nil;
            local l_CoordinateFrame_0 = workspace.CurrentCamera.CoordinateFrame;
            l_Character_0.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false);
            local l_l_l_PlayerModule_0_Controls_0_MoveVector_0 = l_l_PlayerModule_0_Controls_0:GetMoveVector();
            v44 = (l_CoordinateFrame_0.RightVector * l_l_l_PlayerModule_0_Controls_0_MoveVector_0.X + l_CoordinateFrame_0.LookVector * -l_l_l_PlayerModule_0_Controls_0_MoveVector_0.Z) * v42 * 2;
            local l_MoveDirection_0 = l_Character_0.Humanoid.MoveDirection;
            if l_MoveDirection_0 == Vector3.new(0, 0, 0, 0) or l_Blocking_0 ~= nil then
                l_MoveDirection_0 = l_Character_0.HumanoidRootPart.CFrame.LookVector * 1;
                if v39.IsPlaying == false then
                    v39:Play();
                    if v24[v39] then
                        v39.TimePosition = v24[v39];
                    end;
                end;
                if v40.IsPlaying == true then
                    v24[v40] = v40.TimePosition;
                    v40:Stop();
                end;
                v17 = 0;
            else
                if v39.IsPlaying == true then
                    v24[v39] = v39.TimePosition;
                    v39:Stop();
                end;
                if v40.IsPlaying == false then
                    v40:Play();
                    if v24[v40] then
                        v39.TimePosition = v24[v40];
                    end;
                end;
            end;
            l_MoveDirection_0 = Vector3.new(l_MoveDirection_0.X, l_CoordinateFrame_0.LookVector.Y * 1, l_MoveDirection_0.Z);
            local v48 = CFrame.new(l_Character_0.HumanoidRootPart.CFrame.p, l_MoveDirection_0 + l_Character_0.HumanoidRootPart.CFrame.p);
            local v49 = l_CFrame_0:Lerp(v48, 0.1);
            if v44 ~= Vector3.new() then
                l_BodyGyro_0.CFrame = v49;
            end;
            if l_Blocking_0 ~= nil and _G.canuse == true then
                l_BodyGyro_0.CFrame = l_CoordinateFrame_0;
            elseif _G.canuse == false then
                l_BodyGyro_0.CFrame = l_BodyGyro_0.Parent.CFrame;
            end;
            l_Character_0.Humanoid.AutoRotate = false;
            l_CFrame_0 = v49;
            l_BodyVelocity_0.Velocity = l_BodyVelocity_0.Velocity:Lerp(v44, 0.25);
            l_Character_0.Humanoid.PlatformStand = true;
            return;
        else
            if _G.FaceMouse == false then
                v17 = 0;
                if l_BodyVelocity_0.Parent ~= nil then
                    l_BodyGyro_0.Parent = nil;
                    l_Character_0.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true);
                end;
                l_BodyVelocity_0.Velocity = Vector3.new();
                l_BodyVelocity_0.Parent = l_BodyGyro_0.Parent;
                for _, v51 in v22 do
                    if v51.IsPlaying == true then
                        v51:Stop();
                    end;
                end;
            end;
            return;
        end;
    end);
    return v14;
end;
v9.TripleTalonKick = function(v52, _) --[[ Line: 262 ]] --[[ Name: TripleTalonKick ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v52.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.talon ~= l_Character_1 and _G.check:inspect(l_Character_1) == true and _G.canuse == true and _G.StamCheck("Triple Talon Kick") == true and v52.transformed == false then
        local v57 = v3.GetM("Triple Talon Kick");
        local l_cd_0 = v57.cd;
        if _G.StamCheck("Triple Talon Kick") == false then
            return;
        elseif v57.statreq and _G.MeetReq(v57.statreq) == false then
            return;
        else
            l_Cooldowns_0.talon = true;
            _G.canuse = false;
            l_Character_1.Humanoid.WalkSpeed = 6;
            local v59 = l_Character_1.Humanoid:LoadAnimation(script.CraneTalons);
            v59:Play();
            v59.Priority = Enum.AnimationPriority.Action4;
            v59:AdjustWeight(2);
            task.delay(1.39, function() --[[ Line: 286 ]]
                -- upvalues: v59 (copy)
                v59:AdjustSpeed(0.45);
                task.wait(0.5);
                v59:Stop(0.35);
            end);
            game.ReplicatedStorage.Events.Skill:InvokeServer("Triple Talon Kick", l_Character_1.PrimaryPart.CFrame);
            task.wait(0.45);
            v59:Stop(0);
            l_Character_1.PrimaryPart.Anchored = false;
            l_Character_1.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Triple Talon Kick", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.talon = false;
        end;
    end;
end;
v9.TalonBarrage = function(v60, v61) --[[ Line: 310 ]] --[[ Name: TalonBarrage ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v60.Cooldowns;
    local l_Character_2 = l_LocalPlayer_0.Character;
    local v64 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.rapid == false and _G.check:inspect(l_Character_2) == true and _G.canuse == true and _G.StamCheck("Talon Barrage") == true and v60.transformed == false then
        local v65 = v3.GetM("Talon Barrage");
        local l_cd_1 = v65.cd;
        if _G.StamCheck("Talon Barrage") == false then
            return;
        elseif v65.statreq and _G.MeetReq(v65.statreq) == false then
            return;
        else
            l_Cooldowns_1.rapid = true;
            _G.canuse = false;
            l_Character_2.Humanoid.WalkSpeed = 4;
            local v67 = tick();
            local v68 = l_Character_2.Humanoid:LoadAnimation(script.windupKick);
            v68:Play();
            v68.Priority = Enum.AnimationPriority.Action4;
            local v69 = game.ReplicatedStorage.Events.Skill:InvokeServer("Talon Barrage");
            local l_BodyVelocity_1 = Instance.new("BodyVelocity");
            l_BodyVelocity_1.MaxForce = Vector3.new(1000000, 1000000, 1000000, 0);
            l_BodyVelocity_1.Velocity = Vector3.new(0, 5, 0, 0);
            l_BodyVelocity_1.Parent = l_Character_2.LowerTorso;
            local v71 = false;
            local function v72() --[[ Line: 340 ]] --[[ Name: checkFunction ]]
                -- upvalues: l_Character_2 (copy), v67 (copy), l_BodyVelocity_1 (copy)
                l_Character_2.Humanoid.WalkSpeed = 4;
                if tick() - v67 >= 0.25 then
                    l_BodyVelocity_1.Velocity = l_Character_2.HumanoidRootPart.CFrame.lookVector * 10;
                end;
            end;
            local function v73() --[[ Line: 347 ]] --[[ Name: endFunction ]]
                -- upvalues: v60 (copy), l_Character_2 (copy), v67 (copy), v64 (copy)
                if v60.Tool.Parent ~= l_Character_2 or tick() - v67 >= 3 or v64.Stamina.Value <= 0 or _G.check:inspect(l_Character_2) == false then
                    return true;
                else
                    return;
                end;
            end;
            task.wait(0.25);
            v68:Stop();
            v68 = l_Character_2.Humanoid:LoadAnimation(script.kickloop);
            v68:Play();
            v60:ChargeSkill(v61, {
                Key = Enum.KeyCode.R, 
                CheckFunction = v72, 
                EndFunction = v73, 
                IgnoreInstantCastSetting = true
            });
            v71 = true;
            if v69 then
                v69:FireServer();
            end;
            l_BodyVelocity_1:Destroy();
            v68:Stop();
            l_Character_2.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Talon Barrage", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1.rapid = false;
        end;
    end;
end;
v9.PhoenixPyreapple = function(v74, v75) --[[ Line: 378 ]] --[[ Name: PhoenixPyreapple ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_2 = v74.Cooldowns;
    local l_Character_3 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_2.heal == false and _G.canuse == true and _G.check:inspect(l_Character_3) == true and _G.StamCheck("Phoenix Pyreapple") == true then
        local v79 = v3.GetM("Phoenix Pyreapple");
        local l_cd_2 = v79.cd;
        if _G.StamCheck("Phoenix Pyreapple") == false then
            return;
        elseif v79.statreq and _G.MeetReq(v79.statreq) == false then
            return;
        else
            if (l_Character_3:GetAttribute("Transformed") or false) == true then
                v74.busy = true;
            end;
            _G.canuse = false;
            local v81 = game.ReplicatedStorage.Events.Skill:InvokeServer("Phoenix Pyreapple", {
                cf = v74:GetMouseCFrame()
            });
            task.delay(1, function() --[[ Line: 401 ]]
                -- upvalues: v74 (copy)
                v74.busy = false;
            end);
            _G.canuse = true;
            if v81 == nil then
                return;
            else
                l_Cooldowns_2.heal = true;
                local v82 = true;
                local v83 = nil;
                do
                    local l_v82_0, l_v83_0 = v82, v83;
                    if v81 then
                        v74:DoubleCastSkill(v75, {
                            Key = Enum.KeyCode.T, 
                            SkipTap = true, 
                            CompleteFunction = function() --[[ Line: 417 ]] --[[ Name: CompleteFunction ]]
                                -- upvalues: l_v82_0 (ref)
                                l_v82_0 = false;
                            end, 
                            PassFunction = function() --[[ Line: 420 ]] --[[ Name: PassFunction ]]
                                -- upvalues: v74 (copy), l_Character_3 (copy)
                                return v74.Tool.Parent == l_Character_3;
                            end
                        });
                    end;
                    repeat
                        game["Run Service"].Heartbeat:Wait();
                        local l_l_Character_3_Attribute_0 = l_Character_3:GetAttribute("Transformed");
                    until (l_l_Character_3_Attribute_0 == false or l_l_Character_3_Attribute_0 == nil) and _G.check:inspect(l_Character_3) == false or l_v82_0 == false or l_Character_3.Parent == workspace.Ragdolls or l_Character_3:FindFirstChild("pHealing") == nil or l_Character_3:GetAttribute("Transformed") == true and l_Character_3:FindFirstChild("inCombat") and _G.check:inspect(l_Character_3, true) == false;
                    pcall(function() --[[ Line: 435 ]]
                        -- upvalues: l_v83_0 (ref)
                        l_v83_0:Disconnect();
                        l_v83_0 = nil;
                    end);
                    v81:FireServer();
                    _G.keysetup:cooldown("Phoenix Pyreapple", l_cd_2);
                    _G.fw(l_cd_2);
                    l_Cooldowns_2.heal = false;
                end;
            end;
        end;
    end;
end;
v9.PhoenixTransformation = function(v87, v88) --[[ Line: 446 ]] --[[ Name: PhoenixTransformation ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy), v10 (copy)
    local l_Cooldowns_3 = v87.Cooldowns;
    local l_Character_4 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_3.trans == false and _G.check:inspect(l_Character_4) == true and _G.StamCheck("Phoenix Transformation") == true and _G.canuse == true then
        local v92 = v3.GetM("Phoenix Transformation");
        local l_cd_3 = v92.cd;
        if _G.StamCheck("Phoenix Transformation") == false then
            return;
        elseif v92.statreq and _G.MeetReq(v92.statreq) == false then
            return;
        elseif l_Character_4:GetAttribute("toriDamage") == nil then
            _G.displayMessage("<Color=Red>You dont have enough mode bar!");
            return;
        elseif (l_Character_4:GetAttribute("Transformed") == nil or l_Character_4:GetAttribute("Transformed") == false) and l_Character_4:GetAttribute("toriDamage") < require(game.ReplicatedStorage.Modules.Skills.Modes.Tori)(l_LocalPlayer_0) / 4 then
            if v87.transformed == false then
                _G.displayMessage("<Color=Red>You dont have enough mode bar!");
                return;
            else
                return;
            end;
        else
            l_Cooldowns_3.trans = true;
            local _ = tick();
            _G.canuse = false;
            local v95 = tick();
            local v96 = 0.25;
            local v97 = tick();
            if _G.mobile == true then
                v96 = 1;
            end;
            v87:ChargeSkill(v88, {
                Key = Enum.KeyCode.Z, 
                IgnoreInstantCastSetting = true, 
                EndFunction = function() --[[ Line: 487 ]] --[[ Name: EndFunction ]]
                    -- upvalues: v95 (ref), v97 (copy), v96 (ref)
                    v95 = tick() - v97;
                    return v96 < v95;
                end
            });
            local v98 = v96 < v95;
            if v98 == true and _G.arena == true and l_Character_4:GetAttribute("toriDamage") < require(game.ReplicatedStorage.Modules.Skills.Modes.Tori)(l_LocalPlayer_0) then
                _G.displayMessage("<Color=/>I need <Color=Blue>100%<Color=/> mode bar for full mode.");
                _G.canuse = true;
                l_Cooldowns_3.trans = false;
                return;
            else
                _G.canuse = false;
                if l_Character_4:GetAttribute("Transformed") == nil or l_Character_4:GetAttribute("Transformed") == false then
                    task.delay(0.35, function() --[[ Line: 508 ]]
                        -- upvalues: v98 (copy), l_Character_4 (copy)
                        local v99 = 0;
                        if v98 then
                            v99 = 0.3;
                        end;
                        local l_BodyVelocity_2 = Instance.new("BodyVelocity");
                        l_BodyVelocity_2.MaxForce = Vector3.new(1000000, 1e999, 1000000, 0);
                        l_BodyVelocity_2.Velocity = Vector3.new(0, v99 + 35, 0);
                        l_BodyVelocity_2.Parent = l_Character_4.HumanoidRootPart;
                        _G.destroy(l_BodyVelocity_2, v99 + 0.25);
                    end);
                end;
                if v87.bg then
                    v87.bg.CFrame = l_Character_4.PrimaryPart.CFrame;
                end;
                v87.busy = true;
                local v101 = l_Character_4:GetAttribute("Transformed") == true;
                local v102 = nil;
                if v98 == true and v101 == true then
                    v102 = true;
                end;
                local l_PhoenixFullForm_1 = l_Character_4:FindFirstChild("PhoenixFullForm");
                if v102 == true and l_PhoenixFullForm_1 and l_PhoenixFullForm_1.Body.Transparency == 0 then
                    v102 = nil;
                end;
                local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Phoenix Transformation", {
                    v98, 
                    v102, 
                    l_Character_4.PrimaryPart.CFrame
                });
                v87.setFlaps();
                l_Character_4.Humanoid.PlatformStand = false;
                l_Character_4.Humanoid.AutoRotate = true;
                local function _() --[[ Line: 546 ]] --[[ Name: unTransform ]]
                    -- upvalues: v87 (copy), l_Character_4 (copy), v10 (ref)
                    v87.busy = false;
                    l_Character_4.Humanoid.PlatformStand = false;
                    l_Character_4.Humanoid.AutoRotate = true;
                    _G.keysetup:Destroy();
                    _G.keysetup:setup(v87.Tool.Name, v10);
                end;
                if v87.preTransformCNT then
                    v87.preTransformCNT:Disconnect();
                    v87.preTransformCNT = nil;
                end;
                if v101 == false then
                    if v98 == false then
                        task.wait(0.25);
                        v87.busy = false;
                    else
                        task.wait(1.5);
                        v87.busy = false;
                    end;
                else
                    v87.busy = false;
                    l_Character_4.Humanoid.PlatformStand = false;
                    l_Character_4.Humanoid.AutoRotate = true;
                    _G.keysetup:Destroy();
                    _G.keysetup:setup(v87.Tool.Name, v10);
                end;
                if l_Character_4:GetAttribute("Transformed") == true then
                    v87.preTransformCNT = l_Character_4:GetAttributeChangedSignal("Transformed"):Connect(function() --[[ Line: 572 ]]
                        -- upvalues: l_Character_4 (copy), v87 (copy), v10 (ref)
                        if l_Character_4:GetAttribute("Transformed") == false then
                            v87.preTransformCNT:Disconnect();
                            v87.preTransformCNT = nil;
                            v87.setFlaps();
                            v87.busy = false;
                            l_Character_4.Humanoid.PlatformStand = false;
                            l_Character_4.Humanoid.AutoRotate = true;
                            _G.keysetup:Destroy();
                            _G.keysetup:setup(v87.Tool.Name, v10);
                        end;
                    end);
                    _G.keysetup:Destroy();
                    _G.keysetup:setup(v87.Tool.Name .. " Transformed", {
                        {
                            "Block", 
                            "f"
                        }, 
                        {
                            "Phoenix Brand", 
                            "e"
                        }, 
                        {
                            "Immortal Thistle", 
                            "r"
                        }, 
                        {
                            "Phoenix Pyreapple", 
                            "t"
                        }, 
                        {
                            "Phoenix Transformation", 
                            "z"
                        }, 
                        {
                            "Phoenix Burst", 
                            "x"
                        }, 
                        {
                            "Phoenix Dive Bomb", 
                            "c"
                        }, 
                        {
                            "Phoenix Carry", 
                            "y"
                        }
                    });
                end;
                task.wait(0.35);
                _G.canuse = true;
                _G.keysetup:cooldown("Phoenix Transformation", l_cd_3);
                _G.fw(l_cd_3);
                l_Cooldowns_3.trans = false;
                --[[ close >= 8 ]]
            end;
        end;
    end;
end;
v9.ImmortalThistle = function(v106, v107) --[[ Line: 594 ]] --[[ Name: ImmortalThistle ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_4 = v106.Cooldowns;
    local l_Character_5 = l_LocalPlayer_0.Character;
    local v110 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_4.block == false and _G.check:inspect(l_Character_5) == true and _G.StamCheck("Immortal Thistle") == true and v106.transformed == true and _G.canuse == true then
        local v111 = v3.GetM("Immortal Thistle");
        local l_cd_4 = v111.cd;
        if _G.StamCheck("Immortal Thistle") == false then
            return;
        elseif v111.statreq and _G.MeetReq(v111.statreq) == false then
            return;
        else
            l_Cooldowns_4.block = true;
            _G.canuse = false;
            l_Character_5.Humanoid.WalkSpeed = 4;
            local _ = tick();
            local l_PhoenixFullForm_2 = l_Character_5:FindFirstChild("PhoenixFullForm");
            local v115 = l_PhoenixFullForm_2.Body.Transparency == 0;
            local v116 = game.ReplicatedStorage.Events.Skill:InvokeServer("Immortal Thistle", {
                cf = v106:GetMouseCFrame()
            });
            _G.FaceMouse = true;
            local v117 = nil;
            if v115 == false then
                v117 = l_Character_5.Humanoid:LoadAnimation(script.halfBlock);
                v117:Play();
            else
                v117 = l_PhoenixFullForm_2.AnimationController:LoadAnimation(script.fullBlock);
                v117:Play();
            end;
            v117.Priority = Enum.AnimationPriority.Action4;
            local v118 = false;
            do
                local l_v118_0 = v118;
                if v116 then
                    local v120 = l_Character_5:WaitForChild("Blocking", 3);
                    local v121 = game.ReplicatedStorage.Util.Melee.BlockGui:Clone();
                    v121.Parent = l_Character_5.HumanoidRootPart;
                    v106:ChargeSkill(v107, {
                        Key = Enum.KeyCode.R, 
                        IgnoreInstantCastSetting = true, 
                        EndFunction = function() --[[ Line: 640 ]] --[[ Name: EndFunction ]]
                            -- upvalues: v120 (copy), v121 (copy), l_Character_5 (copy), l_v118_0 (ref), v110 (copy), v116 (copy)
                            pcall(function() --[[ Line: 641 ]]
                                -- upvalues: v120 (ref), v121 (ref), l_Character_5 (ref)
                                local v122 = v120.Value / v120.MaxValue;
                                v121.ImageLabel.Frame.Position = UDim2.new(0, 0, 1 - v122, 0);
                                v121.ImageLabel.Frame.Size = UDim2.new(1, 0, v122, 0);
                                _G.canuse = false;
                                l_Character_5.Humanoid.WalkSpeed = 0;
                                v121.ImageLabel.Frame.ImageLabel.Size = UDim2.new(1, 0, 1 / v122, 0);
                                v121.ImageLabel.Frame.ImageLabel.Position = UDim2.new(0, 0, -(v121.ImageLabel.Frame.Position.Y.Scale / v121.ImageLabel.Frame.Size.Y.Scale), 0);
                            end);
                            local v123 = true;
                            if l_v118_0 ~= true then
                                v123 = v120 and v120.Value <= 0 or v120.Parent == nil or v110.Stamina.Value <= 0 or v116 == nil;
                            end;
                            return v123;
                        end
                    });
                    v121:Destroy();
                    _G.canuse = true;
                end;
                l_v118_0 = true;
                if v116 then
                    v116:FireServer();
                end;
                _G.FaceMouse = false;
                v117:Stop();
                l_Character_5.Humanoid.WalkSpeed = 16;
                _G.canuse = true;
                _G.keysetup:cooldown("Immortal Thistle", l_cd_4);
                _G.fw(l_cd_4);
                l_Cooldowns_4.block = false;
            end;
        end;
    end;
end;
v9.PhoenixBrand = function(v124, v125) --[[ Line: 673 ]] --[[ Name: PhoenixBrand ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_5 = v124.Cooldowns;
    local l_Character_6 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if v124.transformed == true and l_Cooldowns_5.brand == false and _G.check:inspect(l_Character_6) == true and _G.canuse == true and _G.StamCheck("Phoenix Brand") == true then
        local v129 = v3.GetM("Phoenix Brand");
        local l_cd_5 = v129.cd;
        if _G.StamCheck("Phoenix Brand") == false then
            return;
        elseif v129.statreq and _G.MeetReq(v129.statreq) == false then
            return;
        else
            l_Cooldowns_5.brand = true;
            _G.canuse = false;
            l_Character_6.Humanoid.WalkSpeed = 4;
            local v131 = tick();
            local l_PhoenixFullForm_3 = l_Character_6:FindFirstChild("PhoenixFullForm");
            local v133 = l_PhoenixFullForm_3.Body.Transparency == 0;
            _G.FaceMouse = true;
            local v134 = game.ReplicatedStorage.Events.Skill:InvokeServer("Phoenix Brand", {
                cf = v124:GetMouseCFrame()
            });
            local v135 = nil;
            if v133 == false then
                v135 = l_Character_6.Humanoid:LoadAnimation(script.Brand.halfCharge);
                v135:Play();
            else
                v135 = l_PhoenixFullForm_3.AnimationController:LoadAnimation(script.Brand.fullCharge);
                v135:Play();
            end;
            local v136 = false;
            v124:ChargeSkill(v125, {
                Key = Enum.KeyCode.E, 
                CheckFunction = function() --[[ Line: 712 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_6 (copy)
                    l_Character_6.Humanoid.WalkSpeed = 4;
                end, 
                EndFunction = function() --[[ Line: 716 ]] --[[ Name: endFunction ]]
                    -- upvalues: v124 (copy), l_Character_6 (copy), v131 (copy)
                    if v124.Tool.Parent ~= l_Character_6 or tick() - v131 >= 30 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v135:Stop(0);
            local v137 = nil;
            v137 = if v133 == false then l_Character_6.Humanoid:LoadAnimation(script.Brand.dash) else l_PhoenixFullForm_3.AnimationController:LoadAnimation(script.Brand.fullDash);
            v137.Priority = Enum.AnimationPriority.Action3;
            v137:Play(0);
            v137:AdjustWeight(10);
            local l_p_0 = v124:GetMouseCFrame().p;
            local v139 = Ray.new(l_Character_6.PrimaryPart.CFrame.p, (l_p_0 - l_Character_6.PrimaryPart.CFrame.p).unit * (l_p_0 - l_Character_6.PrimaryPart.CFrame.p).magnitude);
            local _, v141 = _G.raycastWhitelist(v139, {
                workspace.Islands, 
                workspace.Ships, 
                workspace.Env
            });
            l_p_0 = v141;
            local v142 = math.clamp(math.clamp((CFrame.new(l_Character_6.PrimaryPart.CFrame.Position, l_p_0).Position - l_p_0).Magnitude, 20, 150) - 3, 0, 150) / 300;
            do
                local l_v137_0 = v137;
                task.delay(v142 * 1, function() --[[ Line: 749 ]]
                    -- upvalues: l_v137_0 (ref), v133 (copy), l_Character_6 (copy), l_PhoenixFullForm_3 (copy)
                    task.wait(0.2);
                    task.delay(1, function() --[[ Line: 752 ]]
                        -- upvalues: l_v137_0 (ref)
                        l_v137_0:Stop(0.15);
                    end);
                    local v144 = nil;
                    v144 = if v133 == false then l_Character_6.Humanoid:LoadAnimation(script.Brand.kick) else l_PhoenixFullForm_3.AnimationController:LoadAnimation(script.Brand.fullKick);
                    v144:Play(0.1, 1.35, 1.2);
                    v144:AdjustWeight(2);
                    v144.Priority = Enum.AnimationPriority.Action4;
                end);
                l_Character_6.Humanoid.AutoRotate = false;
                v136 = true;
                if v134 then
                    v134:FireServer(l_p_0);
                end;
                v124.busy = true;
                _G.FaceMouse = false;
                task.wait(1.75);
                l_Character_6.Humanoid.AutoRotate = true;
                v124.busy = false;
                l_Character_6.Humanoid.WalkSpeed = 16;
                _G.canuse = true;
                _G.keysetup:cooldown("Phoenix Brand", l_cd_5);
                _G.fw(l_cd_5);
                l_Cooldowns_5.brand = false;
            end;
        end;
    end;
end;
v9.PhoenixDiveBomb = function(v145, _) --[[ Line: 784 ]] --[[ Name: PhoenixDiveBomb ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_6 = v145.Cooldowns;
    local l_Character_7 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_6.bomb == false and _G.canuse == true and _G.check:inspect(l_Character_7) == true and _G.StamCheck("Phoenix Dive Bomb") == true then
        local v150 = v3.GetM("Phoenix Dive Bomb");
        local l_cd_6 = v150.cd;
        if _G.StamCheck("Phoenix Dive Bomb") == false then
            return;
        elseif v150.statreq and _G.MeetReq(v150.statreq) == false then
            return;
        elseif v145.transformed == false then
            _G.displayMessage("<Color=Red>You need to be transformed to use this!");
            return;
        else
            l_Cooldowns_6.bomb = true;
            _G.canuse = false;
            l_Character_7.Humanoid.WalkSpeed = 4;
            local _ = tick();
            local _ = l_Character_7:FindFirstChild("PhoenixFullForm").Body.Transparency == 0;
            local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Phoenix Dive Bomb", v145:GetMouseCFrame());
            v145.busy = true;
            l_Character_7.Humanoid.AutoRotate = false;
            v145.bg.MaxTorque = Vector3.new(0, 0, 0, 0);
            task.wait(3);
            v145.bg.MaxTorque = Vector3.new(99999997952, 99999997952, 99999997952, 0);
            l_Character_7.Humanoid.AutoRotate = true;
            v145.busy = false;
            l_Character_7.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Phoenix Dive Bomb", l_cd_6);
            _G.fw(l_cd_6);
            l_Cooldowns_6.bomb = false;
        end;
    end;
end;
v9.PhoenixBurst = function(v155, v156) --[[ Line: 830 ]] --[[ Name: PhoenixBurst ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_7 = v155.Cooldowns;
    local l_Character_8 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_7.pburst == false and _G.canuse == true and _G.check:inspect(l_Character_8) == true and _G.StamCheck("Phoenix Burst") == true then
        local v160 = v3.GetM("Phoenix Burst");
        local l_cd_7 = v160.cd;
        if _G.StamCheck("Phoenix Burst") == false then
            return;
        elseif v160.statreq and _G.MeetReq(v160.statreq) == false then
            return;
        elseif v155.transformed == false then
            _G.displayMessage("<Color=Red>You need to be transformed to use this!");
            return;
        else
            l_Cooldowns_7.pburst = true;
            _G.canuse = false;
            l_Character_8.Humanoid.WalkSpeed = 4;
            local v162 = tick();
            local l_PhoenixFullForm_4 = l_Character_8:FindFirstChild("PhoenixFullForm");
            local v164 = l_PhoenixFullForm_4.Body.Transparency == 0;
            l_Character_8:SetPrimaryPartCFrame(CFrame.new(l_Character_8.PrimaryPart.Position, v155:GetMouseCFrame().p));
            _G.FaceMouse = true;
            local v165 = game.ReplicatedStorage.Events.Skill:InvokeServer("Phoenix Burst");
            local v166 = nil;
            if v164 == false then
                v166 = l_Character_8.Humanoid:LoadAnimation(script.Bluebird.halfCharge);
                v166:Play();
            else
                v166 = l_PhoenixFullForm_4.AnimationController:LoadAnimation(script.Bluebird.fullCharge);
                v166:Play();
            end;
            v166:AdjustWeight(5);
            v155:ChargeSkill(v156, {
                Key = Enum.KeyCode.X, 
                CheckFunction = function() --[[ Line: 870 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_8 (copy)
                    _G.canuse = false;
                    l_Character_8.Humanoid.WalkSpeed = 4;
                end, 
                EndFunction = function() --[[ Line: 875 ]] --[[ Name: endFunction ]]
                    -- upvalues: v155 (copy), l_Character_8 (copy), v162 (copy)
                    if v155.Tool.Parent ~= l_Character_8 or tick() - v162 >= 5 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v166:Stop();
            if v164 == false then
                l_Character_8.Humanoid:LoadAnimation(script.Bluebird.halfBurst):Play(0);
            else
                l_PhoenixFullForm_4.AnimationController:LoadAnimation(script.Bluebird.fullBurst):Play(0);
            end;
            l_Character_8.PrimaryPart.Anchored = true;
            l_Character_8.Humanoid.AutoRotate = false;
            if v165 then
                v165:FireServer(l_Character_8.PrimaryPart.CFrame);
            end;
            v155.busy = true;
            _G.FaceMouse = false;
            task.wait(0.4);
            l_Character_8.PrimaryPart.Anchored = false;
            l_Character_8.Humanoid.AutoRotate = true;
            v155.busy = false;
            l_Character_8.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Phoenix Burst", l_cd_7);
            _G.fw(l_cd_7);
            l_Cooldowns_7.pburst = false;
        end;
    end;
end;
v9.PhoenixCarry = function(v167, v168) --[[ Line: 920 ]] --[[ Name: PhoenixCarry ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_8 = v167.Cooldowns;
    local l_Character_9 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_8.carry == false and _G.canuse == true and _G.check:inspect(l_Character_9) == true and _G.StamCheck("Phoenix Carry") == true then
        local v172 = v3.GetM("Phoenix Carry");
        local l_cd_8 = v172.cd;
        if l_Character_9:GetAttribute("customM1") ~= "ToriFullForm" then
            _G.displayMessage("<Color=Red>You must be fully transformed to use this!");
            return;
        elseif _G.StamCheck("Phoenix Carry") == false then
            return;
        elseif v172.statreq and _G.MeetReq(v172.statreq) == false then
            return;
        else
            l_Cooldowns_8.carry = true;
            local v174 = game.ReplicatedStorage.Events.Skill:InvokeServer("Phoenix Carry");
            if v174 then
                v167:DoubleCastSkill(v168, {
                    Key = Enum.KeyCode.Y, 
                    SkipTap = true, 
                    CompleteFunction = function() --[[ Line: 951 ]] --[[ Name: CompleteFunction ]]
                        -- upvalues: v174 (copy)
                        if v174 then
                            v174:FireServer();
                        end;
                    end, 
                    PassFunction = function() --[[ Line: 956 ]] --[[ Name: PassFunction ]]
                        return true;
                    end
                });
                repeat
                    task.wait();
                until v174:IsDescendantOf(game) == false;
            end;
            _G.keysetup:cooldown("Phoenix Carry", l_cd_8);
            _G.fw(l_cd_8);
            l_Cooldowns_8.carry = false;
        end;
    end;
end;
return v9;