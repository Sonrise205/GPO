local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v3 = require(game.ReplicatedStorage.Modules.Skills);
local v4 = require(script.Parent.Parent.MobileBase);
local l_PlayerModule_0 = require(l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule"));
local _ = l_LocalPlayer_0:GetMouse();
local _ = l_PlayerModule_0:GetControls();
local v8 = setmetatable({}, v4);
v8.__index = v8;
v8.new = function(_) --[[ Line: 20 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v8 (copy)
    local v10 = setmetatable(v4.new(script.Name), v8);
    v10.Cooldowns = {
        reel = false, 
        depths = false
    };
    return v10;
end;
v8.SunkenDepths = function(v11, _) --[[ Line: 28 ]] --[[ Name: SunkenDepths ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v11.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.depths == false and _G.check:inspect(l_Character_0) == true then
        local v16 = v3.GetM("Sunken Depths");
        local l_cd_0 = v16.cd;
        if l_Character_0.Humanoid.FloorMaterial == Enum.Material.Air then
            _G.displayMessage("<Color=Red>I need to be on the ground");
            return;
        elseif _G.StamCheck("Sunken Depths") == false then
            return;
        elseif v16.statreq and _G.MeetReq(v16.statreq) == false then
            return;
        else
            local v18 = _G.getTargetNearMouse(300);
            if v18 == nil then
                _G.displayMessage("<Color=Red>No targets");
                return;
            else
                l_Cooldowns_0.depths = true;
                _G.canuse = false;
                game.ReplicatedStorage.Events.Skill:InvokeServer("Sunken Depths", {
                    target = v18, 
                    startCFrame = l_Character_0.PrimaryPart.CFrame
                });
                task.wait(0.3);
                _G.canuse = true;
                _G.keysetup:cooldown("Sunken Depths", l_cd_0);
                _G.fw(l_cd_0);
                l_Cooldowns_0.depths = false;
            end;
        end;
    end;
end;
v8.SunkenHook = function(v19, v20) --[[ Line: 68 ]] --[[ Name: SunkenHook ]]
    -- upvalues: l_LocalPlayer_0 (copy), v3 (copy)
    local l_Character_1 = l_LocalPlayer_0.Character;
    local l_Cooldowns_1 = v19.Cooldowns;
    if l_Cooldowns_1.reel == false and _G.check:inspect(l_Character_1) == true then
        local v23 = v3.GetM("Sunken Hook");
        local l_cd_1 = v23.cd;
        if _G.StamCheck("Sunken Hook") == false then
            return;
        elseif v23.statreq and _G.MeetReq(v23.statreq) == false then
            return;
        else
            local v25 = l_Character_1.Humanoid.Animator:LoadAnimation(script.throwCharge);
            v25:Play();
            v25:AdjustWeight(2);
            l_Cooldowns_1.reel = true;
            _G.FaceMouse = true;
            _G.canuse = false;
            local v26 = game.ReplicatedStorage.Events.Skill:InvokeServer("Sunken Hook");
            local v27 = tick();
            v19:ChargeSkill(v20, {
                Key = Enum.KeyCode.R, 
                CheckFunction = function() --[[ Line: 95 ]] --[[ Name: CheckFunction ]]
                    -- upvalues: l_Character_1 (copy)
                    l_Character_1.Humanoid.AutoRotate = false;
                end, 
                IgnoreInstantCastSetting = true, 
                EndFunction = function() --[[ Line: 99 ]] --[[ Name: EndFunction ]]
                    -- upvalues: l_Character_1 (copy), v19 (copy), v27 (copy)
                    if _G.check:inspect(l_Character_1) == false then
                        return true;
                    else
                        local v28 = true;
                        if v19.Tool.Parent == l_Character_1 then
                            v28 = tick() - v27 >= 4;
                        end;
                        return v28;
                    end;
                end, 
                HoldDuration = 0.25
            });
            v25:Stop();
            local v29 = l_Character_1.Humanoid.Animator:LoadAnimation(script.throwAnim);
            v29:Play();
            v29:AdjustWeight(2);
            task.wait(0.175);
            _G.FaceMouse = false;
            l_Character_1.HumanoidRootPart.Anchored = true;
            l_Character_1.Humanoid.AutoRotate = false;
            l_Character_1:PivotTo(CFrame.new(l_Character_1.PrimaryPart.Position, v19:GetMousePosition()));
            if v26 then
                v26:InvokeServer(v19:GetMouseCFrame());
            end;
            v29:Stop();
            repeat
                task.wait();
            until l_Character_1:GetAttribute("SunkenAnchorPulling") == nil;
            l_Character_1.Humanoid.AutoRotate = true;
            l_Character_1.HumanoidRootPart.Anchored = false;
            l_Character_1.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Sunken Hook", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1.reel = false;
        end;
    end;
end;
return v8;