local v0 = table.freeze({
    "Variables", 
    "Functions", 
    "Core", 
    "Remote", 
    "UI", 
    "Process", 
    "Anti"
});
local l__G_0 = _G;
local l_game_0 = game;
local l_script_0 = script;
local l_getfenv_0 = getfenv;
local l_setfenv_0 = setfenv;
local l_workspace_0 = workspace;
local l_getmetatable_0 = getmetatable;
local l_setmetatable_0 = setmetatable;
local l_loadstring_0 = loadstring;
local l_coroutine_0 = coroutine;
local l_rawequal_0 = rawequal;
local l_typeof_0 = typeof;
local l_print_0 = print;
local l_math_0 = math;
local l_warn_0 = warn;
local l_error_0 = error;
local l_pcall_0 = pcall;
local l_xpcall_0 = xpcall;
local l_select_0 = select;
local l_rawset_0 = rawset;
local l_rawget_0 = rawget;
local l_ipairs_0 = ipairs;
local l_pairs_0 = pairs;
local l_next_0 = next;
local l_Rect_0 = Rect;
local l_Axes_0 = Axes;
local l_os_0 = os;
local l_time_0 = time;
local l_Faces_0 = Faces;
local l_unpack_0 = table.unpack;
local l_string_0 = string;
local l_Color3_0 = Color3;
local l_newproxy_0 = newproxy;
local l_tostring_0 = tostring;
local l_tonumber_0 = tonumber;
local l_Instance_0 = Instance;
local l_TweenInfo_0 = TweenInfo;
local l_BrickColor_0 = BrickColor;
local l_NumberRange_0 = NumberRange;
local l_ColorSequence_0 = ColorSequence;
local l_NumberSequence_0 = NumberSequence;
local l_ColorSequenceKeypoint_0 = ColorSequenceKeypoint;
local l_NumberSequenceKeypoint_0 = NumberSequenceKeypoint;
local l_PhysicalProperties_0 = PhysicalProperties;
local l_Region3int16_0 = Region3int16;
local l_Vector3int16_0 = Vector3int16;
local l_require_0 = require;
local l_table_0 = table;
local l_type_0 = type;
local l_wait_0 = task.wait;
local l_Enum_0 = Enum;
local l_UDim_0 = UDim;
local l_UDim2_0 = UDim2;
local l_Vector2_0 = Vector2;
local l_Vector3_0 = Vector3;
local l_Region3_0 = Region3;
local l_CFrame_0 = CFrame;
local l_Ray_0 = Ray;
local l_delay_0 = task.delay;
local l_defer_0 = task.defer;
local l_task_0 = task;
local l_tick_0 = tick;
local function v65(v63, v64) --[[ Line: 92 ]]
    return v63 or error(v64 or "assertion failed!", 2);
end;
local v66 = l_table_0.freeze({
    "Workspace", 
    "Players", 
    "Lighting", 
    "ReplicatedStorage", 
    "ReplicatedFirst", 
    "ScriptContext", 
    "JointsService", 
    "LogService", 
    "Teams", 
    "SoundService", 
    "StarterGui", 
    "StarterPack", 
    "StarterPlayer", 
    "GroupService", 
    "MarketplaceService", 
    "HttpService", 
    "TestService", 
    "RunService", 
    "NetworkClient"
});
local v67 = {};
local function v70() --[[ Line: 120 ]]
    -- upvalues: l_warn_0 (copy), v67 (copy)
    l_warn_0(":: Adonis :: Dumping client log...");
    for _, v69 in v67 do
        l_warn_0(":: Adonis ::", v69);
    end;
end;
local function v71(...) --[[ Line: 127 ]]
    -- upvalues: l_table_0 (ref), v67 (copy)
    l_table_0.insert(v67, l_table_0.concat({
        ...
    }, " "));
end;
local v72 = l_game_0:GetService("RunService"):IsStudio();
l_game_0:GetService("NetworkClient").ChildRemoved:Connect(function(_) --[[ Line: 133 ]]
    -- upvalues: v72 (copy), l_warn_0 (copy), v70 (copy)
    if not v72 then
        l_warn_0("~! PLAYER DISCONNECTED/KICKED! DUMPING ADONIS CLIENT LOG!");
        v70();
    end;
end);
local v74 = {};
local v75 = l_getfenv_0();
local l_Parent_0 = l_script_0.Parent;
l_setfenv_0(1, (l_setmetatable_0({}, {
    __metatable = v74
})));
local _ = l_time_0();
local l_new_0 = l_Instance_0.new;
local l_l_require_0_0 = l_require_0;
local v80 = {};
local v81 = {};
local v82 = {};
local v83 = {};
local function v87(v84) --[[ Line: 153 ]] --[[ Name: isModule ]]
    -- upvalues: v81 (ref), l_rawequal_0 (ref)
    for _, v86 in v81.Modules do
        if l_rawequal_0(v84, v86) then
            return true;
        end;
    end;
    return false;
end;
local function v88(...) --[[ Line: 162 ]] --[[ Name: logError ]]
    -- upvalues: l_warn_0 (copy), v81 (ref), l_table_0 (ref)
    l_warn_0("ERROR: ", ...);
    if v81 and v81.Remote then
        v81.Remote.Send("LogError", l_table_0.concat({
            ...
        }, " "));
    end;
end;
local l_l_print_0_0 = l_print_0;
l_print_0 = function(...) --[[ Line: 171 ]]
    -- upvalues: l_l_print_0_0 (copy)
    l_l_print_0_0(":: Adonis ::", ...);
end;
local function v93(v90, ...) --[[ Line: 181 ]]
    -- upvalues: l_pcall_0 (copy), v88 (copy), l_tostring_0 (copy)
    local v91, v92 = l_pcall_0(v90, ...);
    if v92 then
        v88((l_tostring_0(v92)));
    end;
    return v91, v92;
end;
local function v95(v94, ...) --[[ Line: 191 ]]
    -- upvalues: l_coroutine_0 (ref)
    return l_coroutine_0.resume(l_coroutine_0.create(v94), ...);
end;
local function v97(...) --[[ Line: 195 ]]
    -- upvalues: l_coroutine_0 (ref)
    local v96 = l_coroutine_0.wrap(function(...) --[[ Line: 196 ]]
        -- upvalues: l_coroutine_0 (ref)
        while true do
            l_coroutine_0.yield(...);
        end;
    end);
    v96(...);
    return v96;
end;
local v98 = nil;
v98 = v97(function(v99) --[[ Line: 208 ]]
    -- upvalues: l_defer_0 (copy), l_pcall_0 (copy), l_task_0 (ref), v82 (ref), v72 (copy), v98 (ref)
    l_defer_0(l_pcall_0, function() --[[ Line: 210 ]]

    end);
    l_defer_0(l_pcall_0, function() --[[ Line: 218 ]]
        -- upvalues: l_task_0 (ref), v82 (ref), v99 (copy)
        l_task_0.wait(1);
        v82.Player:Kick(v99);
    end);
    if not v72 then
        l_defer_0(l_pcall_0, function() --[[ Line: 224 ]]
            -- upvalues: l_task_0 (ref), l_pcall_0 (ref), v98 (ref)
            l_task_0.wait(5);
            while true do
                l_pcall_0(l_task_0.spawn, function() --[[ Line: 227 ]]
                    -- upvalues: l_task_0 (ref), v98 (ref)
                    l_task_0.spawn(v98());
                end);
            end;
        end);
    end;
end);
local v100 = nil;
v100 = function(v101, v102) --[[ Line: 238 ]]
    -- upvalues: v80 (ref), v75 (copy), l_Parent_0 (ref), v74 (copy), l_setmetatable_0 (copy), l_type_0 (copy)
    local v105 = l_setmetatable_0({}, {
        __index = function(_, v104) --[[ Line: 240 ]] --[[ Name: __index ]]
            -- upvalues: v80 (ref), v101 (copy), v75 (ref)
            return v80[v104] or (v101 or v75)[v104];
        end, 
        __metatable = if l_Parent_0:FindFirstChild("ADONIS_DEBUGMODE_ENABLED") then nil else v74
    });
    if v102 and l_type_0(v102) == "table" then
        for v106, v107 in v102 do
            v105[v106] = v107;
        end;
    end;
    return v105;
end;
local function v108() --[[ Line: 256 ]]
    -- upvalues: v81 (ref), v82 (ref)
    return {
        Client = v81, 
        Service = v82
    };
end;
local function v129(v109, v110, v111, v112) --[[ Line: 263 ]]
    -- upvalues: l_type_0 (copy), l_pcall_0 (copy), v65 (copy), v81 (ref), v100 (ref), l_require_0 (ref), v82 (ref), l_setfenv_0 (copy), l_getfenv_0 (copy), l_warn_0 (copy), v108 (copy)
    local v113 = l_type_0(v109) == "string";
    local v114 = not v113 and v109:IsA("StringValue");
    local v115 = nil;
    local v116 = nil;
    if v113 then
        local v117, v118 = l_pcall_0(v65(v65(v81.Core.Loadstring, "Cannot compile plugin due to Core.Loadstring missing")(v109, v100({}, v111)), "Failed to compile module"));
        v115 = v117;
        v116 = v118;
    elseif v114 then
        local v119, v120 = l_pcall_0(v81.Core.LoadCode or function(...) --[[ Line: 271 ]]
            -- upvalues: l_require_0 (ref), v81 (ref)
            return l_require_0(v81.Shared.FiOne, true)(...);
        end, v81.Functions.Base64Decode(v109.Value), v100({}, v111));
        v115 = v119;
        v116 = v120;
    else
        local v121, v122 = l_pcall_0(l_require_0, v109);
        v115 = v121;
        v116 = v122;
    end;
    if v115 then
        if l_type_0(v116) == "function" then
            if v110 then
                local _, _ = v82.TrackTask(("Plugin: %*"):format(v109), (not not v112 or v113 or v114) and v116 or l_setfenv_0(v116, v100(l_getfenv_0(v116), v111)), function(v123) --[[ Line: 283 ]]
                    -- upvalues: l_warn_0 (ref), v109 (copy)
                    l_warn_0((("Module encountered an error while loading: %*\n%*\n%*"):format(v109, v123, (debug.traceback()))));
                end, v108(), v100);
                return;
            else
                local _, _ = v82.TrackTask(("Thread: Plugin: %*"):format(v109), (not not v112 or v113 or v114) and v116 or l_setfenv_0(v116, v100(l_getfenv_0(v116), v111)), function(v126) --[[ Line: 294 ]]
                    -- upvalues: l_warn_0 (ref), v109 (copy)
                    l_warn_0((("Module encountered an error while loading: %*\n%*\n%*"):format(v109, v126, (debug.traceback()))));
                end, v108(), v100);
                return;
            end;
        else
            v81[v109.Name] = v116;
            return;
        end;
    else
        l_warn_0("Error while loading client module", v109, v116);
        return;
    end;
end;
v71("Client setmetatable");
v81 = l_setmetatable_0({
    Handlers = {}, 
    Modules = {}, 
    Service = v82, 
    Module = l_script_0, 
    Print = l_print_0, 
    Warn = l_warn_0, 
    Deps = {}, 
    Pcall = v93, 
    Routine = v95, 
    OldPrint = l_l_print_0_0, 
    LogError = v88, 
    TestEvent = l_Instance_0.new("RemoteEvent"), 
    Disconnect = function(v130) --[[ Line: 325 ]] --[[ Name: Disconnect ]]
        -- upvalues: v82 (ref)
        v82.Player:Kick(v130 or "Disconnected from server");
    end
}, {
    __index = function(_, v132) --[[ Line: 333 ]] --[[ Name: __index ]]
        -- upvalues: l_pcall_0 (copy), v98 (ref), l_type_0 (copy), v82 (ref), l_warn_0 (copy)
        if v132 == "Kill" then
            local v133, v134 = l_pcall_0(function() --[[ Line: 335 ]]
                -- upvalues: v98 (ref)
                return v98();
            end);
            if not v133 or l_type_0(v134) ~= "function" then
                v82.Players.LocalPlayer:Kick("1x00353 Adonis (PlrClientIndexKlErr)");
                l_warn_0("Failed to retrieve Kill function");
                return function() --[[ Line: 342 ]]

                end;
            else
                return v134;
            end;
        else
            return;
        end;
    end
});
v80 = {
    Pcall = v93, 
    GetEnv = v100, 
    client = v81, 
    Folder = l_Parent_0, 
    Routine = v95, 
    service = v82, 
    logError = v88, 
    origEnv = v75, 
    log = v71, 
    dumplog = v70
};
v71("Create service metatable");
v82 = l_require_0(l_Parent_0.Shared.Service)(function(v135, v136, _, ...) --[[ Line: 365 ]]
    -- upvalues: v88 (copy), l_tostring_0 (copy), v98 (ref)
    local _ = {
        ...
    };
    if v135 == "MethodError" then
        v88("Client", (("Method Error Occured: %*"):format(v136)));
        return;
    elseif v135 == "ServerError" then
        v88("Client", (l_tostring_0(v136)));
        return;
    else
        if v135 == "ReadError" then
            v98()((l_tostring_0(v136)));
        end;
        return;
    end;
end, function(v139, v140, v141) --[[ Line: 386 ]]
    -- upvalues: v87 (copy), l_script_0 (ref), l_Parent_0 (ref)
    if not v87(v139) and v139 ~= l_script_0 and v139 ~= l_Parent_0 and v140 == nil then
        v141.UnHook();
    end;
end, v83, v100(nil, {
    client = v81
}));
v71("Localize");
local l_Localize_0 = v82.Localize;
l_os_0 = l_Localize_0(l_os_0);
l_math_0 = l_Localize_0(l_math_0);
l_table_0 = l_Localize_0(l_table_0);
l_string_0 = l_Localize_0(l_string_0);
l_coroutine_0 = l_Localize_0(l_coroutine_0);
l_Instance_0 = l_Localize_0(l_Instance_0);
l_Vector2_0 = l_Localize_0(l_Vector2_0);
l_Vector3_0 = l_Localize_0(l_Vector3_0);
l_CFrame_0 = l_Localize_0(l_CFrame_0);
l_UDim2_0 = l_Localize_0(l_UDim2_0);
l_UDim_0 = l_Localize_0(l_UDim_0);
l_Ray_0 = l_Localize_0(l_Ray_0);
l_Rect_0 = l_Localize_0(l_Rect_0);
l_Faces_0 = l_Localize_0(l_Faces_0);
l_Color3_0 = l_Localize_0(l_Color3_0);
l_NumberRange_0 = l_Localize_0(l_NumberRange_0);
l_NumberSequence_0 = l_Localize_0(l_NumberSequence_0);
l_NumberSequenceKeypoint_0 = l_Localize_0(l_NumberSequenceKeypoint_0);
l_ColorSequenceKeypoint_0 = l_Localize_0(l_ColorSequenceKeypoint_0);
l_PhysicalProperties_0 = l_Localize_0(l_PhysicalProperties_0);
l_ColorSequence_0 = l_Localize_0(l_ColorSequence_0);
l_Region3int16_0 = l_Localize_0(l_Region3int16_0);
l_Vector3int16_0 = l_Localize_0(l_Vector3int16_0);
l_BrickColor_0 = l_Localize_0(l_BrickColor_0);
l_TweenInfo_0 = l_Localize_0(l_TweenInfo_0);
l_Axes_0 = l_Localize_0(l_Axes_0);
l_task_0 = l_Localize_0(l_task_0);
v71("Wrap");
local l_Wrap_0 = v82.Wrap;
local l_UnWrap_0 = v82.UnWrap;
for v145, v146 in v82 do
    if l_type_0(v146) == "userdata" then
        v82[v145] = l_Wrap_0(v146, true);
    end;
end;
l_Parent_0 = l_Wrap_0(l_Parent_0, true);
l_Enum_0 = l_Wrap_0(l_Enum_0, true);
l_rawequal_0 = v82.RawEqual;
l_script_0 = l_Wrap_0(l_script_0, true);
l_game_0 = l_Wrap_0(l_game_0, true);
l_workspace_0 = l_Wrap_0(l_workspace_0, true);
l_Instance_0 = {
    new = function(v147, v148) --[[ Line: 445 ]] --[[ Name: new ]]
        -- upvalues: l_Wrap_0 (copy), l_new_0 (copy), l_UnWrap_0 (copy)
        return l_Wrap_0(l_new_0(v147, l_UnWrap_0(v148)), true);
    end
};
l_require_0 = function(v149, v150) --[[ Line: 449 ]]
    -- upvalues: l_l_require_0_0 (copy), l_UnWrap_0 (copy), l_Wrap_0 (copy)
    if v150 == true then
        return (l_l_require_0_0(l_UnWrap_0(v149)));
    else
        return (l_Wrap_0(l_l_require_0_0(l_UnWrap_0(v149)), true));
    end;
end;
v81.Service = v82;
v81.Module = l_Wrap_0(v81.Module, true);
v71("Setting things up");
for v151, v152 in {
    _G = l__G_0, 
    game = l_game_0, 
    spawn = l_defer_0, 
    script = l_script_0, 
    getfenv = l_getfenv_0, 
    setfenv = l_setfenv_0, 
    workspace = l_workspace_0, 
    getmetatable = l_getmetatable_0, 
    setmetatable = l_setmetatable_0, 
    loadstring = l_loadstring_0, 
    coroutine = l_coroutine_0, 
    rawequal = l_rawequal_0, 
    typeof = l_typeof_0, 
    print = l_print_0, 
    math = l_math_0, 
    warn = l_warn_0, 
    error = l_error_0, 
    assert = v65, 
    pcall = l_pcall_0, 
    xpcall = l_xpcall_0, 
    select = l_select_0, 
    rawset = l_rawset_0, 
    rawget = l_rawget_0, 
    ipairs = l_ipairs_0, 
    pairs = l_pairs_0, 
    next = l_next_0, 
    Rect = l_Rect_0, 
    Axes = l_Axes_0, 
    os = l_os_0, 
    time = l_time_0, 
    Faces = l_Faces_0, 
    delay = l_delay_0, 
    unpack = l_unpack_0, 
    string = l_string_0, 
    Color3 = l_Color3_0, 
    newproxy = l_newproxy_0, 
    tostring = l_tostring_0, 
    tonumber = l_tonumber_0, 
    Instance = l_Instance_0, 
    TweenInfo = l_TweenInfo_0, 
    BrickColor = l_BrickColor_0, 
    NumberRange = l_NumberRange_0, 
    ColorSequence = l_ColorSequence_0, 
    NumberSequence = l_NumberSequence_0, 
    ColorSequenceKeypoint = l_ColorSequenceKeypoint_0, 
    NumberSequenceKeypoint = l_NumberSequenceKeypoint_0, 
    PhysicalProperties = l_PhysicalProperties_0, 
    Region3int16 = l_Region3int16_0, 
    Vector3int16 = l_Vector3int16_0, 
    require = l_require_0, 
    table = l_table_0, 
    type = l_type_0, 
    wait = l_wait_0, 
    Enum = l_Enum_0, 
    UDim = l_UDim_0, 
    UDim2 = l_UDim2_0, 
    Vector2 = l_Vector2_0, 
    Vector3 = l_Vector3_0, 
    Region3 = l_Region3_0, 
    CFrame = l_CFrame_0, 
    Ray = l_Ray_0, 
    task = l_task_0, 
    tick = l_tick_0, 
    service = v82
} do
    v80[v151] = v152;
end;
v71("Return init function");
return v82.NewProxy({
    __call = function(_, v154) --[[ Line: 532 ]] --[[ Name: __call ]]
        -- upvalues: v71 (copy), l_string_0 (ref), l_Parent_0 (ref), v82 (ref), l_setfenv_0 (copy), v74 (copy), l_setmetatable_0 (copy), v81 (ref), l_l_require_0_0 (copy), l_UnWrap_0 (copy), l_table_0 (ref), l_ipairs_0 (copy), l_script_0 (ref), v66 (copy), v83 (copy), v95 (copy), v88 (copy), l_workspace_0 (ref), v0 (copy), v129 (copy), v93 (copy), l_os_0 (ref), l_type_0 (copy), l_getmetatable_0 (copy)
        v71("Begin init");
        local v155, v156 = l_string_0.match(v154.Name, "(.*)\\(.*)");
        l_Parent_0 = v82.Wrap(v154.Folder or l_Parent_0);
        if l_Parent_0:FindFirstChild("ADONIS_DEBUGMODE_ENABLED") then
            v154.DebugMode = true;
        else
            v154.DebugMode = false;
        end;
        l_setfenv_0(1, (l_setmetatable_0({}, {
            __metatable = v74
        })));
        v81.Folder = l_Parent_0;
        v81.UIFolder = l_Parent_0:WaitForChild("UI", 9000000000);
        v81.Shared = l_Parent_0:WaitForChild("Shared", 9000000000);
        v81.Loader = v154.Loader;
        v81.Module = v154.Module;
        v81.DepsName = v156;
        v81.TrueStart = v154.Start;
        v81.LoadingTime = v154.LoadingTime;
        v81.RemoteName = v155;
        v81.DebugMode = v154.DebugMode;
        v81.Typechecker = l_l_require_0_0(l_UnWrap_0(v81.Shared.Typechecker));
        v81.Changelog = l_l_require_0_0(l_UnWrap_0(v81.Shared.Changelog));
        v81.FormattedChangelog = l_table_0.create(#v81.Changelog);
        local function v159(v157) --[[ Line: 563 ]] --[[ Name: applyColour ]]
            -- upvalues: l_string_0 (ref)
            local v158 = v157:sub(1, 2);
            if v158 == "[v" or v158 == "[1" or v158 == "[0" or v158 == "1." or v157:sub(1, 1) == "v" then
                return (("<font color='#8FAEFF'>%*</font>"):format(v157));
            elseif v157:sub(1, 6) == "[Patch" then
                return (("<font color='#F0B654'>%*</font>"):format(v157));
            elseif v157:sub(1, 9) == "Version: " then
                return (("<b>%*</b>"):format(v157));
            elseif v157:sub(1, 2) == "# " then
                return (("<b>%*</b>"):format((l_string_0.sub(v157, 3))));
            else
                return v157;
            end;
        end;
        for v160, v161 in l_ipairs_0(v81.Changelog) do
            v81.FormattedChangelog[v160] = v159(v161);
        end;
        local v162 = l_l_require_0_0(l_UnWrap_0(v81.Shared.MatIcons));
        local l_v162_0 = v162 --[[ copy: 5 -> 15 ]];
        v81.MatIcons = l_setmetatable_0({}, {
            __index = function(v164, v165) --[[ Line: 587 ]] --[[ Name: __index ]]
                -- upvalues: l_v162_0 (copy)
                local v166 = l_v162_0[v165];
                if v166 then
                    v164[v165] = ("rbxassetid://%*"):format(v166);
                    return v164[v165];
                else
                    return;
                end;
            end, 
            __metatable = not v154.DebugMode and "Adonis" or v74
        });
        v71("Get dependencies");
        for _, v168 in l_Parent_0:WaitForChild("Dependencies", 9000000000):GetChildren() do
            v81.Deps[v168.Name] = v168;
        end;
        v71("Destroy script object");
        l_script_0.Parent = nil;
        v71("Initial services caching");
        for _, v170 in v66 do
            local _ = v82[v170];
        end;
        v71("Add service specific");
        v83.Player = v82.Players.LocalPlayer or (function() --[[ Line: 618 ]]
            -- upvalues: v82 (ref)
            v82.Players:GetPropertyChangedSignal("LocalPlayer"):Wait();
            return v82.Players.LocalPlayer;
        end)();
        v83.PlayerGui = v83.Player:FindFirstChildWhichIsA("PlayerGui");
        if not v83.PlayerGui then
            v95(function() --[[ Line: 624 ]]
                -- upvalues: v83 (ref), v88 (ref)
                local v172 = v83.Player:WaitForChild("PlayerGui", 120);
                if not v172 then
                    v88("PlayerGui unable to be fetched? [Waited 120 Seconds]");
                    return;
                else
                    v83.PlayerGui = v172;
                    return;
                end;
            end);
        end;
        v83.Filter = function(v173, v174, v175) --[[ Line: 633 ]]
            -- upvalues: v81 (ref), v82 (ref)
            return v81.Remote.Get("Filter", v173, v175 and v174 or v82.Player, v175 or v174);
        end;
        v83.LaxFilter = function(v176, v177) --[[ Line: 636 ]]
            -- upvalues: v82 (ref)
            return v82.Filter(v176, v177 or v82.Player, v177 or v82.Player);
        end;
        v83.BroadcastFilter = function(v178, v179) --[[ Line: 639 ]]
            -- upvalues: v81 (ref), v82 (ref)
            return v81.Remote.Get("BroadcastFilter", v178, v179 or v82.Player);
        end;
        v83.IsMobile = function() --[[ Line: 643 ]]
            -- upvalues: v82 (ref)
            return v82.UserInputService.TouchEnabled and not v82.UserInputService.MouseEnabled and not v82.UserInputService.KeyboardEnabled;
        end;
        v83.LocalContainer = function() --[[ Line: 649 ]]
            -- upvalues: v81 (ref), v82 (ref), l_workspace_0 (ref)
            local l_Variables_0 = v81.Variables;
            if not l_Variables_0.LocalContainer or not l_Variables_0.LocalContainer.Parent then
                l_Variables_0.LocalContainer = v82.New("Folder", {
                    Parent = l_workspace_0, 
                    Archivable = false, 
                    Name = ("__ADONIS_LOCALCONTAINER_%*"):format((v82.HttpService:GenerateGUID(false)))
                });
            end;
            return l_Variables_0.LocalContainer;
        end;
        v83.IncognitoPlayers = {};
        v71("Loading core modules");
        for _, v182 in v0 do
            local l_FirstChild_0 = l_Parent_0.Core:FindFirstChild(v182);
            if l_FirstChild_0 then
                v71((("~! Loading Core Module: %*"):format(v182)));
                v129(l_FirstChild_0, true, {
                    script = l_script_0
                }, true);
            end;
        end;
        v162 = {};
        local v184 = {};
        local v185 = {};
        local v186 = {};
        v81.Finish_Loading = function() --[[ Line: 680 ]]
            -- upvalues: v71 (ref), v81 (ref), v185 (copy), v93 (ref), v154 (copy), v162 (copy), v82 (ref), l_os_0 (ref)
            v71("Client fired finished loading");
            if v81.Core.Key then
                v71("~! Doing run after loaded");
                for _, v188 in v185 do
                    v93(v188, v154);
                end;
                v71("~! Doing run last");
                for _, v190 in v162 do
                    v93(v190, v154);
                end;
                v71("Finish loading");
                v81.Finish_Loading = function() --[[ Line: 697 ]]

                end;
                v81.LoadingTime();
                v82.Events.FinishedLoading:Fire(l_os_0.time());
                v71("~! FINISHED LOADING!");
                return;
            else
                v71("Client missing remote key");
                v81.Kill()("Missing remote key");
                return;
            end;
        end;
        v71("~! Init cores");
        for _, v192 in v0 do
            local v193 = v81[v192];
            v71((("~! INIT: %*"):format(v192)));
            if v193 and (l_type_0(v193) == "table" or l_type_0(v193) == "userdata" and l_getmetatable_0(v193) == "ReadOnly_Table") then
                if v193.RunLast then
                    l_table_0.insert(v162, v193.RunLast);
                    v193.RunLast = nil;
                end;
                if v193.RunAfterInit then
                    l_table_0.insert(v184, v193.RunAfterInit);
                    v193.RunAfterInit = nil;
                end;
                if v193.RunAfterPlugins then
                    l_table_0.insert(v186, v193.RunAfterPlugins);
                    v193.RunAfterPlugins = nil;
                end;
                if v193.RunAfterLoaded then
                    l_table_0.insert(v185, v193.RunAfterLoaded);
                    v193.RunAfterLoaded = nil;
                end;
                if v193.Init then
                    v71((("Run init for %*"):format(v192)));
                    v93(v193.Init, v154);
                    v193.Init = nil;
                end;
            end;
        end;
        v71("~! Running after init");
        for _, v195 in v184 do
            v93(v195, v154);
        end;
        v71("~! Running plugins");
        for _, v197 in l_Parent_0.Plugins:GetChildren() do
            if v197.Name ~= "README" then
                v129(v197, false, {
                    script = v197, 
                    cPcall = v81.cPcall
                });
            end;
        end;
        v71("~! Running after plugins");
        for _, v199 in v186 do
            v93(v199, v154);
        end;
        v71("Initial loading complete");
        v81.AllModulesLoaded = true;
        v82.Events.AllModulesLoaded:Fire(l_os_0.time());
        v82.Events.ClientInitialized:Fire();
        v71("~! Return success");
        return "SUCCESS";
    end, 
    __metatable = not l_Parent_0:FindFirstChild("ADONIS_DEBUGMODE_ENABLED") and "Adonis" or v74, 
    __tostring = function() --[[ Line: 779 ]] --[[ Name: __tostring ]]
        return "Adonis";
    end
});