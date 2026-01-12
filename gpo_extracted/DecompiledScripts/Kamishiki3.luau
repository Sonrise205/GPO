local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("RunService");
local v2 = require(game.ReplicatedStorage.Modules.Skills);
local v3 = require(script.Parent.Parent.MobileBase);
local _ = require(l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule"));
local _ = l_LocalPlayer_0:GetMouse();
local v6 = setmetatable({}, v3);
v6.__index = v6;
v6.new = function(_) --[[ Line: 17 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v6 (copy)
    local v8 = setmetatable(v3.new(script.Name), v6);
    v8.Cooldowns = {
        shiganBarrage = false, 
        counter = false, 
        Tekkai = false, 
        Rank = false, 
        InstantSoru = false, 
        Rokuogan = false
    };
    return v8;
end;
local v9 = require(game.ReplicatedStorage.Modules.RotatedRegion3);
local function _(v10, v11, v12) --[[ Line: 27 ]] --[[ Name: getinregion ]]
    -- upvalues: v9 (copy)
    return (v9.new(v11, v12):FindPartsInRegion3WithWhiteList(_G.getTargets(v10), 500));
end;
v6.ShiganBarrage = function(v14, v15) --[[ Line: 33 ]] --[[ Name: ShiganBarrage ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_0 = v14.Cooldowns;
    local v17 = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_0 = l_LocalPlayer_0.Character;
    if l_Cooldowns_0.shiganBarrage == false and _G.check:inspect(l_Character_0) == true then
        local v19 = v2.GetM("Shigan Barrage");
        local l_cd_0 = v19.cd;
        if _G.StamCheck("Shigan Barrage") == false then
            return;
        elseif v19.statreq and _G.MeetReq(v19.statreq) == false then
            return;
        else
            l_Cooldowns_0.shiganBarrage = true;
            _G.canuse = false;
            l_Character_0.Humanoid.WalkSpeed = 4;
            local v21 = l_Character_0.Humanoid.Animator:LoadAnimation(script.fingerBarrage);
            v21:Play();
            v21:AdjustWeight(2);
            v21:AdjustSpeed(1.5);
            v21.Priority = Enum.AnimationPriority.Action4;
            local v22 = game.ReplicatedStorage.Events.Skill:InvokeServer("Shigan Barrage", {
                cf = l_Character_0.HumanoidRootPart.CFrame
            });
            local v23 = tick();
            v14:ChargeSkill(v15, {
                Key = Enum.KeyCode.E, 
                EndFunction = function() --[[ Line: 62 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_0 (copy), v14 (copy), v22 (copy), v23 (copy), v17 (copy)
                    l_Character_0.Humanoid.WalkSpeed = 4;
                    _G.canuse = false;
                    if v14.Tool.Parent ~= l_Character_0 or l_Character_0:FindFirstChild("Stun") or v22 == nil or tick() - v23 >= 2 or _G.check:inspect(l_Character_0) == false or v17.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end, 
                IgnoreInstantCastSetting = true
            });
            v21:Stop();
            if v22 then
                v22:FireServer();
            end;
            task.wait(0.3);
            l_Character_0.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Shigan Barrage", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.shiganBarrage = false;
        end;
    end;
end;
v6.CounterKick = function(v24, _) --[[ Line: 91 ]] --[[ Name: CounterKick ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_1 = v24.Cooldowns;
    local _ = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_1 = l_LocalPlayer_0.Character;
    if l_Cooldowns_1.counter == false and _G.check:inspect(l_Character_1) == true then
        local v29 = v2.GetM("Counter Kick");
        local l_cd_1 = v29.cd;
        if _G.StamCheck("Counter Kick") == false then
            return;
        elseif v29.statreq and _G.MeetReq(v29.statreq) == false then
            return;
        else
            l_Cooldowns_1.counter = true;
            _G.canuse = false;
            l_Character_1.Humanoid.WalkSpeed = 4;
            local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Counter Kick", l_Character_1.HumanoidRootPart.CFrame);
            l_Character_1.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Counter Kick", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1.counter = false;
        end;
    end;
end;
v6.AbsoluteTekkai = function(v32, v33) --[[ Line: 121 ]] --[[ Name: AbsoluteTekkai ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_2 = v32.Cooldowns;
    local v35 = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_2 = l_LocalPlayer_0.Character;
    if l_Cooldowns_2.Tekkai == false and _G.check:inspect(l_Character_2) == true and _G.StamCheck("Absolute Tekkai") == true then
        local v37 = v2.GetM("Absolute Tekkai");
        local l_cd_2 = v37.cd;
        if v37.stamreq and v35.Stamina.Value < v37.stamreq then
            return;
        elseif v37.statreq and _G.MeetReq(v37.statreq) == false then
            return;
        else
            l_Cooldowns_2.Tekkai = true;
            _G.canuse = false;
            game.ReplicatedStorage.Events.StamRequest:InvokeServer("Absolute Tekkai");
            local v39 = l_Character_2.Humanoid:LoadAnimation(script.tekkai);
            v39:Play();
            v39.Priority = Enum.AnimationPriority.Action2;
            local v40 = Instance.new("BodyVelocity", l_Character_2.HumanoidRootPart);
            v40.MaxForce = Vector3.new(99999997952, 0, 99999997952, 0);
            v40.Velocity = Vector3.new(0, 0, 0, 0);
            _G.PauseAnim(v39, 0.85, 2, function() --[[ Line: 146 ]]

            end);
            v39:AdjustSpeed(0);
            v39.TimePosition = 0.85;
            local v41 = game.ReplicatedStorage.Events.Skill:InvokeServer("Absolute Tekkai", l_Character_2.PrimaryPart.CFrame);
            if v41 then
                local v42 = l_Character_2:WaitForChild("Blocking", 3);
                local v43 = game.ReplicatedStorage.Util.Melee.BlockGui:Clone();
                v43.Parent = l_Character_2.HumanoidRootPart;
                local v44 = false;
                local v45 = nil;
                do
                    local l_v44_0 = v44;
                    local function v48() --[[ Line: 162 ]] --[[ Name: endFunction ]]
                        -- upvalues: v42 (copy), v43 (copy), l_Character_2 (copy), v32 (copy), v35 (copy), v41 (copy), l_v44_0 (ref)
                        pcall(function() --[[ Line: 163 ]]
                            -- upvalues: v42 (ref), v43 (ref)
                            local v47 = v42.Value / v42.MaxValue;
                            v43.ImageLabel.Frame.Position = UDim2.new(0, 0, 1 - v47, 0);
                            v43.ImageLabel.Frame.Size = UDim2.new(1, 0, v47, 0);
                            _G.canuse = false;
                            v43.ImageLabel.Frame.ImageLabel.Size = UDim2.new(1, 0, 1 / v47, 0);
                            v43.ImageLabel.Frame.ImageLabel.Position = UDim2.new(0, 0, -(v43.ImageLabel.Frame.Position.Y.Scale / v43.ImageLabel.Frame.Size.Y.Scale), 0);
                        end);
                        l_Character_2.Humanoid.WalkSpeed = 0;
                        if v32.Tool and v32.Tool.Parent ~= l_Character_2 or v42 and (v42.Value <= 0 or v42.Parent == nil) or v35.Stamina.Value <= 0 or v41 == nil or l_v44_0 == true then
                            return true;
                        else
                            return;
                        end;
                    end;
                    task.delay(0.5, function() --[[ Line: 179 ]]
                        -- upvalues: l_v44_0 (ref), v32 (copy), v33 (copy), v41 (copy), l_Character_2 (copy)
                        if l_v44_0 == false then
                            v32:DoubleCastSkill(v33, {
                                Key = Enum.KeyCode.Q, 
                                SkipTap = true, 
                                CompleteFunction = function() --[[ Line: 196 ]] --[[ Name: CompleteFunction ]]
                                    -- upvalues: l_v44_0 (ref), v41 (ref), l_Character_2 (ref)
                                    if l_v44_0 == true then
                                        return;
                                    else
                                        v41:FireServer("dash", l_Character_2.PrimaryPart.CFrame);
                                        l_v44_0 = true;
                                        l_Character_2.Humanoid.WalkSpeed = 16;
                                        return;
                                    end;
                                end, 
                                CheckFunction = function() --[[ Line: 204 ]] --[[ Name: CheckFunction ]]
                                    -- upvalues: l_v44_0 (ref)
                                    if l_v44_0 == true then
                                        return true;
                                    else
                                        return;
                                    end;
                                end, 
                                PassFunction = function() --[[ Line: 209 ]] --[[ Name: PassFunction ]]
                                    -- upvalues: v41 (ref)
                                    return v41;
                                end
                            });
                        end;
                    end);
                    v32:ChargeSkill(v33, {
                        Key = Enum.KeyCode.R, 
                        EndFunction = v48, 
                        IgnoreInstantCastSetting = true
                    });
                    v43:Destroy();
                    l_v44_0 = true;
                    if v45 then
                        v45:Disconnect();
                        v45 = nil;
                    end;
                end;
            end;
            if v41 then
                v41:FireServer();
            end;
            v40:Destroy();
            l_Character_2.Humanoid.WalkSpeed = 16;
            v39:Stop();
            _G.canuse = true;
            _G.keysetup:cooldown("Absolute Tekkai", l_cd_2);
            _G.fw(l_cd_2);
            l_Cooldowns_2.Tekkai = false;
        end;
    end;
end;
v6.InstantSoru = function(v49, _) --[[ Line: 247 ]] --[[ Name: InstantSoru ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_3 = v49.Cooldowns;
    local v52 = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_3 = l_LocalPlayer_0.Character;
    if l_Cooldowns_3.InstantSoru == false and _G.check:inspect(l_Character_3) == true and _G.StamCheck("Instant Soru") == true then
        local v54 = v2.GetM("Instant Soru");
        local l_cd_3 = v54.cd;
        if v54.stamreq and v52.Stamina.Value < v54.stamreq then
            return;
        elseif v54.statreq and _G.MeetReq(v54.statreq) == false then
            return;
        else
            l_Cooldowns_3.InstantSoru = true;
            _G.canuse = false;
            local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Instant Soru", v49:GetMouseCFrame());
            _G.canuse = true;
            _G.keysetup:cooldown("Instant Soru", l_cd_3);
            _G.fw(l_cd_3);
            l_Cooldowns_3.InstantSoru = false;
        end;
    end;
end;
v6.TrueRankakyu = function(v57, v58) --[[ Line: 273 ]] --[[ Name: TrueRankakyu ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_4 = v57.Cooldowns;
    local v60 = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_4 = l_LocalPlayer_0.Character;
    if l_Cooldowns_4.Rank == false and _G.check:inspect(l_Character_4) == true and _G.StamCheck("True Rankakyu") == true then
        local v62 = v2.GetM("True Rankakyu");
        local l_cd_4 = v62.cd;
        if v62.stamreq and v60.Stamina.Value < v62.stamreq then
            return;
        elseif v62.statreq and _G.MeetReq(v62.statreq) == false then
            return;
        else
            l_Cooldowns_4.Rank = true;
            _G.canuse = false;
            local v64 = l_Character_4.Humanoid:LoadAnimation(script.rank);
            v64:Play();
            local v65 = game.ReplicatedStorage.Events.Skill:InvokeServer("True Rankakyu");
            _G.FaceMouse = true;
            _G.PauseAnim(v64, 0, 1);
            local v66 = tick();
            local v67 = false;
            do
                local l_v67_0 = v67;
                local function v69() --[[ Line: 303 ]] --[[ Name: checkFunction ]]
                    -- upvalues: v66 (copy), l_v67_0 (ref), v65 (copy)
                    _G.canuse = false;
                    if tick() - v66 >= 0.8695652173913044 and l_v67_0 == false then
                        l_v67_0 = true;
                        if v65 then
                            v65:FireServer("charged");
                        end;
                    end;
                end;
                v57:ChargeSkill(v58, {
                    Key = Enum.KeyCode.Z, 
                    EndFunction = function() --[[ Line: 313 ]] --[[ Name: endFunction ]]
                        -- upvalues: v57 (copy), l_Character_4 (copy), v66 (copy)
                        if v57.Tool.Parent ~= l_Character_4 or tick() - v66 >= 5 or _G.check:inspect(l_Character_4) == false then
                            return true;
                        else
                            return;
                        end;
                    end, 
                    CheckFunction = v69, 
                    IgnoreInstantCastSetting = true
                });
                v64:AdjustSpeed(1.5);
                task.wait(0.1);
                if v65 then
                    local v70 = tick();
                    while v65:IsDescendantOf(game) ~= false do
                        v65:FireServer(v57:GetMouseCFrame().p);
                        task.wait();
                        if tick() - v70 >= 1.5 then
                            break;
                        end;
                    end;
                end;
                _G.FaceMouse = false;
                l_Character_4.HumanoidRootPart.Anchored = true;
                task.wait(0.5);
                l_Character_4.HumanoidRootPart.Anchored = false;
                _G.canuse = true;
                _G.keysetup:cooldown("True Rankakyu", l_cd_4);
                _G.fw(l_cd_4);
                l_Cooldowns_4.Rank = false;
            end;
        end;
    end;
end;
v6.TrueRokuogan = function(v71, v72) --[[ Line: 349 ]] --[[ Name: TrueRokuogan ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_5 = v71.Cooldowns;
    local _ = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_5 = l_LocalPlayer_0.Character;
    if l_Cooldowns_5.Rokuogan == false and _G.check:inspect(l_Character_5) == true then
        local v76 = v2.GetM("True Rokuogan");
        local l_cd_5 = v76.cd;
        if _G.StamCheck("True Rokuogan") == false then
            return;
        elseif v76.statreq and _G.MeetReq(v76.statreq) == false then
            return;
        else
            l_Cooldowns_5.Rokuogan = true;
            _G.canuse = false;
            _G.FaceMouse = true;
            local v78 = tick();
            local v79 = game.ReplicatedStorage.Events.Skill:InvokeServer("True Rokuogan", {
                cf = l_Character_5.HumanoidRootPart.CFrame
            });
            local v80 = l_Character_5.Humanoid:LoadAnimation(script.rokuogan);
            v80:Play();
            v80:AdjustWeight(5);
            _G.PauseAnim(v80, 0.38, 1);
            local function _() --[[ Line: 380 ]] --[[ Name: checkFunction ]]
                -- upvalues: l_Character_5 (copy)
                l_Character_5.Humanoid.WalkSpeed = 4;
                _G.canuse = false;
            end;
            v71:ChargeSkill(v72, {
                Key = Enum.KeyCode.C, 
                EndFunction = function() --[[ Line: 385 ]] --[[ Name: endFunction ]]
                    -- upvalues: v71 (copy), l_Character_5 (copy), v79 (copy), v78 (copy)
                    if v71.Tool.Parent ~= l_Character_5 or v79 == nil or tick() - v78 >= 2 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v80:AdjustSpeed(1);
            task.wait(0.1);
            _G.FaceMouse = false;
            if v79 then
                v79:InvokeServer(v71:GetMouseCFrame());
            end;
            _G.canuse = true;
            _G.keysetup:cooldown("True Rokuogan", l_cd_5);
            _G.fw(l_cd_5);
            l_Cooldowns_5.Rokuogan = false;
        end;
    end;
end;
return v6;