local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v3 = require(game.ReplicatedStorage.Modules.Skills);
local v4 = require(script.Parent.Parent.MobileBase);
local _ = require(l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule"));
local _ = l_LocalPlayer_0:GetMouse();
local v7 = setmetatable({}, v4);
v7.__index = v7;
v7.new = function(_) --[[ Line: 18 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v7 (copy)
    local v9 = setmetatable(v4.new(script.Name), v7);
    v9.Cooldowns = {
        burst = false, 
        wave = false, 
        charm = false, 
        fem = false, 
        pistol = false, 
        bomb = false
    };
    v9.CurrentSwipe = 1;
    return v9;
end;
v7.LoveBurst = function(v10, v11) --[[ Line: 30 ]] --[[ Name: LoveBurst ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v10.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local v14 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.burst == false and _G.check:inspect(l_Character_0) == true and _G.StamCheck("Love Burst") == true then
        local v15 = v3.GetM("Love Burst");
        local l_cd_0 = v15.cd;
        if _G.StamCheck("Love Burst") == false then
            return;
        elseif v15.statreq and _G.MeetReq(v15.statreq) == false then
            return;
        else
            _G.canuse = false;
            local v17 = game.ReplicatedStorage.Events.Skill:InvokeServer("Love Burst", {
                cf = v10:GetMouseCFrame()
            });
            if v17 == nil then
                _G.canuse = true;
                return;
            else
                local v18, v19 = unpack(v17);
                l_Cooldowns_0.burst = true;
                local v20 = l_Character_0.Humanoid:LoadAnimation(script.loveBurst);
                v20:Play();
                local v21 = v19.AnimationController:LoadAnimation(script.loveBurst);
                v21:Play();
                _G.FaceMouse = true;
                task.spawn(function() --[[ Line: 61 ]]
                    -- upvalues: v21 (copy)
                    _G.PauseAnim(v21, 1.75, 1.5);
                end);
                _G.PauseAnim(v20, 1.75, 1.5);
                local v22 = tick();
                v10:ChargeSkill(v11, {
                    Key = Enum.KeyCode.X, 
                    CheckFunction = function() --[[ Line: 71 ]] --[[ Name: checkFunction ]]

                    end, 
                    EndFunction = function() --[[ Line: 75 ]] --[[ Name: endFunction ]]
                        -- upvalues: v22 (copy), l_Character_0 (copy), v14 (copy)
                        if tick() - v22 >= 10 or not l_Character_0:FindFirstChild(script.Name) or l_Character_0.Parent == nil or l_Character_0.Parent ~= workspace.PlayerCharacters or v14.Stamina.Value <= 0 then
                            return true;
                        else
                            return;
                        end;
                    end
                });
                l_Character_0.HumanoidRootPart.Anchored = true;
                _G.FaceMouse = false;
                v20:AdjustSpeed(1);
                v21:AdjustSpeed(1);
                if v18 then
                    v18:FireServer(l_Character_0.HumanoidRootPart.CFrame);
                end;
                task.wait(0.65);
                l_Character_0.HumanoidRootPart.Anchored = false;
                _G.canuse = true;
                _G.keysetup:cooldown("Love Burst", l_cd_0);
                _G.fw(l_cd_0);
                l_Cooldowns_0.burst = false;
            end;
        end;
    end;
end;
v7.LoveWave = function(v23, v24) --[[ Line: 106 ]] --[[ Name: LoveWave ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v23.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local v27 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.wave == false and _G.check:inspect(l_Character_1) == true and _G.StamCheck("Love Wave") == true then
        local v28 = v3.GetM("Love Wave");
        local l_cd_1 = v28.cd;
        if _G.StamCheck("Love Wave") == false then
            return;
        elseif v28.statreq and _G.MeetReq(v28.statreq) == false then
            return;
        else
            l_Cooldowns_1.wave = true;
            _G.canuse = false;
            local v30 = l_Character_1.Humanoid:LoadAnimation(script.ray);
            v30:Play();
            _G.FaceMouse = true;
            _G.PauseAnim(v30, 0.3, 1);
            local v31 = tick();
            v23:ChargeSkill(v24, {
                Key = Enum.KeyCode.Z, 
                CheckFunction = function() --[[ Line: 133 ]] --[[ Name: checkFunction ]]

                end, 
                EndFunction = function() --[[ Line: 137 ]] --[[ Name: endFunction ]]
                    -- upvalues: v31 (copy), l_Character_1 (copy), v27 (copy)
                    if tick() - v31 >= 10 or not l_Character_1:FindFirstChild(script.Name) or l_Character_1.Parent == nil or l_Character_1.Parent ~= workspace.PlayerCharacters or v27.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            l_Character_1.HumanoidRootPart.Anchored = true;
            _G.FaceMouse = false;
            v30:AdjustSpeed(1);
            task.wait(0.3);
            v30:AdjustSpeed(0);
            l_Character_1.Humanoid.AutoRotate = false;
            game.ReplicatedStorage.Events.Skill:InvokeServer("Love Wave", {
                cf = l_Character_1.HumanoidRootPart.CFrame
            });
            task.wait(0.2);
            v30:Stop();
            l_Character_1.HumanoidRootPart.Anchored = false;
            l_Character_1.Humanoid.AutoRotate = true;
            task.wait(0.35);
            _G.canuse = true;
            _G.keysetup:cooldown("Love Wave", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1.wave = false;
        end;
    end;
end;
v7.LoveBomb = function(v32, v33) --[[ Line: 171 ]] --[[ Name: LoveBomb ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_2 = v32.Cooldowns;
    local l_Character_2 = l_LocalPlayer_0.Character;
    local v36 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_2.bomb == false and _G.check:inspect(l_Character_2) == true and _G.StamCheck("Love Bomb") == true then
        local v37 = v3.GetM("Love Bomb");
        local l_cd_2 = v37.cd;
        if _G.StamCheck("Love Bomb") == false then
            return;
        elseif v37.statreq and _G.MeetReq(v37.statreq) == false then
            return;
        else
            _G.canuse = false;
            local v39 = game.ReplicatedStorage.Events.Skill:InvokeServer("Love Bomb", {
                cf = v32:GetMouseCFrame()
            });
            if v39 == nil then
                _G.canuse = true;
                return;
            else
                local v40, _ = unpack(v39);
                l_Cooldowns_2.bomb = true;
                local v42 = l_Character_2.Humanoid:LoadAnimation(script.bomb);
                v42:Play();
                _G.FaceMouse = true;
                _G.PauseAnim(v42, 0.02, 1);
                local v43 = tick();
                v32:ChargeSkill(v33, {
                    Key = Enum.KeyCode.R, 
                    CheckFunction = function() --[[ Line: 205 ]] --[[ Name: checkFunction ]]

                    end, 
                    EndFunction = function() --[[ Line: 209 ]] --[[ Name: endFunction ]]
                        -- upvalues: v43 (copy), l_Character_2 (copy), v36 (copy)
                        if tick() - v43 >= 10 or not l_Character_2:FindFirstChild(script.Name) or l_Character_2.Parent == nil or l_Character_2.Parent ~= workspace.PlayerCharacters or v36.Stamina.Value <= 0 then
                            return true;
                        else
                            return;
                        end;
                    end
                });
                l_Character_2.HumanoidRootPart.Anchored = true;
                _G.FaceMouse = false;
                v42:AdjustSpeed(1);
                local l_v32_MouseCFrame_0 = v32:GetMouseCFrame();
                task.wait(0.45);
                if v40 then
                    v40:FireServer(l_Character_2.RightHand.CFrame, l_v32_MouseCFrame_0);
                end;
                task.wait(0.5);
                l_Character_2.HumanoidRootPart.Anchored = false;
                _G.canuse = true;
                _G.keysetup:cooldown("Love Bomb", l_cd_2);
                _G.fw(l_cd_2);
                l_Cooldowns_2.bomb = false;
            end;
        end;
    end;
end;
v7.PerfumeFemur = function(v45, v46) --[[ Line: 242 ]] --[[ Name: PerfumeFemur ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_3 = v45.Cooldowns;
    local l_Character_3 = l_LocalPlayer_0.Character;
    local v49 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_3.fem == false and _G.check:inspect(l_Character_3) == true and _G.StamCheck("Perfume Femur") == true then
        local v50 = v3.GetM("Perfume Femur");
        local l_cd_3 = v50.cd;
        if _G.StamCheck("Perfume Femur") == false then
            return;
        elseif v50.statreq and _G.MeetReq(v50.statreq) == false then
            return;
        else
            l_Cooldowns_3.fem = true;
            _G.canuse = false;
            local v52 = l_Character_3.Humanoid:LoadAnimation(script.fem);
            v52:Play();
            l_Character_3.Humanoid.WalkSpeed = 4;
            _G.PauseAnim(v52, 0.5, 1.5);
            local _ = tick();
            v45:ChargeSkill(v46, {
                Key = Enum.KeyCode.C, 
                CheckFunction = function() --[[ Line: 268 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_3 (copy)
                    l_Character_3.Humanoid.WalkSpeed = 4;
                end, 
                EndFunction = function() --[[ Line: 273 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_3 (copy), v49 (copy)
                    if not l_Character_3:FindFirstChild(script.Name) or l_Character_3.Parent == nil or l_Character_3.Parent ~= workspace.PlayerCharacters or v49.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v52:AdjustSpeed(1);
            local v54 = game.ReplicatedStorage.Events.Skill:InvokeServer("Perfume Femur", {
                cf = l_Character_3.HumanoidRootPart.CFrame
            });
            local v55 = Instance.new("BodyVelocity", l_Character_3.HumanoidRootPart);
            v55.MaxForce = Vector3.new(1000000, 0, 1000000, 0);
            v55.Velocity = l_Character_3.HumanoidRootPart.CFrame.lookVector * 125;
            _G.destroy(v55, 0.1);
            local _ = nil;
            local v57 = false;
            do
                local l_v55_0, l_v57_0 = v55, v57;
                local function v61(v60) --[[ Line: 295 ]] --[[ Name: hitfound ]]
                    -- upvalues: l_v55_0 (ref), v54 (copy), l_Character_3 (copy)
                    l_v55_0:Destroy();
                    l_v55_0 = nil;
                    v54:FireServer(v60.Parent, l_Character_3.HumanoidRootPart.CFrame);
                end;
                local function v62() --[[ Line: 300 ]] --[[ Name: hitinter ]]
                    -- upvalues: l_v55_0 (ref), l_v57_0 (ref), v52 (copy)
                    l_v55_0:Destroy();
                    l_v55_0 = nil;
                    l_v57_0 = true;
                    v52:Stop();
                end;
                _G.hitbox:start(l_Character_3, Vector3.new(9, 9, 9, 0), 0.3, CFrame.new(0, 0, -2), v61, v62);
                l_Character_3.Humanoid.WalkSpeed = 16;
                _G.canuse = true;
                _G.keysetup:cooldown("Perfume Femur", l_cd_3);
                _G.fw(l_cd_3);
                l_Cooldowns_3.fem = false;
            end;
        end;
    end;
end;
v7.LovePistol = function(v63, v64) --[[ Line: 320 ]] --[[ Name: LovePistol ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_4 = v63.Cooldowns;
    local l_Character_4 = l_LocalPlayer_0.Character;
    local v67 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_4.pistol == false and _G.check:inspect(l_Character_4) == true and _G.StamCheck("Love Pistol") == true then
        local v68 = v3.GetM("Love Pistol");
        local l_cd_4 = v68.cd;
        if _G.StamCheck("Love Pistol") == false then
            return;
        elseif v68.statreq and _G.MeetReq(v68.statreq) == false then
            return;
        else
            l_Cooldowns_4.pistol = true;
            _G.canuse = false;
            local v70 = game.ReplicatedStorage.Events.Skill:InvokeServer("Love Pistol", {
                cf = l_Character_4.HumanoidRootPart.CFrame
            });
            if v70 == nil then
                _G.canuse = true;
                l_Cooldowns_4.pistol = false;
                return;
            else
                local v71, _ = unpack(v70);
                local v73 = l_Character_4.Humanoid:LoadAnimation(script.pistol);
                v73:Play();
                _G.FaceMouse = true;
                _G.PauseAnim(v73, 0.65, 1.5);
                local v74 = tick();
                v63:ChargeSkill(v64, {
                    Key = Enum.KeyCode.E, 
                    EndFunction = function() --[[ Line: 359 ]] --[[ Name: endFunction ]]
                        -- upvalues: l_Character_4 (copy), v74 (copy), v67 (copy)
                        if not l_Character_4:FindFirstChild(script.Name) or tick() - v74 >= 10 or l_Character_4.Parent == nil or l_Character_4.Parent ~= workspace.PlayerCharacters or v67.Stamina.Value <= 0 then
                            return true;
                        else
                            return;
                        end;
                    end
                });
                v73:AdjustSpeed(2);
                _G.FaceMouse = false;
                l_Character_4.HumanoidRootPart.Anchored = true;
                if v71 then
                    v71:FireServer(l_Character_4.HumanoidRootPart.CFrame, v63:GetMouseCFrame(), l_Character_4.RightHand.CFrame);
                end;
                task.wait(0.2);
                l_Character_4.HumanoidRootPart.Anchored = false;
                _G.canuse = true;
                _G.keysetup:cooldown("Love Pistol", l_cd_4);
                _G.fw(l_cd_4);
                l_Cooldowns_4.pistol = false;
            end;
        end;
    end;
end;
return v7;