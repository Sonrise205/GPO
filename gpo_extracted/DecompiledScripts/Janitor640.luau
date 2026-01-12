local l_Heartbeat_0 = game:GetService("RunService").Heartbeat;
local v1 = newproxy(true);
getmetatable(v1).__tostring = function() --[[ Line: 11 ]]
    return "IndicesReference";
end;
local v2 = newproxy(true);
getmetatable(v2).__tostring = function() --[[ Line: 16 ]]
    return "LinkToInstanceIndex";
end;
local v3 = {
    ClassName = "Janitor", 
    __index = {
        CurrentlyCleaning = true, 
        [v1] = nil
    }
};
local v4 = {
    ["function"] = true, 
    RBXScriptConnection = "Disconnect"
};
v3.new = function() --[[ Line: 40 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy), v3 (copy)
    return (setmetatable({
        CurrentlyCleaning = false, 
        [v1] = nil
    }, v3));
end;
v3.Is = function(v5) --[[ Line: 52 ]] --[[ Name: Is ]]
    -- upvalues: v3 (copy)
    local v6 = false;
    if type(v5) == "table" then
        v6 = getmetatable(v5) == v3;
    end;
    return v6;
end;
v3.is = v3.Is;
v3.__index.Add = function(v7, v8, v9, v10) --[[ Line: 65 ]] --[[ Name: Add ]]
    -- upvalues: v1 (copy), v4 (copy)
    if v10 == nil then
        v10 = newproxy(false);
    end;
    if v10 then
        v7:Remove(v10);
        local v11 = v7[v1];
        if not v11 then
            v11 = {};
            v7[v1] = v11;
        end;
        v11[v10] = v8;
    end;
    v9 = v9 or v4[typeof(v8)] or "Destroy";
    if type(v8) ~= "function" and not v8[v9] then
        warn(string.format("Object %s doesn't have method %s, are you sure you want to add it? Traceback: %s", tostring(v8), tostring(v9), debug.traceback(nil, 2)));
    end;
    v7[v8] = v9;
    return v8, v10;
end;
v3.__index.Give = v3.__index.Add;
v3.__index.AddObject = function(v12, v13) --[[ Line: 131 ]] --[[ Name: AddObject ]]
    local v14 = newproxy(false);
    return v12:Add(v13, false, v14), v14;
end;
v3.__index.GiveObject = v3.__index.AddObject;
v3.__index.Remove = function(v15, v16) --[[ Line: 155 ]] --[[ Name: Remove ]]
    -- upvalues: v1 (copy)
    local v17 = v15[v1];
    if v17 then
        local v18 = v17[v16];
        if v18 then
            local v19 = v15[v18];
            if v19 then
                if v19 == true then
                    v18();
                else
                    local v20 = v18[v19];
                    if v20 then
                        v20(v18);
                    end;
                end;
                v15[v18] = nil;
            end;
            v17[v16] = nil;
        end;
    end;
    return v15;
end;
v3.__index.Get = function(v21, v22) --[[ Line: 189 ]] --[[ Name: Get ]]
    -- upvalues: v1 (copy)
    local v23 = v21[v1];
    if v23 then
        return v23[v22];
    else
        return;
    end;
end;
v3.__index.Cleanup = function(v24) --[[ Line: 200 ]] --[[ Name: Cleanup ]]
    -- upvalues: v1 (copy)
    if not v24.CurrentlyCleaning then
        v24.CurrentlyCleaning = nil;
        for v25, v26 in next, v24 do
            if v25 ~= v1 then
                local v27 = type(v25);
                if v27 == "string" or v27 == "number" then
                    v24[v25] = nil;
                else
                    if v26 == true then
                        v25();
                    else
                        local v28 = v25[v26];
                        if v28 then
                            v28(v25);
                        end;
                    end;
                    v24[v25] = nil;
                end;
            end;
        end;
        local v29 = v24[v1];
        if v29 then
            for v30 in next, v29 do
                v29[v30] = nil;
            end;
            v24[v1] = {};
        end;
        v24.CurrentlyCleaning = false;
    end;
end;
v3.__index.Clean = v3.__index.Cleanup;
v3.__index.Destroy = function(v31) --[[ Line: 246 ]] --[[ Name: Destroy ]]
    v31:Cleanup();
end;
v3.__call = v3.__index.Cleanup;
local v32 = {
    Connected = true
};
v32.__index = v32;
v32.Disconnect = function(v33) --[[ Line: 260 ]] --[[ Name: Disconnect ]]
    if v33.Connected then
        v33.Connected = false;
        v33.Connection:Disconnect();
    end;
end;
v32.__tostring = function(v34) --[[ Line: 267 ]] --[[ Name: __tostring ]]
    return "Disconnect<" .. tostring(v34.Connected) .. ">";
end;
v3.__index.LinkToInstance = function(v35, v36, v37) --[[ Line: 277 ]] --[[ Name: LinkToInstance ]]
    -- upvalues: v2 (copy), v32 (copy), l_Heartbeat_0 (copy)
    local v38 = nil;
    local v39 = v37 and newproxy(false) or v2;
    local v40 = v36.Parent == nil;
    local v41 = setmetatable({}, v32);
    local function v44(v42, v43) --[[ Line: 283 ]] --[[ Name: ChangedFunction ]]
        -- upvalues: v41 (copy), v40 (ref), l_Heartbeat_0 (ref), v38 (ref), v35 (copy)
        if v41.Connected then
            v42 = nil;
            v40 = v43 == nil;
            if v40 then
                coroutine.wrap(function() --[[ Line: 289 ]]
                    -- upvalues: l_Heartbeat_0 (ref), v41 (ref), v38 (ref), v35 (ref), v40 (ref)
                    l_Heartbeat_0:Wait();
                    if not v41.Connected then
                        return;
                    elseif not v38.Connected then
                        v35:Cleanup();
                        return;
                    else
                        while v40 and v38.Connected and v41.Connected do
                            l_Heartbeat_0:Wait();
                        end;
                        if v41.Connected and v40 then
                            v35:Cleanup();
                        end;
                        return;
                    end;
                end)();
            end;
        end;
    end;
    v38 = v36.AncestryChanged:Connect(v44);
    v41.Connection = v38;
    if v40 then
        local v45 = nil;
        local l_Parent_0 = v36.Parent;
        if v41.Connected then
            v45 = nil;
            v40 = l_Parent_0 == nil;
            if v40 then
                coroutine.wrap(function() --[[ Line: 289 ]]
                    -- upvalues: l_Heartbeat_0 (ref), v41 (copy), v38 (ref), v35 (copy), v40 (ref)
                    l_Heartbeat_0:Wait();
                    if not v41.Connected then
                        return;
                    elseif not v38.Connected then
                        v35:Cleanup();
                        return;
                    else
                        while v40 and v38.Connected and v41.Connected do
                            l_Heartbeat_0:Wait();
                        end;
                        if v41.Connected and v40 then
                            v35:Cleanup();
                        end;
                        return;
                    end;
                end)();
            end;
        end;
    end;
    v36 = nil;
    return v35:Add(v41, "Disconnect", v39);
end;
v3.__index.LinkToInstances = function(v47, ...) --[[ Line: 325 ]] --[[ Name: LinkToInstances ]]
    -- upvalues: v3 (copy)
    local v48 = v3.new();
    for _, v50 in ipairs({
        ...
    }) do
        v48:Add(v47:LinkToInstance(v50, true), "Disconnect");
    end;
    return v48;
end;
for v51, v52 in next, v3.__index do
    local v53 = string.sub(string.lower(v51), 1, 1) .. string.sub(v51, 2);
    v3.__index[v53] = v52;
end;
return v3;