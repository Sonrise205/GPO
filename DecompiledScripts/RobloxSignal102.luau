local v0 = {};
v0.__index = v0;
v0.new = function() --[[ Line: 11 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    local v2 = {};
    l_BindableEvent_0.Event:Connect(function(_, v4) --[[ Line: 17 ]]
        -- upvalues: v2 (copy)
        v2[v4] = nil;
    end);
    return (setmetatable({
        _inst = l_BindableEvent_0, 
        _args = v2, 
        _event = l_BindableEvent_0.Event
    }, v0));
end;
v0.Connect = function(v5, v6) --[[ Line: 29 ]] --[[ Name: Connect ]]
    return v5._event:Connect(function(v7, v8) --[[ Line: 30 ]]
        -- upvalues: v6 (copy), v5 (copy)
        v6(unpack(v5._args[v8], 1, v7));
    end);
end;
v0.DisconnectAll = function(v9) --[[ Line: 35 ]] --[[ Name: DisconnectAll ]]
    v9._inst:Destroy();
    local l_BindableEvent_1 = Instance.new("BindableEvent");
    local v11 = {};
    l_BindableEvent_1.Event:Connect(function(_, v13) --[[ Line: 39 ]]
        -- upvalues: v11 (copy)
        v11[v13] = nil;
    end);
    v9._inst = l_BindableEvent_1;
    v9._args = v11;
    v9._event = l_BindableEvent_1.Event;
end;
v0.Fire = function(v14, ...) --[[ Line: 47 ]] --[[ Name: Fire ]]
    local v15 = {
        ...
    };
    local v16 = #v15;
    local function v17() --[[ Line: 51 ]]

    end;
    v14._args[v17] = v15;
    v14._inst:Fire(v16, v17);
end;
v0.Wait = function(v18) --[[ Line: 56 ]] --[[ Name: Wait ]]
    local v19, v20 = v18._event:Wait();
    return unpack(v18._args[v20], 1, v19);
end;
v0.Once = function(v21, v22) --[[ Line: 61 ]] --[[ Name: Once ]]
    return v21._event:ConnectOnce(function(v23, v24) --[[ Line: 62 ]]
        -- upvalues: v22 (copy), v21 (copy)
        v22(unpack(v21._args[v24], 1, v23));
    end);
end;
return v0;