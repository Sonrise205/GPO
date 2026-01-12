local v0 = {};
v0.__index = v0;
local l_LocalPlayer_0 = game.Players.LocalPlayer;
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = l_LocalPlayer_0.Character or l_LocalPlayer_0.CharacterAdded:Wait();
local v4 = require(game.ReplicatedStorage.Modules.SwordHandle.SwordInfo);
local _ = game.ReplicatedStorage:WaitForChild("CombatAnimations", 1);
local l_HttpService_0 = game:GetService("HttpService");
local _ = v3.Humanoid.Animator;
local v8 = nil;
local v9 = nil;
local v10 = nil;
local v11 = nil;
local v12 = tick();
local v13 = 0;
v0.new = function(v14) --[[ Line: 23 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v15 = setmetatable({}, v0);
    v15.Handler = v14;
    v15.Utils = v14.Utils;
    v14.PunchCooldown = false;
    v14.PreCombo = 0;
    v14.PunchCombo = 0;
    v14.prehit = false;
    v14.extendedcombo = 5;
    v14.maxcombo = 3;
    v14.precombotype = nil;
    v14.lastpunch = nil;
    v14.resetid = nil;
    v14.preAnim = nil;
    v14.precombo = 0;
    return v15;
end;
v0.stopM1Anims = function(_) --[[ Line: 43 ]] --[[ Name: stopM1Anims ]]
    -- upvalues: v11 (ref), v3 (copy)
    if v11 == nil then
        return;
    else
        warn("m1 anims stopping");
        local l_PlayingAnimationTracks_0 = v3.Humanoid:GetPlayingAnimationTracks();
        for v18 = 1, #l_PlayingAnimationTracks_0 do
            if l_PlayingAnimationTracks_0[v18].Animation.AnimationId == v11.Animation.AnimationId then
                l_PlayingAnimationTracks_0[v18].Priority = Enum.AnimationPriority.Action;
                l_PlayingAnimationTracks_0[v18]:Stop(0);
            end;
        end;
        return;
    end;
end;
local function _() --[[ Line: 57 ]] --[[ Name: isMouseLocked ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    local v19 = require(l_LocalPlayer_0.PlayerScripts.PlayerModule);
    local v20 = false;
    pcall(function() --[[ Line: 60 ]]
        -- upvalues: v20 (ref), v19 (copy)
        v20 = v19.cameras.CameraModule.activeMouseLockController:GetIsMouseLocked();
    end);
    return v20;
end;
v0.PC_Activate = function(v22) --[[ Line: 68 ]] --[[ Name: PC_Activate ]]
    -- upvalues: v3 (copy), v13 (ref), l_UserInputService_0 (copy), v8 (ref), v12 (ref), v4 (copy), l_HttpService_0 (copy), v10 (ref), v9 (ref), v11 (ref), l_LocalPlayer_0 (copy)
    if _G.blocking == true and _G.mobile == true then
        _G.HoldingBlockKey = false;
        repeat
            local l_Blocking_0 = v3:FindFirstChild("Blocking");
            if l_Blocking_0 then
                l_Blocking_0:Destroy();
            end;
            task.wait();
        until _G.blocking == false;
    end;
    if _G.canM1 == false then
        return;
    else
        if _G.blocking == false and v22.Handler.PunchCooldown == false and _G.canuse == true and _G.check:inspect(v3) == true then
            v13 = tick();
            local l_Handler_0 = v22.Handler;
            local l_Tool_0 = v3:FindFirstChildWhichIsA("Tool");
            local v26 = false;
            local v27 = l_Handler_0.Utils.getAnimSpeed() or 1;
            local v28 = "Ground";
            local v29 = false;
            l_Handler_0.PreCombo = l_Handler_0.PunchCombo;
            l_Handler_0.PunchCombo = l_Handler_0.PunchCombo + 1;
            if l_Handler_0.PunchCombo > 5 then
                l_Handler_0.PunchCombo = 1;
                l_Handler_0.prehit = false;
            end;
            if l_Handler_0.PunchCombo >= 3 and (l_UserInputService_0:IsKeyDown(Enum.KeyCode.Space) == true or _G.mobileUpTilt == true) and realhit == true then
                v28 = "Air";
                v26 = true;
            elseif l_Handler_0.PunchCombo >= 3 and l_Handler_0.prehit == true then
                v28 = "Ground";
                v26 = true;
            end;
            if l_Handler_0.PunchCombo > 3 and v26 == false then
                l_Handler_0.PunchCombo = 1;
            end;
            if l_Handler_0.PunchCombo > 3 then
                v26 = true;
            elseif l_Handler_0.PunchCombo < 3 then
                v26 = false;
            end;
            if v8 == "air" and l_Handler_0.PunchCombo < 3 then
                return;
            else
                if _G.running == true and l_Handler_0.PunchCombo == 1 then
                    v29 = true;
                end;
                l_Handler_0.prehit = true;
                realhit = false;
                if v26 == true then
                    if v8 ~= "" then
                        v28 = v8;
                    else
                        v8 = v28;
                    end;
                else
                    v28 = "Ground";
                    v8 = "";
                end;
                v12 = tick();
                local v30, v31, v32 = v22.Utils.getAnimation(v28, v29, 3);
                if v30 == nil then
                    warn("punch anim is NIL");
                    return;
                else
                    v22.Handler.PunchCooldown = true;
                    _G.canuse = false;
                    local v33, v34, v35, v36 = l_Handler_0.Utils.getHitBox();
                    local v37 = 1.5;
                    if v4[l_Tool_0.Name] and v4[l_Tool_0.Name].AnimationWeight then
                        v37 = v4[l_Tool_0.Name].AnimationWeight;
                    end;
                    local v38 = l_HttpService_0:GenerateGUID(true);
                    v10 = v38;
                    v9 = tick();
                    v30:Play();
                    if v30.Length > 0 and v36 ~= "BuddhaMode" then
                        v27 = v30.Length / v35;
                    end;
                    v30:AdjustSpeed(v27);
                    v30:AdjustWeight(v37);
                    v30.Priority = Enum.AnimationPriority.Action3;
                    if v3:GetAttribute("springMode") then
                        local l_v3_Descendants_0 = v3:GetDescendants();
                        for v40 = 1, #l_v3_Descendants_0 do
                            if l_v3_Descendants_0[v40]:IsA("AnimationController") and l_v3_Descendants_0[v40].Parent.Name:match("Spring") then
                                local v41 = l_v3_Descendants_0[v40]:LoadAnimation(v30.Animation);
                                v41:Play();
                                v41:AdjustWeight(v30.WeightTarget);
                                v41:AdjustSpeed(v30.Speed);
                                v41.Priority = Enum.AnimationPriority.Action4;
                            end;
                        end;
                    elseif v36 == "DragonHybird" then
                        local l_v3_FirstChild_0 = v3:FindFirstChild("DragonTailController", true);
                        if l_v3_FirstChild_0 then
                            local v43 = l_v3_FirstChild_0:LoadAnimation(v30.Animation);
                            v43:Play();
                            v43:AdjustWeight(v30.WeightTarget);
                            v43:AdjustSpeed(v30.Speed);
                            v43.Priority = Enum.AnimationPriority.Action4;
                        end;
                    end;
                    if v11 and v30.Animation ~= v11.Animation then
                        local l_PlayingAnimationTracks_1 = v3.Humanoid:GetPlayingAnimationTracks();
                        for v45 = 1, #l_PlayingAnimationTracks_1 do
                            if l_PlayingAnimationTracks_1[v45].Animation.AnimationId == v11.Animation.AnimationId then
                                l_PlayingAnimationTracks_1[v45].Priority = Enum.AnimationPriority.Action;
                                l_PlayingAnimationTracks_1[v45]:Stop();
                            end;
                        end;
                        v11 = nil;
                    end;
                    v11 = v30;
                    local l_Tool_1 = v3:FindFirstChildWhichIsA("Tool");
                    local v47 = nil;
                    if l_Tool_1 then
                        v47 = v3:FindFirstChild(l_Tool_1.Name .. "Sword");
                    end;
                    local v48 = nil;
                    if v47 then
                        v48 = v47:FindFirstChildWhichIsA("AnimationController");
                    end;
                    if v47 and v48 then
                        local v49 = v48:LoadAnimation(v32);
                        v49:Play();
                        v49.Priority = Enum.AnimationPriority.Action2;
                        v49:AdjustSpeed(v27);
                        v49:AdjustWeight(5);
                    end;
                    local v50 = nil;
                    if v29 then
                        local l_BodyVelocity_0 = Instance.new("BodyVelocity");
                        l_BodyVelocity_0.MaxForce = Vector3.new(10000000, 0, 10000000, 0);
                        l_BodyVelocity_0.P = 500000;
                        l_BodyVelocity_0.Parent = v3.HumanoidRootPart;
                        l_BodyVelocity_0.Velocity = v3.HumanoidRootPart.CFrame.lookVector * 25;
                        _G.destroy(l_BodyVelocity_0, 0.25);
                    end;
                    if l_Tool_1.Name:match("Kraken Blade") or l_Tool_1.Name:match("World Ender") ~= nil then
                        v50 = Instance.new("BodyVelocity");
                        v50.MaxForce = Vector3.new(1000000, 0, 1000000, 0);
                        v50.P = 500000;
                        v50.Parent = v3.HumanoidRootPart;
                        v50.Velocity = v3.HumanoidRootPart.CFrame.lookVector * 10;
                        _G.destroy(v50, 0.25);
                    end;
                    local v52 = nil;
                    local v53 = false;
                    do
                        local l_v28_0, l_v29_0, l_v50_0, l_v52_0, l_v53_0 = v28, v29, v50, v52, v53;
                        local function v60(v59) --[[ Line: 261 ]] --[[ Name: hitfound ]]
                            -- upvalues: l_v52_0 (ref), l_v50_0 (ref), v31 (copy), l_Handler_0 (copy), l_v28_0 (ref), v3 (ref)
                            l_v52_0 = true;
                            if l_v50_0 then
                                l_v50_0:Destroy();
                            end;
                            realhit = true;
                            game.ReplicatedStorage.Events.CombatRegister:InvokeServer({
                                "damage", 
                                v59, 
                                v31, 
                                {
                                    l_Handler_0.PunchCombo, 
                                    l_v28_0, 
                                    v31
                                }, 
                                true, 
                                aircombo = l_v28_0, 
                                v3.PrimaryPart.CFrame
                            });
                        end;
                        local function v63() --[[ Line: 292 ]] --[[ Name: hitinter ]]
                            -- upvalues: l_v53_0 (ref), l_v50_0 (ref), v3 (ref), v30 (copy)
                            l_v53_0 = true;
                            if l_v50_0 then
                                l_v50_0.Velocity = Vector3.new();
                                l_v50_0:Destroy();
                            end;
                            if v3:GetAttribute("customM1") == nil then
                                v30:Stop();
                                local l_PlayingAnimationTracks_2 = v3.Humanoid:GetPlayingAnimationTracks();
                                for v62 = 1, #l_PlayingAnimationTracks_2 do
                                    if l_PlayingAnimationTracks_2[v62].Animation.AnimationId == v30.Animation.AnimationId then
                                        l_PlayingAnimationTracks_2[v62]:Stop();
                                    end;
                                end;
                            end;
                            _G.midM1 = false;
                            game.ReplicatedStorage.Events.CombatRegister:InvokeServer({
                                "cancelSwing"
                            });
                        end;
                        local l_m1HitDelay_0 = _G.m1HitDelay;
                        local l_v3_Attribute_0 = v3:GetAttribute("customM1");
                        if l_v3_Attribute_0 == nil or l_v3_Attribute_0 and l_v3_Attribute_0 == "DragonHybird" then
                            local l_l_LocalPlayer_0_Attribute_0 = l_LocalPlayer_0:GetAttribute("Ping");
                            task.delay(v35 * l_m1HitDelay_0 - l_l_LocalPlayer_0_Attribute_0, function() --[[ Line: 316 ]]
                                -- upvalues: v3 (ref), v63 (copy), l_Tool_1 (copy), v33 (copy), v35 (copy), l_m1HitDelay_0 (copy), v34 (copy), v60 (copy)
                                if _G.check:inspect(v3) == false then
                                    v63();
                                    return;
                                elseif l_Tool_1 and l_Tool_1.Name == "MochiV2-MochiV2" then
                                    return;
                                else
                                    _G.hitbox:start(v3, v33, v35 * (1 - l_m1HitDelay_0), v34, v60, v63, nil, nil, true, function() --[[ Line: 324 ]]
                                        -- upvalues: v63 (ref)
                                        if _G.blocking == true then
                                            v63();
                                            return true;
                                        else
                                            return;
                                        end;
                                    end, true);
                                    return;
                                end;
                            end);
                        end;
                        task.spawn(function() --[[ Line: 333 ]]
                            -- upvalues: v31 (copy), l_Handler_0 (copy), l_v28_0 (ref), l_v29_0 (ref), v30 (copy)
                            game.ReplicatedStorage.Events.CombatRegister:InvokeServer({
                                "swingsfx", 
                                v31, 
                                l_Handler_0.PunchCombo, 
                                l_v28_0, 
                                l_v29_0, 
                                v30.Animation, 
                                v30.Speed, 
                                v30.WeightTarget, 
                                faceCFrame
                            });
                        end);
                        task.spawn(function() --[[ Line: 337 ]]
                            -- upvalues: v3 (ref), l_Handler_0 (copy), l_Tool_1 (copy), l_v28_0 (ref), l_v29_0 (ref), l_LocalPlayer_0 (ref)
                            _G.PlayEffect("CustomSwing", nil, {
                                v3, 
                                l_Handler_0.PunchCombo, 
                                l_Tool_1.Name, 
                                l_v28_0, 
                                l_v29_0
                            });
                            local l_CFrame_0 = v3.PrimaryPart.CFrame;
                            local v68 = require(l_LocalPlayer_0.PlayerScripts.PlayerModule);
                            local v69 = false;
                            local l_v68_0 = v68 --[[ copy: 2 -> 5 ]];
                            local v71;
                            do
                                local l_v69_0 = v69;
                                pcall(function() --[[ Line: 60 ]]
                                    -- upvalues: l_v69_0 (ref), l_v68_0 (copy)
                                    l_v69_0 = l_v68_0.cameras.CameraModule.activeMouseLockController:GetIsMouseLocked();
                                end);
                                v71 = l_v69_0;
                            end;
                            if v71 == true then
                                l_CFrame_0 = CFrame.new(v3.PrimaryPart.Position, (workspace.CurrentCamera.CFrame * CFrame.new(0, 0, -1000)).Position);
                                if v3.Humanoid.FloorMaterial ~= Enum.Material.Air and _G.MouseCF.Position.Y < v3.PrimaryPart.Position.Y then
                                    v71, v68, v69 = _G.getRayFloor(v3.PrimaryPart.CFrame, v3.PrimaryPart.Size.Y / 2 + v3.Humanoid.HipHeight);
                                    local v73 = true;
                                    if v71 and math.abs(_G.MouseCF.Y - v68.Y) > 1 then
                                        v73 = false;
                                    end;
                                    if v73 == true then
                                        l_CFrame_0 = v3.PrimaryPart.CFrame;
                                    end;
                                end;
                            end;
                        end);
                        _G.canJump = false;
                        v3.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, false);
                        _G.midM1 = true;
                        local _ = task.wait(v35);
                        _G.midM1 = false;
                        if l_Handler_0.PunchCombo >= 5 then
                            task.wait(0.15);
                        end;
                        _G.canuse = true;
                        _G.instantDash = false;
                        task.delay(0.5, function() --[[ Line: 387 ]]
                            -- upvalues: v10 (ref), v38 (copy)
                            if v10 == v38 then
                                _G.instantDash = true;
                            end;
                        end);
                        task.delay(0.25, function() --[[ Line: 393 ]]
                            -- upvalues: v10 (ref), v38 (copy), v3 (ref)
                            if v10 == v38 then
                                v3.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true);
                            end;
                        end);
                        if l_Handler_0.PunchCombo >= 5 then
                            v8 = "";
                            if v3:FindFirstChild("VenomDemonModel") then
                                task.wait(2);
                            end;
                            task.wait(1.5);
                        elseif l_Handler_0.PunchCombo >= 3 and v26 == false then
                            task.wait(0.65);
                        end;
                        if v10 == v38 then
                            v22.Handler.PunchCooldown = false;
                        end;
                        task.delay(1 + v35, function() --[[ Line: 413 ]]
                            -- upvalues: v10 (ref), v38 (copy), v9 (ref), l_Handler_0 (copy), v11 (ref)
                            if v10 == v38 and tick() - v9 >= 1 then
                                l_Handler_0.PunchCombo = 0;
                                v11 = nil;
                            end;
                        end);
                    end;
                end;
            end;
        end;
        return;
    end;
end;
v0.ResetM1 = function(v75) --[[ Line: 424 ]] --[[ Name: ResetM1 ]]
    v75.Handler.resetid = "";
    v75.Handler.PunchCooldown = false;
end;
v0.Mobile_Activate = v0.PC_Activate;
return v0;