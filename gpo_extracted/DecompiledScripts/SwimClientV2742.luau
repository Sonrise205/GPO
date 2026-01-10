local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("RunService");
local _ = game:GetService("UserInputService");
local l_TweenService_0 = game:GetService("TweenService");
local l_SoundService_0 = game:GetService("SoundService");
local v5, v6, v7, _, _ = require(game.ReplicatedStorage.Modules.ScriptSet).get();
local l_Util_0 = l_ReplicatedStorage_0.Util;
local l_Shared_0 = l_ReplicatedStorage_0.Modules.Shared;
local l_LocalPlayer_0 = game.Players.LocalPlayer;
local v13 = l_LocalPlayer_0.Character or l_LocalPlayer_0.CharacterAdded:Wait();
local l_HumanoidRootPart_0 = v13:WaitForChild("HumanoidRootPart");
local l_Humanoid_0 = v13.Humanoid;
_G.swimmingAscension = false;
_G.swimmingDecension = false;
local l_Animator_0 = v13.Humanoid.Animator;
local v17 = {
    Idle = l_Animator_0:LoadAnimation(l_Util_0.Swim.Idle), 
    Dive = l_Animator_0:LoadAnimation(l_Util_0.Swim.Dive), 
    Down = l_Animator_0:LoadAnimation(l_Util_0.Swim.Down), 
    Swim = l_Animator_0:LoadAnimation(l_Util_0.Swim.Swim), 
    Drown = l_Animator_0:LoadAnimation(l_Util_0.Swim.Drowning), 
    Jump = l_Animator_0:LoadAnimation(l_Util_0.Swim.waterJump)
};
for v18, v19 in pairs(v17) do
    v19.Priority = Enum.AnimationPriority.Action2;
    if v18 == "Idle" or v18 == "Jump" then
        v19.Priority = Enum.AnimationPriority.Action;
    end;
end;
local v20 = l_ReplicatedStorage_0:WaitForChild("Stats" .. l_LocalPlayer_0.Name);
local l_DF_0 = v20.Stats.DF;
local _ = workspace.CurrentCamera;
local v23 = 15;
local v24 = false;
local v25 = 0;
local v26 = 25;
local v27 = os.clock();
local l_Underwater_0 = l_Util_0.Swim.Underwater;
local l_Swimming_0 = l_Util_0.Swim.Swimming;
local l_SwimmingUnder_0 = l_Util_0.Swim.SwimmingUnder;
local v31 = OverlapParams.new();
v31.FilterDescendantsInstances = {
    workspace.Water
};
v31.FilterType = Enum.RaycastFilterType.Include;
local v32 = RaycastParams.new();
v32.FilterDescendantsInstances = {
    workspace.Islands, 
    workspace.Env, 
    workspace.Ships
};
v32.FilterType = Enum.RaycastFilterType.Include;
local _ = {
    LeftControl = "Down", 
    Space = "Dive", 
    W = "Swim", 
    A = "Swim", 
    S = "Swim", 
    D = "Swim"
};
_G.swimming = false;
_G.SeaLevel = workspace.Env.WaterStuff.Falls.Position.Y;
local l_Sand_0 = workspace.Env.WaterStuff:WaitForChild("Sand");
local _ = require(l_Shared_0.Signals.GoodSignal);
local _ = require(l_Shared_0.Maids.Maid);
local l_Controls_0 = require(l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule")):GetControls();
local v38 = require(l_ReplicatedStorage_0.Modules.CameraShaker);
local l_CurrentCamera_1 = workspace.CurrentCamera;
for _, v41 in l_CurrentCamera_1:GetChildren() do
    v41:Destroy();
end;
l_Util_0.Swim.Drown:Stop();
local l_BodyPosition_0 = Instance.new("BodyPosition");
l_BodyPosition_0.MaxForce = Vector3.new(0, 1000000, 0, 0);
l_BodyPosition_0.Position = Vector3.new(0, _G.SeaLevel, 0);
l_BodyPosition_0.P = 500000;
l_BodyPosition_0.D = 5000;
local l_BlurEffect_0 = Instance.new("BlurEffect");
l_BlurEffect_0.Size = 0;
l_BlurEffect_0.Name = "WaterBlur";
l_BlurEffect_0.Parent = l_CurrentCamera_1;
local l_ColorCorrectionEffect_0 = Instance.new("ColorCorrectionEffect");
l_ColorCorrectionEffect_0.Brightness = 0;
l_ColorCorrectionEffect_0.Contrast = 0;
l_ColorCorrectionEffect_0.Saturation = 0;
l_ColorCorrectionEffect_0.TintColor = Color3.new(1, 1, 1);
l_ColorCorrectionEffect_0.Name = "WaterColorContrast";
l_ColorCorrectionEffect_0.Parent = l_CurrentCamera_1;
local v45 = game.ReplicatedStorage.Util.Swim.BillboardGui:Clone();
v45.StudsOffset = Vector3.new(0, 2, 0, 0);
local v48 = v38.new(Enum.RenderPriority.Camera.Value + 1, function(v46) --[[ Line: 115 ]]
    -- upvalues: l_CurrentCamera_1 (copy)
    local l_l_CurrentCamera_1_0 = l_CurrentCamera_1;
    l_l_CurrentCamera_1_0.CFrame = l_l_CurrentCamera_1_0.CFrame * v46;
end);
v48:Start();
v13.ChildAdded:Connect(function(v49) --[[ Line: 122 ]]
    -- upvalues: v23 (ref)
    if v49.Name == "coatBubble" then
        v23 = 100;
        v49.Destroying:Connect(function() --[[ Line: 125 ]]
            -- upvalues: v23 (ref)
            v23 = 15;
        end);
    end;
end);
local v50 = true;
local v53 = {
    [true] = function() --[[ Line: 139 ]]
        -- upvalues: v50 (ref), l_Util_0 (copy), l_TweenService_0 (copy), l_ColorCorrectionEffect_0 (copy), l_BlurEffect_0 (copy), v48 (copy), v38 (copy), l_Underwater_0 (copy)
        if v50 then
            return;
        else
            v50 = true;
            local l_ColorCorrection_0 = l_Util_0.Swim.ColorCorrection;
            local _ = l_Util_0.Swim.Blur;
            l_TweenService_0:Create(l_ColorCorrectionEffect_0, TweenInfo.new(0.25), {
                Brightness = l_ColorCorrection_0.Brightness, 
                Contrast = l_ColorCorrection_0.Contrast, 
                Saturation = l_ColorCorrection_0.Saturation, 
                TintColor = l_ColorCorrection_0.TintColor
            }):Play();
            l_TweenService_0:Create(l_BlurEffect_0, TweenInfo.new(0.25), {
                Size = l_BlurEffect_0.Size
            }):Play();
            v48:ShakeSustain(v38.Presets.Underwater);
            if l_Underwater_0.IsPlaying == false then
                l_Underwater_0:Play();
            end;
            game.ReplicatedStorage.Util.Swim.Submerge:GetChildren()[math.random(1, #game.ReplicatedStorage.Util.Swim.Submerge:GetChildren())]:Play();
            return;
        end;
    end, 
    [false] = function() --[[ Line: 175 ]]
        -- upvalues: v50 (ref), l_TweenService_0 (copy), l_ColorCorrectionEffect_0 (copy), l_BlurEffect_0 (copy), v48 (copy), l_Underwater_0 (copy)
        if v50 == false then
            return;
        else
            v50 = false;
            l_TweenService_0:Create(l_ColorCorrectionEffect_0, TweenInfo.new(0.25), {
                Brightness = 0, 
                Contrast = 0, 
                Saturation = 0, 
                TintColor = Color3.new(1, 1, 1)
            }):Play();
            l_TweenService_0:Create(l_BlurEffect_0, TweenInfo.new(0.25), {
                Size = 0
            }):Play();
            v48:StopSustained(1);
            l_Underwater_0:Stop();
            warn("stop embetge");
            return;
        end;
    end
};
v53[false]();
local function v56() --[[ Line: 209 ]] --[[ Name: Splash ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), l_HumanoidRootPart_0 (copy), v13 (copy)
    local l_swim_0 = l_ReplicatedStorage_0.Events.swim;
    local v55 = _G.clientimpacts[l_ReplicatedStorage_0.ClientImpacts.WaterSplash];
    pcall(v55.start, v55, {
        cf = l_HumanoidRootPart_0.CFrame, 
        char = v13
    });
    l_swim_0:FireServer("splash", l_HumanoidRootPart_0.CFrame);
end;
local v57 = false;
local v58 = 0;
local function v60() --[[ Line: 219 ]] --[[ Name: EnteredWater ]]
    -- upvalues: l_Humanoid_0 (copy), v17 (copy), v27 (ref), l_HumanoidRootPart_0 (copy), v25 (ref), l_BodyPosition_0 (copy), v6 (copy), v58 (ref), v56 (copy), l_SwimmingUnder_0 (copy)
    if l_Humanoid_0.MoveDirection.Magnitude > 0 then
        v17.Swim:Play();
    end;
    v27 = os.clock();
    v17.Idle:Play();
    _G.swimming = true;
    local v59 = _G.getWavePosition(l_HumanoidRootPart_0.Position);
    v25 = l_HumanoidRootPart_0.Position.Y - v59;
    pcall(function() --[[ Line: 232 ]]
        -- upvalues: l_BodyPosition_0 (ref), v6 (ref)
        l_BodyPosition_0.Parent = v6.UpperTorso;
    end);
    if l_HumanoidRootPart_0.Position.Y > v59 - 5 and tick() - v58 >= 0.1 then
        v56();
        v58 = tick();
    end;
    l_SwimmingUnder_0:Stop();
end;
local function v64(v61) --[[ Line: 244 ]] --[[ Name: ExitedWater ]]
    -- upvalues: v17 (copy), l_BodyPosition_0 (copy), l_Util_0 (copy), v45 (copy), v57 (ref), l_Swimming_0 (copy), l_SwimmingUnder_0 (copy), l_Underwater_0 (copy)
    v17.Idle:Stop();
    if v61 == nil then
        _G.swimming = false;
    end;
    l_BodyPosition_0.MaxForce = Vector3.new(0, 0, 0, 0);
    pcall(function() --[[ Line: 250 ]]
        -- upvalues: l_BodyPosition_0 (ref)
        l_BodyPosition_0.Parent = script;
    end);
    for _, v63 in v17 do
        v63:Stop();
    end;
    l_Util_0.Swim.Drown:Stop();
    v45.Parent = nil;
    v57 = false;
    l_Swimming_0:Stop();
    l_SwimmingUnder_0:Stop();
    l_Underwater_0:Stop();
end;
local function v71(_) --[[ Line: 268 ]] --[[ Name: UpdateUI ]]
    -- upvalues: v45 (copy), l_Util_0 (copy), v17 (copy), v13 (copy), v27 (ref), l_HumanoidRootPart_0 (copy), l_DF_0 (copy), v23 (ref), v5 (copy), l_ReplicatedStorage_0 (copy), v6 (copy), v57 (ref)
    local function v66() --[[ Line: 270 ]] --[[ Name: stopDrown ]]
        -- upvalues: v45 (ref), l_Util_0 (ref), v17 (ref)
        v45.ImageLabel.ImageColor3 = Color3.fromRGB(154, 154, 154);
        if l_Util_0.Swim.Drown.IsPlaying or v17.Drown.IsPlaying then
            l_Util_0.Swim.Drown:Stop();
            v17.Drown:Stop();
        end;
    end;
    if v13:GetAttribute("underWater") == nil then
        v45.Parent = nil;
        v27 = os.clock();
        v66();
        return;
    else
        v45.Parent = l_HumanoidRootPart_0;
        local v67 = false;
        if l_DF_0.Value ~= "" then
            v67 = false;
            if game.ReplicatedStorage:FindFirstChild("tradingHUB") == nil then
                v67 = false;
                if v23 ~= 100 then
                    v67 = _G.playerFruitPassiveEnabled(v5) == false;
                end;
            end;
        end;
        if l_ReplicatedStorage_0:FindFirstChild("tradingHUB") then
            v67 = false;
        end;
        local l_v13_Attribute_0 = v13:GetAttribute("timeUntilDrown");
        local l_v13_Attribute_1 = v13:GetAttribute("maxUnderwater");
        if l_v13_Attribute_0 == nil or l_v13_Attribute_1 == nil then
            v66();
            return;
        else
            local v70 = l_v13_Attribute_0 / l_v13_Attribute_1;
            v45.ImageLabel.Frame.Size = UDim2.new(1, 0, v70, 0);
            v45.ImageLabel.Frame.ImageLabel.Size = UDim2.new(1, 0, 1 / v70, 0);
            if v70 <= 0 and l_v13_Attribute_0 ~= nil and l_v13_Attribute_1 ~= nil and v6:FindFirstChild("iFrame") == nil and v6:FindFirstChild("GrabTag") == nil then
                v57 = true;
                v45.ImageLabel.ImageColor3 = Color3.new(1, 0, 0);
                if not v17.Drown.IsPlaying then
                    l_Util_0.Swim.Drown:Play();
                    v17.Drown:Play();
                    return;
                end;
            else
                v66();
            end;
            return;
        end;
    end;
end;
local v72 = 0;
local function v82() --[[ Line: 321 ]] --[[ Name: AnimationHandler ]]
    -- upvalues: v72 (ref), v17 (copy), l_Humanoid_0 (copy), l_HumanoidRootPart_0 (copy), l_BodyPosition_0 (copy), v24 (ref), v25 (ref), v13 (copy), v6 (copy)
    if v72 ~= 0 then
        if v17.Swim.IsPlaying then
            v17.Swim:Stop();
        end;
        local v73 = v72 > 0 and "Dive" or "Down";
        local v74 = v17[v73];
        if not v74.IsPlaying then
            v17.Dive:Stop();
            v17.Down:Stop();
            if v73 == "Down" and l_Humanoid_0.FloorMaterial == Enum.Material.Air then
                v74:Play();
            elseif v73 == "Dive" then
                v74:Play();
            end;
        end;
    else
        if v17.Dive.IsPlaying or v17.Down.IsPlaying then
            v17.Dive:Stop();
            v17.Down:Stop();
        end;
        if l_Humanoid_0.MoveDirection.Magnitude > 0 then
            if not v17.Swim.IsPlaying then
                v17.Swim:Play();
            end;
        else
            v17.Swim:Stop();
        end;
    end;
    local v75 = l_Humanoid_0.HipHeight + l_HumanoidRootPart_0.Size.Y / 2 + 1;
    local v76, _, _ = _G.getRayFloor(l_HumanoidRootPart_0.CFrame, v75);
    if v76 or l_Humanoid_0.SeatPart ~= nil then
        for v79, v80 in v17 do
            if v79 ~= "Drown" then
                v80:Stop();
            end;
        end;
        l_BodyPosition_0.MaxForce = Vector3.new(0, 0, 0, 0);
        l_BodyPosition_0.Position = l_HumanoidRootPart_0.Position;
        v24 = true;
        _G.swimming = true;
    else
        l_BodyPosition_0.MaxForce = Vector3.new(0, 1000000, 0, 0);
        if v24 then
            v24 = false;
            v25 = l_HumanoidRootPart_0.Position.Y - _G.getWavePosition(l_HumanoidRootPart_0.Position);
            if v17.Idle.IsPlaying == false then
                v17.Idle:Play();
            end;
        end;
    end;
    if l_BodyPosition_0.MaxForce ~= Vector3.new(0, 0, 0, 0) and _G.swimming == true then
        local l_BodyVelocity_0 = v13.PrimaryPart:FindFirstChildWhichIsA("BodyVelocity");
        if l_BodyVelocity_0 and l_BodyVelocity_0:GetAttribute("LetSwim") == nil and _G.check:inspect(v6) == true then
            l_BodyPosition_0.MaxForce = Vector3.new(0, 0, 0, 0);
            return;
        end;
    elseif _G.swimming == true and v24 == false then
        l_BodyPosition_0.MaxForce = Vector3.new(0, 1000000, 0, 0);
    end;
end;
local function _(v83, v84) --[[ Line: 406 ]] --[[ Name: isLocatedInWater ]]
    -- upvalues: l_HumanoidRootPart_0 (copy)
    if v84 == nil then
        v84 = _G.getWavePosition(l_HumanoidRootPart_0.Position);
    end;
    return v83.Y < v84;
end;
local function v88() --[[ Line: 413 ]] --[[ Name: checkNearFishman ]]
    -- upvalues: v13 (copy)
    local l_FirstChild_0 = workspace.Islands:FindFirstChild("Fishman Island");
    if not l_FirstChild_0 or l_FirstChild_0 and not l_FirstChild_0:FindFirstChild("Shield") then
        return false;
    else
        local l_HumanoidRootPart_1 = v13:FindFirstChild("HumanoidRootPart");
        if not l_HumanoidRootPart_1 then
            return false;
        else
            return (l_FirstChild_0.Shield.Position - l_HumanoidRootPart_1.Position).Magnitude <= l_FirstChild_0.Shield.Mesh.Scale.X;
        end;
    end;
end;
while task.wait(0.016666666666666666) do
    local v89 = _G.getWavePosition(l_HumanoidRootPart_0.Position);
    local v90 = l_HumanoidRootPart_0.Position + Vector3.new(0, 1, 0, 0) * (_G.swimming and -1 or 1);
    local l_v89_0 = v89;
    if l_v89_0 == nil then
        l_v89_0 = _G.getWavePosition(l_HumanoidRootPart_0.Position);
    end;
    local v92 = v90.Y < l_v89_0;
    l_v89_0 = l_CurrentCamera_1.CFrame.Position;
    local l_v89_1 = v89;
    if l_v89_1 == nil then
        l_v89_1 = _G.getWavePosition(l_HumanoidRootPart_0.Position);
    end;
    CameraIsSubmerged = l_v89_0.Y < l_v89_1;
    if v92 then
        v90 = false;
        if l_DF_0.Value ~= "" then
            v90 = false;
            if v23 ~= 100 then
                v90 = false;
                if _G.playerFruitPassiveEnabled(v5) == true then
                    v90 = game.ReplicatedStorage:FindFirstChild("tradingHUB") == nil;
                end;
            end;
        end;
        l_v89_0 = false;
        if string.match(v20.Customization.Race.Value, "Fishman") then
            l_v89_0 = true;
            v26 = v90 == false and 50 or 25;
        else
            v26 = 25;
        end;
        if v88() == true then
            if _G.swimming then
                v64();
            end;
            l_Sand_0.Mesh.Offset = Vector3.new(0, workspace.Env.WaterStuff.SandLayer2.Position.Y - l_Sand_0.Position.Y, 0);
            v48:StopSustained(1);
            l_Underwater_0:Stop();
            continue;
        else
            l_Sand_0.Mesh.Offset = Vector3.new(0, l_Sand_0.Size.Y / 2, 0);
            if _G.swimming == false then
                v60();
            end;
            v82();
            l_v89_1 = l_Controls_0:GetMoveVector();
            local v94 = _G.getWavePosition(l_HumanoidRootPart_0.Position);
            v94 = l_HumanoidRootPart_0.Position.Y <= v94 and v94 or _G.SeaLevel;
            local v95 = v7:IsKeyDown(Enum.KeyCode.Space) or _G.swimmingAscension;
            local v96 = v7:IsKeyDown(Enum.KeyCode.LeftControl) or _G.swimmingDecension;
            local v97 = not v90 and (v95 and 1 or 0) + (v96 and -1 or 0);
            if v90 == true then
                v97 = -1;
            end;
            local v98 = not workspace:Raycast(l_HumanoidRootPart_0.Position, Vector3.new(0, 1, 0, 0) * v97 * (l_Humanoid_0.HipHeight + l_HumanoidRootPart_0.Size.Y * 0.5), v32) and v72 or 0;
            v25 = v25 + v98;
            if v6:FindFirstChild("geppo", true) or _G.canuse == false and v90 == false then
                v72 = 0;
                v25 = l_HumanoidRootPart_0.Position.Y - v94;
                l_BodyPosition_0.Position = l_HumanoidRootPart_0.Position;
            else
                v72 = v97 * v26 * 0.016666666666666666;
                l_BodyPosition_0.Position = Vector3.new(0, 1, 0, 0) * (v94 + v25);
            end;
            if l_v89_1.Magnitude > 0 and v24 == false then
                if l_HumanoidRootPart_0.Position.Y >= v94 - 4 then
                    if l_Swimming_0.Playing == false then
                        l_Swimming_0:Play();
                    end;
                    if l_SwimmingUnder_0.Playing == true then
                        l_SwimmingUnder_0:Stop();
                    end;
                else
                    if l_Swimming_0.Playing == true then
                        l_Swimming_0:Stop();
                    end;
                    if l_SwimmingUnder_0.Playing == false then
                        l_SwimmingUnder_0:Play();
                    end;
                end;
            else
                if l_Swimming_0.Playing then
                    l_Swimming_0:Stop();
                end;
                if l_SwimmingUnder_0.Playing then
                    l_SwimmingUnder_0:Stop();
                end;
            end;
            if v94 <= v25 - 4 then
                game.ReplicatedStorage.Util.Swim.Swimming:Stop();
                if game.ReplicatedStorage.Util.Swim.SwimmingUnder.IsPlaying == false then
                    game.ReplicatedStorage.Util.Swim.SwimmingUnder:Play();
                end;
            end;
            v71();
            if v95 then
                local v99 = false;
                if v94 - 1 < l_HumanoidRootPart_0.Position.Y then
                    v99 = #workspace:GetPartBoundsInBox(CFrame.new(l_HumanoidRootPart_0.Position + Vector3.new(0, 1, 0, 0)), Vector3.new(1, 1, 1, 0), v31) == 0;
                end;
                if v99 then
                    v64();
                    l_HumanoidRootPart_0.AssemblyLinearVelocity = Vector3.new(0, 75, 0, 0);
                    v27 = os.clock();
                    l_Util_0.Swim.Jumps:GetChildren()[math.random(#l_Util_0.Swim.Jumps:GetChildren())]:Play();
                    v17.Jump:Play();
                    v56();
                end;
            end;
        end;
    else
        if _G.swimming == true then
            v72 = 0;
            v64();
            l_HumanoidRootPart_0.AssemblyLinearVelocity = Vector3.new();
        end;
        l_BodyPosition_0.Position = l_HumanoidRootPart_0.Position;
    end;
    l_SoundService_0.AmbientReverb = Enum.ReverbType[CameraIsSubmerged and "UnderWater" or "NoReverb"];
    v53[CameraIsSubmerged]();
    v90 = l_HumanoidRootPart_0.Position;
    if (Vector3.new(v90.X, l_Sand_0.Position.Y, v90.Z) - l_Sand_0.Position).Magnitude >= 400 then
        l_Sand_0.CFrame = CFrame.new(v90.X, l_Sand_0.Position.Y, v90.Z);
    end;
end;