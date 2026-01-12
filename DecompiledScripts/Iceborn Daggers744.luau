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
v8.IcebornAura = function(v11, _) --[[ Line: 28 ]] --[[ Name: IcebornAura ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v11.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.upper == false and _G.check:inspect(l_Character_0) == true then
        local v16 = v3.GetM("Iceborn Aura");
        local l_cd_0 = v16.cd;
        if _G.StamCheck("Iceborn Aura") == false then
            return;
        elseif v16.statreq and _G.MeetReq(v16.statreq) == false then
            return;
        else
            l_Cooldowns_0.upper = true;
            local v18 = l_Character_0.Humanoid.Animator:LoadAnimation(script.active);
            v18:Play();
            v18:AdjustWeight(2);
            v18:AdjustSpeed(2);
            local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Iceborn Aura");
            _G.keysetup:cooldown("Iceborn Aura", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.upper = false;
        end;
    end;
end;
v8.IcebornDeathLotus = function(v20, v21) --[[ Line: 56 ]] --[[ Name: IcebornDeathLotus ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v20.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local v24 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.dash == false and _G.check:inspect(l_Character_1) == true then
        local v25 = v3.GetM("Iceborn Death Lotus");
        local l_cd_1 = v25.cd;
        if _G.StamCheck("Iceborn Death Lotus") == false then
            return;
        elseif v25.statreq and _G.MeetReq(v25.statreq) == false then
            return;
        else
            local v27, _, _ = _G.getRayFloor(l_Character_1.PrimaryPart.CFrame, 5);
            if v27 == nil then
                return nil;
            else
                local v30 = l_Character_1.Humanoid.Animator:LoadAnimation(script.startup);
                v30:Play();
                v30:AdjustWeight(2);
                l_Cooldowns_1.dash = true;
                _G.canuse = false;
                local v31 = game.ReplicatedStorage.Events.Skill:InvokeServer("Iceborn Death Lotus");
                task.wait(0.4);
                local v32 = l_Character_1.Humanoid.Animator:LoadAnimation(script.loop);
                v32:Play();
                v32:AdjustWeight(2);
                v32:AdjustSpeed(2);
                l_Character_1.PrimaryPart.Anchored = true;
                local v33 = tick();
                local function v34() --[[ Line: 89 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_Character_1 (copy)
                    l_Character_1.Humanoid.Jump = false;
                    l_Character_1.Humanoid.WalkSpeed = 0;
                end;
                local function v35() --[[ Line: 94 ]] --[[ Name: endFunction ]]
                    -- upvalues: v33 (copy), v24 (copy)
                    if tick() - v33 >= 3 or v24.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end;
                task.wait(0.5);
                v20:ChargeSkill(v21, {
                    Key = Enum.KeyCode.R, 
                    CheckFunction = v34, 
                    EndFunction = v35, 
                    IgnoreInstantCastSetting = true
                });
                if v31 then
                    v31:FireServer();
                end;
                v32:Stop();
                local v36 = l_Character_1.Humanoid.Animator:LoadAnimation(script.endd);
                v36:Play();
                v36:AdjustWeight(2);
                task.wait(0.5);
                l_Character_1.PrimaryPart.Anchored = false;
                l_Character_1.Humanoid.WalkSpeed = 16;
                _G.canuse = true;
                _G.keysetup:cooldown("Iceborn Death Lotus", l_cd_1);
                _G.fw(l_cd_1);
                l_Cooldowns_1.dash = false;
            end;
        end;
    end;
end;
return v8;