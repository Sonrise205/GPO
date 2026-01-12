local v0 = {
    Class = {}, 
    Item = {}
};
local v1 = {};
local v2 = {};
v1.__index = function(v3, v4) --[[ Line: 8 ]] --[[ Name: __index ]]
    -- upvalues: v1 (copy)
    local v5 = rawget(v1, v4);
    if not v5 then
        error(tostring(v4) .. " is not a valid member of \"" .. v3._MainParent.Name .. "." .. v3.Name .. "\"");
    end;
    return v5;
end;
v2.__index = function(v6, v7) --[[ Line: 17 ]] --[[ Name: __index ]]
    -- upvalues: v2 (copy)
    local v8 = rawget(v6._Items, v7) or rawget(v2, v7);
    if not v8 then
        error(tostring(v7) .. " is not a valid member of \"" .. v6.Name .. "\"");
    end;
    return v8;
end;
v2.__tostring = function(v9) --[[ Line: 25 ]] --[[ Name: __tostring ]]
    return (rawget(v9, "_MainParent") and v9._MainParent.Name .. "." or "") .. v9.Name;
end;
v1.IsA = function(v10, v11) --[[ Line: 29 ]] --[[ Name: IsA ]]
    if typeof(v11) == "table" and v11.Type == "EnumClass" then
        v11 = v11.Name;
    end;
    assert(typeof(v11) == "string", "invalid argument #2 to 'IsA' (string expected, got " .. typeof(v11) .. ")");
    for v12, v13 in next, v10._Parents do
        if v12 == v11 or v13:IsA(v11) then
            return true;
        end;
    end;
    return v10._Parents[v11] ~= nil;
end;
v1.GetFullName = function(v14) --[[ Line: 42 ]] --[[ Name: GetFullName ]]
    local l_Name_0 = v14.Name;
    local v16 = rawget(v14, "_MainParent");
    while v16 do
        l_Name_0 = v16.Name .. "." .. l_Name_0;
        v16 = rawget(v16, "_MainParent");
    end;
    return l_Name_0;
end;
v1.__tostring = v1.GetFullName;
v2.GetEnumItems = function(v17) --[[ Line: 54 ]] --[[ Name: GetEnumItems ]]
    return v17._Items;
end;
v2.IsA = function(v18, v19) --[[ Line: 57 ]] --[[ Name: IsA ]]
    if typeof(v19) == "table" and v19.Type == "EnumClass" then
        v19 = v19.Name;
    end;
    assert(typeof(v19) == "string", "invalid argument #2 to 'IsA' (string expected, got " .. typeof(v19) .. ")");
    for v20, v21 in next, v18._Parents do
        if v20 == v19 or v21:IsA(v19) then
            return true;
        end;
    end;
    return v18._Parents[v19] ~= nil;
end;
v2.AddItem = function(v22, v23) --[[ Line: 70 ]] --[[ Name: AddItem ]]
    assert(type(v23) == "table", "invalid argument #1 to 'AddItem' (EnumItem or EnumClass expected, got " .. typeof(v23) .. ")");
    local v24 = true;
    if v23.Type ~= "EnumItem" then
        v24 = v23.Type == "EnumClass";
    end;
    assert(v24, "invalid argument #1 to 'AddItem' (EnumItem or EnumClass expected, got " .. typeof(v23) .. ")");
    v22._Items[v23.Name] = v23;
    v23._Parents[v22.Name] = v22;
    if rawget(v23, "_MainParent") == nil then
        v23._MainParent = v22;
    end;
end;
v2.GetFullName = function(v25) --[[ Line: 80 ]] --[[ Name: GetFullName ]]
    local l_Name_1 = v25.Name;
    local v27 = rawget(v25, "_MainParent");
    while v27 do
        l_Name_1 = v27.Name .. "." .. l_Name_1;
        v27 = rawget(v27, "_MainParent");
    end;
    return l_Name_1;
end;
v2.__tostring = v2.GetFullName;
v0.Item.new = function(v28, v29) --[[ Line: 92 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy)
    local v30 = false;
    if type(v28) == "table" then
        v30 = v28.Type == "EnumClass";
    end;
    assert(v30, "invalid argument #1 to 'EnumItem.new' (EnumClass expected, got " .. typeof(v28) .. ")");
    assert(type(v29) == "string", "invalid argument #2 to EnumItem.new (string expected, got " .. typeof(v29) .. ")");
    local v31 = setmetatable({
        Name = v29, 
        Type = "EnumItem", 
        _Parents = {}, 
        _MainParent = v28
    }, v1);
    v28:AddItem(v31);
    return v31;
end;
v0.Class.new = function(v32, v33) --[[ Line: 106 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v34 = setmetatable({
        Name = v32, 
        Type = "EnumClass", 
        _Items = {}, 
        _Parents = {}, 
        _MainParent = nil
    }, v2);
    if v33 ~= nil then
        assert(type(v33) == "table", "invalid argument #2 to EnumClass.new (table expected, got " .. type(v33) .. ")");
        for _, v36 in next, v33 do
            if typeof(v36) == "string" then
                v0.Item.new(v34, v36);
            elseif typeof(v36) == "table" and (v36.Type == "EnumItem" or v36.Type == "EnumClass") then
                v34:AddItem(v36);
            end;
        end;
    end;
    return v34;
end;
return v0;