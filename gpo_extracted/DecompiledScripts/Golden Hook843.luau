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
        impale = false, 
        poison = false
    };
    return v10;
end;
v8["HookImpale/Dehydrate"] = function(v11, v12) --[[ Line: 28 ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v11.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local v15 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.impale == false and _G.check:inspect(l_Character_0) == true then
        local v16 = v3.GetM("Hook Impale/Dehydrate");
        local l_cd_0 = v16.cd;
        if _G.StamCheck("Hook Impale/Dehydrate") == false then
            return;
        elseif v16.statreq and _G.MeetReq(v16.statreq) == false then
            return;
        else
            local v18 = l_Character_0.Humanoid.Animator:LoadAnimation(script.grab);
            if v15.Stats.DF.Value ~= "Suna-Suna" then
                v18 = l_Character_0.Humanoid.Animator:LoadAnimation(script.grab2);
            end;
            v18:Play();
            v18:AdjustWeight(5);
            l_Cooldowns_0.impale = true;
            _G.canuse = false;
            l_Character_0.Humanoid.WalkSpeed = 4;
            if v15.Stats.DF.Value ~= "Suna-Suna" then
                _G.PauseAnim(v18, 0.25, 1);
            else
                _G.PauseAnim(v18, 0.35, 1);
            end;
            local v19 = tick();
            do
                local l_v18_0 = v18;
                local function v21() --[[ Line: 61 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_0 (copy), l_v18_0 (ref)
                    if _G.check:inspect(l_Character_0) == false then
                        l_v18_0:Stop();
                        return true;
                    else
                        l_Character_0.Humanoid.WalkSpeed = 4;
                        return;
                    end;
                end;
                v11:ChargeSkill(v12, {
                    Key = Enum.KeyCode.R, 
                    CheckFunction = v21, 
                    EndFunction = function() --[[ Line: 70 ]] --[[ Name: endFunction ]]
                        -- upvalues: l_Character_0 (copy), v19 (copy), v15 (copy)
                        if l_Character_0:FindFirstChild(script.Name) == nil or tick() - v19 >= 5 or l_Character_0:FindFirstChild("Stun") or v15.Stamina.Value <= 0 then
                            return true;
                        else
                            return;
                        end;
                    end
                });
                l_Character_0.Humanoid.WalkSpeed = 16;
                if v15.Stats.DF.Value ~= "Suna-Suna" then
                    l_v18_0:AdjustSpeed(1.5);
                else
                    l_v18_0:AdjustSpeed(1.1);
                end;
                local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Hook Impale/Dehydrate", {
                    cf = l_Character_0.HumanoidRootPart.CFrame
                });
                _G.keysetup:cooldown("Hook Impale/Dehydrate", l_cd_0);
                task.wait(0.2);
                _G.canuse = true;
                _G.fw(l_cd_0);
                l_Cooldowns_0.impale = false;
            end;
        end;
    end;
end;
v8.ActivatePoison = function(v23, _) --[[ Line: 100 ]] --[[ Name: ActivatePoison ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v23.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.poison == false and _G.check:inspect(l_Character_1) == true then
        local v28 = v3.GetM("Activate Poison");
        local l_cd_1 = v28.cd;
        if _G.StamCheck("Activate Poison") == false then
            return;
        elseif v28.statreq and _G.MeetReq(v28.statreq) == false then
            return;
        else
            local v30 = l_Character_1.Humanoid.Animator:LoadAnimation(script.poison);
            v30:Play();
            v30:AdjustWeight(2);
            l_Cooldowns_1.poison = true;
            game.ReplicatedStorage.Events.Skill:InvokeServer("Activate Poison", {
                cf = l_Character_1.HumanoidRootPart.CFrame
            });
            _G.keysetup:cooldown("Activate Poison", l_cd_1);
            task.wait(0.5);
            _G.fw(l_cd_1);
            l_Cooldowns_1.poison = false;
        end;
    end;
end;
return v8;