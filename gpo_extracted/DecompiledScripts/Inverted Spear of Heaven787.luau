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
        counter = false, 
        reel = false
    };
    return v8;
end;
v6.MassacreCounter = function(v9, _) --[[ Line: 29 ]] --[[ Name: MassacreCounter ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_0 = v9.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    if l_Cooldowns_0.counter == false and _G.check:inspect(l_Character_0) == true then
        local v13 = v2.GetM("Massacre Counter");
        local l_cd_0 = v13.cd;
        if _G.StamCheck("Massacre Counter") == false then
            return;
        elseif v13.statreq and _G.MeetReq(v13.statreq) == false then
            return;
        else
            l_Cooldowns_0.counter = true;
            _G.canuse = false;
            local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Massacre Counter");
            task.wait(0.75);
            _G.canuse = true;
            _G.keysetup:cooldown("Massacre Counter", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.counter = false;
        end;
    end;
end;
v6.ChainReel = function(v16, v17) --[[ Line: 62 ]] --[[ Name: ChainReel ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Character_1 = l_LocalPlayer_0.Character;
    local l_Cooldowns_1 = v16.Cooldowns;
    if l_Cooldowns_1.reel == false and _G.check:inspect(l_Character_1) == true then
        local v20 = v2.GetM("Chain Reel");
        local l_cd_1 = v20.cd;
        if _G.StamCheck("Chain Reel") == false then
            return;
        elseif v20.statreq and _G.MeetReq(v20.statreq) == false then
            return;
        else
            local v22 = l_Character_1.Humanoid.Animator:LoadAnimation(script.charge);
            v22:Play();
            v22:AdjustWeight(2);
            l_Cooldowns_1.reel = true;
            _G.FaceMouse = true;
            _G.canuse = false;
            local v23 = game.ReplicatedStorage.Events.Skill:InvokeServer("Chain Reel");
            local v24 = tick();
            v16:ChargeSkill(v17, {
                Key = Enum.KeyCode.R, 
                CheckFunction = function() --[[ Line: 89 ]] --[[ Name: CheckFunction ]]
                    -- upvalues: l_Character_1 (copy)
                    l_Character_1.Humanoid.AutoRotate = false;
                end, 
                IgnoreInstantCastSetting = true, 
                EndFunction = function() --[[ Line: 93 ]] --[[ Name: EndFunction ]]
                    -- upvalues: l_Character_1 (copy), v16 (copy), v24 (copy)
                    if _G.check:inspect(l_Character_1) == false then
                        return true;
                    else
                        local v25 = true;
                        if v16.Tool.Parent == l_Character_1 then
                            v25 = tick() - v24 >= 4;
                        end;
                        return v25;
                    end;
                end, 
                HoldDuration = 0.25
            });
            v22:Stop();
            local v26 = l_Character_1.Humanoid.Animator:LoadAnimation(script.throw);
            v26:Play();
            v26:AdjustWeight(2);
            _G.FaceMouse = false;
            l_Character_1.HumanoidRootPart.Anchored = true;
            l_Character_1.Humanoid.AutoRotate = false;
            l_Character_1:PivotTo(CFrame.new(l_Character_1.PrimaryPart.Position, v16:GetMousePosition()));
            if v23 then
                v23:FireServer(v16:GetMouseCFrame());
            end;
            task.wait(0.5);
            l_Character_1.Humanoid.AutoRotate = true;
            l_Character_1.HumanoidRootPart.Anchored = false;
            l_Character_1.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Chain Reel", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1.reel = false;
        end;
    end;
end;
return v6;