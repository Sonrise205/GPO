client = nil;
service = nil;
Pcall = nil;
Routine = nil;
GetEnv = nil;
origEnv = nil;
logError = nil;
log = nil;
return function(v0, v1) --[[ Line: 11 ]]
    local v2 = v1(nil, {
        script = script
    });
    setfenv(1, v2);
    local l__G_0 = _G;
    local _ = game;
    local l_script_0 = script;
    local l_getfenv_0 = getfenv;
    local l_setfenv_0 = setfenv;
    local _ = workspace;
    local l_getmetatable_0 = getmetatable;
    local l_setmetatable_0 = setmetatable;
    local _ = loadstring;
    local _ = coroutine;
    local _ = rawequal;
    local _ = typeof;
    local l_print_0 = print;
    local l_math_0 = math;
    local l_warn_0 = warn;
    local l_error_0 = error;
    local _ = pcall;
    local _ = xpcall;
    local _ = select;
    local l_rawset_0 = rawset;
    local l_rawget_0 = rawget;
    local l_ipairs_0 = ipairs;
    local l_pairs_0 = pairs;
    local l_next_0 = next;
    local _ = Rect;
    local _ = Axes;
    local _ = os;
    local _ = time;
    local _ = Faces;
    local _ = unpack;
    local _ = string;
    local _ = Color3;
    local _ = newproxy;
    local l_tostring_0 = tostring;
    local l_tonumber_0 = tonumber;
    local _ = Instance;
    local _ = TweenInfo;
    local _ = BrickColor;
    local _ = NumberRange;
    local _ = ColorSequence;
    local _ = NumberSequence;
    local _ = ColorSequenceKeypoint;
    local _ = NumberSequenceKeypoint;
    local _ = PhysicalProperties;
    local _ = Region3int16;
    local _ = Vector3int16;
    local l_require_0 = require;
    local l_table_0 = table;
    local l_type_0 = type;
    local _ = wait;
    local _ = Enum;
    local _ = UDim;
    local _ = UDim2;
    local _ = Vector2;
    local _ = Vector3;
    local _ = Region3;
    local _ = CFrame;
    local _ = Ray;
    local _ = delay;
    local l_Service_0 = v0.Service;
    local l_Client_0 = v0.Client;
    local v64 = nil;
    local v65 = nil;
    local v66 = nil;
    local v67 = nil;
    local v68 = nil;
    local v69 = nil;
    local v70 = nil;
    local function v72(v71) --[[ Line: 40 ]] --[[ Name: Init ]]
        -- upvalues: v69 (ref), l_Client_0 (copy), v64 (ref), v65 (ref), v70 (ref), v66 (ref), v67 (ref), v68 (ref)
        v69 = l_Client_0.UI;
        v64 = l_Client_0.Anti;
        v65 = l_Client_0.Core;
        v70 = l_Client_0.Variables;
        v66 = l_Client_0.Functions;
        v67 = l_Client_0.Process;
        v68 = l_Client_0.Remote;
        v65.Name = "\000";
        v65.Special = l_Client_0.DepsName;
        v65.MakeGui = v69.Make;
        v65.GetGui = v69.Get;
        v65.RemoveGui = v69.Remove;
        if v71.DebugMode == true then
            v65.DebugMode = true;
        end;
        v65.Init = nil;
    end;
    local function v74(_) --[[ Line: 62 ]] --[[ Name: RunAfterPlugins ]]
        -- upvalues: v65 (ref)
        v65.GetEvent();
        v65.RunAfterPlugins = nil;
    end;
    local function v75() --[[ Line: 68 ]] --[[ Name: RunLast ]]
        -- upvalues: l_Service_0 (copy), v65 (ref)
        if l_Service_0.NetworkClient then
            l_Service_0.TrackTask("Thread: API Manager", v65.StartAPI);
        end;
        v65.RunLast = nil;
    end;
    l_getfenv_0().client = nil;
    l_getfenv_0().service = nil;
    l_getfenv_0().script = nil;
    l_Client_0.Core = {
        Init = v72, 
        RunLast = v75, 
        RunAfterPlugins = v74, 
        Name = l_script_0.Name, 
        Special = l_script_0.Name, 
        ScriptCache = {}, 
        GetEvent = function() --[[ Line: 122 ]] --[[ Name: GetEvent ]]
            -- upvalues: v65 (ref), l_Service_0 (copy), l_Client_0 (copy), v64 (ref), v67 (ref), l_warn_0 (copy), v68 (ref)
            if v65.RemoteEvent then
                log("Disconnect old RemoteEvent");
                for _, v77 in v65.RemoteEvent.Events do
                    v77:Disconnect();
                end;
                v65.RemoteEvent = nil;
            end;
            log("Getting RemoteEvent");
            local v78 = {};
            local l_ReplicatedStorage_0 = l_Service_0.ReplicatedStorage;
            local v80 = l_ReplicatedStorage_0:WaitForChild(l_Client_0.RemoteName, 300);
            if not v80 then
                v64.Detected("Kick", "RemoteEvent Not Found");
                return;
            else
                log("Getting RemoteFunction");
                local v81 = v80:WaitForChild("__FUNCTION", 120);
                if not v81 then
                    v64.Detected("Kick", "RemoteFunction Not Found");
                    return;
                else
                    local v82 = {};
                    v81.OnClientInvoke = v67.Remote;
                    v78.Object = v80;
                    v78.Function = v81;
                    v78.FireServer = v80.FireServer;
                    v78.Events = v82;
                    v82.ProcessRemote = v80.OnClientEvent:Connect(v67.Remote);
                    v82.ParentChildRemoved = l_ReplicatedStorage_0.ChildRemoved:Connect(function(v83) --[[ Line: 159 ]]
                        -- upvalues: v65 (ref), v78 (copy), v80 (copy), l_warn_0 (ref)
                        if v65.RemoteEvent == v78 and v83 == v80 and task.wait() then
                            l_warn_0("::ADONIS:: REMOTE EVENT REMOVED? RE-GRABBING");
                            log("~! REMOTEEVENT WAS REMOVED?");
                            v65.GetEvent();
                        end;
                    end);
                    v65.RemoteEvent = v78;
                    if not v65.Key then
                        log("~! Getting key from server");
                        v65.Key = v68.Get((("%*GET_KEY"):format(l_Client_0.DepsName)));
                        if v65.Key then
                            l_Client_0.Finish_Loading();
                            return;
                        else
                            v68.Fire((("%*GET_KEY"):format(l_Client_0.DepsName)));
                        end;
                    end;
                    return;
                end;
            end;
        end, 
        DebugMode = l_Client_0.DebugMode, 
        LoadPlugin = function(v84) --[[ Line: 184 ]] --[[ Name: LoadPlugin ]]
            -- upvalues: l_require_0 (copy), l_setfenv_0 (copy), v1 (copy), l_getfenv_0 (copy)
            local v85 = l_require_0(v84);
            local v86 = l_setfenv_0(v85, v1(l_getfenv_0(v85)));
            task.spawn(Pcall, v86);
        end, 
        LoadBytecode = function(v87, v88) --[[ Line: 190 ]] --[[ Name: LoadBytecode ]]
            -- upvalues: l_require_0 (copy), l_Client_0 (copy)
            return l_require_0(l_Client_0.Shared.FiOne, true)(v87, v88);
        end, 
        LoadCode = function(v89, v90) --[[ Line: 194 ]] --[[ Name: LoadCode ]]
            -- upvalues: v65 (ref)
            return v65.LoadBytecode(v89, v90);
        end, 
        StartAPI = function() --[[ Line: 198 ]] --[[ Name: StartAPI ]]
            -- upvalues: v65 (ref), l_Client_0 (copy), v68 (ref), l_Service_0 (copy), l__G_0 (copy), l_setmetatable_0 (copy), l_type_0 (copy), l_print_0 (copy), l_error_0 (copy), l_pairs_0 (copy), l_ipairs_0 (copy), l_warn_0 (copy), l_next_0 (copy), l_table_0 (copy), l_rawset_0 (copy), l_rawget_0 (copy), l_getfenv_0 (copy), l_setfenv_0 (copy), l_require_0 (copy), l_tostring_0 (copy), l_getmetatable_0 (copy), v0 (copy), l_tonumber_0 (copy), l_math_0 (copy)
            local l_ScriptCache_0 = v65.ScriptCache;
            local l_FiOne_0 = l_Client_0.Shared.FiOne;
            local l_Get_0 = v68.Get;
            local _ = v68.GetFire;
            local l_G_API_0 = l_Client_0.G_API;
            local l_Allowed_API_Calls_0 = l_Client_0.Allowed_API_Calls;
            local l_NewProxy_0 = l_Service_0.NewProxy;
            local l_ReplicatedStorage_1 = l_Service_0.ReplicatedStorage;
            local l_MetaFunc_0 = l_Service_0.MetaFunc;
            local _ = l_Service_0.ReadOnly;
            local l_StartLoop_0 = l_Service_0.StartLoop;
            local l_ReadOnly_1 = l_Service_0.ReadOnly;
            local l_UnWrap_0 = l_Service_0.UnWrap;
            local l_l__G_0_0 = l__G_0;
            local l_l_setmetatable_0_0 = l_setmetatable_0;
            local l_l_type_0_0 = l_type_0;
            local l_l_print_0_0 = l_print_0;
            local l_l_error_0_0 = l_error_0;
            local _ = l_pairs_0;
            local l_l_ipairs_0_0 = l_ipairs_0;
            local l_l_warn_0_0 = l_warn_0;
            local _ = l_next_0;
            local l_l_table_0_0 = l_table_0;
            local l_l_rawset_0_0 = l_rawset_0;
            local l_l_rawget_0_0 = l_rawget_0;
            local l_l_getfenv_0_0 = l_getfenv_0;
            local l_l_setfenv_0_0 = l_setfenv_0;
            local l_l_require_0_0 = l_require_0;
            local l_l_tostring_0_0 = l_tostring_0;
            local _ = Routine;
            local _ = Pcall;
            local _ = {};
            l_l_setfenv_0_0(1, (l_l_setmetatable_0_0({}, {
                __metatable = l_getmetatable_0(l_l_getfenv_0_0())
            })));
            local _ = {
                API_Specific = {
                    Test = function() --[[ Line: 243 ]] --[[ Name: Test ]]
                        -- upvalues: l_l_print_0_0 (copy)
                        l_l_print_0_0("We ran the api specific stuff");
                    end
                }, 
                Service = nil
            };
            local v131 = {
                Access = l_ReadOnly_1({}, nil, nil, true), 
                Scripts = l_ReadOnly_1({
                    ExecutePermission = function(v124, v125) --[[ Line: 296 ]]
                        -- upvalues: l_ScriptCache_0 (copy), l_UnWrap_0 (copy), l_Get_0 (copy), l_l_require_0_0 (copy), l_FiOne_0 (copy), l_l_table_0_0 (copy)
                        local v126 = nil;
                        for _, v128 in l_ScriptCache_0 do
                            if l_UnWrap_0(v128.Script) == v124 then
                                v126 = v128;
                            end;
                        end;
                        if v126 and v126.noCache ~= true and (not v126.runLimit or v126.runLimit and v126.Executions <= v126.runLimit) then
                            v126.Executions = v126.Executions + 1;
                            return v126.Source, v126.Loadstring;
                        else
                            local v129 = l_Get_0("ExecutePermission", v124, v125, true);
                            if v129 and v129.Source then
                                local v130 = nil;
                                if not v126 then
                                    v130 = l_l_require_0_0(l_FiOne_0:Clone(), true);
                                    l_l_table_0_0.insert(l_ScriptCache_0, {
                                        Script = v124, 
                                        Source = v129.Source, 
                                        Loadstring = v130, 
                                        noCache = v129.noCache, 
                                        runLimit = v129.runLimit, 
                                        Executions = v129.Executions
                                    });
                                else
                                    v130 = v126.Loadstring;
                                    v126.Source = v129.Source;
                                end;
                                return v129.Source, v130;
                            else
                                return;
                            end;
                        end;
                    end
                }, nil, nil, true)
            };
            if v65.DebugMode == true then
                local v132 = {
                    Env = v0
                };
                v131.Debug = v132;
                local v133 = {};
                local function v139(v134) --[[ Line: 341 ]] --[[ Name: getRealEnvResult ]]
                    -- upvalues: l_tonumber_0 (ref), v133 (copy), v0 (ref), l_l_ipairs_0_0 (copy)
                    if l_tonumber_0(v134) and v133[v134] then
                        return v133[v134], true;
                    else
                        local v135 = v134:split("/.\\");
                        local l_v0_0 = v0;
                        for _, v138 in l_l_ipairs_0_0(v135) do
                            l_v0_0 = l_v0_0[v138];
                        end;
                        return l_v0_0, false;
                    end;
                end;
                local l_Adonis_Debug_API_0 = l_ReplicatedStorage_1:FindFirstChild("Adonis_Debug_API");
                if l_Adonis_Debug_API_0 then
                    local l_v132_0 = v132 --[[ copy: 34 -> 38 ]];
                    l_Adonis_Debug_API_0.OnInvoke = function(v142, ...) --[[ Line: 356 ]]
                        -- upvalues: l_l_type_0_0 (copy), v139 (copy), l_l_table_0_0 (copy), l_getmetatable_0 (ref), l_math_0 (ref), l_l_tostring_0_0 (copy), v133 (copy), l_UnWrap_0 (copy), l_v132_0 (copy)
                        local v143 = {
                            ...
                        };
                        if v142 == "RunEnvFunc" then
                            local v144 = v143[1];
                            if v144 and l_l_type_0_0(v144) == "string" then
                                local v145, _ = v139(v144);
                                return v145(l_l_table_0_0.unpack(v143, 2, #v143));
                            end;
                        elseif v142 == "GetEnvTableMeta" then
                            local v147 = v143[1];
                            if v147 and l_l_type_0_0(v147) == "string" then
                                local v148, _ = v139(v147);
                                return (l_getmetatable_0(v148));
                            end;
                        elseif v142 == "RunEnvTableMetaFunc" then
                            local v150 = v143[1];
                            local v151 = v143[2];
                            if v150 and l_l_type_0_0(v150) == "string" then
                                local v152, _ = v139(v150);
                                local v154 = l_getmetatable_0(v152)[v151](v152, l_l_table_0_0.unpack(v143, 3, #v143));
                                local v155 = l_l_tostring_0_0(l_math_0.random());
                                v133[v155] = v154;
                                return l_UnWrap_0(v154), v155;
                            end;
                        elseif v142 == "GetApi" or not v142 then
                            return l_v132_0;
                        end;
                    end;
                end;
            end;
            local v158 = l_NewProxy_0({
                __index = function(_, v157) --[[ Line: 390 ]] --[[ Name: __index ]]
                    -- upvalues: v131 (copy), l_G_API_0 (copy), l_Allowed_API_Calls_0 (copy), l_l_type_0_0 (copy), l_MetaFunc_0 (copy), l_l_error_0_0 (copy)
                    if v157 == "Scripts" then
                        return v131.Scripts;
                    elseif l_G_API_0 and l_Allowed_API_Calls_0.Client == true then
                        if l_l_type_0_0(v131[v157]) == "function" then
                            return l_MetaFunc_0(v131[v157]);
                        else
                            return v131[v157];
                        end;
                    else
                        l_l_error_0_0("_G API is disabled");
                        return;
                    end;
                end, 
                __newindex = function() --[[ Line: 403 ]] --[[ Name: __newindex ]]
                    -- upvalues: l_l_error_0_0 (copy)
                    l_l_error_0_0("Read-only");
                end, 
                __metatable = "API"
            });
            if not l_l_rawget_0_0(l_l__G_0_0, "Adonis") then
                if l_l_table_0_0.isfrozen and not l_l_table_0_0.isfrozen(l_l__G_0_0) or not l_l_table_0_0.isfrozen then
                    l_l_rawset_0_0(l_l__G_0_0, "Adonis", v158);
                    l_StartLoop_0("APICheck", 1, function() --[[ Line: 412 ]]
                        -- upvalues: l_l__G_0_0 (copy), l_l_rawget_0_0 (copy), v158 (copy), l_l_table_0_0 (copy), l_l_rawset_0_0 (copy), l_l_warn_0_0 (copy)
                        if l_l_rawget_0_0(l_l__G_0_0, "Adonis") ~= v158 then
                            if l_l_table_0_0.isfrozen and not l_l_table_0_0.isfrozen(l_l__G_0_0) or not l_l_table_0_0.isfrozen then
                                l_l_rawset_0_0(l_l__G_0_0, "Adonis", v158);
                                return;
                            else
                                l_l_warn_0_0("\226\154\160\239\184\143 ADONIS CRITICAL WARNING! MALICIOUS CODE IS TRYING TO CHANGE THE ADONIS _G API AND IT CAN'T BE SET BACK! PLEASE SHUTDOWN THE SERVER AND REMOVE THE MALICIOUS CODE IF POSSIBLE! 0x02412");
                            end;
                        end;
                    end, true);
                    return;
                else
                    l_l_warn_0_0("The _G table was locked and the Adonis _G API could not be loaded. Error code 0x02417");
                end;
            end;
        end
    };
end;