local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = game:GetService("RunService");
local v2 = require(game.ReplicatedStorage.Modules.Skills);
local v3 = require(script.Parent.Parent.MobileBase);
local _ = require(l_LocalPlayer_0.PlayerScripts:WaitForChild("PlayerModule"));
local _ = l_LocalPlayer_0:GetMouse();
local v6 = setmetatable({}, v3);
v6.__index = v6;
v6.new = function(_) --[[ Line: 18 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v6 (copy)
    local v8 = setmetatable(v3.new(script.Name), v6);
    v8.Cooldowns = {
        waterspout = false, 
        tidalstrike = false
    };
    return v8;
end;
v6.WringingVortex = function(v9, v10) --[[ Line: 29 ]] --[[ Name: WringingVortex ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_0 = v9.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    if l_Cooldowns_0.waterspout == false and _G.check:inspect(l_Character_0) == true then
        local v13 = v2.GetM("Wringing Vortex");
        local l_cd_0 = v13.cd;
        if _G.StamCheck("Wringing Vortex") == false then
            return;
        elseif v13.statreq and _G.MeetReq(v13.statreq) == false then
            return;
        else
            l_Cooldowns_0.waterspout = true;
            _G.canuse = false;
            local v15 = game.ReplicatedStorage.Events.Skill:InvokeServer("Wringing Vortex");
            local v16 = tick();
            local l_Humanoid_0 = l_Character_0.Humanoid;
            local v18 = false;
            do
                local l_v18_0 = v18;
                v9:ChargeSkill(v10, {
                    Key = Enum.KeyCode.E, 
                    CheckFunction = function() --[[ Line: 57 ]] --[[ Name: CheckFunction ]]
                        -- upvalues: l_Humanoid_0 (copy)
                        l_Humanoid_0.WalkSpeed = 2;
                        l_Humanoid_0.JumpPower = 0;
                    end, 
                    EndFunction = function() --[[ Line: 61 ]] --[[ Name: EndFunction ]]
                        -- upvalues: l_Character_0 (copy), l_v18_0 (ref), v9 (copy), v16 (copy)
                        if _G.check:inspect(l_Character_0) == false then
                            l_v18_0 = true;
                            return true;
                        else
                            local v20 = true;
                            if v9.Tool.Parent == l_Character_0 then
                                v20 = tick() - v16 >= 4;
                            end;
                            return v20;
                        end;
                    end, 
                    HoldDuration = 0.4
                });
                l_Humanoid_0.WalkSpeed = 0;
                l_Humanoid_0.AutoRotate = false;
                if v15 then
                    v15:InvokeServer(l_Character_0.PrimaryPart.CFrame, l_v18_0);
                end;
                l_Humanoid_0.AutoRotate = false;
                task.wait(0.1);
                l_Humanoid_0.WalkSpeed = 16;
                l_Humanoid_0.JumpPower = 50;
                l_Humanoid_0.AutoRotate = true;
                _G.canuse = true;
                _G.keysetup:cooldown("Wringing Vortex", l_cd_0);
                _G.fw(l_cd_0);
                l_Cooldowns_0.waterspout = false;
            end;
        end;
    end;
end;
v6.WringingRupture = function(v21, _) --[[ Line: 95 ]] --[[ Name: WringingRupture ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Character_1 = l_LocalPlayer_0.Character;
    local l_Cooldowns_1 = v21.Cooldowns;
    if l_Cooldowns_1.tidalstrike == false and _G.check:inspect(l_Character_1) == true then
        local v25 = v2.GetM("Wringing Rupture");
        local l_cd_1 = v25.cd;
        if _G.StamCheck("Wringing Rupture") == false then
            return;
        elseif v25.statreq and _G.MeetReq(v25.statreq) == false then
            return;
        else
            local l_Humanoid_1 = l_Character_1.Humanoid;
            _G.canuse = false;
            local v28 = true;
            do
                local l_v28_0 = v28;
                task.spawn(function() --[[ Line: 117 ]]
                    -- upvalues: l_v28_0 (ref), l_Humanoid_1 (copy)
                    while l_v28_0 do
                        l_Humanoid_1.WalkSpeed = 2;
                        task.wait();
                    end;
                end);
                local _ = game.ReplicatedStorage.Events.Skill:InvokeServer("Wringing Rupture");
                l_v28_0 = false;
                l_Humanoid_1.JumpHeight = 7.2;
                l_Humanoid_1.WalkSpeed = 16;
                _G.canuse = true;
                _G.keysetup:cooldown("Wringing Rupture", l_cd_1);
                _G.fw(l_cd_1);
                l_Cooldowns_1.tidalstrike = false;
            end;
        end;
    end;
end;
return v6;