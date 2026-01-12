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
        amputate = false, 
        kris = false, 
        lin = false, 
        cleave = false
    };
    return v10;
end;
v8.SterbenLinie = function(v11, v12) --[[ Line: 28 ]] --[[ Name: SterbenLinie ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v11.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.lin == false and _G.check:inspect(l_Character_0) == true then
        local v16 = v3.GetM("Sterben Linie");
        local l_cd_0 = v16.cd;
        if _G.StamCheck("Sterben Linie") == false then
            return;
        elseif v16.statreq and _G.MeetReq(v16.statreq) == false then
            return;
        else
            _G.canuse = false;
            local v18 = l_Character_0.Humanoid.Animator:LoadAnimation(script.LinieWindup);
            v18:Play();
            v18:AdjustWeight(2);
            l_Character_0.Humanoid.WalkSpeed = 4;
            l_Cooldowns_0.lin = true;
            local v19 = game.ReplicatedStorage.Events.Skill:InvokeServer("Sterben Linie");
            task.wait(0.5);
            v18:Stop();
            local v20 = l_Character_0.Humanoid.Animator:LoadAnimation(script.LinieLoop);
            v20:Play();
            v20:AdjustWeight(2);
            local v21 = tick();
            local function v22() --[[ Line: 58 ]] --[[ Name: checkFunction ]]
                -- upvalues: l_Character_0 (copy)
                l_Character_0.Humanoid.WalkSpeed = 4;
            end;
            local function v23() --[[ Line: 62 ]] --[[ Name: endFunction ]]
                -- upvalues: l_Character_0 (copy), v21 (copy)
                if l_Character_0:FindFirstChild(script.Name) == nil then
                    return true;
                elseif tick() - v21 >= 1.5 then
                    return true;
                elseif _G.check:inspect(l_Character_0) == false then
                    return true;
                else
                    return;
                end;
            end;
            local _ = l_Character_0.PrimaryPart.CFrame;
            v11:ChargeSkill(v12, {
                Key = Enum.KeyCode.E, 
                CheckFunction = v22, 
                EndFunction = v23, 
                IgnoreInstantCastSetting = true
            });
            v20:Stop();
            local v25 = l_Character_0.Humanoid.Animator:LoadAnimation(script.LinieEnd);
            v25:Play();
            v25:AdjustWeight(2);
            if v19 then
                v19:FireServer(l_Character_0.PrimaryPart.CFrame);
            end;
            task.wait(0.5);
            l_Character_0.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Sterben Linie", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.lin = false;
        end;
    end;
end;
v8.Amputate = function(v26, v27) --[[ Line: 98 ]] --[[ Name: Amputate ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v26.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.amputate == false and _G.check:inspect(l_Character_1) == true then
        local v31 = v3.GetM("Amputate");
        local l_cd_1 = v31.cd;
        if _G.StamCheck("Amputate") == false then
            return;
        elseif v31.statreq and _G.MeetReq(v31.statreq) == false then
            return;
        else
            _G.canuse = false;
            l_Cooldowns_1.amputate = true;
            local v33 = l_Character_1.Humanoid.Animator:LoadAnimation(script.amputate2);
            v33:Play();
            v33:AdjustWeight(5);
            l_Character_1.Humanoid.WalkSpeed = 4;
            local v34 = game.ReplicatedStorage.Events.Skill:InvokeServer("Amputate");
            _G.PauseAnim(v33, 0.3, 1);
            local function v35() --[[ Line: 123 ]] --[[ Name: checkFunction ]]
                -- upvalues: l_Character_1 (copy)
                l_Character_1.Humanoid.WalkSpeed = 4;
            end;
            local function v36() --[[ Line: 127 ]] --[[ Name: endFunction ]]
                -- upvalues: l_Character_1 (copy)
                if l_Character_1:FindFirstChild(script.Name) == nil then
                    return true;
                else
                    return;
                end;
            end;
            local _ = l_Character_1.PrimaryPart.CFrame;
            v26:ChargeSkill(v27, {
                Key = Enum.KeyCode.R, 
                CheckFunction = v35, 
                EndFunction = v36
            });
            l_Character_1.Humanoid.AutoRotate = false;
            l_Character_1.PrimaryPart.Anchored = true;
            if v34 then
                if v34:InvokeServer(l_Character_1.PrimaryPart.CFrame) == true then
                    v33:AdjustSpeed(1);
                    task.wait(2.3);
                    l_Character_1.Humanoid.AutoRotate = true;
                else
                    v33:Stop();
                    local v38 = l_Character_1.Humanoid.Animator:LoadAnimation(script.amputate);
                    v38:Play();
                    v38:AdjustWeight(2);
                    v38.TimePosition = 0.35;
                    task.wait(0.6);
                    l_Character_1.Humanoid.AutoRotate = true;
                end;
            else
                v33:Stop();
            end;
            l_Character_1.PrimaryPart.Anchored = false;
            l_Character_1.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Amputate", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1.amputate = false;
        end;
    end;
end;
v8.SterbenKreis = function(v39, v40) --[[ Line: 173 ]] --[[ Name: SterbenKreis ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_2 = v39.Cooldowns;
    local l_Character_2 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_2.kris == false and _G.check:inspect(l_Character_2) == true then
        local v44 = v3.GetM("Sterben Kreis");
        local l_cd_2 = v44.cd;
        if _G.StamCheck("Sterben Kreis") == false then
            return;
        elseif v44.statreq and _G.MeetReq(v44.statreq) == false then
            return;
        else
            _G.canuse = false;
            l_Cooldowns_2.kris = true;
            local v46 = l_Character_2.Humanoid.Animator:LoadAnimation(script.lineCharge);
            v46:Play();
            v46:AdjustWeight(2);
            l_Character_2.Humanoid.WalkSpeed = 4;
            local v47 = tick();
            local v48 = game.ReplicatedStorage.Events.Skill:InvokeServer("Sterben Kreis");
            _G.PauseAnim(v46, 0.35, 1);
            local function v49() --[[ Line: 199 ]] --[[ Name: checkFunction ]]
                -- upvalues: l_Character_2 (copy)
                l_Character_2.Humanoid.WalkSpeed = 4;
            end;
            local function v50() --[[ Line: 203 ]] --[[ Name: endFunction ]]
                -- upvalues: l_Character_2 (copy), v47 (copy)
                if l_Character_2:FindFirstChild(script.Name) == nil then
                    return true;
                elseif tick() - v47 >= 2 then
                    return true;
                else
                    return;
                end;
            end;
            local _ = l_Character_2.PrimaryPart.CFrame;
            v39:ChargeSkill(v40, {
                Key = Enum.KeyCode.Z, 
                CheckFunction = v49, 
                EndFunction = v50
            });
            v46:Stop();
            l_Character_2.Humanoid.AutoRotate = false;
            l_Character_2.PrimaryPart.Anchored = true;
            if v48 then
                v48:FireServer(l_Character_2.PrimaryPart.CFrame);
                local v52 = l_Character_2.Humanoid.Animator:LoadAnimation(script.lineFire);
                v52:Play();
                v52:AdjustWeight(2);
                v52:AdjustSpeed(1.25);
            end;
            task.wait(1);
            l_Character_2.Humanoid.AutoRotate = true;
            l_Character_2.PrimaryPart.Anchored = false;
            l_Character_2.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Sterben Kreis", l_cd_2);
            _G.fw(l_cd_2);
            l_Cooldowns_2.kris = false;
        end;
    end;
end;
v8.AmputatingCleave = function(v53, v54) --[[ Line: 243 ]] --[[ Name: AmputatingCleave ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_3 = v53.Cooldowns;
    local l_Character_3 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_3.cleave == false and _G.check:inspect(l_Character_3) == true then
        local v58 = v3.GetM("Amputating Cleave");
        local l_cd_3 = v58.cd;
        if _G.StamCheck("Amputating Cleave") == false then
            return;
        elseif v58.statreq and _G.MeetReq(v58.statreq) == false then
            return;
        else
            _G.canuse = false;
            l_Cooldowns_3.cleave = true;
            l_Character_3.Humanoid.WalkSpeed = 4;
            local v60 = tick();
            _G.FaceMouse = true;
            _G.mouseLevel = true;
            local v61 = game.ReplicatedStorage.Events.Skill:InvokeServer("Amputating Cleave", l_Character_3.PrimaryPart.CFrame);
            local v62 = l_Character_3.Humanoid.Animator:LoadAnimation(script.cleaveCharge);
            v62:Play();
            v62:AdjustWeight(2);
            local v63 = script.Part:Clone();
            v63.Parent = workspace.Effects;
            v63.Transparency = 1;
            v63.Size = Vector3.new(26, 1, 1, 0);
            v63.CFrame = l_Character_3.PrimaryPart.CFrame;
            _G.tween(v63, {
                1.5, 
                Enum.EasingStyle.Quad, 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                Size = Vector3.new(60, 1, 1, 0)
            });
            local function v64() --[[ Line: 279 ]] --[[ Name: checkFunction ]]
                -- upvalues: l_Character_3 (copy), v63 (copy)
                l_Character_3.Humanoid.WalkSpeed = 4;
                v63.CFrame = l_Character_3.PrimaryPart.CFrame;
            end;
            local function v65() --[[ Line: 284 ]] --[[ Name: endFunction ]]
                -- upvalues: l_Character_3 (copy), v60 (copy)
                if l_Character_3:FindFirstChild(script.Name) == nil then
                    return true;
                elseif tick() - v60 >= 1.5 then
                    return true;
                else
                    return;
                end;
            end;
            local _ = l_Character_3.PrimaryPart.CFrame;
            v53:ChargeSkill(v54, {
                Key = Enum.KeyCode.X, 
                CheckFunction = v64, 
                IgnoreInstantCastSetting = true, 
                EndFunction = v65
            });
            v62:Stop();
            _G.destroy(v63, 0.25);
            local v67 = l_Character_3.Humanoid.Animator:LoadAnimation(script.cleave);
            v67:Play();
            v67:AdjustWeight(2);
            _G.FaceMouse = false;
            _G.mouseLevel = false;
            l_Character_3.Humanoid.AutoRotate = false;
            l_Character_3.PrimaryPart.Anchored = true;
            if v61 then
                if v61:InvokeServer(l_Character_3.PrimaryPart.CFrame, v63.Size.X) == true then
                    task.wait(1.2);
                else
                    v67:Stop();
                    local v68 = l_Character_3.Humanoid.Animator:LoadAnimation(script.miss);
                    v68:Play();
                    v68:AdjustWeight(2);
                    v68:AdjustSpeed(2);
                end;
            end;
            task.wait(0.8);
            l_Character_3.Humanoid.AutoRotate = true;
            l_Character_3.PrimaryPart.Anchored = false;
            l_Character_3.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Amputating Cleave", l_cd_3);
            _G.fw(l_cd_3);
            l_Cooldowns_3.cleave = false;
        end;
    end;
end;
return v8;