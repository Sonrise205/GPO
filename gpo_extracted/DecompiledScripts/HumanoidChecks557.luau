local v0 = {};
local l_CollectionService_0 = game:GetService("CollectionService");
local function v6(v2) --[[ Line: 4 ]] --[[ Name: getObjects ]]
    local v3 = 0;
    local l_v2_Children_0 = v2:GetChildren();
    for v5 = 1, #l_v2_Children_0 do
        if l_v2_Children_0[v5]:IsA("ObjectValue") and l_v2_Children_0[v5].Name ~= "playerOwner" then
            v3 = v3 + 1;
        end;
    end;
    return v3;
end;
v0.inspect = function(_, v8, v9, v10) --[[ Line: 15 ]] --[[ Name: inspect ]]
    -- upvalues: l_CollectionService_0 (copy), v6 (copy)
    if v8 == nil then
        return false;
    else
        local v11 = v8:FindFirstChild("hyperArmor") ~= nil;
        if v8.Parent == workspace.Ragdolls then
            return false;
        elseif _G.mobileButtonsEditting == true then
            return false;
        elseif v8:GetAttribute("evading") == true then
            return false;
        else
            local l_Humanoid_0 = v8:FindFirstChild("Humanoid");
            if l_Humanoid_0 == nil then
                return false;
            elseif l_Humanoid_0:GetAttribute("isRagdolled") then
                return false;
            elseif l_Humanoid_0 and l_Humanoid_0:IsA("Humanoid") and (l_Humanoid_0.Health <= 0 or l_Humanoid_0.Sit == true and v8.Parent ~= workspace.NPCs or l_Humanoid_0.Health ~= l_Humanoid_0.Health) then
                return false;
            elseif l_CollectionService_0:HasTag(v8, "Stun") or l_CollectionService_0:HasTag(v8, "Cuffed") and v11 == false then
                return false;
            elseif v8:GetAttribute("gripped") ~= nil then
                return false;
            elseif v8:FindFirstChild("Head") == nil then
                return false;
            elseif v9 == nil and game["Run Service"]:IsServer() == false and (v8:FindFirstChild("Blocking") and v8.Parent ~= workspace.NPCs or _G.midDash == true) then
                return false;
            elseif v8:FindFirstChildWhichIsA("ObjectValue") and v6(v8) >= 1 and v11 == false then
                return false;
            else
                local l_PlayerFromCharacter_0 = game.Players:GetPlayerFromCharacter(v8);
                if l_PlayerFromCharacter_0 then
                    local l_StunFolder_0 = l_PlayerFromCharacter_0:FindFirstChild("StunFolder");
                    if l_StunFolder_0 and #l_StunFolder_0:GetChildren() > 0 then
                        return false;
                    elseif game.Teams:FindFirstChild("Eliminated") and l_PlayerFromCharacter_0.Team == game.Teams.Eliminated then
                        return false;
                    end;
                end;
                if v10 ~= nil and game["Run Service"]:IsServer() then
                    local l_PlayerFromCharacter_1 = game.Players:GetPlayerFromCharacter(v8);
                    if l_PlayerFromCharacter_1 then
                        if game.ReplicatedStorage.Events.checkCanUse:InvokeClient(l_PlayerFromCharacter_1) == true then
                            return true;
                        else
                            return false;
                        end;
                    end;
                end;
                return true;
            end;
        end;
    end;
end;
return v0;