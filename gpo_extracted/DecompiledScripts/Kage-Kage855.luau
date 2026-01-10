local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v3 = require(game.ReplicatedStorage.Modules.Skills);
local v4 = require(script.Parent.Parent.MobileBase);
local _ = require(l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule"));
local l_UserInputService_0 = game:GetService("UserInputService");
local _ = l_LocalPlayer_0:GetMouse();
local v8 = setmetatable({}, v4);
v8.__index = v8;
v8.new = function(_) --[[ Line: 20 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v8 (copy)
    local v10 = setmetatable(v4.new(script.Name), v8);
    v10.Cooldowns = {
        batspin = false, 
        blackbox = false, 
        batdrill = false, 
        burrow = false, 
        clone = false, 
        lizard = false
    };
    return v10;
end;
v8.BatTornado = function(v11, _) --[[ Line: 28 ]] --[[ Name: BatTornado ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_0 = v11.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_0.batspin == false and _G.check:inspect(l_Character_0) == true and _G.StamCheck("Bat Tornado") == true then
        local v16 = v3.GetM("Bat Tornado");
        local l_cd_0 = v16.cd;
        if _G.StamCheck("Bat Tornado") == false then
            return;
        elseif v16.statreq and _G.MeetReq(v16.statreq) == false then
            return;
        else
            l_Cooldowns_0.batspin = true;
            _G.canuse = false;
            local v18 = l_Character_0.Humanoid:LoadAnimation(script.batwind);
            v18:Play();
            v18:AdjustSpeed(1.5);
            task.wait(0.25);
            local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Bat Tornado", {
                cf = v11:GetMouseCFrame()
            });
            _G.canuse = true;
            _G.keysetup:cooldown("Bat Tornado", l_cd_0);
            _G.fw(l_cd_0);
            l_Cooldowns_0.batspin = false;
        end;
    end;
end;
v8.ShadowTrap = function(v20, _) --[[ Line: 59 ]] --[[ Name: ShadowTrap ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_1 = v20.Cooldowns;
    local l_Character_1 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_1.blackbox == false and _G.check:inspect(l_Character_1) == true and _G.StamCheck("Shadow Trap") == true then
        local v25 = v3.GetM("Shadow Trap");
        local l_cd_1 = v25.cd;
        if _G.StamCheck("Shadow Trap") == false then
            return;
        elseif v25.statreq and _G.MeetReq(v25.statreq) == false then
            return;
        else
            l_Cooldowns_1.blackbox = true;
            _G.canuse = false;
            local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Shadow Trap", v20:GetMouseCFrame());
            local v28 = l_Character_1.Humanoid:LoadAnimation(script.blackbox);
            v28:Play();
            v28:AdjustWeight(2);
            v28:AdjustSpeed(1.1);
            task.wait(2);
            _G.canuse = true;
            _G.keysetup:cooldown("Shadow Trap", l_cd_1);
            _G.fw(l_cd_1);
            l_Cooldowns_1.blackbox = false;
        end;
    end;
end;
v8.FleeingShadows = function(v29, _) --[[ Line: 90 ]] --[[ Name: FleeingShadows ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_2 = v29.Cooldowns;
    local l_Character_2 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if _G.grounded == false and l_Cooldowns_2.batdrill == false and _G.check:inspect(l_Character_2) == true and _G.StamCheck("Fleeing Shadows") == true then
        local v34 = v3.GetM("Fleeing Shadows");
        local l_cd_2 = v34.cd;
        if _G.StamCheck("Fleeing Shadows") == false then
            return;
        elseif v34.statreq and _G.MeetReq(v34.statreq) == false then
            return;
        else
            l_Cooldowns_2.batdrill = true;
            _G.canuse = false;
            local v36 = l_Character_2.Humanoid:LoadAnimation(script.batStart);
            v36:Play();
            v36:AdjustWeight(2);
            local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Fleeing Shadows", v29:GetMouseCFrame());
            l_Character_2.Humanoid:LoadAnimation(script.batEnd):Play();
            _G.canuse = true;
            _G.keysetup:cooldown("Fleeing Shadows", l_cd_2);
            _G.fw(l_cd_2);
            l_Cooldowns_2.batdrill = false;
        end;
    end;
end;
v8.BurrowingShadows = function(v38, _) --[[ Line: 121 ]] --[[ Name: BurrowingShadows ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_3 = v38.Cooldowns;
    local l_Character_3 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_3.burrow == false and _G.check:inspect(l_Character_3) == true and _G.StamCheck("Burrowing Shadows") == true then
        local v43 = v3.GetM("Burrowing Shadows");
        local l_cd_3 = v43.cd;
        if _G.StamCheck("Burrowing Shadows") == false then
            return;
        elseif v43.statreq and _G.MeetReq(v43.statreq) == false then
            return;
        elseif _G.getRayFloor(l_Character_3.PrimaryPart.CFrame, 10) == nil then
            return;
        else
            l_Cooldowns_3.burrow = true;
            _G.canuse = false;
            local v45 = l_Character_3.Humanoid:LoadAnimation(script.burrow);
            v45:Play();
            v45:AdjustSpeed(2);
            task.wait(0.3);
            local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Burrowing Shadows", v38:GetMouseCFrame());
            task.wait(0.45);
            _G.canuse = true;
            _G.keysetup:cooldown("Burrowing Shadows", l_cd_3);
            _G.fw(l_cd_3);
            l_Cooldowns_3.burrow = false;
        end;
    end;
end;
v8.ShadowsGrasp = function(v47, _) --[[ Line: 158 ]] --[[ Name: ShadowsGrasp ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy)
    local l_Cooldowns_4 = v47.Cooldowns;
    local l_Character_4 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_4.lizard == false and _G.check:inspect(l_Character_4) == true and _G.StamCheck("Shadows Grasp") == true then
        local v52 = v3.GetM("Shadows Grasp");
        local l_cd_4 = v52.cd;
        if _G.StamCheck("Shadows Grasp") == false then
            return;
        elseif v52.statreq and _G.MeetReq(v52.statreq) == false then
            return;
        else
            l_Cooldowns_4.lizard = true;
            _G.canuse = false;
            local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Shadows Grasp", v47:GetMouseCFrame());
            local v55 = l_Character_4.Humanoid:LoadAnimation(script.hand);
            v55:Play();
            v55:AdjustWeight(2);
            task.wait(1);
            _G.canuse = true;
            _G.keysetup:cooldown("Shadows Grasp", l_cd_4);
            _G.fw(l_cd_4);
            l_Cooldowns_4.lizard = false;
        end;
    end;
end;
v8["Sillhouette'sAssault"] = function(v56, _) --[[ Line: 189 ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), v3 (copy), l_UserInputService_0 (copy)
    local l_Cooldowns_5 = v56.Cooldowns;
    local l_Character_5 = l_LocalPlayer_0.Character;
    local _ = l_ReplicatedStorage_0["Stats" .. l_LocalPlayer_0.Name];
    if l_Cooldowns_5.clone == false and _G.check:inspect(l_Character_5) == true and _G.StamCheck("Sillhouette's Assault") == true then
        local v61 = v3.GetM("Sillhouette's Assault");
        local l_cd_5 = v61.cd;
        if _G.StamCheck("Sillhouette's Assault") == false then
            return;
        elseif v61.statreq and _G.MeetReq(v61.statreq) == false then
            return;
        elseif _G.getRayFloor(l_Character_5.PrimaryPart.CFrame, 10) == nil then
            return;
        else
            l_Cooldowns_5.clone = true;
            _G.canuse = false;
            local v63 = false;
            local v64 = game.ReplicatedStorage.Events.Skill:InvokeServer("Sillhouette's Assault", v56:GetMouseCFrame());
            do
                local l_v63_0 = v63;
                if v64 then
                    v64.OnClientEvent:Connect(function() --[[ Line: 215 ]]
                        -- upvalues: l_v63_0 (ref)
                        l_v63_0 = true;
                    end);
                end;
                local v66 = nil;
                v66 = l_UserInputService_0.InputBegan:Connect(function(v67, v68) --[[ Line: 220 ]]
                    -- upvalues: l_Character_5 (copy), v64 (copy), v66 (ref), l_v63_0 (ref)
                    if v67.KeyCode == Enum.KeyCode.C and l_Character_5:FindFirstChild(script.Name) and v68 ~= true then
                        if v64 then
                            v64:FireServer();
                        end;
                        v66:Disconnect();
                        v66 = nil;
                        l_v63_0 = true;
                    end;
                end);
                _G.canuse = true;
                repeat
                    task.wait();
                until l_v63_0 == true;
                _G.keysetup:cooldown("Sillhouette's Assault", l_cd_5);
                _G.fw(l_cd_5);
                l_Cooldowns_5.clone = false;
            end;
        end;
    end;
end;
return v8;