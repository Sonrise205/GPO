local v0 = {};
local v1 = require(game.ReplicatedStorage.Modules.Skills);
local v2 = _G.clientimpacts[game.ReplicatedStorage.ClientImpacts.Soru];
local l_LocalPlayer_0 = game.Players.LocalPlayer;
local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
local _ = require(game.ReplicatedStorage.Modules.FastWait);
v0.start = function(_, v7) --[[ Line: 7 ]] --[[ Name: start ]]
    -- upvalues: l_FirstChild_0 (copy), v1 (copy), l_LocalPlayer_0 (copy), v2 (copy)
    local l_Character_0 = game.Players.LocalPlayer.Character;
    local v9 = "Soru";
    if l_Character_0:GetAttribute("GEAR2Active") ~= nil then
        v9 = "Gear2Dash";
    elseif l_FirstChild_0.Stats.FightingStyle.Value == "Kamishiki" then
        v9 = "KamishikiSoru";
    end;
    local v10 = v1.GetM(v9);
    if v10.stamreq and _G.StamCheck(v10.stamreq, true) == false then
        v7 = false;
        return;
    elseif v10.statreq and _G.MeetReq(v1.GetM(v9).statreq, nil, true) == false and l_Character_0:GetAttribute("GEAR2Active") == nil or l_Character_0:FindFirstChild("Blocking") then
        v7 = false;
        require(script.Parent.Regular):start();
        return;
    else
        _G.soruDashing = true;
        l_LocalPlayer_0:SetAttribute("soruDash", true);
        local v11 = l_Character_0.Humanoid.Health / l_Character_0.Humanoid.MaxHealth;
        if v11 > 0.3 then
            v11 = 1;
        end;
        l_Character_0.Humanoid.WalkSpeed = 75 * v11;
        task.spawn(function() --[[ Line: 35 ]]
            -- upvalues: l_Character_0 (copy), l_FirstChild_0 (ref), v2 (ref)
            local v12 = nil;
            if l_Character_0:GetAttribute("GEAR2Active") ~= nil then
                v12 = "KamishikiSoru";
                _G.PlayEffect("KamishikiSoru", nil, l_Character_0);
                game.ReplicatedStorage.Events.Skill:InvokeServer("Gear2Dash", {
                    char = l_Character_0
                });
                return;
            elseif l_FirstChild_0.Stats.FightingStyle.Value == "Kamishiki" then
                v12 = "KamishikiSoru";
                _G.PlayEffect("KamishikiSoru", nil, l_Character_0);
                game.ReplicatedStorage.Events.Skill:InvokeServer("KamishikiSoru", {
                    char = l_Character_0
                });
                return;
            else
                v2:start({
                    char = l_Character_0
                });
                game.ReplicatedStorage.Events.Skill:InvokeServer("Soru", {
                    char = l_Character_0
                });
                return;
            end;
        end);
        local v13 = tick();
        while true do
            if _G.check:inspect(l_Character_0, true) == false or _G.blocking == true then
                warn("stopped cause stun or blocking");
                break;
            else
                l_Character_0.Humanoid.WalkSpeed = 75 * v11;
                game["Run Service"].RenderStepped:Wait();
                if tick() - v13 >= 0.4 then
                    break;
                end;
            end;
        end;
        l_LocalPlayer_0:SetAttribute("soruDash", nil);
        _G.soruDashing = nil;
        if _G.running == false then
            l_Character_0.Humanoid.WalkSpeed = 16;
        else
            l_Character_0.Humanoid.WalkSpeed = 25;
        end;
        _G.keysetup:cooldown("Soru", 0.5);
        task.wait(1);
        return true;
    end;
end;
return v0;