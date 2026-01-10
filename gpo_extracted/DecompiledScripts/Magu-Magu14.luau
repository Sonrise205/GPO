local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v3 = require(game.ReplicatedStorage.Modules.Skills);
local v4 = require(script.Parent.Parent.MobileBase);
local l_PlayerModule_0 = require(l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule"));
local _ = l_LocalPlayer_0:GetMouse();
local v7 = {};
local function v16(v8, v9) --[[ Line: 16 ]] --[[ Name: trans ]]
    -- upvalues: v7 (ref)
    if v8 == true then
        local l_v9_Descendants_0 = v9:GetDescendants();
        local v11 = _G.getAccessorys(v9);
        for v12 = 1, #v11 do
            table.insert(l_v9_Descendants_0, v11[v12]);
        end;
        for v13 = 1, #l_v9_Descendants_0 do
            if (l_v9_Descendants_0[v13]:IsA("BasePart") or l_v9_Descendants_0[v13]:IsA("Decal")) and l_v9_Descendants_0[v13].Transparency ~= 1 then
                v7[l_v9_Descendants_0[v13]] = l_v9_Descendants_0[v13].Transparency;
                l_v9_Descendants_0[v13].Transparency = 1;
            end;
        end;
        return;
    else
        for v14, v15 in v7 do
            if v14 then
                v14.Transparency = v15;
            end;
        end;
        v7 = {};
        return;
    end;
end;
local v17 = setmetatable({}, v4);
v17.__index = v17;
v17.new = function(_) --[[ Line: 42 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v17 (copy)
    local v19 = setmetatable(v4.new(script.Name), v17);
    v19.Cooldowns = {
        Fist = false, 
        Rain = false, 
        Swam = false, 
        Hound = false, 
        Smash = false, 
        Swamp = false
    };
    return v19;
end;
v17.MagmaFist = function(v20, v21) --[[ Line: 57 ]] --[[ Name: MagmaFist ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), l_LocalPlayer_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v20.Cooldowns;
    local v23 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_0 = l_LocalPlayer_0.Character;
    if l_Cooldowns_0.Fist == false and _G.check:inspect(l_Character_0) == true and _G.StamCheck("Magma Fist") == true then
        local v25 = v3.GetM("Magma Fist");
        local l_cd_0 = v25.cd;
        if _G.StamCheck("Magma Fist") == false then
            return;
        elseif v25.statreq and _G.MeetReq(v25.statreq) == false then
            return;
        else
            l_Cooldowns_0.Fist = true;
            _G.canuse = false;
            local v27 = tick();
            local v28 = l_Character_0.Humanoid:LoadAnimation(script.fist);
            v28:Play();
            _G.moveFace = true;
            _G.FaceMouse = true;
            _G.PauseAnim(v28, 0.35, 1);
            local v29 = game.ReplicatedStorage.Events.Skill:InvokeServer("Magma Fist");
            v20:ChargeSkill(v21, {
                Key = Enum.KeyCode.Z, 
                IgnoreInstantCastSetting = true, 
                EndFunction = function() --[[ Line: 85 ]] --[[ Name: EndFunction ]]
                    -- upvalues: v27 (copy), l_Character_0 (copy), v23 (copy)
                    local v30 = true;
                    if tick() - v27 < 10 then
                        v30 = true;
                        if l_Character_0:FindFirstChild("Magu-Magu") ~= false then
                            v30 = true;
                            if l_Character_0.Parent ~= nil then
                                v30 = true;
                                if l_Character_0.Parent == workspace.PlayerCharacters then
                                    v30 = v23.Stamina.Value <= 0;
                                end;
                            end;
                        end;
                    end;
                    return v30;
                end
            });
            _G.FaceMouse = false;
            v28:AdjustSpeed(1);
            l_Character_0.HumanoidRootPart.Anchored = true;
            task.wait(0.3);
            if v29 then
                task.spawn(function() --[[ Line: 95 ]]
                    -- upvalues: v29 (copy), l_Character_0 (copy)
                    v29:InvokeServer(l_Character_0.HumanoidRootPart.CFrame);
                end);
            end;
            task.wait(0.2);
            l_Character_0.HumanoidRootPart.Anchored = false;
            task.wait(0.25);
            _G.moveFace = false;
            _G.canuse = true;
            _G.keysetup:cooldown("Magma Fist", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.Fist = false;
        end;
    end;
end;
v17.MagmaRain = function(v31, v32) --[[ Line: 111 ]] --[[ Name: MagmaRain ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), l_LocalPlayer_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v31.Cooldowns;
    local v34 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_1 = l_LocalPlayer_0.Character;
    if l_Cooldowns_1.Rain == false and _G.check:inspect(l_Character_1) == true and _G.StamCheck("Magma Rain") == true then
        local v36 = v3.GetM("Magma Rain");
        local l_cd_1 = v36.cd;
        if _G.StamCheck("Magma Rain") == false then
            return;
        elseif v36.statreq and _G.MeetReq(v36.statreq) == false then
            return;
        else
            l_Cooldowns_1.Rain = true;
            _G.canuse = false;
            local v38 = nil;
            local v39 = nil;
            local v40 = tick();
            do
                local l_v38_0, l_v39_0 = v38, v39;
                pcall(function() --[[ Line: 131 ]]
                    -- upvalues: l_v38_0 (ref), l_v39_0 (ref)
                    local v43, v44 = unpack(game.ReplicatedStorage.Events.Skill:InvokeServer("Magma Rain"));
                    l_v38_0 = v43;
                    l_v39_0 = v44;
                end);
                local v45 = l_Character_1.Humanoid:LoadAnimation(script.raincharge);
                v45:Play();
                _G.FaceMouse = true;
                _G.mouseLevel = true;
                task.wait(0.7);
                v45:Stop(0.25);
                local v46 = l_Character_1.Humanoid:LoadAnimation(script.rainloop);
                v46:Play();
                v31:ChargeSkill(v32, {
                    Key = Enum.KeyCode.C, 
                    CheckFunction = function() --[[ Line: 155 ]] --[[ Name: CheckFunction ]]
                        -- upvalues: l_v39_0 (ref), v31 (copy)
                        _G.canuse = false;
                        if l_v39_0 then
                            l_v39_0:FireServer(v31:GetMouseCFrame().p);
                        end;
                    end, 
                    EndFunction = function() --[[ Line: 162 ]] --[[ Name: EndFunction ]]
                        -- upvalues: v40 (copy), l_v38_0 (ref), l_Character_1 (copy), v34 (copy)
                        local v47 = true;
                        if tick() - v40 < 10 then
                            v47 = true;
                            if l_v38_0 ~= nil then
                                v47 = true;
                                if l_Character_1:FindFirstChild("Magu-Magu") ~= false then
                                    v47 = true;
                                    if l_Character_1.Parent ~= nil then
                                        v47 = true;
                                        if l_Character_1.Parent == workspace.PlayerCharacters then
                                            v47 = v34.Stamina.Value <= 0;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                        return v47;
                    end, 
                    IgnoreInstantCastSetting = true
                });
                v46:Stop(0.25);
                l_Character_1.HumanoidRootPart.Anchored = false;
                _G.FaceMouse = false;
                _G.mouseLevel = nil;
                _G.canuse = true;
                if l_v38_0 then
                    task.spawn(function() --[[ Line: 176 ]]
                        -- upvalues: l_v38_0 (ref)
                        l_v38_0:InvokeServer();
                    end);
                end;
                task.wait(0.25);
                _G.keysetup:cooldown("Magma Rain", l_cd_1);
                _G.fw(l_cd_1);
                l_Cooldowns_1.Rain = false;
            end;
        end;
    end;
end;
v17.MagmaHound = function(v48, v49) --[[ Line: 188 ]] --[[ Name: MagmaHound ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_2 = v48.Cooldowns;
    local l_Character_2 = l_LocalPlayer_0.Character;
    local v52 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_2.Hound == false and _G.check:inspect(l_Character_2) == true and _G.StamCheck("Magma Hound") == true then
        local v53 = v3.GetM("Magma Hound");
        local l_cd_2 = v53.cd;
        if _G.StamCheck("Magma Hound") == false then
            return;
        elseif v53.statreq and _G.MeetReq(v53.statreq) == false then
            return;
        else
            l_Cooldowns_2.Hound = true;
            _G.canuse = false;
            local v55 = l_Character_2.Humanoid:LoadAnimation(script.hound);
            v55:Play();
            _G.moveFace = true;
            _G.FaceMouse = true;
            _G.PauseAnim(v55, 0.4, 1);
            local v56 = tick();
            local v57 = game.ReplicatedStorage.Events.Skill:InvokeServer("Magma Hound");
            v48:ChargeSkill(v49, {
                Key = Enum.KeyCode.X, 
                EndFunction = function() --[[ Line: 223 ]] --[[ Name: EndFunction ]]
                    -- upvalues: v52 (copy), v56 (copy)
                    local v58 = true;
                    if v52.Stamina.Value > 0 then
                        v58 = tick() - v56 >= 10;
                    end;
                    return v58;
                end
            });
            l_Character_2.HumanoidRootPart.Anchored = true;
            v55:AdjustSpeed(1);
            _G.FaceMouse = false;
            task.wait(0.25);
            if v57 then
                task.spawn(function() --[[ Line: 234 ]]
                    -- upvalues: v57 (copy), l_Character_2 (copy)
                    v57:InvokeServer(l_Character_2.HumanoidRootPart.CFrame);
                end);
            end;
            task.wait(0.5);
            _G.canuse = true;
            l_Character_2.HumanoidRootPart.Anchored = false;
            _G.keysetup:cooldown("Magma Hound", l_cd_2);
            _G.fw(l_cd_2);
            l_Cooldowns_2.Hound = false;
        end;
    end;
end;
v17.MagmaEruption = function(v59, v60) --[[ Line: 247 ]] --[[ Name: MagmaEruption ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_3 = v59.Cooldowns;
    local l_Character_3 = l_LocalPlayer_0.Character;
    local v63 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_3.Smash == false and _G.check:inspect(l_Character_3) == true and _G.StamCheck("Magma Eruption") == true then
        local v64 = v3.GetM("Magma Eruption");
        local l_cd_3 = v64.cd;
        if _G.StamCheck("Magma Eruption") == false then
            return;
        elseif v64.statreq and _G.MeetReq(v64.statreq) == false then
            return;
        else
            l_Cooldowns_3.Smash = true;
            _G.canuse = false;
            local v66 = l_Character_3.Humanoid:LoadAnimation(script.Smash);
            v66:Play();
            v66:AdjustWeight(2);
            l_Character_3.Humanoid.WalkSpeed = 4;
            local v67 = game.ReplicatedStorage.Events.Skill:InvokeServer("Magma Eruption", {
                cf = l_Character_3.LeftFoot.CFrame
            });
            _G.PauseAnim(v66, 0.4, 2);
            v59:ChargeSkill(v60, {
                Key = Enum.KeyCode.R, 
                EndFunction = function() --[[ Line: 279 ]] --[[ Name: EndFunction ]]
                    -- upvalues: l_Character_3 (copy), v63 (copy)
                    _G.canuse = false;
                    l_Character_3.Humanoid.WalkSpeed = 4;
                    return v63.Stamina.Value <= 0;
                end
            });
            l_Character_3.Humanoid.WalkSpeed = 0;
            v66:AdjustSpeed(2);
            task.wait(0.25);
            if v67 then
                v67:FireServer(l_Character_3.LeftFoot.CFrame);
            end;
            task.wait(0.25);
            l_Character_3.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Magma Eruption", l_cd_3);
            _G.fw(l_cd_3);
            l_Cooldowns_3.Smash = false;
        end;
    end;
end;
v17.MagmaSwamp = function(v68, v69) --[[ Line: 302 ]] --[[ Name: MagmaSwamp ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), l_LocalPlayer_0 (copy), v3 (copy), v16 (copy), l_PlayerModule_0 (copy)
    local l_Cooldowns_4 = v68.Cooldowns;
    local v71 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_4 = l_LocalPlayer_0.Character;
    if l_Cooldowns_4.Swamp == false and _G.check:inspect(l_Character_4) == true and _G.StamCheck("Magma Swamp") == true then
        local v73 = v3.GetM("Magma Swamp");
        local l_cd_4 = v73.cd;
        if _G.StamCheck("Magma Swamp") == false then
            return;
        elseif v73.statreq and _G.MeetReq(v73.statreq) == false then
            return;
        else
            local v75 = CFrame.new(l_Character_4.HumanoidRootPart.Position);
            local v76 = Ray.new(v75.p, v75.UpVector * -l_Character_4.Humanoid.HipHeight * 2);
            local v77, _, _ = _G.raycastWhitelist(v76, {
                workspace.Islands, 
                workspace.Ships, 
                workspace.Env
            });
            if v77 == nil then
                return;
            else
                _G.canuse = false;
                local v80 = _G.clientimpacts[game.ReplicatedStorage.ClientImpacts.MagmaPool];
                l_Cooldowns_4.Swamp = true;
                local v81 = l_Character_4.Humanoid:LoadAnimation(script.swamp);
                v81:Play();
                l_Character_4.HumanoidRootPart.Anchored = true;
                _G.canuse = false;
                task.wait(0.7);
                local l_Root_0 = l_Character_4.LowerTorso.Root;
                local l_C0_0 = l_Root_0.C0;
                _G.tween(l_Root_0, {
                    0.1, 
                    "Linear", 
                    Enum.EasingDirection.In, 
                    0, 
                    false, 
                    0
                }, {
                    C0 = l_C0_0 * CFrame.new(0, -l_Character_4.Humanoid.HipHeight * 4, 0)
                });
                local v84 = nil;
                local v85 = nil;
                do
                    local l_v84_0, l_v85_0 = v84, v85;
                    pcall(function() --[[ Line: 335 ]]
                        -- upvalues: l_v84_0 (ref), l_v85_0 (ref)
                        local v88, v89 = unpack(game.ReplicatedStorage.Events.Skill:InvokeServer("Magma Swamp"));
                        l_v84_0 = v88;
                        l_v85_0 = v89;
                    end);
                    task.wait(0.1);
                    v16(true, l_Character_4);
                    local l_CurrentCamera_0 = workspace.CurrentCamera;
                    local v91 = 0;
                    v80:start(l_Character_4.HumanoidRootPart.CFrame);
                    l_Root_0.C0 = l_C0_0;
                    task.wait(0.1);
                    l_Character_4.HumanoidRootPart.Anchored = false;
                    local v92 = 0;
                    local v93 = tick();
                    v68:ChargeSkill(v69, {
                        Button = v69, 
                        Key = Enum.KeyCode.E, 
                        IgnoreInstantCastSetting = true, 
                        PCInputType = "Default", 
                        MobileInputType = "Toggle", 
                        RunServiceType = game["Run Service"].RenderStepped, 
                        CheckFunction = function(v94) --[[ Line: 363 ]] --[[ Name: CheckFunction ]]
                            -- upvalues: l_Character_4 (copy), l_PlayerModule_0 (ref), l_CurrentCamera_0 (copy), v91 (ref), l_v85_0 (ref), v80 (copy), v92 (ref)
                            l_Character_4.Humanoid.Jump = false;
                            l_Character_4.Humanoid.WalkSpeed = 0;
                            local _ = tick();
                            local v96 = CFrame.new(0, 0, 0) * CFrame.new(-l_PlayerModule_0:GetControls():GetMoveVector() * (400 * v94));
                            local v97 = CFrame.new(l_Character_4.HumanoidRootPart.Position, (Vector3.new(l_CurrentCamera_0.CFrame.X, l_Character_4.HumanoidRootPart.Position.Y, l_CurrentCamera_0.CFrame.Z))) * v96 * CFrame.Angles(0, 3.141592653589793, 0);
                            v97 = CFrame.new(v97.p, l_Character_4.HumanoidRootPart.Position + l_Character_4.Humanoid.MoveDirection) * CFrame.Angles(0, 3.141592653589793, 0);
                            local l_CFrame_0 = l_Character_4.HumanoidRootPart.CFrame;
                            local v99 = Ray.new(l_CFrame_0.p, (l_CFrame_0.p - v97.p).magnitude * -(l_CFrame_0.p - v97.p).unit);
                            local v100, _, _ = _G.raycastWhitelist(v99, {
                                workspace.Islands, 
                                workspace.Ships, 
                                workspace.Env
                            });
                            if (v100 == nil or v100 and v100.CanCollide == false) and l_Character_4.Humanoid.MoveDirection ~= Vector3.new(0, 0, 0, 0) then
                                l_Character_4.HumanoidRootPart.CFrame = l_Character_4.HumanoidRootPart.CFrame:Lerp(v97, 0.1);
                            end;
                            if tick() - v91 >= 0.05 and l_v85_0 then
                                v80:start(l_Character_4.HumanoidRootPart.CFrame);
                                l_v85_0:FireServer(l_Character_4.HumanoidRootPart.CFrame);
                                v91 = tick();
                            end;
                            v92 = tick();
                            _G.canuse = false;
                        end, 
                        EndFunction = function() --[[ Line: 389 ]] --[[ Name: EndFunction ]]
                            -- upvalues: l_Character_4 (copy), v71 (copy), l_v85_0 (ref), l_v84_0 (ref), v93 (copy)
                            local v103 = CFrame.new(l_Character_4.HumanoidRootPart.Position);
                            local v104 = Ray.new(v103.p, v103.UpVector * -(l_Character_4.Humanoid.HipHeight * 2 + 2));
                            local v105, _, _ = _G.raycastWhitelist(v104, {
                                workspace.Islands, 
                                workspace.Ships, 
                                workspace.Env
                            });
                            if v105 == nil or l_Character_4:FindFirstChild("PB") then
                                return true;
                            else
                                local v108 = true;
                                if v71.Stamina.Value > 0 then
                                    v108 = true;
                                    if l_v85_0 ~= nil then
                                        v108 = true;
                                        if l_v84_0 ~= nil then
                                            v108 = true;
                                            if l_Character_4.Parent ~= workspace.Ragdolls then
                                                v108 = tick() - v93 >= 10;
                                            end;
                                        end;
                                    end;
                                end;
                                return v108;
                            end;
                        end
                    });
                    l_Character_4.Humanoid.WalkSpeed = 16;
                    v81:Stop();
                    l_Root_0.C0 = l_C0_0 * CFrame.new(0, -l_Character_4.Humanoid.HipHeight * 2, 0);
                    l_Character_4.HumanoidRootPart.Anchored = true;
                    l_Character_4.Humanoid:LoadAnimation(script.swampup):Play();
                    _G.tween(l_Root_0, {
                        0.25, 
                        "Quad", 
                        Enum.EasingDirection.Out, 
                        0, 
                        false, 
                        0
                    }, {
                        C0 = l_C0_0
                    });
                    v16(false, l_Character_4);
                    task.wait(0.255);
                    if l_v84_0 then
                        task.spawn(function() --[[ Line: 414 ]]
                            -- upvalues: l_v84_0 (ref)
                            l_v84_0:InvokeServer();
                        end);
                    end;
                    task.wait(0.25);
                    task.wait(0.5);
                    _G.canuse = true;
                    l_Character_4.HumanoidRootPart.Anchored = false;
                    _G.keysetup:cooldown("Magma Swamp", l_cd_4);
                    _G.fw(l_cd_4);
                    l_Cooldowns_4.Swamp = false;
                end;
            end;
        end;
    end;
end;
return v17;