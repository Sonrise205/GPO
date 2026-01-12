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
    local l_script_0 = script;
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
        v67.Init = nil;
    end;
    local function v72() --[[ Line: 52 ]] --[[ Name: RunLast ]]
        -- upvalues: v67 (ref)
        v67.RunLast = nil;
    end;
    local function v74(_) --[[ Line: 87 ]] --[[ Name: RunAfterLoaded ]]
        -- upvalues: l_Service_0 (copy), v67 (ref), v68 (ref)
        l_Service_0.Player.Chatted:Connect(l_Service_0.EventTask("Event: ProcessChat", v67.Chat));
        l_Service_0.Player.CharacterRemoving:Connect(l_Service_0.EventTask("Event: CharacterRemoving", v67.CharacterRemoving));
        l_Service_0.Player.CharacterAdded:Connect(l_Service_0.Threads.NewEventTask("Event: CharacterAdded", v67.CharacterAdded));
        l_Service_0.LogService.MessageOut:Connect(v67.LogService);
        l_Service_0.ScriptContext.Error:Connect(v67.ErrorMessage);
        v67.RateLimits = v68.Get("RateLimits") or v67.RateLimits;
        v67.RunAfterLoaded = nil;
    end;
    l_getfenv_0().client = nil;
    l_getfenv_0().service = nil;
    l_getfenv_0().script = nil;
    l_Client_0.Process = {
        Init = v71, 
        RunLast = v72, 
        RunAfterLoaded = v74, 
        RateLimits = {
            Remote = 0.02, 
            Command = 0.1, 
            Chat = 0.1, 
            RateLog = 10
        }, 
        Remote = function(v75, v76, ...) --[[ Line: 118 ]] --[[ Name: Remote ]]
            -- upvalues: v68 (ref), l_type_0 (copy), l_Client_0 (copy), v65 (ref), l_Service_0 (copy), l_unpack_0 (copy)
            local v77 = {
                ...
            };
            local l_v68_0 = v68;
            l_v68_0.Received = l_v68_0.Received + 1;
            if l_type_0(v76) == "string" then
                if v76 == ("%*GIVE_KEY"):format(l_Client_0.DepsName) then
                    if not v65.Key then
                        log("~! Set remote key");
                        v65.Key = v77[1];
                        log("~! Call Finish_Loading()");
                        l_Client_0.Finish_Loading();
                        return;
                    end;
                elseif v65.Key then
                    l_v68_0 = v68.Decrypt(v76, v65.Key);
                    local v79 = v75.Mode == "Get" and v68.Returnables[l_v68_0] or v68.Commands[l_v68_0];
                    if v79 then
                        local v80 = {
                            l_Service_0.TrackTask(("Remote: %*"):format(l_v68_0), v79, false, v77)
                        };
                        if not v80[1] then
                            logError(v80[2]);
                            return;
                        else
                            return {
                                l_unpack_0(v80, 2)
                            };
                        end;
                    end;
                end;
            end;
        end, 
        LogService = function(_, _) --[[ Line: 146 ]] --[[ Name: LogService ]]

        end, 
        ErrorMessage = function(v83, v84, v85) --[[ Line: 150 ]] --[[ Name: ErrorMessage ]]
            -- upvalues: l_string_0 (copy), l_script_0 (copy)
            if v83 and v83 ~= "nil" and v83 ~= "" and (l_string_0.find(v83, ":: Adonis ::") or l_string_0.find(v83, l_script_0.Name) or v85 == l_script_0) then
                logError((("%* - %*"):format(v83, v84)));
            end;
        end, 
        Chat = function(v86) --[[ Line: 161 ]] --[[ Name: Chat ]]
            -- upvalues: l_Service_0 (copy), v68 (ref)
            if not l_Service_0.Player or l_Service_0.Player.Parent ~= l_Service_0.Players then
                v68.Fire("ProcessChat", v86);
            end;
        end, 
        CharacterAdded = function(...) --[[ Line: 168 ]] --[[ Name: CharacterAdded ]]
            -- upvalues: l_Service_0 (copy), v69 (ref)
            l_Service_0.Events.CharacterAdded:Fire(...);
            task.wait();
            v69.GetHolder();
        end, 
        CharacterRemoving = function() --[[ Line: 175 ]] --[[ Name: CharacterRemoving ]]
            -- upvalues: v70 (ref), l_Client_0 (copy), l_pcall_0 (copy), l_Service_0 (copy), l_Enum_0 (copy)
            if v70.UIKeepAlive then
                for _, v88 in l_Client_0.GUIs do
                    if v88.Class == "ScreenGui" or v88.Class == "GuiMain" or v88.Class == "TextLabel" then
                        if (not v88.Object:IsA("ScreenGui") or v88.Object.ResetOnSpawn) and v88.CanKeepAlive then
                            v88.KeepAlive = true;
                            v88.KeepParent = v88.Object.Parent;
                            v88.Object.Parent = nil;
                        elseif not v88.CanKeepAlive then
                            l_pcall_0(v88.Destroy, v88);
                        end;
                    end;
                end;
            end;
            if v70.GuiViewFolder then
                v70.GuiViewFolder:Destroy();
                v70.GuiViewFolder = nil;
            end;
            if v70.ChatEnabled then
                l_Service_0.StarterGui:SetCoreGuiEnabled(l_Enum_0.CoreGuiType.Chat, true);
            end;
            if v70.PlayerListEnabled then
                l_Service_0.StarterGui:SetCoreGuiEnabled(l_Enum_0.CoreGuiType.PlayerList, true);
            end;
            local l_FocusedTextBox_0 = l_Service_0.UserInputService:GetFocusedTextBox();
            if l_FocusedTextBox_0 then
                l_FocusedTextBox_0:ReleaseFocus();
            end;
            l_Service_0.Events.CharacterRemoving:Fire();
        end
    };
end;