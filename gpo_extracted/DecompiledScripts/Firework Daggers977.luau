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
        dash = false
    };
    return v10;
end;
v8.FireworkParade = function(v11, v12) --[[ Line: 28 ]] --[[ Name: FireworkParade ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v11.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local v15 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.upper == false and _G.check:inspect(l_Character_0) == true then
        local v16 = v3.GetM("Firework Parade");
        local l_cd_0 = v16.cd;
        if _G.StamCheck("Firework Parade") == false then
            return;
        elseif v16.statreq and _G.MeetReq(v16.statreq) == false then
            return;
        else
            l_Cooldowns_0.upper = true;
            _G.canuse = false;
            l_Character_0.Humanoid.Animator:LoadAnimation(script.startup):Play();
            local v18 = game.ReplicatedStorage.Events.Skill:InvokeServer("Firework Parade");
            local v19 = tick();
            local function v20() --[[ Line: 50 ]] --[[ Name: checkFunction ]]
                -- upvalues: l_Character_0 (copy)
                l_Character_0.Humanoid.Jump = false;
                l_Character_0.Humanoid.WalkSpeed = 35;
            end;
            local function v21() --[[ Line: 55 ]] --[[ Name: endFunction ]]
                -- upvalues: v19 (copy), v15 (copy)
                if tick() - v19 >= 3 or v15.Stamina.Value <= 0 then
                    return true;
                else
                    return;
                end;
            end;
            task.wait(0.3);
            local v22 = l_Character_0.Humanoid.Animator:LoadAnimation(script.paradeLoop);
            v22:Play();
            v11:ChargeSkill(v12, {
                Key = Enum.KeyCode.E, 
                CheckFunction = v20, 
                EndFunction = v21, 
                IgnoreInstantCastSetting = true
            });
            if v18 then
                v18:FireServer();
            end;
            v22:Stop();
            task.wait(0.25);
            l_Character_0.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Firework Parade", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.upper = false;
        end;
    end;
end;
v8.DashingPyrotechnics = function(v23, v24) --[[ Line: 85 ]] --[[ Name: DashingPyrotechnics ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v23.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local v27 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.dash == false and _G.check:inspect(l_Character_1) == true then
        local v28 = v3.GetM("Dashing Pyrotechnics");
        local l_cd_1 = v28.cd;
        if _G.StamCheck("Dashing Pyrotechnics") == false then
            return;
        elseif v28.statreq and _G.MeetReq(v28.statreq) == false then
            return;
        else
            local v30, _, _ = _G.getRayFloor(l_Character_1.PrimaryPart.CFrame, 5);
            if v30 == nil then
                return nil;
            else
                local v33 = l_Character_1.Humanoid.Animator:LoadAnimation(script.dash);
                v33:Play();
                v33:AdjustWeight(2);
                l_Cooldowns_1.dash = true;
                _G.canuse = false;
                _G.FaceMouse = true;
                _G.mouseLevel = true;
                local v34 = 0;
                local v35 = game.ReplicatedStorage.Events.Skill:InvokeServer("Dashing Pyrotechnics", l_Character_1.PrimaryPart.CFrame);
                _G.PauseAnim(v33, 0.5, 1);
                local v36 = tick();
                local v37 = 0;
                do
                    local l_v34_0, l_v37_0 = v34, v37;
                    local function v40() --[[ Line: 117 ]] --[[ Name: checkFunction ]]
                        -- upvalues: l_Character_1 (copy), l_v37_0 (ref), l_v34_0 (ref)
                        l_Character_1.Humanoid.Jump = false;
                        l_Character_1.Humanoid.WalkSpeed = 0;
                        if tick() - l_v37_0 >= 0.1 then
                            l_v37_0 = tick();
                            l_v34_0 = l_v34_0 + 2;
                        end;
                    end;
                    v23:ChargeSkill(v24, {
                        Key = Enum.KeyCode.R, 
                        CheckFunction = v40, 
                        IgnoreInstantCastSetting = true, 
                        EndFunction = function() --[[ Line: 126 ]] --[[ Name: endFunction ]]
                            -- upvalues: v36 (copy), v27 (copy)
                            if tick() - v36 >= 3 or v27.Stamina.Value <= 0 then
                                return true;
                            else
                                return;
                            end;
                        end
                    });
                    l_Character_1.PrimaryPart.Anchored = true;
                    if v35 then
                        v35:FireServer(l_Character_1.PrimaryPart.CFrame, l_v34_0);
                    end;
                    v33:AdjustSpeed(1);
                    _G.FaceMouse = false;
                    _G.mouseLevel = false;
                    task.wait(0.5);
                    l_Character_1.PrimaryPart.Anchored = false;
                    l_Character_1.Humanoid.WalkSpeed = 16;
                    _G.canuse = true;
                    _G.keysetup:cooldown("Dashing Pyrotechnics", l_cd_1);
                    _G.fw(l_cd_1);
                    l_Cooldowns_1.dash = false;
                end;
            end;
        end;
    end;
end;
return v8;