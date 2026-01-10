local v0 = nil;
local function v3(v1, ...) --[[ Line: 43 ]] --[[ Name: AcquireRunnerThreadAndCallEventHandler ]]
    -- upvalues: v0 (ref)
    local l_v0_0 = v0;
    v0 = nil;
    v1(...);
    v0 = l_v0_0;
end;
local function v4(...) --[[ Line: 51 ]] --[[ Name: RunEventHandlerInFreeThread ]]
    -- upvalues: v3 (copy)
    v3(...);
    while true do
        v3(coroutine.yield());
    end;
end;
local function v7(v5, ...) --[[ Line: 58 ]] --[[ Name: Cleanup ]]
    local v6 = typeof(v5);
    if v6 == "function" then
        v5(...);
        return;
    elseif v6 == "RBXScriptConnection" then
        v5:Disconnect();
        return;
    elseif v6 == "Instance" then
        v5:Destroy();
        return;
    else
        if v6 == "table" then
            if type(v5.Destroy) == "function" then
                v5:Destroy();
                return;
            elseif type(v5.Disconnect) == "function" then
                v5:Disconnect();
            end;
        end;
        return;
    end;
end;
local function v8(...) --[[ Line: 78 ]] --[[ Name: CleanupInThread ]]
    -- upvalues: v0 (ref), v4 (copy), v7 (copy)
    if not v0 then
        v0 = coroutine.create(v4);
    end;
    task.spawn(assert(v0), v7, ...);
end;
local v9 = {};
v9.__index = v9;
v9.New = function(v10, v11) --[[ Line: 103 ]] --[[ Name: New ]]
    -- upvalues: v9 (copy)
    local v12 = {
        maid = v10, 
        object = v11
    };
    setmetatable(v12, v9);
    return v12;
end;
v9.Destroy = function(v13) --[[ Line: 116 ]] --[[ Name: Destroy ]]
    v13.maid.tokens[v13] = nil;
end;
v9.Cleanup = function(v14, ...) --[[ Line: 120 ]] --[[ Name: Cleanup ]]
    -- upvalues: v8 (copy)
    if v14.object == nil then
        return;
    else
        v14.maid.tokens[v14] = nil;
        v8(v14.object, ...);
        v14.object = nil;
        return;
    end;
end;
local v15 = {};
v15.__index = v15;
v15.New = function(v16) --[[ Line: 135 ]] --[[ Name: New ]]
    -- upvalues: v15 (copy)
    local v17 = {
        tokens = {}, 
        is_cleaned = false, 
        key = v16
    };
    setmetatable(v17, v15);
    return v17;
end;
v15.IsActive = function(v18) --[[ Line: 149 ]] --[[ Name: IsActive ]]
    return not v18.is_cleaned;
end;
v15.Add = function(v19, v20) --[[ Line: 153 ]] --[[ Name: Add ]]
    -- upvalues: v8 (copy), v9 (copy)
    if v19.is_cleaned == true then
        v8(v20);
    end;
    local v21 = typeof(v20);
    if v21 == "table" then
        if type(v20.Destroy) ~= "function" and type(v20.Disconnect) ~= "function" then
            error((("[%*]: Received table as cleanup object, but couldn't detect a :Destroy() or :Disconnect() method"):format(script.Name)));
        end;
    elseif v21 ~= "function" and v21 ~= "RBXScriptConnection" and v21 ~= "Instance" then
        error((("[%*]: Cleanup of type \"%*\" not supported"):format(script.Name, v21)));
    end;
    local v22 = v9.New(v19, v20);
    v19.tokens[v22] = true;
    return v22;
end;
v15.Cleanup = function(v23, ...) --[[ Line: 176 ]] --[[ Name: Cleanup ]]
    if v23.key ~= nil then
        error((("[%*]: \"Cleanup()\" is locked for this Maid"):format(script.Name)));
    end;
    v23.is_cleaned = true;
    for v24 in pairs(v23.tokens) do
        v24:Cleanup(...);
    end;
end;
v15.Unlock = function(v25, v26) --[[ Line: 190 ]] --[[ Name: Unlock ]]
    if v25.key ~= nil and v25.key ~= v26 then
        error((("[%*]: Invalid lock key"):format(script.Name)));
    end;
    v25.key = nil;
end;
return v15;