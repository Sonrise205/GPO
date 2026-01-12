local v0 = {};
v0.__index = v0;
local v1 = nil;
local v2 = require(game.ReplicatedStorage.Modules.MaidClass).new();
local v3 = {
    "Firework Daggers", 
    "Firework Rocket Launcher", 
    "Inferno Rocket Blade", 
    "Candy Cane", 
    "Firework Lancer", 
    "Dark Blade", 
    "Cupid's Bow", 
    "Mega-Pow", 
    "World Ender"
};
script:SetAttribute("PrestigeWeapons", game:GetService("HttpService"):JSONEncode(v3));
local v4 = require(game.ReplicatedStorage.Modules.SwordHandle.SwordInfo);
local v5 = nil;
local v6 = nil;
local v7 = nil;
local v8 = nil;
local v9 = nil;
if game:GetService("RunService"):IsServer() == false then
    v1 = require(game.ReplicatedStorage.Modules.ScriptSet);
    local v10, v11, v12, v13, v14 = v1.get();
    v5 = v10;
    v6 = v11;
    v7 = v12;
    v8 = v13;
    v9 = v14;
end;
local function _() --[[ Line: 16 ]] --[[ Name: getId ]]
    return (game:GetService("HttpService"):GenerateGUID(true));
end;
local function v29(v16, v17) --[[ Line: 22 ]] --[[ Name: updateAnims ]]
    -- upvalues: v6 (ref)
    if v16.currentSword == v17 then
        return;
    else
        if v16 and v16.Anims then
            for _, v19 in v16.Anims do
                if v19 then
                    if typeof(v19) == "table" then
                        for v20 = 1, #v19 do
                            v19[v20]:Stop();
                        end;
                    else
                        v19:Stop();
                    end;
                end;
            end;
        end;
        local l_Animator_0 = v6.Humanoid:WaitForChild("Animator");
        local l_FirstChild_0 = script.Swords:FindFirstChild(v17);
        local v23 = nil;
        local v24 = nil;
        local v25 = nil;
        local v26 = l_Animator_0:LoadAnimation(l_FirstChild_0.Idle);
        v26.Priority = Enum.AnimationPriority.Idle;
        if l_FirstChild_0:FindFirstChild("holdAnim") then
            v25 = l_Animator_0:LoadAnimation(l_FirstChild_0.holdAnim);
        end;
        local v27 = nil;
        if l_FirstChild_0:FindFirstChild("runAnim") then
            v24 = l_Animator_0:LoadAnimation(l_FirstChild_0.runAnim);
            v24:AdjustSpeed(v16.runSpeed);
            v24.Priority = Enum.AnimationPriority.Movement;
            v27 = l_FirstChild_0.runAnim.AnimationId;
        end;
        if l_FirstChild_0:FindFirstChild("walkAnim") then
            v23 = l_Animator_0:LoadAnimation(l_FirstChild_0.walkAnim);
        end;
        if v24 then
            v16.footStepConnection = v24.KeyframeReached:Connect(function(v28) --[[ Line: 61 ]]
                -- upvalues: v6 (ref)
                if v6.PrimaryPart.Anchored == true then
                    return;
                else
                    if v28:match("step") and v28 ~= "step" and _G.footstep then
                        _G.footstep(v28);
                    end;
                    return;
                end;
            end);
        end;
        v16.Anims = {
            idle = {
                v26
            }, 
            walk = {
                v23
            }, 
            run = {
                v24
            }, 
            hold = {
                v25
            }
        };
        v16.runId = v27;
        v16.currentSword = v17;
        return;
    end;
end;
v0.New = function(v30, v31) --[[ Line: 81 ]] --[[ Name: New ]]
    -- upvalues: v5 (ref), v6 (ref), v7 (ref), v8 (ref), v9 (ref), v1 (ref), v4 (copy), v29 (copy), v0 (copy), v2 (ref)
    if script.Swords:FindFirstChild(v30) == nil then
        return;
    else
        local v32, v33, v34, v35, v36 = v1.get();
        v5 = v32;
        v6 = v33;
        v7 = v34;
        v8 = v35;
        v9 = v36;
        v5.Character:WaitForChild("Humanoid"):WaitForChild("Animator");
        v34 = nil;
        v34 = {
            Ready = true, 
            Equiped = true, 
            EqId = nil, 
            Name = v30, 
            currentSword = nil, 
            Tool = v31, 
            runSpeed = v4[v30].runSpeed or 2, 
            updateAnims = function() --[[ Line: 98 ]] --[[ Name: updateAnims ]]
                -- upvalues: v31 (copy), v29 (ref), v34 (ref), v30 (copy)
                if v31 and v31:FindFirstChild("weaponOverride") then
                    v29(v34, v31:FindFirstChild("weaponOverride").Value);
                    return;
                else
                    if v34.currentSword ~= v30 then
                        v29(v34, v30);
                    end;
                    return;
                end;
            end
        };
        v29(v34, v30);
        setmetatable(v34, v0);
        v2[v34] = v34;
        task.spawn(function() --[[ Line: 113 ]]
            -- upvalues: v30 (copy), v4 (ref)
            local l_FirstChild_1 = script.Swords:FindFirstChild(v30);
            if l_FirstChild_1 then
                local v38 = {
                    l_FirstChild_1
                };
                for _, v40 in pairs(v4[v30].hitSounds) do
                    table.insert(v38, v40);
                end;
                for _, v42 in pairs(v4[v30].swingSFX) do
                    table.insert(v38, v42);
                end;
                game:GetService("ContentProvider"):PreloadAsync(v38);
            end;
        end);
        return v34;
    end;
end;
local v43 = {
    "Katana", 
    "Skyblue Katana", 
    "Ryu's Katana", 
    "Seabeast Katana", 
    "Musashi's Crimson Katana", 
    "Musashi's Rose Katana", 
    "Kraken Katana", 
    "Crimson Fang Katana", 
    "Shattered Fang Katana", 
    "Amethyst Fang Katana", 
    "ODM Katana"
};
if game["Run Service"]:IsServer() then
    for v44 = 1, #v43 do
        if v43[v44] ~= "Katana" then
            if script.Swords:FindFirstChild(v43[v44]) then
                script.Swords:FindFirstChild(v43[v44]):Destroy();
            end;
            local v45 = script.Swords.Katana:Clone();
            v45.Name = v43[v44];
            v45.Parent = script.Swords;
        end;
        local v46 = game.ReplicatedStorage.SkillCallbacks.FistStyles["1SS"]:Clone();
        v46.Name = v43[v44];
        v46.Parent = game.ReplicatedStorage.SkillCallbacks.SwordStyles;
    end;
    local function v47(v48, v49) --[[ Line: 150 ]] --[[ Name: makePrestige ]]
        -- upvalues: v47 (copy)
        local v50 = "Prestige";
        if v49 == nil and _G.customPrestigePrefix[v48] then
            if #_G.customPrestigePrefix[v48] > 1 then
                for v51 = 1, #_G.customPrestigePrefix[v48] do
                    v47(v48, _G.customPrestigePrefix[v48][v51]);
                end;
                return;
            else
                v50 = _G.customPrestigePrefix[v48][1];
            end;
        end;
        if v49 then
            v50 = v49;
        end;
        v50 = v50 .. " ";
        local l_FirstChild_2 = script.Swords:FindFirstChild(v50 .. v48);
        if l_FirstChild_2 == nil then
            local v53 = script.Swords:FindFirstChild(v48):Clone();
            v53.Name = v50 .. v48;
            v53.Parent = script.Swords;
        else
            l_FirstChild_2.Skill:Destroy();
            script.Swords:FindFirstChild(v48).Skill:Clone().Parent = l_FirstChild_2;
        end;
        if game.ReplicatedStorage.SkillCallbacks.SwordStyles:FindFirstChild(v48) then
            local v54 = game.ReplicatedStorage.SkillCallbacks.SwordStyles:FindFirstChild(v48):Clone();
            v54.Name = v50 .. v48;
            v54:SetAttribute("Prestige", true);
            v54.Parent = game.ReplicatedStorage.SkillCallbacks.SwordStyles;
        end;
    end;
    for v55 = 1, #v3 do
        v47(v3[v55]);
    end;
    v47("Candy Cane", "Iceborn");
end;
return v0;