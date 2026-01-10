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
        rocket = false, 
        WhiteOut = false, 
        barrage = false, 
        snake = false, 
        WhiteFog = false, 
        Judgement = false
    };
    return v10;
end;
v8.WhiteRocket = function(v11, v12) --[[ Line: 28 ]] --[[ Name: WhiteRocket ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v11.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local v15 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.rocket == false and _G.check:inspect(l_Character_0) == true and _G.StamCheck("White Rocket") == true then
        local v16 = v3.GetM("White Rocket");
        local l_cd_0 = v16.cd;
        if _G.StamCheck("White Rocket") == false then
            return;
        elseif v16.statreq and _G.MeetReq(v16.statreq) == false then
            return;
        else
            _G.canuse = false;
            l_Cooldowns_0.rocket = true;
            local v18 = game.ReplicatedStorage.Events.Skill:InvokeServer("White Rocket");
            local v19 = Instance.new("BodyVelocity", l_Character_0.LowerTorso);
            v19.MaxForce = Vector3.new(1e999, 1e999, 1e999, 0);
            v19.Name = "geppo";
            v19.Velocity = Vector3.new();
            local v20 = Instance.new("BodyGyro", l_Character_0.PrimaryPart);
            v20.MaxTorque = Vector3.new(99999997952, 99999997952, 99999997952, 0);
            v20.P = 40000000;
            v20.D = 10000;
            local v21 = tick();
            local v22 = RaycastParams.new();
            v22.FilterType = Enum.RaycastFilterType.Include;
            v22.FilterDescendantsInstances = _G.getTargetsWithENV(l_Character_0);
            l_Character_0:SetPrimaryPartCFrame(CFrame.new(l_Character_0.PrimaryPart.Position, v11:GetMouseCFrame().Position));
            v11:ChargeSkill(v12, {
                Key = Enum.KeyCode.Z, 
                EndFunction = function() --[[ Line: 67 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_0 (copy), v11 (copy), v19 (copy), v20 (copy), v22 (copy), v21 (copy), v15 (copy)
                    local v23 = l_Character_0.Humanoid.Health / l_Character_0.Humanoid.MaxHealth;
                    local l_Position_0 = v11:GetMouseCFrame().Position;
                    v19.Velocity = (l_Character_0.HumanoidRootPart.Position - l_Position_0).Unit * -(90 * v23);
                    v20.CFrame = CFrame.new(l_Character_0.PrimaryPart.Position, l_Position_0);
                    local v25 = CFrame.new(l_Character_0.PrimaryPart.Position, l_Position_0) * CFrame.new(0, 0, 2);
                    local v26 = workspace:Blockcast(v25, Vector3.new(4, 4, 4, 0), CFrame.new(l_Character_0.PrimaryPart.Position, l_Position_0).LookVector * 2, v22);
                    if v26 and v26.Instance then
                        return true;
                    elseif _G.check:inspect(l_Character_0) == false then
                        return true;
                    elseif tick() - v21 >= 4 or v11.Tool.Parent ~= l_Character_0 or l_Character_0.Parent == nil or l_Character_0.Parent ~= workspace.PlayerCharacters or v15.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v19:Destroy();
            v20:Destroy();
            if v18 then
                v18:FireServer(l_Character_0.HumanoidRootPart.CFrame);
            end;
            _G.canuse = true;
            _G.keysetup:cooldown("White Rocket", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.rocket = false;
        end;
    end;
end;
v8.WhiteOut = function(v27, _) --[[ Line: 108 ]] --[[ Name: WhiteOut ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v27.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.WhiteOut == false and _G.check:inspect(l_Character_1) == true and _G.StamCheck("White Out") == true then
        local v32 = v3.GetM("White Out");
        local l_cd_1 = v32.cd;
        if _G.StamCheck("White Out") == false then
            return;
        elseif v32.statreq and _G.MeetReq(v32.statreq) == false then
            return;
        else
            _G.canuse = false;
            l_Cooldowns_1.WhiteOut = true;
            l_Character_1.PrimaryPart.Anchored = true;
            local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("White Out", l_Character_1.PrimaryPart.CFrame);
            l_Character_1.PrimaryPart.Anchored = false;
            _G.canuse = true;
            _G.keysetup:cooldown("White Out", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1.WhiteOut = false;
        end;
    end;
end;
v8.WhiteBarrage = function(v35, v36) --[[ Line: 138 ]] --[[ Name: WhiteBarrage ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_2 = v35.Cooldowns;
    local l_Character_2 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_2.barrage == false and _G.check:inspect(l_Character_2) == true and _G.StamCheck("White Barrage") == true then
        local v40 = v3.GetM("White Barrage");
        local l_cd_2 = v40.cd;
        if _G.StamCheck("White Barrage") == false then
            return;
        elseif v40.statreq and _G.MeetReq(v40.statreq) == false then
            return;
        else
            l_Cooldowns_2.barrage = true;
            _G.canuse = false;
            _G.FaceMouse = true;
            local v42 = l_Character_2.Humanoid:LoadAnimation(script.barrageWind);
            v42:Play();
            v42:AdjustSpeed(1.3);
            local v43 = tick();
            l_Character_2:SetPrimaryPartCFrame(CFrame.new(l_Character_2.PrimaryPart.Position, v35:GetMouseCFrame().Position));
            local v44 = game.ReplicatedStorage.Events.Skill:InvokeServer("White Barrage", l_Character_2.PrimaryPart.CFrame);
            local v45 = l_Character_2.Humanoid:LoadAnimation(script.barrageLoop);
            v45:Play();
            v35:ChargeSkill(v36, {
                Key = Enum.KeyCode.E, 
                EndFunction = function() --[[ Line: 175 ]] --[[ Name: EndFunction ]]
                    -- upvalues: v35 (copy), l_Character_2 (copy), v43 (copy), v44 (copy)
                    local v46 = true;
                    if v35.Tool.Parent == l_Character_2 then
                        v46 = true;
                        if tick() - v43 < 3 then
                            v46 = not v44 or _G.check:inspect(l_Character_2) == false;
                        end;
                    end;
                    return v46;
                end, 
                IgnoreInstantCastSetting = true
            });
            v45:Stop();
            if v44 then
                v44:FireServer();
            end;
            _G.canuse = true;
            _G.FaceMouse = false;
            _G.keysetup:cooldown("White Barrage", l_cd_2);
            _G.fw(l_cd_2);
            l_Cooldowns_2.barrage = false;
        end;
    end;
end;
v8.WhiteSnake = function(v47, _) --[[ Line: 196 ]] --[[ Name: WhiteSnake ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_3 = v47.Cooldowns;
    local l_Character_3 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_3.snake == false and _G.check:inspect(l_Character_3) == true then
        local v52 = v3.GetM("White Snake");
        local l_cd_3 = v52.cd;
        if _G.StamCheck("White Snake") == false then
            return;
        elseif v52.statreq and _G.MeetReq(v52.statreq) == false then
            return;
        else
            local v54 = _G.getTargetNearMouse(300);
            if v54 == nil then
                _G.displayMessage("<Color=Red>No targets");
                return;
            else
                l_Cooldowns_3.snake = true;
                _G.canuse = false;
                l_Character_3.Humanoid.AutoRotate = false;
                l_Character_3.PrimaryPart.Anchored = true;
                l_Character_3:SetPrimaryPartCFrame(CFrame.new(l_Character_3.PrimaryPart.Position, v54.Position));
                game.ReplicatedStorage.Events.Skill:InvokeServer("White Snake", {
                    target = v54, 
                    startCFrame = l_Character_3.PrimaryPart.CFrame
                });
                l_Character_3.PrimaryPart.Anchored = false;
                l_Character_3.Humanoid.AutoRotate = true;
                _G.canuse = true;
                _G.keysetup:cooldown("White Snake", l_cd_3);
                _G.fw(l_cd_3);
                l_Cooldowns_3.snake = false;
            end;
        end;
    end;
end;
v8.WhiteFog = function(v55, _) --[[ Line: 239 ]] --[[ Name: WhiteFog ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_4 = v55.Cooldowns;
    local l_Character_4 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_4.WhiteFog == false and _G.check:inspect(l_Character_4) == true and _G.StamCheck("White Fog") == true then
        local v60 = v3.GetM("White Fog");
        local l_cd_4 = v60.cd;
        if _G.StamCheck("White Fog") == false then
            return;
        elseif v60.statreq and _G.MeetReq(v60.statreq) == false then
            return;
        else
            _G.canuse = false;
            l_Cooldowns_4.WhiteFog = true;
            local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("White Fog", l_Character_4.PrimaryPart.CFrame);
            _G.canuse = true;
            _G.keysetup:cooldown("White Fog", l_cd_4);
            _G.fw(l_cd_4);
            l_Cooldowns_4.WhiteFog = false;
        end;
    end;
end;
return v8;