return function(v0, _) --[[ Line: 3 ]]
    local l_Client_0 = v0.Client;
    local l_Service_0 = v0.Service;
    local _ = l_Client_0.Settings;
    local l_Functions_0 = l_Client_0.Functions;
    local _ = l_Client_0.Anti;
    local _ = l_Client_0.Core;
    local l_Logs_0 = l_Client_0.Logs;
    local l_Remote_0 = l_Client_0.Remote;
    local _ = l_Client_0.Process;
    local _ = l_Client_0.Variables;
    local l_Pcall_0 = l_Client_0.Pcall;
    local function v14(v13, ...) --[[ Line: 12 ]] --[[ Name: cPcall ]]
        -- upvalues: l_Pcall_0 (copy)
        return l_Pcall_0(function(...) --[[ Line: 13 ]]
            -- upvalues: v13 (copy)
            return coroutine.resume(coroutine.create(v13), ...);
        end, ...);
    end;
    l_Client_0.cPcall = v14;
    l_Service_0.cPcall = v14;
    l_Remote_0.UnEncrypted = setmetatable({}, {
        __newindex = function(_, v16, v17) --[[ Line: 19 ]] --[[ Name: __newindex ]]
            -- upvalues: l_Remote_0 (copy), l_Logs_0 (copy)
            warn("Unencrypted remote commands are deprecated; moving", v16, "to Remote.Commands. Replace `Remote.Unencrypted` with `Remote.Commands`!");
            l_Remote_0.Commands[v16] = v17;
            l_Logs_0:AddLog("Script", (("Attempted to add %* to legacy Remote.Unencrypted. Moving to Remote.Commands"):format(v16)));
        end
    });
    l_Functions_0.GetRandom = function(v18) --[[ Line: 25 ]]
        local l_random_0 = math.random;
        local l_format_0 = string.format;
        local v21 = type(v18) == "number" and v18 or l_random_0(5, 10);
        local v22 = {};
        for v23 = 1, v21 do
            v22[v23] = l_format_0("%02x", l_random_0(255));
        end;
        return table.concat(v22);
    end;
    l_Logs_0:AddLog("Script", "Misc Features Module Loaded");
end;