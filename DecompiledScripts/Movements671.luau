local v0, v1, v2, _, v4 = require(game.ReplicatedStorage.Modules.ScriptSet).get();
local v5 = false;
_G.blocking = false;
_G.swordEquiped = false;
local _ = require(game.ReplicatedStorage.Modules.RotatedRegion3);
local _ = require(game.ReplicatedStorage.Util.Movement.GpoClimbing);
local _ = require(game.ReplicatedStorage.Modules.CameraShaker);
local _ = require(game.ReplicatedStorage.Util.Movement.DashTypes);
local v10 = workspace:WaitForChild("Ragdolls", 5);
local l_Animator_0 = v1.Humanoid:WaitForChild("Animator");
v1.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false);
v1.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false);
game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid;
game.Workspace.CurrentCamera.FieldOfView = 70;
game.Workspace.CurrentCamera.CameraType = "Custom";
l_Animator_0:LoadAnimation(game.ReplicatedStorage.Util.Movement.Sit).Priority = Enum.AnimationPriority.Action4;
local v12 = 0;
local _ = l_Animator_0:LoadAnimation(script.run);
_G.running = false;
local v14 = script.EvasiveIndicator:Clone();
v14.ImageLabel.ImageTransparency = 1;
v14.Parent = v1.PrimaryPart;
_G.orgRun = script.run.AnimationId;
_G.instantDash = true;
repeat
    task.wait();
until _G.clientimpacts ~= nil;
local function _(v15) --[[ Line: 55 ]] --[[ Name: getBuso ]]
    local v16 = false;
    local l_v15_Children_0 = v15:GetChildren();
    for v18 = 1, #l_v15_Children_0 do
        if l_v15_Children_0[v18].Name:match("Buso") and l_v15_Children_0[v18]:IsA("NumberValue") then
            v16 = true;
        end;
    end;
    return v16;
end;
local function _() --[[ Line: 66 ]] --[[ Name: checkHoldingWeapon ]]
    -- upvalues: v1 (copy)
    local l_Tool_0 = v1:FindFirstChildWhichIsA("Tool");
    if l_Tool_0 and l_Tool_0:GetAttribute("customRun") then
        return true;
    elseif _G.currentSword and _G.currentSword.Anims and _G.currentSword.Anims.run and #_G.currentSword.Anims.run >= 1 then
        return true;
    else
        return false;
    end;
end;
local function _(v22, v23) --[[ Line: 78 ]] --[[ Name: roundNumber ]]
    return math.floor(v22 * 10 ^ v23) / 10 ^ v23;
end;
local _ = require(game.ReplicatedStorage.Modules.Skills);
local function _(v26) --[[ Line: 85 ]] --[[ Name: getcharformpart ]]
    local v27 = nil;
    local l_Children_0 = workspace.PlayerCharacters:GetChildren();
    for v29 = 1, #l_Children_0 do
        if v26:IsDescendantOf(l_Children_0[v29]) then
            return l_Children_0[v29];
        end;
    end;
    return v27;
end;
_G.geppo = 1;
local _ = _G.clientimpacts[game.ReplicatedStorage.ClientImpacts.Soru];
local _ = require(game.ReplicatedStorage.Modules.FastWait);
local l_InputCallbacks_0 = require(v0.Backpack:WaitForChild("InputCallbacks"));
local l_PlayerScripts_0 = v0:WaitForChild("PlayerScripts");
local _ = require(l_PlayerScripts_0:WaitForChild("InputHandler"));
local _ = {};
v2.InputBegan:Connect(function(v37, v38) --[[ Line: 110 ]]
    -- upvalues: v4 (copy), v5 (ref), l_InputCallbacks_0 (copy), v0 (copy), v1 (copy)
    if v38 and v37.KeyCode ~= Enum.KeyCode.B and v37.KeyCode ~= Enum.KeyCode.Backspace and v37.KeyCode ~= Enum.KeyCode.Space and v37.KeyCode ~= Enum.KeyCode.W and v37.KeyCode ~= Enum.KeyCode.V and v37.KeyCode ~= Enum.KeyCode.P and v37.KeyCode ~= Enum.KeyCode.LeftControl then
        return;
    elseif v38 then
        return;
    else
        if v37.KeyCode == Enum.KeyCode.W and v4.Settings.AutoRun.Value == false then
            if v5 == false then
                v5 = true;
            else
                v5 = "run";
            end;
            if v5 == "run" then
                l_InputCallbacks_0.Callbacks.Run.HoldingRun = true;
                l_InputCallbacks_0.Callbacks.Run:PC_Activate();
                v5 = false;
                return;
            else
                task.wait(0.2);
                if v5 == true then
                    v5 = false;
                    return;
                end;
            end;
        elseif v37.KeyCode == Enum.KeyCode.LeftControl then
            l_InputCallbacks_0.Callbacks.Evasive:PC_Activate();
            l_InputCallbacks_0.Callbacks.Climb:PC_Activate();
            return;
        elseif v37.KeyCode == Enum.KeyCode.Q then
            l_InputCallbacks_0.Callbacks.Dash:PC_Activate();
            return;
        elseif v37.KeyCode == Enum.KeyCode.H and v0.Name == "Phoeating" and _G.check:inspect(v1) == true then
            game.ReplicatedStorage.Events.Haki:FireServer("Haoshoku3");
            return;
        elseif v37.KeyCode == Enum.KeyCode.V then
            l_InputCallbacks_0.Callbacks.Carry:PC_Activate();
            return;
        elseif v37.KeyCode == Enum.KeyCode.B then
            l_InputCallbacks_0.Callbacks.Grip:PC_Activate();
            return;
        elseif v37.KeyCode == Enum.KeyCode.Space then
            l_InputCallbacks_0.Callbacks.Geppo:PC_Activate();
            return;
        elseif v37.KeyCode == Enum.KeyCode.P then
            l_InputCallbacks_0.Callbacks.ShipSeat:PC_Activate();
            return;
        elseif v37.KeyCode == Enum.KeyCode.Backspace then
            l_InputCallbacks_0.Callbacks.DropTool:PC_Activate();
        end;
        return;
    end;
end);
v2.InputEnded:Connect(function(v39, _) --[[ Line: 154 ]]
    -- upvalues: v4 (copy), l_InputCallbacks_0 (copy)
    if v39.KeyCode == Enum.KeyCode.W and v4.Settings.AutoRun.Value == false then
        l_InputCallbacks_0.Callbacks.Run.HoldingRun = false;
    end;
end);
local v41 = nil;
v41 = v1.Humanoid.HealthChanged:Connect(function(v42) --[[ Line: 161 ]]
    -- upvalues: v1 (copy)
    if v42 <= 0 and v1:FindFirstChild("Rag") == nil then
        workspace.CurrentCamera.CameraType = Enum.CameraType.Track;
    end;
end);
local l_status_0, l_result_0 = pcall(function() --[[ Line: 167 ]]
    -- upvalues: v1 (copy)
    local v43 = Instance.new("BindableEvent", game.ReplicatedStorage);
    v43.Name = "resetBindable";
    v43.Event:Connect(function() --[[ Line: 170 ]]
        -- upvalues: v1 (ref)
        if game.ReplicatedStorage.reservedCode.Value == "arena" and game.ReplicatedStorage.Matchinfo.matchStarted.Value == false then
            return;
        elseif game.ReplicatedStorage.reservedCode:GetAttribute("battleRoyale") then
            _G.displayMessage("<Color=Red>Cannot reset in battle royale!");
            return;
        elseif game.ReplicatedStorage:FindFirstChild("tradingHUB") then
            return;
        elseif (_G.canuse == false or _G.check:inspect(v1) == false) and game.ReplicatedStorage:FindFirstChild("RAIDMODE") == nil and v1.Parent == workspace.PlayerCharacters then
            _G.displayMessage("<Color=Red>Cannot reset while stunned, or casting a skill!");
            return;
        elseif game.ReplicatedStorage.reservedCode.Value == "arena" and game.ReplicatedStorage:FindFirstChild("RAIDMODE") == nil and v1.Parent ~= workspace.Ragdolls then
            _G.displayMessage("<Color=Red>Cannot reset unless you are knocked out!");
            return;
        else
            game.ReplicatedStorage.Events.KnockedOut:FireServer("self");
            return;
        end;
    end);
    game:GetService("StarterGui"):SetCore("ResetButtonCallback", v43);
end);
if not l_status_0 then
    warn("ERROR: " .. l_result_0);
end;
local v46 = false;
local v47 = require(game.ReplicatedStorage.Modules.BindToRender);
local l_Humanoid_0 = v1.Humanoid;
l_Humanoid_0.Seated:Connect(function() --[[ Line: 207 ]]
    -- upvalues: v1 (copy)
    if _G.canuse == false and v1.Humanoid.SeatPart and v1:FindFirstChild("KarooRace") == nil and v1.Humanoid.SeatPart ~= nil then
        v1.Humanoid.Sit = true;
        warn("unsit");
        v1.Humanoid.SeatPart:Sit(nil);
        task.delay(0.2, function() --[[ Line: 213 ]]
            -- upvalues: v1 (ref)
            v1.Humanoid.Sit = false;
        end);
    end;
end);
local function _(v49) --[[ Line: 220 ]] --[[ Name: recalculateHipHeight ]]
    local v50 = v49.HumanoidRootPart.Position.Y - 0.5 * v49.HumanoidRootPart.Size.Y - (v49.LeftFoot.Position.Y - 0.5 * v49.LeftFoot.Size.Y);
    v49:FindFirstChildOfClass("Humanoid").HipHeight = v50;
end;
l_Humanoid_0:GetPropertyChangedSignal("HipHeight"):Connect(function() --[[ Line: 229 ]] --[[ Name: fixHipHeight ]]
    -- upvalues: l_Humanoid_0 (copy), v1 (copy)
    if l_Humanoid_0.HipHeight > 0.1 then
        return;
    else
        local l_v1_0 = v1;
        local v53 = l_v1_0.HumanoidRootPart.Position.Y - 0.5 * l_v1_0.HumanoidRootPart.Size.Y - (l_v1_0.LeftFoot.Position.Y - 0.5 * l_v1_0.LeftFoot.Size.Y);
        l_v1_0:FindFirstChildOfClass("Humanoid").HipHeight = v53;
        return;
    end;
end);
if l_Humanoid_0.HipHeight <= 0.1 then
    local v54 = v1.HumanoidRootPart.Position.Y - 0.5 * v1.HumanoidRootPart.Size.Y - (v1.LeftFoot.Position.Y - 0.5 * v1.LeftFoot.Size.Y);
    v1:FindFirstChildOfClass("Humanoid").HipHeight = v54;
end;
local v55 = nil;
local v56 = 0;
_G.grounded = false;
local v57 = nil;
local _ = game:GetService("ContextActionService");
local v59 = false;
v1.PrimaryPart.ChildAdded:Connect(function(v60) --[[ Line: 250 ]]
    -- upvalues: v1 (copy)
    if v60.Name ~= "knockback" and v60:IsA("BodyVelocity") then
        local l_ComboBP_0 = v1.HumanoidRootPart:FindFirstChild("ComboBP");
        if l_ComboBP_0 then
            l_ComboBP_0:Destroy();
        end;
    end;
end);
local l_ProximityPromptService_0 = game:GetService("ProximityPromptService");
local v63 = true;
local l_Eliminated_0 = game.Teams:FindFirstChild("Eliminated");
if l_ProximityPromptService_0.Enabled == false then
    v63 = false;
end;
if l_Eliminated_0 and v0.Team == l_Eliminated_0 then
    v63 = false;
end;
local v65 = false;
local function v77(_) --[[ Line: 271 ]] --[[ Name: renderFunction ]]
    -- upvalues: v1 (copy), v56 (ref), v57 (ref), v0 (copy), v46 (ref), v59 (ref), v10 (copy), v65 (ref), v12 (ref), v55 (ref), v4 (copy), v2 (copy), l_InputCallbacks_0 (copy)
    local l_Dizzed_0 = v1:FindFirstChild("Dizzed");
    local l_Stun_0 = v1:FindFirstChild("Stun");
    local l_frozen_0 = v1:FindFirstChild("frozen");
    if l_Stun_0 == nil then
        l_Stun_0 = v1:FindFirstChild("PB");
    end;
    if v1.PrimaryPart == nil or v1.Parent == workspace.Effects then
        return;
    else
        if tick() - v56 >= 0.1 then
            v56 = tick();
            if v1:GetAttribute("Grounded") then
                if _G.grounded == false then
                    script.GroundedHit:Play();
                    _G.displayMessage("<Color=Orange>You have been grounded, dashes and mobility moves are restricted.");
                    v57 = script.GroundedUI:Clone();
                    v57.ImageLabel.ImageTransparency = 1;
                    v57.Parent = v0.PlayerGui;
                    _G.tween(v57.ImageLabel, {
                        0.25, 
                        "Cubic", 
                        Enum.EasingDirection.Out
                    }, {
                        ImageTransparency = script.GroundedUI.ImageLabel.ImageTransparency
                    });
                end;
                _G.grounded = true;
            else
                if v57 then
                    _G.tween(v57.ImageLabel, {
                        0.25, 
                        "Cubic", 
                        Enum.EasingDirection.Out
                    }, {
                        ImageTransparency = 1
                    });
                    _G.destroy(v57, 0.25);
                    v57 = nil;
                    script.UnGroundedHit:Play();
                end;
                _G.grounded = false;
            end;
        end;
        if (l_Dizzed_0 or l_Stun_0 or l_frozen_0) and v1:GetAttribute("evading") == nil then
            v1.Humanoid.WalkSpeed = 0;
            v1.Humanoid.JumpPower = 0;
            if v1.Humanoid.SeatPart ~= nil and v1:FindFirstChild("KarooRace") == nil then
                v1.Humanoid.Sit = true;
                v1.Humanoid.SeatPart:Sit(nil);
                task.delay(0.2, function() --[[ Line: 314 ]]
                    -- upvalues: v1 (ref)
                    v1.Humanoid.Sit = false;
                end);
            end;
            v1.Humanoid:MoveTo(v1.PrimaryPart.Position);
            v1.Humanoid.Jump = false;
            v46 = true;
        elseif l_Dizzed_0 == nil and v46 == true and l_Stun_0 == nil and l_frozen_0 == nil then
            v1.Humanoid.WalkSpeed = 16;
            v1.Humanoid.JumpPower = 50;
            v46 = false;
            v59 = false;
        end;
        if v1:FindFirstChild("Rag") then
            v1.Humanoid.AutoRotate = false;
        end;
        if v1.Parent == v10 and v1.Humanoid.SeatPart ~= nil then
            local l_SeatWeld_0 = v1.Humanoid.SeatPart:FindFirstChild("SeatWeld");
            if l_SeatWeld_0 then
                l_SeatWeld_0:Destroy();
            end;
            if v1.Humanoid:GetState() ~= Enum.HumanoidStateType.Physics then
                v1.Humanoid:ChangeState(Enum.HumanoidStateType.Physics);
            end;
        end;
        if v1:FindFirstChild("Cuffed") then
            local l_v1_Children_0 = v1:GetChildren();
            for v72 = 1, #l_v1_Children_0 do
                if l_v1_Children_0[v72]:IsA("Tool") then
                    l_v1_Children_0[v72].Parent = game.Players.LocalPlayer.Backpack;
                end;
            end;
        end;
        local l_Humanoid_1 = v1.Humanoid;
        if v65 == true and tick() - v12 >= 1 then
            v65 = false;
            v1.Humanoid.JumpPower = 50;
        end;
        if tick() - v12 < 1 then
            v1.Humanoid.Jump = false;
            v1.Humanoid.JumpPower = 0;
            v65 = true;
        elseif v1.Humanoid.Jump == true or l_Humanoid_1:GetState() == Enum.HumanoidStateType.Jumping then
            v12 = tick();
        end;
        if v1.PrimaryPart.Anchored == true then
            v1.PrimaryPart.Velocity = Vector3.new();
        end;
        local l_Magnitude_0 = v1.PrimaryPart.Velocity.Magnitude;
        local v75 = v1.HumanoidRootPart:findFirstChild("knockback");
        if (l_Magnitude_0 >= 75 or v75 and v75.Velocity.magnitude >= 25) and v1:GetAttribute("bypassSpeedLines") == nil and v1.Humanoid.SeatPart == nil and v1.PrimaryPart.Anchored == false then
            if v55 == nil then
                v55 = script.fallingParticle:Clone();
                local l_Weld_0 = Instance.new("Weld");
                l_Weld_0.Part0 = v1.LowerTorso;
                l_Weld_0.Part1 = v55;
                l_Weld_0.Parent = v55;
                v55.Parent = workspace.Effects;
            else
                v55.Lines.Rate = math.clamp(15 + v1.PrimaryPart.Velocity.Magnitude, 15, 50);
                v55.Lines.Size = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0, 0), 
                    NumberSequenceKeypoint.new(0.2, 1 + l_Magnitude_0 / 100, 0), 
                    NumberSequenceKeypoint.new(1, 0, 0)
                });
                v55.Lines2.Size = v55.Lines.Size;
                v55.Lines2.Rate = v55.Lines.Rate;
                script.fallingLoop.Pitch = l_Magnitude_0 / 40;
            end;
        elseif v55 then
            v55.Lines.Enabled = false;
            v55.Lines2.Enabled = false;
            _G.destroy(v55, 3);
            v55 = nil;
        end;
        _G.inCombat = v1:FindFirstChild("inCombat") ~= nil;
        if v4 and v4.Settings.AutoRun.Value == true then
            if _G.mobile == false and v2:IsKeyDown(Enum.KeyCode.W) == false then
                l_InputCallbacks_0.Callbacks.Run.HoldingRun = false;
                _G.running = false;
                return;
            elseif l_InputCallbacks_0.Callbacks.Run.HoldingRun ~= true and _G.mobile == false then
                l_InputCallbacks_0.Callbacks.Run.HoldingRun = true;
                _G.running = true;
                l_InputCallbacks_0.Callbacks.Run:PC_Activate();
            end;
        end;
        return;
    end;
end;
v47:AddToRender("Movement", script, 1).Event:Connect(v77);