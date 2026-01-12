local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v3 = require(game.ReplicatedStorage.Modules.Skills);
local v4 = require(script.Parent.Parent.MobileBase);
local _ = require(l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule"));
local _ = game:GetService("UserInputService");
local _ = l_LocalPlayer_0:GetMouse();
local v8 = setmetatable({}, v4);
v8.__index = v8;
v8.new = function(_, _, _) --[[ Line: 20 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v8 (copy), l_LocalPlayer_0 (copy)
    local v12 = setmetatable(v4.new(script.Name), v8);
    v12.Cooldowns = {
        BarrierC = false, 
        Sphere = false, 
        Stairs = false, 
        Smash = false, 
        Spike = false
    };
    local l_Character_0 = l_LocalPlayer_0.Character;
    v12.crosshold = l_Character_0.Humanoid:LoadAnimation(script.crosshold);
    v12.release = function(v14) --[[ Line: 29 ]]
        -- upvalues: l_Character_0 (copy)
        local v15 = l_Character_0.Humanoid:LoadAnimation(script[v14]);
        v15:Play();
        v15:AdjustWeight(2);
        task.wait(0.3);
        return v15;
    end;
    v12.hold = function() --[[ Line: 37 ]]
        -- upvalues: v12 (copy)
        v12.crosshold:Play();
        task.spawn(function() --[[ Line: 39 ]]
            -- upvalues: v12 (ref)
            _G.PauseAnim(v12.crosshold, 0.4, 1);
        end);
        task.wait(0.4);
    end;
    return v12;
end;
v8.BarrierCrash = function(v16, v17) --[[ Line: 48 ]] --[[ Name: BarrierCrash ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v16.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local v20 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.BarrierC == false and _G.check:inspect(l_Character_1) == true and _G.StamCheck("Barrier Crash") == true then
        local v21 = v3.GetM("Barrier Crash");
        local l_cd_0 = v21.cd;
        if _G.StamCheck("Barrier Crash") == false then
            return;
        elseif v21.statreq and _G.MeetReq(v21.statreq) == false then
            return;
        else
            l_Cooldowns_0.BarrierC = true;
            _G.canuse = false;
            v16.hold();
            local v23 = game.ReplicatedStorage.Events.Skill:InvokeServer("Barrier Crash", {});
            local v24 = nil;
            local v25 = nil;
            if v23 then
                local v26, v27 = unpack(v23);
                v24 = v26;
                v25 = v27;
            end;
            local v28 = tick();
            do
                local l_v25_0 = v25;
                local function v30() --[[ Line: 75 ]] --[[ Name: checkFunction ]]
                    -- upvalues: l_v25_0 (ref), v28 (copy)
                    if l_v25_0 and l_v25_0.PrimaryPart ~= nil then
                        l_v25_0.PrimaryPart.CanCollide = false;
                    end;
                    if tick() - v28 >= 30 then
                        return false;
                    else
                        return;
                    end;
                end;
                v16:ToggleSkill(v17, {
                    Key = Enum.KeyCode.E, 
                    CheckFunction = v30, 
                    EndFunction = function() --[[ Line: 84 ]] --[[ Name: endFunction ]]
                        -- upvalues: l_Character_1 (copy), v20 (copy)
                        if not l_Character_1:FindFirstChild(script.Name) or l_Character_1.Parent == nil or l_Character_1.Parent ~= workspace.PlayerCharacters or v20.Stamina.Value <= 0 then
                            return true;
                        else
                            return;
                        end;
                    end, 
                    IgnoreInstantCastSetting = true
                });
                v16.crosshold:Stop();
                if v24 then
                    v16.release("crash");
                    if v24:IsDescendantOf(game) then
                        v24:InvokeServer();
                    end;
                end;
                if l_v25_0 and l_v25_0.PrimaryPart ~= nil then
                    l_v25_0.PrimaryPart.CanCollide = true;
                end;
                task.wait(0.25);
                _G.canuse = true;
                _G.keysetup:cooldown("Barrier Crash", l_cd_0);
                _G.fw(l_cd_0);
                l_Cooldowns_0.BarrierC = false;
            end;
        end;
    end;
end;
v8.BarrierSphere = function(v31, v32) --[[ Line: 116 ]] --[[ Name: BarrierSphere ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v31.Cooldowns;
    local l_Character_2 = l_LocalPlayer_0.Character;
    local v35 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.Sphere == false and _G.check:inspect(l_Character_2) == true and _G.StamCheck("Barrier Sphere") == true then
        local v36 = v3.GetM("Barrier Sphere");
        local l_cd_1 = v36.cd;
        if _G.StamCheck("Barrier Sphere") == false then
            return;
        elseif v36.statreq and _G.MeetReq(v36.statreq) == false then
            return;
        else
            l_Cooldowns_1.Sphere = true;
            _G.canuse = false;
            local v38 = tick();
            local v39 = v31.release("sphere");
            v39:AdjustSpeed(0);
            local v40 = game.ReplicatedStorage.Events.Skill:InvokeServer("Barrier Sphere", {
                cf = v31:GetMouseCFrame()
            });
            v31:ToggleSkill(v32, {
                Key = Enum.KeyCode.R, 
                EndFunction = function() --[[ Line: 137 ]] --[[ Name: endFunction ]]
                    -- upvalues: v35 (copy), l_Character_2 (copy), v38 (copy)
                    if v35.Stamina.Value <= 0 or not l_Character_2:FindFirstChild(script.Name) or l_Character_2.Parent == nil or l_Character_2.Parent ~= workspace.PlayerCharacters or tick() - v38 >= 60 or l_Character_2:findFirstChild("Stun") then
                        return true;
                    else
                        return;
                    end;
                end, 
                IgnoreInstantCastSetting = true
            });
            v39:Stop();
            if v40 and v40:GetAttribute("released") == nil then
                task.spawn(function() --[[ Line: 153 ]]
                    -- upvalues: v40 (copy)
                    v40:InvokeServer();
                end);
            end;
            task.wait(0.25);
            _G.canuse = true;
            _G.keysetup:cooldown("Barrier Sphere", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1.Sphere = false;
        end;
    end;
end;
v8.BarrierStairs = function(v41, v42) --[[ Line: 166 ]] --[[ Name: BarrierStairs ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_2 = v41.Cooldowns;
    local l_Character_3 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_2.Stairs == false and _G.check:inspect(l_Character_3) == true and _G.StamCheck("Barrier Stairs") == true then
        local v46 = v3.GetM("Barrier Stairs");
        local l_cd_2 = v46.cd;
        if _G.StamCheck("Barrier Stairs") == false then
            return;
        elseif v46.statreq and _G.MeetReq(v46.statreq) == false then
            return;
        else
            l_Cooldowns_2.Stairs = true;
            _G.canuse = false;
            local v48 = v41.release("stair");
            v48:AdjustSpeed(0);
            local v49 = game.ReplicatedStorage.Events.Skill:InvokeServer("Barrier Stairs", {
                cf = v41:GetMouseCFrame()
            });
            v41:ToggleSkill(v42, {
                Key = Enum.KeyCode.Z, 
                EndFunction = function() --[[ Line: 186 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_3 (copy)
                    if l_Character_3:FindFirstChild("Stun") or not l_Character_3:FindFirstChild(script.Name) or l_Character_3.Parent == nil or l_Character_3.Parent ~= workspace.PlayerCharacters then
                        return true;
                    else
                        return;
                    end;
                end, 
                IgnoreInstantCastSetting = true
            });
            v48:Stop();
            _G.canuse = true;
            if v49 then
                v49:InvokeServer();
            end;
            _G.keysetup:cooldown("Barrier Stairs", l_cd_2);
            _G.fw(l_cd_2);
            l_Cooldowns_2.Stairs = false;
        end;
    end;
end;
v8.BarrierCage = function(v50, v51) --[[ Line: 213 ]] --[[ Name: BarrierCage ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_3 = v50.Cooldowns;
    local l_Character_4 = l_LocalPlayer_0.Character;
    local v54 = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_3.Smash == false and _G.check:inspect(l_Character_4) == true and _G.StamCheck("Barrier Cage") == true then
        local v55 = v3.GetM("Barrier Cage");
        local l_cd_3 = v55.cd;
        if _G.StamCheck("Barrier Cage") == false then
            return;
        elseif v55.statreq and _G.MeetReq(v55.statreq) == false then
            return;
        else
            l_Cooldowns_3.Smash = true;
            _G.canuse = false;
            v50.hold();
            local v57 = game.ReplicatedStorage.Events.Skill:InvokeServer("Barrier Cage", {
                cf = v50:GetMouseCFrame()
            });
            v50:ToggleSkill(v51, {
                Key = Enum.KeyCode.X, 
                EndFunction = function() --[[ Line: 233 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_4 (copy), v54 (copy)
                    if l_Character_4:FindFirstChild("Stun") or not l_Character_4:FindFirstChild(script.Name) or l_Character_4.Parent == nil or l_Character_4.Parent ~= workspace.PlayerCharacters or v54.Stamina.Value <= 0 then
                        return true;
                    else
                        return;
                    end;
                end, 
                IgnoreInstantCastSetting = true
            });
            v50.crosshold:Stop();
            if v57 then
                task.spawn(function() --[[ Line: 248 ]]
                    -- upvalues: v50 (copy)
                    v50.release("cage");
                end);
                v57:InvokeServer();
            end;
            _G.canuse = true;
            _G.keysetup:cooldown("Barrier Cage", l_cd_3);
            _G.fw(l_cd_3);
            l_Cooldowns_3.Smash = false;
        end;
    end;
end;
v8.BarrierSpikes = function(v58, v59) --[[ Line: 260 ]] --[[ Name: BarrierSpikes ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_4 = v58.Cooldowns;
    local l_Character_5 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_4.Spike == false and _G.check:inspect(l_Character_5) == true and _G.StamCheck("Barrier Spikes") == true then
        local v63 = v3.GetM("Barrier Spikes");
        local l_cd_4 = v63.cd;
        if _G.StamCheck("Barrier Spikes") == false then
            return;
        elseif v63.statreq and _G.MeetReq(v63.statreq) == false then
            return;
        else
            l_Cooldowns_4.Spike = true;
            _G.canuse = false;
            local v65 = l_Character_5.Humanoid:LoadAnimation(script.spike);
            v65:Play();
            v65:AdjustSpeed(0);
            v65:AdjustWeight(2);
            local v66 = game.ReplicatedStorage.Events.Skill:InvokeServer("Barrier Spikes", {
                cf = v58:GetMouseCFrame()
            });
            v58:ChargeSkill(v59, {
                Key = Enum.KeyCode.C, 
                EndFunction = function() --[[ Line: 283 ]] --[[ Name: endFunction ]]
                    -- upvalues: l_Character_5 (copy)
                    if l_Character_5:FindFirstChild("Stun") or not l_Character_5:FindFirstChild(script.Name) or l_Character_5.Parent == nil or l_Character_5.Parent ~= workspace.PlayerCharacters then
                        return true;
                    else
                        return;
                    end;
                end, 
                IgnoreInstantCastSetting = true
            });
            v65:AdjustSpeed(1);
            task.wait(0.3);
            if v66 then
                v66:InvokeServer();
            end;
            _G.canuse = true;
            _G.keysetup:cooldown("Barrier Spikes", l_cd_4);
            _G.fw(l_cd_4);
            l_Cooldowns_4.Spike = false;
        end;
    end;
end;
return v8;