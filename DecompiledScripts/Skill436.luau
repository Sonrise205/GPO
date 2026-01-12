local v0 = {};
local _, _, v3, _, _ = require(game.ReplicatedStorage.Modules.ScriptSet).get();
local v6 = nil;
local v7 = {
    Slash = false, 
    Rapid = false, 
    Jump = false
};
v0.setup = function(_, v9, v10) --[[ Line: 8 ]] --[[ Name: setup ]]
    -- upvalues: v6 (ref), v3 (copy), v7 (copy)
    if v6 then
        v6:Disconnect();
    end;
    v6 = v3.InputBegan:Connect(function(v11, v12) --[[ Line: 12 ]]
        -- upvalues: v10 (copy), v9 (copy), v7 (ref), v3 (ref)
        if v10.Parent ~= v9 or _G.canuse == false or v12 == true then
            return;
        elseif v11.KeyCode == Enum.KeyCode.E and v7.Slash == false and _G.check:inspect(v9) == true then
            local v13 = v9.Humanoid.Animator:LoadAnimation(script.slash);
            v13:Play();
            v13:AdjustWeight(2);
            v7.Slash = true;
            _G.canuse = false;
            _G.PauseAnim(v13, 0.2, 1);
            while true do
                game["Run Service"].RenderStepped:Wait();
                if _G.check:inspect(v9) == false then
                    v13:Stop();
                    break;
                else
                    v9.Humanoid.WalkSpeed = 4;
                    if v3:IsKeyDown(Enum.KeyCode.E) == false then
                        break;
                    end;
                end;
            end;
            v9.HumanoidRootPart.Anchored = true;
            v13:AdjustSpeed(1);
            v9.Humanoid.WalkSpeed = 0;
            task.wait(0.75);
            game.ReplicatedStorage.Events.Skill:InvokeServer("Yoru Slash");
            task.wait(0.25);
            v9.HumanoidRootPart.Anchored = false;
            v9.Humanoid.WalkSpeed = 16;
            v7.Slash = false;
            _G.canuse = true;
            return;
        elseif v11.KeyCode == Enum.KeyCode.R and v7.Rapid == false and _G.check:inspect(v9) == true then
            local v14 = v9.Humanoid.Animator:LoadAnimation(script.rapid);
            v14:Play();
            v14:AdjustSpeed(2);
            v7.Rapid = true;
            _G.canuse = false;
            local v15 = game.ReplicatedStorage.Events.Skill:InvokeServer("Thousand Slashes");
            while true do
                game["Run Service"].RenderStepped:Wait();
                if _G.check:inspect(v9) == false then
                    v14:Stop();
                    break;
                else
                    v9.Humanoid.WalkSpeed = 4;
                    if v3:IsKeyDown(Enum.KeyCode.R) == false then
                        break;
                    end;
                end;
            end;
            if v15 then
                v15:InvokeServer();
            end;
            v14:Stop();
            v9.Humanoid.WalkSpeed = 16;
            v7.Rapid = false;
            _G.canuse = true;
            return;
        else
            if v11.KeyCode == Enum.KeyCode.Z and v7.Jump == false and _G.check:inspect(v9) == true then
                local v16 = v9.Humanoid.Animator:LoadAnimation(script.jump);
                v16:Play();
                v16:AdjustWeight(5);
                v16:AdjustSpeed(0);
                _G.PauseAnim(v16, 0.2, 1);
                v7.Jump = true;
                _G.canuse = false;
                while true do
                    game["Run Service"].RenderStepped:Wait();
                    if _G.check:inspect(v9) == false then
                        v16:Stop();
                        break;
                    else
                        v9.Humanoid.WalkSpeed = 4;
                        if v3:IsKeyDown(Enum.KeyCode.Z) == false then
                            break;
                        end;
                    end;
                end;
                v16:AdjustSpeed(1);
                task.wait(0.3);
                local v17 = Instance.new("BodyVelocity", v9.HumanoidRootPart);
                v17.Name = "geppo";
                v17.MaxForce = Vector3.new(1000000000, 1.0000000272564224E16, 1000000000, 0);
                v17.Velocity = v9.HumanoidRootPart.CFrame.upVector * 100;
                v17.P = 4324234234;
                _G.destroy(v17, 0.25);
                task.wait(0.7);
                local l_Position_0 = v9.HumanoidRootPart.Position;
                local v19 = Ray.new(l_Position_0, CFrame.new(l_Position_0).upVector * -500);
                local v20, v21 = _G.raycastIgnoreList(v19, {
                    workspace.Effects, 
                    workspace.PlayerCharacters, 
                    workspace.Projectiles, 
                    workspace.CurrentCamera, 
                    workspace.Projectiles, 
                    workspace.NPCs
                });
                v9.HumanoidRootPart.Anchored = true;
                if v20 then
                    local l_magnitude_0 = (l_Position_0 - v21).magnitude;
                    local v23 = v9.HumanoidRootPart.CFrame * CFrame.new(0, -l_magnitude_0, 0) * CFrame.new(0, v9.Humanoid.HipHeight * 1.25, 0);
                    v9.HumanoidRootPart.CFrame = v23;
                else
                    v16:Stop();
                end;
                v9.Humanoid.WalkSpeed = 16;
                v9.HumanoidRootPart.Anchored = false;
                v7.Jump = false;
                _G.canuse = true;
            end;
            return;
        end;
    end);
end;
return v0;