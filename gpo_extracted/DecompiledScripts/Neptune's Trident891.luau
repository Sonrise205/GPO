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
        pull = false, 
        impale = false
    };
    return v10;
end;
v8.TridentPull = function(v11, v12) --[[ Line: 28 ]] --[[ Name: TridentPull ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v11.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.pull == false and _G.check:inspect(l_Character_0) == true then
        local v16 = v3.GetM("Trident Pull");
        local l_cd_0 = v16.cd;
        if _G.StamCheck("Trident Pull") == false then
            return;
        elseif v16.statreq and _G.MeetReq(v16.statreq) == false then
            return;
        else
            local v18 = l_Character_0.Humanoid.Animator:LoadAnimation(script.pull);
            v18:Play();
            v18:AdjustWeight(2);
            l_Cooldowns_0.pull = true;
            _G.canuse = false;
            l_Character_0.Humanoid.WalkSpeed = 4;
            _G.FaceMouse = true;
            _G.PauseAnim(v18, 0.42, 1);
            local v19 = tick();
            v11:ChargeSkill(v12, {
                Key = Enum.KeyCode.E, 
                CheckFunction = function() --[[ Line: 56 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_0 (copy)
                    if _G.check:inspect(l_Character_0) == false then
                        return true;
                    else
                        l_Character_0.Humanoid.WalkSpeed = 4;
                        return;
                    end;
                end, 
                EndFunction = function() --[[ Line: 63 ]] --[[ Name: endFunction ]]
                    -- upvalues: v19 (copy), l_Character_0 (copy)
                    if tick() - v19 >= 6 or l_Character_0:FindFirstChild("Stun") then
                        return true;
                    else
                        return;
                    end;
                end
            });
            _G.FaceMouse = false;
            v18:AdjustSpeed(1);
            l_Character_0.HumanoidRootPart.Anchored = true;
            task.wait(0.1);
            task.spawn(function() --[[ Line: 79 ]]
                -- upvalues: v11 (copy)
                game.ReplicatedStorage.Events.Skill:InvokeServer("Trident Pull", {
                    cf = v11:GetMouseCFrame()
                });
            end);
            l_Character_0.Humanoid.WalkSpeed = 16;
            task.wait(0.2);
            l_Character_0.HumanoidRootPart.Anchored = false;
            _G.canuse = true;
            _G.keysetup:cooldown("Trident Pull", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.pull = false;
        end;
    end;
end;
v8.TridentImpale = function(v20, v21) --[[ Line: 92 ]] --[[ Name: TridentImpale ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v20.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.impale == false and _G.check:inspect(l_Character_1) == true then
        local v25 = v3.GetM("Trident Impale");
        local l_cd_1 = v25.cd;
        if _G.StamCheck("Trident Impale") == false then
            return;
        elseif v25.statreq and _G.MeetReq(v25.statreq) == false then
            return;
        else
            local v27 = l_Character_1.Humanoid.Animator:LoadAnimation(script.windup);
            v27:Play();
            v27:AdjustWeight(2);
            l_Cooldowns_1.impale = true;
            _G.canuse = false;
            l_Character_1.Humanoid.WalkSpeed = 4;
            _G.PauseAnim(v27, 0.25, 1);
            local _ = tick();
            local function v29() --[[ Line: 119 ]] --[[ Name: checkFunction ]]
                -- upvalues: l_Character_1 (copy)
                l_Character_1.Humanoid.WalkSpeed = 4;
            end;
            local function v30() --[[ Line: 123 ]] --[[ Name: endFunction ]]
                -- upvalues: v20 (copy), l_LocalPlayer_0 (ref), l_Character_1 (copy)
                if not v20:_findTool(l_LocalPlayer_0.Character) or _G.check:inspect(l_Character_1) == false then
                    return true;
                else
                    return;
                end;
            end;
            v20:ChargeSkill(v21, {
                Key = Enum.KeyCode.R, 
                CheckFunction = v29, 
                EndFunction = v30
            });
            v27:AdjustSpeed(2);
            if l_Character_1:FindFirstChild("Stun") == nil then
                task.wait(0.07500000000000001);
                game.ReplicatedStorage.Events.Skill:InvokeServer("Trident Impale", {
                    cf = l_Character_1.HumanoidRootPart.CFrame
                });
            end;
            l_Character_1.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Trident Impale", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1.impale = false;
        end;
    end;
end;
return v8;