local l_LocalPlayer_0 = game.Players.LocalPlayer;
if not l_LocalPlayer_0.Character then
    local _ = l_LocalPlayer_0.CharacterAdded:Wait();
end;
local v2 = workspace:WaitForChild("Ragdolls", 5);
local v3 = require(game.ReplicatedStorage.Modules.RotatedRegion3);
local v4 = require(game.ReplicatedStorage.Modules.SwordHandle.SwordInfo);
local v5 = game.ReplicatedStorage:WaitForChild("CombatAnimations", 1);
local v6, v7, _, _, v10 = require(game.ReplicatedStorage.Modules.ScriptSet).get();
local v11 = {
    Fishman = v10.Customization.Race.Value:match("Fishman")
};
local v12 = nil;
local v13 = {
    "2SS", 
    "3SS"
};
v11.Utils = {
    trail = function(v14) --[[ Line: 19 ]] --[[ Name: trail ]]
        -- upvalues: v7 (copy), v13 (copy), v12 (ref)
        local l_Tool_0 = v7:FindFirstChildWhichIsA("Tool");
        if v7:FindFirstChild(l_Tool_0.Name .. "Sword") == nil and table.find(v13, l_Tool_0.Name) == nil then
            return;
        else
            if v7:FindFirstChild(l_Tool_0.Name .. "Sword") and v7:FindFirstChild(l_Tool_0.Name .. "Sword"):FindFirstChild("Blade") or table.find(v13, l_Tool_0.Name) ~= nil then
                local v16 = nil;
                v16 = v7:GetChildren();
                local v17 = {};
                for v18 = 1, #v16 do
                    if v16[v18]:IsA("Model") and v16[v18]:FindFirstChild("Blade") and v16[v18].Name:match("Sword") then
                        local l_Children_0 = v16[v18].Blade:GetChildren();
                        for v20 = 1, #l_Children_0 do
                            table.insert(v17, l_Children_0[v20]);
                        end;
                    end;
                end;
                v16 = v17;
                local v21 = game:GetService("HttpService"):GenerateGUID(true);
                v12 = v21;
                do
                    local l_v16_0 = v16;
                    for v23 = 1, #l_v16_0 do
                        if (l_v16_0[v23]:IsA("Trail") or l_v16_0[v23]:IsA("ParticleEmitter")) and l_v16_0[v23].Name ~= "notTrail" and l_v16_0[v23]:GetAttribute("trailBypass") == nil then
                            l_v16_0[v23].Enabled = true;
                            task.delay(v14, function() --[[ Line: 48 ]]
                                -- upvalues: v12 (ref), v21 (copy), l_v16_0 (ref), v23 (copy)
                                if v12 == v21 then
                                    l_v16_0[v23].Enabled = false;
                                end;
                            end);
                        end;
                    end;
                end;
            end;
            return;
        end;
    end, 
    getHitBox = function() --[[ Line: 59 ]] --[[ Name: getHitBox ]]
        -- upvalues: v7 (copy), v4 (copy), v11 (copy)
        local l_Tool_1 = v7:FindFirstChildWhichIsA("Tool");
        local _ = v7:GetAttribute("customM1");
        local v26 = if l_Tool_1 then l_Tool_1.Name else "";
        if l_Tool_1 and l_Tool_1:FindFirstChild("weaponOverride") then
            v26 = l_Tool_1:FindFirstChild("weaponOverride").Value;
        end;
        if v4[v26] then
            v11.Utils.trail(v4[v26].trailTime);
        end;
        return _G.getHitBox(v7);
    end, 
    getAnimation = function(v27, v28, v29) --[[ Line: 76 ]] --[[ Name: getAnimation ]]
        -- upvalues: v11 (copy), v7 (copy), v10 (copy), v6 (copy), v4 (copy), v5 (copy)
        local l_PunchCombo_0 = v11.PunchCombo;
        local l_Humanoid_0 = v7.Humanoid;
        local l_Tool_2 = v7:FindFirstChildWhichIsA("Tool");
        local v33 = nil;
        local v34 = nil;
        local _ = nil;
        local v36 = nil;
        local l_v7_Attribute_1 = v7:GetAttribute("customM1");
        local l_v7_Attribute_2 = v7:GetAttribute("customM1Model");
        if not l_Tool_2 then
            return;
        else
            local l_weaponOverride_0 = l_Tool_2:FindFirstChild("weaponOverride");
            local l_Name_0 = l_Tool_2.Name;
            local v41 = nil;
            if l_weaponOverride_0 and l_v7_Attribute_1 == nil then
                v41 = l_weaponOverride_0.Value;
            end;
            if l_Tool_2 and v10.Stats.FightingStyle.Value ~= "" and game.ReplicatedStorage.CombatAnimations:FindFirstChild(v10.Stats.FightingStyle.Value) and l_Tool_2:GetAttributes().MeleeTool ~= nil and l_Tool_2:GetAttribute("customM1") == nil then
                l_Tool_2 = v6.Backpack:FindFirstChild(v10.Stats.FightingStyle.Value) or l_Tool_2;
            end;
            if l_v7_Attribute_1 then
                v41 = l_v7_Attribute_1;
            end;
            if l_v7_Attribute_1 and l_v7_Attribute_2 then
                v36 = v7:FindFirstChild(l_v7_Attribute_2);
            end;
            l_Name_0 = l_Tool_2.Name;
            if v36 then
                local l_Slashes_0 = game.ReplicatedStorage.Modules.SwordHandle.Swords:FindFirstChild(l_v7_Attribute_1).Slashes;
                v33 = if v29 < l_PunchCombo_0 then v36.AnimationController:LoadAnimation(l_Slashes_0[v27 .. "Slash" .. l_PunchCombo_0]) else if v28 == true then v36.AnimationController:LoadAnimation(l_Slashes_0.Dash) else v36.AnimationController:LoadAnimation(l_Slashes_0:FindFirstChild("Slash" .. l_PunchCombo_0));
                return v33, "Sword", v33.Animation;
            else
                if v4[l_Tool_2.Name] or v41 then
                    local l_FirstChild_0 = game.ReplicatedStorage.Modules.SwordHandle.Swords:FindFirstChild(l_Tool_2.Name);
                    if l_FirstChild_0 == nil then
                        l_FirstChild_0 = game.ReplicatedStorage.Modules.SwordHandle.Swords:FindFirstChild(v41);
                    end;
                    if l_FirstChild_0 then
                        l_FirstChild_0 = l_FirstChild_0.Slashes;
                    end;
                    v33 = if v29 < l_PunchCombo_0 then l_Humanoid_0:LoadAnimation(l_FirstChild_0[v27 .. "Slash" .. l_PunchCombo_0]) else if v28 == true then l_Humanoid_0:LoadAnimation(l_FirstChild_0.Dash) else l_Humanoid_0:LoadAnimation(l_FirstChild_0:FindFirstChild("Slash" .. l_PunchCombo_0));
                    v34 = "Sword";
                elseif l_Tool_2.Name == "BlackLeg" then
                    v33 = if v7:FindFirstChild("Diable") == nil then if v29 < l_PunchCombo_0 then l_Humanoid_0:LoadAnimation(v5.BlackLeg[v27 .. "Punch" .. l_PunchCombo_0]) else if v28 == true then l_Humanoid_0:LoadAnimation(v5.BlackLeg.Dash) else l_Humanoid_0:LoadAnimation(v5.BlackLeg:FindFirstChild("Punch" .. l_PunchCombo_0)) else if v29 < l_PunchCombo_0 then l_Humanoid_0:LoadAnimation(v5.Diable[v27 .. "Punch" .. l_PunchCombo_0]) else if v28 == true then l_Humanoid_0:LoadAnimation(v5.Diable.Dash) else l_Humanoid_0:LoadAnimation(v5.Diable:FindFirstChild("Punch" .. l_PunchCombo_0));
                    v34 = "BlackLeg";
                elseif l_Tool_2.Name == "FishmanKarate" then
                    v33 = if v29 < l_PunchCombo_0 then l_Humanoid_0:LoadAnimation(v5.FishmanKarate[v27 .. "Punch" .. l_PunchCombo_0]) else if v28 == true then l_Humanoid_0:LoadAnimation(v5.FishmanKarate.Dash) else l_Humanoid_0:LoadAnimation(v5.FishmanKarate:FindFirstChild("Punch" .. l_PunchCombo_0));
                    v34 = "FishmanKarate";
                elseif l_Tool_2.Name == "DragonClaw" then
                    v33 = if v29 < l_PunchCombo_0 then l_Humanoid_0:LoadAnimation(v5.DragonClaw[v27 .. "Punch" .. l_PunchCombo_0]) else if v28 == true then l_Humanoid_0:LoadAnimation(v5.DragonClaw.Dash) else l_Humanoid_0:LoadAnimation(v5.DragonClaw:FindFirstChild("Punch" .. l_PunchCombo_0));
                    v34 = "DragonClaw";
                elseif v5:FindFirstChild(l_Name_0) then
                    local l_v5_FirstChild_0 = v5:FindFirstChild(l_Name_0);
                    v33 = if v29 < l_PunchCombo_0 then l_Humanoid_0:LoadAnimation(l_v5_FirstChild_0[v27 .. "Punch" .. l_PunchCombo_0]) else if v28 == true then l_Humanoid_0:LoadAnimation(l_v5_FirstChild_0.Dash) else l_Humanoid_0:LoadAnimation(l_v5_FirstChild_0:FindFirstChild("Punch" .. l_PunchCombo_0));
                    v34 = l_Name_0;
                else
                    v33 = if v29 < l_PunchCombo_0 then l_Humanoid_0:LoadAnimation(v5.Melee[v27 .. "Punch" .. l_PunchCombo_0]) else if v28 == true then l_Humanoid_0:LoadAnimation(v5.Melee.Dash) else l_Humanoid_0:LoadAnimation(v5.Melee:FindFirstChild("Punch" .. l_PunchCombo_0));
                    v34 = "Melee";
                end;
                return v33, v34, v33.Animation;
            end;
        end;
    end, 
    getAnimSpeed = function() --[[ Line: 207 ]] --[[ Name: getAnimSpeed ]]
        -- upvalues: v7 (copy), v4 (copy)
        local l_Tool_3 = v7:FindFirstChildWhichIsA("Tool");
        local _ = nil;
        local l_VenomDemonModel_0 = v7:FindFirstChild("VenomDemonModel");
        local l_v7_Attribute_3 = v7:GetAttribute("customM1");
        if l_VenomDemonModel_0 then
            return 1;
        elseif l_v7_Attribute_3 then
            return 1;
        elseif l_Tool_3 and v4[l_Tool_3.Name] then
            return v4[l_Tool_3.Name].animspeed;
        elseif l_Tool_3 and l_Tool_3.Name == "BlackLeg" then
            return 1.75;
        elseif l_Tool_3 and l_Tool_3:GetAttributes().MeleeTool ~= nil then
            return 1.75;
        else
            return 1.75;
        end;
    end, 
    checkHoldingWeapon = function() --[[ Line: 230 ]] --[[ Name: checkHoldingWeapon ]]
        -- upvalues: v7 (copy)
        local l_Tool_4 = v7:FindFirstChildWhichIsA("Tool");
        if l_Tool_4 and l_Tool_4:GetAttribute("customRun") then
            return true;
        elseif _G.currentSword and _G.currentSword.Anims and _G.currentSword.Anims.run and #_G.currentSword.Anims.run >= 1 then
            return true;
        else
            return false;
        end;
    end, 
    hitStunned = function() --[[ Line: 241 ]] --[[ Name: hitStunned ]]
        -- upvalues: v7 (copy)
        if v7:GetAttribute("Dazed") then
            return 0;
        else
            local v50 = 0;
            local v51 = false;
            local l_v7_Children_0 = v7:GetChildren();
            for v53 = 1, #l_v7_Children_0 do
                if l_v7_Children_0[v53]:IsA("ObjectValue") then
                    if l_v7_Children_0[v53]:GetAttribute("isStun") == nil then
                        v51 = true;
                        break;
                    else
                        v50 = v50 + 1;
                    end;
                end;
            end;
            if v51 == true then
                v50 = 0;
            end;
            return v50;
        end;
    end, 
    getinregion = function(_, v55) --[[ Line: 266 ]] --[[ Name: getinregion ]]
        -- upvalues: v3 (copy), v2 (copy)
        local v56 = v3.new(unpack(v55));
        local v57 = {};
        local l_v2_Children_0 = v2:GetChildren();
        for v59 = 1, #l_v2_Children_0 do
            if l_v2_Children_0[v59]:FindFirstChild("Humanoid") then
                table.insert(v57, l_v2_Children_0[v59].PrimaryPart);
            end;
        end;
        return (v56:FindPartsInRegion3WithWhiteList(v57, 100));
    end, 
    inCombatCheck = function() --[[ Line: 279 ]] --[[ Name: inCombatCheck ]]
        -- upvalues: v7 (copy)
        local l_v7_Attribute_4 = v7:GetAttribute("bossCombat");
        if l_v7_Attribute_4 and workspace:GetServerTimeNow() - l_v7_Attribute_4 <= 2 then
            return true;
        elseif v7:FindFirstChild("inCombat") or game.ReplicatedStorage:FindFirstChild("raidMode") or game.ReplicatedStorage:FindFirstChild("Matchinfo") then
            return true;
        else
            return false;
        end;
    end, 
    holdingValidMelee = function() --[[ Line: 294 ]] --[[ Name: holdingValidMelee ]]
        -- upvalues: l_LocalPlayer_0 (copy), v4 (copy)
        local l_Tool_5 = l_LocalPlayer_0.Character:FindFirstChildWhichIsA("Tool");
        if l_Tool_5 == nil or l_Tool_5 and l_Tool_5:GetAttributes().MeleeTool == nil and v4[l_Tool_5.Name] == nil then
            return false;
        elseif l_Tool_5 ~= nil and l_Tool_5:GetAttribute("fullCustomM1") ~= nil then
            return false;
        else
            return true;
        end;
    end
};
v11.Callbacks = {};
for _, v63 in pairs(script:GetChildren()) do
    v11.Callbacks[v63.Name] = require(v63).new(v11);
end;
_G.resetM1 = function() --[[ Line: 314 ]]
    -- upvalues: v11 (copy)
    v11.Callbacks.Attack:ResetM1();
end;
return v11;