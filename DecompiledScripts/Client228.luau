local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Players_0 = game:GetService("Players");
local _ = game:GetService("HttpService");
local l_TweenService_0 = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local v7 = game.GameId == 2097989947;
local v8 = Random.new();
local _ = workspace.Effects;
local l_Fishing_0 = l_ReplicatedStorage_0.Fishing;
local l_Action_0 = l_Fishing_0.Remotes.Action;
local l_Animations_0 = l_Fishing_0.Assets.Animations;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_PlayerGui_0 = l_LocalPlayer_0:WaitForChild("PlayerGui");
local _ = l_LocalPlayer_0:GetMouse();
local l_InputSFX_0 = l_ReplicatedStorage_0.Fishing.Assets.SFX.InputSFX;
local l_UI_0 = l_ReplicatedStorage_0.Fishing.Assets.UI;
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_Shared_0 = l_Modules_0:WaitForChild("Shared");
local l_GameUtils_0 = require(l_Shared_0:WaitForChild("GameUtils"));
local v21 = require(l_Shared_0.Maids.Maid);
local l_Client_0 = l_Modules_0:WaitForChild("Client");
local _ = require(l_Client_0:WaitForChild("ItemDisplay"));
local v24 = require(l_Client_0.UIController);
local v25 = require(l_Client_0.Notification);
local v26 = require(l_ReplicatedStorage_0.Modules.ToolDesc);
local v27 = require(l_Fishing_0.Assets.Bobble);
local v28 = {};
v28.__index = v28;
task.spawn(function() --[[ Line: 44 ]]
    -- upvalues: l_ContentProvider_0 (copy), l_Fishing_0 (copy)
    l_ContentProvider_0:PreloadAsync({
        l_Fishing_0.Assets.Animations
    });
end);
local function v32(v29, v30) --[[ Line: 48 ]] --[[ Name: tagRare ]]
    -- upvalues: v26 (copy)
    if v26[v29] == nil then
        return;
    else
        local l_RareUIGradient_0 = v30:FindFirstChild("RareUIGradient");
        if l_RareUIGradient_0 == nil then
            l_RareUIGradient_0 = Instance.new("UIGradient", v30);
            l_RareUIGradient_0.Name = "RareUIGradient";
        end;
        if _G.displayRareItem == nil then
            repeat
                task.wait();
            until _G.displayRareItem;
        end;
        _G.displayRareItem(v29, l_RareUIGradient_0);
        return;
    end;
end;
v28.new = function(v33) --[[ Line: 65 ]] --[[ Name: new ]]
    -- upvalues: v28 (copy), v21 (copy), l_LocalPlayer_0 (copy), l_UI_0 (copy)
    local v34 = setmetatable({}, v28);
    v34.Cleaner = v21.new();
    v34.Animations = v34:_preloadAnimations();
    v34.Character = l_LocalPlayer_0.Character or l_LocalPlayer_0.CharacterAdded:Wait();
    v34.Tool = v33;
    v34.MaxDistance = 300;
    v34.ChargeClock = os.clock();
    v34.Bobble = nil;
    v34.FishCaught = nil;
    v34.Debounce = true;
    v34.IsCharging = false;
    v34.SelectedBait = "None";
    v34.FishingBaitGui = l_UI_0:WaitForChild("FishingBaitGui"):Clone();
    v34:_main();
    return v34;
end;
v28._preloadAnimations = function(_) --[[ Line: 91 ]] --[[ Name: _preloadAnimations ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_Animations_0 (copy)
    local l_Animator_0 = l_LocalPlayer_0.Character.Humanoid.Animator;
    local v37 = {};
    for _, v39 in l_Animations_0:GetChildren() do
        v37[v39.Name] = l_Animator_0:LoadAnimation(v39);
    end;
    return v37;
end;
v28._canDoInputs = function(v40) --[[ Line: 103 ]] --[[ Name: _canDoInputs ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    local l_Character_0 = v40.Character;
    if not v40.Debounce then
        return;
    elseif v40.Tool.Parent ~= l_Character_0 then
        return;
    else
        if v40.Bobble == nil then
            if not _G.canuse then
                return;
            elseif _G.check:inspect(l_Character_0) == false then
                return;
            end;
        end;
        if l_LocalPlayer_0.Character.Humanoid.FloorMaterial == Enum.Material.Air then
            return;
        else
            return true;
        end;
    end;
end;
v28._play = function(v42, v43) --[[ Line: 117 ]] --[[ Name: _play ]]
    if v42.Animations[v43].IsPlaying == false then
        v42.Animations[v43]:Play();
    end;
    return v42.Animations[v43];
end;
v28._stop = function(v44, v45) --[[ Line: 124 ]] --[[ Name: _stop ]]
    v44.Animations[v45]:Stop();
end;
v28._getAnimation = function(v46, v47) --[[ Line: 128 ]] --[[ Name: _getAnimation ]]
    return v46.Animations[v47];
end;
v28._reelBack = function(v48, v49) --[[ Line: 132 ]] --[[ Name: _reelBack ]]
    -- upvalues: l_InputSFX_0 (copy), v8 (copy), l_Action_0 (copy)
    if not v48.Debounce then
        return;
    elseif not v48.Bobble then
        v48.IsCharging = false;
        return;
    else
        local l_Character_1 = v48.Character;
        local l_HumanoidRootPart_0 = l_Character_1.HumanoidRootPart;
        l_InputSFX_0.FishingBarChargeLoop:Stop();
        l_InputSFX_0.FishingBarDrainLoop:Stop();
        v48:_stop("Reel");
        v48:_stop("Throw");
        local v52 = v48:_play("Catch");
        v52:AdjustSpeed(1);
        v48.Cleaner:Destroy();
        local l_Bobble_0 = v48.Bobble;
        local l_Model_0 = l_Bobble_0.Model;
        v48.Bobble = nil;
        local v55 = v8:NextNumber(15, 35);
        local v56 = not v49 and 0.25 or 0.65;
        local l_CFrame_0 = l_Model_0.CFrame;
        local v58 = 0;
        l_Action_0:InvokeServer({
            Action = "HookReturning"
        });
        v48.Debounce = false;
        v48.Cleaner:AddTask(task.delay(0.2, function() --[[ Line: 165 ]]
            -- upvalues: v52 (copy)
            v52:AdjustSpeed(0.5);
        end));
        local l_FirstChild_0 = v48.Tool:FindFirstChild("BobbleSpawn", true);
        while v58 <= 1 do
            local v60 = CFrame.new(l_FirstChild_0.WorldPosition, l_CFrame_0.Position) * CFrame.Angles(1.5707963267948966, 0, 0);
            local v61 = l_CFrame_0:Lerp(v60, 0.5) + if not v49 then Vector3.new(-0, -3, -0, -0) else Vector3.new(0, 1, 0, 0) * v55;
            v58 = v58 + game["Run Service"].RenderStepped:Wait() / v56;
            local v62 = l_CFrame_0:Lerp(v61, v58):Lerp(v61:Lerp(v60, v58), v58);
            local _ = (CFrame.new(v62.Position, l_Character_1.PrimaryPart.Position) * CFrame.new(0, 0, -1000)).Position;
            l_Model_0.CFrame = CFrame.new(Vector3.new(0, 0, 0, 0), Vector3.new(0, 1, 0, 0):Cross(CFrame.new(v62.Position, l_HumanoidRootPart_0.Position).RightVector)) * CFrame.Angles(-1.5707963267948966, 0, 0) + v62.Position;
        end;
        v52:AdjustSpeed(1);
        l_Bobble_0:Destroy();
        l_Action_0:InvokeServer({
            Action = "Cancel"
        });
        v48.Debounce = true;
        _G.canuse = true;
        v48.IsCharging = false;
        return;
    end;
end;
v28._throw = function(v64) --[[ Line: 198 ]] --[[ Name: _throw ]]
    v64.Cleaner:Destroy();
    v64:_getAnimation("Throw"):AdjustSpeed(1);
end;
v28._spawnBobble = function(v65) --[[ Line: 205 ]] --[[ Name: _spawnBobble ]]
    -- upvalues: l_Action_0 (copy), v27 (copy)
    task.wait(0.1);
    local v66 = l_Action_0:InvokeServer({
        Action = "Throw", 
        Goal = _G.MouseCF.p, 
        Bait = v65.SelectedBait
    });
    _G.canuse = true;
    v65.IsCharging = false;
    if not v66 then
        return;
    else
        local l_Humanoid_0 = v65.Character.Humanoid;
        local l_WorldPosition_0 = v65.Tool:FindFirstChild("BobbleSpawn", true).WorldPosition;
        local l_p_0 = _G.MouseCF.p;
        local v70 = math.min(os.clock() - v65.ChargeClock, 1.5);
        local function _(v71, v72) --[[ Line: 228 ]] --[[ Name: clampVector ]]
            if v72 <= v71.Magnitude then
                return v71.Unit * v72;
            else
                return v71;
            end;
        end;
        local l_new_0 = v27.new;
        local v75 = {};
        local v76 = (l_p_0 - l_WorldPosition_0).Unit * 100 * v70;
        local l_MaxDistance_0 = v65.MaxDistance;
        v75.Velocity = if l_MaxDistance_0 <= v76.Magnitude then v76.Unit * l_MaxDistance_0 else v76;
        v75.Client = v65;
        v65.Bobble = l_new_0(v75);
        l_Humanoid_0.WalkSpeed = 16;
        return;
    end;
end;
v28._reel = function(_) --[[ Line: 243 ]] --[[ Name: _reel ]]

end;
v28._charge = function(v79) --[[ Line: 254 ]] --[[ Name: _charge ]]
    -- upvalues: v25 (copy), l_GameUtils_0 (copy), l_LocalPlayer_0 (copy)
    if v79.IsCharging == true then
        print("CANT THROW BECAUSE OF CHARGING");
        return;
    elseif v79.SelectedBait == "None" then
        v25.DisplayMessage("<Color=Red>Please select a bait!");
        return;
    elseif l_GameUtils_0.CheckItemAmount(l_LocalPlayer_0, v79.SelectedBait) <= 0 then
        v25.DisplayMessage((("<Color=Red>You do not have any %*!"):format(v79.SelectedBait)));
        return;
    else
        v79.IsCharging = true;
        local function v81() --[[ Line: 273 ]] --[[ Name: WindUp ]]
            -- upvalues: v79 (copy)
            v79.ChargeClock = os.clock();
            local v80 = v79:_play("Throw");
            task.wait(0.43);
            v80:AdjustSpeed(0);
        end;
        local l_Humanoid_1 = v79.Character.Humanoid;
        local function v83() --[[ Line: 287 ]] --[[ Name: WalkSpeedChanged ]]
            -- upvalues: l_Humanoid_1 (copy)
            l_Humanoid_1.WalkSpeed = 4;
        end;
        v79.Cleaner:AddTask(task.spawn(v81));
        v79.Cleaner:AddTask(task.delay(1.5, v79._throw, v79));
        l_Humanoid_1.WalkSpeed = 4;
        v79.Cleaner:AddTask(l_Humanoid_1:GetPropertyChangedSignal("WalkSpeed"):Connect(v83));
        return;
    end;
end;
v28._fishCaught = function(v84) --[[ Line: 298 ]] --[[ Name: _fishCaught ]]
    -- upvalues: l_UI_0 (copy), l_PlayerGui_0 (copy), v7 (copy), l_InputSFX_0 (copy), l_UserInputService_0 (copy), l_RunService_0 (copy), l_TweenService_0 (copy), l_Action_0 (copy)
    if not v84.Bobble then
        return;
    elseif v84.Animations.Reel.IsPlaying then
        return;
    else
        v84:_play("Reel");
        v84.Velocity = 0;
        v84.MaxVelocity = 2;
        v84.Acceleration = v84.Tool:GetAttribute("Acceleration");
        v84.Max = 2;
        v84.BarPosition = v84.Max * 0.5;
        v84.BarRadius = 0.25;
        v84.FishTime = 2;
        v84.MaxFishTime = 7.5;
        v84.GameSeed = v84.Bobble.Model:GetAttribute("Seed");
        v84.GameRNG = Random.new(v84.GameSeed);
        v84.MinigameStartTime = os.clock();
        v84.MinigameUpdateCount = 0;
        local v85 = false;
        local v86 = true;
        local v87 = os.clock();
        local v88 = false;
        local v89 = os.clock();
        local v90 = false;
        local v91 = l_UI_0.FishingUIBill:Clone();
        local l_Frame_0 = v91.Frame;
        local l_Player_0 = l_Frame_0.Player;
        local l_Goal_0 = l_Frame_0.Goal;
        local l_Time_0 = l_Frame_0.Time;
        local l_icon_0 = l_Goal_0.icon;
        local l_icon_1 = l_Time_0.Fill.Goal.icon;
        local l_InfoText_0 = l_Frame_0.InfoText;
        local l_Character_2 = v84.Character;
        v91.Frame.Player.Size = UDim2.new(v91.Frame.Player.Size.X.Scale, v91.Frame.Player.Size.X.Offset, v84.BarRadius, 0);
        v91.Adornee = l_Character_2.PrimaryPart;
        v91.Enabled = true;
        v91.Parent = l_PlayerGui_0;
        v84.Cleaner.UI = v91;
        v84.UpdateClock = os.clock();
        local function _() --[[ Line: 350 ]] --[[ Name: RandomizeUpdateTime ]]
            -- upvalues: v84 (copy)
            if not v84.Bobble then
                v84:_reelBack();
                return;
            else
                return v84.GameRNG:NextNumber(1, 3) / (v84.Bobble.Model:GetAttribute("MoveMultiplier") or 1);
            end;
        end;
        local v101;
        if not v84.Bobble then
            v84:_reelBack();
            v101 = nil;
        else
            v101 = v84.GameRNG:NextNumber(1, 3) / (v84.Bobble.Model:GetAttribute("MoveMultiplier") or 1);
        end;
        v84.UpdateTime = v101;
        if v7 then
            warn((("CLIENT Initial - UpdateTime: %*, Acceleration: %*, MoveMultiplier: %*"):format(v84.UpdateTime, v84.Acceleration, v84.Bobble.Model:GetAttribute("MoveMultiplier") or 1)));
        end;
        v101 = function() --[[ Line: 365 ]] --[[ Name: holdInput ]]
            -- upvalues: v85 (ref), l_InputSFX_0 (ref)
            v85 = true;
            l_InputSFX_0.FishingClick:Play();
        end;
        local function _() --[[ Line: 370 ]] --[[ Name: releaseInput ]]
            -- upvalues: v85 (ref), l_InputSFX_0 (ref)
            v85 = false;
            l_InputSFX_0.FishingUnclick:Play();
        end;
        v84.Cleaner.InputBeganMobile = l_UserInputService_0.InputBegan:Connect(function(v103, v104) --[[ Line: 375 ]]
            -- upvalues: v85 (ref), l_InputSFX_0 (ref)
            if v104 then
                return;
            else
                if v103.UserInputType == Enum.UserInputType.Touch then
                    v85 = true;
                    l_InputSFX_0.FishingClick:Play();
                end;
                return;
            end;
        end);
        v84.Cleaner.InputEndedMobile = l_UserInputService_0.InputEnded:Connect(function(v105, v106) --[[ Line: 384 ]]
            -- upvalues: v85 (ref), l_InputSFX_0 (ref)
            if v106 then
                return;
            else
                if v105.UserInputType == Enum.UserInputType.Touch then
                    v85 = false;
                    l_InputSFX_0.FishingUnclick:Play();
                end;
                return;
            end;
        end);
        if _G.mobile ~= true then
            v84.Cleaner.InputBegan = v84.Tool.Activated:Connect(function() --[[ Line: 394 ]]
                -- upvalues: v85 (ref), l_InputSFX_0 (ref)
                v85 = true;
                l_InputSFX_0.FishingClick:Play();
            end);
            v84.Cleaner.InputEnded = v84.Tool.Deactivated:Connect(function() --[[ Line: 398 ]]
                -- upvalues: v85 (ref), l_InputSFX_0 (ref)
                v85 = false;
                l_InputSFX_0.FishingUnclick:Play();
            end);
        end;
        local l_ImageColor3_0 = l_Goal_0.icon.ImageColor3;
        local v108 = nil;
        local l_Position_1 = l_Goal_0.Position;
        local v110 = nil;
        local v111 = nil;
        local v112 = nil;
        local v113 = nil;
        local v114 = nil;
        local v115 = false;
        if v7 == false then
            v115 = false;
        end;
        v84.Cleaner.Update = l_RunService_0.RenderStepped:Connect(function(v116) --[[ Line: 423 ]]
            -- upvalues: v84 (copy), v85 (ref), v108 (ref), v7 (ref), v111 (ref), l_Position_1 (ref), v112 (ref), v113 (ref), v114 (ref), v110 (ref), l_TweenService_0 (ref), l_Goal_0 (copy), l_Player_0 (copy), v115 (ref), v86 (ref), l_InputSFX_0 (ref), l_icon_0 (copy), v87 (ref), v88 (ref), v89 (ref), v90 (ref), l_icon_1 (copy), l_ImageColor3_0 (copy), l_InfoText_0 (copy), l_Time_0 (copy), l_Action_0 (ref)
            v84.Velocity = math.clamp(v84.Velocity + (v85 and -v84.Acceleration or v84.Acceleration) * v116, -v84.MaxVelocity, v84.MaxVelocity);
            if v84.Velocity > 0 and v84.BarPosition == v84.Max - v84.BarRadius or v84.Velocity < 0 and v84.BarPosition == v84.BarRadius then
                v84.Velocity = 0;
            end;
            v84.BarPosition = math.clamp(v84.BarPosition + v84.Velocity * v116, v84.BarRadius, v84.Max - v84.BarRadius);
            v108 = UDim2.fromScale(0.5, v84.BarPosition / v84.Max);
            if os.clock() - v84.UpdateClock >= v84.UpdateTime then
                v84.MinigameUpdateCount = v84.MinigameUpdateCount + 1;
                v84.UpdateClock = os.clock();
                local l_v84_0 = v84;
                local v118;
                if not v84.Bobble then
                    v84:_reelBack();
                    v118 = nil;
                else
                    v118 = v84.GameRNG:NextNumber(1, 3) / (v84.Bobble.Model:GetAttribute("MoveMultiplier") or 1);
                end;
                l_v84_0.UpdateTime = v118;
                if v84.MinigameUpdateCount <= 5 and v7 then
                    warn((("CLIENT Update %* - NewUpdateTime: %*"):format(v84.MinigameUpdateCount, v84.UpdateTime)));
                end;
                v111 = l_Position_1;
                v112 = UDim2.fromScale(0.5, v84.GameRNG:NextNumber());
                v113 = os.clock();
                v114 = v84.UpdateTime / 2;
                v110 = l_TweenService_0:Create(l_Goal_0, TweenInfo.new(v84.UpdateTime / 2), {
                    Position = UDim2.fromScale(0.5, v84.GameRNG:NextNumber())
                });
            end;
            if v110 and v111 then
                local v119 = math.clamp((os.clock() - v113) / v114, 0, 1);
                local l_l_TweenService_0_Value_0 = l_TweenService_0:GetValue(v119, v110.TweenInfo.EasingStyle, v110.TweenInfo.EasingDirection);
                l_Position_1 = UDim2.new(v111.X.Scale + (v112.X.Scale - v111.X.Scale) * l_l_TweenService_0_Value_0, v111.X.Offset + (v112.X.Offset - v111.X.Offset) * l_l_TweenService_0_Value_0, v111.Y.Scale + (v112.Y.Scale - v111.Y.Scale) * l_l_TweenService_0_Value_0, v111.Y.Offset + (v112.Y.Offset - v111.Y.Offset) * l_l_TweenService_0_Value_0);
            end;
            l_Goal_0.Position = l_Position_1;
            l_Player_0.Position = v108;
            if v115 == true then
                local l_Scale_0 = l_Player_0.Position.Y.Scale;
                local l_Scale_1 = l_Goal_0.Position.Y.Scale;
                local v123 = l_Scale_1 - l_Scale_0;
                local v124 = v84.Velocity / v84.Max;
                if v84.BarRadius / 2 / v84.Max >= math.abs(v123) then
                    local v125 = l_Scale_1 - (l_Scale_0 + v124 * 0.1);
                    if v125 > 0.01 then
                        v85 = false;
                    elseif v125 < -0.01 then
                        v85 = true;
                    end;
                else
                    local v126 = math.abs(v124) / (v84.Acceleration / v84.Max);
                    local v127 = l_Scale_1 - (l_Scale_0 + (v124 * v126 - 0.5 * (v84.Acceleration / v84.Max) * v126 * v126 * (v124 > 0 and 1 or -1)));
                    if v123 > 0 then
                        if v127 > 0.02 then
                            v85 = false;
                        else
                            v85 = true;
                        end;
                    elseif v127 < -0.02 then
                        v85 = true;
                    else
                        v85 = false;
                    end;
                end;
            end;
            local v128 = math.abs(v108.Y.Scale - l_Position_1.Y.Scale) <= v84.BarRadius / 2;
            if v116 >= 0.2 then
                v128 = false;
            end;
            v84.FishTime = math.clamp(v84.FishTime + v116 * (v128 and 1 or -0.75), 0, v84.MaxFishTime);
            if v128 then
                if v86 then
                    v86 = false;
                    l_InputSFX_0.FishingBarOnTarget:Play();
                    l_InputSFX_0.FishingBarChargeLoop:Play();
                    l_InputSFX_0.FishingBarDrainLoop:Stop();
                    l_TweenService_0:Create(l_icon_0, TweenInfo.new(0.25), {
                        ImageColor3 = Color3.fromRGB(172, 255, 127)
                    }):Play();
                end;
                if os.clock() - v87 >= 0.1 then
                    v87 = os.clock();
                    v88 = not v88;
                    l_icon_0.Image = v88 and "rbxassetid://86151972586326" or "rbxassetid://126419334589592";
                end;
                if os.clock() - v89 >= 0.15 then
                    v89 = os.clock();
                    v90 = not v90;
                    l_icon_1.Image = v90 and "rbxassetid://77450437735760" or "rbxassetid://106397882099629";
                end;
            elseif not v86 then
                v86 = true;
                l_InputSFX_0.FishingBarOffTarget:Play();
                l_InputSFX_0.FishingBarChargeLoop:Stop();
                l_InputSFX_0.FishingBarDrainLoop:Play();
                l_TweenService_0:Create(l_icon_0, TweenInfo.new(0.5), {
                    ImageColor3 = l_ImageColor3_0
                }):Play();
                l_icon_0.Image = "rbxassetid://126419334589592";
                l_icon_1.Image = "rbxassetid://106397882099629";
            end;
            l_InfoText_0.Text = v128 and "" or v108.Y.Scale > l_Position_1.Y.Scale and "HOLD CLICK" or "RELEASE CLICK";
            local v129 = math.clamp(v84.FishTime / v84.MaxFishTime, 0, 1);
            l_Time_0.Fill.Size = UDim2.new(l_Time_0.Fill.Size.X.Scale, l_Time_0.Fill.Size.X.Offset, v129, 0);
            if v129 == 0 then
                v84:_reelBack();
                return;
            else
                if v129 >= 1 then
                    local v130 = os.clock() - v84.MinigameStartTime;
                    if v7 then
                        warn((("CLIENT COMPLETED - Updates: %*, Time: %*s, Seed: %*"):format(v84.MinigameUpdateCount, v130, v84.GameSeed)));
                    end;
                    if l_Action_0:InvokeServer({
                        Action = "Reel"
                    }) then
                        v84:_reelBack(true);
                        return;
                    else
                        v84:_reelBack();
                    end;
                end;
                return;
            end;
        end);
        return;
    end;
end;
v28._animationHandler = function(v131) --[[ Line: 607 ]] --[[ Name: _animationHandler ]]
    local v132 = v131:_getAnimation("Idle");
    local l_Character_3 = v131.Character;
    local l_Humanoid_2 = l_Character_3.Humanoid;
    local function v135() --[[ Line: 612 ]] --[[ Name: OnMovement ]]
        -- upvalues: l_Humanoid_2 (copy), v131 (copy), l_Character_3 (copy), v132 (copy)
        if not (l_Humanoid_2.MoveDirection.Magnitude > 0) and v131.Tool.Parent == l_Character_3 then
            if v132.IsPlaying == false then
                v132:Play();
                return;
            end;
        elseif v132.IsPlaying then
            v132:Stop();
            v131:_reelBack();
        end;
    end;
    local function v136() --[[ Line: 628 ]] --[[ Name: floor ]]
        -- upvalues: v131 (copy), l_Character_3 (copy), v132 (copy), l_Humanoid_2 (copy)
        if v131.Tool.Parent ~= l_Character_3 then
            if v132.IsPlaying == true then
                v132:Stop();
            end;
            return;
        else
            if l_Humanoid_2.FloorMaterial == Enum.Material.Air then
                if v132.IsPlaying == true then
                    v132:Stop();
                    return;
                end;
            elseif v132.IsPlaying == false and l_Humanoid_2.MoveDirection == Vector3.new() then
                v132:Play();
            end;
            return;
        end;
    end;
    local function v137() --[[ Line: 648 ]] --[[ Name: Equipped ]]
        -- upvalues: l_Humanoid_2 (copy), v131 (copy), l_Character_3 (copy), v132 (copy)
        if not (l_Humanoid_2.MoveDirection.Magnitude > 0) and v131.Tool.Parent == l_Character_3 then
            if v132.IsPlaying == false then
                v132:Play();
                return;
            end;
        elseif v132.IsPlaying then
            v132:Stop();
            v131:_reelBack();
        end;
    end;
    local function v138() --[[ Line: 652 ]] --[[ Name: Unequipped ]]
        -- upvalues: l_Humanoid_2 (copy), v131 (copy), l_Character_3 (copy), v132 (copy)
        if not (l_Humanoid_2.MoveDirection.Magnitude > 0) and v131.Tool.Parent == l_Character_3 then
            if v132.IsPlaying == false then
                v132:Play();
                return;
            end;
        elseif v132.IsPlaying then
            v132:Stop();
            v131:_reelBack();
        end;
    end;
    v131.Tool.Equipped:Connect(v137);
    v131.Tool.Unequipped:Connect(v138);
    l_Humanoid_2:GetPropertyChangedSignal("MoveDirection"):Connect(v135);
    game["Run Service"].Heartbeat:Connect(v136);
end;
v28._main = function(v139) --[[ Line: 665 ]] --[[ Name: _main ]]
    -- upvalues: l_LocalPlayer_0 (copy), v24 (copy), l_Modules_0 (copy), l_UI_0 (copy), l_GameUtils_0 (copy), v32 (copy), l_PlayerGui_0 (copy), l_InputSFX_0 (copy), l_Action_0 (copy), l_UserInputService_0 (copy)
    if _G.layoutMulti == nil then
        repeat
            task.wait();
        until _G.layoutMulti;
    end;
    if _G.ToolDesc == nil then
        repeat
            task.wait();
        until _G.ToolDesc;
    end;
    v139:_animationHandler();
    local l_Character_4 = l_LocalPlayer_0.Character;
    local l_Humanoid_3 = l_Character_4:WaitForChild("Humanoid");
    local l_HumanoidRootPart_1 = l_Character_4:WaitForChild("HumanoidRootPart");
    task.spawn(function() --[[ Line: 682 ]]
        -- upvalues: v139 (copy), v24 (ref), l_Modules_0 (ref), l_UI_0 (ref), l_GameUtils_0 (ref), l_LocalPlayer_0 (ref), v32 (ref)
        local v143 = {};
        local l_List_0 = v139.FishingBaitGui:WaitForChild("Main"):WaitForChild("List");
        local l_Inventory_0 = v24:GetStatsFolder():WaitForChild("Inventory"):WaitForChild("Inventory");
        local v146 = require(l_Modules_0.Blueprints["Fish Baits"]);
        local function v166() --[[ Line: 694 ]] --[[ Name: OnInventoryUpdated ]]
            -- upvalues: v146 (copy), v143 (copy), l_UI_0 (ref), l_GameUtils_0 (ref), l_LocalPlayer_0 (ref), l_List_0 (copy), v32 (ref), v139 (ref)
            for v147, _ in pairs(v146) do
                local v149 = v143[v147] or l_UI_0:WaitForChild("BaitTemplate"):Clone();
                local function _(v150, v151) --[[ Line: 699 ]] --[[ Name: updateText ]]
                    -- upvalues: v147 (copy), l_GameUtils_0 (ref), l_LocalPlayer_0 (ref), v149 (copy)
                    if v151 == nil then
                        v151 = v147;
                    end;
                    local v152 = l_GameUtils_0.CheckItemAmount(l_LocalPlayer_0, v151);
                    if v150 == nil then
                        v150 = v149;
                    end;
                    v150.Item.Text = v151;
                    v150.ItemCount.Text = ("x%*"):format(v152);
                end;
                if v143[v147] == nil and _G.HasItem(l_LocalPlayer_0, v147) == true then
                    v149.Name = v147;
                    v149.LayoutOrder = _G.layoutMulti[_G.ToolDesc[v147].Rare];
                    v149.Parent = l_List_0;
                    v143[v147] = v149;
                    local v154 = nil;
                    local v155 = nil;
                    if v155 == nil then
                        v155 = v147;
                    end;
                    local v156 = l_GameUtils_0.CheckItemAmount(l_LocalPlayer_0, v155);
                    if v154 == nil then
                        v154 = v149;
                    end;
                    v154.Item.Text = v155;
                    v154.ItemCount.Text = ("x%*"):format(v156);
                    v32(v147, v149.Item);
                    v149.MouseButton1Click:Connect(function() --[[ Line: 720 ]]
                        -- upvalues: v139 (ref), v147 (copy), v143 (ref), l_GameUtils_0 (ref), l_LocalPlayer_0 (ref), v149 (copy)
                        if v139.Bobble then
                            return;
                        else
                            if v139.SelectedBait ~= v147 and v143[v139.SelectedBait] then
                                local v157 = v143[v139.SelectedBait];
                                local l_SelectedBait_0 = v139.SelectedBait;
                                if l_SelectedBait_0 == nil then
                                    l_SelectedBait_0 = v147;
                                end;
                                local v159 = l_GameUtils_0.CheckItemAmount(l_LocalPlayer_0, l_SelectedBait_0);
                                if v157 == nil then
                                    v157 = v149;
                                end;
                                v157.Item.Text = l_SelectedBait_0;
                                v157.ItemCount.Text = ("x%*"):format(v159);
                                v143[v139.SelectedBait].backGroundSelect.Visible = false;
                            end;
                            v139.SelectedBait = v147;
                            local v160 = nil;
                            local v161 = nil;
                            if v161 == nil then
                                v161 = v147;
                            end;
                            local v162 = l_GameUtils_0.CheckItemAmount(l_LocalPlayer_0, v161);
                            if v160 == nil then
                                v160 = v149;
                            end;
                            v160.Item.Text = v161;
                            v160.ItemCount.Text = ("x%*"):format(v162);
                            v149.backGroundSelect.Visible = true;
                            return;
                        end;
                    end);
                end;
                if _G.HasItem(l_LocalPlayer_0, v147) == false and v149 ~= nil then
                    v149:Destroy();
                    v143[v147] = nil;
                else
                    local v163 = nil;
                    local v164 = nil;
                    if v164 == nil then
                        v164 = v147;
                    end;
                    local v165 = l_GameUtils_0.CheckItemAmount(l_LocalPlayer_0, v164);
                    if v163 == nil then
                        v163 = v149;
                    end;
                    v163.Item.Text = v164;
                    v163.ItemCount.Text = ("x%*"):format(v165);
                    if v139.SelectedBait == v147 then
                        v149.Item.Text = v147;
                        v149.backGroundSelect.Visible = true;
                    else
                        v149.Item.Text = v147;
                        v149.backGroundSelect.Visible = false;
                    end;
                end;
            end;
        end;
        l_Inventory_0:GetPropertyChangedSignal("Value"):Connect(v166);
        v166();
    end);
    local function v169() --[[ Line: 769 ]] --[[ Name: Equipped ]]
        -- upvalues: v139 (copy), l_PlayerGui_0 (ref), l_InputSFX_0 (ref)
        v139.FishingBaitGui.Parent = l_PlayerGui_0;
        for _, v168 in l_InputSFX_0:GetChildren() do
            v168:Stop();
        end;
    end;
    local function v174() --[[ Line: 777 ]] --[[ Name: Unequipped ]]
        -- upvalues: v139 (copy), l_Action_0 (ref), l_Humanoid_3 (copy), l_InputSFX_0 (ref)
        v139.IsCharging = false;
        v139.FishingBaitGui.Parent = script;
        for _, v171 in v139.Animations do
            v171:Stop();
        end;
        v139.Cleaner:Destroy();
        if v139.Bobble then
            _G.canuse = true;
            v139.Bobble:Destroy();
            v139.Bobble = nil;
        end;
        l_Action_0:InvokeServer({
            Action = "Cancel"
        });
        v139.Debounce = true;
        v139.FishCaught = nil;
        l_Humanoid_3.WalkSpeed = 16;
        for _, v173 in l_InputSFX_0:GetChildren() do
            v173:Stop();
        end;
    end;
    local function v176(v175) --[[ Line: 807 ]] --[[ Name: ThrowBobble ]]
        -- upvalues: v139 (copy)
        if v175 == "Throw" then
            v139:_spawnBobble();
        end;
    end;
    local function v179(v177, v178) --[[ Line: 813 ]] --[[ Name: InputBegan ]]
        -- upvalues: v139 (copy)
        if v178 then
            return;
        elseif not v139:_canDoInputs() then
            return;
        elseif v177 ~= "force" and v177.UserInputType ~= Enum.UserInputType.MouseButton1 then
            return;
        elseif v139.Bobble and v139.FishCaught then
            v139:_reel();
            print("reel");
            return;
        elseif v139.Bobble then
            v139:_reelBack();
            print("test");
            return;
        else
            v139:_charge();
            print("charge");
            return;
        end;
    end;
    local function _(v180, v181) --[[ Line: 832 ]] --[[ Name: InputEnded ]]
        -- upvalues: v139 (copy)
        if v181 then
            return;
        elseif v180 ~= "force" and v180.UserInputType ~= Enum.UserInputType.MouseButton1 then
            return;
        else
            if not v139.Bobble then
                v139:_throw();
            end;
            return;
        end;
    end;
    local function v184() --[[ Line: 844 ]] --[[ Name: DistanceCheck ]]
        -- upvalues: v139 (copy), l_HumanoidRootPart_1 (copy)
        while task.wait() do
            if v139.Bobble then
                local l_Model_1 = v139.Bobble.Model;
                if (l_HumanoidRootPart_1.Position - l_Model_1.Position).Magnitude >= v139.MaxDistance then
                    v139:_reelBack();
                end;
            end;
        end;
    end;
    v139.Tool.Activated:Connect(function() --[[ Line: 861 ]]
        -- upvalues: v179 (copy)
        v179("force");
    end);
    v139.Tool.Deactivated:Connect(function() --[[ Line: 865 ]]
        -- upvalues: v139 (copy)
        if not v139.Bobble then
            v139:_throw();
        end;
    end);
    if _G.mobile == true then
        l_UserInputService_0.TouchStarted:Connect(function(v185, v186) --[[ Line: 870 ]]
            -- upvalues: v179 (copy)
            if v186 then
                return;
            elseif _G.nearThumbstick and _G.nearThumbstick(v185.Position, true) == true then
                return;
            else
                v179("force");
                return;
            end;
        end);
        l_UserInputService_0.TouchEnded:Connect(function(_, v188) --[[ Line: 880 ]]
            -- upvalues: v139 (copy)
            if v188 then
                return;
            else
                if not v139.Bobble then
                    v139:_throw();
                end;
                return;
            end;
        end);
    end;
    v139:_getAnimation("Throw").KeyframeReached:Connect(v176);
    v139.Tool.Unequipped:Connect(v174);
    v139.Tool.Equipped:Connect(v169);
    task.spawn(v184);
end;
return v28;