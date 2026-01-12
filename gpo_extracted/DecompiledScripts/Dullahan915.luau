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
        wisp = false, 
        fearGrab = false, 
        headThrow = false, 
        res = false, 
        ult = false
    };
    return v8;
end;
v6["WillO'Wisp"] = function(v9, _) --[[ Line: 25 ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_0 = v9.Cooldowns;
    local _ = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_0 = l_LocalPlayer_0.Character;
    if l_Cooldowns_0.wisp == false and _G.check:inspect(l_Character_0) == true and _G.StamCheck("Will O' Wisp") == true then
        local v14 = v2.GetM("Will O' Wisp");
        local l_cd_0 = v14.cd;
        if _G.StamCheck("Will O' Wisp") == false then
            return;
        elseif v14.statreq and _G.MeetReq(v14.statreq) == false then
            return;
        else
            l_Cooldowns_0.wisp = true;
            _G.canuse = false;
            local v16 = _G.getTargetNearMouse();
            if v16 == nil then
                v16 = v9:GetMouseCFrame();
            end;
            l_Character_0.PrimaryPart.Anchored = true;
            local l_v16_0 = v16;
            if typeof(v16) == "Instance" then
                l_v16_0 = v16.CFrame;
            end;
            l_Character_0:SetPrimaryPartCFrame(CFrame.new(l_Character_0.PrimaryPart.Position, l_v16_0.Position));
            local v18 = l_Character_0.Humanoid:LoadAnimation(script.wisp);
            v18:Play(0);
            v18:AdjustWeight(2);
            v18:AdjustSpeed(2.25);
            local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Will O' Wisp", {
                v16, 
                l_Character_0.RightHand.CFrame
            });
            task.wait(0.25);
            l_Character_0.PrimaryPart.Anchored = false;
            l_Character_0.Humanoid.WalkSpeed = 16;
            _G.mouseLevel = false;
            _G.keysetup:cooldown("Will O' Wisp", l_cd_0);
            _G.canuse = true;
            _G.fw(l_cd_0);
            l_Cooldowns_0.wisp = false;
        end;
    end;
end;
v6.FearInducement = function(v20, _) --[[ Line: 74 ]] --[[ Name: FearInducement ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_1 = v20.Cooldowns;
    local _ = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_1 = l_LocalPlayer_0.Character;
    if l_Cooldowns_1.fearGrab == false and _G.check:inspect(l_Character_1) == true and _G.StamCheck("Fear Inducement") == true then
        local v25 = v2.GetM("Fear Inducement");
        local l_cd_1 = v25.cd;
        if _G.StamCheck("Fear Inducement") == false then
            return;
        elseif v25.statreq and _G.MeetReq(v25.statreq) == false then
            return;
        else
            l_Cooldowns_1.fearGrab = true;
            _G.canuse = false;
            local v27 = l_Character_1.Humanoid:LoadAnimation(script.grab);
            v27:Play(0);
            v27:AdjustWeight(2);
            l_Character_1.Humanoid.WalkSpeed = 4;
            v27:AdjustSpeed(1.25);
            local v28 = game.ReplicatedStorage.Events.Skill:InvokeServer("Fear Inducement", {
                cf = l_Character_1.HumanoidRootPart.CFrame
            });
            local _ = tick();
            task.wait(0.2);
            local v30 = Instance.new("BodyVelocity", l_Character_1.HumanoidRootPart);
            v30.MaxForce = Vector3.new(1000000, 1000000, 1000000, 0);
            v30.Velocity = l_Character_1.HumanoidRootPart.CFrame.lookVector * 75;
            _G.destroy(v30, 0.1);
            if v28 then
                v28:FireServer();
            end;
            do
                local l_v30_0 = v30;
                local function v33(v32) --[[ Line: 111 ]] --[[ Name: hitfound ]]
                    -- upvalues: l_v30_0 (ref), v28 (copy), l_Character_1 (copy)
                    l_v30_0:Destroy();
                    l_v30_0 = nil;
                    if v28 then
                        v28:FireServer(v32.Parent, l_Character_1.HumanoidRootPart.CFrame);
                    end;
                end;
                _G.hitbox:start(l_Character_1, Vector3.new(6, 6, 6, 0), 0.35, CFrame.new(0, 0, -2), v33, nil);
                l_Character_1.Humanoid.WalkSpeed = 16;
                task.wait(0.4);
                _G.canuse = true;
                _G.keysetup:cooldown("Fear Inducement", l_cd_1);
                _G.fw(l_cd_1);
                l_Cooldowns_1.fearGrab = false;
            end;
        end;
    end;
end;
v6.HeadThrow = function(v34, _) --[[ Line: 128 ]] --[[ Name: HeadThrow ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_2 = v34.Cooldowns;
    local _ = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_2 = l_LocalPlayer_0.Character;
    if l_Cooldowns_2.headThrow == false and _G.check:inspect(l_Character_2) == true and _G.StamCheck("Head Throw") == true then
        local v39 = v2.GetM("Head Throw");
        local l_cd_2 = v39.cd;
        if _G.StamCheck("Head Throw") == false then
            return;
        elseif v39.statreq and _G.MeetReq(v39.statreq) == false then
            return;
        else
            l_Cooldowns_2.headThrow = true;
            _G.canuse = false;
            local v41 = l_Character_2.Humanoid:LoadAnimation(script.head);
            v41:Play(0);
            v41:AdjustWeight(2);
            task.wait(0.1);
            local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Head Throw", {
                start = l_Character_2.PrimaryPart.CFrame, 
                target = v34:GetMouseCFrame()
            });
            l_Character_2.Humanoid.WalkSpeed = 16;
            _G.mouseLevel = false;
            _G.keysetup:cooldown("Head Throw", l_cd_2);
            _G.canuse = true;
            _G.fw(l_cd_2);
            l_Cooldowns_2.headThrow = false;
        end;
    end;
end;
v6.Resurrection = function(v43, _) --[[ Line: 163 ]] --[[ Name: Resurrection ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_3 = v43.Cooldowns;
    local _ = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_3 = l_LocalPlayer_0.Character;
    if l_Cooldowns_3.res == false and _G.check:inspect(l_Character_3) == true and _G.StamCheck("Resurrection") == true then
        local v48 = v2.GetM("Resurrection");
        local l_cd_3 = v48.cd;
        if _G.StamCheck("Resurrection") == false then
            return;
        elseif v48.statreq and _G.MeetReq(v48.statreq) == false then
            return;
        else
            local v50, _, _ = _G.getRayFloor(l_Character_3.PrimaryPart.CFrame, 5);
            if v50 == nil then
                _G.displayMessage("<Color=Red>I have to touch the ground");
                return nil;
            else
                l_Cooldowns_3.res = true;
                _G.canuse = false;
                l_Character_3.Humanoid.WalkSpeed = 0;
                local v53 = l_Character_3.Humanoid:LoadAnimation(script.res);
                v53:Play(0);
                v53:AdjustWeight(2);
                local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Resurrection", {
                    start = l_Character_3.PrimaryPart.CFrame, 
                    target = v43:GetMouseCFrame()
                });
                task.wait(0.4);
                l_Character_3.Humanoid.WalkSpeed = 16;
                _G.mouseLevel = false;
                _G.keysetup:cooldown("Resurrection", l_cd_3);
                _G.canuse = true;
                _G.fw(l_cd_3);
                l_Cooldowns_3.res = false;
            end;
        end;
    end;
end;
v6.OnslaughtofShadows = function(v55, _) --[[ Line: 203 ]] --[[ Name: OnslaughtofShadows ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_4 = v55.Cooldowns;
    local _ = game.ReplicatedStorage["Stats" .. l_LocalPlayer_0.Name];
    local l_Character_4 = l_LocalPlayer_0.Character;
    if l_Cooldowns_4.ult == false and _G.check:inspect(l_Character_4) == true and _G.StamCheck("Onslaught of Shadows") == true then
        local v60 = v2.GetM("Onslaught of Shadows");
        local l_cd_4 = v60.cd;
        if _G.StamCheck("Onslaught of Shadows") == false then
            return;
        elseif v60.statreq and _G.MeetReq(v60.statreq) == false then
            return;
        else
            l_Cooldowns_4.ult = true;
            _G.canuse = false;
            l_Character_4.Humanoid.AutoRotate = false;
            local v62 = l_Character_4.Humanoid:LoadAnimation(script.ult);
            v62:Play(0);
            v62:AdjustWeight(2);
            v62:AdjustSpeed(1.75);
            local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Onslaught of Shadows", {
                start = l_Character_4.PrimaryPart.CFrame, 
                target = v55:GetMouseCFrame()
            });
            _G.keysetup:cooldown("Onslaught of Shadows", l_cd_4);
            _G.canuse = true;
            l_Character_4.Humanoid.AutoRotate = true;
            _G.fw(l_cd_4);
            l_Cooldowns_4.ult = false;
        end;
    end;
end;
return v6;