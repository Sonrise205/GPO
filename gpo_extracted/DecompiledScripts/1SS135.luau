local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v3 = require(game.ReplicatedStorage.Modules.Skills);
local v4 = require(script.Parent.Parent.MobileBase);
local l_PlayerModule_0 = require(l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule"));
local v6 = require(game.ReplicatedStorage.Modules.RotatedRegion3);
local _ = l_LocalPlayer_0:GetMouse();
local _ = l_PlayerModule_0:GetControls();
local v9 = require(game.ReplicatedStorage.Modules.SwordHandle.SwordInfo);
local v10 = setmetatable({}, v4);
v10.__index = v10;
v10.new = function(_, v12) --[[ Line: 22 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v10 (copy), v9 (copy)
    local v13 = setmetatable(v4.new(), v10);
    v13.Tool = v12;
    local v14 = {};
    local v15 = v9[script.Name];
    v15 = if v15 == nil then v9.Katana.keys else v15.keys;
    for v16 = 1, #v15 do
        v14[v15[v16][1]] = false;
    end;
    v13.Cooldowns = v14;
    return v13;
end;
local function _(v17, v18) --[[ Line: 46 ]] --[[ Name: getinregion ]]
    -- upvalues: v6 (copy)
    return (v6.new(v18.CFrame, v18.Size):FindPartsInRegion3WithWhiteList(_G.getTargets(v17, true), 2000));
end;
local function _(v20, v21, v22) --[[ Line: 52 ]] --[[ Name: lerp ]]
    return v20 + (v21 - v20) * v22;
end;
local function _(v24, v25, v26, v27, v28) --[[ Line: 56 ]] --[[ Name: cubicBezierPos ]]
    local v29 = v24 + (v25 - v24) * v28;
    local v30 = v25 + (v26 - v25) * v28;
    local v31 = v26 + (v27 - v26) * v28;
    local v32 = v29 + (v30 - v29) * v28;
    return v32 + (v30 + (v31 - v30) * v28 - v32) * v28;
end;
v10["36CaliberPhoenix"] = function(v34, v35) --[[ Line: 66 ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy), v6 (copy)
    local l_Cooldowns_0 = v34.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0["36 Caliber Phoenix"] == false and _G.check:inspect(l_Character_0) == true then
        local v39 = v3.GetM("36 Caliber Phoenix");
        local l_cd_0 = v39.cd;
        if _G.StamCheck("36 Caliber Phoenix") == false then
            return;
        elseif v39.statreq and _G.MeetReq(v39.statreq) == false then
            return;
        else
            local v41 = l_Character_0.Humanoid.Animator:LoadAnimation(script.caliber);
            v41:Play();
            v41:AdjustWeight(2);
            l_Cooldowns_0["36 Caliber Phoenix"] = true;
            _G.FaceMouse = true;
            _G.canuse = false;
            local v42 = game.ReplicatedStorage.Events.Skill:InvokeServer("36 Caliber Phoenix");
            _G.PauseAnim(v41, 0.45, 2);
            local v43 = tick();
            v34:ChargeSkill(v35, {
                Key = Enum.KeyCode.E, 
                CheckFunction = function() --[[ Line: 96 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_0 (copy), v41 (copy)
                    if _G.check:inspect(l_Character_0) == false then
                        v41:Stop();
                        return true;
                    else
                        return;
                    end;
                end, 
                EndFunction = function() --[[ Line: 104 ]] --[[ Name: endFunction ]]
                    -- upvalues: v34 (copy), l_Character_0 (copy), v43 (copy)
                    if v34.Tool.Parent ~= l_Character_0 or tick() - v43 >= 10 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            _G.FaceMouse = false;
            l_Character_0.HumanoidRootPart.Anchored = true;
            if v42 then
                local v44, v45 = v42:InvokeServer(CFrame.new(l_Character_0.HumanoidRootPart.Position, v34:GetMouseCFrame().Position));
                v45 = _G.awaitObject(v45);
                local v46 = {};
                do
                    local l_v45_0 = v45;
                    task.spawn(function() --[[ Line: 122 ]]
                        -- upvalues: l_Character_0 (copy), l_v45_0 (ref), v6 (ref), v46 (copy), v44 (copy), v42 (copy)
                        local v48 = 0;
                        repeat
                            task.wait();
                            local l_l_Character_0_0 = l_Character_0;
                            local l_l_v45_0_0 = l_v45_0;
                            local l_PartsInRegion3WithWhiteList_0 = v6.new(l_l_v45_0_0.CFrame, l_l_v45_0_0.Size):FindPartsInRegion3WithWhiteList(_G.getTargets(l_l_Character_0_0, true), 2000);
                            for v52 = 1, #l_PartsInRegion3WithWhiteList_0 do
                                local v53 = l_PartsInRegion3WithWhiteList_0[v52];
                                if v48 < 3 and v46[v53.Parent] == nil and v53.Parent:FindFirstChild("Humanoid") and v53:IsDescendantOf(l_Character_0) == false then
                                    v46[v53.Parent] = true;
                                    v48 = v48 + 1;
                                    v44:FireServer(v53.Parent);
                                end;
                            end;
                        until v48 >= 3 or v42.Parent == nil or l_v45_0.Parent == nil;
                    end);
                    if l_v45_0 then
                        local v54 = nil;
                        do
                            local l_v54_0 = v54;
                            l_v54_0 = l_v45_0.Touched:Connect(function(v56) --[[ Line: 141 ]]
                                -- upvalues: l_v54_0 (ref), v44 (copy)
                                if v56 and v56.CollisionGroupId == 5 then
                                    l_v54_0:Disconnect();
                                    v44:FireServer("cancel");
                                end;
                            end);
                        end;
                    end;
                end;
            end;
            v41:AdjustSpeed(1);
            task.wait(0.35);
            l_Character_0.HumanoidRootPart.Anchored = false;
            l_Character_0.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("36 Caliber Phoenix", l_cd_0);
            require(script.Parent.SwordStyleSwapping):matchCooldowns(l_Cooldowns_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0["36 Caliber Phoenix"] = false;
        end;
    end;
end;
v10.RagingSerpent = function(v57, v58) --[[ Line: 162 ]] --[[ Name: RagingSerpent ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v57.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local v61 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1["Raging Serpent"] == false and _G.check:inspect(l_Character_1) == true then
        local v62 = v3.GetM("Raging Serpent");
        local l_cd_1 = v62.cd;
        if _G.StamCheck("Raging Serpent") == false then
            return;
        elseif v62.statreq and _G.MeetReq(v62.statreq) == false then
            return;
        else
            _G.canuse = false;
            local v64 = l_Character_1.Humanoid.Animator:LoadAnimation(script.serpantC);
            v64:Play();
            v64:AdjustSpeed(0);
            l_Character_1.HumanoidRootPart.Anchored = true;
            local v65 = game.ReplicatedStorage.Events.Skill:InvokeServer("Raging Serpent");
            _G.PauseAnim(v64, 0.525, 1);
            l_Cooldowns_1["Raging Serpent"] = true;
            local v66 = 45;
            local v67 = 0;
            local v68 = script.Sphere:Clone();
            v68.CFrame = l_Character_1.HumanoidRootPart.CFrame;
            v68.Parent = workspace.Effects;
            do
                local l_v66_0, l_v67_0, l_v68_0 = v66, v67, v68;
                local function v72() --[[ Line: 196 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_1 (copy), v64 (copy), l_v66_0 (ref), l_v68_0 (ref), l_v67_0 (ref)
                    if _G.check:inspect(l_Character_1) == false then
                        v64:Stop();
                        return true;
                    else
                        l_v66_0 = l_v66_0 + 0.1;
                        l_v68_0.Size = Vector3.new(l_v66_0, l_v66_0, l_v66_0);
                        if tick() - l_v67_0 >= 0.1 then
                            l_v67_0 = tick();
                            game.ReplicatedStorage.Events.takestam:FireServer(2);
                        end;
                        return;
                    end;
                end;
                local function v73() --[[ Line: 210 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_v66_0 (ref), v61 (copy), v57 (copy), l_Character_1 (copy)
                    if l_v66_0 >= 125 or v61.Stamina.Value <= 0 or v57.Tool.Parent ~= l_Character_1 then
                        return true;
                    else
                        return;
                    end;
                end;
                v57:ChargeSkill(v58, {
                    Key = Enum.KeyCode.Z, 
                    CheckFunction = v72, 
                    EndFunction = v73, 
                    IgnoreInstantCastSetting = true
                });
                v64:Stop();
                _G.tween(l_v68_0, {
                    0.25, 
                    Enum.EasingStyle.Quad, 
                    Enum.EasingDirection.Out, 
                    0, 
                    false, 
                    0
                }, {
                    Transparency = 1
                });
                _G.destroy(l_v68_0, 0.25);
                l_v68_0 = nil;
                local v74 = 0;
                if v65 then
                    v74 = v65:InvokeServer({
                        siz = l_v66_0
                    });
                end;
                pcall(function() --[[ Line: 234 ]]
                    -- upvalues: v74 (ref), l_Character_1 (copy)
                    if v74 and v74 ~= 0 then
                        local v75 = l_Character_1.Humanoid.Animator:LoadAnimation(script.serpantSlash);
                        v75:Play();
                        v75:AdjustWeight(2);
                        v75:AdjustSpeed(0);
                        task.wait(0.25);
                        v75:Stop();
                    end;
                end);
                l_Character_1.HumanoidRootPart.Anchored = false;
                l_Character_1.Humanoid.WalkSpeed = 16;
                _G.canuse = true;
                _G.keysetup:cooldown("Raging Serpent", l_cd_1);
                require(script.Parent.SwordStyleSwapping):matchCooldowns(l_Cooldowns_1);
                _G.fw(l_cd_1);
                l_Cooldowns_1["Raging Serpent"] = false;
            end;
        end;
    end;
end;
v10.DragonBlaze = function(v76, v77) --[[ Line: 255 ]] --[[ Name: DragonBlaze ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_2 = v76.Cooldowns;
    local l_Character_2 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_2["Dragon Blaze"] == false and _G.check:inspect(l_Character_2) == true then
        local v81 = v3.GetM("Dragon Blaze");
        local l_cd_2 = v81.cd;
        if _G.StamCheck("Dragon Blaze") == false then
            return;
        elseif v81.statreq and _G.MeetReq(v81.statreq) == false then
            return;
        else
            _G.canuse = false;
            local v83 = l_Character_2.Humanoid.Animator:LoadAnimation(script.dragonBlaze);
            v83:Play();
            v83:AdjustSpeed(0);
            _G.FaceMouse = true;
            _G.PauseAnim(v83, 0.5, 1);
            l_Cooldowns_2["Dragon Blaze"] = true;
            local v84 = tick();
            local v85 = game.ReplicatedStorage.Events.Skill:InvokeServer("Dragon Blaze");
            v76:ChargeSkill(v77, {
                Key = Enum.KeyCode.C, 
                CheckFunction = function() --[[ Line: 281 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_2 (copy), v83 (copy)
                    if _G.check:inspect(l_Character_2) == false then
                        v83:Stop();
                        return true;
                    else
                        return;
                    end;
                end, 
                EndFunction = function() --[[ Line: 288 ]] --[[ Name: endFunction ]]
                    -- upvalues: v76 (copy), l_Character_2 (copy), v84 (copy)
                    if v76.Tool.Parent ~= l_Character_2 or tick() - v84 >= 10 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            local v86 = Ray.new(workspace.CurrentCamera.CFrame.Position, (v76:GetMouseCFrame().p - workspace.CurrentCamera.CFrame.Position).unit * 400);
            local v87, v88, v89 = _G.raycastIgnoreList(v86, {
                workspace.CurrentCamera, 
                l_Character_2, 
                workspace.Effects, 
                workspace.Projectiles, 
                workspace.NPCs, 
                workspace.PlayerCharacters
            });
            if v87 == nil then
                local v90 = CFrame.new(v88);
                local v91 = Ray.new(v90.Position, v90.UpVector * -1000);
                local v92, v93, v94 = _G.raycastIgnoreList(v91, {
                    workspace.CurrentCamera, 
                    l_Character_2, 
                    workspace.Effects, 
                    workspace.Projectiles, 
                    workspace.NPCs, 
                    workspace.PlayerCharacters
                });
                v87 = v92;
                v88 = v93;
                v89 = v94;
            end;
            local l_v88_0 = v88;
            local v96 = (l_v88_0 - l_Character_2.HumanoidRootPart.CFrame.Position).magnitude / 2;
            local v97 = v96 / (math.random(100, 250) / 50);
            local l_Position_0 = l_Character_2.HumanoidRootPart.CFrame.Position;
            local l_p_0 = (l_Character_2.HumanoidRootPart.CFrame * CFrame.new(-v97, -v97 / 2, -v96)).p;
            local l_p_1 = (l_Character_2.HumanoidRootPart.CFrame * CFrame.new(v97, v97 * 2, -v96)).p;
            if v85 ~= nil then
                v85:FireServer({
                    l_Position_0, 
                    l_p_0, 
                    l_p_1, 
                    l_v88_0
                }, v76:GetMouseCFrame());
            end;
            l_Character_2.HumanoidRootPart.Anchored = true;
            l_Character_2.HumanoidRootPart.Anchored = false;
            _G.FaceMouse = false;
            v83:AdjustSpeed(1);
            task.wait(0.25);
            l_Character_2.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Dragon Blaze", l_cd_2);
            require(script.Parent.SwordStyleSwapping):matchCooldowns(l_Cooldowns_2);
            _G.fw(l_cd_2);
            l_Cooldowns_2["Dragon Blaze"] = false;
        end;
    end;
end;
v10.RapidSlashes = function(v101, v102) --[[ Line: 332 ]] --[[ Name: RapidSlashes ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_3 = v101.Cooldowns;
    local l_Character_3 = l_LocalPlayer_0.Character;
    local v105 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_3["Rapid Slashes"] == false and _G.check:inspect(l_Character_3) == true then
        local v106 = v3.GetM("Rapid Slashes");
        local l_cd_3 = v106.cd;
        if _G.StamCheck("Rapid Slashes") == false then
            return;
        elseif v106.statreq and _G.MeetReq(v106.statreq) == false then
            return;
        else
            _G.canuse = false;
            local v108 = l_Character_3.Humanoid.Animator:LoadAnimation(script.rapidStart);
            v108:Play();
            v108:AdjustSpeed(0);
            l_Cooldowns_3["Rapid Slashes"] = true;
            l_Character_3.Humanoid.WalkSpeed = 4;
            _G.PauseAnim(v108, 0.4, 1);
            v108:Stop();
            local v109 = l_Character_3.Humanoid.Animator:LoadAnimation(script.rapidHold);
            v109:Play();
            local v110 = game.ReplicatedStorage.Events.Skill:InvokeServer("Rapid Slashes");
            local v111 = tick();
            v101:ChargeSkill(v102, {
                Key = Enum.KeyCode.R, 
                CheckFunction = function() --[[ Line: 361 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_3 (copy)
                    l_Character_3.Humanoid.WalkSpeed = 4;
                    if _G.check:inspect(l_Character_3) == false then
                        return true;
                    else
                        return;
                    end;
                end, 
                EndFunction = function() --[[ Line: 368 ]] --[[ Name: endFunction ]]
                    -- upvalues: v105 (copy), v111 (copy), v101 (copy), l_Character_3 (copy)
                    if v105.Stamina.Value <= 0 or tick() - v111 >= 4 or v101.Tool.Parent ~= l_Character_3 then
                        return true;
                    else
                        return;
                    end;
                end, 
                IgnoreInstantCastSetting = true
            });
            v109:Stop();
            if v110 then
                v110:InvokeServer();
            end;
            task.wait(0.4);
            l_Character_3.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Rapid Slashes", l_cd_3);
            require(script.Parent.SwordStyleSwapping):matchCooldowns(l_Cooldowns_3);
            _G.fw(l_cd_3);
            l_Cooldowns_3["Rapid Slashes"] = false;
        end;
    end;
end;
v10.ShishiSonson = function(v112, v113) --[[ Line: 396 ]] --[[ Name: ShishiSonson ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_4 = v112.Cooldowns;
    local l_Character_4 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_4["Shishi Sonson"] == false and _G.check:inspect(l_Character_4) == true then
        local v117 = v3.GetM("Shishi Sonson");
        local l_cd_4 = v117.cd;
        if _G.StamCheck("Shishi Sonson") == false then
            return;
        elseif v117.statreq and _G.MeetReq(v117.statreq) == false then
            return;
        else
            _G.canuse = false;
            local v119 = l_Character_4.Humanoid.Animator:LoadAnimation(script.shishi);
            v119:Play();
            v119:AdjustSpeed(0);
            v119:AdjustWeight(5);
            l_Cooldowns_4["Shishi Sonson"] = true;
            _G.FaceMouse = true;
            local v120 = game.ReplicatedStorage.Events.Skill:InvokeServer("Shishi Sonson");
            _G.PauseAnim(v119, 1, 1.1);
            local v121 = false;
            local v122 = tick();
            do
                local l_v121_0 = v121;
                local function v124() --[[ Line: 425 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_4 (copy), l_v121_0 (ref)
                    l_Character_4.Humanoid.WalkSpeed = 4;
                    if _G.check:inspect(l_Character_4) == false then
                        l_v121_0 = true;
                        return true;
                    else
                        return;
                    end;
                end;
                v112:ChargeSkill(v113, {
                    Key = Enum.KeyCode.X, 
                    CheckFunction = v124, 
                    EndFunction = function() --[[ Line: 433 ]] --[[ Name: endFunction ]]
                        -- upvalues: v112 (copy), l_Character_4 (copy), v122 (copy)
                        if v112.Tool.Parent ~= l_Character_4 or tick() - v122 >= 10 then
                            return true;
                        else
                            return;
                        end;
                    end
                });
                v119:AdjustSpeed(1.5);
                _G.FaceMouse = false;
                if l_v121_0 == false then
                    l_Character_4.HumanoidRootPart.Anchored = true;
                    local v125 = Ray.new(l_Character_4.HumanoidRootPart.CFrame.p, (v112:GetMouseCFrame().p - l_Character_4.HumanoidRootPart.CFrame.p).unit * 100);
                    local _, v127 = _G.raycastWhitelist(v125, {
                        workspace.Islands, 
                        workspace.Ships, 
                        workspace.Env
                    });
                    local l_CFrame_0 = l_Character_4.HumanoidRootPart.CFrame;
                    local v129 = CFrame.new(v127, l_CFrame_0.p) * CFrame.Angles(0, 3.141592653589793, 0) * CFrame.new(0, l_Character_4.Humanoid.HipHeight * 1.25, 2);
                    l_Character_4.HumanoidRootPart.CFrame = v129;
                    local v130 = script.ColorCorrection:Clone();
                    v130.Parent = workspace.CurrentCamera;
                    _G.tween(v130, {
                        0.25, 
                        Enum.EasingStyle.Quad, 
                        Enum.EasingDirection.Out, 
                        0, 
                        false, 
                        0
                    }, {
                        Contrast = 0, 
                        Saturation = 0
                    });
                    _G.destroy(v130, 0.25);
                    local l_magnitude_0 = (l_CFrame_0.p - v129.Position).magnitude;
                    local v132 = {
                        cf = v129, 
                        mag = l_magnitude_0, 
                        old = l_CFrame_0
                    };
                    spawn(function() --[[ Line: 461 ]]
                        -- upvalues: l_Character_4 (copy), v132 (copy)
                        _G.PlayEffect("SonSon", nil, l_Character_4, v132);
                    end);
                    if v120 then
                        v120:FireServer(v132);
                    end;
                end;
                task.wait(1.2);
                l_Character_4.HumanoidRootPart.Anchored = false;
                l_Character_4.Humanoid.WalkSpeed = 16;
                _G.canuse = true;
                _G.keysetup:cooldown("Shishi Sonson", l_cd_4);
                require(script.Parent.SwordStyleSwapping):matchCooldowns(l_Cooldowns_4);
                _G.fw(l_cd_4);
                l_Cooldowns_4["Shishi Sonson"] = false;
            end;
        end;
    end;
end;
v10.SwordStyleSwap = function(v133, _) --[[ Line: 482 ]] --[[ Name: SwordStyleSwap ]]
    require(script.Parent.SwordStyleSwapping):swap(v133);
end;
return v10;