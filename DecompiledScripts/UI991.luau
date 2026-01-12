client = nil;
service = nil;
Pcall = nil;
Routine = nil;
GetEnv = nil;
origEnv = nil;
logError = nil;
return function(v0, v1) --[[ Line: 10 ]]
    local v2 = v1(nil, {
        script = script
    });
    setfenv(1, v2);
    local _ = _G;
    local _ = game;
    local _ = script;
    local l_getfenv_0 = getfenv;
    local l_setfenv_0 = setfenv;
    local _ = workspace;
    local _ = getmetatable;
    local _ = setmetatable;
    local _ = loadstring;
    local _ = coroutine;
    local l_rawequal_0 = rawequal;
    local _ = typeof;
    local l_print_0 = print;
    local _ = math;
    local l_warn_0 = warn;
    local _ = error;
    local l_pcall_0 = pcall;
    local _ = xpcall;
    local _ = select;
    local _ = rawset;
    local _ = rawget;
    local _ = ipairs;
    local _ = pairs;
    local _ = next;
    local _ = Rect;
    local _ = Axes;
    local _ = os;
    local _ = time;
    local _ = Faces;
    local l_unpack_0 = unpack;
    local l_string_0 = string;
    local _ = Color3;
    local _ = newproxy;
    local l_tostring_0 = tostring;
    local _ = tonumber;
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
    local _ = wait;
    local _ = Enum;
    local _ = UDim;
    local l_UDim2_0 = UDim2;
    local _ = Vector2;
    local _ = Vector3;
    local _ = Region3;
    local _ = CFrame;
    local _ = Ray;
    local _ = delay;
    local l_UIFolder_0 = client.UIFolder;
    local l_Service_0 = v0.Service;
    local l_Client_0 = v0.Client;
    local l_GetEnv_0 = v2.GetEnv;
    local v66 = nil;
    local v67 = nil;
    local v68 = nil;
    local v69 = nil;
    local v70 = nil;
    local v71 = nil;
    local v72 = nil;
    local v73 = nil;
    local v74 = nil;
    local v75 = nil;
    local function v76() --[[ Line: 46 ]] --[[ Name: Init ]]
        -- upvalues: v71 (ref), l_Client_0 (copy), v66 (ref), v67 (ref), v72 (ref), v68 (ref), v69 (ref), v70 (ref), v73 (ref), v74 (ref), l_Service_0 (copy), v75 (ref)
        v71 = l_Client_0.UI;
        v66 = l_Client_0.Anti;
        v67 = l_Client_0.Core;
        v72 = l_Client_0.Variables;
        v68 = l_Client_0.Functions;
        v69 = l_Client_0.Process;
        v70 = l_Client_0.Remote;
        v73 = l_Client_0.Deps;
        v74 = l_Service_0.CloneTable;
        v75 = l_Service_0.TrackTask;
        v71.Init = nil;
    end;
    local function v77() --[[ Line: 62 ]] --[[ Name: RunLast ]]
        -- upvalues: v71 (ref), v70 (ref)
        v71.DefaultTheme = v70.Get("Setting", "DefaultTheme");
        v71.RunLast = nil;
    end;
    l_getfenv_0().client = nil;
    l_getfenv_0().service = nil;
    l_getfenv_0().script = nil;
    l_Client_0.UI = {
        Init = v76, 
        RunLast = v77, 
        GetHolder = function() --[[ Line: 104 ]] --[[ Name: GetHolder ]]
            -- upvalues: v71 (ref), l_Service_0 (copy), l_pcall_0 (copy)
            if v71.Holder and v71.Holder.Parent == l_Service_0.PlayerGui then
                return v71.Holder;
            else
                l_pcall_0(function() --[[ Line: 108 ]]
                    -- upvalues: v71 (ref)
                    if v71.Holder then
                        v71.Holder:Destroy();
                    end;
                end);
                v71.Holder = l_Service_0.New("ScreenGui", {
                    Name = l_Service_0.HttpService:GenerateGUID(false), 
                    Parent = l_Service_0.PlayerGui
                });
                return v71.Holder;
            end;
        end, 
        Prepare = function(v78) --[[ Line: 118 ]] --[[ Name: Prepare ]]
            -- upvalues: v71 (ref), l_Instance_0 (copy), l_UDim2_0 (copy)
            return v78;
        end, 
        LoadModule = function(v79, v80, v81) --[[ Line: 146 ]] --[[ Name: LoadModule ]]
            -- upvalues: l_pcall_0 (copy), l_require_0 (copy), l_GetEnv_0 (copy), v74 (ref), l_Client_0 (copy), l_Service_0 (copy), l_type_0 (copy), v75 (ref), l_setfenv_0 (copy), l_unpack_0 (copy), l_warn_0 (copy), l_tostring_0 (copy)
            v80 = v80 or {};
            local v82, v83 = l_pcall_0(l_require_0, v79);
            local v84 = l_GetEnv_0(v81, {
                script = v79, 
                client = v74(l_Client_0), 
                service = v74(l_Service_0)
            });
            if v84.service.Threads then
                v84.service.Threads = v74(l_Service_0.Threads);
            end;
            for v85, v86 in v84.client do
                if l_type_0(v86) == "table" and v85 ~= "Variables" and v85 ~= "Handlers" then
                    v84.client[v85] = v74(v86);
                end;
            end;
            if v82 then
                local v87 = {
                    v75(("UI: %*"):format((v79:GetFullName())), l_setfenv_0(v83, v84), false, v80, v84)
                };
                if v87[1] then
                    return l_unpack_0(v87, 2);
                else
                    l_warn_0("Error while running module", v79.Name, v87[2]);
                    l_Client_0.LogError((("Error loading %* - %*"):format(v79.Name, v87[2])));
                    return;
                end;
            else
                l_warn_0("Error while loading module", v79.Name, (l_tostring_0(v83)));
                return;
            end;
        end, 
        GetNew = function(v88, v89) --[[ Line: 195 ]] --[[ Name: GetNew ]]
            -- upvalues: l_Instance_0 (copy), l_UIFolder_0 (copy), l_table_0 (copy), v71 (ref), l_string_0 (copy), l_warn_0 (copy)
            local v90 = {};
            local v91 = {};
            local _ = {};
            local v93 = l_Instance_0.new("Folder");
            local v94 = false;
            local function v95(v96, v97, v98) --[[ Line: 203 ]] --[[ Name: func ]]
                -- upvalues: l_UIFolder_0 (ref), l_table_0 (ref), v90 (copy), v71 (ref), v94 (ref), v95 (copy)
                local v99 = (v98 or 11) - 1;
                local v100 = l_UIFolder_0:FindFirstChild(v96) or l_UIFolder_0.Default;
                if v100 then
                    local l_Base_Theme_0 = v100:FindFirstChild("Base_Theme");
                    local v102 = l_Base_Theme_0 and l_Base_Theme_0.Value;
                    local l_v100_FirstChild_0 = v100:FindFirstChild(v97);
                    if l_v100_FirstChild_0 then
                        local l_Config_0 = l_v100_FirstChild_0:FindFirstChild("Config");
                        l_table_0.insert(v90, {
                            Theme = v96, 
                            Folder = v100, 
                            Name = v97, 
                            Found = l_v100_FirstChild_0, 
                            Config = l_Config_0, 
                            isModule = l_v100_FirstChild_0:IsA("ModuleScript")
                        });
                        if l_Config_0 then
                            l_Base_Theme_0 = l_Config_0:FindFirstChild("BaseTheme") or l_Base_Theme_0;
                            v102 = l_Base_Theme_0 and l_Base_Theme_0.Value;
                        end;
                    end;
                    if v102 and v99 > 0 then
                        if v71.DefaultTheme and v102 == "Default" and v96 ~= v71.DefaultTheme and not v94 then
                            v95(v71.DefaultTheme, v97, v99);
                            return;
                        else
                            v94 = true;
                            v95(v102, v97, v99);
                        end;
                    end;
                end;
            end;
            v95(v88, v89);
            v93.Name = "Config";
            if #v90 > 0 then
                for _, v106 in v90 do
                    if v106.Config then
                        for _, v108 in v106.Config:GetChildren() do
                            if not v91[v108.Name] then
                                if l_string_0.sub(v108.Name, 1, 5) == "NoEnv" then
                                    v91.Code = v108;
                                end;
                                v91[v108.Name] = v108;
                            end;
                        end;
                    end;
                end;
                for _, v110 in v91 do
                    v110:Clone().Parent = v93;
                end;
                if v90[1].isModule then
                    return v90[1].Found, v90[1].Folder, v93;
                else
                    if not v91.Code then
                        l_warn_0("Window config missing code.lua. Are your Base_Themes correct? client.UI.GetNew line 236");
                    end;
                    local v111 = v90[1].Found:Clone();
                    local l_Config_1 = v111:FindFirstChild("Config");
                    if l_Config_1 then
                        l_Config_1:Destroy();
                    end;
                    v93.Parent = v111;
                    return v111, v90[1].Folder, v93;
                end;
            else
                return;
            end;
        end, 
        Make = function(v113, v114, v115) --[[ Line: 284 ]] --[[ Name: Make ]]
            -- upvalues: v72 (ref), l_Service_0 (copy), l_UIFolder_0 (copy), v71 (ref), l_string_0 (copy), l_GetEnv_0 (copy), l_pcall_0 (copy), l_require_0 (copy), l_setfenv_0 (copy), l_type_0 (copy), v66 (ref), l_print_0 (copy)
            v114 = v114 or {};
            v115 = v115 or v72.LastServerTheme or {
                Desktop = "Default", 
                Mobile = "Mobilius"
            };
            local v116 = v72.CustomTheme or l_Service_0.IsMobile() and v115.Mobile or v115.Desktop;
            local v117 = l_UIFolder_0:FindFirstChild(v116) or l_UIFolder_0.Default;
            if not v114.NoEnv and v117:FindFirstChild("NoEnv") then
                v114.NoEnv = true;
                v114.modNoEnv = true;
            end;
            local v118, _, v120 = v71.GetNew(v116, v113);
            if v118 then
                local v121 = v118:IsA("ModuleScript");
                local l_Config_2 = v118:FindFirstChild("Config");
                local v123 = l_Config_2 and (l_Config_2:FindFirstChild("Modifier") or l_Config_2:FindFirstChild("NoEnv-Modifier"));
                if v123 and not v114.modNoEnv then
                    v114.modNoEnv = l_string_0.sub(v123.Name, 1, 5) == "NoEnv";
                end;
                if v121 then
                    return v71.LoadModule(v118, v114, {
                        script = v118
                    });
                elseif l_Config_2 and v120 and v120 ~= true then
                    local v124 = v120:FindFirstChild("Code") or v120:FindFirstChild("NoEnv-Code");
                    if not v114.NoEnv and v124 then
                        v114.NoEnv = l_string_0.sub(v124.Name, 1, 5) == "NoEnv";
                    end;
                    local l_AllowMultiple_0 = v120.AllowMultiple;
                    local v126 = not l_AllowMultiple_0 or l_AllowMultiple_0.Value or true;
                    local v127, v128 = v71.Get(v113);
                    if not v127 or v128 and v128 > 0 and v126 then
                        local v129, v130 = v71.Register(v118);
                        if v117:IsA("ModuleScript") then
                            local v131 = true;
                            if l_string_0.sub(v117.Name, 1, 5) ~= "NoEnv" then
                                v131 = v117:FindFirstChild("NoEnv");
                            end;
                            local v132 = l_GetEnv_0({
                                script = v117, 
                                gTable = v129
                            });
                            local _, v134 = l_pcall_0(l_require_0, v117);
                            local v135 = {
                                if v131 then l_pcall_0(v134, v118, v129, v114, v132) else l_pcall_0(l_setfenv_0(v134, v132), v118, v129, v114, v132)
                            };
                            local _ = v135[1];
                            local v137 = v135[2];
                            if v137 ~= nil then
                                if l_type_0(v137) == "userdata" and v66.GetClassName(v137) == "ScreenGui" then
                                    v124 = v137:FindFirstChild("Config") and (v137.Config:FindFirstChild("Code") or v137.Config:FindFirstChild("NoEnv-Code")) or v124;
                                    if not v114.NoEnv and v124 then
                                        v114.NoEnv = l_string_0.sub(v124.Name, 1, 5) == "NoEnv";
                                    end;
                                else
                                    return v137;
                                end;
                            end;
                        end;
                        v118.Parent = v72.GUIHolder;
                        v118.Name = l_Service_0.HttpService:GenerateGUID(false);
                        v114.gIndex = v130;
                        v114.gTable = v129;
                        v124.Parent = l_Config_2;
                        v124.Name = v113;
                        if v123 then
                            v71.LoadModule(v123, v114, {
                                script = v123, 
                                gTable = v129, 
                                Data = v114, 
                                GUI = v118, 
                                isModifier = true
                            });
                        end;
                        return v71.LoadModule(v124, v114, {
                            script = v124, 
                            gTable = v129, 
                            Data = v114, 
                            GUI = v118, 
                            Theme = v116, 
                            ThemeFolder = v117, 
                            isCode = true
                        });
                    end;
                end;
            else
                l_print_0("GUI", v113, "not found");
            end;
        end, 
        Get = function(v138, v139, v140) --[[ Line: 392 ]] --[[ Name: Get ]]
            -- upvalues: l_Client_0 (copy), l_type_0 (copy), l_Service_0 (copy)
            local v141 = {};
            local v142 = 0;
            if v138 then
                for v143, v144 in l_Client_0.GUIs do
                    if v144.Name ~= v139 and v144.Object ~= v139 and v144 ~= v139 then
                        if l_type_0(v138) == "string" then
                            if v144.Name == v138 then
                                v141[v143] = v144;
                                v142 = v142 + 1;
                                if v140 then
                                    return v144;
                                end;
                            end;
                        elseif l_type_0(v138) == "userdata" then
                            if l_Service_0.RawEqual(v144.Object, v138) then
                                v141[v143] = v144;
                                v142 = v142 + 1;
                                if v140 then
                                    return v144;
                                end;
                            end;
                        elseif l_type_0(v138) == "boolean" and v138 == true then
                            v141[v143] = v144;
                            v142 = v142 + 1;
                            if v140 then
                                return v144;
                            end;
                        end;
                    end;
                end;
            end;
            if v142 < 1 then
                return false;
            else
                return v141, v142;
            end;
        end, 
        Remove = function(v145, v146) --[[ Line: 425 ]] --[[ Name: Remove ]]
            -- upvalues: l_Client_0 (copy), v71 (ref)
            if v145 == "Chat" and l_Client_0.Handlers.RemoveCustomChat then
                l_Client_0.Handlers.RemoveCustomChat();
                return;
            else
                local v147 = v71.Get(v145, v146);
                if v147 then
                    for _, v149 in v147 do
                        v149.Destroy();
                    end;
                end;
                return;
            end;
        end, 
        Register = function(v150, v151) --[[ Line: 438 ]] --[[ Name: Register ]]
            -- upvalues: l_Service_0 (copy), l_pcall_0 (copy), v71 (ref), l_warn_0 (copy), l_table_0 (copy), l_Client_0 (copy), l_rawequal_0 (copy)
            local v152 = l_Service_0.HttpService:GenerateGUID(false);
            local v153 = nil;
            v153 = {
                Object = v150, 
                Config = v150:FindFirstChild("Config"), 
                Name = v150.Name, 
                Events = {}, 
                Class = v150.ClassName, 
                Index = v152, 
                Active = true, 
                Ready = function() --[[ Line: 448 ]] --[[ Name: Ready ]]
                    -- upvalues: v153 (ref), l_pcall_0 (ref), l_Service_0 (ref), v71 (ref), l_warn_0 (ref)
                    if v153.Config then
                        v153.Config.Parent = nil;
                    end;
                    local v155, v156 = l_pcall_0(function() --[[ Line: 450 ]]
                        -- upvalues: v153 (ref), l_Service_0 (ref), v71 (ref)
                        local l_Object_0 = v153.Object;
                        if v153.Class == "ScreenGui" or v153.Class == "GuiMain" then
                            if l_Object_0.DisplayOrder == 0 then
                                l_Object_0.DisplayOrder = 90000;
                            end;
                            l_Object_0.Enabled = true;
                            l_Object_0.Parent = l_Service_0.PlayerGui;
                            return;
                        else
                            l_Object_0.Parent = v71.GetHolder();
                            return;
                        end;
                    end);
                    if v155 then
                        v153.Active = true;
                        return;
                    else
                        l_warn_0("Something happened while trying to set the parent of", v153.Name);
                        l_warn_0(v156);
                        v153:Destroy();
                        return;
                    end;
                end, 
                BindEvent = function(v157, v158) --[[ Line: 474 ]] --[[ Name: BindEvent ]]
                    -- upvalues: v153 (ref), l_table_0 (ref), l_Service_0 (ref)
                    local v159 = v157:Connect(v158);
                    local l_Disconnect_0 = v159.Disconnect;
                    local l_Events_0 = v153.Events;
                    local function v164() --[[ Line: 478 ]]
                        -- upvalues: l_Disconnect_0 (copy), v159 (copy), l_Events_0 (copy), l_table_0 (ref)
                        l_Disconnect_0(v159);
                        for v162, v163 in l_Events_0 do
                            if v163.Signal == v159 then
                                l_table_0.remove(l_Events_0, v162);
                            end;
                        end;
                    end;
                    l_table_0.insert(l_Events_0, {
                        Signal = v159, 
                        Remove = v164
                    });
                    return {
                        Disconnect = v164, 
                        disconnect = v164, 
                        wait = l_Service_0.CheckProperty(v159, "wait") and v159.wait
                    }, v159;
                end, 
                ClearEvents = function() --[[ Line: 499 ]] --[[ Name: ClearEvents ]]
                    -- upvalues: v153 (ref)
                    for _, v166 in v153.Events do
                        v166:Remove();
                    end;
                end, 
                Destroy = function() --[[ Line: 505 ]] --[[ Name: Destroy ]]
                    -- upvalues: l_pcall_0 (ref), v153 (ref), l_Service_0 (ref), l_Client_0 (ref), v152 (copy)
                    l_pcall_0(function() --[[ Line: 506 ]]
                        -- upvalues: v153 (ref), l_Service_0 (ref)
                        if v153.CustomDestroy then
                            v153.CustomDestroy();
                            return;
                        else
                            l_Service_0.UnWrap(v153.Object):Destroy();
                            return;
                        end;
                    end);
                    v153.Destroyed = true;
                    v153.Active = false;
                    l_Client_0.GUIs[v152] = nil;
                    v153.ClearEvents();
                end, 
                UnRegister = function() --[[ Line: 519 ]] --[[ Name: UnRegister ]]
                    -- upvalues: l_Client_0 (ref), v152 (copy), v153 (ref)
                    l_Client_0.GUIs[v152] = nil;
                    if v153.AncestryEvent then
                        v153.AncestryEvent:Disconnect();
                    end;
                end, 
                Register = function(v167, v168) --[[ Line: 526 ]] --[[ Name: Register ]]
                    -- upvalues: v153 (ref), l_Service_0 (ref), l_Client_0 (ref), v152 (copy), l_rawequal_0 (ref), v71 (ref)
                    if not v168 then
                        v168 = v167;
                    end;
                    v168:SetSpecial("Destroy", v153.Destroy);
                    v153.Object = l_Service_0.Wrap(v168);
                    v153.Class = v168.ClassName;
                    if v153.AncestryEvent then
                        v153.AncestryEvent:Disconnect();
                    end;
                    v153.AncestryEvent = v168.AncestryChanged:Connect(function(v169, v170) --[[ Line: 537 ]]
                        -- upvalues: l_Client_0 (ref), v152 (ref), v153 (ref), l_rawequal_0 (ref), l_Service_0 (ref), v71 (ref)
                        if l_Client_0.GUIs[v152] and l_rawequal_0(v169, v153.Object) then
                            if v153.Class == "TextLabel" and v170 == l_Service_0.PlayerGui then
                                task.wait();
                                v153.Object.Parent = v71.GetHolder();
                                return;
                            elseif v170 == nil and not v153.KeepAlive then
                                v153:Destroy();
                                return;
                            elseif v170 ~= nil then
                                v153.Active = true;
                                l_Client_0.GUIs[v152] = v153;
                            end;
                        end;
                    end);
                    l_Client_0.GUIs[v152] = v153;
                end
            };
            if v151 then
                for v171, v172 in v151 do
                    v153[v171] = v172;
                end;
            end;
            v150.Name = l_Service_0.HttpService:GenerateGUID(false);
            v153:Register(v150);
            return v153, v152;
        end
    };
    l_Client_0.UI.RegisterGui = l_Client_0.UI.Register;
    l_Client_0.UI.GetGui = l_Client_0.UI.Get;
    l_Client_0.UI.PrepareGui = l_Client_0.UI.Prepare;
    l_Client_0.UI.MakeGui = l_Client_0.UI.Make;
end;