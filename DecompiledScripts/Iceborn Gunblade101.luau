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
        pull = false, 
        bullet = false
    };
    v9.CurrentSwipe = 1;
    v9.doingSlash = false;
    return v9;
end;
v7.IceGunbladePull = function(v10, v11) --[[ Line: 29 ]] --[[ Name: IceGunbladePull ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v10.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local v14 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.pull == false and _G.check:inspect(l_Character_0) == true and _G.StamCheck("IceGunbladePull") == true then
        local v15 = v3.GetM("IceGunbladePull");
        local l_cd_0 = v15.cd;
        if _G.StamCheck("IceGunbladePull") == false then
            return;
        elseif v15.statreq and _G.MeetReq(v15.statreq) == false then
            return;
        else
            l_Cooldowns_0.pull = true;
            _G.canuse = false;
            l_Character_0.PrimaryPart.Anchored = true;
            l_Character_0.Humanoid.AutoRotate = false;
            l_Character_0:PivotTo(CFrame.new(l_Character_0.PrimaryPart.Position, v10:GetMouseCFrame().p));
            local v17 = l_Character_0.Humanoid:LoadAnimation(script.kurowindup);
            v17:Play();
            v17:AdjustSpeed(2);
            task.wait(0.2);
            local v18 = game.ReplicatedStorage.Events.Skill:InvokeServer("IceGunbladePull", l_Character_0.PrimaryPart.CFrame);
            v17:Stop();
            local v19 = l_Character_0.Humanoid:LoadAnimation(script.kuroloop);
            v19:Play();
            local v20 = tick();
            v10:ChargeSkill(v11, {
                Key = Enum.KeyCode.r, 
                CheckFunction = function() --[[ Line: 60 ]] --[[ Name: checkFunction ]]
                    -- upvalues: v18 (copy), l_Character_0 (copy)
                    if v18 == nil then
                        return true;
                    else
                        l_Character_0.Humanoid.AutoRotate = false;
                        return;
                    end;
                end, 
                EndFunction = function() --[[ Line: 68 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_0 (copy), v20 (copy), v14 (copy)
                    if not l_Character_0:FindFirstChild(script.Name) or tick() - v20 >= 2 or l_Character_0.Parent == nil or l_Character_0.Parent ~= workspace.PlayerCharacters or v14.Stamina.Value <= 0 or l_Character_0:FindFirstChild("PB") ~= nil then
                        return true;
                    else
                        return;
                    end;
                end, 
                IgnoreInstantCastSetting = true
            });
            _G.FaceMouse = false;
            if v18 then
                v18:FireServer(l_Character_0.PrimaryPart.CFrame);
            end;
            v19:AdjustSpeed(0);
            task.wait(0.75);
            l_Character_0.Humanoid.AutoRotate = true;
            v19:Stop(0.25);
            l_Character_0.PrimaryPart.Anchored = false;
            _G.keysetup:cooldown("IceGunbladePull", l_cd_0);
            _G.canuse = true;
            _G.fw(l_cd_0);
            l_Cooldowns_0.pull = false;
        end;
    end;
end;
v7.FrostBlast = function(v21, v22) --[[ Line: 101 ]] --[[ Name: FrostBlast ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v21.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local v25 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.pull == false and _G.check:inspect(l_Character_1) == true and _G.StamCheck("Frost Blast") == true then
        local v26 = v3.GetM("Frost Blast");
        local l_cd_1 = v26.cd;
        if _G.StamCheck("Frost Blast") == false then
            return;
        elseif v26.statreq and _G.MeetReq(v26.statreq) == false then
            return;
        else
            l_Cooldowns_1.pull = true;
            _G.canuse = false;
            _G.FaceMouse = true;
            local v28 = l_Character_1.Humanoid:LoadAnimation(script.gunBurstCharge);
            v28:Play();
            local v29 = game.ReplicatedStorage.Events.Skill:InvokeServer("Frost Blast");
            local v30 = tick();
            local function v31() --[[ Line: 129 ]] --[[ Name: checkFunction ]]
                -- upvalues: v29 (copy), l_Character_1 (copy)
                if v29 == nil then
                    return true;
                else
                    l_Character_1.Humanoid.AutoRotate = false;
                    return;
                end;
            end;
            local function v32() --[[ Line: 136 ]] --[[ Name: endFunction ]]
                -- upvalues: l_Character_1 (copy), v30 (copy), v25 (copy)
                if not l_Character_1:FindFirstChild(script.Name) or tick() - v30 >= 3 or _G.check:inspect(l_Character_1) == false or l_Character_1.Parent == nil or l_Character_1.Parent ~= workspace.PlayerCharacters or v25.Stamina.Value <= 0 or l_Character_1:FindFirstChild("PB") ~= nil then
                    return true;
                else
                    return;
                end;
            end;
            local l_l_Character_1_FirstChild_0 = l_Character_1:FindFirstChild(script.Name .. "Sword");
            v21:ChargeSkill(v22, {
                Key = Enum.KeyCode.R, 
                CheckFunction = v31, 
                EndFunction = v32, 
                IgnoreInstantCastSetting = true, 
                HoldDuration = 0.2
            });
            _G.FaceMouse = false;
            l_Character_1.PrimaryPart.Anchored = true;
            local l_CFrame_0 = l_Character_1.PrimaryPart.CFrame;
            if l_l_Character_1_FirstChild_0 then
                local l_Muzzle_0 = l_l_Character_1_FirstChild_0:FindFirstChild("Muzzle");
                if l_Muzzle_0 then
                    l_CFrame_0 = l_Muzzle_0.CFrame;
                end;
            end;
            if v29 then
                v29:InvokeServer(l_Character_1.PrimaryPart.CFrame, l_CFrame_0);
                task.wait(0.05);
            end;
            v28:Stop();
            local v36 = l_Character_1.Humanoid:LoadAnimation(script.gunBurstShoot);
            v36:Play();
            v36:AdjustSpeed(1.25);
            task.wait(0.3);
            l_Character_1.PrimaryPart.Anchored = false;
            l_Character_1.Humanoid.AutoRotate = true;
            v36:Stop(0.25);
            l_Character_1.PrimaryPart.Anchored = false;
            _G.keysetup:cooldown("Frost Blast", l_cd_1);
            _G.canuse = true;
            _G.fw(l_cd_1);
            l_Cooldowns_1.pull = false;
        end;
    end;
end;
v7.FrostBullets = function(v37, v38) --[[ Line: 188 ]] --[[ Name: FrostBullets ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_2 = v37.Cooldowns;
    local l_Character_2 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_2.bullet == false and _G.check:inspect(l_Character_2) == true and _G.StamCheck("Frost Bullets") == true and v37.doingSlash == false then
        local v42 = v3.GetM("Frost Bullets");
        local l_cd_2 = v42.cd;
        if _G.StamCheck("Frost Bullets") == false then
            return;
        elseif v42.statreq and _G.MeetReq(v42.statreq) == false then
            return;
        else
            l_Cooldowns_2.bullet = true;
            _G.canuse = false;
            local v44 = game.ReplicatedStorage.Events.Skill:InvokeServer("Frost Bullets", l_Character_2.PrimaryPart.CFrame);
            local v45 = 1;
            local v46 = false;
            local v47 = nil;
            do
                local l_v45_0, l_v46_0, l_v47_0 = v45, v46, v47;
                local function v53() --[[ Line: 213 ]] --[[ Name: slash ]]
                    -- upvalues: v37 (copy), l_v46_0 (ref), l_v47_0 (ref), l_Character_2 (copy), l_v45_0 (ref), l_Cooldowns_2 (copy), v44 (copy)
                    _G.canuse = false;
                    v37.doingSlash = true;
                    l_v46_0 = true;
                    if l_v47_0 then
                        l_v47_0:Stop(0);
                    end;
                    local v51 = l_Character_2.Humanoid.Animator:LoadAnimation(script["shoot" .. l_v45_0]);
                    v51:Play(0);
                    v51:AdjustWeight(2);
                    v51.Priority = Enum.AnimationPriority.Action4;
                    l_v47_0 = v51;
                    l_Cooldowns_2.bullet = true;
                    l_Character_2.Humanoid.AutoRotate = false;
                    l_Character_2.PrimaryPart.CFrame = CFrame.new(l_Character_2.PrimaryPart.Position, v37:GetMouseCFrame().Position);
                    if v44 and v44:InvokeServer(v37:GetMouseCFrame(), workspace:GetServerTimeNow() + 0.275) == false then
                        l_v45_0 = l_v45_0 - 1;
                    end;
                    local v52 = false;
                    task.spawn(function() --[[ Line: 238 ]]
                        -- upvalues: v51 (copy), v52 (ref)
                        v51.Stopped:Wait();
                        v52 = true;
                    end);
                    task.delay(0.8, function() --[[ Line: 242 ]]
                        -- upvalues: v52 (ref)
                        v52 = true;
                    end);
                    repeat
                        task.wait();
                    until v52 == true;
                    l_Character_2.Humanoid.AutoRotate = true;
                    _G.canuse = true;
                    l_v46_0 = false;
                end;
                v53();
                local function v54() --[[ Line: 256 ]] --[[ Name: doShoot ]]
                    -- upvalues: v37 (copy), v38 (copy), l_v45_0 (ref), v53 (copy), l_cd_2 (copy), l_Cooldowns_2 (copy), v54 (copy), l_Character_2 (copy), l_v46_0 (ref)
                    v37:DoubleCastSkill(v38, {
                        Key = Enum.KeyCode.E, 
                        SkipTap = true, 
                        CompleteFunction = function() --[[ Line: 260 ]] --[[ Name: CompleteFunction ]]
                            -- upvalues: l_v45_0 (ref), v53 (ref), v37 (ref), l_cd_2 (ref), l_Cooldowns_2 (ref), v54 (ref)
                            l_v45_0 = l_v45_0 + 1;
                            v53();
                            if l_v45_0 >= 3 then
                                v37.doingSlash = false;
                                _G.canuse = true;
                                _G.keysetup:cooldown("Frost Bullets", l_cd_2);
                                _G.fw(l_cd_2);
                                l_Cooldowns_2.bullet = false;
                                return;
                            else
                                v54();
                                return;
                            end;
                        end, 
                        PassFunction = function() --[[ Line: 274 ]] --[[ Name: PassFunction ]]
                            -- upvalues: l_Character_2 (ref), l_v46_0 (ref)
                            task.wait();
                            return l_Character_2:FindFirstChild(script.Name) and l_v46_0 == false and _G.check:inspect(l_Character_2) == true and _G.canuse == true;
                        end
                    });
                end;
                v54();
                _G.keysetup:cooldown("Frost Bullets", l_cd_2);
                _G.canuse = true;
                _G.fw(l_cd_2);
                l_Cooldowns_2.bullet = false;
            end;
        end;
    end;
end;
return v7;