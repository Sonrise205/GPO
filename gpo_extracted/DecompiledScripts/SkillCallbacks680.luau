local l_LocalPlayer_0 = game.Players.LocalPlayer;
local _ = require(l_LocalPlayer_0.PlayerScripts:WaitForChild("InputHandler"));
local _ = {
    ModuleBase = true, 
    Template = true
};
local v3 = require(game.ReplicatedStorage.Modules.SwordHandle.SwordInfo);
local function v4(v5, v6) --[[ Line: 11 ]] --[[ Name: Clean ]]
    -- upvalues: v4 (copy)
    if v6[v5] then
        return;
    else
        v6[v5] = true;
        if v5.Destroy and typeof(v5.Destroy) == "function" then
            v5:Destroy();
        end;
        for _, v8 in v5 do
            if typeof(v8) == "table" and v8.Destroy then
                v8:Destroy();
            elseif typeof(v8) == "RBXScriptConnection" then
                v8:Disconnect();
            elseif typeof(v8) == "table" then
                v4(v8, v6);
            elseif typeof(v8) == "Instance" then
                if v8:IsA("AnimationTrack") then
                    v8:Stop();
                end;
                if v8:IsA("Tool") == false then
                    v8:Destroy();
                end;
            end;
        end;
        return;
    end;
end;
local v9 = {};
v9.__index = v9;
v9.new = function() --[[ Line: 43 ]] --[[ Name: new ]]
    -- upvalues: v9 (copy), l_LocalPlayer_0 (copy)
    local v10 = setmetatable({}, v9);
    v10.Skills = {};
    local v11 = nil;
    v11 = l_LocalPlayer_0.CharacterRemoving:Once(function() --[[ Line: 48 ]]
        -- upvalues: v10 (copy), v11 (ref)
        for v12, _ in v10.Skills do
            v10:CleanSkill(v12);
        end;
        v11 = nil;
    end);
    return v10;
end;
v9.CleanSkill = function(v14, v15) --[[ Line: 60 ]] --[[ Name: CleanSkill ]]
    -- upvalues: v4 (copy)
    if not v14.Skills[v15] then
        return;
    else
        v4(v14.Skills[v15], {});
        table.clear(v14.Skills[v15]);
        setmetatable(v14.Skills[v15], nil);
        v14.Skills[v15] = nil;
        return;
    end;
end;
local _ = {
    ["3SS"] = {
        "1SS", 
        "2SS"
    }
};
v9.GetSkillCallback = function(v17, v18, v19) --[[ Line: 74 ]] --[[ Name: GetSkillCallback ]]
    -- upvalues: v3 (copy), l_LocalPlayer_0 (copy)
    local v20 = typeof(v18) == "string" and v18 or v18.Name;
    v20 = v3[v20] and (v3[v20].style or v3[v20].baseWeapon) or v20;
    local v21 = v17.Skills[v20];
    if not v21 then
        v21 = script:FindFirstChild(v20, true);
        if not v21 then
            return;
        else
            task.spawn(function() --[[ Line: 84 ]]
                -- upvalues: v21 (ref), v20 (ref)
                game:GetService("ContentProvider"):PreloadAsync({
                    v21
                });
                if _G.preloadFolderName then
                    _G.preloadFolderName(v20);
                end;
            end);
            if v19 then
                v18 = v19;
            end;
            v21 = require(v21).new(v17, v18);
            v17.Skills[v20] = v21;
            if typeof(v18) == "Instance" and v18:IsA("Tool") then
                local function v22(v23) --[[ Line: 98 ]] --[[ Name: listenDestroy ]]
                    -- upvalues: v21 (ref), l_LocalPlayer_0 (ref), v22 (copy), v20 (ref), v17 (copy)
                    v21.Destroyed = v23.Destroying:Connect(function() --[[ Line: 99 ]]
                        -- upvalues: l_LocalPlayer_0 (ref), v23 (copy), v21 (ref), v22 (ref), v20 (ref), v17 (ref)
                        local v24 = l_LocalPlayer_0.Backpack:FindFirstChild(v23.Name) or l_LocalPlayer_0.Character:FindFirstChild(v23.Name);
                        if v24 and v24 ~= v23 then
                            warn("found new tool", v24);
                            v21.Tool = v24;
                            v22(v24);
                            return;
                        else
                            warn("cleaning ", v20);
                            v17:CleanSkill(v20);
                            return;
                        end;
                    end);
                end;
                local l_v18_0 = v18;
                v21.Destroyed = l_v18_0.Destroying:Connect(function() --[[ Line: 99 ]]
                    -- upvalues: l_LocalPlayer_0 (ref), l_v18_0 (copy), v21 (ref), v22 (copy), v20 (ref), v17 (copy)
                    local v26 = l_LocalPlayer_0.Backpack:FindFirstChild(l_v18_0.Name) or l_LocalPlayer_0.Character:FindFirstChild(l_v18_0.Name);
                    if v26 and v26 ~= l_v18_0 then
                        warn("found new tool", v26);
                        v21.Tool = v26;
                        v22(v26);
                        return;
                    else
                        warn("cleaning ", v20);
                        v17:CleanSkill(v20);
                        return;
                    end;
                end);
            else
                warn(v18, " not a tool");
            end;
        end;
    else
        if v20 == "1SS" and v21.Tool ~= v18 and v18 ~= nil and typeof(v18) == "Instance" then
            v21.Tool = v18;
        end;
        if v19 then
            v21.Tool = v19;
        end;
    end;
    return v21;
end;
return v9;