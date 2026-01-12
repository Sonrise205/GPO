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
        BrickFist = false, 
        Pirson = false, 
        Shark = false, 
        ser = false, 
        bomb = false
    };
    return v8;
end;
v6.FiveThousandBrickFist = function(v9, v10) --[[ Line: 31 ]] --[[ Name: FiveThousandBrickFist ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_0 = v9.Cooldowns;
    local v12 = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_0 = l_LocalPlayer_0.Character;
    if l_Cooldowns_0.BrickFist == false and _G.StamCheck("Five Thousand Brick Fist") == true and _G.canuse == true and _G.check:inspect(l_Character_0) == true then
        local v14 = v2.GetM("Five Thousand Brick Fist");
        local l_cd_0 = v14.cd;
        if v14.statreq and _G.MeetReq(v14.statreq) == false then
            return;
        else
            l_Cooldowns_0.BrickFist = true;
            _G.canuse = false;
            local v16 = l_Character_0.Humanoid:LoadAnimation(script.brickfist);
            v16:Play();
            v16:AdjustWeight(3);
            local v17 = game.ReplicatedStorage.Events.Skill:InvokeServer("Five Thousand Brick Fist");
            _G.PauseAnim(v16, 0.25, 1);
            local _ = tick();
            v9:ChargeSkill(v10, {
                Key = Enum.KeyCode.E, 
                CheckFunction = function() --[[ Line: 56 ]] --[[ Name: CheckFunction ]]
                    -- upvalues: l_Character_0 (copy)
                    l_Character_0.Humanoid.WalkSpeed = 4;
                end, 
                EndFunction = function() --[[ Line: 59 ]] --[[ Name: EndFunction ]]
                    -- upvalues: v12 (copy), l_Character_0 (copy)
                    local v19 = true;
                    if v12.Stamina.Value > 0 then
                        v19 = true;
                        if l_Character_0.Parent ~= workspace.Ragdolls then
                            v19 = l_Character_0:FindFirstChild("Stun");
                        end;
                    end;
                    return v19;
                end
            });
            v16:AdjustSpeed(2);
            local v20 = Instance.new("BodyVelocity", l_Character_0.HumanoidRootPart);
            v20.MaxForce = Vector3.new(100000, 0, 100000, 0);
            v20.Velocity = l_Character_0.HumanoidRootPart.CFrame.lookVector * 100;
            _G.destroy(v20, 0.15);
            local _ = nil;
            local v22 = false;
            local function v24(v23) --[[ Line: 72 ]] --[[ Name: hitfound ]]
                -- upvalues: v20 (copy), l_Character_0 (copy), v17 (copy)
                v20:Destroy();
                l_Character_0.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0, 0);
                if v17 then
                    v17:FireServer({
                        Target = v23.Parent, 
                        cf = l_Character_0.PrimaryPart.CFrame * CFrame.new(0, 0, -2)
                    });
                end;
            end;
            do
                local l_v22_0 = v22;
                local function v26() --[[ Line: 79 ]] --[[ Name: hitinter ]]
                    -- upvalues: v20 (copy), l_v22_0 (ref), v16 (copy)
                    v20:Destroy();
                    l_v22_0 = true;
                    v16:Stop();
                end;
                if v17 then
                    v17:FireServer("dash");
                end;
                _G.hitbox:start(l_Character_0, Vector3.new(5, 5, 5, 0), 0.5, CFrame.new(0, 0, -1.5), v24, v26);
                task.wait(0.35);
                l_Character_0.Humanoid.WalkSpeed = 16;
                _G.keysetup:cooldown("Five Thousand Brick Fist", l_cd_0);
                _G.canuse = true;
                _G.fw(l_cd_0);
                l_Cooldowns_0.BrickFist = false;
            end;
        end;
    end;
end;
v6.WaterPrison = function(v27, v28) --[[ Line: 97 ]] --[[ Name: WaterPrison ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_1 = v27.Cooldowns;
    local v30 = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_1 = l_LocalPlayer_0.Character;
    if l_Cooldowns_1.Pirson == false and _G.StamCheck("Water Prison") == true and _G.canuse == true and _G.check:inspect(l_Character_1) == true then
        local v32 = v2.GetM("Water Prison");
        local l_cd_1 = v32.cd;
        if v32.statreq and _G.MeetReq(v32.statreq) == false then
            return;
        else
            l_Cooldowns_1.Pirson = true;
            _G.canuse = false;
            local v34 = l_Character_1.Humanoid:LoadAnimation(script.bubble);
            v34:Play();
            v34:AdjustWeight(3);
            _G.PauseAnim(v34, 0.25, 1);
            local _ = tick();
            v27:ChargeSkill(v28, {
                Key = Enum.KeyCode.R, 
                EndFunction = function() --[[ Line: 121 ]] --[[ Name: EndFunction ]]
                    -- upvalues: l_Character_1 (copy), v30 (copy)
                    l_Character_1.Humanoid.WalkSpeed = 4;
                    local v36 = true;
                    if v30.Stamina.Value > 0 then
                        v36 = l_Character_1.Parent == workspace.Ragdolls;
                    end;
                    return v36;
                end
            });
            v34:AdjustSpeed(1);
            task.wait(0.1);
            game.ReplicatedStorage.Events.Skill:InvokeServer("Water Prison", {
                cf = v27:GetMouseCFrame()
            });
            task.wait(0.2);
            l_Character_1.Humanoid.WalkSpeed = 16;
            _G.keysetup:cooldown("Water Prison", l_cd_1);
            _G.canuse = true;
            _G.fw(l_cd_1);
            l_Cooldowns_1.Pirson = false;
        end;
    end;
end;
v6.SharkBarrage = function(v37, v38) --[[ Line: 140 ]] --[[ Name: SharkBarrage ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_2 = v37.Cooldowns;
    local v40 = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_2 = l_LocalPlayer_0.Character;
    if l_Cooldowns_2.Shark == false and _G.StamCheck("Shark Barrage") == true and _G.canuse == true and _G.check:inspect(l_Character_2) == true then
        local v42 = v2.GetM("Shark Barrage");
        local l_cd_2 = v42.cd;
        if v42.statreq and _G.MeetReq(v42.statreq) == false then
            return;
        else
            l_Cooldowns_2.Shark = true;
            _G.canuse = false;
            local v44 = l_Character_2.Humanoid:LoadAnimation(script.barwind);
            v44:Play();
            _G.FaceMouse = true;
            _G.PauseAnim(v44, 0.6, 0.8);
            v44:Stop();
            local v45 = l_Character_2.Humanoid:LoadAnimation(script.barloop);
            v45:Play();
            local v46 = tick();
            local v47 = game.ReplicatedStorage.Events.Skill:InvokeServer("Shark Barrage", {
                cf = l_Character_2.HumanoidRootPart.CFrame
            });
            v37:ChargeSkill(v38, {
                Key = Enum.KeyCode.Z, 
                EndFunction = function() --[[ Line: 168 ]] --[[ Name: EndFunction ]]
                    -- upvalues: l_Character_2 (copy), v40 (copy), v46 (copy)
                    return not l_Character_2:FindFirstChild("FishmanKarate") or v40.Stamina.Value <= 0 or tick() - v46 >= 5 or l_Character_2.Parent == workspace.Ragdolls or _G.check:inspect(l_Character_2) == false;
                end, 
                IgnoreInstantCastSetting = true
            });
            _G.FaceMouse = false;
            v45:Stop();
            if v47 then
                v47:FireServer();
            end;
            l_Character_2.Humanoid.WalkSpeed = 16;
            _G.keysetup:cooldown("Shark Barrage", l_cd_2);
            _G.canuse = true;
            _G.fw(l_cd_2);
            l_Cooldowns_2.Shark = false;
        end;
    end;
end;
v6.WaterSerpent = function(v48, _) --[[ Line: 188 ]] --[[ Name: WaterSerpent ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_3 = v48.Cooldowns;
    local _ = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_3 = l_LocalPlayer_0.Character;
    if l_Cooldowns_3.ser == false and _G.StamCheck("Water Serpent") == true and _G.canuse == true and _G.check:inspect(l_Character_3) == true then
        local v53 = v2.GetM("Water Serpent");
        local l_cd_3 = v53.cd;
        if v53.statreq and _G.MeetReq(v53.statreq) == false then
            return;
        else
            l_Cooldowns_3.ser = true;
            _G.canuse = false;
            local v55 = l_Character_3.Humanoid:LoadAnimation(script.sharksummon);
            v55:Play();
            v55:AdjustSpeed(1.5);
            task.wait(0.26666666666666666);
            local v56 = game.ReplicatedStorage.Events.Skill:InvokeServer("Water Serpent", {
                pos = v48:GetMouseCFrame()
            });
            if v56 then
                task.spawn(function() --[[ Line: 208 ]]
                    -- upvalues: v56 (copy), v48 (copy)
                    while v56.Parent ~= nil do
                        v56:FireServer(v48:GetMouseCFrame());
                        task.wait(0.03333333333333333);
                    end;
                end);
            end;
            l_Character_3.Humanoid.WalkSpeed = 16;
            _G.keysetup:cooldown("Water Serpent", l_cd_3);
            _G.canuse = true;
            _G.fw(l_cd_3);
            l_Cooldowns_3.ser = false;
        end;
    end;
end;
v6.WaterBomb = function(v57, v58) --[[ Line: 225 ]] --[[ Name: WaterBomb ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_4 = v57.Cooldowns;
    local v60 = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_4 = l_LocalPlayer_0.Character;
    if l_Cooldowns_4.bomb == false and _G.StamCheck("Water Bomb") == true and _G.canuse == true and _G.check:inspect(l_Character_4) == true then
        local v62 = v2.GetM("Water Bomb");
        local l_cd_4 = v62.cd;
        if v62.statreq and _G.MeetReq(v62.statreq) == false then
            return;
        else
            l_Cooldowns_4.bomb = true;
            _G.canuse = false;
            local v64 = game.ReplicatedStorage.Events.Skill:InvokeServer("Water Bomb", {
                pos = v57:GetMouseCFrame()
            });
            local v65 = l_Character_4.Humanoid:LoadAnimation(script.ult);
            v65:Play();
            v65:AdjustSpeed(2);
            _G.FaceMouse = true;
            _G.PauseAnim(v65, 0.55, 1);
            v57:ChargeSkill(v58, {
                Key = Enum.KeyCode.C, 
                IgnoreInstantCastSetting = true, 
                EndFunction = function() --[[ Line: 249 ]] --[[ Name: EndFunction ]]
                    -- upvalues: l_Character_4 (copy), v60 (copy)
                    return not l_Character_4:FindFirstChild("FishmanKarate") or v60.Stamina.Value <= 0 or l_Character_4.Parent == workspace.Ragdolls;
                end
            });
            v65:AdjustSpeed(1);
            if v64 then
                v64:FireServer(v57:GetMouseCFrame());
            end;
            l_Character_4.Humanoid.WalkSpeed = 16;
            _G.FaceMouse = false;
            l_Character_4.HumanoidRootPart.Anchored = true;
            task.wait(0.2);
            l_Character_4.HumanoidRootPart.Anchored = false;
            _G.keysetup:cooldown("Water Bomb", l_cd_4);
            _G.canuse = true;
            _G.fw(l_cd_4);
            l_Cooldowns_4.bomb = false;
        end;
    end;
end;
return v6;