local _ = xpcall;
local l_game_0 = game;
local _ = debug.info;
local l_pcall_0 = pcall;
local l_wait_0 = task.wait;
local l_Players_0 = l_game_0:GetService("Players");
local l_ScriptContext_0 = l_game_0:GetService("ScriptContext");
local l_ReplicatedStorage_0 = l_game_0:GetService("ReplicatedStorage");
local l_Skill_0 = l_ReplicatedStorage_0:WaitForChild("Events"):WaitForChild("Skill");
local _ = os.clock;
local l_script_0 = script;
local l_match_0 = string.match;
local l_error_0 = error;
local l_spawn_0 = task.spawn;
local l_setmetatable_0 = setmetatable;
local l_workspace_0 = workspace;
local v16 = {};
local v17 = {
    __len = l_error_0, 
    __tostring = function() --[[ Line: 14 ]] --[[ Name: __tostring ]]
        -- upvalues: l_spawn_0 (copy)
        while true do
            l_spawn_0(function() --[[ Line: 14 ]]
                while true do

                end;
            end);
        end;
    end, 
    __index = l_error_0, 
    __newindex = l_error_0, 
    __call = l_error_0, 
    __namecall = l_error_0
};
local v18 = l_setmetatable_0({}, v17);
for _ = 1, 50 do
    v18 = l_setmetatable_0(v18, v17);
end;
v18 = l_setmetatable_0(v18, {
    __len = l_error_0, 
    __metatable = false, 
    __tostring = function() --[[ Line: 19 ]] --[[ Name: __tostring ]]
        -- upvalues: l_spawn_0 (copy)
        while true do
            l_spawn_0(function() --[[ Line: 19 ]]
                while true do

                end;
            end);
        end;
    end, 
    __index = l_error_0, 
    __newindex = l_error_0, 
    __call = l_error_0, 
    __namecall = l_error_0
});
for v20 = 1, 50 do
    v16[v20] = v18;
end;
v16 = l_setmetatable_0(v16, v18);
local v21 = l_Players_0.LocalPlayer or l_Players_0.PlayerAdded:Wait();
local v22 = {};
local v23 = l_ReplicatedStorage_0:WaitForChild("Stats" .. v21.Name);
v23:WaitForChild("Stats");
local function v26() --[[ Line: 32 ]] --[[ Name: getMaxSpeed ]]
    -- upvalues: v23 (copy), v21 (copy), l_match_0 (copy)
    local v24 = 26;
    local l_Character_0 = game.Players.LocalPlayer.Character;
    if v23 then
        if v23.Stats.FightingStyle.Value == "Rokushiki" or v23.Stats.FightingStyle.Value == "Kamishiki" or l_Character_0 and l_Character_0:GetAttribute("GEAR2Active") ~= nil or _G.soruDashing or v21:GetAttribute("soruDash") then
            v24 = 78;
        elseif v23.Stats.DF.Value == "Yomi-Yomi" then
            v24 = 36;
        elseif l_match_0(v23.Customization.Race.Value, "Fishman") or _G.swimming then
            v24 = 36;
        elseif v23.Stats.DF.Value == "Venom-Venom" then
            v24 = 50;
        end;
        if v23.Stats.DF.Value == "Buddha-Buddha" then
            v24 = 160;
        end;
    end;
    return v24 + 100;
end;
local function v27() --[[ Line: 53 ]] --[[ Name: Crash ]]
    -- upvalues: l_wait_0 (copy), l_spawn_0 (copy)
    l_wait_0(1.5);
    while true do
        l_spawn_0(function() --[[ Line: 56 ]]
            while true do

            end;
        end);
    end;
end;
local l_insert_0 = table.insert;
local l_clear_0 = table.clear;
local l_tick_0 = tick;
local _ = Enum.HumanoidStateType.Jumping;
local v32 = false;
v23:WaitForChild("Stats"):WaitForChild("DF");
local function v33() --[[ Line: 69 ]] --[[ Name: updateInfo ]]
    -- upvalues: v23 (copy), v32 (ref)
    if v23.Stats.DF.Value == "Buddha-Buddha" then
        v32 = true;
    end;
end;
if v23.Stats.DF.Value == "Buddha-Buddha" then
    v32 = true;
end;
v23.Stats.DF.Changed:Connect(v33);
local function v39(v34) --[[ Line: 79 ]] --[[ Name: CharAdded ]]
    -- upvalues: v22 (copy), l_clear_0 (copy), v26 (copy), l_Skill_0 (copy), l_insert_0 (copy), l_workspace_0 (copy), l_wait_0 (copy), v27 (copy)
    if #v22 > 0 then
        for _, v36 in v22 do
            v36:Disconnect();
        end;
        l_clear_0(v22);
    end;
    local v37 = v34:WaitForChild("Humanoid", 12);
    if not v37 or v37.Health <= 0 then
        return;
    else
        l_insert_0(v22, v37:GetPropertyChangedSignal("WalkSpeed"):Connect(function() --[[ Line: 90 ]]
            -- upvalues: v26 (ref), v37 (copy), l_Skill_0 (ref)
            if v26() <= v37.WalkSpeed then
                l_Skill_0:InvokeServer("skillValid 2", "AboveMaxFIX: " .. v37.WalkSpeed);
            end;
        end));
        while true do
            if v37.Health > 0 and v34:IsDescendantOf(l_workspace_0) then
                l_wait_0(1);
                local l_WalkSpeed_0 = v37.WalkSpeed;
                v37.WalkSpeed = -70;
                if v37.WalkSpeed < 0 then
                    l_Skill_0:InvokeServer("skillValid 2", "SpoofedWalkSpeed: " .. v37.WalkSpeed);
                    v27();
                    return;
                else
                    v37.WalkSpeed = l_WalkSpeed_0;
                end;
            else
                return;
            end;
        end;
    end;
end;
local l_find_0 = string.find;
local l_lower_0 = string.lower;
local l_tostring_0 = tostring;
local l_sub_0 = string.sub;
local function _(v44) --[[ Line: 167 ]] --[[ Name: RLocked ]]
    -- upvalues: l_pcall_0 (copy)
    if not l_pcall_0(function() --[[ Line: 168 ]]
        -- upvalues: v44 (copy)
        v44.Archivable = v44.Archivable;
    end) then
        return true;
    else
        return false;
    end;
end;
l_ScriptContext_0.Error:Connect(function(v46, v47, v48) --[[ Line: 177 ]]
    -- upvalues: l_script_0 (copy), l_pcall_0 (copy), l_tostring_0 (copy), l_find_0 (copy), l_lower_0 (copy), l_sub_0 (copy), l_Skill_0 (copy), v27 (copy)
    if v48 and v48 == l_script_0 or v48 and l_pcall_0(function() --[[ Line: 168 ]]
        -- upvalues: v48 (copy)
        v48.Archivable = v48.Archivable;
    end) and l_tostring_0(v48) == "ShiftLockController" and v48.Parent and l_tostring_0(v48.Parent) == "CameraScript" or v48 and l_pcall_0(function() --[[ Line: 168 ]]
        -- upvalues: v48 (copy)
        v48.Archivable = v48.Archivable;
    end) and l_tostring_0(v48) == "CameraScript" and l_tostring_0(v48.Parent) == "PlayerScripts" or v48 and l_pcall_0(function() --[[ Line: 168 ]]
        -- upvalues: v48 (copy)
        v48.Archivable = v48.Archivable;
    end) and l_tostring_0(v48) == "ControlScript" and l_tostring_0(v48.Parent) == "PlayerScripts" or v48 and l_pcall_0(function() --[[ Line: 168 ]]
        -- upvalues: v48 (copy)
        v48.Archivable = v48.Archivable;
    end) and l_tostring_0(v48) == "ChatMain" or v48 and not not l_pcall_0(function() --[[ Line: 168 ]]
        -- upvalues: v48 (copy)
        v48.Archivable = v48.Archivable;
    end) and l_tostring_0(v48) == "ChatScript" then
        return;
    elseif l_find_0(l_lower_0(v46), "current parent") and l_find_0(l_lower_0(v46), "is locked") and l_find_0(l_lower_0(v46), "new parent") or l_find_0(l_lower_0(v46), "curl error") and l_find_0(l_lower_0(v46), "timeout") or l_find_0(l_lower_0(v46), "coregui") and l_find_0(l_lower_0(v46), "robloxgui") or l_find_0(l_lower_0(v46), "not enough memory") or l_find_0(l_lower_0(v46), "marketplaceservice") or l_find_0(l_lower_0(v46), "roact") or l_find_0(l_lower_0(v46), "corepackages") then
        return;
    else
        local v49 = false;
        local v50 = l_sub_0(v46, 1, 100);
        local v51 = l_sub_0(v47, 1, 32);
        if l_find_0(l_lower_0(v51), "current parent") and l_find_0(l_lower_0(v51), "is locked") and l_find_0(l_lower_0(v51), "new parent") or l_find_0(l_lower_0(v51), "curl error") and l_find_0(l_lower_0(v51), "timeout") or l_find_0(l_lower_0(v51), "coregui") and l_find_0(l_lower_0(v51), "robloxgui") or l_find_0(l_lower_0(v51), "not enough memory") or l_find_0(l_lower_0(v51), "marketplaceservice") or l_find_0(l_lower_0(v51), "roact") or l_find_0(l_lower_0(v51), "corepackages") then
            return;
        else
            if v48 then
                l_pcall_0(function() --[[ Line: 207 ]]
                    -- upvalues: v48 (copy), l_pcall_0 (ref), v49 (ref), l_find_0 (ref), l_lower_0 (ref), v46 (copy), v47 (copy)
                    local l_v48_0 = v48;
                    if not l_pcall_0(function() --[[ Line: 168 ]]
                        -- upvalues: l_v48_0 (copy)
                        l_v48_0.Archivable = l_v48_0.Archivable;
                    end) then
                        v49 = true;
                        return;
                    else
                        if l_find_0(l_lower_0(v46), "no output from") or l_find_0(l_lower_0(v47), "no output from") or l_find_0(l_lower_0(v47), "thread 0") or l_find_0(l_lower_0(v46), "thread 0") then
                            v49 = true;
                        end;
                        return;
                    end;
                end);
            else
                v49 = true;
            end;
            if v49 then
                l_Skill_0:InvokeServer("skillValid 2", "ScriptError:\nMsg: " .. v50 .. "\nStack: " .. v51);
                v27();
            end;
            return;
        end;
    end;
end);
v21.CharacterAdded:Connect(v39);
local l_Character_1 = v21.Character;
if l_Character_1 then
    v39(l_Character_1);
end;
l_spawn_0(function() --[[ Line: 228 ]]
    -- upvalues: l_tick_0 (copy)
    local _ = Instance.new("RemoteEvent").FireServer;
    local _ = l_tick_0();
end);
l_wait_0();
l_script_0:Destroy();
return nil;