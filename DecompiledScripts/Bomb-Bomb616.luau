local v0 = {};
local v1 = require(game.ReplicatedStorage.Modules.Skills);
local l_LocalPlayer_0 = game.Players.LocalPlayer;
local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
local _ = require(game.ReplicatedStorage.Modules.FastWait);
local l_UserInputService_0 = game:GetService("UserInputService");
local _ = require(game.ReplicatedStorage.Modules.CameraShaker);
local function _(v7) --[[ Line: 9 ]] --[[ Name: round ]]
    return math.sign(v7) * math.ceil((math.abs(v7)));
end;
v0.start = function(_, v10) --[[ Line: 13 ]] --[[ Name: start ]]
    -- upvalues: v1 (copy), l_FirstChild_0 (copy), l_UserInputService_0 (copy)
    local l_Character_0 = game.Players.LocalPlayer.Character;
    local v12 = v1.GetM("BombDash");
    if v12.stamreq and l_FirstChild_0.Stamina.Value < v12.stamreq then
        v10 = false;
        return;
    elseif v12.statreq and _G.MeetReq(v1.GetM("BombDash").statreq, nil, true) == false then
        v10 = false;
        return;
    else
        if _G.inCombat == true then
            _G.midDash = true;
        end;
        if game.ReplicatedStorage.Events.Skill:InvokeServer("BombDash", l_Character_0) == true then
            _G.PlayEffect("BombDash", nil, l_Character_0.HumanoidRootPart.CFrame, l_Character_0, nil);
        end;
        local l_BodyVelocity_0 = Instance.new("BodyVelocity");
        l_BodyVelocity_0.Name = "rolling";
        l_BodyVelocity_0.MaxForce = Vector3.new(1000000, 1000000, 1000000, 0);
        l_BodyVelocity_0.Parent = l_Character_0.HumanoidRootPart;
        local v14 = 85;
        local v15 = true;
        local l_MoveDirection_0 = l_Character_0.Humanoid.MoveDirection;
        if l_MoveDirection_0 == Vector3.new(0, 0, 0, 0) then
            l_MoveDirection_0 = l_Character_0.HumanoidRootPart.CFrame.LookVector * 1;
        end;
        local l_Unit_0 = workspace.CurrentCamera.CFrame:vectorToObjectSpace(l_Character_0.Humanoid.MoveDirection).Unit;
        if _G.blocking == false then
            local v18 = l_Character_0.Humanoid:LoadAnimation(script.front);
            if l_UserInputService_0.MouseBehavior == Enum.MouseBehavior.LockCenter then
                if math.abs(l_Unit_0.X) > math.abs(l_Unit_0.Z) then
                    v15 = false;
                    v18 = if l_Unit_0.X < 0 then l_Character_0.Humanoid:LoadAnimation(script.left) else l_Character_0.Humanoid:LoadAnimation(script.right);
                elseif math.abs(l_Unit_0.X) < math.abs(l_Unit_0.Z) and l_Unit_0.Z > 0 then
                    v18 = l_Character_0.Humanoid:LoadAnimation(script.back);
                    v15 = false;
                end;
            end;
            v18:Play();
            v18.Priority = Enum.AnimationPriority.Action2;
            v18:AdjustSpeed(1);
        end;
        if _G.running == true then
            v14 = 100;
        end;
        if _G.blocking == true then
            v14 = 15;
        end;
        l_Character_0.Humanoid.AutoRotate = false;
        local _ = CFrame.new(l_Character_0.HumanoidRootPart.CFrame.p, l_MoveDirection_0 + l_Character_0.HumanoidRootPart.CFrame.p);
        local _ = l_Character_0.Humanoid.Health / l_Character_0.Humanoid.MaxHealth;
        if _G.check:inspect(l_Character_0) and v15 == true then
            l_Character_0.HumanoidRootPart.CFrame = CFrame.new(l_Character_0.HumanoidRootPart.CFrame.p, l_MoveDirection_0 + l_Character_0.HumanoidRootPart.CFrame.p);
        end;
        l_BodyVelocity_0.Velocity = CFrame.new(l_Character_0.HumanoidRootPart.CFrame.p, l_MoveDirection_0 + l_Character_0.HumanoidRootPart.CFrame.p).LookVector * v14;
        _G.destroy(l_BodyVelocity_0, 0.2);
        local v21 = tick();
        repeat
            if _G.check:inspect(l_Character_0, true) == false then
                l_BodyVelocity_0:Destroy();
                if l_Character_0:FindFirstChild("knockback", true) == nil then
                    l_Character_0.PrimaryPart.AssemblyLinearVelocity = Vector3.new();
                end;
            end;
            task.wait();
        until tick() - v21 >= 0.4;
        _G.midDash = nil;
        l_Character_0.Humanoid.AutoRotate = true;
        task.wait(0.75);
        return true;
    end;
end;
return v0;