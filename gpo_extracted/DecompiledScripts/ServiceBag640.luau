local v0 = require(script.Parent.loader).load(script);
local v1 = v0("Signal");
local v2 = v0("BaseObject");
local v3 = setmetatable({}, v2);
v3.ClassName = "ServiceBag";
v3.__index = v3;
v3.new = function(v4) --[[ Line: 53 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), v3 (copy), v1 (copy)
    local v5 = setmetatable(v2.new(), v3);
    v5._services = {};
    v5._parentProvider = v4;
    v5._serviceTypesToInitializeSet = {};
    v5._initializedServiceTypeSet = {};
    v5._initializing = false;
    v5._serviceTypesToStart = {};
    v5._destroying = v1.new();
    v5._maid:GiveTask(v5._destroying);
    return v5;
end;
v3.isServiceBag = function(v6) --[[ Line: 77 ]] --[[ Name: isServiceBag ]]
    local v7 = false;
    if type(v6) == "table" then
        v7 = v6.ClassName == "ServiceBag";
    end;
    return v7;
end;
v3.GetService = function(v8, v9) --[[ Line: 89 ]] --[[ Name: GetService ]]
    -- upvalues: v0 (copy)
    if typeof(v9) == "Instance" then
        v9 = v0(v9);
    end;
    assert(type(v9) == "table", "Bad serviceType definition");
    if v8._services[v9] then
        v8:_ensureInitialization(v9);
        return v8._services[v9];
    elseif v8._parentProvider then
        return v8._parentProvider:GetService(v9);
    else
        v8:_addServiceType(v9);
        v8:_ensureInitialization(v9);
        return v8._services[v9];
    end;
end;
v3.HasService = function(v10, v11) --[[ Line: 117 ]] --[[ Name: HasService ]]
    -- upvalues: v0 (copy)
    if typeof(v11) == "Instance" then
        v11 = v0(v11);
    end;
    if v10._services[v11] then
        return true;
    else
        return false;
    end;
end;
v3.Init = function(v12) --[[ Line: 133 ]] --[[ Name: Init ]]
    assert(not v12._initializing, "Already initializing");
    assert(v12._serviceTypesToInitializeSet, "Already initialized");
    v12._initializing = true;
    while next(v12._serviceTypesToInitializeSet) do
        local v13 = next(v12._serviceTypesToInitializeSet);
        v12._serviceTypesToInitializeSet[v13] = nil;
        v12:_ensureInitialization(v13);
    end;
    v12._serviceTypesToInitializeSet = nil;
    v12._initializing = false;
end;
v3.Start = function(v14) --[[ Line: 152 ]] --[[ Name: Start ]]
    assert(v14._serviceTypesToStart, "Already started");
    assert(not v14._initializing, "Still initializing");
    while next(v14._serviceTypesToStart) do
        local v15 = table.remove(v14._serviceTypesToStart);
        local v16 = assert(v14._services[v15], "No service");
        if v16.Start then
            local v17 = nil;
            do
                local l_v17_0 = v17;
                task.spawn(function() --[[ Line: 162 ]]
                    -- upvalues: l_v17_0 (ref), v16 (copy)
                    l_v17_0 = coroutine.running();
                    v16:Start();
                end);
                assert(coroutine.status(l_v17_0) == "dead", "Starting service yielded");
            end;
        end;
    end;
    v14._serviceTypesToStart = nil;
end;
v3.IsStarted = function(v19) --[[ Line: 178 ]] --[[ Name: IsStarted ]]
    return v19._serviceTypesToStart == nil;
end;
v3.CreateScope = function(v20) --[[ Line: 188 ]] --[[ Name: CreateScope ]]
    -- upvalues: v3 (copy)
    local v21 = v3.new(v20);
    v20:_addServiceType(v21);
    v20._maid[v21] = v21._destroying:Connect(function() --[[ Line: 194 ]]
        -- upvalues: v20 (copy), v21 (copy)
        v20._maid[v21] = nil;
        v20._services[v21] = nil;
    end);
    return v21;
end;
v3._addServiceType = function(v22, v23) --[[ Line: 203 ]] --[[ Name: _addServiceType ]]
    if not v22._serviceTypesToInitializeSet then
        error(("Already finished initializing, cannot add %q"):format((tostring(v23))));
        return;
    elseif v22._services[v23] then
        return;
    else
        local v24 = setmetatable({}, {
            __index = v23
        });
        v22._services[v23] = v24;
        v22:_ensureInitialization(v23);
        return;
    end;
end;
v3._ensureInitialization = function(v25, v26) --[[ Line: 221 ]] --[[ Name: _ensureInitialization ]]
    if v25._initializedServiceTypeSet[v26] then
        return;
    elseif v25._initializing then
        v25._serviceTypesToInitializeSet[v26] = nil;
        v25._initializedServiceTypeSet[v26] = true;
        v25:_initService(v26);
        return;
    elseif v25._serviceTypesToInitializeSet then
        v25._serviceTypesToInitializeSet[v26] = true;
        return;
    else
        error("[ServiceBag._ensureInitialization] - Cannot initialize past initializing phase ");
        return;
    end;
end;
v3._initService = function(v27, v28) --[[ Line: 237 ]] --[[ Name: _initService ]]
    local v29 = assert(v27._services[v28], "No service");
    if v29.Init then
        local v30 = nil;
        do
            local l_v30_0 = v30;
            task.spawn(function() --[[ Line: 242 ]]
                -- upvalues: l_v30_0 (ref), v29 (copy), v27 (copy)
                l_v30_0 = coroutine.running();
                v29:Init(v27);
            end);
            assert(coroutine.status(l_v30_0) == "dead", "Initializing service yielded");
        end;
    end;
    table.insert(v27._serviceTypesToStart, v28);
end;
v3.Destroy = function(v32) --[[ Line: 257 ]] --[[ Name: Destroy ]]
    -- upvalues: v3 (copy)
    local v33 = getmetatable(v3);
    v32._destroying:Fire();
    local l__services_0 = v32._services;
    local v35, v36 = next(l__services_0);
    while v36 ~= nil do
        l__services_0[v35] = nil;
        if v36.Destroy then
            v36:Destroy();
        end;
        local v37, v38 = next(l__services_0);
        v35 = v37;
        v36 = v38;
    end;
    v33.Destroy(v32);
end;
return v3;