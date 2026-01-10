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
        rend = false, 
        sweep = false
    };
    return v10;
end;
v8["ShadowExtraction/ScissorImpale"] = function(v11, v12) --[[ Line: 28 ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v11.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local v15 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.rend == false and _G.check:inspect(l_Character_0) == true then
        local v16 = v3.GetM("Shadow Extraction/Scissor Impale");
        local l_cd_0 = v16.cd;
        if _G.StamCheck("Shadow Extraction/Scissor Impale") == false then
            return;
        elseif v16.statreq and _G.MeetReq(v16.statreq) == false then
            return;
        else
            local v18 = l_Character_0.Humanoid.Animator:LoadAnimation(script.grab2);
            if v15.Stats.DF.Value == "Kage-Kage" then
                v18 = l_Character_0.Humanoid.Animator:LoadAnimation(script.grab);
            end;
            v18:Play();
            v18:AdjustWeight(2);
            l_Cooldowns_0.rend = true;
            _G.canuse = false;
            local v19 = game.ReplicatedStorage.Events.Skill:InvokeServer("Shadow Extraction/Scissor Impale");
            _G.PauseAnim(v18, 0.35, 1);
            local v20 = tick();
            local function v21() --[[ Line: 56 ]] --[[ Name: checkFunction ]]
                -- upvalues: l_Character_0 (copy)
                l_Character_0.Humanoid.WalkSpeed = 4;
                _G.canuse = false;
            end;
            do
                local l_v18_0 = v18;
                local function v23() --[[ Line: 61 ]] --[[ Name: endFunction ]]
                    -- upvalues: v11 (copy), l_LocalPlayer_0 (ref), v20 (copy), l_Character_0 (copy), l_v18_0 (ref)
                    if not v11:_findTool(l_LocalPlayer_0.Character) or tick() - v20 >= 10 or _G.check:inspect(l_Character_0) == false then
                        l_v18_0:Stop();
                        return true;
                    else
                        return;
                    end;
                end;
                v11:ChargeSkill(v12, {
                    Key = Enum.KeyCode.R, 
                    CheckFunction = v21, 
                    EndFunction = v23
                });
                l_v18_0:AdjustSpeed(1);
                task.wait(0.1);
                if v19 then
                    v19:FireServer(l_Character_0.HumanoidRootPart.CFrame);
                end;
                l_Character_0.Humanoid.WalkSpeed = 16;
                _G.canuse = true;
                _G.keysetup:cooldown("Shadow Extraction/Scissor Impale", l_cd_0);
                _G.fw(l_cd_0);
                l_Cooldowns_0.rend = false;
            end;
        end;
    end;
end;
v8.BladeWhirl = function(v24, _) --[[ Line: 88 ]] --[[ Name: BladeWhirl ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v24.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.sweep == false and _G.check:inspect(l_Character_1) == true then
        local v29 = v3.GetM("Blade Whirl");
        local l_cd_1 = v29.cd;
        if _G.StamCheck("Blade Whirl") == false then
            return;
        elseif v29.statreq and _G.MeetReq(v29.statreq) == false then
            return;
        else
            local v31 = l_Character_1.Humanoid.Animator:LoadAnimation(script.throw);
            v31:Play();
            v31:AdjustWeight(2);
            v31:AdjustSpeed(1);
            _G.canuse = false;
            local l_l_Character_1_FirstChild_0 = l_Character_1:FindFirstChild("Moria's ScissorsSword");
            if l_l_Character_1_FirstChild_0 then
                local v33 = l_l_Character_1_FirstChild_0.AnimationController:LoadAnimation(script.throw);
                v33:Play();
                v33:AdjustWeight(2);
                v33:AdjustSpeed(1);
            end;
            local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Blade Whirl");
            l_Cooldowns_1.sweep = true;
            _G.canuse = false;
            task.wait(0.4);
            l_Character_1.Humanoid.WalkSpeed = 16;
            _G.canuse = true;
            _G.keysetup:cooldown("Blade Whirl", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1.sweep = false;
        end;
    end;
end;
return v8;