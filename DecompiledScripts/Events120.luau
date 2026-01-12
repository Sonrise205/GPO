local v0 = {};
local v1 = {};
v0.CreateBindableEvent = function(v2) --[[ Line: 4 ]] --[[ Name: CreateBindableEvent ]]
    -- upvalues: v1 (copy)
    if v1[v2] then
        v1[v2]:Fire();
        return;
    else
        local l_BindableEvent_0 = Instance.new("BindableEvent");
        l_BindableEvent_0.Parent = script;
        l_BindableEvent_0.Name = tostring(v2);
        v1[v2] = l_BindableEvent_0;
        l_BindableEvent_0:Fire();
        return;
    end;
end;
v0.ReturnBindableEvent = function(v4) --[[ Line: 13 ]] --[[ Name: ReturnBindableEvent ]]
    -- upvalues: v1 (copy)
    return v1[v4];
end;
v0.FireBindableEvent = function(v5) --[[ Line: 18 ]] --[[ Name: FireBindableEvent ]]
    -- upvalues: v1 (copy)
    v1[v5]:Fire();
end;
v0.RemoveEvent = function(v6) --[[ Line: 22 ]] --[[ Name: RemoveEvent ]]
    -- upvalues: v1 (copy)
    v1[v6]:Destroy();
    v1[v6] = nil;
end;
return v0;