local v0 = nil;
local function v3(v1, ...) --[[ Line: 42 ]] --[[ Name: AcquireRunnerThreadAndCallEventHandler ]]
    -- upvalues: v0 (ref)
    local l_v0_0 = v0;
    v0 = nil;
    v1(...);
    v0 = l_v0_0;
end;
local function v4(...) --[[ Line: 50 ]] --[[ Name: RunEventHandlerInFreeThread ]]
    -- upvalues: v3 (copy)
    v3(...);
    while true do
        v3(coroutine.yield());
    end;
end;
local v5 = {};
v5.__index = v5;
local v6 = {};
v6.__index = v6;
v5.Disconnect = function(v7) --[[ Line: 77 ]] --[[ Name: Disconnect ]]
    if v7.IsConnected == false then
        return;
    else
        local l_signal_0 = v7.signal;
        v7.IsConnected = false;
        if l_signal_0.head == v7 then
            l_signal_0.head = v7.next;
            return;
        else
            local l_head_0 = l_signal_0.head;
            while l_head_0 ~= nil and l_head_0.next ~= v7 do
                l_head_0 = l_head_0.next;
            end;
            if l_head_0 ~= nil then
                l_head_0.next = v7.next;
            end;
            return;
        end;
    end;
end;
v6.New = function() --[[ Line: 100 ]] --[[ Name: New ]]
    -- upvalues: v6 (copy)
    local v10 = {
        head = nil
    };
    setmetatable(v10, v6);
    return v10;
end;
v6.Connect = function(v11, v12) --[[ Line: 111 ]] --[[ Name: Connect ]]
    -- upvalues: v5 (copy)
    if type(v12) ~= "function" then
        error((("[%*]: \"listener\" must be a function; Received %*"):format(script.Name, (typeof(v12)))));
    end;
    local v13 = {
        listener = v12, 
        signal = v11, 
        next = v11.head, 
        IsConnected = true
    };
    setmetatable(v13, v5);
    v11.head = v13;
    return v13;
end;
v6.Fire = function(v14, ...) --[[ Line: 131 ]] --[[ Name: Fire ]]
    -- upvalues: v0 (ref), v4 (copy)
    local l_head_1 = v14.head;
    while l_head_1 ~= nil do
        if l_head_1.IsConnected == true then
            if not v0 then
                v0 = coroutine.create(v4);
            end;
            task.spawn(v0, l_head_1.listener, ...);
        end;
        l_head_1 = l_head_1.next;
    end;
end;
v6.Wait = function(v16) --[[ Line: 144 ]] --[[ Name: Wait ]]
    local v17 = coroutine.running();
    local v18 = nil;
    v18 = v16:Connect(function(...) --[[ Line: 147 ]]
        -- upvalues: v18 (ref), v17 (copy)
        v18:Disconnect();
        task.spawn(v17, ...);
    end);
    return coroutine.yield();
end;
v6.FireUntil = function(v19, v20, ...) --[[ Line: 154 ]] --[[ Name: FireUntil ]]
    if type(v20) ~= "function" then
        error((("[%*]: \"continue_callback\" must be a function; Received %*"):format(script.Name, (typeof(v20)))));
    end;
    local v21 = {};
    local v22 = table.pack(...);
    local l_head_2 = v19.head;
    while l_head_2 ~= nil do
        table.insert(v21, l_head_2);
        l_head_2 = l_head_2.next;
    end;
    task.spawn(function() --[[ Line: 169 ]]
        -- upvalues: v21 (copy), v22 (copy), v20 (copy)
        for _, v25 in ipairs(v21) do
            if v25.IsConnected == true then
                v25.listener(table.unpack(v22));
                if v20() ~= true then
                    return;
                end;
            end;
        end;
    end);
end;
return table.freeze({
    New = v6.New
});