local l_Heartbeat_0 = game:GetService("RunService").Heartbeat;
local function _() --[[ Line: 26 ]] --[[ Name: getPromiseReference ]]
    return false;
end;
local v2 = newproxy(true);
getmetatable(v2).__tostring = function() --[[ Line: 31 ]]
    return "IndicesReference";
end;
local v3 = newproxy(true);
getmetatable(v3).__tostring = function() --[[ Line: 36 ]]
    return "LinkToInstanceIndex";
end;
local v4 = {
    IGNORE_MEMORY_DEBUG = true, 
    ClassName = "Janitor", 
    __index = {
        CurrentlyCleaning = true, 
        [v2] = nil
    }
};
local v5 = {
    ["function"] = true, 
    Promise = "cancel", 
    RBXScriptConnection = "Disconnect"
};
v4.new = function() --[[ Line: 58 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), v4 (copy)
    return (setmetatable({
        CurrentlyCleaning = false, 
        [v2] = nil
    }, v4));
end;
v4.Is = function(v6) --[[ Line: 65 ]] --[[ Name: Is ]]
    -- upvalues: v4 (copy)
    local v7 = false;
    if type(v6) == "table" then
        v7 = getmetatable(v6) == v4;
    end;
    return v7;
end;
v4.is = v4.Is;
v4.__index.Add = function(v8, v9, v10, v11) --[[ Line: 71 ]] --[[ Name: Add ]]
    -- upvalues: v2 (copy), v5 (copy)
    if v11 then
        v8:Remove(v11);
        local v12 = v8[v2];
        if not v12 then
            v12 = {};
            v8[v2] = v12;
        end;
        v12[v11] = v9;
    end;
    local v13 = typeof(v9);
    if v13 == "table" and string.match(tostring(v9), "Promise") then
        v13 = "Promise";
    end;
    v10 = v10 or v5[v13] or "Destroy";
    if type(v9) ~= "function" and not v9[v10] then
        warn(string.format("Object %s doesn't have method %s, are you sure you want to add it? Traceback: %s", tostring(v9), tostring(v10), debug.traceback(nil, 2)));
    end;
    v8[v9] = {
        v10, 
        (debug.traceback(""))
    };
    return v9;
end;
v4.__index.Give = v4.__index.Add;
v4.__index.AddPromise = function(v14, v15) --[[ Line: 103 ]] --[[ Name: AddPromise ]]
    local v16 = false;
    if v16 then
        if not v16.is(v15) then
            error(string.format("Invalid argument #1 to 'Janitor:AddPromise' (Promise expected, got %s (%s))", typeof(v15), (tostring(v15))));
        end;
        if v15:getStatus() == v16.Status.Started then
            local v17 = newproxy(false);
            local v21 = v14:Add(v16.new(function(v18, _, v20) --[[ Line: 111 ]]
                -- upvalues: v15 (copy)
                if v20(function() --[[ Line: 112 ]]
                    -- upvalues: v15 (ref)
                    v15:cancel();
                end) then
                    return;
                else
                    v18(v15);
                    return;
                end;
            end), "cancel", v17);
            v21:finallyCall(v14.Remove, v14, v17);
            return v21;
        else
            return v15;
        end;
    else
        return v15;
    end;
end;
v4.__index.GivePromise = v4.__index.AddPromise;
v4.__index.AddObject = function(v22, v23) --[[ Line: 133 ]] --[[ Name: AddObject ]]
    local v24 = newproxy(false);
    local v25 = false;
    if v25 and v25.is(v23) then
        if v23:getStatus() == v25.Status.Started then
            local v26 = v22:Add(v25.resolve(v23), "cancel", v24);
            v26:finallyCall(v22.Remove, v22, v24);
            return v26, v24;
        else
            return v23;
        end;
    else
        return v22:Add(v23, false, v24), v24;
    end;
end;
v4.__index.GiveObject = v4.__index.AddObject;
v4.__index.Remove = function(v27, v28) --[[ Line: 151 ]] --[[ Name: Remove ]]
    -- upvalues: v2 (copy)
    local v29 = v27[v2];
    if v29 then
        local v30 = v29[v28];
        if v30 then
            local v31 = v27[v30];
            local v32 = v31 and v31[1];
            if v32 then
                if v32 == true then
                    v30();
                else
                    local v33 = v30[v32];
                    if v33 then
                        v33(v30);
                    end;
                end;
                v27[v30] = nil;
            end;
            v29[v28] = nil;
        end;
    end;
    return v27;
end;
v4.__index.Get = function(v34, v35) --[[ Line: 180 ]] --[[ Name: Get ]]
    -- upvalues: v2 (copy)
    local v36 = v34[v2];
    if v36 then
        return v36[v35];
    else
        return nil;
    end;
end;
v4.__index.Cleanup = function(v37) --[[ Line: 188 ]] --[[ Name: Cleanup ]]
    -- upvalues: v2 (copy)
    if not v37.CurrentlyCleaning then
        v37.CurrentlyCleaning = nil;
        for v38, v39 in next, v37 do
            if v38 ~= v2 then
                local v40 = type(v38);
                if v40 == "string" or v40 == "number" then
                    v37[v38] = nil;
                else
                    local v41 = v39[1];
                    local v42 = v39[2];
                    local function _(v43) --[[ Line: 205 ]] --[[ Name: warnUser ]]
                        -- upvalues: v42 (copy)
                        local v44 = debug.traceback("", 3);
                        local l_v42_0 = v42;
                        warn("-------- Janitor Error --------" .. "\n" .. tostring(v43) .. "\n" .. v44 .. "" .. l_v42_0);
                    end;
                    if v41 == true then
                        local l_status_0, l_result_0 = pcall(v38);
                        if not l_status_0 then
                            local v49 = debug.traceback("", 3);
                            warn("-------- Janitor Error --------" .. "\n" .. tostring(l_result_0) .. "\n" .. v49 .. "" .. v42);
                        end;
                    else
                        local v50 = v38[v41];
                        if v50 then
                            local l_status_1, l_result_1 = pcall(v50, v38);
                            local v53 = false;
                            if typeof(v38) == "Instance" then
                                v53 = v50 == "Destroy";
                            end;
                            if not l_status_1 and not v53 then
                                local v54 = debug.traceback("", 3);
                                warn("-------- Janitor Error --------" .. "\n" .. tostring(l_result_1) .. "\n" .. v54 .. "" .. v42);
                            end;
                        end;
                    end;
                    v37[v38] = nil;
                end;
            end;
        end;
        local v55 = v37[v2];
        if v55 then
            for v56 in next, v55 do
                v55[v56] = nil;
            end;
            v37[v2] = {};
        end;
        v37.CurrentlyCleaning = false;
    end;
end;
v4.__index.Clean = v4.__index.Cleanup;
v4.__index.Destroy = function(v57) --[[ Line: 244 ]] --[[ Name: Destroy ]]
    v57:Cleanup();
end;
v4.__call = v4.__index.Cleanup;
local v58 = {
    Connected = true
};
v58.__index = v58;
v58.Disconnect = function(v59) --[[ Line: 254 ]] --[[ Name: Disconnect ]]
    if v59.Connected then
        v59.Connected = false;
        v59.Connection:Disconnect();
    end;
end;
v58.__tostring = function(v60) --[[ Line: 261 ]] --[[ Name: __tostring ]]
    return "Disconnect<" .. tostring(v60.Connected) .. ">";
end;
v4.__index.LinkToInstance = function(v61, v62, v63) --[[ Line: 265 ]] --[[ Name: LinkToInstance ]]
    -- upvalues: v3 (copy), v58 (copy), l_Heartbeat_0 (copy)
    local v64 = nil;
    local v65 = v63 and newproxy(false) or v3;
    local v66 = v62.Parent == nil;
    local v67 = setmetatable({}, v58);
    local function v70(v68, v69) --[[ Line: 271 ]] --[[ Name: ChangedFunction ]]
        -- upvalues: v67 (copy), v66 (ref), l_Heartbeat_0 (ref), v64 (ref), v61 (copy)
        if v67.Connected then
            v68 = nil;
            v66 = v69 == nil;
            if v66 then
                coroutine.wrap(function() --[[ Line: 277 ]]
                    -- upvalues: l_Heartbeat_0 (ref), v67 (ref), v64 (ref), v61 (ref), v66 (ref)
                    l_Heartbeat_0:Wait();
                    if not v67.Connected then
                        return;
                    elseif not v64.Connected then
                        v61:Cleanup();
                        return;
                    else
                        while v66 and v64.Connected and v67.Connected do
                            l_Heartbeat_0:Wait();
                        end;
                        if v67.Connected and v66 then
                            v61:Cleanup();
                        end;
                        return;
                    end;
                end)();
            end;
        end;
    end;
    v64 = v62.AncestryChanged:Connect(v70);
    v67.Connection = v64;
    if v66 then
        local v71 = nil;
        local l_Parent_0 = v62.Parent;
        if v67.Connected then
            v71 = nil;
            v66 = l_Parent_0 == nil;
            if v66 then
                coroutine.wrap(function() --[[ Line: 277 ]]
                    -- upvalues: l_Heartbeat_0 (ref), v67 (copy), v64 (ref), v61 (copy), v66 (ref)
                    l_Heartbeat_0:Wait();
                    if not v67.Connected then
                        return;
                    elseif not v64.Connected then
                        v61:Cleanup();
                        return;
                    else
                        while v66 and v64.Connected and v67.Connected do
                            l_Heartbeat_0:Wait();
                        end;
                        if v67.Connected and v66 then
                            v61:Cleanup();
                        end;
                        return;
                    end;
                end)();
            end;
        end;
    end;
    v62 = nil;
    return v61:Add(v67, "Disconnect", v65);
end;
v4.__index.LinkToInstances = function(v73, ...) --[[ Line: 308 ]] --[[ Name: LinkToInstances ]]
    -- upvalues: v4 (copy)
    local v74 = v4.new();
    for _, v76 in ipairs({
        ...
    }) do
        v74:Add(v73:LinkToInstance(v76, true), "Disconnect");
    end;
    return v74;
end;
for v77, v78 in next, v4.__index do
    local v79 = string.sub(string.lower(v77), 1, 1) .. string.sub(v77, 2);
    v4.__index[v79] = v78;
end;
return v4;