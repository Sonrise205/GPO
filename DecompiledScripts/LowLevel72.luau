local l_LowLevel_0 = require(game.ReplicatedStorage.Modules.Leveling).LowLevel;
_G.PVPBountyThreshold = 10000;
local function v2(v1) --[[ Line: 4 ]] --[[ Name: returnPVP ]]
    -- upvalues: l_LowLevel_0 (copy)
    if v1.Stats.Level.Value < l_LowLevel_0 then
        return {
            false, 
            "Low Level"
        };
    elseif v1.Settings.PVPMode.Value == false then
        return {
            false, 
            "PVP Off"
        };
    else
        return {
            true, 
            ""
        };
    end;
end;
return function(v3, v4, v5, v6) --[[ Line: 14 ]]
    -- upvalues: v2 (copy), l_LowLevel_0 (copy)
    local v7 = game["Run Service"]:IsServer();
    if _G.BattleRoyale ~= nil then
        return false;
    elseif game.ReplicatedStorage.reservedCode:GetAttribute("battleRoyale") ~= nil then
        return false;
    else
        if v3 ~= nil and v3:IsA("Player") and game.Players:GetPlayerFromCharacter(v4) and v4 ~= v3.Character then
            local l_PlayerFromCharacter_0 = game.Players:GetPlayerFromCharacter(v4);
            if l_PlayerFromCharacter_0 then
                if v4:FindFirstChild("SafeFF") ~= nil then
                    return true;
                else
                    local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. v3.Name);
                    local l_FirstChild_1 = game.ReplicatedStorage:FindFirstChild("Stats" .. l_PlayerFromCharacter_0.Name);
                    if l_FirstChild_0 == nil or l_FirstChild_1 == nil then
                        return true;
                    else
                        if l_FirstChild_0.Stats.Crew.Value == l_FirstChild_1.Stats.Crew.Value and l_FirstChild_0.Stats.Crew.Value ~= "" and v6 == nil then
                            if l_PlayerFromCharacter_0.CrewPVP.Value == false then
                                return true;
                            elseif v3.CrewPVP.Value == false then
                                return true;
                            end;
                        end;
                        if v2(l_FirstChild_0)[1] == false and _G.arena == false then
                            if v5 == nil and v7 == true then
                                if v3:GetAttribute("preLevelWarning") == nil then
                                    v3:SetAttribute("preLevelWarning", 0);
                                end;
                                local v11 = v2(l_FirstChild_0)[2];
                                if tick() - v3:GetAttribute("preLevelWarning") >= 1 then
                                    if v11 == "Low Level" then
                                        game.ReplicatedStorage.Events.note:FireClient(v3, "<Color=Red>You need to reach level " .. l_LowLevel_0 .. " to attack others.");
                                    elseif v11 == "PVP Off" then
                                        game.ReplicatedStorage.Events.note:FireClient(v3, "<Color=Red>You need to turn on PVP to attack others.");
                                    end;
                                    v3:SetAttribute("preLevelWarning", tick());
                                end;
                            end;
                            return true;
                        elseif v2(l_FirstChild_1)[1] == false and _G.arena == false then
                            if v5 == nil and v7 == true then
                                if v3:GetAttribute("preLevelWarning") == nil then
                                    v3:SetAttribute("preLevelWarning", 0);
                                end;
                                local v12 = v2(l_FirstChild_0)[2];
                                if tick() - v3:GetAttribute("preLevelWarning") >= 1 then
                                    if v12 == "Low Level" then
                                        game.ReplicatedStorage.Events.note:FireClient(v3, "<Color=Red>You cant attack low level players.");
                                    else
                                        game.ReplicatedStorage.Events.note:FireClient(v3, "<Color=Red>You cant attack players that have PVP off.");
                                    end;
                                    v3:SetAttribute("preLevelWarning", tick());
                                end;
                            end;
                            return true;
                        else
                            return false;
                        end;
                    end;
                end;
            end;
        end;
        return;
    end;
end;