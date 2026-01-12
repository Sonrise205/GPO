local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v3 = require(game.ReplicatedStorage.Modules.Skills);
local v4 = require(script.Parent.Parent.MobileBase);
local l_PlayerModule_0 = require(l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule"));
local _ = l_LocalPlayer_0:GetMouse();
local _ = l_PlayerModule_0:GetControls();
local v8 = setmetatable({}, v4);
v8.__index = v8;
v8.new = function(_) --[[ Line: 20 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v8 (copy)
    local v10 = setmetatable(v4.new(script.Name), v8);
    v10.Cooldowns = {
        upper = false, 
        slam = false
    };
    return v10;
end;
v8.OverShoulderSlam = function(v11, v12) --[[ Line: 28 ]] --[[ Name: OverShoulderSlam ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v11.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.upper == false and _G.check:inspect(l_Character_0) == true then
        local v16 = v3.GetM("Over Shoulder Slam");
        local l_cd_0 = v16.cd;
        if _G.StamCheck("Over Shoulder Slam") == false then
            return;
        elseif v16.statreq and _G.MeetReq(v16.statreq) == false then
            return;
        else
            local v18 = l_Character_0.Humanoid.Animator:LoadAnimation(script.grab);
            v18:Play();
            v18:AdjustWeight(2);
            l_Cooldowns_0.upper = true;
            _G.canuse = false;
            l_Character_0.Humanoid.WalkSpeed = 8;
            local v19 = game.ReplicatedStorage.Events.Skill:InvokeServer("Over Shoulder Slam");
            _G.PauseAnim(v18, 0.3, 1);
            local v20 = tick();
            v11:ChargeSkill(v12, {
                Key = Enum.KeyCode.E, 
                CheckFunction = function() --[[ Line: 54 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_0 (copy)
                    l_Character_0.Humanoid.WalkSpeed = 8;
                end, 
                EndFunction = function() --[[ Line: 59 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_0 (copy), v20 (copy)
                    if l_Character_0:FindFirstChild(script.Name) == nil or tick() - v20 >= 10 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v18:AdjustSpeed(1);
            if v19 then
                v19:FireServer(l_Character_0.HumanoidRootPart.CFrame);
            end;
            task.wait(0.75);
            l_Character_0.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Over Shoulder Slam", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.upper = false;
        end;
    end;
end;
v8.GrandEntranceSlam = function(v21, v22) --[[ Line: 85 ]] --[[ Name: GrandEntranceSlam ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v21.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.slam == false and _G.check:inspect(l_Character_1) == true then
        local v26 = v3.GetM("Grand Entrance Slam");
        local l_cd_1 = v26.cd;
        if _G.StamCheck("Grand Entrance Slam") == false then
            return;
        elseif v26.statreq and _G.MeetReq(v26.statreq) == false then
            return;
        else
            local v28 = l_Character_1.Humanoid.Animator:LoadAnimation(script.slamStart);
            v28:Play();
            v28:AdjustWeight(2);
            l_Cooldowns_1.slam = true;
            _G.canuse = false;
            l_Character_1.Humanoid.WalkSpeed = 4;
            local v29 = game.ReplicatedStorage.Events.Skill:InvokeServer("Grand Entrance Slam");
            _G.PauseAnim(v28, 0.3, 1);
            local v30 = nil;
            local v31 = nil;
            local v32 = nil;
            local l_v21_MouseCFrame_0 = v21:GetMouseCFrame();
            local v34 = 80;
            do
                local l_v30_0, l_v31_0, l_v32_0, l_l_v21_MouseCFrame_0_0, l_v34_0 = v30, v31, v32, l_v21_MouseCFrame_0, v34;
                local function v43() --[[ Line: 114 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_1 (copy), v28 (copy), l_l_v21_MouseCFrame_0_0 (ref), v21 (copy), l_v34_0 (ref), l_v30_0 (ref), l_v31_0 (ref), l_v32_0 (ref)
                    if l_Character_1.Humanoid.SeatPart ~= nil then
                        v28:Stop();
                        return false;
                    else
                        l_l_v21_MouseCFrame_0_0 = v21:GetMouseCFrame();
                        local v40 = Ray.new(workspace.Camera.CFrame.Position, (workspace.Camera.CFrame.Position - l_l_v21_MouseCFrame_0_0.p).unit * -(l_v34_0 + 75));
                        local v41, v42 = _G.raycastWhitelist(v40, {
                            workspace.Islands, 
                            workspace.Env, 
                            workspace.Ships
                        });
                        l_v30_0 = v41;
                        l_v31_0 = v42;
                        v41, v42 = _G.getRayFloor(CFrame.new(l_v31_0), 2000);
                        l_v30_0 = v41;
                        l_v31_0 = v42;
                        v41 = l_v31_0;
                        l_v32_0 = l_Character_1.HumanoidRootPart.CFrame.p;
                        l_Character_1.Humanoid.WalkSpeed = 4;
                        return;
                    end;
                end;
                v21:ChargeSkill(v22, {
                    Key = Enum.KeyCode.R, 
                    CheckFunction = v43, 
                    EndFunction = function() --[[ Line: 132 ]] --[[ Name: endFunction ]]
                        -- upvalues: l_Character_1 (copy)
                        if l_Character_1:FindFirstChild(script.Name) == nil then
                            return true;
                        else
                            return;
                        end;
                    end
                });
                v43();
                v28:AdjustSpeed(1);
                l_v34_0 = math.clamp(l_v34_0, 0, 80);
                local v44 = false;
                local v45 = l_v31_0 + Vector3.new(0, 2, 0, 0);
                local l_p_0 = (CFrame.new(l_v31_0, l_Character_1.HumanoidRootPart.Position) * CFrame.new(0, 0, 100)).p;
                local v47 = l_Character_1.Humanoid.Animator:LoadAnimation(script.slamLoop);
                v47:Play();
                local v48 = (v45 - l_v32_0 - Vector3.new(0, -98.0999984741211, 0, 0)) / 1;
                local v49 = 0;
                local v50 = nil;
                local v51 = nil;
                local v52 = Instance.new("BoolValue", l_Character_1.HumanoidRootPart);
                v52.Name = "geppo";
                local v53 = Instance.new("BodyVelocity", l_Character_1.LowerTorso);
                v53.MaxForce = Vector3.new(1e999, 1e999, 1e999, 0);
                v53.Velocity = Vector3.new();
                if v29 then
                    v29:FireServer("jump", l_Character_1.PrimaryPart.CFrame, {
                        v45, 
                        l_v32_0, 
                        l_p_0, 
                        v52
                    });
                end;
                v50 = game["Run Service"].Heartbeat:Connect(function(v54) --[[ Line: 174 ]]
                    -- upvalues: l_Character_1 (copy), v49 (ref), v48 (copy), l_v32_0 (ref), l_p_0 (copy), v51 (ref), v50 (ref), v44 (ref)
                    l_Character_1.HumanoidRootPart.CFrame = CFrame.new(CFrame.new(Vector3.new(0, -98.0999984741211, 0, 0) * v49 * v49 + v48 * v49 + l_v32_0).p, l_p_0);
                    local v55 = v49 + v54 * 1.5;
                    local v56 = CFrame.new(Vector3.new(0, -98.0999984741211, 0, 0) * v55 * v55 + v48 * v55 + l_v32_0);
                    local v57 = Ray.new(l_Character_1.HumanoidRootPart.CFrame.p, (l_Character_1.HumanoidRootPart.CFrame.p - v56.p).unit * -(l_Character_1.HumanoidRootPart.CFrame.p - v56.p).magnitude);
                    local v58, v59 = _G.raycastWhitelist(v57, {
                        workspace.Islands, 
                        workspace.Env, 
                        workspace.Ships
                    });
                    local _ = Ray.new(l_Character_1.HumanoidRootPart.CFrame.p, (l_Character_1.HumanoidRootPart.CFrame.p - v56.p).unit * (l_Character_1.HumanoidRootPart.CFrame.p - v56.p).magnitude / 2);
                    if v58 then
                        local v61 = v59 + Vector3.new(0, l_Character_1.Humanoid.HipHeight * 1.5);
                        l_Character_1.HumanoidRootPart.CFrame = CFrame.new(v61, (Vector3.new(l_p_0.x, v61.y, l_p_0.z)));
                        v51 = l_Character_1.HumanoidRootPart.CFrame;
                        l_Character_1.HumanoidRootPart.Anchored = true;
                        v50:Disconnect();
                        v50 = nil;
                        v44 = true;
                    end;
                    v49 = v49 + v54 * 1.5;
                end);
                repeat
                    task.wait();
                until v44 == true;
                v47:Stop();
                l_Character_1.Humanoid.PlatformStand = false;
                if v29 then
                    v29:FireServer(l_Character_1.PrimaryPart.CFrame);
                end;
                v52:Destroy();
                l_Character_1.Humanoid.Animator:LoadAnimation(script.slamEnd):Play();
                task.wait(0.2);
                l_Character_1.HumanoidRootPart.Anchored = false;
                v53:Destroy();
                l_Character_1.Humanoid.WalkSpeed = 16;
                _G.canuse = true;
                _G.keysetup:cooldown("Grand Entrance Slam", l_cd_1);
                _G.fw(l_cd_1);
                l_Cooldowns_1.slam = false;
            end;
        end;
    end;
end;
return v8;