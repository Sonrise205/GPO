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
        upper = false, 
        dash = false, 
        wolf = false
    };
    return v10;
end;
v8.CeroMetralleta = function(v11, v12) --[[ Line: 28 ]] --[[ Name: CeroMetralleta ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v11.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local v15 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.upper == false and _G.check:inspect(l_Character_0) == true then
        local v16 = v3.GetM("Cero Metralleta");
        local l_cd_0 = v16.cd;
        if _G.StamCheck("Cero Metralleta") == false then
            return;
        elseif v16.statreq and _G.MeetReq(v16.statreq) == false then
            return;
        else
            local v18 = 0;
            if l_Character_0:GetAttribute("starkgunDamage") then
                v18 = math.ceil((l_Character_0:GetAttribute("starkgunDamage")));
            end;
            if v18 < require(game.ReplicatedStorage.Modules.Skills.Modes["Stark Gun"])(l_LocalPlayer_0) then
                _G.displayMessage("<Color=Red>I dont have enough damage.");
                return;
            else
                l_Cooldowns_0.upper = true;
                _G.canuse = false;
                local v19 = l_Character_0.Humanoid.Animator:LoadAnimation(script.gun);
                v19:Play();
                v19:AdjustWeight(2);
                v19.Priority = Enum.AnimationPriority.Action4;
                _G.FaceMouse = true;
                local v20 = game.ReplicatedStorage.Events.Skill:InvokeServer("Cero Metralleta");
                _G.PauseAnim(v19, 0.4, 1);
                local v21 = tick();
                v11:ChargeSkill(v12, {
                    Key = Enum.KeyCode.Z, 
                    CheckFunction = function() --[[ Line: 67 ]] --[[ Name: checkFunction ]]

                    end, 
                    EndFunction = function() --[[ Line: 71 ]] --[[ Name: endFunction ]]
                        -- upvalues: v21 (copy), v15 (copy)
                        if tick() - v21 >= 3 or v15.Stamina.Value <= 0 then
                            return true;
                        else
                            return;
                        end;
                    end, 
                    IgnoreInstantCastSetting = true
                });
                v19:Stop();
                local v22 = l_Character_0.Humanoid.Animator:LoadAnimation(script.ceroMet);
                v22:Play();
                v22.Priority = Enum.AnimationPriority.Action4;
                _G.FaceMouse = false;
                l_Character_0.PrimaryPart.Anchored = true;
                l_Character_0.Humanoid.AutoRotate = false;
                if v20 then
                    v20:InvokeServer(l_Character_0.PrimaryPart.CFrame);
                end;
                l_Character_0.PrimaryPart.Anchored = false;
                l_Character_0.Humanoid.AutoRotate = true;
                v22:Stop();
                l_Character_0.Humanoid.WalkSpeed = 16;
                _G.canuse = true;
                _G.keysetup:cooldown("Cero Metralleta", l_cd_0);
                _G.fw(l_cd_0);
                l_Cooldowns_0.upper = false;
            end;
        end;
    end;
end;
v8.RightGun = function(v23, v24) --[[ Line: 109 ]] --[[ Name: RightGun ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v23.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local v27 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.dash == false and _G.check:inspect(l_Character_1) == true then
        local v28 = v3.GetM("Right Gun");
        local l_cd_1 = v28.cd;
        if _G.StamCheck("Right Gun") == false then
            return;
        elseif v28.statreq and _G.MeetReq(v28.statreq) == false then
            return;
        else
            local v30 = l_Character_1.Humanoid.Animator:LoadAnimation(script.gun);
            v30:Play();
            v30:AdjustWeight(2);
            v30.Priority = Enum.AnimationPriority.Action4;
            l_Cooldowns_1.dash = true;
            _G.canuse = false;
            _G.FaceMouse = true;
            local v31 = game.ReplicatedStorage.Events.Skill:InvokeServer("Right Gun", l_Character_1.PrimaryPart.CFrame);
            local v32 = tick();
            local function v33() --[[ Line: 137 ]] --[[ Name: checkFunction ]]
                -- upvalues: l_Character_1 (copy)
                if _G.check:inspect(l_Character_1) == false then
                    return true;
                else
                    return;
                end;
            end;
            local function v34() --[[ Line: 143 ]] --[[ Name: endFunction ]]
                -- upvalues: v32 (copy), v27 (copy)
                if tick() - v32 >= 2 or v27.Stamina.Value <= 0 then
                    return true;
                else
                    return;
                end;
            end;
            _G.PauseAnim(v30, 0.4, 1);
            v23:ChargeSkill(v24, {
                Key = Enum.KeyCode.E, 
                CheckFunction = v33, 
                IgnoreInstantCastSetting = true, 
                EndFunction = v34
            });
            l_Character_1.PrimaryPart.Anchored = true;
            v30:AdjustSpeed(2);
            _G.FaceMouse = false;
            if v31 then
                local l_CFrame_0 = l_Character_1.PrimaryPart.CFrame;
                l_Character_1:SetPrimaryPartCFrame(CFrame.new(l_Character_1.PrimaryPart.Position, v23:GetMouseCFrame().p));
                if l_Character_1:FindFirstChild(script.Name .. "Sword") then
                    l_CFrame_0 = CFrame.new(l_Character_1:FindFirstChild(script.Name .. "Sword").Blade.FireHole.WorldCFrame.Position, v23:GetMouseCFrame().p);
                end;
                v31:FireServer(l_Character_1.PrimaryPart.CFrame, l_CFrame_0);
            end;
            task.wait(0.45);
            l_Character_1.PrimaryPart.Anchored = false;
            _G.canuse = true;
            _G.keysetup:cooldown("Right Gun", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1.dash = false;
        end;
    end;
end;
v8.SoulWolves = function(v36, _) --[[ Line: 183 ]] --[[ Name: SoulWolves ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_2 = v36.Cooldowns;
    local l_Character_2 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_2.wolf == false and _G.check:inspect(l_Character_2) == true then
        local v41 = v3.GetM("Soul Wolves");
        local l_cd_2 = v41.cd;
        if _G.StamCheck("Soul Wolves") == false then
            return;
        elseif v41.statreq and _G.MeetReq(v41.statreq) == false then
            return;
        else
            local v43 = l_Character_2.Humanoid.Animator:LoadAnimation(script.wolf);
            v43:Play();
            v43:AdjustSpeed(0.5);
            v43:AdjustWeight(2);
            l_Cooldowns_2.wolf = true;
            _G.canuse = false;
            l_Character_2.PrimaryPart.Anchored = true;
            task.wait(0.4);
            local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Soul Wolves", l_Character_2.PrimaryPart.CFrame);
            l_Character_2.PrimaryPart.Anchored = false;
            _G.canuse = true;
            _G.keysetup:cooldown("Soul Wolves", l_cd_2);
            _G.fw(l_cd_2);
            l_Cooldowns_2.wolf = false;
        end;
    end;
end;
return v8;