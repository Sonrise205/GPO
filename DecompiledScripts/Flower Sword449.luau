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
        slash = false, 
        flash = false
    };
    return v10;
end;
v8.FlowerAroma = function(v11, _) --[[ Line: 28 ]] --[[ Name: FlowerAroma ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v11.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.slash == false and _G.check:inspect(l_Character_0) == true then
        local v16 = v3.GetM("Flower Aroma");
        local l_cd_0 = v16.cd;
        if _G.StamCheck("Flower Aroma") == false then
            return;
        elseif v16.statreq and _G.MeetReq(v16.statreq) == false then
            return;
        else
            local v18, _, _ = _G.getRayFloor(l_Character_0.PrimaryPart.CFrame, 5);
            if v18 == nil then
                _G.displayMessage("<Color=Red>I have to touch the ground");
                return nil;
            else
                l_Cooldowns_0.slash = true;
                _G.canuse = false;
                l_Character_0.Humanoid.WalkSpeed = 0;
                l_Character_0.Humanoid:LoadAnimation(script.buffSkill):Play();
                task.wait(0.4);
                local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Flower Aroma", l_Character_0.PrimaryPart.CFrame * CFrame.new(0, 0, -3));
                task.wait(0.25);
                l_Character_0.Humanoid.WalkSpeed = 16;
                task.wait(0.25);
                _G.canuse = true;
                _G.keysetup:cooldown("Flower Aroma", l_cd_0);
                _G.fw(l_cd_0);
                l_Cooldowns_0.slash = false;
            end;
        end;
    end;
end;
v8.AbsoluteSeduction = function(v22, v23) --[[ Line: 67 ]] --[[ Name: AbsoluteSeduction ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v22.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.flash == false and _G.check:inspect(l_Character_1) == true then
        local v27 = v3.GetM("Absolute Seduction");
        local l_cd_1 = v27.cd;
        if _G.StamCheck("Absolute Seduction") == false then
            return;
        elseif v27.statreq and _G.MeetReq(v27.statreq) == false then
            return;
        else
            local v29, _, _ = _G.getRayFloor(l_Character_1.PrimaryPart.CFrame, 5);
            if v29 == nil then
                _G.displayMessage("<Color=Red>I have to touch the ground");
                return nil;
            else
                l_Cooldowns_1.flash = true;
                _G.canuse = false;
                _G.FaceMouse = true;
                _G.mouseLevel = true;
                local v32 = l_Character_1.Humanoid:LoadAnimation(script.hold);
                v32:Play();
                task.wait(0.2);
                local v33 = game.ReplicatedStorage.Events.Skill:InvokeServer("Absolute Seduction");
                local v34 = tick();
                v22:ChargeSkill(v23, {
                    Key = Enum.KeyCode.R, 
                    CheckFunction = function() --[[ Line: 100 ]] --[[ Name: checkFunction ]]

                    end, 
                    IgnoreInstantCastSetting = true, 
                    EndFunction = function() --[[ Line: 104 ]] --[[ Name: endFunction ]]
                        -- upvalues: l_Character_1 (copy), v34 (copy), v33 (copy)
                        if l_Character_1:FindFirstChild(script.Name) == nil or tick() - v34 >= 3 then
                            return true;
                        elseif v33 == nil then
                            return true;
                        else
                            return;
                        end;
                    end
                });
                if v33 then
                    v33:FireServer();
                end;
                task.wait(0.1);
                v32:Stop();
                l_Character_1.Humanoid:LoadAnimation(script.release):Play();
                task.wait(0.4);
                _G.mouseLevel = nil;
                _G.FaceMouse = false;
                _G.canuse = true;
                _G.keysetup:cooldown("Absolute Seduction", l_cd_1);
                _G.fw(l_cd_1);
                l_Cooldowns_1.flash = false;
            end;
        end;
    end;
end;
return v8;