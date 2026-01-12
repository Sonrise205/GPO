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
        triple = false, 
        souleater = false
    };
    v10.doingSlash = false;
    return v10;
end;
v8.THETROXX = function(v11, v12) --[[ Line: 28 ]] --[[ Name: THETROXX ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v11.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.triple == false and _G.check:inspect(l_Character_0) == true and v11.doingSlash == false and _G.canuse == true then
        local v16 = v3.GetM("THE TROXX");
        local l_cd_0 = v16.cd;
        if _G.StamCheck("THE TROXX") == false then
            return;
        elseif v16.statreq and _G.MeetReq(v16.statreq) == false then
            return;
        else
            _G.canuse = false;
            local v18 = game.ReplicatedStorage.Events.Skill:InvokeServer("THE TROXX");
            if v18 == nil then
                _G.canuse = true;
                return;
            else
                local v19 = 1;
                local v20 = false;
                do
                    local l_v19_0, l_v20_0 = v19, v20;
                    local function v25() --[[ Line: 58 ]] --[[ Name: slash ]]
                        -- upvalues: v11 (copy), l_v20_0 (ref), l_Character_0 (copy), l_v19_0 (ref), l_Cooldowns_0 (copy), v18 (copy)
                        _G.canuse = false;
                        v11.doingSlash = true;
                        l_v20_0 = true;
                        local v23 = l_Character_0.Humanoid.Animator:LoadAnimation(script["s" .. l_v19_0]);
                        v23:Play();
                        v23.Priority = Enum.AnimationPriority.Action4;
                        v23:AdjustWeight(2);
                        l_Cooldowns_0.triple = true;
                        v23:AdjustSpeed(1);
                        l_Character_0.Humanoid.AutoRotate = false;
                        local v24 = l_Character_0.HumanoidRootPart.CFrame * CFrame.new(0, -1, -1);
                        if v18 and v18:InvokeServer(v24) == false then
                            l_v19_0 = l_v19_0 - 1;
                        end;
                        task.wait(0.2);
                        task.wait(0.75);
                        _G.canuse = true;
                        l_Character_0.Humanoid.AutoRotate = true;
                        l_v20_0 = false;
                    end;
                    v25();
                    local function v26() --[[ Line: 88 ]] --[[ Name: doSlash ]]
                        -- upvalues: v11 (copy), v12 (copy), l_v19_0 (ref), v25 (copy), l_cd_0 (copy), l_Cooldowns_0 (copy), v26 (copy), l_Character_0 (copy), l_v20_0 (ref)
                        v11:DoubleCastSkill(v12, {
                            Key = Enum.KeyCode.E, 
                            SkipTap = true, 
                            CompleteFunction = function() --[[ Line: 92 ]] --[[ Name: CompleteFunction ]]
                                -- upvalues: l_v19_0 (ref), v25 (ref), v11 (ref), l_cd_0 (ref), l_Cooldowns_0 (ref), v26 (ref)
                                l_v19_0 = l_v19_0 + 1;
                                v25();
                                if l_v19_0 >= 3 then
                                    v11.doingSlash = false;
                                    _G.canuse = true;
                                    _G.keysetup:cooldown("THE TROXX", l_cd_0);
                                    _G.fw(l_cd_0);
                                    l_Cooldowns_0.triple = false;
                                    return;
                                else
                                    v26();
                                    return;
                                end;
                            end, 
                            PassFunction = function() --[[ Line: 107 ]] --[[ Name: PassFunction ]]
                                -- upvalues: l_Character_0 (ref), l_v20_0 (ref)
                                return l_Character_0:FindFirstChild(script.Name) and l_v20_0 == false and _G.check:inspect(l_Character_0) == true and _G.canuse == true;
                            end
                        });
                    end;
                    v26();
                    l_Character_0.HumanoidRootPart.Anchored = false;
                    l_Character_0.Humanoid.WalkSpeed = 16;
                    _G.canuse = true;
                end;
            end;
        end;
    end;
end;
v8.SoulEater = function(v27, v28) --[[ Line: 121 ]] --[[ Name: SoulEater ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v27.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.souleater == false and _G.check:inspect(l_Character_1) == true and _G.canuse == true then
        local v32 = v3.GetM("Soul Eater");
        local l_cd_1 = v32.cd;
        if _G.StamCheck("Soul Eater") == false then
            return;
        elseif v32.statreq and _G.MeetReq(v32.statreq) == false then
            return;
        else
            _G.canuse = false;
            local v34 = l_Character_1.Humanoid.Animator:LoadAnimation(script.soul);
            v34:Play();
            v34:AdjustWeight(2);
            l_Cooldowns_1.souleater = true;
            l_Character_1.Humanoid.WalkSpeed = 8;
            local v35 = game.ReplicatedStorage.Events.Skill:InvokeServer("Soul Eater");
            _G.PauseAnim(v34, 0.25, 1);
            local v36 = tick();
            v27:ChargeSkill(v28, {
                Key = Enum.KeyCode.R, 
                CheckFunction = function() --[[ Line: 148 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_1 (copy)
                    l_Character_1.Humanoid.WalkSpeed = 8;
                end, 
                EndFunction = function() --[[ Line: 153 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_1 (copy), v36 (copy)
                    if l_Character_1:FindFirstChild(script.Name) == nil or tick() - v36 >= 10 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v34:AdjustSpeed(1);
            task.wait(0.1);
            if v35 then
                v35:FireServer(l_Character_1.HumanoidRootPart.CFrame);
            end;
            task.wait(0.4);
            l_Character_1.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Soul Eater", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1.souleater = false;
        end;
    end;
end;
return v8;