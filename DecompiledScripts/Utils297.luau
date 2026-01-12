local v0 = {};
local function v3(_, v2) --[[ Line: 8 ]] --[[ Name: errorOnIndex ]]
    error(("Bad index %q"):format((tostring(v2))), 2);
end;
local v4 = {
    __index = v3, 
    __newindex = v3
};
v0.readonly = function(v5) --[[ Line: 17 ]] --[[ Name: readonly ]]
    -- upvalues: v4 (copy)
    return (setmetatable(v5, v4));
end;
v0.copyTable = function(v6) --[[ Line: 21 ]] --[[ Name: copyTable ]]
    local v7 = {};
    for v8, v9 in pairs(v6) do
        v7[v8] = v9;
    end;
    return v7;
end;
v0.count = function(v10) --[[ Line: 29 ]] --[[ Name: count ]]
    local v11 = 0;
    for _, _ in pairs(v10) do
        v11 = v11 + 1;
    end;
    return v11;
end;
v0.getOrCreateValue = function(v14, v15, v16, v17) --[[ Line: 37 ]] --[[ Name: getOrCreateValue ]]
    assert(typeof(v14) == "Instance", "Bad argument 'parent'");
    assert(type(v15) == "string", "Bad argument 'instanceType'");
    assert(type(v16) == "string", "Bad argument 'name'");
    local l_v14_FirstChild_0 = v14:FindFirstChild(v16);
    if l_v14_FirstChild_0 then
        if not l_v14_FirstChild_0:IsA(v15) then
            warn(("[Utils.getOrCreateValue] - Value of type %q of name %q is of type %q in %s instead"):format(v15, v16, l_v14_FirstChild_0.ClassName, l_v14_FirstChild_0:GetFullName()));
        end;
        return l_v14_FirstChild_0;
    else
        local v19 = Instance.new(v15);
        v19.Name = v16;
        v19.Value = v17;
        v19.Parent = v14;
        return v19;
    end;
end;
v0.getValue = function(v20, v21, v22, v23) --[[ Line: 60 ]] --[[ Name: getValue ]]
    assert(typeof(v20) == "Instance", "Bad argument 'parent'");
    assert(type(v21) == "string", "Bad argument 'instanceType'");
    assert(type(v22) == "string", "Bad argument 'name'");
    local l_v20_FirstChild_0 = v20:FindFirstChild(v22);
    if l_v20_FirstChild_0 then
        if l_v20_FirstChild_0:IsA(v21) then
            return l_v20_FirstChild_0.Value;
        else
            warn(("[Utils.getValue] - Value of type %q of name %q is of type %q in %s instead"):format(v21, v22, l_v20_FirstChild_0.ClassName, l_v20_FirstChild_0:GetFullName()));
            return nil;
        end;
    else
        return v23;
    end;
end;
v0.setValue = function(v25, v26, v27, v28) --[[ Line: 79 ]] --[[ Name: setValue ]]
    assert(typeof(v25) == "Instance", "Bad argument 'parent'");
    assert(type(v26) == "string", "Bad argument 'instanceType'");
    assert(type(v27) == "string", "Bad argument 'name'");
    local l_v25_FirstChild_0 = v25:FindFirstChild(v27);
    if l_v25_FirstChild_0 then
        if not l_v25_FirstChild_0:IsA(v26) then
            warn(("[Utils.setValue] - Value of type %q of name %q is of type %q in %s instead"):format(v26, v27, l_v25_FirstChild_0.ClassName, l_v25_FirstChild_0:GetFullName()));
        end;
        l_v25_FirstChild_0.Value = v28;
        return;
    else
        local v30 = Instance.new(v26);
        v30.Name = v27;
        v30.Value = v28;
        v30.Parent = v25;
        return;
    end;
end;
v0.getOrCreateFolder = function(v31, v32) --[[ Line: 101 ]] --[[ Name: getOrCreateFolder ]]
    local l_v31_FirstChild_0 = v31:FindFirstChild(v32);
    if l_v31_FirstChild_0 then
        return l_v31_FirstChild_0;
    else
        local l_Folder_0 = Instance.new("Folder");
        l_Folder_0.Name = v32;
        l_Folder_0.Parent = v31;
        return l_Folder_0;
    end;
end;
return v0;