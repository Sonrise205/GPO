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
    -- upvalues: v4 (copy), v8 (copy), l_LocalPlayer_0 (copy)
    local v10 = setmetatable(v4.new(script.Name), v8);
    local _ = game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
    v10.Cooldowns = {
        ["Gut Punch"] = false, 
        ["Ground Smash"] = false
    };
    return v10;
end;
local function _() --[[ Line: 30 ]] --[[ Name: getTools ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    local v12 = nil;
    local l_Children_0 = l_LocalPlayer_0.Backpack:GetChildren();
    for v14 = 1, #l_Children_0 do
        if l_Children_0[v14]:IsA("Tool") and l_Children_0[v14]:FindFirstChild("SwordEquip") then
            return l_Children_0[v14].Name;
        end;
    end;
    return v12;
end;
v8.GroundSmash = function(v16, v17) --[[ Line: 42 ]] --[[ Name: GroundSmash ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v16.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    local _ = game.ReplicatedStorage:WaitForChild("CombatAnimations", 1);
    if l_Character_0:FindFirstChild("Melee") and l_Cooldowns_0["Ground Smash"] == false and _G.canuse == true and _G.check:inspect(l_Character_0) == true and _G.StamCheck("Ground Smash") == true then
        local v22 = v3.GetM("Ground Smash");
        local l_cd_0 = v22.cd;
        if v22.statreq and _G.MeetReq(v22.statreq) == false then
            return;
        else
            l_Cooldowns_0["Ground Smash"] = true;
            _G.canuse = false;
            local v24 = tick();
            local v25 = l_Character_0.Humanoid:LoadAnimation(script.charge);
            v25:Play();
            v25.Priority = Enum.AnimationPriority.Action;
            v25:AdjustWeight(2);
            l_Character_0.Humanoid.WalkSpeed = 2;
            local v26 = game.ReplicatedStorage.Events.Skill:InvokeServer("Ground Smash");
            _G.PauseAnim(v25, 0.5, 1);
            v16:ChargeSkill(v17, {
                Key = Enum.KeyCode.R, 
                EndFunction = function() --[[ Line: 69 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_0 (copy), v24 (copy)
                    if _G.check:inspect(l_Character_0) == false or tick() - v24 >= 3 then
                        return true;
                    else
                        l_Character_0.Humanoid.WalkSpeed = 2;
                        return;
                    end;
                end
            });
            v25:Stop();
            l_Character_0.Humanoid:LoadAnimation(script.slam):Play();
            if v26 then
                v26:FireServer(l_Character_0.PrimaryPart.CFrame * CFrame.new(0, 0, -2));
            end;
            task.wait(0.25);
            _G.canuse = true;
            l_Character_0.Humanoid.WalkSpeed = 16;
            _G.keysetup:cooldown("Ground Smash", l_cd_0);
            task.wait(l_cd_0);
            l_Cooldowns_0["Ground Smash"] = false;
        end;
    end;
end;
v8.GutPunch = function(v27, v28) --[[ Line: 99 ]] --[[ Name: GutPunch ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v27.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    local v32 = game.ReplicatedStorage:WaitForChild("CombatAnimations", 1);
    if l_Character_1:FindFirstChild("Melee") and l_Cooldowns_1["Gut Punch"] == false and _G.canuse == true and _G.check:inspect(l_Character_1) == true and _G.StamCheck("Gut Punch") == true then
        local v33 = v3.GetM("Gut Punch");
        local l_cd_1 = v33.cd;
        if v33.statreq and _G.MeetReq(v33.statreq) == false then
            return;
        else
            l_Cooldowns_1["Gut Punch"] = true;
            _G.canuse = false;
            game.ReplicatedStorage.Events.StamRequest:InvokeServer("Gut Punch");
            local _ = game:GetService("HttpService"):GenerateGUID(true);
            local v36 = tick();
            local v37 = nil;
            v37 = l_Character_1.Humanoid:LoadAnimation(v32.Melee.GutPunch);
            v37:Play();
            v37.Priority = Enum.AnimationPriority.Action;
            v37:AdjustSpeed(3);
            v37:AdjustWeight(2);
            l_Character_1.Humanoid.WalkSpeed = 5;
            _G.PauseAnim(v37, 0.5, 3);
            game.ReplicatedStorage.Util.Melee.Ace_sound:Play();
            v27:ChargeSkill(v28, {
                Key = Enum.KeyCode.E, 
                EndFunction = function() --[[ Line: 140 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_1 (copy), v36 (copy)
                    if _G.check:inspect(l_Character_1) == false or tick() - v36 >= 2 then
                        return true;
                    else
                        l_Character_1.Humanoid.WalkSpeed = 5;
                        return;
                    end;
                end
            });
            game.ReplicatedStorage.Util.Melee.Ace_sound:Stop();
            v37:AdjustSpeed(3);
            local _ = l_Character_1.RightHand;
            local v39 = nil;
            local v40 = false;
            do
                local l_v37_0, l_v39_0, l_v40_0 = v37, v39, v40;
                local function v45(v44) --[[ Line: 159 ]] --[[ Name: hitfound ]]
                    -- upvalues: l_v39_0 (ref)
                    l_v39_0 = true;
                    game.ReplicatedStorage.Events.Skill:InvokeServer("Gut Punch", {
                        Target = v44.Parent
                    });
                end;
                local function v46() --[[ Line: 164 ]] --[[ Name: hitinter ]]
                    -- upvalues: l_v40_0 (ref), l_v37_0 (ref)
                    l_v40_0 = true;
                    l_v37_0:Stop();
                end;
                task.spawn(function() --[[ Line: 169 ]]
                    game.ReplicatedStorage.Events.CombatRegister:InvokeServer({
                        "swingsfx", 
                        "Melee", 
                        true
                    });
                end);
                _G.hitbox:start(l_Character_1, Vector3.new(5, 5, 5, 0), 0.3, CFrame.new(0, 0, -1), v45, v46);
                local _ = tick();
                _G.canuse = true;
                l_Character_1.Humanoid.WalkSpeed = 16;
                l_Character_1.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true);
                _G.keysetup:cooldown("Gut Punch", l_cd_1);
                task.wait(l_cd_1);
                l_Cooldowns_1["Gut Punch"] = false;
            end;
        end;
    end;
end;
return v8;