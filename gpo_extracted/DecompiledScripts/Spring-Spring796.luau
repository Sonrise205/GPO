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
local v9 = game.ReplicatedStorage.Modules.SwordHandle.Swords["Spring-Spring Mode"];
local function v16(v10, v11) --[[ Line: 21 ]] --[[ Name: playAnimation ]]
    local v12 = {};
    local l_v10_Descendants_0 = v10:GetDescendants();
    for v14 = 1, #l_v10_Descendants_0 do
        if l_v10_Descendants_0[v14]:IsA("Humanoid") or l_v10_Descendants_0[v14]:IsA("AnimationController") and l_v10_Descendants_0[v14].Parent.Name:match("Spring") then
            local v15 = l_v10_Descendants_0[v14]:LoadAnimation(v11);
            v15:Play();
            v15:AdjustWeight(2);
            table.insert(v12, v15);
        end;
    end;
    return v12;
end;
local function v19(v17) --[[ Line: 35 ]] --[[ Name: stopAnims ]]
    for v18 = 1, #v17 do
        if v17[v18].IsPlaying ~= false then
            v17[v18]:Stop();
        end;
    end;
end;
local function v23(v20, v21) --[[ Line: 44 ]] --[[ Name: playAnims ]]
    for v22 = 1, #v20 do
        if v20[v22].IsPlaying ~= true then
            v20[v22]:Play();
            if v21 then
                v20[v22]:AdjustSpeed(v21);
            end;
        end;
    end;
end;
v8.new = function(_) --[[ Line: 56 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v8 (copy), l_LocalPlayer_0 (copy), v16 (copy), v9 (copy), v19 (copy), v23 (copy)
    local v25 = setmetatable(v4.new(script.Name), v8);
    v25.Cooldowns = {
        blitz = false, 
        crusher = false, 
        knock = false, 
        hooper = false, 
        mode = false, 
        bomb = false, 
        leap = false
    };
    local l_Character_0 = l_LocalPlayer_0.Character;
    v25.swordMode = {
        Idle = v16(l_Character_0, v9.Idle), 
        Run = v16(l_Character_0, v9.runAnim), 
        Walk = v16(l_Character_0, v9.walkAnim)
    };
    local l_swordMode_0 = v25.swordMode;
    v25.HeartConnection = game["Run Service"].Heartbeat:Connect(function() --[[ Line: 70 ]]
        -- upvalues: l_Character_0 (copy), v25 (copy), v19 (ref), l_swordMode_0 (copy), v23 (ref)
        if l_Character_0:GetAttribute("springMode") ~= nil and v25.Tool and v25.Tool.Parent == l_Character_0 and l_Character_0.Humanoid.FloorMaterial ~= Enum.Material.Air then
            if l_Character_0.Humanoid.MoveDirection ~= Vector3.new() then
                if l_Character_0.Humanoid.WalkSpeed < 25 then
                    v19(l_swordMode_0.Run);
                    v23(l_swordMode_0.Walk);
                    return;
                else
                    v19(l_swordMode_0.Walk);
                    v23(l_swordMode_0.Run, 2);
                    return;
                end;
            else
                v19(l_swordMode_0.Run);
                v19(l_swordMode_0.Walk);
                v23(l_swordMode_0.Idle);
                return;
            end;
        else
            v19(l_swordMode_0.Run);
            v19(l_swordMode_0.Walk);
            v19(l_swordMode_0.Idle);
            if v25.Tool then
                v25.Tool:SetAttribute("customRun", nil);
            end;
            return;
        end;
    end);
    return v25;
end;
v8.SpringBlitz = function(v28, _) --[[ Line: 99 ]] --[[ Name: SpringBlitz ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v28.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.blitz == false and _G.check:inspect(l_Character_1) == true and _G.StamCheck("Spring Blitz") == true then
        local v33 = v3.GetM("Spring Blitz");
        local l_cd_0 = v33.cd;
        if _G.StamCheck("Spring Blitz") == false then
            return;
        elseif v33.statreq and _G.MeetReq(v33.statreq) == false then
            return;
        else
            l_Cooldowns_0.blitz = true;
            _G.canuse = false;
            if game.ReplicatedStorage.Events.Skill:InvokeServer("Spring Blitz", l_Character_1.PrimaryPart.CFrame) then
                task.wait(2.25);
            end;
            _G.canuse = true;
            _G.keysetup:cooldown("Spring Blitz", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.blitz = false;
        end;
    end;
end;
v8.CoilCrusher = function(v35, v36) --[[ Line: 128 ]] --[[ Name: CoilCrusher ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy), v16 (copy), v19 (copy)
    local l_Cooldowns_1 = v35.Cooldowns;
    local l_Character_2 = l_LocalPlayer_0.Character;
    local v39 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.crusher == false and _G.check:inspect(l_Character_2) == true and _G.StamCheck("Coil Crusher") == true then
        local v40 = v3.GetM("Coil Crusher");
        local l_cd_1 = v40.cd;
        if _G.StamCheck("Coil Crusher") == false then
            return;
        elseif v40.statreq and _G.MeetReq(v40.statreq) == false then
            return;
        else
            l_Cooldowns_1.crusher = true;
            _G.canuse = false;
            local v42 = v16(l_Character_2, script.coilCharge);
            _G.FaceMouse = true;
            _G.canuse = false;
            local v43 = nil;
            local v44 = nil;
            do
                local l_v43_0, l_v44_0 = v43, v44;
                pcall(function() --[[ Line: 157 ]]
                    -- upvalues: l_v43_0 (ref), l_v44_0 (ref)
                    local v47, v48 = unpack(game.ReplicatedStorage.Events.Skill:InvokeServer("Coil Crusher"));
                    l_v43_0 = v47;
                    l_v44_0 = v48;
                end);
                local v49 = tick();
                local function v50() --[[ Line: 164 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_2 (copy), v49 (copy), l_v43_0 (ref), v39 (copy)
                    if not l_Character_2:FindFirstChild(script.Name) or tick() - v49 >= 10 or l_v43_0 == nil or l_Character_2.Parent == nil or l_Character_2.Parent ~= workspace.PlayerCharacters or v39.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end;
                v35:ChargeSkill(v36, {
                    Key = Enum.KeyCode.C, 
                    EndFunction = v50
                });
                v19(v42);
                if l_v43_0 then
                    l_v43_0:FireServer();
                end;
                local _ = v16(l_Character_2, script.coilLaunch);
                local v52 = (tick() - v49) * 50;
                local l_LinearVelocity_0 = Instance.new("LinearVelocity");
                l_LinearVelocity_0.Attachment0 = l_Character_2.PrimaryPart.RootRigAttachment;
                l_LinearVelocity_0.MaxForce = 100000000000;
                l_LinearVelocity_0.VelocityConstraintMode = Enum.VelocityConstraintMode.Vector;
                l_LinearVelocity_0.VectorVelocity = l_Character_2:GetPivot().LookVector * (175 + v52) + Vector3.new(0, 0.10000000149011612, 0, 0);
                l_LinearVelocity_0.RelativeTo = Enum.ActuatorRelativeTo.World;
                l_LinearVelocity_0.Parent = l_Character_2;
                local l_AlignOrientation_0 = Instance.new("AlignOrientation");
                l_AlignOrientation_0.Attachment0 = l_Character_2.PrimaryPart.RootRigAttachment;
                l_AlignOrientation_0.Mode = 0;
                l_AlignOrientation_0.CFrame = l_Character_2:GetPivot();
                l_AlignOrientation_0.Responsiveness = 45;
                l_AlignOrientation_0.MaxTorque = 100000000000;
                l_AlignOrientation_0.Parent = l_Character_2;
                _G.FaceMouse = false;
                _G.mouseLevel = false;
                _G.tween(l_LinearVelocity_0, {
                    0.5, 
                    "Linear", 
                    Enum.EasingDirection.Out
                }, {
                    VectorVelocity = Vector3.new(0, 0, 0, 0)
                });
                _G.destroy(l_LinearVelocity_0, 0.5);
                _G.destroy(l_AlignOrientation_0, 0.8);
                local v55 = nil;
                local _ = false;
                local function v59(v57) --[[ Line: 204 ]] --[[ Name: hitfound ]]
                    -- upvalues: l_LinearVelocity_0 (copy), l_v44_0 (ref), v19 (ref), v42 (copy), l_Character_2 (copy), v55 (ref)
                    l_LinearVelocity_0:Destroy();
                    if l_v44_0 then
                        v19(v42);
                        local _ = l_Character_2.PrimaryPart.CFrame * CFrame.new(0, 0, -5);
                        l_v44_0:FireServer(v57.Parent, l_Character_2.PrimaryPart.CFrame);
                        v55 = true;
                    end;
                end;
                _G.hitbox:start(l_Character_2, Vector3.new(15, 15, 15, 0), 0.5, CFrame.new(0, 0, -1), v59);
                task.wait(0.5);
                _G.canuse = true;
                _G.keysetup:cooldown("Coil Crusher", l_cd_1);
                _G.fw(l_cd_1);
                l_Cooldowns_1.crusher = false;
            end;
        end;
    end;
end;
v8.DeathKnock = function(v60, v61) --[[ Line: 226 ]] --[[ Name: DeathKnock ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy), v16 (copy), v19 (copy)
    local l_Cooldowns_2 = v60.Cooldowns;
    local l_Character_3 = l_LocalPlayer_0.Character;
    local v64 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_2.knock == false and _G.check:inspect(l_Character_3) == true and _G.StamCheck("Death Knock") == true then
        local v65 = v3.GetM("Death Knock");
        local l_cd_2 = v65.cd;
        if _G.StamCheck("Death Knock") == false then
            return;
        elseif v65.statreq and _G.MeetReq(v65.statreq) == false then
            return;
        else
            l_Cooldowns_2.knock = true;
            _G.canuse = false;
            local v67 = v16(l_Character_3, script.deathCharge);
            _G.canuse = false;
            local v68 = nil;
            local v69 = nil;
            do
                local l_v68_0, l_v69_0 = v68, v69;
                pcall(function() --[[ Line: 247 ]]
                    -- upvalues: l_v68_0 (ref), l_v69_0 (ref)
                    local v72, v73 = unpack(game.ReplicatedStorage.Events.Skill:InvokeServer("Death Knock"));
                    l_v68_0 = v72;
                    l_v69_0 = v73;
                end);
                local v74 = tick();
                v60:ChargeSkill(v61, {
                    Key = Enum.KeyCode.X, 
                    CheckFunction = function() --[[ Line: 251 ]] --[[ Name: checkFunction ]]
                        -- upvalues: l_Character_3 (copy)
                        l_Character_3.Humanoid.WalkSpeed = 4;
                    end, 
                    EndFunction = function() --[[ Line: 255 ]] --[[ Name: endFunction ]]
                        -- upvalues: l_Character_3 (copy), v74 (copy), v64 (copy)
                        if not l_Character_3:FindFirstChild(script.Name) or tick() - v74 >= 10 or l_Character_3.Parent == nil or l_Character_3.Parent ~= workspace.PlayerCharacters or v64.Stamina.Value <= 0 then
                            return true;
                        else
                            return;
                        end;
                    end
                });
                v19(v67);
                if l_v68_0 then
                    l_v68_0:FireServer();
                end;
                local _ = v16(l_Character_3, script.deathPunch);
                local l_LinearVelocity_1 = Instance.new("LinearVelocity");
                l_LinearVelocity_1.Attachment0 = l_Character_3.PrimaryPart.RootRigAttachment;
                l_LinearVelocity_1.MaxForce = 100000000000;
                l_LinearVelocity_1.VelocityConstraintMode = Enum.VelocityConstraintMode.Vector;
                l_LinearVelocity_1.VectorVelocity = l_Character_3:GetPivot().LookVector * 125 + Vector3.new(0, 0.10000000149011612, 0, 0);
                l_LinearVelocity_1.RelativeTo = Enum.ActuatorRelativeTo.World;
                l_LinearVelocity_1.Parent = l_Character_3;
                local l_AlignOrientation_1 = Instance.new("AlignOrientation");
                l_AlignOrientation_1.Attachment0 = l_Character_3.PrimaryPart.RootRigAttachment;
                l_AlignOrientation_1.Mode = 0;
                l_AlignOrientation_1.CFrame = l_Character_3:GetPivot();
                l_AlignOrientation_1.Responsiveness = 45;
                l_AlignOrientation_1.MaxTorque = 100000000000;
                l_AlignOrientation_1.Parent = l_Character_3;
                _G.tween(l_LinearVelocity_1, {
                    0.5, 
                    "Linear", 
                    Enum.EasingDirection.Out
                }, {
                    VectorVelocity = Vector3.new(0, 0, 0, 0)
                });
                _G.destroy(l_LinearVelocity_1, 0.5);
                _G.destroy(l_AlignOrientation_1, 0.8);
                local v78 = nil;
                local _ = false;
                local function v81(v80) --[[ Line: 293 ]] --[[ Name: hitfound ]]
                    -- upvalues: l_LinearVelocity_1 (copy), l_v69_0 (ref), l_Character_3 (copy), v78 (ref)
                    l_LinearVelocity_1:Destroy();
                    if l_v69_0 then
                        l_v69_0:FireServer(v80.Parent, l_Character_3.PrimaryPart.CFrame);
                        v78 = true;
                    end;
                end;
                _G.hitbox:start(l_Character_3, Vector3.new(15, 15, 15, 0), 0.5, CFrame.new(0, 0, -1), v81);
                task.wait(0.5);
                l_Character_3.Humanoid.WalkSpeed = 16;
                _G.canuse = true;
                _G.keysetup:cooldown("Death Knock", l_cd_2);
                _G.fw(l_cd_2);
                l_Cooldowns_2.knock = false;
            end;
        end;
    end;
end;
v8.SpringFacebreaker = function(v82, v83) --[[ Line: 313 ]] --[[ Name: SpringFacebreaker ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy), v16 (copy), v19 (copy)
    local l_Cooldowns_3 = v82.Cooldowns;
    local l_Character_4 = l_LocalPlayer_0.Character;
    local v86 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_3.hooper == false and _G.check:inspect(l_Character_4) == true and _G.StamCheck("Spring Facebreaker") == true then
        local v87 = v3.GetM("Spring Facebreaker");
        local l_cd_3 = v87.cd;
        if _G.StamCheck("Spring Facebreaker") == false then
            return;
        elseif v87.statreq and _G.MeetReq(v87.statreq) == false then
            return;
        else
            l_Cooldowns_3.hooper = true;
            _G.canuse = false;
            local v89 = v16(l_Character_4, script.hopper);
            _G.mouseLevel = true;
            _G.FaceMouse = true;
            _G.canuse = false;
            local v90 = nil;
            local v91 = nil;
            do
                local l_v90_0, l_v91_0 = v90, v91;
                pcall(function() --[[ Line: 336 ]]
                    -- upvalues: l_v90_0 (ref), l_v91_0 (ref)
                    local v94, v95 = unpack(game.ReplicatedStorage.Events.Skill:InvokeServer("Spring Facebreaker"));
                    l_v90_0 = v94;
                    l_v91_0 = v95;
                end);
                local v96 = tick();
                local function v97() --[[ Line: 341 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_4 (copy), v96 (copy), l_v90_0 (ref), v86 (copy)
                    if not l_Character_4:FindFirstChild(script.Name) or tick() - v96 >= 10 or l_v90_0 == nil or l_Character_4.Parent == nil or l_Character_4.Parent ~= workspace.PlayerCharacters or v86.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end;
                for v98 = 1, #v89 do
                    if v98 ~= 1 then
                        task.spawn(function() --[[ Line: 350 ]]
                            -- upvalues: v89 (copy), v98 (copy)
                            _G.PauseAnim(v89[v98], 0.375, 1);
                        end);
                    end;
                end;
                _G.PauseAnim(v89[1], 0.375, 1);
                v82:ChargeSkill(v83, {
                    Key = Enum.KeyCode.R, 
                    EndFunction = v97
                });
                for v99 = 1, #v89 do
                    v89[v99]:AdjustSpeed(1);
                end;
                if l_v90_0 then
                    l_v90_0:FireServer();
                end;
                local v100 = (tick() - v96) * 25;
                local l_LinearVelocity_2 = Instance.new("LinearVelocity");
                l_LinearVelocity_2.Attachment0 = l_Character_4.PrimaryPart.RootRigAttachment;
                l_LinearVelocity_2.MaxForce = 100000000000;
                l_LinearVelocity_2.VelocityConstraintMode = Enum.VelocityConstraintMode.Vector;
                l_LinearVelocity_2.VectorVelocity = l_Character_4:GetPivot().LookVector * (125 + v100) + Vector3.new(0, 0.10000000149011612, 0, 0);
                l_LinearVelocity_2.RelativeTo = Enum.ActuatorRelativeTo.World;
                l_LinearVelocity_2.Parent = l_Character_4;
                local l_AlignOrientation_2 = Instance.new("AlignOrientation");
                l_AlignOrientation_2.Attachment0 = l_Character_4.PrimaryPart.RootRigAttachment;
                l_AlignOrientation_2.Mode = 0;
                l_AlignOrientation_2.CFrame = l_Character_4:GetPivot();
                l_AlignOrientation_2.Responsiveness = 45;
                l_AlignOrientation_2.MaxTorque = 100000000000;
                l_AlignOrientation_2.Parent = l_Character_4;
                _G.FaceMouse = false;
                _G.mouseLevel = false;
                _G.tween(l_LinearVelocity_2, {
                    0.5, 
                    "Linear", 
                    Enum.EasingDirection.Out
                }, {
                    VectorVelocity = Vector3.new(0, 0, 0, 0)
                });
                _G.destroy(l_LinearVelocity_2, 0.5);
                _G.destroy(l_AlignOrientation_2, 0.8);
                local v103 = nil;
                local _ = false;
                local function v107(v105) --[[ Line: 392 ]] --[[ Name: hitfound ]]
                    -- upvalues: l_LinearVelocity_2 (copy), l_v91_0 (ref), v19 (ref), v89 (copy), l_Character_4 (copy), v103 (ref)
                    l_LinearVelocity_2:Destroy();
                    if l_v91_0 then
                        v19(v89);
                        local _ = l_Character_4.PrimaryPart.CFrame * CFrame.new(0, 0, -5);
                        l_v91_0:FireServer(v105.Parent, l_Character_4.PrimaryPart.CFrame);
                        v103 = true;
                    end;
                end;
                _G.hitbox:start(l_Character_4, Vector3.new(15, 15, 15, 0), 0.5, CFrame.new(0, 0, -1), v107);
                task.wait(0.5);
                _G.canuse = true;
                _G.keysetup:cooldown("Spring Facebreaker", l_cd_3);
                _G.fw(l_cd_3);
                l_Cooldowns_3.hooper = false;
            end;
        end;
    end;
end;
v8.SpringMode = function(v108, _) --[[ Line: 414 ]] --[[ Name: SpringMode ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_4 = v108.Cooldowns;
    local l_Character_5 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Character_5:GetAttribute("springMode") == nil and l_Cooldowns_4.mode == false and _G.check:inspect(l_Character_5) == true and _G.StamCheck("Spring Mode") == true then
        local v113 = v3.GetM("Spring Mode");
        local l_cd_4 = v113.cd;
        if _G.StamCheck("Spring Mode") == false then
            return;
        elseif v113.statreq and _G.MeetReq(v113.statreq) == false then
            return;
        else
            l_Cooldowns_4.mode = true;
            _G.canuse = false;
            local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Spring Mode", v108.Tool);
            if l_Character_5:GetAttribute("springMode") then
                v108.Tool:SetAttribute("customRun", true);
            else
                v108.Tool:SetAttribute("customRun", nil);
            end;
            _G.canuse = true;
            _G.keysetup:cooldown("Spring Mode", l_cd_4);
            _G.fw(l_cd_4);
            l_Cooldowns_4.mode = false;
        end;
    end;
end;
v8.SpringLeap = function(v116, v117) --[[ Line: 446 ]] --[[ Name: SpringLeap ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy), v16 (copy), v19 (copy)
    local l_Cooldowns_5 = v116.Cooldowns;
    local l_Character_6 = l_LocalPlayer_0.Character;
    local v120 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.grounded == false and l_Cooldowns_5.leap == false and _G.check:inspect(l_Character_6) == true and _G.StamCheck("Spring Leap") == true then
        local v121 = v3.GetM("Spring Leap");
        local l_cd_5 = v121.cd;
        if _G.StamCheck("Spring Leap") == false then
            return;
        elseif v121.statreq and _G.MeetReq(v121.statreq) == false then
            return;
        else
            l_Cooldowns_5.leap = true;
            local v123 = 0;
            local v124 = 1;
            if l_Character_6:GetAttribute("springMode") then
                v124 = 3;
            end;
            local v125 = game.ReplicatedStorage.Events.Skill:InvokeServer("Spring Leap");
            local function v127() --[[ Line: 472 ]] --[[ Name: passFunction ]]
                -- upvalues: l_Character_6 (copy)
                local v126 = false;
                if _G.grounded == false then
                    v126 = false;
                    if _G.check:inspect(l_Character_6) == true then
                        v126 = _G.canuse == true;
                    end;
                end;
                return v126;
            end;
            warn(math.random(1, 1000000));
            do
                local l_v123_0, l_v124_0 = v123, v124;
                local function v130() --[[ Line: 476 ]] --[[ Name: leap ]]
                    -- upvalues: l_v123_0 (ref), v16 (ref), l_Character_6 (copy), v120 (copy), v125 (copy), v116 (copy), v117 (copy), v19 (ref), l_v124_0 (ref), l_cd_5 (copy), l_Cooldowns_5 (copy), v127 (copy), v130 (copy)
                    warn("leaping");
                    l_v123_0 = l_v123_0 + 1;
                    _G.canuse = false;
                    _G.FaceMouse = true;
                    local v131 = tick();
                    local v132 = v16(l_Character_6, script.leapCharge);
                    local function v133() --[[ Line: 483 ]] --[[ Name: endFunction ]]
                        -- upvalues: l_Character_6 (ref), v131 (copy), v120 (ref)
                        if not l_Character_6:FindFirstChild(script.Name) or tick() - v131 >= 5 or v120.Stamina.Value <= 0 then
                            return true;
                        else
                            return;
                        end;
                    end;
                    if v125 then
                        v125:FireServer("charge");
                    end;
                    v116:ChargeSkill(v117, {
                        Key = Enum.KeyCode.T, 
                        EndFunction = v133, 
                        PCInputType = "Default", 
                        MobileInputType = "TapScreen"
                    });
                    v19(v132);
                    local _ = v16(l_Character_6, script.leapJump);
                    if v125 then
                        v125:FireServer(nil, l_Character_6.PrimaryPart.CFrame * CFrame.new(0, -3, 2));
                    end;
                    local l_CFrame_0 = l_Character_6.PrimaryPart.CFrame;
                    local l_BodyVelocity_0 = Instance.new("BodyVelocity");
                    l_BodyVelocity_0.MaxForce = Vector3.new(1000000, 1000000, 1000000, 0);
                    l_BodyVelocity_0.Velocity = l_CFrame_0.LookVector * (100 + (tick() - v131) * 15);
                    l_BodyVelocity_0.Parent = l_Character_6.PrimaryPart;
                    local l_AlignOrientation_3 = Instance.new("AlignOrientation");
                    l_AlignOrientation_3.Attachment0 = l_Character_6.PrimaryPart.RootRigAttachment;
                    l_AlignOrientation_3.Mode = 0;
                    l_AlignOrientation_3.CFrame = l_Character_6:GetPivot();
                    l_AlignOrientation_3.Responsiveness = 45;
                    l_AlignOrientation_3.MaxTorque = 100000000000;
                    l_AlignOrientation_3.Parent = l_Character_6;
                    _G.destroy({
                        l_BodyVelocity_0, 
                        l_AlignOrientation_3
                    }, 0.25);
                    _G.FaceMouse = false;
                    task.wait(0.35);
                    _G.canuse = true;
                    if l_v124_0 <= l_v123_0 then
                        _G.keysetup:cooldown("Spring Leap", l_cd_5);
                        _G.fw(l_cd_5);
                        l_Cooldowns_5.leap = false;
                        return;
                    else
                        v116:DoubleCastSkill(v117, {
                            ToolName = script.Name, 
                            Key = Enum.KeyCode.T, 
                            Button = v117, 
                            PassFunction = v127, 
                            CompleteFunction = v130, 
                            SkipTap = true
                        });
                        return;
                    end;
                end;
                v130();
            end;
        end;
    end;
end;
return v8;