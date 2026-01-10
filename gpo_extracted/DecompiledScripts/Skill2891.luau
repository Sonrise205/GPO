local v0 = {};
local v1, _, v3, _, _ = require(game.ReplicatedStorage.Modules.ScriptSet).get();
local v6 = nil;
local v7 = {
    thrust = false, 
    crash = false
};
local _ = require(game.ReplicatedStorage.Modules.RotatedRegion3);
local v9 = require(game.ReplicatedStorage.Modules.Skills);
local v10 = nil;
v0.setup = function(_, v12, v13) --[[ Line: 11 ]] --[[ Name: setup ]]
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
    v6 = v3.InputBegan:Connect(function(v17, v18) --[[ Line: 22 ]]
        -- upvalues: v13 (copy), v12 (copy), v7 (ref), v9 (ref), v3 (ref)
        if v13.Parent ~= v12 or _G.canuse == false or v18 == true then
            return;
        elseif v17.KeyCode == Enum.KeyCode.E and v7.thrust == false and _G.check:inspect(v12) == true then
            local v19 = v9.GetM("Festival Thrust");
            local l_cd_0 = v19.cd;
            if _G.StamCheck("Festival Thrust") == false then
                return;
            elseif v19.statreq and _G.MeetReq(v19.statreq) == false then
                return;
            else
                local v21 = v12.Humanoid.Animator:LoadAnimation(script.thrust);
                v21:Play();
                v21:AdjustWeight(4);
                v21:AdjustSpeed(1);
                v7.thrust = true;
                _G.canuse = false;
                v12.Humanoid.WalkSpeed = 4;
                _G.FaceMouse = true;
                local v22 = game.ReplicatedStorage.Events.Skill:InvokeServer("Festival Thrust");
                _G.PauseAnim(v21, 0.22, 1);
                local v23 = tick();
                while true do
                    if _G.check:inspect(v12) == false then
                        v21:Stop();
                        break;
                    else
                        _G.canuse = false;
                        game["Run Service"].Heartbeat:Wait();
                        if v3:IsKeyDown(Enum.KeyCode.E) == false or v13.Parent ~= v12 or tick() - v23 >= 10 then
                            break;
                        end;
                    end;
                end;
                _G.FaceMouse = false;
                v21:AdjustSpeed(1);
                if v22 then
                    if _G.check:inspect(v12) == true then
                        v12.HumanoidRootPart.Anchored = true;
                        v12.Humanoid.AutoRotate = false;
                        local l_CFrame_0 = v12.HumanoidRootPart.CFrame;
                        local _, v26 = _G.raycast:cast(v12.HumanoidRootPart.CFrame.p, (_G.MouseCF.p - v12.HumanoidRootPart.CFrame.p).unit * 20, {
                            workspace.Islands, 
                            workspace.Ships, 
                            workspace.Env
                        });
                        local l_magnitude_0 = (l_CFrame_0.p - v26).magnitude;
                        v22:FireServer({
                            cf = l_CFrame_0 * CFrame.new(0, 0, -l_magnitude_0) * CFrame.new(0, v12.Humanoid.HipHeight * 1.25, 2)
                        });
                        task.wait(0.45);
                    else
                        v22:FireServer(nil);
                    end;
                end;
                v12.Humanoid.AutoRotate = true;
                v12.HumanoidRootPart.Anchored = false;
                v12.Humanoid.WalkSpeed = 16;
                _G.canuse = true;
                _G.keysetup:cooldown("Festival Thrust", l_cd_0);
                _G.fw(l_cd_0);
                v7.thrust = false;
                return;
            end;
        else
            if v17.KeyCode == Enum.KeyCode.R and v7.crash == false and _G.check:inspect(v12) == true then
                local v28 = v9.GetM("Festival Crash");
                local l_cd_1 = v28.cd;
                if _G.StamCheck("Festival Crash") == false then
                    return;
                elseif v28.statreq and _G.MeetReq(v28.statreq) == false then
                    return;
                else
                    local v30 = v12.Humanoid.Animator:LoadAnimation(script.windup);
                    v30:Play();
                    v30:AdjustWeight(2);
                    v30:AdjustSpeed(1);
                    v7.crash = true;
                    _G.canuse = false;
                    v12.Humanoid.WalkSpeed = 4;
                    local v31 = game.ReplicatedStorage.Events.Skill:InvokeServer("Festival Crash");
                    _G.PauseAnim(v30, 0.27, 1);
                    local v32 = tick();
                    while true do
                        if _G.check:inspect(v12) == false then
                            v30:Stop();
                            break;
                        else
                            v12.Humanoid.WalkSpeed = 4;
                            _G.canuse = false;
                            game["Run Service"].RenderStepped:Wait();
                            if v3:IsKeyDown(Enum.KeyCode.R) == false or v13.Parent ~= v12 or tick() - v32 >= 6 then
                                break;
                            end;
                        end;
                    end;
                    v30:AdjustSpeed(2);
                    local v33 = Instance.new("BodyVelocity", v12.HumanoidRootPart);
                    v33.MaxForce = Vector3.new(100000, 0, 100000, 0);
                    v33.Velocity = v12.HumanoidRootPart.CFrame.lookVector * 100;
                    _G.destroy(v33, 0.15);
                    if v31 then
                        v31:FireServer("sfx");
                    end;
                    local _ = nil;
                    local v35 = false;
                    local function v37(v36) --[[ Line: 126 ]] --[[ Name: hitfound ]]
                        -- upvalues: v33 (copy), v12 (ref), v31 (copy)
                        v33:Destroy();
                        v12.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0, 0);
                        if v31 then
                            v31:FireServer({
                                cf = v12.PrimaryPart.CFrame, 
                                Target = v36.Parent
                            });
                        end;
                    end;
                    do
                        local l_v35_0 = v35;
                        local function v39() --[[ Line: 133 ]] --[[ Name: hitinter ]]
                            -- upvalues: v33 (copy), l_v35_0 (ref), v30 (copy)
                            v33:Destroy();
                            l_v35_0 = true;
                            v30:Stop();
                        end;
                        _G.hitbox:start(v12, Vector3.new(8, 5, 12, 0), 0.3, CFrame.new(0, 0, -3), v37, v39);
                        warn("client finished");
                        v12.Humanoid.WalkSpeed = 16;
                        _G.canuse = true;
                        _G.keysetup:cooldown("Festival Crash", l_cd_1);
                        _G.fw(l_cd_1);
                        v7.crash = false;
                    end;
                end;
            end;
            return;
        end;
    end);
end;
return v0;