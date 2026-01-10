local v0 = {};
local _ = require(game.ReplicatedStorage.Modules.Skills);
local _ = _G.clientimpacts[game.ReplicatedStorage.ClientImpacts.Soru];
local l_LocalPlayer_0 = game.Players.LocalPlayer;
local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
local _ = require(game.ReplicatedStorage.Modules.FastWait);
local l_UserInputService_0 = game:GetService("UserInputService");
local _ = require(game.ReplicatedStorage.Modules.CameraShaker);
local v8 = require(game.ReplicatedStorage.Modules.SwordHandle.SwordInfo);
local l_CurrentCamera_0 = workspace.CurrentCamera;
v0.start = function(_, _) --[[ Line: 13 ]] --[[ Name: start ]]
    -- upvalues: l_FirstChild_0 (copy), l_UserInputService_0 (copy), v8 (copy), l_CurrentCamera_0 (copy)
    local l_Character_0 = game.Players.LocalPlayer.Character;
    if _G.StamCheck(10 + l_FirstChild_0.Stamina.MaxValue * _G.dashPercentAmmount, true) == false then
        return;
    else
        if l_Character_0.HumanoidRootPart:FindFirstChild("RollDirt") == nil then
            script.Dirt.RollDirt:Clone().Parent = l_Character_0.HumanoidRootPart;
        end;
        game.ReplicatedStorage.Events.takestam:FireServer(l_FirstChild_0.Stamina.MaxValue * _G.dashPercentAmmount, "dash");
        local _ = l_Character_0.PrimaryPart:GetMass();
        local l_BodyVelocity_0 = Instance.new("BodyVelocity");
        l_BodyVelocity_0.Name = "rolling";
        l_BodyVelocity_0.MaxForce = Vector3.new(70000, 100, 70000, 0);
        l_BodyVelocity_0.Parent = l_Character_0.HumanoidRootPart;
        local v15 = false;
        local v16 = 60;
        local v17 = true;
        local l_Tool_0 = l_Character_0:FindFirstChildWhichIsA("Tool");
        if _G.blocking == false then
            local v19 = l_Character_0.Humanoid:LoadAnimation(script.roll);
            local v20 = 2;
            if l_UserInputService_0:IsKeyDown(Enum.KeyCode.A) then
                v17 = false;
                v19 = l_Character_0.Humanoid:LoadAnimation(script.left);
                v20 = 1.5;
            elseif l_UserInputService_0:IsKeyDown(Enum.KeyCode.D) then
                v17 = false;
                v19 = l_Character_0.Humanoid:LoadAnimation(script.right);
                v20 = 1.5;
            elseif l_UserInputService_0:IsKeyDown(Enum.KeyCode.W) then
                v15 = true;
            end;
            if l_Tool_0 ~= nil and v8[l_Tool_0.Name] and game.ReplicatedStorage.Modules.SwordHandle.Swords[l_Tool_0.Name]:FindFirstChild("Dashes") ~= nil then
                local l_Dashes_0 = game.ReplicatedStorage.Modules.SwordHandle.Swords[l_Tool_0.Name]:FindFirstChild("Dashes");
                if l_UserInputService_0:IsKeyDown(Enum.KeyCode.A) then
                    v17 = false;
                    v19 = l_Character_0.Humanoid:LoadAnimation(l_Dashes_0.Left);
                    v20 = 1.5;
                elseif l_UserInputService_0:IsKeyDown(Enum.KeyCode.D) then
                    v17 = false;
                    v19 = l_Character_0.Humanoid:LoadAnimation(l_Dashes_0.Right);
                    v20 = 1.5;
                elseif l_UserInputService_0:IsKeyDown(Enum.KeyCode.W) then
                    v19 = l_Character_0.Humanoid:LoadAnimation(l_Dashes_0.Front);
                    v20 = 1.5;
                elseif l_UserInputService_0:IsKeyDown(Enum.KeyCode.S) then
                    v19 = l_Character_0.Humanoid:LoadAnimation(l_Dashes_0.Back);
                    v20 = 1.5;
                    v17 = false;
                else
                    v19 = l_Character_0.Humanoid:LoadAnimation(l_Dashes_0.Front);
                end;
            end;
            v19:Play();
            v19.Priority = Enum.AnimationPriority.Action2;
            v19:AdjustSpeed(v20);
        end;
        local v22 = Ray.new(l_Character_0.HumanoidRootPart.Position, CFrame.new(l_Character_0.HumanoidRootPart.CFrame.p).upVector * -(l_Character_0.Humanoid.HipHeight * 2));
        local v23 = _G.raycastWhitelist(v22, {
            workspace.Islands, 
            workspace.Env, 
            workspace.Ships
        });
        if v23 then
            l_Character_0.HumanoidRootPart.RollDirt.ParticleEmitter.Color = ColorSequence.new(v23.Color);
            l_Character_0.HumanoidRootPart.RollDirt.ParticleEmitter.Enabled = true;
        end;
        task.delay(0.15, function() --[[ Line: 94 ]]
            -- upvalues: l_Character_0 (copy)
            l_Character_0.HumanoidRootPart.RollDirt.ParticleEmitter.Enabled = false;
        end);
        if _G.running == true then
            v16 = 85;
        end;
        if _G.blocking == true then
            v16 = 50;
        end;
        l_Character_0.Humanoid.AutoRotate = false;
        local l_MoveDirection_0 = l_Character_0.Humanoid.MoveDirection;
        if l_MoveDirection_0 == Vector3.new(0, 0, 0, 0) then
            l_MoveDirection_0 = l_Character_0.HumanoidRootPart.CFrame.LookVector * 1;
        end;
        local _ = CFrame.new(l_Character_0.HumanoidRootPart.CFrame.p, l_MoveDirection_0 + l_Character_0.HumanoidRootPart.CFrame.p);
        _G.PlaySound(l_Character_0.PrimaryPart, script["J" .. math.random(1, 3)]).Parent = l_Character_0.PrimaryPart;
        if _G.blocking == false and v17 == true then
            l_Character_0.HumanoidRootPart.CFrame = CFrame.new(l_Character_0.HumanoidRootPart.CFrame.p, l_MoveDirection_0 + l_Character_0.HumanoidRootPart.CFrame.p);
        end;
        l_BodyVelocity_0.Velocity = _G.ScaleWithHP(CFrame.new(l_Character_0.HumanoidRootPart.CFrame.p, l_MoveDirection_0 + l_Character_0.HumanoidRootPart.CFrame.p).LookVector * v16);
        _G.destroy(l_BodyVelocity_0, _G.ScaleWithHP(0.25));
        local v26 = tick();
        local _ = l_Character_0.Humanoid.Health;
        while true do
            if _G.check:inspect(l_Character_0, true) == false then
                l_BodyVelocity_0.MaxForce = Vector3.new();
                l_BodyVelocity_0:Destroy();
                if l_Character_0:FindFirstChild("knockback", true) == nil then
                    l_Character_0.PrimaryPart.AssemblyLinearVelocity = Vector3.new();
                    break;
                else
                    warn("found regular knockback");
                    break;
                end;
            else
                if v15 then
                    local v28 = Vector3.new(0, 1, 0, 0):Cross(l_CurrentCamera_0.CFrame.RightVector);
                    l_BodyVelocity_0.Velocity = _G.ScaleWithHP(v28 * v16);
                    local l_HumanoidRootPart_0 = l_Character_0.HumanoidRootPart;
                    l_HumanoidRootPart_0.CFrame = CFrame.new(Vector3.new(0, 0, 0, 0), v28) + l_HumanoidRootPart_0.Position;
                else
                    l_BodyVelocity_0.Velocity = _G.ScaleWithHP(CFrame.new(l_Character_0.HumanoidRootPart.CFrame.p, l_MoveDirection_0 + l_Character_0.HumanoidRootPart.CFrame.p).LookVector * v16);
                end;
                game["Run Service"].Stepped:Wait();
                if tick() - v26 >= 0.2 then
                    break;
                end;
            end;
        end;
        _G.midDash = nil;
        l_Character_0.HumanoidRootPart.RollDirt.ParticleEmitter.Enabled = false;
        l_Character_0.Humanoid.AutoRotate = true;
        task.wait(1);
        return true;
    end;
end;
return v0;