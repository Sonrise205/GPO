client = nil;
service = nil;
Pcall = nil;
Routine = nil;
GetEnv = nil;
origEnv = nil;
logError = nil;
return function(_, v1) --[[ Line: 11 ]]
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
    local l_setmetatable_0 = setmetatable;
    local _ = loadstring;
    local _ = coroutine;
    local l_rawequal_0 = rawequal;
    local _ = typeof;
    local _ = print;
    local _ = math;
    local _ = warn;
    local _ = error;
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
    local _ = os;
    local _ = time;
    local _ = Faces;
    local _ = unpack;
    local _ = string;
    local _ = Color3;
    local l_newproxy_0 = newproxy;
    local _ = tostring;
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
    local _ = table;
    local _ = type;
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
    local v62 = nil;
    local v63 = nil;
    local v64 = nil;
    local v65 = nil;
    local l_service_0 = v2.service;
    local l_client_0 = v2.client;
    local _ = l_client_0.Core;
    local _ = l_client_0.Remote;
    local _ = l_client_0.Functions;
    local _ = l_client_0.Disconnect;
    local _ = l_client_0.Remote.Send;
    local _ = l_client_0.Remote.Get;
    local _ = l_service_0.NetworkClient;
    local _ = l_client_0.Kill;
    local l_LocalPlayer_0 = l_service_0.Players.LocalPlayer;
    local _ = l_select_0(2, l_pcall_0(l_service_0.RunService.IsStudio, l_service_0.RunService));
    local _ = l_LocalPlayer_0.Kick;
    local _ = l_service_0.GuiService:IsTenFootInterface();
    if l_service_0.UserInputService.TouchEnabled and not l_service_0.UserInputService.KeyboardEnabled then
        local _ = not l_service_0.UserInputService.MouseEnabled;
    end;
    local function v81() --[[ Line: 54 ]] --[[ Name: Init ]]
        -- upvalues: v64 (ref), l_client_0 (copy), v62 (ref), v65 (ref), v63 (ref)
        v64 = l_client_0.UI;
        v62 = l_client_0.Anti;
        v65 = l_client_0.Variables;
        v63 = l_client_0.Process;
        v62.Init = nil;
    end;
    local function v82() --[[ Line: 63 ]] --[[ Name: RunAfterLoaded ]]
        -- upvalues: l_service_0 (copy), v62 (ref)
        l_service_0.Player.Changed:Connect(function() --[[ Line: 64 ]]
            -- upvalues: v62 (ref), l_service_0 (ref)
            if v62.RLocked(l_service_0.Player) then
                v62.Detected("kick", "Player is Roblox Locked");
            end;
        end);
        v62.RunAfterLoaded = nil;
    end;
    local function v83() --[[ Line: 73 ]] --[[ Name: RunLast ]]
        -- upvalues: v62 (ref)
        v62.RunLast = nil;
    end;
    l_getfenv_0().client = nil;
    l_getfenv_0().service = nil;
    l_getfenv_0().script = nil;
    local _ = function(v84, v85) --[[ Line: 111 ]] --[[ Name: compareTables ]]
        -- upvalues: l_service_0 (copy), l_rawequal_0 (copy)
        if l_service_0.CountTable(v84) ~= l_service_0.CountTable(v85) then
            return false;
        else
            for v86, _ in v84 do
                if not l_rawequal_0(v84[v86], v85[v86]) then
                    return false;
                end;
            end;
            return true;
        end;
    end;
    local _ = l_newproxy_0(true);
    local function v92(v90, v91) --[[ Line: 625 ]]
        -- upvalues: v62 (ref), l_service_0 (copy)
        if v62.Detectors[v90] and l_service_0.NetworkClient then
            v62.Detectors[v90](v91);
        end;
    end;
    local v93 = {};
    v62 = l_service_0.ReadOnly({
        Init = v81, 
        RunLast = v83, 
        RunAfterLoaded = v82, 
        Launch = v92, 
        Detected = function() --[[ Line: 638 ]] --[[ Name: Detected ]]

        end, 
        Detectors = l_service_0.ReadOnly(l_setmetatable_0({}, {
            __index = v93
        }), false, true), 
        AddDetector = function(v94, v95) --[[ Line: 641 ]] --[[ Name: AddDetector ]]
            -- upvalues: v93 (copy)
            if not v93[v94] then
                v93[v94] = v95;
            end;
        end, 
        RLocked = function(v96) --[[ Line: 647 ]] --[[ Name: RLocked ]]
            -- upvalues: l_pcall_0 (copy)
            return not l_pcall_0(function() --[[ Line: 648 ]]
                -- upvalues: v96 (copy)
                return v96.GetFullName(v96);
            end);
        end
    }, {
        Init = true, 
        RunLast = true, 
        RunAfterLoaded = true
    }, true);
    l_client_0.Anti = v62;
end;