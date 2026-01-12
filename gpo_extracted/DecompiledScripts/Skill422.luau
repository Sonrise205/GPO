local v0 = {};
local v1, _, v3, _, _ = require(game.ReplicatedStorage.Modules.ScriptSet).get();
local v6 = nil;
local v7 = {
    lunge = false, 
    nado = false
};
local _ = require(game.ReplicatedStorage.Modules.RotatedRegion3);
local v9 = require(game.ReplicatedStorage.Modules.Skills);
local v10 = nil;
v0.setup = function(_, v12, v13) --[[ Line: 12 ]] --[[ Name: setup ]]
    -- upvalues: v6 (ref), v10 (ref), v7 (copy), v1 (copy), v3 (copy), v9 (copy)
    if v6 then
        v6:Disconnect();
    end;
    if v10 ~= v12 then
        for v14, _ in v7 do
            v7[v14] = false;
        end;
    end;
    v10 = v12;
    local _ = game.ReplicatedStorage:FindFirstChild("Stats" .. v1.Name);
    v6 = v3.InputBegan:Connect(function(v17, v18) --[[ Line: 23 ]]
        -- upvalues: v13 (copy), v12 (copy), v7 (ref), v9 (ref)
        if v13.Parent ~= v12 or _G.canuse == false or v18 == true then
            return;
        elseif v17.KeyCode == Enum.KeyCode.E and v7.lunge == false and _G.check:inspect(v12) == true then
            local v19 = v9.GetM("Cutlass Lunge");
            local l_cd_0 = v19.cd;
            if _G.StamCheck("Cutlass Lunge") == false then
                return;
            elseif v19.statreq and _G.MeetReq(v19.statreq) == false then
                return;
            else
                local v21 = v12.Humanoid.Animator:LoadAnimation(script.lunge);
                v21:Play();
                v21:AdjustWeight(2);
                v7.lunge = true;
                _G.canuse = false;
                _G.FaceMouse = true;
                local v22 = game.ReplicatedStorage.Events.Skill:InvokeServer("Cutlass Lunge");
                _G.PauseAnim(v21, 0.47, 0.75);
                local v23 = tick();
                local function v24() --[[ Line: 48 ]] --[[ Name: checkFunction ]]
                    -- upvalues: v12 (ref), v21 (copy)
                    if _G.check:inspect(v12) == false then
                        v21:Stop();
                        return true;
                    else
                        return;
                    end;
                end;
                local function v25() --[[ Line: 55 ]] --[[ Name: endFunction ]]
                    -- upvalues: v13 (ref), v12 (ref), v23 (copy)
                    if v13.Parent ~= v12 or tick() - v23 >= 10 then
                        return true;
                    else
                        return;
                    end;
                end;
                _G.holdSkill(Enum.KeyCode.E, v24, v25);
                _G.FaceMouse = false;
                v21:AdjustSpeed(1);
                if v22 then
                    if _G.check:inspect(v12) == true then
                        v12.HumanoidRootPart.Anchored = true;
                        v12.Humanoid.AutoRotate = false;
                        local l_CFrame_0 = v12.HumanoidRootPart.CFrame;
                        local _, v28 = _G.raycast:cast(v12.HumanoidRootPart.CFrame.p, l_CFrame_0.lookVector * 30, {
                            workspace.Islands, 
                            workspace.Ships, 
                            workspace.Env
                        });
                        local l_magnitude_0 = (l_CFrame_0.p - v28).magnitude;
                        local v30 = l_CFrame_0 * CFrame.new(0, 0, -l_magnitude_0) * CFrame.new(0, v12.Humanoid.HipHeight * 1.25, 2);
                        local v31 = script.Part:Clone();
                        v31.Parent = workspace.Effects;
                        v31.CFrame = v12.HumanoidRootPart.CFrame * CFrame.new(0, 0, -8);
                        _G.tween(v12.HumanoidRootPart, {
                            0.3, 
                            "Cubic", 
                            Enum.EasingDirection.Out
                        }, {
                            CFrame = v30
                        });
                        _G.tween(v31, {
                            0.3, 
                            "Cubic", 
                            Enum.EasingDirection.Out
                        }, {
                            CFrame = v30 * CFrame.new(0, 0, -8)
                        });
                        _G.PlayEffect("FloorTrail", nil, v31, 0.3, Color3.fromRGB(213, 104, 14), Color3.fromRGB(0, 0, 0), 0.3, 0.25, 15);
                        _G.destroy(v31, 0.3);
                        v22:FireServer({
                            cf = v30
                        });
                        task.wait(0.7);
                    else
                        v22:FireServer(nil);
                    end;
                end;
                v12.Humanoid.AutoRotate = true;
                v12.HumanoidRootPart.Anchored = false;
                v12.Humanoid.WalkSpeed = 16;
                _G.canuse = true;
                _G.keysetup:cooldown("Cutlass Lunge", l_cd_0);
                _G.fw(l_cd_0);
                v7.lunge = false;
                return;
            end;
        else
            if v17.KeyCode == Enum.KeyCode.R and v7.nado == false and _G.check:inspect(v12) == true then
                local v32 = v9.GetM("Cutlass Ladder");
                local l_cd_1 = v32.cd;
                if _G.StamCheck("Cutlass Ladder") == false then
                    return;
                elseif v32.statreq and _G.MeetReq(v32.statreq) == false then
                    return;
                else
                    local v34 = v12.Humanoid.Animator:LoadAnimation(script.ladder);
                    v34:Play();
                    v34:AdjustWeight(2);
                    v7.nado = true;
                    _G.canuse = false;
                    v12.Humanoid.WalkSpeed = 4;
                    local v35 = game.ReplicatedStorage.Events.Skill:InvokeServer("Cutlass Ladder");
                    _G.PauseAnim(v34, 0.39, 1.2);
                    local v36 = tick();
                    local function v37() --[[ Line: 119 ]] --[[ Name: checkFunction ]]
                        -- upvalues: v12 (ref), v34 (copy)
                        if _G.check:inspect(v12) == false then
                            v34:Stop();
                            return true;
                        else
                            v12.Humanoid.WalkSpeed = 4;
                            return;
                        end;
                    end;
                    local function v38() --[[ Line: 128 ]] --[[ Name: endFunction ]]
                        -- upvalues: v13 (ref), v12 (ref), v36 (copy)
                        if v13.Parent ~= v12 or tick() - v36 >= 10 then
                            return true;
                        else
                            return;
                        end;
                    end;
                    _G.holdSkill(Enum.KeyCode.R, v37, v38);
                    v34:AdjustSpeed(1);
                    task.wait(0.13);
                    local v39 = Instance.new("BodyVelocity", v12.HumanoidRootPart);
                    v39.MaxForce = Vector3.new(0, 10000000, 0, 0);
                    v39.Velocity = v12.HumanoidRootPart.CFrame.upVector * 50;
                    _G.destroy(v39, 0.2);
                    if v35 and _G.check:inspect(v12) == true then
                        v35:FireServer(v12.HumanoidRootPart.CFrame);
                    elseif v35 then
                        v35:FireServer();
                    end;
                    task.wait(0.2);
                    v12.Humanoid.WalkSpeed = 16;
                    _G.canuse = true;
                    _G.keysetup:cooldown("Cutlass Ladder", l_cd_1);
                    _G.fw(l_cd_1);
                    v7.nado = false;
                end;
            end;
            return;
        end;
    end);
    return weaponCallbacks;
end;
return v0;