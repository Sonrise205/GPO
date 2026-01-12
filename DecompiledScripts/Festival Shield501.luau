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
        guard = false, 
        care = false
    };
    return v10;
end;
v8.ShieldBash = function(v11, v12) --[[ Line: 28 ]] --[[ Name: ShieldBash ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v11.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.guard == false and _G.check:inspect(l_Character_0) == true then
        local v16 = v3.GetM("Shield Bash");
        local l_cd_0 = v16.cd;
        if _G.StamCheck("Shield Bash") == false then
            return;
        elseif v16.statreq and _G.MeetReq(v16.statreq) == false then
            return;
        else
            local v18 = l_Character_0.Humanoid.Animator:LoadAnimation(script.start);
            v18:Play();
            v18:AdjustWeight(2);
            v18:AdjustSpeed(2);
            l_Cooldowns_0.guard = true;
            _G.canuse = false;
            l_Character_0.Humanoid.WalkSpeed = 4;
            _G.PauseAnim(v18, 0.25, 1);
            local v19 = tick();
            v11:ChargeSkill(v12, {
                Key = Enum.KeyCode.E, 
                CheckFunction = function() --[[ Line: 55 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_0 (copy), v18 (copy)
                    if _G.check:inspect(l_Character_0) == false then
                        v18:Stop();
                        return true;
                    else
                        l_Character_0.Humanoid.WalkSpeed = 4;
                        return;
                    end;
                end, 
                EndFunction = function() --[[ Line: 64 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_0 (copy), v19 (copy)
                    if l_Character_0:FindFirstChild(script.Name) == nil or tick() - v19 >= 10 then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v18:AdjustSpeed(2);
            local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Shield Bash", {
                cf = l_Character_0.PrimaryPart.CFrame
            });
            l_Character_0.Humanoid.AutoRotate = true;
            l_Character_0.HumanoidRootPart.Anchored = false;
            l_Character_0.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Shield Bash", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.guard = false;
        end;
    end;
end;
v8["SharingisCaring!"] = function(v21, v22) --[[ Line: 92 ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v21.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.care == false and _G.check:inspect(l_Character_1) == true then
        local v26 = v3.GetM("Sharing is Caring!");
        local l_cd_1 = v26.cd;
        if _G.StamCheck("Sharing is Caring!") == false then
            return;
        elseif v26.statreq and _G.MeetReq(v26.statreq) == false then
            return;
        else
            _G.canuse = false;
            local v28 = false;
            local v29 = game.ReplicatedStorage.Events.Skill:InvokeServer("Sharing is Caring!", l_Character_1.PrimaryPart.CFrame);
            do
                local l_v28_0 = v28;
                v21:DoubleCastSkill(v22, {
                    Key = Enum.KeyCode.R, 
                    SkipTap = true, 
                    CompleteFunction = function() --[[ Line: 116 ]] --[[ Name: CompleteFunction ]]
                        -- upvalues: l_v28_0 (ref), v29 (copy)
                        l_v28_0 = true;
                        if v29 then
                            v29:FireServer();
                        end;
                    end, 
                    PassFunction = function() --[[ Line: 122 ]] --[[ Name: PassFunction ]]
                        -- upvalues: v21 (copy), l_Character_1 (copy)
                        return v21.Tool.Parent == l_Character_1;
                    end
                });
                repeat
                    task.wait();
                until l_v28_0 == true or v29 and v29:IsDescendantOf(game) == false;
                _G.canuse = true;
                _G.keysetup:cooldown("Sharing is Caring!", l_cd_1);
                _G.fw(l_cd_1);
                l_Cooldowns_1.care = false;
            end;
        end;
    end;
end;
return v8;