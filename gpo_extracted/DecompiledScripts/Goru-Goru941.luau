local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v3 = require(game.ReplicatedStorage.Modules.Skills);
local v4 = require(script.Parent.Parent.MobileBase);
local _ = require(l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule"));
local _ = game:GetService("UserInputService");
local _ = l_LocalPlayer_0:GetMouse();
local v8 = setmetatable({}, v4);
v8.__index = v8;
v8.new = function(_) --[[ Line: 21 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v8 (copy)
    local v10 = setmetatable(v4.new(script.Name), v8);
    v10.Cooldowns = {
        goldenFist = false, 
        path = false, 
        touch = false, 
        field = false, 
        age = false, 
        Judgement = false
    };
    return v10;
end;
v8.GoldenFist = function(v11, v12) --[[ Line: 28 ]] --[[ Name: GoldenFist ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v11.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local v15 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.goldenFist == false and _G.check:inspect(l_Character_0) == true and _G.StamCheck("Golden Fist") == true then
        local v16 = v3.GetM("Golden Fist");
        local l_cd_0 = v16.cd;
        if _G.StamCheck("Golden Fist") == false then
            return;
        elseif v16.statreq and _G.MeetReq(v16.statreq) == false then
            return;
        else
            _G.canuse = false;
            l_Cooldowns_0.goldenFist = true;
            _G.FaceMouse = true;
            local v18 = game.ReplicatedStorage.Events.Skill:InvokeServer("Golden Fist");
            local v19 = tick();
            v11:ChargeSkill(v12, {
                Key = Enum.KeyCode.E, 
                EndFunction = function() --[[ Line: 53 ]] --[[ Name: endFunction ]]
                    -- upvalues: v19 (copy), v11 (copy), l_Character_0 (copy), v15 (copy)
                    if tick() - v19 >= 4 or v11.Tool.Parent ~= l_Character_0 or l_Character_0.Parent == nil or l_Character_0.Parent ~= workspace.PlayerCharacters or v15.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end, 
                HoldDuration = 0.6400000000000001
            });
            l_Character_0.HumanoidRootPart.Anchored = true;
            _G.FaceMouse = false;
            task.wait();
            l_Character_0.Humanoid.AutoRotate = false;
            if v18 then
                v18:FireServer(l_Character_0.HumanoidRootPart.CFrame);
            end;
            task.wait(1);
            l_Character_0.Humanoid.AutoRotate = true;
            l_Character_0.HumanoidRootPart.Anchored = false;
            _G.canuse = true;
            _G.keysetup:cooldown("Golden Fist", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.goldenFist = false;
        end;
    end;
end;
v8.GoldenPath = function(v20, v21) --[[ Line: 84 ]] --[[ Name: GoldenPath ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v20.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local l_l_ReplicatedStorage_0_FirstChild_0 = l_ReplicatedStorage_0:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
    if _G.grounded == false and l_Cooldowns_1.path == false and _G.check:inspect(l_Character_1) == true and _G.StamCheck("Golden Path") == true then
        local v25 = v3.GetM("Golden Path");
        local l_cd_1 = v25.cd;
        if _G.StamCheck("Golden Path") == false then
            return;
        elseif v25.statreq and _G.MeetReq(v25.statreq) == false then
            return;
        else
            l_Cooldowns_1.path = true;
            _G.canuse = false;
            local v27 = l_Character_1.Humanoid:LoadAnimation(script.pathSlide);
            v27:Play();
            v27:AdjustSpeed(0);
            local v28 = game.ReplicatedStorage.Events.Skill:InvokeServer("Golden Path", {
                cf = l_Character_1.HumanoidRootPart.CFrame
            });
            local _ = tick();
            local v30 = Instance.new("BodyVelocity", l_Character_1.LowerTorso);
            v30.MaxForce = Vector3.new(100000, 0, 100000, 0);
            local _ = tick();
            local v32 = 0;
            do
                local l_v32_0 = v32;
                local function v35(v34) --[[ Line: 117 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_1 (copy), l_v32_0 (ref), v27 (copy), v30 (copy), l_l_ReplicatedStorage_0_FirstChild_0 (copy)
                    if l_Character_1.Humanoid.FloorMaterial ~= Enum.Material.Air then
                        l_v32_0 = l_v32_0 + v34 * 50;
                    else
                        l_v32_0 = l_v32_0 - v34 * 10;
                    end;
                    l_v32_0 = math.clamp(l_v32_0, 0, 75 * (l_Character_1.Humanoid.Health / l_Character_1.Humanoid.MaxHealth));
                    v27:AdjustSpeed(l_v32_0 / 75);
                    v30.Velocity = l_Character_1.HumanoidRootPart.CFrame.lookVector * l_v32_0;
                    if l_Character_1:FindFirstChild("Stun") then
                        return true;
                    elseif l_l_ReplicatedStorage_0_FirstChild_0.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end;
                v20:ChargeSkill(v21, {
                    Button = v21, 
                    Key = Enum.KeyCode.T, 
                    MobileInputType = "Toggle", 
                    EndFunction = v35
                });
                v30:Destroy();
                v27:Stop();
                _G.canuse = true;
                if v28 then
                    v28:FireServer();
                end;
                _G.keysetup:cooldown("Golden Path", l_cd_1);
                _G.fw(l_cd_1);
                l_Cooldowns_1.path = false;
            end;
        end;
    end;
end;
v8.GoldenTouch = function(v36, v37) --[[ Line: 159 ]] --[[ Name: GoldenTouch ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_2 = v36.Cooldowns;
    local l_Character_2 = l_LocalPlayer_0.Character;
    local v40 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_2.touch == false and _G.check:inspect(l_Character_2) == true and _G.StamCheck("Golden Touch") == true then
        local v41 = v3.GetM("Golden Touch");
        local l_cd_2 = v41.cd;
        if _G.StamCheck("Golden Touch") == false then
            return;
        elseif v41.statreq and _G.MeetReq(v41.statreq) == false then
            return;
        else
            _G.canuse = false;
            l_Cooldowns_2.touch = true;
            local v43 = l_Character_2.Humanoid:LoadAnimation(script.touchHold);
            v43:Play();
            v43:AdjustSpeed(0);
            local v44 = tick();
            v36:ChargeSkill(v37, {
                Key = Enum.KeyCode.R, 
                EndFunction = function() --[[ Line: 185 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_2 (copy), v44 (copy), v36 (copy), v40 (copy), v43 (copy)
                    l_Character_2.Humanoid.WalkSpeed = 4;
                    if tick() - v44 >= 4 or _G.check:inspect(l_Character_2) == false or v36.Tool.Parent ~= l_Character_2 or l_Character_2.Parent == nil or l_Character_2.Parent ~= workspace.PlayerCharacters or v40.Stamina.Value <= 0 then
                        if _G.check:inspect(l_Character_2) == false then
                            v43:Stop();
                        end;
                        return true;
                    else
                        return;
                    end;
                end
            });
            v43:AdjustSpeed(1);
            game.ReplicatedStorage.Events.Skill:InvokeServer("Golden Touch", {
                cf = l_Character_2.PrimaryPart.CFrame
            });
            task.wait(0.25);
            l_Character_2.Humanoid.WalkSpeed = 16;
            l_Character_2.HumanoidRootPart.Anchored = false;
            _G.canuse = true;
            _G.keysetup:cooldown("Golden Touch", l_cd_2);
            _G.fw(l_cd_2);
            l_Cooldowns_2.touch = false;
        end;
    end;
end;
v8.GoldenField = function(v45, v46) --[[ Line: 214 ]] --[[ Name: GoldenField ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_3 = v45.Cooldowns;
    local l_Character_3 = l_LocalPlayer_0.Character;
    local v49 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_3.field == false and _G.check:inspect(l_Character_3) == true and _G.StamCheck("Golden Field") == true then
        local v50 = v3.GetM("Golden Field");
        local l_cd_3 = v50.cd;
        if _G.StamCheck("Golden Field") == false then
            return;
        elseif v50.statreq and _G.MeetReq(v50.statreq) == false then
            return;
        else
            _G.canuse = false;
            l_Cooldowns_3.field = true;
            local v52 = l_Character_3.Humanoid:LoadAnimation(script.fieldCast);
            v52:Play();
            v52:AdjustSpeed(0);
            l_Character_3.Humanoid.WalkSpeed = 4;
            local v53 = game.ReplicatedStorage.Events.Skill:InvokeServer("Golden Field");
            _G.PauseAnim(v52, 0.4, 1);
            local v54 = tick();
            v45:ChargeSkill(v46, {
                Key = Enum.KeyCode.Z, 
                EndFunction = function() --[[ Line: 244 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_3 (copy), v54 (copy), v45 (copy), v53 (copy), v49 (copy), v52 (copy)
                    l_Character_3.Humanoid.WalkSpeed = 4;
                    if tick() - v54 >= 4 or _G.check:inspect(l_Character_3) == false or v45.Tool.Parent ~= l_Character_3 or v53 == nil or l_Character_3.Parent == nil or l_Character_3.Parent ~= workspace.PlayerCharacters or v49.Stamina.Value <= 0 then
                        if _G.check:inspect(l_Character_3) == false then
                            v52:Stop();
                        end;
                        return true;
                    else
                        return;
                    end;
                end
            });
            v52:AdjustSpeed(1);
            task.wait(0.2);
            if v53 then
                v53:FireServer(l_Character_3.PrimaryPart.CFrame);
            end;
            task.wait(0.5);
            l_Character_3.Humanoid.WalkSpeed = 16;
            v52:Stop();
            _G.canuse = true;
            _G.keysetup:cooldown("Golden Field", l_cd_3);
            _G.fw(l_cd_3);
            l_Cooldowns_3.field = false;
        end;
    end;
end;
v8.GoldenAge = function(v55, _) --[[ Line: 274 ]] --[[ Name: GoldenAge ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_4 = v55.Cooldowns;
    local l_Character_4 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_4.age == false and _G.check:inspect(l_Character_4) == true and _G.StamCheck("Golden Age") == true then
        local v60 = v3.GetM("Golden Age");
        local l_cd_4 = v60.cd;
        if _G.StamCheck("Golden Age") == false then
            return;
        elseif v60.statreq and _G.MeetReq(v60.statreq) == false then
            return;
        else
            local v62, _, _ = _G.getRayFloor(l_Character_4.PrimaryPart.CFrame, 5);
            if v62 == nil then
                _G.displayMessage("<Color=Red>I have to touch the ground");
                return nil;
            else
                _G.canuse = false;
                l_Cooldowns_4.age = true;
                game.ReplicatedStorage.Events.Skill:InvokeServer("Golden Age", l_Character_4.PrimaryPart.CFrame);
                _G.canuse = true;
                _G.keysetup:cooldown("Golden Age", l_cd_4);
                _G.fw(l_cd_4);
                l_Cooldowns_4.age = false;
            end;
        end;
    end;
end;
v8.GoldenJudgement = function(v65, v66) --[[ Line: 305 ]] --[[ Name: GoldenJudgement ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_5 = v65.Cooldowns;
    local l_Character_5 = l_LocalPlayer_0.Character;
    local v69 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_5.Judgement == false and _G.check:inspect(l_Character_5) == true and _G.StamCheck("Golden Judgement") == true then
        local v70 = v3.GetM("Golden Judgement");
        local l_cd_5 = v70.cd;
        if _G.StamCheck("Golden Judgement") == false then
            return;
        elseif v70.statreq and _G.MeetReq(v70.statreq) == false then
            return;
        else
            _G.canuse = false;
            l_Cooldowns_5.Judgement = true;
            l_Character_5.Humanoid.WalkSpeed = 4;
            local v72 = game.ReplicatedStorage.Events.Skill:InvokeServer("Golden Judgement");
            local v73 = l_Character_5.Humanoid:LoadAnimation(script.newspiekcast);
            v73:Play();
            v73:AdjustSpeed(0);
            _G.PauseAnim(v73, 0.3, 1);
            local v74 = tick();
            v65:ChargeSkill(v66, {
                Key = Enum.KeyCode.X, 
                EndFunction = function() --[[ Line: 335 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_5 (copy), v74 (copy), v65 (copy), v72 (copy), v69 (copy), v73 (copy)
                    l_Character_5.Humanoid.WalkSpeed = 4;
                    if tick() - v74 >= 4 or _G.check:inspect(l_Character_5) == false or v65.Tool.Parent ~= l_Character_5 or v72 == nil or l_Character_5.Parent == nil or l_Character_5.Parent ~= workspace.PlayerCharacters or v69.Stamina.Value <= 0 then
                        if _G.check:inspect(l_Character_5) == false then
                            v73:Stop();
                        end;
                        return true;
                    else
                        return;
                    end;
                end
            });
            v73:AdjustSpeed(1.5);
            if v72 then
                v72:FireServer(l_Character_5.PrimaryPart.CFrame);
            end;
            task.wait(0.5);
            l_Character_5.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Golden Judgement", l_cd_5);
            _G.fw(l_cd_5);
            l_Cooldowns_5.Judgement = false;
        end;
    end;
end;
return v8;