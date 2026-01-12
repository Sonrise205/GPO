local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v3 = require(game.ReplicatedStorage.Modules.Skills);
local v4 = require(script.Parent.Parent.MobileBase);
local l_PlayerModule_0 = require(l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule"));
local _ = l_LocalPlayer_0:GetMouse();
local _ = l_PlayerModule_0:GetControls();
local v8 = require(game.ReplicatedStorage.Modules.SwordHandle.SwordInfo);
local v9 = setmetatable({}, v4);
v9.__index = v9;
v9.new = function(_) --[[ Line: 21 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v9 (copy), l_LocalPlayer_0 (copy), v8 (copy)
    local v11 = setmetatable(v4.new(script.Name), v9);
    local _ = game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
    v11.getTools = function() --[[ Line: 26 ]]
        -- upvalues: l_LocalPlayer_0 (ref)
        local v13 = nil;
        local l_Children_0 = l_LocalPlayer_0.Backpack:GetChildren();
        for v15 = 1, #l_Children_0 do
            if l_Children_0[v15]:IsA("Tool") and l_Children_0[v15]:FindFirstChild("SwordEquip") and l_Children_0[v15].Name ~= "2SS" then
                return l_Children_0[v15].Name;
            end;
        end;
        return v13;
    end;
    local v16 = {};
    local v17 = v8[script.Name];
    v17 = if v17 == nil then v8.Katana.keys else v17.keys;
    for v18 = 1, #v17 do
        v16[v17[v18][1]] = false;
    end;
    v11.Cooldowns = v16;
    return v11;
end;
v9.RashomonDraw = function(v19, v20) --[[ Line: 70 ]] --[[ Name: RashomonDraw ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v19.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0["Rashomon Draw"] == false and _G.check:inspect(l_Character_0) == true then
        local v24 = v3.GetM("Rashomon Draw");
        local l_cd_0 = v24.cd;
        if _G.StamCheck("Rashomon Draw") == false then
            return;
        elseif v24.statreq and _G.MeetReq(v24.statreq) == false then
            return;
        else
            local v26 = l_Character_0.Humanoid.Animator:LoadAnimation(script.rash);
            v26:Play();
            v26:AdjustWeight(2);
            l_Cooldowns_0["Rashomon Draw"] = true;
            _G.FaceMouse = true;
            _G.canuse = false;
            _G.PauseAnim(v26, 1.2, 1);
            local v27 = tick();
            v19:ChargeSkill(v20, {
                Key = Enum.KeyCode.C, 
                CheckFunction = function() --[[ Line: 96 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_0 (copy), v26 (copy)
                    if _G.check:inspect(l_Character_0) == false then
                        v26:Stop();
                        return true;
                    else
                        return;
                    end;
                end, 
                EndFunction = function() --[[ Line: 103 ]] --[[ Name: endFunction ]]
                    -- upvalues: v19 (copy), l_Character_0 (copy), v27 (copy)
                    if v19.Tool and v19.Tool.Parent ~= l_Character_0 or tick() - v27 >= 10 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            _G.FaceMouse = false;
            l_Character_0.HumanoidRootPart.Anchored = true;
            v26:AdjustSpeed(1);
            local v28 = Ray.new(l_Character_0.HumanoidRootPart.CFrame.p, (v19:GetMouseCFrame().p - l_Character_0.HumanoidRootPart.CFrame.p).unit * 125);
            local _, v30 = _G.raycastWhitelist(v28, {
                workspace.Islands, 
                workspace.Ships, 
                workspace.Env
            });
            local l_CFrame_0 = l_Character_0.HumanoidRootPart.CFrame;
            local v32 = CFrame.new(v30, l_CFrame_0.p) * CFrame.Angles(0, 3.141592653589793, 0) * CFrame.new(0, l_Character_0.Humanoid.HipHeight * 1.25, 2);
            if _G.check:inspect(l_Character_0) == true then
                _G.tween(l_Character_0.HumanoidRootPart, {
                    0.2, 
                    "Sharp", 
                    Enum.EasingDirection.Out, 
                    0, 
                    false, 
                    0
                }, {
                    CFrame = v32
                });
            end;
            local v33 = {
                cf = v32, 
                old = l_CFrame_0
            };
            l_Character_0.Humanoid.AutoRotate = false;
            game.ReplicatedStorage.Events.Skill:InvokeServer("Rashomon Draw", v33);
            task.wait(0.9);
            l_Character_0.Humanoid.AutoRotate = true;
            l_Character_0.HumanoidRootPart.Anchored = false;
            l_Character_0.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Rashomon Draw", l_cd_0);
            require(script.Parent.SwordStyleSwapping):matchCooldowns(l_Cooldowns_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0["Rashomon Draw"] = false;
        end;
    end;
end;
v9["72CaliberPhoenix"] = function(v34, v35) --[[ Line: 143 ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v34.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1["72 Caliber Phoenix"] == false and _G.check:inspect(l_Character_1) == true then
        local v39 = v3.GetM("72 Caliber Phoenix");
        local l_cd_1 = v39.cd;
        if _G.StamCheck("72 Caliber Phoenix") == false then
            return;
        elseif v39.statreq and _G.MeetReq(v39.statreq) == false then
            return;
        else
            local v41 = l_Character_1.Humanoid.Animator:LoadAnimation(script.pound);
            v41:Play();
            v41:AdjustWeight(2);
            l_Cooldowns_1["72 Caliber Phoenix"] = true;
            _G.FaceMouse = true;
            _G.canuse = false;
            _G.PauseAnim(v41, 0.35, 1);
            local v42 = tick();
            v34:ChargeSkill(v35, {
                Key = Enum.KeyCode.E, 
                CheckFunction = function() --[[ Line: 170 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_1 (copy), v41 (copy)
                    if _G.check:inspect(l_Character_1) == false then
                        v41:Stop();
                        return true;
                    else
                        return;
                    end;
                end, 
                EndFunction = function() --[[ Line: 177 ]] --[[ Name: endFunction ]]
                    -- upvalues: v34 (copy), l_Character_1 (copy), v42 (copy)
                    if v34.Tool and v34.Tool.Parent ~= l_Character_1 or tick() - v42 >= 10 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            _G.FaceMouse = false;
            l_Character_1.HumanoidRootPart.Anchored = true;
            v41:AdjustSpeed(1.5);
            task.wait(0.1);
            game.ReplicatedStorage.Events.Skill:InvokeServer("72 Caliber Phoenix", {
                cf = l_Character_1.HumanoidRootPart.CFrame
            });
            task.wait(0.8);
            l_Character_1.Humanoid.AutoRotate = true;
            l_Character_1.HumanoidRootPart.Anchored = false;
            l_Character_1.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("72 Caliber Phoenix", l_cd_1);
            require(script.Parent.SwordStyleSwapping):matchCooldowns(l_Cooldowns_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1["72 Caliber Phoenix"] = false;
        end;
    end;
end;
v9.RagingWhirl = function(v43, v44) --[[ Line: 208 ]] --[[ Name: RagingWhirl ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_2 = v43.Cooldowns;
    local l_Character_2 = l_LocalPlayer_0.Character;
    local v47 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_2["Raging Whirl"] == false and _G.check:inspect(l_Character_2) == true then
        local v48 = v3.GetM("Raging Whirl");
        local l_cd_2 = v48.cd;
        if _G.StamCheck("Raging Whirl") == false then
            return;
        elseif v48.statreq and _G.MeetReq(v48.statreq) == false then
            return;
        else
            local v50 = l_Character_2.Humanoid.Animator:LoadAnimation(script.spin);
            v50:Play();
            v50:AdjustWeight(2);
            v50:AdjustSpeed(4);
            l_Cooldowns_2["Raging Whirl"] = true;
            _G.canuse = false;
            local v51 = game.ReplicatedStorage.Events.Skill:InvokeServer("Raging Whirl");
            local v52 = Instance.new("BodyVelocity", l_Character_2.HumanoidRootPart);
            v52.MaxForce = Vector3.new(1000000, 10000, 1000000, 0);
            v52.Name = "geppo";
            local v53 = tick();
            local function _(v54, v55, v56) --[[ Line: 237 ]] --[[ Name: Lerp ]]
                v56 = math.clamp(v56, 0, 1);
                return v54 + (v55 - v54) * v56;
            end;
            v43:ChargeSkill(v44, {
                Key = Enum.KeyCode.R, 
                CheckFunction = function() --[[ Line: 242 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_2 (copy), v50 (copy), v52 (copy), v53 (copy)
                    if _G.check:inspect(l_Character_2) == false then
                        v50:Stop();
                        return true;
                    else
                        if l_Character_2.HumanoidRootPart:FindFirstChild("comboBV") and v52 then
                            v52:Destroy();
                        end;
                        if v52 then
                            v52.Velocity = l_Character_2.HumanoidRootPart.CFrame.lookVector * (125 + -95 * math.clamp((tick() - v53) / 0.5, 0, 1));
                        end;
                        v50:AdjustSpeed(4 + -3 * math.clamp((tick() - v53) / 0.5, 0, 1));
                        return;
                    end;
                end, 
                EndFunction = function() --[[ Line: 256 ]] --[[ Name: endFunction ]]
                    -- upvalues: v43 (copy), l_Character_2 (copy), v53 (copy), v47 (copy)
                    if v43.Tool and v43.Tool.Parent ~= l_Character_2 or tick() - v53 >= 2 or v47.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end, 
                IgnoreInstantCastSetting = true
            });
            v50:Stop();
            if v52 then
                v52:Destroy();
            end;
            if v51 then
                v51:FireServer();
            end;
            l_Character_2.HumanoidRootPart.Anchored = false;
            l_Character_2.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Raging Whirl", l_cd_2);
            require(script.Parent.SwordStyleSwapping):matchCooldowns(l_Cooldowns_2);
            _G.fw(l_cd_2);
            l_Cooldowns_2["Raging Whirl"] = false;
        end;
    end;
end;
v9.TowerClimb = function(v58, _) --[[ Line: 287 ]] --[[ Name: TowerClimb ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_3 = v58.Cooldowns;
    local l_Character_3 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_3["Tower Climb"] == false and _G.check:inspect(l_Character_3) == true then
        local v63 = v3.GetM("Tower Climb");
        local l_cd_3 = v63.cd;
        if _G.StamCheck("Tower Climb") == false then
            return;
        elseif v63.statreq and _G.MeetReq(v63.statreq) == false then
            return;
        else
            local v65 = l_Character_3.Humanoid.Animator:LoadAnimation(script.counter);
            v65:Play();
            v65:AdjustWeight(2);
            l_Cooldowns_3["Tower Climb"] = true;
            _G.canuse = false;
            local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Tower Climb");
            task.wait(0.5);
            _G.canuse = true;
            _G.keysetup:cooldown("Tower Climb", l_cd_3);
            require(script.Parent.SwordStyleSwapping):matchCooldowns(l_Cooldowns_3);
            _G.fw(l_cd_3);
            l_Cooldowns_3["Tower Climb"] = false;
        end;
    end;
end;
v9.NitoryuStrike = function(v67, v68) --[[ Line: 323 ]] --[[ Name: NitoryuStrike ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_4 = v67.Cooldowns;
    local l_Character_4 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_4["Nitoryu Strike"] == false and _G.check:inspect(l_Character_4) == true then
        local v72 = v3.GetM("Nitoryu Strike");
        local l_cd_4 = v72.cd;
        if _G.StamCheck("Nitoryu Strike") == false then
            return;
        elseif v72.statreq and _G.MeetReq(v72.statreq) == false then
            return;
        else
            local v74 = l_Character_4.Humanoid.Animator:LoadAnimation(script.anim);
            v74:Play();
            v74:AdjustWeight(2);
            l_Cooldowns_4["Nitoryu Strike"] = true;
            _G.FaceMouse = true;
            _G.canuse = false;
            _G.PauseAnim(v74, 0.6, 1.3);
            local v75 = script.aim:Clone();
            v75.Parent = workspace.Effects;
            v75.Attachment2.Position = Vector3.new();
            _G.tween(v75.Attachment2, {
                0.25, 
                "Quad", 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                Position = script.aim.Attachment2.Position
            });
            local v76 = game.ReplicatedStorage.Events.Skill:InvokeServer("Nitoryu Strike");
            local v77 = tick();
            v67:ChargeSkill(v68, {
                Key = Enum.KeyCode.X, 
                CheckFunction = function() --[[ Line: 359 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_4 (copy), v75 (copy), v77 (copy)
                    if _G.check:inspect(l_Character_4) == false then
                        return true;
                    else
                        v75.CFrame = l_Character_4.HumanoidRootPart.CFrame * CFrame.new(0, -l_Character_4.Humanoid.HipHeight * 1.45, -25) * CFrame.Angles(3.141592653589793, 0, 0);
                        if tick() - v77 > 0.25 then
                            v75.Attachment2.Position = v75.Attachment2.Position + Vector3.new(0, 0, 0.1 * (60 / _G.FPS));
                        end;
                        return;
                    end;
                end, 
                EndFunction = function() --[[ Line: 369 ]] --[[ Name: endFunction ]]
                    -- upvalues: v67 (copy), l_Character_4 (copy), v77 (copy)
                    if (v67.Tool and v67.Tool.Parent ~= l_Character_4 or tick() - v77 >= 10) and tick() - v77 >= 0.25 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            _G.FaceMouse = false;
            if v76 then
                l_Character_4.HumanoidRootPart.Anchored = true;
                l_Character_4.Humanoid.AutoRotate = false;
            end;
            _G.tween(v75.Beam, {
                0.25, 
                "Quad", 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                Transparency = NumberSequence.new(1)
            });
            _G.destroy(v75, 0.25);
            local l_CFrame_1 = l_Character_4.HumanoidRootPart.CFrame;
            local v79 = v75.Attachment2.Position.Z * 2;
            local v80 = Ray.new(l_Character_4.HumanoidRootPart.CFrame.p, l_Character_4.HumanoidRootPart.CFrame.lookVector * v79);
            local _, v82 = _G.raycastWhitelist(v80, {
                workspace.Islands, 
                workspace.Ships, 
                workspace.Env
            });
            v79 = (l_CFrame_1.p - v82).magnitude;
            local v83 = CFrame.new(v82, l_CFrame_1.p) * CFrame.Angles(0, 3.141592653589793, 0) * CFrame.new(0, 0, 2);
            if v76 then
                v76:FireServer(v83, l_CFrame_1);
            end;
            task.wait(0.2);
            v74:Stop();
            l_CFrame_1 = v83;
            task.wait(1.5);
            l_Character_4.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Nitoryu Strike", l_cd_4);
            require(script.Parent.SwordStyleSwapping):matchCooldowns(l_Cooldowns_4);
            _G.fw(l_cd_4);
            l_Cooldowns_4["Nitoryu Strike"] = false;
        end;
    end;
end;
v9.SwordStyleSwap = function(v84, _) --[[ Line: 417 ]] --[[ Name: SwordStyleSwap ]]
    require(script.Parent.SwordStyleSwapping):swap(v84);
end;
return v9;