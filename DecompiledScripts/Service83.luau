server = nil;
client = nil;
Pcall = nil;
Routine = nil;
logError = nil;
local v0 = nil;
local v1 = nil;
local v2 = {};
local v8 = setmetatable({}, {
    __index = function(_, v4) --[[ Line: 11 ]] --[[ Name: __index ]]
        -- upvalues: v2 (copy), v1 (ref)
        return function(v5, ...) --[[ Line: 12 ]]
            -- upvalues: v4 (copy), v2 (ref), v1 (ref)
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 13 ]]
                -- upvalues: v5 (copy)
                return v5.ClassName;
            end);
            if l_status_0 and l_result_0 and v5[v4] and type(v5[v4]) == "function" then
                if not v2[l_result_0] then
                    v2[l_result_0] = {};
                end;
                if not v2[l_result_0][v4] then
                    v2[l_result_0][v4] = v5[v4];
                end;
                if v2[l_result_0][v4] ~= v5[v4] and v1 then
                    v1("MethodError", ("%* || Cached method does not match found method: %*"):format(debug.traceback(), v4), ("Method: %*"):format(v4), v4);
                end;
                return v2[l_result_0][v4](v5, ...);
            else
                return v5[v4](v5, ...);
            end;
        end;
    end, 
    __metatable = "Methods"
});
return function(v9, _, v11, v12) --[[ Line: 39 ]]
    -- upvalues: v0 (ref), v1 (ref), v8 (copy)
    if v12 then
        setfenv(1, v12);
    end;
    local _ = _G;
    local l_game_0 = game;
    local l_script_0 = script;
    local l_getfenv_0 = getfenv;
    local _ = setfenv;
    local _ = workspace;
    local l_getmetatable_0 = getmetatable;
    local l_setmetatable_0 = setmetatable;
    local _ = loadstring;
    local l_coroutine_0 = coroutine;
    local l_rawequal_0 = rawequal;
    local l_typeof_0 = typeof;
    local _ = print;
    local l_math_0 = math;
    local l_warn_0 = warn;
    local l_error_0 = error;
    local l_pcall_0 = pcall;
    local l_xpcall_0 = xpcall;
    local l_select_0 = select;
    local l_rawset_0 = rawset;
    local l_rawget_0 = rawget;
    local l_ipairs_0 = ipairs;
    local _ = pairs;
    local _ = next;
    local _ = Rect;
    local _ = Axes;
    local l_os_0 = os;
    local l_time_0 = time;
    local _ = Faces;
    local l_unpack_0 = unpack;
    local l_string_0 = string;
    local _ = Color3;
    local l_newproxy_0 = newproxy;
    local l_tostring_0 = tostring;
    local l_tonumber_0 = tonumber;
    local l_Instance_0 = Instance;
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
    local l_wait_0 = task.wait;
    local l_Enum_0 = Enum;
    local _ = UDim;
    local _ = UDim2;
    local _ = Vector2;
    local _ = Vector3;
    local _ = Region3;
    local _ = CFrame;
    local _ = Ray;
    local l_delay_0 = task.delay;
    local _ = task.defer;
    local l_task_0 = task;
    local _ = tick;
    v0 = server or client;
    v1 = v9;
    server = nil;
    client = nil;
    local l_Routine_0 = v12.Routine;
    local v76 = nil;
    local v77 = {};
    local v78 = {};
    local v79 = {};
    local v80 = {};
    local v81 = nil;
    local function v83(v82) --[[ Line: 77 ]]
        if v82 then
            return true;
        else
            return false;
        end;
    end;
    local v84 = {};
    local v85 = {};
    local v86 = {};
    local v87 = {};
    local v88 = {};
    local v89 = {};
    local v90 = {};
    local v91 = {};
    local v92 = {};
    local v93 = {};
    local v94 = l_setmetatable_0({}, {
        __mode = "v"
    });
    local v95 = l_setmetatable_0({}, {
        __mode = "kv"
    });
    local l_new_0 = l_Instance_0.new;
    local v97 = l_Instance_0.new("Folder");
    local v98 = l_Instance_0.new("Folder");
    local v99 = l_Instance_0.new("Folder");
    local v100 = l_Instance_0.new("Folder");
    local v104 = {
        new = function(v101, v102) --[[ Line: 101 ]] --[[ Name: new ]]
            -- upvalues: l_new_0 (copy), v76 (ref)
            local v103 = l_new_0(v101);
            if v102 then
                v103.Parent = v76.UnWrap(v102);
            end;
            return v76 and client and v76.Wrap(v103, true) or v103;
        end
    };
    local v147 = {
        TrackTask = function(v105, v106, v107, ...) --[[ Line: 103 ]] --[[ Name: TrackTask ]]
            -- upvalues: l_type_0 (copy), l_select_0 (copy), v0 (ref), l_game_0 (copy), l_math_0 (copy), l_string_0 (copy), l_os_0 (copy), v90 (copy), l_xpcall_0 (copy), l_unpack_0 (copy), l_coroutine_0 (copy)
            if l_type_0(v107) ~= "function" or l_select_0("#", ...) == 0 and v107 == nil then
                v107 = function(v108) --[[ Line: 105 ]]
                    logError(v108 .. "\n" .. debug.traceback());
                end;
            end;
            local v109 = v0 and v0.Functions and l_game_0:GetService("HttpService"):GenerateGUID(false) or l_math_0.random();
            local v110 = l_string_0.sub(v105, 1, 7) == "Thread:";
            local v111 = {
                Name = v105, 
                Status = "Waiting", 
                Function = v106, 
                isThread = v110, 
                Created = l_os_0.time(), 
                Index = v109
            };
            local function v112(...) --[[ Line: 121 ]] --[[ Name: taskFunc ]]
                -- upvalues: v90 (ref), v109 (copy), v111 (copy), l_xpcall_0 (ref), v106 (copy), v107 (ref), l_unpack_0 (ref)
                v90[v109] = v111;
                v111.Status = "Running";
                v111.Returns = {
                    l_xpcall_0(v106, v107, ...)
                };
                if not v111.Returns[1] then
                    v111.Status = "Errored";
                else
                    v111.Status = "Finished";
                end;
                v90[v109] = nil;
                return l_unpack_0(v111.Returns);
            end;
            if v110 then
                v111.Thread = l_coroutine_0.create(v112);
                return l_coroutine_0.resume(v111.Thread, ...);
            else
                return v112(...);
            end;
        end, 
        EventTask = function(v113, v114) --[[ Line: 144 ]] --[[ Name: EventTask ]]
            -- upvalues: v76 (ref)
            local l_TrackTask_0 = v76.TrackTask;
            return function(...) --[[ Line: 146 ]]
                -- upvalues: l_TrackTask_0 (copy), v113 (copy), v114 (copy)
                return l_TrackTask_0(v113, v114, false, ...);
            end;
        end, 
        GetTasks = function() --[[ Line: 151 ]] --[[ Name: GetTasks ]]
            -- upvalues: v90 (copy)
            return v90;
        end, 
        TaskScheduler = function(v116, v117) --[[ Line: 155 ]] --[[ Name: TaskScheduler ]]
            -- upvalues: v92 (copy), v76 (ref), l_pcall_0 (copy), l_table_0 (copy), l_wait_0 (copy), l_os_0 (copy)
            local v118 = v117 or {};
            if not v118.Temporary and v92[v116] then
                return v92[v116];
            else
                local v121 = {
                    Name = v116, 
                    Running = true, 
                    Properties = v118, 
                    LinkedTasks = {}, 
                    RunnerEvent = v76.New("BindableEvent"), 
                    Trigger = function(v119, ...) --[[ Line: 165 ]] --[[ Name: Trigger ]]
                        v119.Event:Fire(...);
                    end, 
                    Delete = function(v120) --[[ Line: 169 ]] --[[ Name: Delete ]]
                        -- upvalues: v118 (copy), v92 (ref), v116 (copy)
                        if not v118.Temporary then
                            v92[v116] = nil;
                        end;
                        v120.Running = false;
                        v120.Event:Disconnect();
                    end
                };
                v121.Event = v121.RunnerEvent.Event:Connect(function(...) --[[ Line: 179 ]]
                    -- upvalues: v121 (copy), l_pcall_0 (ref), l_table_0 (ref)
                    for v122, v123 in v121.LinkedTasks do
                        local _, v125 = l_pcall_0(v123);
                        if v125 then
                            l_table_0.remove(v121.LinkedTasks, v122);
                        end;
                    end;
                end);
                if v118.Interval then
                    while l_wait_0(v118.Interval) and v121.Running do
                        v121:Trigger(l_os_0.time());
                    end;
                end;
                if not v118.Temporary then
                    v92[v116] = v121;
                end;
                return v121;
            end;
        end, 
        Events = l_setmetatable_0({}, {
            __index = function(_, v127) --[[ Line: 202 ]] --[[ Name: __index ]]
                -- upvalues: v76 (ref)
                return v76.GetEvent(v127);
            end
        }), 
        CheckEvents = function(_) --[[ Line: 207 ]] --[[ Name: CheckEvents ]]
            -- upvalues: v84 (copy), l_time_0 (copy), v85 (copy)
            return "Disabled";
        end, 
        WrapEventArgs = function(v129) --[[ Line: 230 ]] --[[ Name: WrapEventArgs ]]
            -- upvalues: v76 (ref), l_type_0 (copy)
            local l_Wrap_0 = v76.Wrap;
            for v131, v132 in v129 do
                if l_type_0(v132) == "table" and v132.__ISWRAPPED and v132.__OBJECT then
                    v129[v131] = l_Wrap_0(v132.__OBJECT);
                end;
            end;
            return v129;
        end, 
        UnWrapEventArgs = function(v133) --[[ Line: 241 ]] --[[ Name: UnWrapEventArgs ]]
            -- upvalues: v76 (ref)
            local l_UnWrap_0 = v76.UnWrap;
            local l_Wrapped_0 = v76.Wrapped;
            for v136, v137 in v133 do
                if l_Wrapped_0(v137) then
                    v133[v136] = {
                        __ISWRAPPED = true, 
                        __OBJECT = l_UnWrap_0(v137)
                    };
                end;
            end;
            return v133;
        end, 
        GetEvent = function(v138) --[[ Line: 256 ]] --[[ Name: GetEvent ]]
            -- upvalues: v85 (copy), v76 (ref)
            if not v85[v138] then
                local v139 = v76.GoodSignal.new();
                v85[v138] = v139;
                return v139;
            else
                return v85[v138];
            end;
        end, 
        HookEvent = function(v140, v141, _) --[[ Line: 268 ]] --[[ Name: HookEvent ]]
            -- upvalues: l_type_0 (copy), l_warn_0 (copy), v76 (ref)
            if l_type_0(v140) ~= "string" or l_type_0(v141) ~= "function" then
                l_warn_0("Invalid argument supplied; HookEvent(string, function)");
                return;
            else
                return v76.GetEvent(v140):Connect(v141);
            end;
        end, 
        FireEvent = function(v143, ...) --[[ Line: 276 ]] --[[ Name: FireEvent ]]
            -- upvalues: v85 (copy)
            local v144 = v85[v143];
            return v144 and v144:Fire(...);
        end, 
        RemoveEvents = function(v145) --[[ Line: 281 ]] --[[ Name: RemoveEvents ]]
            -- upvalues: v85 (copy)
            local v146 = v85[v145];
            if v146 then
                v85[v145] = nil;
                v146:Destroy();
            end;
        end
    };
    local v198 = {
        Tasks = {}, 
        Threads = {}, 
        CheckTasks = function() --[[ Line: 291 ]] --[[ Name: CheckTasks ]]
            -- upvalues: v76 (ref)
            for _, v149 in v76.Threads.Tasks do
                if not v149.Thread or v149:Status() == "dead" then
                    v149:Remove();
                end;
            end;
        end, 
        NewTask = function(v150, v151, v152) --[[ Line: 299 ]] --[[ Name: NewTask ]]
            -- upvalues: l_math_0 (copy), l_os_0 (copy), l_unpack_0 (copy), v76 (ref), l_table_0 (copy), v1 (ref)
            local v153 = l_math_0.random() * l_os_0.time() / 1000;
            local v154 = ("%*:%*"):format(v153, v151);
            local v155 = nil;
            v155 = {
                PID = v153, 
                Name = v150, 
                Index = v154, 
                Created = l_os_0.time(), 
                Changed = {}, 
                Timeout = v152 or 0, 
                Running = false, 
                R_Status = "Idle", 
                Finished = {}, 
                Function = function(...) --[[ Line: 313 ]] --[[ Name: Function ]]
                    -- upvalues: v155 (ref), v151 (copy), l_unpack_0 (ref)
                    v155.R_Status = "Running";
                    v155.Running = true;
                    local v156 = {
                        v151(...)
                    };
                    v155.R_Status = "Finished";
                    v155.Running = false;
                    v155.Remove();
                    return l_unpack_0(v156);
                end, 
                Remove = function() --[[ Line: 314 ]] --[[ Name: Remove ]]
                    -- upvalues: v155 (ref), v76 (ref), l_table_0 (ref), v154 (copy)
                    v155.R_Status = "Removed";
                    v155.Running = false;
                    for v157, v158 in v76.Threads.Tasks do
                        if v158 == v155 then
                            l_table_0.remove(v76.Threads.Tasks, v157);
                        end;
                    end;
                    v155.Changed:Fire("Removed");
                    v155.Finished:Fire();
                    v76.RemoveEvents((("%*_TASKCHANGED"):format(v154)));
                    v76.RemoveEvents((("%*_TASKFINISHED"):format(v154)));
                    v155.Thread = nil;
                end, 
                Thread = v76.Threads.Create(function(...) --[[ Line: 315 ]]
                    -- upvalues: v155 (ref)
                    return v155.Function(...);
                end), 
                Resume = function(...) --[[ Line: 316 ]] --[[ Name: Resume ]]
                    -- upvalues: v155 (ref), v76 (ref), v1 (ref), l_unpack_0 (ref)
                    v155.R_Status = "Resumed";
                    v155.Running = true;
                    v155.Changed:Fire("Resumed");
                    local v159 = {
                        v76.Threads.Resume(v155.Thread, ...)
                    };
                    if not v159[1] then
                        v1("TaskError", v159[2]);
                        v155.Changed:Fire("Errored", v159[2]);
                        v155.Remove();
                    end;
                    return l_unpack_0(v159);
                end, 
                Status = function() --[[ Line: 317 ]] --[[ Name: Status ]]
                    -- upvalues: v155 (ref), l_os_0 (ref), v76 (ref)
                    if v155.Timeout ~= 0 and l_os_0.time() - v155.Created > v155.Timeout then
                        v155:Stop();
                        return "timeout";
                    else
                        return v76.Threads.Status(v155.Thread);
                    end;
                end, 
                Pause = function() --[[ Line: 318 ]] --[[ Name: Pause ]]
                    -- upvalues: v155 (ref), v76 (ref)
                    v155.R_Status = "Paused";
                    v155.Running = false;
                    v76.Threads.Pause(v155.Thread);
                    v155.Changed:Fire("Paused");
                end, 
                Stop = function() --[[ Line: 319 ]] --[[ Name: Stop ]]
                    -- upvalues: v155 (ref), v76 (ref)
                    v155.R_Status = "Stopping";
                    v76.Threads.Stop(v155.Thread);
                    v155.Changed:Fire("Stopped");
                    v155.Remove();
                end, 
                Kill = function() --[[ Line: 320 ]] --[[ Name: Kill ]]
                    -- upvalues: v155 (ref), v76 (ref)
                    v155.R_Status = "Killing";
                    v76.Threads.End(v155.Thread);
                    v155.Changed:Fire("Killed");
                    v155.Remove();
                end
            };
            local function v162(_, v161) --[[ Line: 323 ]] --[[ Name: Connect ]]
                -- upvalues: v76 (ref), v154 (copy)
                return v76.Events[("%*_TASKCHANGED"):format(v154)]:Connect(v161);
            end;
            v155.Changed.Connect = v162;
            v162 = function(_, ...) --[[ Line: 327 ]] --[[ Name: Fire ]]
                -- upvalues: v76 (ref), v154 (copy)
                v76.Events[("%*_TASKCHANGED"):format(v154)]:Fire(...);
            end;
            v155.Changed.Fire = v162;
            v162 = function(_, v165) --[[ Line: 331 ]] --[[ Name: Connect ]]
                -- upvalues: v76 (ref), v154 (copy)
                return v76.Events[("%*_TASKFINISHED"):format(v154)]:Connect(v165);
            end;
            v155.Finished.Connect = v162;
            v162 = function(_) --[[ Line: 335 ]] --[[ Name: wait ]]
                -- upvalues: v76 (ref), v154 (copy)
                v76.Events[("%*_TASKFINISHED"):format(v154)]:wait(0);
            end;
            v155.Finished.wait = v162;
            v162 = function(_, ...) --[[ Line: 339 ]] --[[ Name: Fire ]]
                -- upvalues: v76 (ref), v154 (copy)
                v76.Events[("%*_TASKFINISHED"):format(v154)]:Fire(...);
            end;
            v155.Finished.Fire = v162;
            v155.End = v155.Stop;
            v155.Kill = v155.Stop;
            l_table_0.insert(v76.Threads.Tasks, v155);
            v76.Threads.CheckTasks();
            return v155.Resume, v155;
        end, 
        RunTask = function(v168, v169, ...) --[[ Line: 353 ]] --[[ Name: RunTask ]]
            -- upvalues: v76 (ref)
            local v170, v171 = v76.Threads.NewTask(v168, v169);
            return v171, v170(...);
        end, 
        TimeoutRunTask = function(v172, v173, v174, ...) --[[ Line: 358 ]] --[[ Name: TimeoutRunTask ]]
            -- upvalues: v76 (ref)
            local v175, v176 = v76.Threads.NewTask(v172, v173, v174);
            return v176, v175(...);
        end, 
        WaitTask = function(v177, v178, ...) --[[ Line: 363 ]] --[[ Name: WaitTask ]]
            -- upvalues: v76 (ref), l_unpack_0 (copy)
            local v179, v180 = v76.Threads.NewTask(v177, v178);
            local v181 = {
                v179(...)
            };
            v180.Finished:wait();
            return v180, l_unpack_0(v181);
        end, 
        NewEventTask = function(v182, v183, v184) --[[ Line: 370 ]] --[[ Name: NewEventTask ]]
            -- upvalues: v76 (ref)
            return function(...) --[[ Line: 372 ]]
                -- upvalues: v76 (ref), v182 (copy), v183 (copy), v184 (copy)
                if v76.Running then
                    return v76.Threads.NewTask(v182, v183, v184)(...);
                else
                    return function() --[[ Line: 376 ]]

                    end;
                end;
            end;
        end, 
        Stop = l_coroutine_0.yield, 
        Wait = l_coroutine_0.yield, 
        Pause = l_coroutine_0.yield, 
        Yield = l_coroutine_0.yield, 
        Status = l_coroutine_0.status, 
        Running = l_coroutine_0.running, 
        Create = l_coroutine_0.create, 
        Start = l_coroutine_0.resume, 
        Get = l_coroutine_0.running, 
        New = function(v185) --[[ Line: 391 ]] --[[ Name: New ]]
            -- upvalues: l_coroutine_0 (copy), l_table_0 (copy), v76 (ref)
            local v186 = l_coroutine_0.create(v185);
            l_table_0.insert(v76.Threads.Threads, v186);
            return v186;
        end, 
        End = function(v187) --[[ Line: 392 ]] --[[ Name: End ]]
            -- upvalues: v76 (ref)
            while true do
                if v187 and v76.Threads.Status(v187) ~= "dead" then
                    v76.Threads.Stop(v187);
                    v76.Threads.Resume(v187);
                    if not v187 or v76.Threads.Status(v187) == "dead" then
                        return;
                    end;
                else
                    v187 = false;
                    return;
                end;
            end;
        end, 
        Wrap = function(v188, ...) --[[ Line: 393 ]] --[[ Name: Wrap ]]
            -- upvalues: v76 (ref)
            local v189 = v76.Threads.New(v188);
            v76.Threads.Resume(v188, ...);
            return v189;
        end, 
        Resume = function(v190, ...) --[[ Line: 394 ]] --[[ Name: Resume ]]
            -- upvalues: l_coroutine_0 (copy)
            if v190 and l_coroutine_0.status(v190) == "suspended" then
                return l_coroutine_0.resume(v190, ...);
            else
                return;
            end;
        end, 
        Remove = function(v191) --[[ Line: 395 ]] --[[ Name: Remove ]]
            -- upvalues: v76 (ref), l_table_0 (copy)
            v76.Threads.Stop(v191);
            for v192, v193 in v76.Threads.Threads do
                if v193 == v191 then
                    l_table_0.remove(v76.Threads.Threads, v192);
                end;
            end;
        end, 
        StopAll = function() --[[ Line: 396 ]] --[[ Name: StopAll ]]
            -- upvalues: v76 (ref), l_table_0 (copy)
            for v194, v195 in v76.Threads.Threads do
                v76.Threads.Stop(v195);
                l_table_0.remove(v76.Threads.Threads, v194);
            end;
        end, 
        ResumeAll = function() --[[ Line: 396 ]] --[[ Name: ResumeAll ]]
            -- upvalues: v76 (ref)
            for _, v197 in v76.Threads.Threads do
                v76.Threads.Resume(v197);
            end;
        end, 
        GetAll = function() --[[ Line: 396 ]] --[[ Name: GetAll ]]
            -- upvalues: v76 (ref)
            return v76.Threads.Threads;
        end
    };
    local v242 = {
        WrapIgnore = function(v199) --[[ Line: 398 ]] --[[ Name: WrapIgnore ]]
            -- upvalues: v0 (ref), l_setmetatable_0 (copy)
            return (l_setmetatable_0(v199, {
                __metatable = v0.Core and v0.Core.DebugMode and "Ignore" or nil
            }));
        end, 
        CheckWrappers = function() --[[ Line: 399 ]] --[[ Name: CheckWrappers ]]
            -- upvalues: v95 (copy), v76 (ref)
            for v200, _ in v95 do
                if v76.IsDestroyed(v200) then
                    v95[v200] = nil;
                end;
            end;
        end, 
        Wrapped = function(v202) --[[ Line: 406 ]] --[[ Name: Wrapped ]]
            -- upvalues: l_getmetatable_0 (copy), l_type_0 (copy), l_rawget_0 (copy), l_typeof_0 (copy)
            if l_type_0((l_getmetatable_0(v202))) == "table" and l_rawget_0(l_getmetatable_0(v202), "__ADONIS_WRAPPED") or l_getmetatable_0(v202) == "Adonis_Proxy" then
                return true;
            elseif (l_type_0(v202) == "table" or l_typeof_0(v202) == "userdata") and v202.IsProxy and v202:IsProxy() then
                return true;
            else
                return false;
            end;
        end, 
        UnWrap = function(v203) --[[ Line: 415 ]] --[[ Name: UnWrap ]]
            -- upvalues: l_typeof_0 (copy), v76 (ref)
            local v204 = l_typeof_0(v203);
            if v204 == "Instance" then
                return v203;
            elseif v204 == "table" then
                local l_UnWrap_1 = v76.UnWrap;
                local v206 = {};
                for v207, v208 in v203 do
                    v206[v207] = l_UnWrap_1(v208);
                end;
                return v206;
            elseif v76.Wrapped(v203) then
                return v203:GetObject();
            else
                return v203;
            end;
        end, 
        Wrap = function(v209, v210) --[[ Line: 433 ]] --[[ Name: Wrap ]]
            -- upvalues: l_getmetatable_0 (copy), v95 (copy), l_type_0 (copy), v76 (ref), l_setmetatable_0 (copy), l_typeof_0 (copy), l_newproxy_0 (copy), l_table_0 (copy), v94 (copy), l_unpack_0 (copy), v8 (ref), l_tostring_0 (copy), v0 (ref)
            v210 = v210 or v210 == nil and client ~= nil;
            if l_getmetatable_0(v209) == "Ignore" or l_getmetatable_0(v209) == "ReadOnly_Table" then
                return v209;
            elseif v95[v209] then
                return v95[v209];
            elseif l_type_0(v209) == "table" then
                local l_Wrap_1 = v76.Wrap;
                local v214 = l_setmetatable_0({}, {
                    __eq = function(_, _) --[[ Line: 442 ]] --[[ Name: __eq ]]
                        -- upvalues: v209 (copy)
                        return v209;
                    end
                });
                for v215, v216 in v209 do
                    v214[v215] = l_Wrap_1(v216, v210);
                end;
                return v214;
            elseif (l_typeof_0(v209) == "Instance" or l_typeof_0(v209) == "RBXScriptSignal" or l_typeof_0(v209) == "RBXScriptConnection") and not v76.Wrapped(v209) then
                local l_UnWrap_2 = v76.UnWrap;
                local l_Wrap_2 = v76.Wrap;
                local v220 = not v210 and function(...) --[[ Line: 459 ]]
                    return ...;
                end or function(v219) --[[ Line: 461 ]]
                    -- upvalues: l_Wrap_2 (copy), v210 (ref)
                    return l_Wrap_2(v219, v210);
                end;
                local v221 = l_newproxy_0(true);
                local v222 = l_getmetatable_0(v221);
                local v223 = nil;
                v223 = {
                    GetMetatable = function() --[[ Line: 469 ]] --[[ Name: GetMetatable ]]
                        -- upvalues: v222 (copy)
                        return v222;
                    end, 
                    AddToCache = function() --[[ Line: 473 ]] --[[ Name: AddToCache ]]
                        -- upvalues: v95 (ref), v209 (copy), v221 (copy)
                        v95[v209] = v221;
                    end, 
                    RemoveFromCache = function() --[[ Line: 476 ]] --[[ Name: RemoveFromCache ]]
                        -- upvalues: v95 (ref), v209 (copy)
                        v95[v209] = nil;
                    end, 
                    GetObject = function() --[[ Line: 480 ]] --[[ Name: GetObject ]]
                        -- upvalues: v209 (copy)
                        return v209;
                    end, 
                    SetSpecial = function(_, v225, v226) --[[ Line: 484 ]] --[[ Name: SetSpecial ]]
                        -- upvalues: v223 (ref)
                        v223[v225] = v226;
                        return v223;
                    end, 
                    Clone = function(_, v228) --[[ Line: 489 ]] --[[ Name: Clone ]]
                        -- upvalues: v209 (copy), l_table_0 (ref), v94 (ref), l_Wrap_2 (copy)
                        local v229 = v209:Clone();
                        if not v228 then
                            l_table_0.insert(v94, v229);
                        end;
                        return l_Wrap_2(v229);
                    end, 
                    IsWrapped = function() --[[ Line: 497 ]] --[[ Name: IsWrapped ]]
                        return true;
                    end, 
                    connect = function(_, v231) --[[ Line: 501 ]] --[[ Name: connect ]]
                        -- upvalues: v220 (copy), v209 (copy), l_table_0 (ref), l_Wrap_2 (copy), l_unpack_0 (ref)
                        return v220(v209:Connect(function(...) --[[ Line: 502 ]]
                            -- upvalues: l_table_0 (ref), v231 (copy), l_Wrap_2 (ref), l_unpack_0 (ref)
                            local v232 = l_table_0.pack(...);
                            return v231(l_unpack_0(l_Wrap_2(v232), 1, v232.n));
                        end));
                    end, 
                    wait = function(_, ...) --[[ Line: 508 ]] --[[ Name: wait ]]
                        -- upvalues: v220 (copy), v209 (copy)
                        return v220(v209.wait)(v209, ...);
                    end
                };
                v223.Connect = v223.connect;
                v223.Wait = v223.wait;
                v222.__index = function(_, v235) --[[ Line: 516 ]]
                    -- upvalues: v223 (ref), v209 (copy), l_type_0 (ref), l_table_0 (ref), v220 (copy), v8 (ref), l_UnWrap_2 (copy), l_unpack_0 (ref)
                    local v236 = v223[v235] or v209[v235];
                    if v223[v235] then
                        return v223[v235];
                    elseif l_type_0(v236) == "function" then
                        return function(_, ...) --[[ Line: 522 ]]
                            -- upvalues: l_table_0 (ref), v220 (ref), v8 (ref), v235 (copy), v209 (ref), l_UnWrap_2 (ref), l_unpack_0 (ref)
                            local v238 = l_table_0.pack(...);
                            return l_unpack_0(v220({
                                v8[v235](v209, l_unpack_0(l_UnWrap_2(v238), 1, v238.n))
                            }));
                        end;
                    else
                        return v220(v236);
                    end;
                end;
                v222.__newindex = function(_, v240, v241) --[[ Line: 533 ]]
                    -- upvalues: v209 (copy), l_UnWrap_2 (copy)
                    v209[v240] = l_UnWrap_2(v241);
                end;
                v222.__eq = v76.RawEqual;
                v222.__tostring = function() --[[ Line: 538 ]]
                    -- upvalues: v223 (ref), v209 (copy), l_tostring_0 (ref)
                    return v223.ToString or l_tostring_0(v209);
                end;
                v222.__metatable = if v0.Core and v0.Core.DebugMode then nil else "Adonis_Proxy";
                v222.__ADONIS_WRAPPED = true;
                v223:AddToCache();
                return v221;
            else
                return v209;
            end;
        end
    };
    local v475 = {
        CloneTable = function(v243) --[[ Line: 552 ]] --[[ Name: CloneTable ]]
            -- upvalues: l_getmetatable_0 (copy), l_setmetatable_0 (copy)
            local v246 = l_getmetatable_0(v243) ~= nil and l_setmetatable_0({}, {
                __index = function(_, v245) --[[ Line: 554 ]] --[[ Name: __index ]]
                    -- upvalues: v243 (copy)
                    return v243[v245];
                end
            }) or {};
            for v247, v248 in v243 do
                v246[v247] = v248;
            end;
            return v246;
        end, 
        DeepCopy = function(v249) --[[ Line: 564 ]] --[[ Name: DeepCopy ]]
            -- upvalues: l_getmetatable_0 (copy), l_setmetatable_0 (copy), l_typeof_0 (copy), v76 (ref)
            local v252 = l_getmetatable_0(v249) ~= nil and l_setmetatable_0({}, {
                __index = function(_, v251) --[[ Line: 566 ]] --[[ Name: __index ]]
                    -- upvalues: v249 (copy)
                    return v249[v251];
                end
            }) or {};
            for v253, v254 in v249 do
                if l_typeof_0(v254) == "table" then
                    v252[v253] = v76.DeepCopy(v254);
                else
                    v252[v253] = v254;
                end;
            end;
            return v252;
        end, 
        IsLocked = function(v255) --[[ Line: 580 ]] --[[ Name: IsLocked ]]
            -- upvalues: l_pcall_0 (copy)
            return not l_pcall_0(function() --[[ Line: 580 ]]
                -- upvalues: v255 (copy)
                v255.Name = v255.Name;
                return v255.Name;
            end);
        end, 
        Timer = function(v256, v257, v258) --[[ Line: 582 ]] --[[ Name: Timer ]]
            -- upvalues: l_time_0 (copy), v76 (ref)
            local v259 = l_time_0();
            local v260 = nil;
            v260 = v76.RunService.RenderStepped:Connect(function() --[[ Line: 584 ]]
                -- upvalues: l_time_0 (ref), v259 (copy), v256 (copy), v258 (copy), v257 (copy), v260 (ref)
                if l_time_0() - v259 > v256 or v258 and v258() then
                    v257();
                    v260:Disconnect();
                end;
            end);
        end, 
        AltUnpack = function(v261, v262) --[[ Line: 592 ]] --[[ Name: AltUnpack ]]
            if v262 then
                v262 = v262 - 1;
            end;
            return v261[1 + (v262 or 0)], v261[2 + (v262 or 0)], v261[3 + (v262 or 0)], v261[4 + (v262 or 0)], v261[5 + (v262 or 0)], v261[6 + (v262 or 0)], v261[7 + (v262 or 0)], v261[8 + (v262 or 0)], v261[9 + (v262 or 0)], v261[10 + (v262 or 0)];
        end, 
        ExtractLines = function(v263) --[[ Line: 597 ]] --[[ Name: ExtractLines ]]
            -- upvalues: l_table_0 (copy), l_string_0 (copy)
            local v264 = l_table_0.create(#v263 + 1);
            local v265 = "";
            for v266 = 1, #v263 + 1 do
                if l_string_0.byte(l_string_0.sub(v263, v266, v266)) == 10 or v266 == #v263 + 1 then
                    l_table_0.insert(v264, v265);
                    v265 = "";
                else
                    local v267 = l_string_0.sub(v263, v266, v266);
                    if l_string_0.byte(v267) < 32 then
                        v267 = "";
                    end;
                    v265 = v265 .. v267;
                end;
            end;
            return v264;
        end, 
        Filter = function(v268, _, _) --[[ Line: 615 ]] --[[ Name: Filter ]]
            if not utf8.len(v268) then
                return "Filter Error";
            else
                return v268;
            end;
        end, 
        LaxFilter = function(v271, v272, v273) --[[ Line: 636 ]] --[[ Name: LaxFilter ]]
            -- upvalues: l_tonumber_0 (copy), l_type_0 (copy), v76 (ref)
            if l_tonumber_0(v271) then
                return v271;
            elseif l_type_0(v271) == "string" then
                if not utf8.len(v271) then
                    return "Filter Error";
                elseif v273 and #v76.GetPlayers(v272, v271, {
                    DontError = true
                }) > 0 then
                    return v271;
                else
                    return v76.Filter(v271, v272, v272);
                end;
            else
                return v271;
            end;
        end, 
        BroadcastFilter = function(v274, v275) --[[ Line: 656 ]] --[[ Name: BroadcastFilter ]]
            -- upvalues: v76 (ref), l_pcall_0 (copy)
            if not utf8.len(v274) then
                return "Filter Error";
            else
                local v276 = "";
                local v277 = v76.ExtractLines(v274);
                for v278 = 1, #v277 do
                    local v279, v280 = l_pcall_0(function() --[[ Line: 664 ]]
                        -- upvalues: v76 (ref), v277 (copy), v278 (copy), v275 (copy)
                        return v76.TextService:FilterStringAsync(v277[v278], v275.UserId):GetNonChatStringForBroadcastAsync();
                    end);
                    v280 = v279 and v280 or v277[v278] or "";
                    if v278 > 1 then
                        v276 = ("%*\n%*"):format(v276, v280);
                    else
                        v276 = v280;
                    end;
                end;
                return v276 or "Filter Error";
            end;
        end, 
        RecursiveMtSearch = function(v281) --[[ Line: 675 ]] --[[ Name: RecursiveMtSearch ]]
            -- upvalues: l_typeof_0 (copy), l_getmetatable_0 (copy), v76 (ref)
            for _, v283 in v281 do
                if (l_typeof_0(v283) == "table" or l_typeof_0(v283) == "userdata") and (l_getmetatable_0(v283) ~= nil or v76.RecursiveMtSearch(v283)) then
                    return true;
                end;
            end;
            return false;
        end, 
        MetaFunc = function(v284, v285, v286) --[[ Line: 686 ]] --[[ Name: MetaFunc ]]
            -- upvalues: v76 (ref), l_pcall_0 (copy), l_warn_0 (copy), l_unpack_0 (copy)
            return v76.NewProxy({
                __call = function(_, ...) --[[ Line: 688 ]] --[[ Name: __call ]]
                    -- upvalues: v285 (copy), l_pcall_0 (ref), v76 (ref), v286 (copy), v284 (copy), l_warn_0 (ref), l_unpack_0 (ref)
                    if v285 then
                        local v290, v291 = l_pcall_0(function(...) --[[ Line: 690 ]]
                            -- upvalues: v76 (ref), v286 (ref)
                            if v76.RecursiveMtSearch({
                                ...
                            }) then
                                return false;
                            else
                                if v286 then
                                    for v288, v289 in {
                                        ...
                                    } do
                                        if v286[v288] and not v286[v288](v289) then
                                            return false;
                                        end;
                                    end;
                                end;
                                return true;
                            end;
                        end, ...);
                        if not v290 or v291 == false then
                            return nil;
                        end;
                    end;
                    local v292 = {
                        l_pcall_0(v284, ...)
                    };
                    if not v292[1] then
                        l_warn_0(v292[2]);
                        return;
                    else
                        return l_unpack_0(v292, 2);
                    end;
                end
            });
        end, 
        NewProxy = function(v293) --[[ Line: 720 ]] --[[ Name: NewProxy ]]
            -- upvalues: l_newproxy_0 (copy), l_getmetatable_0 (copy), v0 (ref)
            local v294 = l_newproxy_0(true);
            local v295 = l_getmetatable_0(v294);
            v295.__metatable = if v0.Core and v0.Core.DebugMode then nil else "Adonis_Proxy";
            v295.__ADONIS_WRAPPED = true;
            for v296, v297 in v293 do
                v295[v296] = v297;
            end;
            return v294;
        end, 
        GetUserType = function(v298) --[[ Line: 729 ]] --[[ Name: GetUserType ]]
            -- upvalues: l_pcall_0 (copy), l_math_0 (copy), l_string_0 (copy)
            local v300, v301 = l_pcall_0(function() --[[ Line: 730 ]]
                -- upvalues: v298 (copy), l_math_0 (ref)
                local _ = v298[l_math_0.random()];
            end);
            if v300 then
                return "Unknown";
            else
                return l_string_0.match(v301, "%S+$");
            end;
        end, 
        CountTable = function(v302) --[[ Line: 738 ]] --[[ Name: CountTable ]]
            local v303 = 0;
            for _ in v302 do
                v303 = v303 + 1;
            end;
            return v303;
        end, 
        Debounce = function(v305, v306) --[[ Line: 744 ]] --[[ Name: Debounce ]]
            -- upvalues: l_getfenv_0 (copy), v86 (copy), l_pcall_0 (copy), l_error_0 (copy)
            local v307 = l_getfenv_0(2);
            local v308 = v307 and v307._ADONIS_DEBOUNCES or v86 or {};
            if v307 then
                v307._ADONIS_DEBOUNCES = v307 and v307._ADONIS_DEBOUNCES or {};
            end;
            if v308[v305] then
                return false;
            else
                v308[v305] = true;
                local v309, v310 = l_pcall_0(v306);
                v308[v305] = false;
                if not v309 then
                    l_error_0(v310);
                end;
                return;
            end;
        end, 
        Queue = function(v311, v312, v313, v314) --[[ Line: 764 ]] --[[ Name: Queue ]]
            -- upvalues: v87 (copy), l_os_0 (copy), v76 (ref), l_table_0 (copy), l_select_0 (copy)
            if not v87[v311] then
                v87[v311] = {
                    Processing = false, 
                    Functions = {}
                };
            end;
            local v315 = v87[v311];
            local v316 = {
                Time = l_os_0.time(), 
                Running = false, 
                Function = v312, 
                Timeout = v313, 
                Finished = false, 
                Yield = v314 and v76.Yield()
            };
            l_table_0.insert(v315.Functions, v316);
            if not v315.Processing then
                v76.TrackTask(("Thread: QueueProcessor_%*"):format(v311), v76.ProcessQueue, false, v315, v311);
            end;
            if v314 and not v316.Finished then
                return l_select_0(2, v316.Yield:Wait());
            else
                return;
            end;
        end, 
        ProcessQueue = function(v317, v318) --[[ Line: 794 ]] --[[ Name: ProcessQueue ]]
            -- upvalues: v76 (ref), l_table_0 (copy), l_delay_0 (copy), l_warn_0 (copy), l_xpcall_0 (copy), v87 (copy)
            if v317 then
                if v317.Processing then
                    return "Processing";
                else
                    local l_Functions_0 = v317.Functions;
                    local v320 = v76.Yield();
                    local function v322() --[[ Line: 801 ]] --[[ Name: pop ]]
                        -- upvalues: l_Functions_0 (copy), l_table_0 (ref)
                        local v321 = l_Functions_0[1];
                        l_table_0.remove(l_Functions_0, 1);
                        return v321;
                    end;
                    v317.Processing = true;
                    while l_Functions_0[1] ~= nil do
                        local v323 = v322();
                        v323.Running = true;
                        if v323.Timeout then
                            l_delay_0(v323.Timeout, function() --[[ Line: 814 ]]
                                -- upvalues: v323 (copy), v320 (copy), l_warn_0 (ref), v318 (copy)
                                if not v323.Finished then
                                    v320:Release();
                                    l_warn_0((("Queue Timeout Reached for %*"):format(v318 or "Unknown")));
                                    if v323.Yield then
                                        v323.Yield:Release(false, "Timeout Reached");
                                    end;
                                end;
                            end);
                        end;
                        v76.TrackTask(("Thread: %*_QueuedFunction"):format(v318 or "Unknown"), function() --[[ Line: 826 ]]
                            -- upvalues: l_xpcall_0 (ref), v323 (copy), l_warn_0 (ref), v318 (copy), v320 (copy)
                            local v325, v326 = l_xpcall_0(v323.Function, function(v324) --[[ Line: 827 ]]
                                -- upvalues: v323 (ref), l_warn_0 (ref), v318 (ref)
                                v323.Error = v324;
                                l_warn_0((("Queue Error: %*: %* \n %*"):format(v318, v324, (debug.traceback()))));
                            end);
                            v323.Running = false;
                            v323.Finished = true;
                            if v323.Yield then
                                v323.Yield:Release(v325, v326);
                            end;
                            v320:Release();
                        end, false);
                        if v323.Running then
                            v320:Wait();
                        end;
                    end;
                    v320:Destroy();
                    v317.Processing = false;
                    if v318 then
                        v87[v318] = nil;
                    end;
                end;
            end;
        end, 
        ProcessLoopQueue = function() --[[ Line: 857 ]] --[[ Name: ProcessLoopQueue ]]
            -- upvalues: v89 (copy), l_time_0 (copy)
            for v327, v328 in v89 do
                if not v328.LastRun or v328.LastRun and l_time_0() - v328.LastRun > v328.Delay then
                    if v328.MaxRuns and v328.NumRuns and v328.MaxRuns <= v328.NumRuns then
                        v89[v327] = nil;
                    else
                        if v328.MaxRuns and v328.NumRuns then
                            v328.NumRuns = v328.NumRuns + 1;
                        end;
                        Pcall(v328.Function);
                        v328.LastRun = l_time_0();
                    end;
                end;
            end;
        end, 
        QueueItem = function(v329, v330) --[[ Line: 873 ]] --[[ Name: QueueItem ]]
            -- upvalues: v89 (copy)
            if v330.MaxRuns then
                v330.NumRuns = 0;
            end;
            v89[v329] = v330;
        end, 
        RemoveQueue = function(v331) --[[ Line: 881 ]] --[[ Name: RemoveQueue ]]
            -- upvalues: v89 (copy)
            v89[v331] = nil;
        end, 
        New = function(v332, v333, v334, v335) --[[ Line: 885 ]] --[[ Name: New ]]
            -- upvalues: l_new_0 (copy), v104 (copy), l_type_0 (copy), v76 (ref), l_table_0 (copy), v94 (copy)
            local v336 = v334 and l_new_0(v332) or v104.new(v332);
            if v333 then
                if l_type_0(v333) == "table" then
                    local l_Parent_0 = v333.Parent;
                    if v76.Wrapped(l_Parent_0) then
                        l_Parent_0 = l_Parent_0:GetObject();
                    end;
                    v333.Parent = nil;
                    for v338, v339 in v333 do
                        v336[v338] = v339;
                    end;
                    if l_Parent_0 then
                        v336.Parent = l_Parent_0;
                    end;
                elseif l_type_0(v333) == "userdata" then
                    if v76.Wrapped(v333) then
                        v336.Parent = v333:GetObject();
                    else
                        v336.Parent = v333;
                    end;
                end;
            end;
            if v336 and not v335 then
                l_table_0.insert(v94, v336);
            end;
            return v336;
        end, 
        Iterate = function(v340, v341) --[[ Line: 916 ]] --[[ Name: Iterate ]]
            -- upvalues: l_type_0 (copy), l_ipairs_0 (copy), l_error_0 (copy)
            if v340 and l_type_0(v340) == "table" then
                for v342, v343 in v340 do
                    local v344 = v341(v342, v343);
                    if v344 ~= nil then
                        return v344;
                    end;
                end;
                return;
            elseif v340 and l_type_0(v340) == "userdata" then
                for v345, v346 in l_ipairs_0(v340:GetChildren()) do
                    local v347 = v341(v346, v345);
                    if v347 ~= nil then
                        return v347;
                    end;
                end;
                return;
            else
                l_error_0("Invalid table");
                return;
            end;
        end, 
        EscapeControlCharacters = function(v348) --[[ Line: 936 ]] --[[ Name: EscapeControlCharacters ]]
            -- upvalues: l_string_0 (copy)
            return l_string_0.gsub(v348, "%c", {
                ["\a"] = "\\a", 
                ["\b"] = "\\b", 
                ["\f"] = "\\f", 
                ["\n"] = "\\n", 
                ["\r"] = "\\r", 
                ["\t"] = "\\t", 
                ["\v"] = "\\v"
            });
        end, 
        UnsanitizeXML = function(v349) --[[ Line: 948 ]] --[[ Name: UnsanitizeXML ]]
            -- upvalues: l_string_0 (copy)
            return l_string_0.gsub(v349, "&%w+;", {
                ["&apos;"] = "'", 
                ["&quot;"] = "\"", 
                ["&lt;"] = "<", 
                ["&gt;"] = ">", 
                ["&amp;"] = "&"
            });
        end, 
        SanitizeXML = function(v350) --[[ Line: 958 ]] --[[ Name: SanitizeXML ]]
            -- upvalues: l_string_0 (copy)
            return l_string_0.gsub(v350, "['\"<>&]", {
                ["'"] = "&apos;", 
                ["\""] = "&quot;", 
                ["<"] = "&lt;", 
                [">"] = "&gt;", 
                ["&"] = "&amp;"
            });
        end, 
        SanitizePattern = function(v351) --[[ Line: 968 ]] --[[ Name: SanitizePattern ]]
            -- upvalues: l_string_0 (copy)
            return l_string_0.gsub(v351, "([%^%$%(%)%%%.%[%]%*%+%-%?])", "%%%1");
        end, 
        GetCurrentLocale = function() --[[ Line: 972 ]] --[[ Name: GetCurrentLocale ]]
            -- upvalues: v76 (ref), v81 (ref)
            if v76.RunService:IsClient() then
                local l_RobloxLocaleId_0 = v76.LocalizationService.RobloxLocaleId;
                local l_SystemLocaleId_0 = v76.LocalizationService.SystemLocaleId;
                return v81 or l_RobloxLocaleId_0 ~= "en-us" and l_RobloxLocaleId_0 ~= "en" and l_RobloxLocaleId_0 or l_SystemLocaleId_0 ~= "" and l_SystemLocaleId_0 or "en-us";
            else
                return "en-us";
            end;
        end, 
        GetTime = l_os_0.time, 
        FormatTime = function(v354, v355) --[[ Line: 982 ]] --[[ Name: FormatTime ]]
            -- upvalues: v76 (ref), l_pcall_0 (copy)
            v355 = if v355 == true then {
                WithDate = true
            } else v355 or {};
            local v356 = v355.FormatString or v355.WithWrittenDate and "LL HH:mm:ss" or v355.WithDate and "L HH:mm:ss" or "HH:mm:ss";
            local v357 = DateTime.fromUnixTimestamp(v354 or v76.GetTime());
            local v358, v359 = l_pcall_0(v357.FormatLocalTime, v357, v356, v76.GetCurrentLocale());
            if v358 then
                return v359;
            else
                return (v357:ToIsoDate());
            end;
        end, 
        FormatPlayer = function(v360, v361) --[[ Line: 995 ]] --[[ Name: FormatPlayer ]]
            -- upvalues: l_string_0 (copy)
            if not v360 then
                return "%UNKNOWN%";
            elseif v360.Name == "[Unknown User]" then
                return (("[Unknown User%*]"):format(if v360.UserId and v360.UserId ~= -1 then (" %*"):format(v360.UserId) else ""));
            else
                local v362 = if v360.DisplayName == v360.Name then ("@%*"):format(v360.Name) else l_string_0.format("%s (@%s)", v360.DisplayName or "???", v360.Name or "???");
                if v361 then
                    v362 = v362 .. l_string_0.format(" [%s]", if v360.UserId and v360.UserId ~= -1 then v360.UserId else "?");
                end;
                return v362;
            end;
        end, 
        FormatNumber = function(v363, v364, v365) --[[ Line: 1007 ]] --[[ Name: FormatNumber ]]
            -- upvalues: l_tonumber_0 (copy), l_math_0 (copy), l_tostring_0 (copy), l_unpack_0 (copy), l_string_0 (copy), v76 (ref)
            v363 = l_tonumber_0(v363);
            v365 = v365 or ",";
            if not v363 then
                return "NaN";
            elseif l_math_0.abs(v363) >= 1.0E150 then
                return "Inf";
            else
                local v366, v367 = l_unpack_0(l_tostring_0(l_math_0.abs(v363)):split("."));
                if v364 and l_math_0.abs(v363) >= 1000 then
                    local v368 = {
                        "K", 
                        "M", 
                        "B", 
                        "T", 
                        "Qd", 
                        "Qi"
                    };
                    local v369 = l_math_0.floor((#v366 - 1) / 3);
                    local v370 = v368[v369];
                    if v370 then
                        return l_tonumber_0(l_string_0.format("%.2f", v363 / 10 ^ (3 * v369))) .. v370;
                    else
                        return v76.FormatNumber(v363 / 10 ^ (#v368 * 3), false, v365) .. v368[#v368];
                    end;
                else
                    v366 = v366:reverse();
                    local v371 = "";
                    local v372 = 1;
                    for v373 = 1, #v366 do
                        if v372 > 3 then
                            v371 = v371 .. v365;
                            v372 = 1;
                        end;
                        v371 = v371 .. v366:sub(v373, v373);
                        v372 = v372 + 1;
                    end;
                    return (("%*%*%*"):format(v363 < 0 and "-" or "", v371:reverse(), if v367 then (".%*"):format(v367) else ""));
                end;
            end;
        end, 
        OwnsAsset = function(...) --[[ Line: 1043 ]] --[[ Name: OwnsAsset ]]
            -- upvalues: v76 (ref)
            return v76.CheckAssetOwnership(...);
        end, 
        GetProductInfo = function(v374, v375) --[[ Line: 1047 ]] --[[ Name: GetProductInfo ]]
            -- upvalues: l_tonumber_0 (copy), l_Enum_0 (copy), v79 (copy), l_os_0 (copy), l_pcall_0 (copy), v76 (ref), l_type_0 (copy)
            v374 = l_tonumber_0(v374) or 0;
            v375 = v375 or l_Enum_0.InfoType.Asset;
            if v374 > 0 then
                local v376 = v79[("%*-%*"):format(v374, v375)];
                if not v376 then
                    v376 = {
                        results = {
                            Created = false
                        }, 
                        lastUpdated = l_os_0.clock()
                    };
                    v79[("%*-%*"):format(v374, v375)] = v376;
                end;
                if not v376.lastUpdated or l_os_0.clock() - v376.lastUpdated > 120 then
                    local v377, v378 = l_pcall_0(v76.MarketplaceService.GetProductInfo, v76.MarketplaceService, v374, v375);
                    if v377 and l_type_0(v378) == "table" then
                        v378.Created = true;
                        v376.results = v378;
                    else
                        v376.results.Created = false;
                    end;
                end;
                return v76.CloneTable(v376.results);
            else
                return;
            end;
        end, 
        CheckPassOwnership = function(v379, v380) --[[ Line: 1081 ]] --[[ Name: CheckPassOwnership ]]
            -- upvalues: l_type_0 (copy), l_tonumber_0 (copy), v77 (copy), l_os_0 (copy), l_pcall_0 (copy), v76 (ref), v83 (copy)
            v379 = if l_type_0(v379) == "userdata" then v379.UserId else l_tonumber_0(v379);
            v380 = l_tonumber_0(v380);
            local v381 = ("%*-%*"):format(v379, v380);
            local v382 = v77[v381];
            if v382 and v382.owned then
                return true;
            elseif v382 and l_os_0.time() - v382.lastUpdated > 60 or not v382 then
                local v383 = {
                    owned = v382 and v382.owned or false, 
                    lastUpdated = l_os_0.time()
                };
                v77[v381] = v383;
                local v384, v385 = l_pcall_0(function() --[[ Line: 1097 ]]
                    -- upvalues: v76 (ref), v379 (ref), v380 (ref)
                    return v76.MarketplaceService:UserOwnsGamePassAsync(v379, v380);
                end);
                if v384 then
                    v383.owned = v83(v385);
                    return v83(v385);
                else
                    return v383.owned;
                end;
            elseif v382 then
                return v382.owned;
            else
                return;
            end;
        end, 
        CheckAssetOwnership = function(v386, v387) --[[ Line: 1112 ]] --[[ Name: CheckAssetOwnership ]]
            -- upvalues: l_type_0 (copy), v76 (ref), v78 (copy), l_os_0 (copy), v77 (copy), l_pcall_0 (copy), v83 (copy)
            if l_type_0(v386) == "number" then
                v386 = v76.Players:GetPlayerByUserId(v386);
            end;
            local v388 = ("%*-%*"):format(v386.UserId, v387);
            local v389 = v78[v388];
            if v389 and v389.owned then
                return true;
            elseif v389 and l_os_0.time() - v389.lastUpdated > 60 or not v389 then
                local v390 = {
                    owned = v389 and v389.owned or false, 
                    lastUpdated = l_os_0.time()
                };
                v77[v388] = v390;
                local v391, v392 = l_pcall_0(function() --[[ Line: 1129 ]]
                    -- upvalues: v76 (ref), v386 (ref), v387 (copy)
                    return v76.MarketplaceService:PlayerOwnsAsset(v386, v387);
                end);
                if v391 then
                    v390.owned = v83(v392);
                end;
                return v390.owned;
            elseif v389 then
                return v389.owned;
            else
                return;
            end;
        end, 
        GetGroupInfo = function(v393) --[[ Line: 1143 ]] --[[ Name: GetGroupInfo ]]
            -- upvalues: l_tonumber_0 (copy), v80 (copy), l_os_0 (copy), l_pcall_0 (copy), v76 (ref), l_type_0 (copy)
            v393 = l_tonumber_0(v393) or 0;
            if v393 > 0 then
                local v394 = v80[v393];
                if not v394 or l_os_0.time() - v394.lastUpdated > 120 then
                    v394 = {
                        results = v394 and v394.results or {}, 
                        lastUpdated = l_os_0.time()
                    };
                    v80[v393] = v394;
                    local v395, v396 = l_pcall_0(v76.GroupService.GetGroupInfoAsync, v76.GroupService, v393);
                    if v395 and l_type_0(v396) == "table" then
                        v394.results = v396;
                    else
                        v394.results.Failed = true;
                    end;
                end;
                return v76.CloneTable(v394.results);
            else
                return;
            end;
        end, 
        GetGroupCreatorId = function(v397) --[[ Line: 1170 ]] --[[ Name: GetGroupCreatorId ]]
            -- upvalues: l_tonumber_0 (copy), v76 (ref)
            v397 = l_tonumber_0(v397) or 0;
            if v397 > 0 then
                local v398 = v76.GetGroupInfo(v397);
                if v398 and v398.Owner then
                    return v398.Owner.Id;
                end;
            end;
            return 0;
        end, 
        MaxLen = function(v399, v400) --[[ Line: 1184 ]] --[[ Name: MaxLen ]]
            -- upvalues: l_string_0 (copy)
            if v400 < l_string_0.len(v399) then
                return (("%*..."):format((l_string_0.sub(v399, 1, v400))));
            else
                return v399;
            end;
        end, 
        Yield = function() --[[ Line: 1192 ]] --[[ Name: Yield ]]
            -- upvalues: v76 (ref)
            local v401 = v76.New("BindableEvent");
            return {
                Release = function(...) --[[ Line: 1195 ]] --[[ Name: Release ]]
                    -- upvalues: v401 (copy)
                    v401:Fire(...);
                end, 
                Wait = function(...) --[[ Line: 1196 ]] --[[ Name: Wait ]]
                    -- upvalues: v401 (copy)
                    return v401.Event:Wait(...);
                end, 
                Destroy = function() --[[ Line: 1197 ]] --[[ Name: Destroy ]]
                    -- upvalues: v401 (copy)
                    v401:Destroy();
                end, 
                Event = v401
            };
        end, 
        StartLoop = function(v402, v403, v404, v405) --[[ Line: 1202 ]] --[[ Name: StartLoop ]]
            -- upvalues: l_game_0 (copy), v91 (copy), l_tonumber_0 (copy), l_wait_0 (copy), v76 (ref)
            local v406 = {
                Name = v402, 
                Delay = v403, 
                Function = v404, 
                Running = true
            };
            local v407 = ("%* - %*"):format(v402, (l_game_0:GetService("HttpService"):GenerateGUID(false)));
            local function v408() --[[ Line: 1212 ]] --[[ Name: kill ]]
                -- upvalues: v406 (copy), v91 (ref), v407 (copy)
                v406.Running = true;
                if v91[v407] == v406 then
                    v91[v407] = nil;
                end;
            end;
            local function v409() --[[ Line: 1219 ]] --[[ Name: loop ]]
                -- upvalues: v403 (copy), l_tonumber_0 (ref), v404 (copy), l_wait_0 (ref), v91 (ref), v407 (copy), v406 (copy), v408 (copy), v76 (ref)
                if l_tonumber_0(v403) then
                    repeat
                        v404();
                        l_wait_0((l_tonumber_0(v403)));
                    until v91[v407] ~= v406 or not v406.Running;
                    v408();
                    return;
                elseif v403 == "Heartbeat" then
                    repeat
                        v404();
                        v76.RunService.Heartbeat:wait();
                    until v91[v407] ~= v406 or not v406.Running;
                    v408();
                    return;
                elseif v403 == "RenderStepped" then
                    repeat
                        v404();
                        v76.RunService.RenderStepped:wait();
                    until v91[v407] ~= v406 or not v406.Running;
                    v408();
                    return;
                elseif v403 == "Stepped" then
                    repeat
                        v404();
                        v76.RunService.Stepped:wait();
                    until v91[v407] ~= v406 or not v406.Running;
                    v408();
                    return;
                else
                    v406.Running = false;
                    return;
                end;
            end;
            v406.Kill = v408;
            v91[v407] = v406;
            if v405 then
                v76.TrackTask(("Thread: Loop: %*"):format(v402), v409, false);
                return v406;
            else
                v76.TrackTask(("Loop: %*"):format(v402), v409, false);
                return v406;
            end;
        end, 
        StopLoop = function(v410) --[[ Line: 1274 ]] --[[ Name: StopLoop ]]
            -- upvalues: v91 (copy)
            for _, v412 in v91 do
                if v410 == v412.Function or v410 == v412.Name then
                    v412.Running = false;
                end;
            end;
        end, 
        IsLooped = function(v413) --[[ Line: 1281 ]] --[[ Name: IsLooped ]]
            -- upvalues: v91 (copy)
            for _, v415 in v91 do
                if v413 == v415.Function or v413 == v415.Name then
                    return v415.Running;
                end;
            end;
            return false;
        end, 
        Immutable = function(...) --[[ Line: 1289 ]] --[[ Name: Immutable ]]
            -- upvalues: l_coroutine_0 (copy)
            local v416 = l_coroutine_0.wrap(function(...) --[[ Line: 1290 ]]
                -- upvalues: l_coroutine_0 (ref)
                while true do
                    l_coroutine_0.yield(...);
                end;
            end);
            v416(...);
            return v416;
        end, 
        ReadOnly = function(v417, v418, v419, v420) --[[ Line: 1294 ]] --[[ Name: ReadOnly ]]
            -- upvalues: v76 (ref), v0 (ref), l_getfenv_0 (copy), l_getmetatable_0 (copy), l_pcall_0 (copy), l_coroutine_0 (copy), l_type_0 (copy), l_typeof_0 (copy), v1 (ref), l_warn_0 (copy), l_rawset_0 (copy)
            local v421 = not v420 and v76.RunService:IsClient();
            if v0.Core and v0.Core.DebugMode then
                v421 = false;
            end;
            local v422 = v421 and v76.Players.LocalPlayer;
            if v422 then
                local _ = v422.Kick;
            end;
            local l_settings_0 = l_getfenv_0().settings;
            local l_l_getmetatable_0_0 = l_getmetatable_0;
            local l_l_getfenv_0_0 = l_getfenv_0;
            local l_l_pcall_0_0 = l_pcall_0;
            local _ = l_coroutine_0.resume;
            local _ = l_coroutine_0.create;
            local v430 = v421 and l_l_getmetatable_0_0(l_l_getfenv_0_0());
            if v421 then
                local _ = {
                    secret500 = true, 
                    getrawmetatable = true, 
                    setreadonly = true, 
                    full_access = true, 
                    elysianexecute = true, 
                    decompile = true, 
                    make_writable = true, 
                    hookmetamethod = true, 
                    hookfunction = true
                };
            end;
            return v76.NewProxy({
                __index = function(_, v433) --[[ Line: 1316 ]] --[[ Name: __index ]]
                    -- upvalues: l_type_0 (ref), l_typeof_0 (ref), v421 (ref), l_l_getfenv_0_0 (copy), l_pcall_0 (ref), l_settings_0 (copy), l_getfenv_0 (ref), l_l_getmetatable_0_0 (copy), l_getmetatable_0 (ref), l_l_pcall_0_0 (copy), v430 (copy), v1 (ref), v417 (copy), v418 (copy), v76 (ref), v419 (copy), v420 (copy)
                    local v434 = l_type_0(v433) ~= "table" and l_typeof_0(v433) ~= "userdata" and v433 or "Potentially dangerous index";
                    local v435 = v421 and l_l_getfenv_0_0 and l_l_getfenv_0_0(2);
                    local v436 = v421 and l_pcall_0(l_settings_0);
                    if v421 and (v436 or l_l_getfenv_0_0 ~= l_getfenv_0 or l_l_getmetatable_0_0 ~= l_getmetatable_0 or l_l_pcall_0_0 ~= l_pcall_0 or not v435 or l_type_0(v435) ~= "table" or l_l_getmetatable_0_0(v435) ~= v430) then
                        v1("ReadError", "Tampering with Client [read rt0001]", (("[%* %* %*]\n%*"):format(v434, v435, v435 and l_l_getmetatable_0_0(v435), (debug.traceback()))));
                        return;
                    elseif v417[v434] ~= nil and l_type_0(v417[v434]) == "table" and (not v418 or not v418[v434] and not v418[v417[v434]]) then
                        return v76.ReadOnly(v417[v434], v418, v419, v420);
                    else
                        return v417[v434];
                    end;
                end, 
                __newindex = function(_, v438, v439) --[[ Line: 1332 ]] --[[ Name: __newindex ]]
                    -- upvalues: l_type_0 (ref), l_typeof_0 (ref), v421 (ref), l_l_getfenv_0_0 (copy), l_pcall_0 (ref), l_settings_0 (copy), l_getfenv_0 (ref), l_l_getmetatable_0_0 (copy), l_getmetatable_0 (ref), l_l_pcall_0_0 (copy), v430 (copy), v1 (ref), v418 (copy), v417 (copy), v419 (copy), l_warn_0 (ref), l_rawset_0 (ref)
                    local v440 = l_type_0(v438) ~= "table" and l_typeof_0(v438) ~= "userdata" and v438 or "Potentially dangerous index";
                    local v441 = v421 and l_l_getfenv_0_0 and l_l_getfenv_0_0(2);
                    local v442 = v421 and l_pcall_0(l_settings_0);
                    if v421 and (v442 or l_l_getfenv_0_0 ~= l_getfenv_0 or l_l_getmetatable_0_0 ~= l_getmetatable_0 or l_l_pcall_0_0 ~= l_pcall_0 or not v441 or l_type_0(v441) ~= "table" or l_l_getmetatable_0_0(v441) ~= v430) then
                        v1("ReadError", "Tampering with Client [write wt0003]", (("[%* %* %*]\n%*"):format(v440, v441, v441 and l_l_getmetatable_0_0(v441), (debug.traceback()))));
                        return;
                    elseif not v418 or not v418[v440] and not v418[v417[v440]] then
                        if v419 then
                            v1("ReadError", "Tampering with Client [write wt0005]", (("[%* %* %*]\n%*"):format(v440, v441, v441 and l_l_getmetatable_0_0(v441), (debug.traceback()))));
                        end;
                        l_warn_0((("Something attempted to set index %* in a read-only table."):format(v440)));
                        return;
                    else
                        l_rawset_0(v417, v440, v439);
                        return;
                    end;
                end, 
                __metatable = if v0.Core and v0.Core.DebugMode then v430 else "ReadOnly_Table"
            });
        end, 
        Wait = function(v443) --[[ Line: 1355 ]] --[[ Name: Wait ]]
            -- upvalues: v76 (ref), l_tonumber_0 (copy), l_wait_0 (copy)
            if not v443 or v443 == "Stepped" then
                v76.RunService.Stepped:wait();
                return;
            elseif v443 == "Heartbeat" then
                v76.RunService.Heartbeat:wait();
                return;
            else
                if v443 and l_tonumber_0(v443) then
                    l_wait_0((l_tonumber_0(v443)));
                end;
                return;
            end;
        end, 
        OrigRawEqual = l_rawequal_0, 
        HasItem = function(v444, v445) --[[ Line: 1365 ]] --[[ Name: HasItem ]]
            -- upvalues: l_pcall_0 (copy)
            return l_pcall_0(function() --[[ Line: 1365 ]]
                -- upvalues: v444 (copy), v445 (copy)
                return v444[v445];
            end);
        end, 
        IsDestroyed = function(v446) --[[ Line: 1366 ]] --[[ Name: IsDestroyed ]]
            -- upvalues: l_type_0 (copy), v76 (ref), l_pcall_0 (copy), l_game_0 (copy), l_string_0 (copy)
            if l_type_0(v446) == "userdata" and v76.HasItem(v446, "Parent") and v446.Parent == nil then
                local v447, v448 = l_pcall_0(function() --[[ Line: 1369 ]]
                    -- upvalues: v446 (copy), l_game_0 (ref)
                    v446.Parent = l_game_0;
                    v446.Parent = nil;
                end);
                if not v447 then
                    if v448 and l_string_0.match(v448, "^The Parent property of (.*) is locked, current parent: NULL,") then
                        return true;
                    else
                        return false;
                    end;
                end;
            end;
            return false;
        end, 
        OutfitCache = {}, 
        UnallowedCache = {}, 
        Insert = function(v449, v450) --[[ Line: 1383 ]] --[[ Name: Insert ]]
            -- upvalues: v76 (ref)
            if v76.UnallowedCache and v76.UnallowedCache[v449] then
                return;
            else
                local v451 = v76.InsertService:LoadAsset(v449);
                if not v450 and v451:IsA("Model") and v451.Name == "Model" then
                    local v452 = v451:GetChildren()[1];
                    v452.Parent = v451.Parent;
                    v451:Destroy();
                    return v452;
                else
                    return v451;
                end;
            end;
        end, 
        SecureAccessory = function(v453, v454) --[[ Line: 1394 ]] --[[ Name: SecureAccessory ]]
            -- upvalues: v76 (ref), l_tonumber_0 (copy), l_error_0 (copy), l_pcall_0 (copy)
            if not v453.Character then
                return;
            else
                local function v455() --[[ Line: 1397 ]] --[[ Name: reject ]]
                    -- upvalues: v76 (ref), v454 (copy), l_tonumber_0 (ref), l_error_0 (ref)
                    v76.UnallowedCache[l_tonumber_0(v454)] = true;
                    l_error_0("Item not supported");
                end;
                local v456, v457 = l_pcall_0(function() --[[ Line: 1402 ]]
                    -- upvalues: v76 (ref), v454 (copy), l_tonumber_0 (ref)
                    return v76.Insert((l_tonumber_0(v454)));
                end);
                if not v456 then
                    return v455();
                elseif not v457 then
                    return v455();
                elseif not v457:IsA("Accoutrement") then
                    return v455();
                elseif not v457:FindFirstChild("Handle") then
                    return v455();
                elseif #v457:GetDescendants() > 250 then
                    return v455();
                else
                    v457.Name = "CustomAdonisAccessory";
                    v457:SetAttribute("AssetId", v454);
                    local v458 = {
                        "Accoutrement", 
                        "BasePart", 
                        "SpecialMesh", 
                        "Attachment", 
                        "Weld", 
                        "WeldConstraint", 
                        "Motor6D", 
                        "Folder", 
                        "ValueBase", 
                        "ParticleEmitter", 
                        "Sparkles", 
                        "Fire"
                    };
                    local v459 = {
                        "LuaSourceContainer", 
                        "Model", 
                        "Tool", 
                        "Hopperbin"
                    };
                    for _, v461 in v457:GetDescendants() do
                        if v461:IsA("BasePart") then
                            v461.CanCollide = false;
                        end;
                    end;
                    for _, v463 in v457:GetDescendants() do
                        local v464 = false;
                        for _, v466 in v459 do
                            if v463:IsA(v466) then
                                v464 = true;
                                break;
                            end;
                        end;
                        if v464 then
                            return v455();
                        end;
                    end;
                    for _, v468 in v457:GetDescendants() do
                        local v469 = false;
                        for _, v471 in v458 do
                            if v468:IsA(v471) then
                                v469 = true;
                                break;
                            end;
                        end;
                        if not v469 then
                            v468:Destroy();
                        end;
                    end;
                    v453.Character.Humanoid:AddAccessory(v457);
                    return;
                end;
            end;
        end, 
        GetPlayers = function() --[[ Line: 1451 ]] --[[ Name: GetPlayers ]]
            -- upvalues: v76 (ref)
            return v76.Players:GetPlayers();
        end, 
        IsAdonisObject = function(v472) --[[ Line: 1452 ]] --[[ Name: IsAdonisObject ]]
            -- upvalues: v94 (copy)
            for _, v474 in v94 do
                if v474 == v472 then
                    return true;
                end;
            end;
        end, 
        GetAdonisObjects = function() --[[ Line: 1453 ]] --[[ Name: GetAdonisObjects ]]
            -- upvalues: v94 (copy)
            return v94;
        end
    };
    v76 = l_setmetatable_0({
        Variables = function() --[[ Line: 1457 ]] --[[ Name: Variables ]]
            -- upvalues: v93 (copy)
            return v93;
        end, 
        Routine = l_Routine_0, 
        Running = true, 
        Pcall = Pcall, 
        Threads = v198, 
        DataModel = l_game_0, 
        WrapService = v97, 
        EventService = v100, 
        ThreadService = v98, 
        HelperService = v99, 
        MarketPlace = l_game_0:GetService("MarketplaceService"), 
        GamepassService = l_game_0:GetService("GamePassService"), 
        ChatService = l_game_0:GetService("Chat"), 
        Gamepasses = l_game_0:GetService("GamePassService"), 
        Delete = function(v476, v477) --[[ Line: 1471 ]] --[[ Name: Delete ]]
            -- upvalues: l_game_0 (copy), l_pcall_0 (copy)
            l_game_0:GetService("Debris"):AddItem(v476, v477 or 0);
            l_pcall_0(v476.Destroy, v476);
        end, 
        RbxEvent = function(v478, v479) --[[ Line: 1472 ]] --[[ Name: RbxEvent ]]
            -- upvalues: l_table_0 (copy), v88 (copy)
            local v480 = v478:Connect(v479);
            l_table_0.insert(v88, v480);
            return v480;
        end, 
        SelfEvent = function(v481, v482) --[[ Line: 1473 ]] --[[ Name: SelfEvent ]]
            -- upvalues: v76 (ref)
            local _ = v76.RbxEvent(v481, function(...) --[[ Line: 1473 ]]
                -- upvalues: v482 (copy)
                v482(...);
            end);
        end, 
        DelRbxEvent = function(v484) --[[ Line: 1474 ]] --[[ Name: DelRbxEvent ]]
            -- upvalues: v88 (copy), l_table_0 (copy)
            for v485, v486 in v88 do
                if v486 == v484 then
                    v486:Disconnect();
                    l_table_0.remove(v88, v485);
                end;
            end;
        end, 
        SanitizeString = function(v487) --[[ Line: 1475 ]] --[[ Name: SanitizeString ]]
            -- upvalues: v76 (ref), l_string_0 (copy)
            v487 = v76.Trim(v487);
            local v488 = "";
            for v489 = 1, #v487 do
                if l_string_0.sub(v487, v489, v489) ~= "\n" and l_string_0.sub(v487, v489, v489) ~= "\000" then
                    v488 = v488 .. l_string_0.sub(v487, v489, v489);
                end;
            end;
            return v488;
        end, 
        Trim = function(v490) --[[ Line: 1476 ]] --[[ Name: Trim ]]
            -- upvalues: l_string_0 (copy)
            return l_string_0.match(v490, "^%s*(.-)%s*$");
        end, 
        Localize = function(v491, v492) --[[ Line: 1477 ]] --[[ Name: Localize ]]
            -- upvalues: v76 (ref), l_type_0 (copy)
            local l_Localize_0 = v76.Localize;
            local l_ReadOnly_0 = v76.ReadOnly;
            if l_type_0(v491) == "table" then
                local v495 = {};
                for v496 in v491 do
                    v495[v496] = l_Localize_0(v491[v496], v492);
                end;
                return v492 and l_ReadOnly_0(v495) or v495;
            else
                return v491;
            end;
        end, 
        RawEqual = function(v497, v498) --[[ Line: 1478 ]] --[[ Name: RawEqual ]]
            -- upvalues: v76 (ref)
            return v76.UnWrap(v497) == v76.UnWrap(v498);
        end, 
        CheckProperty = function(v499, v500) --[[ Line: 1479 ]] --[[ Name: CheckProperty ]]
            -- upvalues: l_pcall_0 (copy)
            return l_pcall_0(function() --[[ Line: 1479 ]]
                -- upvalues: v499 (copy), v500 (copy)
                return v499[v500];
            end);
        end, 
        NewWaiter = function() --[[ Line: 1480 ]] --[[ Name: NewWaiter ]]
            -- upvalues: v76 (ref)
            local v501 = v76.New("BindableEvent");
            return {
                Wait = v501.wait, 
                Finish = v501.Fire
            };
        end
    }, {
        __index = function(_, v503) --[[ Line: 1482 ]] --[[ Name: __index ]]
            -- upvalues: v11 (copy), v242 (copy), v147 (copy), v475 (copy), l_pcall_0 (copy), l_game_0 (copy), v76 (ref)
            local v504 = v11 and v11[v503] or v242[v503] or v147[v503] or v475[v503];
            if v504 then
                return v504;
            else
                local v506, v507 = l_pcall_0(function() --[[ Line: 1488 ]]
                    -- upvalues: l_game_0 (ref), v503 (copy), v76 (ref)
                    local l_l_game_0_Service_0 = l_game_0:GetService(v503);
                    return client ~= nil and v76.Wrap(l_l_game_0_Service_0, true) or l_l_game_0_Service_0;
                end);
                if v506 and v507 then
                    v76[v503] = v507;
                    return v507;
                else
                    return;
                end;
            end;
        end, 
        __tostring = "Service", 
        __metatable = if v0.Core and v0.Core.DebugMode then nil else "Service"
    });
    v97 = v242.Wrap(v97);
    v99 = v242.Wrap(v99);
    v98 = v242.Wrap(v98);
    v100 = v242.Wrap(v100);
    v76.WrapService = v97;
    v76.HelperService = v99;
    v76.ThreadService = v98;
    v76.EventService = v100;
    v76.GoodSignal = l_require_0(l_script_0.Parent.Shared.GoodSignal);
    if client ~= nil then
        for v508, v509 in v76 do
            if l_type_0(v509) == "userdata" then
                v76[v508] = v76.Wrap(v509, true);
            end;
        end;
    end;
    for v510, v511 in v242 do
        if l_type_0(v511) == "function" then
            v97:SetSpecial(v510, function(_, ...) --[[ Line: 1524 ]]
                -- upvalues: v511 (copy)
                return v511(...);
            end);
        else
            v97:SetSpecial(v510, v511);
        end;
    end;
    for v513, v514 in v475 do
        if l_type_0(v514) == "function" then
            v99:SetSpecial(v513, function(_, ...) --[[ Line: 1532 ]]
                -- upvalues: v514 (copy)
                return v514(...);
            end);
        else
            v99:SetSpecial(v513, v514);
        end;
    end;
    for v516, v517 in v198 do
        if l_type_0(v517) == "function" then
            v98:SetSpecial(v516, function(_, ...) --[[ Line: 1540 ]]
                -- upvalues: v517 (copy)
                return v517(...);
            end);
        else
            v98:SetSpecial(v516, v517);
        end;
    end;
    for v519, v520 in v147 do
        if l_type_0(v520) == "function" then
            v100:SetSpecial(v519, function(_, ...) --[[ Line: 1548 ]]
                -- upvalues: v520 (copy)
                return v520(...);
            end);
        else
            v100:SetSpecial(v519, v520);
        end;
    end;
    for v522, v523 in {
        WrapService = v97, 
        EventService = v100, 
        ThreadService = v98, 
        HelperService = v99
    } do
        v523:SetSpecial("ClassName", v522);
        v523:SetSpecial("ToString", v522);
        v523:SetSpecial("IsA", function(_, v525) --[[ Line: 1557 ]]
            -- upvalues: v522 (copy)
            return v525 == v522;
        end);
    end;
    if v76.RunService:IsClient() then
        l_task_0.spawn(l_xpcall_0, function() --[[ Line: 1561 ]]
            -- upvalues: v76 (ref), v81 (ref)
            local l_TranslatorForPlayerAsync_0 = v76.LocalizationService:GetTranslatorForPlayerAsync(v76.Players.LocalPlayer);
            l_TranslatorForPlayerAsync_0:GetPropertyChangedSignal("LocaleId"):Connect(function() --[[ Line: 1564 ]]
                -- upvalues: v81 (ref), l_TranslatorForPlayerAsync_0 (copy)
                v81 = l_TranslatorForPlayerAsync_0.LocaleId;
            end);
        end, l_warn_0);
    end;
    return v76;
end;