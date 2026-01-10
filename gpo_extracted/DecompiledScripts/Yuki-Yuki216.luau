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
        reform = false, 
        swipe = false, 
        storm = false, 
        frostbite = false, 
        turret = false, 
        blizzard = false
    };
    v9.CurrentSwipe = 1;
    return v9;
end;
v7.SnowReformation = function(v10, _) --[[ Line: 28 ]] --[[ Name: SnowReformation ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v10.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.reform == false and _G.check:inspect(l_Character_0) == true and _G.StamCheck("Snow Reformation") == true then
        local v15 = v3.GetM("Snow Reformation");
        local l_cd_0 = v15.cd;
        if _G.StamCheck("Snow Reformation") == false then
            return;
        elseif v15.statreq and _G.MeetReq(v15.statreq) == false then
            return;
        else
            l_Cooldowns_0.reform = true;
            _G.canuse = false;
            l_Character_0.PrimaryPart.Velocity = Vector3.new();
            local v17 = CFrame.new(l_Character_0.HumanoidRootPart.Position, v10:GetMouseCFrame().p);
            local v18 = Ray.new(v17.p, v17.LookVector * 100);
            local _, v20, _ = _G.raycastWhitelist(v18, {
                workspace.Islands, 
                workspace.Ships, 
                workspace.Env
            });
            local l_magnitude_0 = (l_Character_0.HumanoidRootPart.CFrame.p - v20).magnitude;
            local v23 = CFrame.new(l_Character_0.HumanoidRootPart.CFrame.p, v20) * CFrame.new(0, l_Character_0.Humanoid.HipHeight * 1.75, -l_magnitude_0);
            local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Snow Reformation", v23);
            local v25 = l_magnitude_0 / 75 / 1.5;
            task.wait(v25 + 0.75);
            l_Character_0.Humanoid.PlatformStand = false;
            _G.canuse = true;
            _G.keysetup:cooldown("Snow Reformation", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.reform = false;
        end;
    end;
end;
v7.SnowGust = function(v26, v27) --[[ Line: 65 ]] --[[ Name: SnowGust ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v26.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local v30 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.swipe == false and _G.check:inspect(l_Character_1) == true and _G.StamCheck("Snow Gust") == true then
        local v31 = v3.GetM("Snow Gust");
        local l_cd_1 = v31.cd;
        if _G.StamCheck("Snow Gust") == false then
            return;
        elseif v31.statreq and _G.MeetReq(v31.statreq) == false then
            return;
        else
            l_Cooldowns_1.swipe = true;
            local v33 = l_Character_1.Humanoid:LoadAnimation(script.swipe);
            v33:Play();
            v33:AdjustWeight(2);
            v33:AdjustSpeed(1);
            _G.FaceMouse = true;
            _G.canuse = false;
            local v34 = game.ReplicatedStorage.Events.Skill:InvokeServer("Snow Gust");
            _G.PauseAnim(v33, 0.3, 1.25);
            local v35 = tick();
            v26:ChargeSkill(v27, {
                Key = Enum.KeyCode.E, 
                CheckFunction = function() --[[ Line: 93 ]] --[[ Name: checkFunction ]]
                    -- upvalues: v34 (copy)
                    if v34 == nil then
                        return false;
                    else
                        return;
                    end;
                end, 
                EndFunction = function() --[[ Line: 99 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_1 (copy), v35 (copy), v30 (copy)
                    if not l_Character_1:FindFirstChild(script.Name) or tick() - v35 >= 10 or l_Character_1.Parent == nil or l_Character_1.Parent ~= workspace.PlayerCharacters or v30.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            l_Character_1.PrimaryPart.Anchored = true;
            _G.FaceMouse = false;
            v33:AdjustSpeed(2);
            task.wait(0.15);
            if v34 then
                v34:FireServer(l_Character_1.PrimaryPart.CFrame);
            end;
            task.wait(0.75);
            l_Character_1.PrimaryPart.Anchored = false;
            _G.keysetup:cooldown("Snow Gust", l_cd_1);
            _G.canuse = true;
            _G.fw(l_cd_1);
            l_Cooldowns_1.swipe = false;
        end;
    end;
end;
v7.SnowStorm = function(v36, v37) --[[ Line: 131 ]] --[[ Name: SnowStorm ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_2 = v36.Cooldowns;
    local l_Character_2 = l_LocalPlayer_0.Character;
    local v40 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_2.storm == false and _G.check:inspect(l_Character_2) == true and _G.StamCheck("Snow Storm") == true then
        local v41 = v3.GetM("Snow Storm");
        local l_cd_2 = v41.cd;
        if _G.StamCheck("Snow Storm") == false then
            return;
        elseif v41.statreq and _G.MeetReq(v41.statreq) == false then
            return;
        else
            l_Cooldowns_2.storm = true;
            _G.canuse = false;
            local v43 = l_Character_2.Humanoid:LoadAnimation(script.spin);
            v43:Play();
            v43:AdjustWeight(2);
            v43:AdjustSpeed(1);
            local l_BodyVelocity_0 = Instance.new("BodyVelocity");
            l_BodyVelocity_0.MaxForce = Vector3.new(1000000, 1000000, 1000000, 0);
            l_BodyVelocity_0.Velocity = l_Character_2.HumanoidRootPart.CFrame.lookVector * 25;
            l_BodyVelocity_0.Parent = l_Character_2.LowerTorso;
            local v45 = game.ReplicatedStorage.Events.Skill:InvokeServer("Snow Storm");
            task.wait(0.3);
            local v46 = tick();
            v36:ChargeSkill(v37, {
                Key = Enum.KeyCode.X, 
                CheckFunction = function() --[[ Line: 166 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_BodyVelocity_0 (copy), l_Character_2 (copy), v45 (copy)
                    l_BodyVelocity_0.Velocity = l_Character_2.HumanoidRootPart.CFrame.lookVector * 10;
                    l_Character_2.Humanoid.WalkSpeed = 8;
                    if v45 == nil then
                        return false;
                    else
                        return;
                    end;
                end, 
                EndFunction = function() --[[ Line: 175 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_2 (copy), v46 (copy), v40 (copy)
                    if not l_Character_2:FindFirstChild(script.Name) or tick() - v46 >= 4 or l_Character_2.Parent == nil or l_Character_2.Parent ~= workspace.PlayerCharacters or v40.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end, 
                IgnoreInstantCastSetting = true
            });
            if v45 then
                v45:FireServer(l_Character_2.PrimaryPart.CFrame);
            end;
            l_BodyVelocity_0.Velocity = Vector3.new();
            _G.destroy(l_BodyVelocity_0, 0.2);
            local v47 = l_Character_2.Humanoid:LoadAnimation(script.stormEnd);
            v47:Play();
            v47:AdjustWeight(2);
            v47:AdjustSpeed(1);
            l_Character_2.Humanoid.WalkSpeed = 16;
            task.wait(0.75);
            _G.keysetup:cooldown("Snow Storm", l_cd_2);
            _G.canuse = true;
            _G.fw(l_cd_2);
            l_Cooldowns_2.storm = false;
        end;
    end;
end;
v7.FrostBite = function(v48, _) --[[ Line: 209 ]] --[[ Name: FrostBite ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_3 = v48.Cooldowns;
    local l_Character_3 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_3.frostbite == false and _G.check:inspect(l_Character_3) == true and _G.StamCheck("Frost Bite") == true then
        local v53 = v3.GetM("Frost Bite");
        local l_cd_3 = v53.cd;
        if _G.StamCheck("Frost Bite") == false then
            return;
        elseif v53.statreq and _G.MeetReq(v53.statreq) == false then
            return;
        else
            l_Cooldowns_3.frostbite = true;
            _G.canuse = false;
            local v55 = l_Character_3.Humanoid:LoadAnimation(script.dashGrab);
            v55:Play(0);
            v55:AdjustWeight(2);
            l_Character_3.Humanoid.WalkSpeed = 4;
            task.wait(0.15);
            local v56 = game.ReplicatedStorage.Events.Skill:InvokeServer("Frost Bite", {
                cf = l_Character_3.HumanoidRootPart.CFrame
            });
            local _ = tick();
            v55:AdjustSpeed(1);
            task.wait(0.2);
            local v58 = Instance.new("BodyVelocity", l_Character_3.HumanoidRootPart);
            v58.MaxForce = Vector3.new(1000000, 1000000, 1000000, 0);
            v58.Velocity = l_Character_3.HumanoidRootPart.CFrame.lookVector * 75;
            _G.destroy(v58, 0.1);
            if v56 then
                v56:FireServer();
            end;
            do
                local l_v58_0 = v58;
                local function v61(v60) --[[ Line: 245 ]] --[[ Name: hitfound ]]
                    -- upvalues: l_v58_0 (ref), v56 (copy), l_Character_3 (copy)
                    l_v58_0:Destroy();
                    l_v58_0 = nil;
                    v56:FireServer(v60.Parent, l_Character_3.HumanoidRootPart.CFrame);
                end;
                _G.hitbox:start(l_Character_3, Vector3.new(8, 12, 12, 0), 0.5, CFrame.new(0, 0, -2), v61, nil);
                l_Character_3.Humanoid.WalkSpeed = 16;
                task.wait(0.4);
                _G.canuse = true;
                _G.keysetup:cooldown("Frost Bite", l_cd_3);
                _G.fw(l_cd_3);
                l_Cooldowns_3.frostbite = false;
            end;
        end;
    end;
end;
v7.SnowBunnyTurret = function(v62, _) --[[ Line: 260 ]] --[[ Name: SnowBunnyTurret ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_4 = v62.Cooldowns;
    local l_Character_4 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_4.turret == false and _G.check:inspect(l_Character_4) == true and _G.StamCheck("Snow Bunny Turret") == true then
        local v67 = v3.GetM("Snow Bunny Turret");
        local l_cd_4 = v67.cd;
        if _G.StamCheck("Snow Bunny Turret") == false then
            return;
        elseif v67.statreq and _G.MeetReq(v67.statreq) == false then
            return;
        else
            local v69, _, _ = _G.getRayFloor(l_Character_4.PrimaryPart.CFrame, 5);
            if v69 == nil then
                return nil;
            else
                l_Cooldowns_4.turret = true;
                _G.canuse = false;
                local v72 = l_Character_4.Humanoid:LoadAnimation(script.summonBunny);
                v72:Play(0);
                v72:AdjustWeight(2);
                l_Character_4.Humanoid.WalkSpeed = 4;
                local v73, v74 = _G.raycast:cast(l_Character_4.HumanoidRootPart.CFrame.p, l_Character_4.HumanoidRootPart.CFrame.lookVector * 4.5, {
                    workspace.Islands, 
                    workspace.Ships, 
                    workspace.Env
                });
                local l_magnitude_1 = (l_Character_4.HumanoidRootPart.Position - v74).magnitude;
                if v73 then
                    l_magnitude_1 = l_magnitude_1 - 3;
                end;
                local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Snow Bunny Turret", l_Character_4.PrimaryPart.CFrame * CFrame.new(0, -1, -l_magnitude_1));
                task.wait(0.5);
                l_Character_4.Humanoid.WalkSpeed = 16;
                _G.keysetup:cooldown("Snow Bunny Turret", l_cd_4);
                _G.canuse = true;
                _G.fw(l_cd_4);
                l_Cooldowns_4.turret = false;
            end;
        end;
    end;
end;
v7.SnowBlizzard = function(v77, _) --[[ Line: 306 ]] --[[ Name: SnowBlizzard ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_5 = v77.Cooldowns;
    local l_Character_5 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_5.blizzard == false and _G.check:inspect(l_Character_5) == true and _G.StamCheck("Snow Blizzard") == true then
        local v82 = v3.GetM("Snow Blizzard");
        local l_cd_5 = v82.cd;
        if _G.StamCheck("Snow Blizzard") == false then
            return;
        elseif v82.statreq and _G.MeetReq(v82.statreq) == false then
            return;
        else
            local v84, v85, _ = _G.getRayFloor(l_Character_5.PrimaryPart.CFrame * CFrame.new(0, 0, -1.5), 5);
            if v84 == nil then
                return nil;
            else
                l_Cooldowns_5.blizzard = true;
                _G.canuse = false;
                local v87 = l_Character_5.Humanoid:LoadAnimation(script.stomp);
                v87:Play();
                v87:AdjustWeight(2);
                v87:AdjustSpeed(1);
                l_Character_5.Humanoid.WalkSpeed = 0;
                local v88 = game.ReplicatedStorage.Events.Skill:InvokeServer("Snow Blizzard", v85);
                _G.PauseAnim(v87, 0.4, 0.3);
                v87:Stop();
                l_Character_5.Humanoid.AutoRotate = false;
                l_Character_5.PrimaryPart.Anchored = true;
                local v89 = l_Character_5.Humanoid:LoadAnimation(script.stompLoop);
                v89:Play();
                v89:AdjustWeight(2);
                if v88 then
                    v88:FireServer();
                    task.wait(4.25);
                end;
                v89:Stop();
                l_Character_5.PrimaryPart.Anchored = false;
                l_Character_5.Humanoid.AutoRotate = true;
                l_Character_5.Humanoid.WalkSpeed = 16;
                task.wait(0.25);
                _G.keysetup:cooldown("Snow Blizzard", l_cd_5);
                _G.canuse = true;
                _G.fw(l_cd_5);
                l_Cooldowns_5.blizzard = false;
            end;
        end;
    end;
end;
return v7;