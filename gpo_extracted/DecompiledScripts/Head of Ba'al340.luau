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
        fear = false
    };
    return v8;
end;
v6["Ba'alsFear"] = function(v9, _) --[[ Line: 28 ]]
    -- upvalues: l_LocalPlayer_0 (copy), v2 (copy)
    local l_Cooldowns_0 = v9.Cooldowns;
    local l_Character_0 = l_LocalPlayer_0.Character;
    if l_Cooldowns_0.fear == false and _G.check:inspect(l_Character_0) == true and _G.StamCheck("Ba'als Fear") == true then
        local v13 = v2.GetM("Ba'als Fear");
        local l_cd_0 = v13.cd;
        if _G.StamCheck("Ba'als Fear") == false then
            return;
        elseif v13.statreq and _G.MeetReq(v13.statreq) == false then
            return;
        else
            l_Cooldowns_0.fear = true;
            local v15 = v9.Tool:WaitForChild("PumpkinHead", 5);
            if v15 == nil then
                l_Cooldowns_0.fear = false;
                return;
            elseif v15 and v15:FindFirstChild("Handle") == nil then
                l_Cooldowns_0.fear = false;
                return;
            else
                _G.canuse = false;
                if game.ReplicatedStorage.Events.Skill:InvokeServer("Ba'als Fear", v15.Handle.CFrame) == true then
                    l_Character_0.Humanoid.WalkSpeed = 4;
                    local v16 = tick();
                    repeat
                        if v9.Tool.Parent ~= l_Character_0 then
                            l_Character_0.Humanoid:UnequipTools();
                            v9.Tool.Parent = l_Character_0;
                        end;
                        l_Character_0.Humanoid.WalkSpeed = 4;
                        _G.canuse = false;
                        game["Run Service"].RenderStepped:Wait();
                    until tick() - v16 >= 0.75;
                    l_Character_0.Humanoid.WalkSpeed = 16;
                end;
                _G.canuse = true;
                _G.keysetup:cooldown("Ba'als Fear", l_cd_0);
                _G.fw(l_cd_0);
                l_Cooldowns_0.fear = false;
            end;
        end;
    end;
end;
return v6;