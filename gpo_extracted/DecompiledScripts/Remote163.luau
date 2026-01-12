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
    local _ = _G;
    local _ = game;
    local _ = script;
    local l_getfenv_0 = getfenv;
    local _ = setfenv;
    local _ = workspace;
    local _ = getmetatable;
    local _ = setmetatable;
    local _ = loadstring;
    local _ = coroutine;
    local _ = rawequal;
    local _ = typeof;
    local l_print_0 = print;
    local l_math_0 = math;
    local l_warn_0 = warn;
    local l_error_0 = error;
    local l_pcall_0 = pcall;
    local _ = xpcall;
    local l_select_0 = select;
    local _ = rawset;
    local _ = rawget;
    local _ = ipairs;
    local _ = pairs;
    local _ = next;
    local _ = Rect;
    local _ = Axes;
    local l_os_0 = os;
    local l_time_0 = time;
    local _ = Faces;
    local l_unpack_0 = unpack;
    local l_string_0 = string;
    local l_Color3_0 = Color3;
    local _ = newproxy;
    local l_tostring_0 = tostring;
    local _ = tonumber;
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
    local _ = require;
    local l_table_0 = table;
    local l_type_0 = type;
    local _ = wait;
    local l_Enum_0 = Enum;
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
    local function v71() --[[ Line: 40 ]] --[[ Name: Init ]]
        -- upvalues: v69 (ref), l_Client_0 (copy), v64 (ref), v65 (ref), v70 (ref), v66 (ref), v67 (ref), v68 (ref)
        v69 = l_Client_0.UI;
        v64 = l_Client_0.Anti;
        v65 = l_Client_0.Core;
        v70 = l_Client_0.Variables;
        v66 = l_Client_0.Functions;
        v67 = l_Client_0.Process;
        v68 = l_Client_0.Remote;
        v68.Init = nil;
    end;
    local function v73() --[[ Line: 52 ]] --[[ Name: RunAfterLoaded ]]
        -- upvalues: l_Client_0 (copy), l_Service_0 (copy), v68 (ref), l_warn_0 (copy)
        log("~! Fire client loaded");
        l_Client_0.Remote.Send("ClientLoaded");
        log("~! Start ClientCheck loop");
        task.delay(5, function() --[[ Line: 59 ]]
            -- upvalues: l_Service_0 (ref), v68 (ref)
            l_Service_0.StartLoop("ClientCheck", 30, v68.CheckClient, true);
        end);
        log("Get settings");
        local v72 = l_Client_0.Remote.Get("Setting", {
            "G_API", 
            "Allowed_API_Calls", 
            "HelpButtonImage"
        });
        if v72 then
            l_Client_0.G_API = v72.G_API;
            l_Client_0.Allowed_API_Calls = v72.Allowed_API_Calls;
            l_Client_0.HelpButtonImage = v72.HelpButtonImage;
        else
            log("~! GET SETTINGS FAILED?");
            l_warn_0("FAILED TO GET SETTINGS FROM SERVER");
        end;
        v68.RunAfterLoaded = nil;
    end;
    local function v74() --[[ Line: 79 ]] --[[ Name: RunLast ]]
        -- upvalues: v68 (ref)
        v68.RunLast = nil;
    end;
    l_getfenv_0().client = nil;
    l_getfenv_0().service = nil;
    l_getfenv_0().script = nil;
    l_Client_0.Remote = {
        Init = v71, 
        RunLast = v74, 
        RunAfterLoaded = v73, 
        Returns = {}, 
        PendingReturns = {}, 
        EncodeCache = {}, 
        DecodeCache = {}, 
        Received = 0, 
        Sent = 0, 
        CheckClient = function() --[[ Line: 129 ]] --[[ Name: CheckClient ]]
            -- upvalues: l_os_0 (copy), v65 (ref), v68 (ref), l_Client_0 (copy)
            if l_os_0.time() - v65.LastUpdate >= 10 then
                v68.Send("ClientCheck", {
                    Sent = v68.Sent or 0, 
                    Received = v68.Received
                }, l_Client_0.DepsName);
            end;
        end, 
        Returnables = {
            Test = function(v75) --[[ Line: 139 ]] --[[ Name: Test ]]
                -- upvalues: l_unpack_0 (copy)
                return "HELLO FROM THE CLIENT SIDE :)! ", l_unpack_0(v75);
            end, 
            Ping = function(_) --[[ Line: 143 ]] --[[ Name: Ping ]]
                -- upvalues: v68 (ref)
                return v68.Ping();
            end, 
            ClientHooked = function(_) --[[ Line: 147 ]] --[[ Name: ClientHooked ]]
                -- upvalues: v65 (ref)
                return v65.Special;
            end, 
            TaskManager = function(v78) --[[ Line: 151 ]] --[[ Name: TaskManager ]]
                -- upvalues: l_Service_0 (copy), l_os_0 (copy), l_tostring_0 (copy), l_table_0 (copy)
                if v78[1] == "GetTasks" then
                    local v79 = {};
                    for _, v81 in l_Service_0.GetTasks() do
                        local v82 = {
                            Status = v81.Status, 
                            Name = v81.Name, 
                            Index = v81.Index, 
                            Created = v81.Created, 
                            CurrentTime = l_os_0.time(), 
                            Function = l_tostring_0(v81.Function)
                        };
                        l_table_0.insert(v79, v82);
                    end;
                    return v79;
                else
                    return;
                end;
            end, 
            LoadCode = function(v83) --[[ Line: 169 ]] --[[ Name: LoadCode ]]
                -- upvalues: v65 (ref), v1 (copy)
                local v84 = v83[1];
                local v85 = v65.LoadCode(v84, v1());
                if v85 then
                    return v85();
                else
                    return;
                end;
            end, 
            Function = function(v86) --[[ Line: 177 ]] --[[ Name: Function ]]
                -- upvalues: l_Client_0 (copy), l_type_0 (copy), l_unpack_0 (copy)
                local v87 = l_Client_0.Functions[v86[1]];
                if v87 and l_type_0(v87) == "function" then
                    return v87(l_unpack_0(v86, 2));
                else
                    return;
                end;
            end, 
            Handler = function(v88) --[[ Line: 184 ]] --[[ Name: Handler ]]
                -- upvalues: l_Client_0 (copy), l_type_0 (copy), l_unpack_0 (copy)
                local v89 = l_Client_0.Handlers[v88[1]];
                if v89 and l_type_0(v89) == "function" then
                    return v89(l_unpack_0(v88, 2));
                else
                    return;
                end;
            end, 
            UIKeepAlive = function(_) --[[ Line: 191 ]] --[[ Name: UIKeepAlive ]]
                -- upvalues: v70 (ref), l_Client_0 (copy), l_Service_0 (copy), v69 (ref)
                if v70.UIKeepAlive then
                    for _, v92 in l_Client_0.GUIs do
                        if v92.KeepAlive then
                            if v92.Class == "ScreenGui" or v92.Class == "GuiMain" then
                                v92.Object.Parent = l_Service_0.Player.PlayerGui;
                            elseif v92.Class == "TextLabel" then
                                v92.Object.Parent = v69.GetHolder();
                            end;
                            v92.KeepAlive = false;
                        end;
                    end;
                end;
                return true;
            end, 
            UI = function(v93) --[[ Line: 209 ]] --[[ Name: UI ]]
                -- upvalues: v70 (ref), v69 (ref)
                local v94 = v93[1];
                local v95 = v93[2];
                local v96 = v93[3];
                v70.LastServerTheme = v95 or v70.LastServerTheme;
                return v69.Make(v94, v96, v95);
            end, 
            InstanceList = function(_) --[[ Line: 218 ]] --[[ Name: InstanceList ]]
                -- upvalues: l_Service_0 (copy), l_table_0 (copy)
                local v98 = l_Service_0.GetAdonisObjects();
                local v99 = {};
                for _, v101 in v98 do
                    l_table_0.insert(v99, {
                        Text = v101:GetFullName(), 
                        Desc = v101.ClassName
                    });
                end;
                return v99;
            end, 
            ClientLog = function(_) --[[ Line: 230 ]] --[[ Name: ClientLog ]]
                -- upvalues: l_Enum_0 (copy), l_Color3_0 (copy), l_Service_0 (copy), l_table_0 (copy)
                local v103 = {
                    [l_Enum_0.MessageType.MessageWarning] = l_Color3_0.fromRGB(222, 146, 55), 
                    [l_Enum_0.MessageType.MessageError] = l_Color3_0.fromRGB(219, 75, 75), 
                    [l_Enum_0.MessageType.MessageInfo] = l_Color3_0.fromRGB(137, 221, 255)
                };
                local v104 = {};
                local l_LogHistory_0 = l_Service_0.LogService:GetLogHistory();
                for v106 = #l_LogHistory_0, 1, -1 do
                    local v107 = l_LogHistory_0[v106];
                    for v108, v109 in l_Service_0.ExtractLines(v107.message) do
                        l_table_0.insert(v104, {
                            Text = v109, 
                            Time = if v108 == 1 then v107.timestamp else nil, 
                            Desc = v107.messageType.Name:match("^Message(.+)$"), 
                            Color = v103[v107.messageType]
                        });
                    end;
                end;
                return v104;
            end, 
            LocallyFormattedTime = function(v110) --[[ Line: 252 ]] --[[ Name: LocallyFormattedTime ]]
                -- upvalues: l_type_0 (copy), l_Service_0 (copy), l_select_0 (copy), l_unpack_0 (copy)
                if l_type_0(v110[1]) == "table" then
                    local v111 = {};
                    for v112, v113 in v110[1] do
                        v111[v112] = l_Service_0.FormatTime(v113, l_select_0(2, l_unpack_0(v110)));
                    end;
                    return v111;
                else
                    return l_Service_0.FormatTime(l_unpack_0(v110));
                end;
            end
        }, 
        Commands = {
            GetReturn = function(v114) --[[ Line: 265 ]] --[[ Name: GetReturn ]]
                -- upvalues: l_print_0 (copy), l_unpack_0 (copy), v68 (ref), l_pcall_0 (copy)
                l_print_0("THE SERVER IS ASKING US FOR A RETURN");
                local v115 = v114[1];
                local v116 = v114[2];
                local v117 = {
                    l_unpack_0(v114, 3)
                };
                local v118 = v68.Returnables[v115];
                local v119 = v118 and {
                    l_pcall_0(v118, v117)
                } or {};
                if v119[1] ~= true then
                    logError(v119[2]);
                    v68.Send("GiveReturn", v116, "__ADONIS_RETURN_ERROR", v119[2]);
                    return;
                else
                    l_print_0("SENT RETURN");
                    v68.Send("GiveReturn", v116, l_unpack_0(v119, 2));
                    return;
                end;
            end, 
            GiveReturn = function(v120) --[[ Line: 281 ]] --[[ Name: GiveReturn ]]
                -- upvalues: l_print_0 (copy), v68 (ref), l_Service_0 (copy), l_unpack_0 (copy)
                l_print_0("SERVER GAVE US A RETURN");
                if v68.PendingReturns[v120[1]] then
                    l_print_0("VALID PENDING RETURN");
                    v68.PendingReturns[v120[1]] = nil;
                    l_Service_0.Events[v120[1]]:Fire(l_unpack_0(v120, 2));
                end;
            end, 
            SessionData = function(v121) --[[ Line: 290 ]] --[[ Name: SessionData ]]
                -- upvalues: l_Service_0 (copy), l_table_0 (copy)
                local v122 = v121[1];
                if v122 then
                    l_Service_0.Events.SessionData:Fire(v122, l_table_0.unpack(v121, 2));
                end;
            end, 
            SetVariables = function(v123) --[[ Line: 297 ]] --[[ Name: SetVariables ]]
                -- upvalues: v70 (ref)
                for v124, v125 in v123[1] do
                    v70[v124] = v125;
                end;
            end, 
            Print = function(v126) --[[ Line: 304 ]] --[[ Name: Print ]]
                -- upvalues: l_print_0 (copy), l_unpack_0 (copy)
                l_print_0(l_unpack_0(v126));
            end, 
            FireEvent = function(v127) --[[ Line: 308 ]] --[[ Name: FireEvent ]]
                -- upvalues: l_Service_0 (copy), l_unpack_0 (copy)
                l_Service_0.FireEvent(l_unpack_0(v127));
            end, 
            Test = function(v128) --[[ Line: 312 ]] --[[ Name: Test ]]
                -- upvalues: l_print_0 (copy)
                l_print_0((("OK WE GOT COMMUNICATION!  ORGL: %*"):format(v128[1])));
            end, 
            TestError = function(_) --[[ Line: 316 ]] --[[ Name: TestError ]]
                -- upvalues: l_error_0 (copy)
                l_error_0("THIS IS A TEST ERROR");
            end, 
            TestEvent = function(v130) --[[ Line: 320 ]] --[[ Name: TestEvent ]]
                -- upvalues: v68 (ref), l_unpack_0 (copy)
                v68.PlayerEvent(v130[1], l_unpack_0(v130, 2));
            end, 
            LoadCode = function(v131) --[[ Line: 324 ]] --[[ Name: LoadCode ]]
                -- upvalues: v65 (ref), v1 (copy)
                local v132 = v131[1];
                local v133 = v65.LoadCode(v132, v1());
                if v133 then
                    return v133();
                else
                    return;
                end;
            end, 
            LaunchAnti = function(v134) --[[ Line: 332 ]] --[[ Name: LaunchAnti ]]
                -- upvalues: v64 (ref)
                v64.Launch(v134[1], v134[2]);
            end, 
            UI = function(v135) --[[ Line: 336 ]] --[[ Name: UI ]]
                -- upvalues: v70 (ref), v69 (ref)
                local v136 = v135[1];
                local v137 = v135[2];
                local v138 = v135[3];
                v70.LastServerTheme = v137 or v70.LastServerTheme;
                v69.Make(v136, v138, v137);
            end, 
            RemoveUI = function(v139) --[[ Line: 345 ]] --[[ Name: RemoveUI ]]
                -- upvalues: v69 (ref)
                v69.Remove(v139[1], v139[2]);
            end, 
            RefreshUI = function(v140) --[[ Line: 349 ]] --[[ Name: RefreshUI ]]
                -- upvalues: v69 (ref), v70 (ref)
                local v141 = v140[1];
                local v142 = v140[2];
                v69.Remove(v141, v142);
                local v143 = v140[3];
                local v144 = v140[4];
                v70.LastServerTheme = v143 or v70.LastServerTheme;
                v69.Make(v141, v144, v143);
            end, 
            StartLoop = function(v145) --[[ Line: 362 ]] --[[ Name: StartLoop ]]
                -- upvalues: v65 (ref), v1 (copy), l_Service_0 (copy)
                local v146 = v145[1];
                local v147 = v145[2];
                local v148 = v145[3];
                local v149 = v65.LoadCode(v148, v1());
                if v146 and v147 and v148 and v149 then
                    l_Service_0.StartLoop(v146, v147, v149);
                end;
            end, 
            StopLoop = function(v150) --[[ Line: 372 ]] --[[ Name: StopLoop ]]
                -- upvalues: l_Service_0 (copy)
                l_Service_0.StopLoop(v150[1]);
            end, 
            Function = function(v151) --[[ Line: 376 ]] --[[ Name: Function ]]
                -- upvalues: l_Client_0 (copy), l_type_0 (copy), l_unpack_0 (copy)
                local v152 = l_Client_0.Functions[v151[1]];
                if v152 and l_type_0(v152) == "function" then
                    Pcall(v152, l_unpack_0(v151, 2));
                end;
            end, 
            Handler = function(v153) --[[ Line: 383 ]] --[[ Name: Handler ]]
                -- upvalues: l_Client_0 (copy), l_type_0 (copy), l_unpack_0 (copy)
                local v154 = l_Client_0.Handlers[v153[1]];
                if v154 and l_type_0(v154) == "function" then
                    Pcall(v154, l_unpack_0(v153, 2));
                end;
            end
        }, 
        Fire = function(...) --[[ Line: 391 ]] --[[ Name: Fire ]]
            -- upvalues: v67 (ref), v65 (ref), l_Service_0 (copy), v68 (ref), l_Client_0 (copy), l_unpack_0 (copy)
            local l_RateLimits_0 = v67.RateLimits;
            local v156 = l_RateLimits_0 and l_RateLimits_0.Remote or 0.01;
            local l_RemoteEvent_0 = v65.RemoteEvent;
            local v158 = {
                ...
            };
            if l_RemoteEvent_0 and l_RemoteEvent_0.Object then
                l_Service_0.Queue("REMOTE_SEND", function() --[[ Line: 398 ]]
                    -- upvalues: v68 (ref), l_RemoteEvent_0 (copy), l_Client_0 (ref), v158 (copy), l_unpack_0 (ref), v156 (copy)
                    v68.Sent = v68.Sent + 1;
                    l_RemoteEvent_0.Object:FireServer({
                        Mode = "Fire", 
                        Module = l_Client_0.Module, 
                        Loader = l_Client_0.Loader, 
                        Sent = v68.Sent, 
                        Received = v68.Received
                    }, l_unpack_0(v158));
                    task.wait(v156);
                end);
            end;
        end, 
        Send = function(v159, ...) --[[ Line: 406 ]] --[[ Name: Send ]]
            -- upvalues: v65 (ref), l_os_0 (copy), v68 (ref)
            v65.LastUpdate = l_os_0.time();
            v68.Fire(v68.Encrypt(v159, v65.Key), ...);
        end, 
        GetFire = function(...) --[[ Line: 411 ]] --[[ Name: GetFire ]]
            -- upvalues: v65 (ref), v67 (ref), l_Service_0 (copy), v68 (ref), l_Client_0 (copy), l_unpack_0 (copy)
            local l_RemoteEvent_1 = v65.RemoteEvent;
            local l_RateLimits_1 = v67.RateLimits;
            local v162 = l_RateLimits_1 and l_RateLimits_1.Remote or 0.02;
            local v163 = {
                ...
            };
            local v164 = nil;
            if l_RemoteEvent_1 and l_RemoteEvent_1.Function then
                local v165 = l_Service_0.Yield();
                l_Service_0.Queue("REMOTE_SEND", function() --[[ Line: 421 ]]
                    -- upvalues: v68 (ref), v164 (ref), l_RemoteEvent_1 (copy), l_Client_0 (ref), v163 (copy), l_unpack_0 (ref), v165 (copy), v162 (copy)
                    v68.Sent = v68.Sent + 1;
                    task.delay(0, function() --[[ Line: 423 ]]
                        -- upvalues: v164 (ref), l_RemoteEvent_1 (ref), l_Client_0 (ref), v68 (ref), v163 (ref), l_unpack_0 (ref), v165 (ref)
                        v164 = {
                            l_RemoteEvent_1.Function:InvokeServer({
                                Mode = "Get", 
                                Module = l_Client_0.Module, 
                                Loader = l_Client_0.Loader, 
                                Sent = v68.Sent, 
                                Received = v68.Received
                            }, l_unpack_0(v163))
                        };
                        v165:Release(v164);
                    end);
                    task.wait(v162);
                end);
                if not v164 then
                    v165:Wait();
                end;
                v165:Destroy();
                if v164 then
                    return l_unpack_0(v164);
                end;
            end;
        end, 
        RawGet = function(...) --[[ Line: 452 ]] --[[ Name: RawGet ]]
            -- upvalues: v65 (ref), v68 (ref), l_Client_0 (copy), l_unpack_0 (copy)
            local v166 = {
                ...
            };
            local l_RemoteEvent_2 = v65.RemoteEvent;
            if l_RemoteEvent_2 and l_RemoteEvent_2.Function then
                v68.Sent = v68.Sent + 1;
                return l_RemoteEvent_2.Function:InvokeServer({
                    Mode = "Get", 
                    Module = l_Client_0.Module, 
                    Loader = l_Client_0.Loader, 
                    Sent = v68.Sent, 
                    Received = v68.Received
                }, l_unpack_0(v166));
            else
                return;
            end;
        end, 
        Get = function(v168, ...) --[[ Line: 461 ]] --[[ Name: Get ]]
            -- upvalues: v65 (ref), l_os_0 (copy), v68 (ref), l_type_0 (copy), l_unpack_0 (copy)
            v65.LastUpdate = l_os_0.time();
            local v169 = v68.GetFire(v68.Encrypt(v168, v65.Key), ...);
            if l_type_0(v169) == "table" then
                return l_unpack_0(v169);
            else
                return v169;
            end;
        end, 
        OldGet = function(v170, ...) --[[ Line: 471 ]] --[[ Name: OldGet ]]
            -- upvalues: l_Service_0 (copy), l_print_0 (copy), v68 (ref), l_string_0 (copy), l_tostring_0 (copy), l_error_0 (copy), l_unpack_0 (copy)
            local v171 = nil;
            local v172 = l_Service_0.HttpService:GenerateGUID(false);
            local v173 = l_Service_0.New("BindableEvent");
            local v174 = l_Service_0.Events[v172]:Connect(function(...) --[[ Line: 475 ]]
                -- upvalues: l_print_0 (ref), v171 (ref), v173 (copy)
                l_print_0("WE ARE GETTING A RETURN!");
                v171 = {
                    ...
                };
                v173:Fire();
                task.wait();
                v173:Fire();
                v173:Destroy();
            end);
            v68.PendingReturns[v172] = true;
            v68.Send("GetReturn", v170, v172, ...);
            l_print_0(l_string_0.format("GETTING RETURNS? %s", (l_tostring_0(v171))));
            v173.Event:Wait();
            l_print_0(l_string_0.format("WE GOT IT! %s", (l_tostring_0(v171))));
            v174:Disconnect();
            if v171 then
                if v171[1] == "__ADONIS_RETURN_ERROR" then
                    l_error_0(v171[2]);
                    return;
                else
                    return l_unpack_0(v171);
                end;
            else
                return nil;
            end;
        end, 
        Ping = function() --[[ Line: 497 ]] --[[ Name: Ping ]]
            -- upvalues: l_time_0 (copy), v68 (ref), l_math_0 (copy)
            local v175 = l_time_0();
            if not v68.Get("Ping") then
                return false;
            else
                local v176 = l_time_0();
                return l_math_0.floor((v176 - v175) * 1000 + 0.5) / 1000 * 1000;
            end;
        end, 
        PlayerEvent = function(v177, ...) --[[ Line: 507 ]] --[[ Name: PlayerEvent ]]
            -- upvalues: v68 (ref)
            v68.Send("PlayerEvent", v177, ...);
        end, 
        Encrypt = function(v178, v179, v180) --[[ Line: 511 ]] --[[ Name: Encrypt ]]
            -- upvalues: v68 (ref), l_string_0 (copy), l_table_0 (copy)
            v180 = v180 or v68.EncodeCache or {};
            if not v179 or not v178 then
                return v178;
            elseif v180[v179] and v180[v179][v178] then
                return v180[v179][v178];
            else
                local l_byte_0 = l_string_0.byte;
                local l_sub_0 = l_string_0.sub;
                local l_char_0 = l_string_0.char;
                local v184 = v180[v179] or {};
                local v185 = {};
                for v186 = 1, #v178 do
                    local v187 = v186 % #v179 + 1;
                    v185[v186] = l_char_0((l_byte_0(l_sub_0(v178, v186, v186)) + l_byte_0(l_sub_0(v179, v187, v187))) % 126 + 1);
                end;
                v185 = l_table_0.concat(v185);
                v180[v179] = v184;
                v184[v178] = v185;
                return v185;
            end;
        end, 
        Decrypt = function(v188, v189, v190) --[[ Line: 538 ]] --[[ Name: Decrypt ]]
            -- upvalues: v68 (ref), l_string_0 (copy), l_table_0 (copy)
            v190 = v190 or v68.DecodeCache or {};
            if not v189 or not v188 then
                return v188;
            elseif v190[v189] and v190[v189][v188] then
                return v190[v189][v188];
            else
                local v191 = v190[v189] or {};
                local l_byte_1 = l_string_0.byte;
                local l_sub_1 = l_string_0.sub;
                local l_char_1 = l_string_0.char;
                local v195 = {};
                for v196 = 1, #v188 do
                    local v197 = v196 % #v189 + 1;
                    v195[v196] = l_char_1((l_byte_1(l_sub_1(v188, v196, v196)) - l_byte_1(l_sub_1(v189, v197, v197))) % 126 - 1);
                end;
                v195 = l_table_0.concat(v195);
                v190[v189] = v191;
                v191[v188] = v195;
                return v195;
            end;
        end
    };
end;