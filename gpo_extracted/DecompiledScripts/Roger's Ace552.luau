local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("RunService");
local v2 = require(game.ReplicatedStorage.Modules.Skills);
local v3 = require(script.Parent.Parent.MobileBase);
local _ = require(l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule"));
local _ = l_LocalPlayer_0:GetMouse();
local v6 = setmetatable({}, v3);
v6.__index = v6;
v6.new = function(_) --[[ Line: 18 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v6 (copy)
    local v8 = setmetatable(v3.new(script.Name), v6);
    v8.Cooldowns = {
        overflow = false, 
        flash = false, 
        slash = false, 
        divine = false
    };
    return v8;
end;
v6.Overflow = function(v9, _) --[[ Line: 31 ]] --[[ Name: Overflow ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_0 = v9.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    if l_Cooldowns_0.overflow == false and _G.check:inspect(l_Character_0) == true then
        local v13 = v2.GetM("Overflow");
        local l_cd_0 = v13.cd;
        if _G.StamCheck("Overflow") == false then
            return;
        elseif v13.statreq and _G.MeetReq(v13.statreq) == false then
            return;
        else
            l_Cooldowns_0.overflow = true;
            l_Character_0.Humanoid.WalkSpeed = 4;
            local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Overflow");
            task.wait(0.25);
            l_Character_0.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Overflow", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.overflow = false;
        end;
    end;
end;
v6.LaughingCounter = function(v16, _) --[[ Line: 63 ]] --[[ Name: LaughingCounter ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_1 = v16.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    if l_Cooldowns_1.flash == false and _G.check:inspect(l_Character_1) == true then
        local v20 = v2.GetM("Laughing Counter");
        local l_cd_1 = v20.cd;
        if _G.StamCheck("Laughing Counter") == false then
            return;
        elseif v20.statreq and _G.MeetReq(v20.statreq) == false then
            return;
        else
            l_Cooldowns_1.flash = true;
            _G.canuse = false;
            local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Laughing Counter");
            task.wait(0.75);
            _G.canuse = true;
            _G.keysetup:cooldown("Laughing Counter", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1.flash = false;
        end;
    end;
end;
v6.FinalRetort = function(v23, _) --[[ Line: 97 ]] --[[ Name: FinalRetort ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_2 = v23.Cooldowns;
    local l_Character_2 = l_LocalPlayer_0.Character;
    if l_Cooldowns_2.slash == false and _G.check:inspect(l_Character_2) == true then
        local v27 = v2.GetM("Final Retort");
        local l_cd_2 = v27.cd;
        if _G.StamCheck("Final Retort") == false then
            return;
        elseif v27.statreq and _G.MeetReq(v27.statreq) == false then
            return;
        else
            l_Cooldowns_2.slash = true;
            _G.canuse = false;
            local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Final Retort", v23:GetMouseCFrame());
            l_Character_2.Humanoid.AutoRotate = true;
            l_Character_2.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Final Retort", l_cd_2);
            _G.fw(l_cd_2);
            l_Cooldowns_2.slash = false;
        end;
    end;
end;
v6.DivineDeparture = function(v30, v31) --[[ Line: 128 ]] --[[ Name: DivineDeparture ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Character_3 = l_LocalPlayer_0.Character;
    local l_Cooldowns_3 = v30.Cooldowns;
    if l_Cooldowns_3.divine == false and _G.check:inspect(l_Character_3) == true then
        local v34 = v2.GetM("Divine Departure");
        local l_cd_3 = v34.cd;
        if _G.StamCheck("Divine Departure") == false then
            return;
        elseif v34.statreq and _G.MeetReq(v34.statreq) == false then
            return;
        else
            local v36 = l_Character_3.Humanoid.Animator:LoadAnimation(script.slash);
            v36:Play();
            v36:AdjustWeight(2);
            l_Cooldowns_3.divine = true;
            _G.FaceMouse = true;
            _G.canuse = false;
            local v37 = game.ReplicatedStorage.Events.Skill:InvokeServer("Divine Departure");
            local v38 = tick();
            v30:ChargeSkill(v31, {
                Key = Enum.KeyCode.X, 
                CheckFunction = function() --[[ Line: 155 ]] --[[ Name: CheckFunction ]]
                    -- upvalues: l_Character_3 (copy)
                    l_Character_3.Humanoid.AutoRotate = false;
                end, 
                EndFunction = function() --[[ Line: 158 ]] --[[ Name: EndFunction ]]
                    -- upvalues: v30 (copy), l_Character_3 (copy), v38 (copy)
                    local v39 = true;
                    if v30.Tool.Parent == l_Character_3 then
                        v39 = tick() - v38 >= 10;
                    end;
                    return v39;
                end
            });
            v36:Stop();
            local v40 = l_Character_3.Humanoid.Animator:LoadAnimation(script.slashEnd);
            v40:Play();
            v40:AdjustWeight(2);
            _G.FaceMouse = false;
            l_Character_3.HumanoidRootPart.Anchored = true;
            l_Character_3.Humanoid.AutoRotate = false;
            l_Character_3:PivotTo(CFrame.new(l_Character_3.PrimaryPart.Position, v30:GetMousePosition()));
            if v37 then
                v37:FireServer(CFrame.new(l_Character_3.PrimaryPart.Position, v30:GetMousePosition()));
            end;
            v40:AdjustSpeed(1);
            task.wait(0.5);
            l_Character_3.Humanoid.AutoRotate = true;
            l_Character_3.HumanoidRootPart.Anchored = false;
            l_Character_3.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Divine Departure", l_cd_3);
            _G.fw(l_cd_3);
            l_Cooldowns_3.divine = false;
        end;
    end;
end;
return v6;