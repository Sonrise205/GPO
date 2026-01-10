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
        rain = false, 
        burst = false
    };
    return v10;
end;
local function v23(v11, v12) --[[ Line: 28 ]] --[[ Name: playAnimation ]]
    local v16 = {
        anims = {}, 
        Stop = function(v13) --[[ Line: 33 ]] --[[ Name: Stop ]]
            for v14 = 1, #v13.anims do
                v13.anims[v14]:Stop();
            end;
        end, 
        Destroy = function(v15) --[[ Line: 39 ]] --[[ Name: Destroy ]]
            v15.anims = nil;
            v15 = nil;
        end
    };
    local v17 = 2;
    local v18 = false;
    local function v21(v19) --[[ Line: 47 ]] --[[ Name: addAnim ]]
        -- upvalues: v12 (copy), v17 (ref), v16 (copy), v18 (ref)
        local v20 = v19:LoadAnimation(v12);
        v20:Play();
        v20.Priority = Enum.AnimationPriority.Action4;
        v17 = v20.Length;
        table.insert(v16.anims, v20);
        if v18 == false then
            v18 = true;
            v20.Stopped:Connect(function() --[[ Line: 55 ]]
                -- upvalues: v16 (ref)
                task.wait(1);
                v16:Destroy();
            end);
        end;
    end;
    local l_v11_FirstChild_0 = v11:FindFirstChild(script.Name .. "Sword");
    if l_v11_FirstChild_0 then
        v21(l_v11_FirstChild_0.AnimationController);
    end;
    v21(v11.Humanoid);
    return v16;
end;
v8["Cupid'sRain"] = function(v24, v25) --[[ Line: 72 ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy), v23 (copy)
    local l_Cooldowns_0 = v24.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.rain == false and _G.check:inspect(l_Character_0) == true then
        local v29 = v3.GetM("Cupid's Rain");
        local l_cd_0 = v29.cd;
        if _G.StamCheck("Cupid's Rain") == false then
            return;
        elseif v29.statreq and _G.MeetReq(v29.statreq) == false then
            return;
        else
            _G.canuse = false;
            l_Cooldowns_0.rain = true;
            _G.FaceMouse = true;
            _G.mouseLevel = true;
            local v31 = v23(l_Character_0, script.rainLoop);
            local v32 = tick();
            local v33 = game.ReplicatedStorage.Events.Skill:InvokeServer("Cupid's Rain");
            v24:ChargeSkill(v25, {
                Key = Enum.KeyCode.E, 
                IgnoreInstantCastSetting = true, 
                EndFunction = function() --[[ Line: 98 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_0 (copy), v32 (copy)
                    if l_Character_0:FindFirstChild(script.Name) == nil or tick() - v32 >= 10 then
                        return true;
                    elseif _G.check:inspect(l_Character_0) == false then
                        return true;
                    else
                        return;
                    end;
                end
            });
            v31:Stop();
            local _ = v23(l_Character_0, script.rainFire);
            if v33 then
                v33:FireServer(v24:GetMouseCFrame());
            end;
            l_Character_0.PrimaryPart.Anchored = true;
            l_Character_0.Humanoid.AutoRotate = false;
            _G.FaceMouse = false;
            _G.mouseLevel = nil;
            task.wait(0.3);
            _G.canuse = true;
            _G.keysetup:cooldown("Cupid's Rain", l_cd_0);
            l_Character_0.PrimaryPart.Anchored = false;
            l_Character_0.Humanoid.AutoRotate = true;
            _G.fw(l_cd_0);
            l_Cooldowns_0.rain = false;
        end;
    end;
end;
v8.CupidBurst = function(v35, v36) --[[ Line: 136 ]] --[[ Name: CupidBurst ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy), v23 (copy)
    local l_Cooldowns_1 = v35.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.burst == false and _G.check:inspect(l_Character_1) == true then
        local v40 = v3.GetM("Cupid Burst");
        local l_cd_1 = v40.cd;
        if _G.StamCheck("Cupid Burst") == false then
            return;
        elseif v40.statreq and _G.MeetReq(v40.statreq) == false then
            return;
        else
            _G.canuse = false;
            l_Cooldowns_1.burst = true;
            _G.FaceMouse = true;
            local v42 = v23(l_Character_1, script.burstLoop);
            local v43 = tick();
            local v44 = game.ReplicatedStorage.Events.Skill:InvokeServer("Cupid Burst");
            v35:ChargeSkill(v36, {
                Key = Enum.KeyCode.R, 
                EndFunction = function() --[[ Line: 161 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_1 (copy), v43 (copy)
                    if l_Character_1:FindFirstChild(script.Name) == nil or tick() - v43 >= 10 then
                        return true;
                    elseif _G.check:inspect(l_Character_1) == false then
                        return true;
                    else
                        return;
                    end;
                end, 
                HoldDuration = 0.3
            });
            v42:Stop();
            local _ = v23(l_Character_1, script.burstFire);
            _G.FaceMouse = false;
            l_Character_1.PrimaryPart.Anchored = true;
            if v44 then
                v44:FireServer(l_Character_1.PrimaryPart.CFrame);
            end;
            task.wait(0.75);
            l_Character_1.PrimaryPart.Anchored = false;
            _G.canuse = true;
            _G.keysetup:cooldown("Cupid Burst", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1.burst = false;
        end;
    end;
end;
return v8;