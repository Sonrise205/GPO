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
        spin = false, 
        sweep = false
    };
    return v10;
end;
v8.FireworkRush = function(v11, v12) --[[ Line: 31 ]] --[[ Name: FireworkRush ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v11.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.spin == false and _G.check:inspect(l_Character_0) == true then
        local v16 = v3.GetM("Firework Rush");
        local l_cd_0 = v16.cd;
        if _G.StamCheck("Firework Rush") == false then
            return;
        elseif v16.statreq and _G.MeetReq(v16.statreq) == false then
            return;
        else
            local l_Tool_0 = v11.Tool;
            local v19 = l_Character_0.Humanoid.Animator:LoadAnimation(script.hop);
            v19:Play();
            v19:AdjustWeight(2);
            v19:AdjustSpeed(1);
            v19.Priority = Enum.AnimationPriority.Action4;
            l_Cooldowns_0.spin = true;
            _G.canuse = false;
            local v20 = game.ReplicatedStorage.Events.Skill:InvokeServer("Firework Rush");
            local l_BodyVelocity_0 = Instance.new("BodyVelocity");
            l_BodyVelocity_0.MaxForce = Vector3.new(100000, 100000, 100000, 0);
            l_BodyVelocity_0.Parent = l_Character_0.LowerTorso;
            _G.tween(l_BodyVelocity_0, {
                0.5, 
                Enum.EasingStyle.Cubic, 
                Enum.EasingDirection.In, 
                0, 
                false, 
                0
            }, {
                MaxForce = Vector3.new(100000, 100000, 100000, 0)
            });
            local v22 = tick();
            local v23 = false;
            local v24 = nil;
            do
                local l_v23_0 = v23;
                v24 = game["Run Service"].Heartbeat:Connect(function(_) --[[ Line: 66 ]]
                    -- upvalues: v22 (copy), l_v23_0 (ref), l_Character_0 (copy), l_Tool_0 (copy), v11 (copy), l_BodyVelocity_0 (copy)
                    if tick() - v22 <= 0.3 or l_v23_0 == true then
                        return;
                    else
                        if l_Character_0:FindFirstChild(script.Name) == nil then
                            task.defer(function() --[[ Line: 72 ]]
                                -- upvalues: l_Character_0 (ref), l_Tool_0 (ref)
                                l_Character_0.Humanoid:UnequipTools();
                                l_Character_0.Humanoid:EquipTool(l_Tool_0);
                            end);
                        end;
                        local l_v11_MouseCFrame_0 = v11:GetMouseCFrame();
                        local v28 = workspace.CurrentCamera:ViewportPointToRay(l_v11_MouseCFrame_0.X, l_v11_MouseCFrame_0.Y);
                        local v29 = v28.Origin + v28.Direction * 20;
                        local l_Position_0 = CFrame.new(l_Character_0.PrimaryPart.Position, v29).Position;
                        local v31 = tick() - v22;
                        local _ = 45 + 11 * v31;
                        if l_Position_0 then
                            local v33 = 45 + 11 * v31;
                            l_BodyVelocity_0.Velocity = l_Character_0.PrimaryPart.CFrame.LookVector * Vector3.new(v33, 0, v33);
                        end;
                        return;
                    end;
                end);
                task.wait(0.6);
                v19:Stop();
                v19 = l_Character_0.Humanoid.Animator:LoadAnimation(script.loop);
                v19:Play();
                v19.Priority = Enum.AnimationPriority.Action4;
                v19:AdjustWeight(2);
                local v34 = tick();
                local v35 = nil;
                local _ = false;
                local function v38(v37) --[[ Line: 105 ]] --[[ Name: hitfound ]]
                    -- upvalues: v20 (copy), l_v23_0 (ref), v35 (ref)
                    if v20 and l_v23_0 == false and v37.Parent:FindFirstChild("SeaNPC") == nil then
                        v35 = true;
                        v20:FireServer(v37.Parent.PrimaryPart);
                    end;
                    l_v23_0 = true;
                end;
                _G.hitbox:start(l_Character_0, Vector3.new(15, 10, 15, 0), 1.8, CFrame.new(0, 0, -3), v38);
                local function v39() --[[ Line: 117 ]] --[[ Name: checkFunction ]]

                end;
                local function v40() --[[ Line: 122 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_0 (copy), v34 (copy), l_v23_0 (ref)
                    if l_Character_0:FindFirstChild(script.Name) == nil or tick() - v34 >= 1.8 then
                        return true;
                    elseif l_v23_0 == true then
                        return true;
                    else
                        return;
                    end;
                end;
                v11:ChargeSkill(v12, {
                    Key = Enum.KeyCode.R, 
                    CheckFunction = v39, 
                    EndFunction = v40, 
                    IgnoreInstantCastSetting = true
                });
                l_v23_0 = true;
                v19:Stop();
                v24:Disconnect();
                v19 = l_Character_0.Humanoid.Animator:LoadAnimation(script.off);
                v19:Play();
                v19:AdjustWeight(2);
                if v35 ~= true and v20 then
                    v20:FireServer();
                end;
                _G.tween(l_BodyVelocity_0, {
                    0.25, 
                    Enum.EasingStyle.Cubic, 
                    Enum.EasingDirection.Out, 
                    0, 
                    false, 
                    0
                }, {
                    MaxForce = Vector3.new(0, 0, 0, 0)
                });
                _G.destroy(l_BodyVelocity_0, 0.25);
                l_Character_0.HumanoidRootPart.Anchored = false;
                l_Character_0.Humanoid.WalkSpeed = 16;
                _G.canuse = true;
                _G.keysetup:cooldown("Firework Rush", l_cd_0);
                _G.fw(l_cd_0);
                l_Cooldowns_0.spin = false;
            end;
        end;
    end;
end;
v8["TOTHEMOON!"] = function(v41, v42) --[[ Line: 161 ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v41.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.sweep == false and _G.check:inspect(l_Character_1) == true then
        local v46 = v3.GetM("TO THE MOON!");
        local l_cd_1 = v46.cd;
        if _G.StamCheck("TO THE MOON!") == false then
            return;
        elseif v46.statreq and _G.MeetReq(v46.statreq) == false then
            return;
        else
            local v48 = l_Character_1.Humanoid.Animator:LoadAnimation(script.stab);
            v48:Play();
            v48:AdjustWeight(2);
            l_Cooldowns_1.sweep = true;
            _G.canuse = false;
            local v49 = game.ReplicatedStorage.Events.Skill:InvokeServer("TO THE MOON!");
            _G.PauseAnim(v48, 0.35, 1);
            local v50 = tick();
            v41:ChargeSkill(v42, {
                Key = Enum.KeyCode.E, 
                CheckFunction = function() --[[ Line: 188 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_1 (copy)
                    l_Character_1.Humanoid.WalkSpeed = 4;
                    _G.canuse = false;
                end, 
                EndFunction = function() --[[ Line: 194 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_1 (copy), v41 (copy), v50 (copy), v48 (copy)
                    if _G.check:inspect(l_Character_1) == false or v41.Tool.Parent ~= l_Character_1 or tick() - v50 >= 10 then
                        v48:Stop();
                        return true;
                    else
                        return;
                    end;
                end
            });
            v48:AdjustSpeed(1);
            if v49 then
                v49:FireServer(l_Character_1.HumanoidRootPart.CFrame);
            end;
            task.wait(0.4);
            l_Character_1.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("TO THE MOON!", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1.sweep = false;
        end;
    end;
end;
return v8;