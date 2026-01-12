local v0 = require(script.Parent.loader).load(script)("RxAttributeUtils");
local v1 = {
    ClassName = "AttributeValue"
};
v1.__index = v1;
v1.new = function(v2, v3, v4) --[[ Line: 37 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy)
    assert(typeof(v2) == "Instance", "Bad object");
    assert(type(v3) == "string", "Bad attributeName");
    local v5 = {
        _object = v2, 
        _attributeName = v3, 
        _defaultValue = v4
    };
    if v4 ~= nil and v5._object:GetAttribute(v5._attributeName) == nil then
        v5._object:SetAttribute(rawget(v5, "_attributeName"), v4);
    end;
    return (setmetatable(v5, v1));
end;
v1.Observe = function(v6) --[[ Line: 58 ]] --[[ Name: Observe ]]
    -- upvalues: v0 (copy)
    return v0.observeAttribute(v6._object, v6._attributeName, (rawget(v6, "_defaultValue")));
end;
v1.__index = function(v7, v8) --[[ Line: 75 ]] --[[ Name: __index ]]
    -- upvalues: v1 (copy)
    if v8 == "Value" then
        local l_Attribute_0 = v7._object:GetAttribute((rawget(v7, "_attributeName")));
        local v10 = rawget(v7, "_defaultValue");
        if l_Attribute_0 == nil then
            return v10;
        else
            return l_Attribute_0;
        end;
    elseif v8 == "Changed" then
        return v7._object:GetAttributeChangedSignal(v7._attributeName);
    elseif v1[v8] then
        return v1[v8];
    else
        error(("%q is not a member of AttributeValue"):format((tostring(v8))));
        return;
    end;
end;
v1.__newindex = function(v11, v12, v13) --[[ Line: 93 ]] --[[ Name: __newindex ]]
    if v12 == "Value" then
        v11._object:SetAttribute(rawget(v11, "_attributeName"), v13);
        return;
    else
        error(("%q is not a member of AttributeValue"):format((tostring(v12))));
        return;
    end;
end;
return v1;