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
    local _ = setfenv;
    local _ = workspace;
    local _ = getmetatable;
    local _ = setmetatable;
    local _ = loadstring;
    local _ = coroutine;
    local _ = rawequal;
    local _ = typeof;
    local _ = print;
    local _ = math;
    local _ = warn;
    local _ = error;
    local _ = pcall;
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
    local _ = unpack;
    local _ = string;
    local _ = Color3;
    local _ = newproxy;
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
    local l_require_0 = require;
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
        v70.Init = nil;
    end;
    local function v72() --[[ Line: 52 ]] --[[ Name: RunAfterLoaded ]]
        -- upvalues: l_Client_0 (copy), v70 (ref)
        l_Client_0.Variables.CodeName = l_Client_0.Remote.Get("Variable", "CodeName");
        v70.RunAfterLoaded = nil;
    end;
    local function v73() --[[ Line: 57 ]] --[[ Name: RunLast ]]
        -- upvalues: v70 (ref)
        v70.RunLast = nil;
    end;
    l_getfenv_0().client = nil;
    l_getfenv_0().service = nil;
    l_getfenv_0().script = nil;
    l_Client_0.GUIs = {};
    l_Client_0.GUIHolder = l_Service_0.New("Folder");
    l_Client_0.Variables = {
        Init = v71, 
        RunLast = v73, 
        RunAfterLoaded = v72, 
        CodeName = "", 
        UIKeepAlive = true, 
        KeybindsEnabled = true, 
        ParticlesEnabled = true, 
        CapesEnabled = true, 
        HideChatCommands = false, 
        Particles = {}, 
        KeyBinds = {}, 
        Aliases = {}, 
        Capes = {}, 
        savedUI = {}, 
        localSounds = {}, 
        ESPObjects = {}, 
        CommunicationsHistory = {}, 
        LightingSettings = {
            Ambient = l_Service_0.Lighting.Ambient, 
            Brightness = l_Service_0.Lighting.Brightness, 
            ColorShift_Bottom = l_Service_0.Lighting.ColorShift_Bottom, 
            ColorShift_Top = l_Service_0.Lighting.ColorShift_Top, 
            GlobalShadows = l_Service_0.Lighting.GlobalShadows, 
            OutdoorAmbient = l_Service_0.Lighting.OutdoorAmbient, 
            Outlines = l_Service_0.Lighting.Outlines, 
            ShadowColor = l_Service_0.Lighting.ShadowColor, 
            GeographicLatitude = l_Service_0.Lighting.GeographicLatitude, 
            Name = l_Service_0.Lighting.Name, 
            TimeOfDay = l_Service_0.Lighting.TimeOfDay, 
            FogColor = l_Service_0.Lighting.FogColor, 
            FogEnd = l_Service_0.Lighting.FogEnd, 
            FogStart = l_Service_0.Lighting.FogStart
        }, 
        KeycodeNames = l_require_0(l_Client_0.Shared.KeycodeNames)
    };
end;