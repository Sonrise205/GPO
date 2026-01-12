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
        ["Call of the Deep"] = false, 
        ["Aquatic Lunge"] = false
    };
    return v10;
end;
v8.AquaticLunge = function(v11, _) --[[ Line: 28 ]] --[[ Name: AquaticLunge ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v11.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0["Aquatic Lunge"] == false and _G.check:inspect(l_Character_0) == true then
        local v16 = v3.GetM("Aquatic Lunge");
        local l_cd_0 = v16.cd;
        if _G.StamCheck("Aquatic Lunge") == false then
            return;
        elseif v16.statreq and _G.MeetReq(v16.statreq) == false then
            return;
        else
            l_Cooldowns_0["Aquatic Lunge"] = true;
            _G.canuse = false;
            l_Character_0.Humanoid.WalkSpeed = 4;
            local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Aquatic Lunge");
            task.wait(0.25);
            l_Character_0.Humanoid.WalkSpeed = 16;
            l_Character_0.Humanoid.AutoRotate = true;
            _G.canuse = true;
            _G.keysetup:cooldown("Aquatic Lunge", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0["Aquatic Lunge"] = false;
        end;
    end;
end;
v8.CalloftheDeep = function(v19, v20) --[[ Line: 61 ]] --[[ Name: CalloftheDeep ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v19.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1["Call of the Deep"] == false and _G.check:inspect(l_Character_1) == true then
        local v24 = v3.GetM("Call of the Deep");
        local l_cd_1 = v24.cd;
        if _G.StamCheck("Call of the Deep") == false then
            return;
        elseif v24.statreq and _G.MeetReq(v24.statreq) == false then
            return;
        else
            l_Cooldowns_1["Call of the Deep"] = true;
            _G.FaceMouse = true;
            _G.canuse = false;
            local v26 = l_Character_1.Humanoid.Animator:LoadAnimation(script.callofdeep);
            v26:Play();
            v26:AdjustWeight(2);
            v26.Priority = Enum.AnimationPriority.Action4;
            local v27 = game.ReplicatedStorage.Events.Skill:InvokeServer("Call of the Deep");
            local v28 = tick();
            local function v29() --[[ Line: 91 ]] --[[ Name: checkFunction ]]

            end;
            local function v30() --[[ Line: 98 ]] --[[ Name: endFunction ]]
                -- upvalues: l_Character_1 (copy), v28 (copy)
                if l_Character_1:FindFirstChild(script.Name) == nil or tick() - v28 >= 10 then
                    return true;
                else
                    return;
                end;
            end;
            _G.PauseAnim(v26, 0.3, 0.7);
            v19:ChargeSkill(v20, {
                Key = Enum.KeyCode.R, 
                CheckFunction = v29, 
                EndFunction = v30
            });
            v26:AdjustSpeed(2);
            _G.FaceMouse = false;
            local l_CFrame_0 = l_Character_1.PrimaryPart.CFrame;
            l_Character_1.PrimaryPart.Anchored = true;
            l_Character_1.Humanoid.AutoRotate = false;
            if v27 then
                v27:InvokeServer(l_CFrame_0);
            end;
            task.wait(0.4);
            l_Character_1.PrimaryPart.Anchored = false;
            _G.canuse = true;
            _G.keysetup:cooldown("Call of the Deep", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1["Call of the Deep"] = false;
        end;
    end;
end;
return v8;