local l_wait_0 = wait;
local l_time_0 = time;
local l_pcall_0 = pcall;
local l_xpcall_0 = xpcall;
local l_setfenv_0 = setfenv;
local l_tostring_0 = tostring;
local l_game_0 = game;
local l_spawn_0 = task.spawn;
local l_l_xpcall_0_0 = l_xpcall_0;
local l_require_0 = require;
local l_wait_1 = task.wait;
local v11 = l_game_0:FindFirstChildWhichIsA("Players") or l_game_0:FindService("Players");
local l_LocalPlayer_0 = v11.LocalPlayer;
local v13 = false;
local l_l_LocalPlayer_0_0 = l_LocalPlayer_0 --[[ copy: 12 -> 30 ]];
local l_v11_0 = v11 --[[ copy: 11 -> 31 ]];
local function v17(v16) --[[ Line: 22 ]] --[[ Name: loadingDetected ]]
    -- upvalues: l_l_LocalPlayer_0_0 (copy), l_v11_0 (copy)
    (l_l_LocalPlayer_0_0 or l_v11_0.LocalPlayer):Kick(((":: Adonis Loader - Security :: %*"):format(v16)));
    while true do

    end;
end;
local v18 = newproxy(true);
local v19 = getmetatable(v18);
local l_v17_0 = v17 --[[ copy: 14 -> 32 ]];
v19.__index = function() --[[ Line: 32 ]]
    -- upvalues: l_v17_0 (copy)
    l_v17_0("Proxy methamethod 0xEC7E1");
    return task.wait(200);
end;
v19.__newindex = function() --[[ Line: 38 ]]
    -- upvalues: l_v17_0 (copy)
    l_v17_0("Proxy methamethod 0x28AEC");
    return task.wait(200);
end;
v19.__tostring = function() --[[ Line: 44 ]]
    -- upvalues: l_v17_0 (copy)
    l_v17_0("Proxy methamethod 0x36F14");
    return task.wait(200);
end;
v19.__unm = function() --[[ Line: 50 ]]
    -- upvalues: l_v17_0 (copy)
    l_v17_0("Proxy methamethod 0x50B7F");
    return task.wait(200);
end;
v19.__add = function() --[[ Line: 56 ]]
    -- upvalues: l_v17_0 (copy)
    l_v17_0("Proxy methamethod 0xCD67D");
    return task.wait(200);
end;
v19.__sub = function() --[[ Line: 62 ]]
    -- upvalues: l_v17_0 (copy)
    l_v17_0("Proxy methamethod 0x8110D");
    return task.wait(200);
end;
v19.__mul = function() --[[ Line: 68 ]]
    -- upvalues: l_v17_0 (copy)
    l_v17_0("Proxy methamethod 0x6A01B");
    return task.wait(200);
end;
v19.__div = function() --[[ Line: 74 ]]
    -- upvalues: l_v17_0 (copy)
    l_v17_0("Proxy methamethod 0x5A975");
    return task.wait(200);
end;
v19.__mod = function() --[[ Line: 80 ]]
    -- upvalues: l_v17_0 (copy)
    l_v17_0("Proxy methamethod 0x6CFEB");
    return task.wait(200);
end;
v19.__pow = function() --[[ Line: 86 ]]
    -- upvalues: l_v17_0 (copy)
    l_v17_0("Proxy methamethod 0x20A50");
    return task.wait(200);
end;
v19.__len = function() --[[ Line: 92 ]]
    -- upvalues: l_v17_0 (copy)
    l_v17_0("Proxy methamethod 0x3B96C");
    return task.wait(200);
end;
v19.__metatable = "The metatable is locked";
local l_l_require_0_0 = l_require_0 --[[ copy: 9 -> 33 ]];
local l_l_spawn_0_0 = l_spawn_0 --[[ copy: 7 -> 34 ]];
local l_l_l_xpcall_0_0_0 = l_l_xpcall_0_0 --[[ copy: 8 -> 35 ]];
local l_v18_0 = v18 --[[ copy: 15 -> 36 ]];
do
    local l_v13_0 = v13;
    l_spawn_0(l_l_xpcall_0_0, function() --[[ Line: 101 ]]
        -- upvalues: l_game_0 (copy), l_pcall_0 (copy), l_l_require_0_0 (copy), l_l_spawn_0_0 (copy), l_l_l_xpcall_0_0_0 (copy), l_v17_0 (copy), l_v18_0 (copy), l_v13_0 (ref)
        local v26 = l_game_0:GetService("Workspace") or l_game_0:GetService("ReplicatedStorage");
        local v27, v28 = l_pcall_0(l_l_require_0_0, l_game_0);
        if not v26 then
            l_l_spawn_0_0(l_l_l_xpcall_0_0_0, function() --[[ Line: 106 ]]
                -- upvalues: l_v17_0 (ref)
                l_v17_0("Service not returning");
            end, function(v29) --[[ Line: 106 ]]
                -- upvalues: l_v17_0 (ref)
                l_v17_0(v29);
            end);
            while true do

            end;
        end;
        if v27 or not string.match(v28, "^Attempted to call require with invalid argument%(s%)%.$") then
            l_l_spawn_0_0(l_l_l_xpcall_0_0_0, function() --[[ Line: 111 ]]
                -- upvalues: l_v17_0 (ref), v28 (copy)
                l_v17_0((("Require load fail. %*"):format(v28)));
            end, function(v30) --[[ Line: 111 ]]
                -- upvalues: l_v17_0 (ref)
                l_v17_0(v30);
            end);
            while true do

            end;
        end;
        task.spawn(l_pcall_0, l_l_require_0_0, l_v18_0);
        l_v13_0 = true;
    end, function(v31) --[[ Line: 118 ]]
        -- upvalues: l_l_spawn_0_0 (copy), l_v17_0 (copy)
        l_l_spawn_0_0(l_v17_0, v31);
        while true do

        end;
    end);
    local l_l_wait_1_0 = l_wait_1 --[[ copy: 10 -> 37 ]];
    l_spawn_0(l_l_xpcall_0_0, function() --[[ Line: 120 ]]
        -- upvalues: l_l_wait_1_0 (copy), l_v13_0 (ref), l_l_spawn_0_0 (copy), l_l_l_xpcall_0_0_0 (copy), l_v17_0 (copy)
        l_l_wait_1_0();
        l_l_wait_1_0();
        if not l_v13_0 then
            l_l_spawn_0_0(l_l_l_xpcall_0_0_0, function() --[[ Line: 125 ]]
                -- upvalues: l_v17_0 (ref), l_v13_0 (ref)
                l_v17_0((("Loading detectors failed to load%*"):format(l_v13_0)));
            end, function(v33) --[[ Line: 125 ]]
                -- upvalues: l_v17_0 (ref)
                l_v17_0(v33);
            end);
            while true do

            end;
        end;
    end, function(v34) --[[ Line: 128 ]]
        -- upvalues: l_l_spawn_0_0 (copy), l_v17_0 (copy)
        l_l_spawn_0_0(l_v17_0, v34);
        while true do

        end;
    end);
end;
l_spawn_0 = game:GetService("Players").LocalPlayer;
l_l_xpcall_0_0 = script.Parent;
l_require_0 = l_l_xpcall_0_0.Parent;
l_wait_1 = l_spawn_0.Kick;
v11 = l_l_xpcall_0_0:WaitForChild("Client");
l_LocalPlayer_0 = print;
v13 = warn;
v17 = l_time_0();
v18 = function(...) --[[ Line: 142 ]] --[[ Name: print ]]

end;
v19 = function(v35) --[[ Line: 146 ]] --[[ Name: warn ]]
    -- upvalues: l_spawn_0 (copy), v13 (copy)
    if l_spawn_0.UserId == 1237666 then
        v13((("ACLI: %*"):format(v35)));
    end;
end;
local function v37(v36) --[[ Line: 152 ]] --[[ Name: Kill ]]
    -- upvalues: l_pcall_0 (copy), l_wait_1 (copy), l_spawn_0 (copy), l_wait_0 (copy)
    l_pcall_0(function() --[[ Line: 154 ]]
        -- upvalues: l_wait_1 (ref), l_spawn_0 (ref), v36 (copy)
        l_wait_1(l_spawn_0, v36);
    end);
    l_wait_0(1);
    l_pcall_0(function() --[[ Line: 156 ]]
        -- upvalues: l_wait_0 (ref), l_pcall_0 (ref)
        while l_wait_0() do
            l_pcall_0(function() --[[ Line: 156 ]]
                while true do

                end;
            end);
        end;
    end);
end;
local function v39(v38) --[[ Line: 159 ]] --[[ Name: Locked ]]
    -- upvalues: l_pcall_0 (copy)
    if not v38 then
        return true;
    else
        return not l_pcall_0(function() --[[ Line: 160 ]]
            -- upvalues: v38 (copy)
            return v38.GetFullName(v38);
        end);
    end;
end;
local function v40() --[[ Line: 163 ]] --[[ Name: loadingTime ]]
    -- upvalues: v19 (copy), l_setfenv_0 (copy), l_time_0 (copy), v17 (copy), l_tostring_0 (copy)
    v19("LoadingTime Called");
    l_setfenv_0(1, {});
    v19((l_tostring_0(l_time_0() - v17)));
end;
local function v42(v41) --[[ Line: 169 ]] --[[ Name: callCheck ]]
    -- upvalues: v19 (copy), v39 (copy), v37 (copy), l_xpcall_0 (copy)
    v19((("CallCheck: %*"):format(v41)));
    if v39(v41) then
        v19("Child locked?");
        v37("ACLI: Locked");
        return;
    else
        v19("Child not locked");
        l_xpcall_0(function() --[[ Line: 176 ]]
            -- upvalues: v41 (copy)
            return v41[{}];
        end, function() --[[ Line: 178 ]]
            -- upvalues: v37 (ref)
            if getfenv(1) ~= getfenv(2) then
                v37("ACLI: Error");
            end;
        end);
        return;
    end;
end;
local function _(v43, ...) --[[ Line: 186 ]] --[[ Name: doPcall ]]
    -- upvalues: l_pcall_0 (copy), v19 (copy), l_tostring_0 (copy), v37 (copy)
    local v44, v45 = l_pcall_0(v43, ...);
    if v44 then
        return v44, v45;
    else
        v19((l_tostring_0(v45)));
        v37((("ACLI: Error\n%*"):format(v45)));
        return v44, v45;
    end;
end;
if v11 and v11:IsA("ModuleScript") then
    v19("Loading Folder...");
    local v47 = nil;
    local v48 = nil;
    v19("Waiting for Client & Special");
    v47 = l_l_xpcall_0_0:WaitForChild("Special", 30);
    v19("Checking Client & Special");
    v19("Getting origName");
    v48 = v47 and v47.Value or l_l_xpcall_0_0.Name;
    v19((("Got name: %*"):format(v48)));
    v19("Removing old client folder...");
    local l_FirstChild_0 = game:GetService("StarterPlayer"):FindFirstChildOfClass("StarterPlayerScripts"):FindFirstChild(l_l_xpcall_0_0.Name);
    v19((("FOUND?! %*"):format(l_FirstChild_0)));
    v19((("LOOKED FOR : %*"):format(l_l_xpcall_0_0.Name)));
    if l_FirstChild_0 then
        v18("REMOVED!");
        l_FirstChild_0.Parent = nil;
    end;
    v19("Changing child parent...");
    l_l_xpcall_0_0.Name = "";
    l_wait_0(0.01);
    l_l_xpcall_0_0.Parent = nil;
    v19("Destroying parent...");
    v18("Debug: Loading the client?");
    local v50 = require(v11);
    v19((("Got metatable: %*"):format(v50)));
    if v50 and type(v50) == "userdata" and l_tostring_0(v50) == "Adonis" then
        local _, v52 = l_pcall_0(v50, {
            Module = v11, 
            Start = v17, 
            Loader = script, 
            Name = v48, 
            Folder = l_l_xpcall_0_0, 
            LoadingTime = v40, 
            CallCheck = v42, 
            Kill = v37
        });
        v19((("Got return: %*"):format(v52)));
        if v52 ~= "SUCCESS" then
            v13(v52);
            v37("ACLI: Loading Error [Bad Module Return]");
            return;
        else
            v18("Debug: The client was found and loaded?");
            v19("Client Loaded");
            if l_require_0 and l_require_0:IsA("ScreenGui") then
                l_require_0.Parent = nil;
            end;
        end;
    end;
end;