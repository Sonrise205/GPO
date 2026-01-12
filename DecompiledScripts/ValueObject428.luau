local v0 = require(script.Parent.loader).load(script);
local v1 = v0("Signal");
local v2 = v0("Maid");
local v3 = v0("Observable");
local v4 = {
    ClassName = "ValueObject"
};
v4.new = function(v5) --[[ Line: 21 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), v1 (copy), v4 (copy)
    local v6 = {};
    rawset(v6, "_value", v5);
    v6._maid = v2.new();
    v6.Changed = v1.new();
    v6._maid:GiveTask(v6.Changed);
    return (setmetatable(v6, v4));
end;
v4.fromObservable = function(v7) --[[ Line: 44 ]] --[[ Name: fromObservable ]]
    -- upvalues: v4 (copy)
    local v8 = v4.new();
    v8._maid:GiveTask(v7:Subscribe(function(v9) --[[ Line: 47 ]]
        -- upvalues: v8 (copy)
        v8.Value = v9;
    end));
    return v8;
end;
v4.isValueObject = function(v10) --[[ Line: 59 ]] --[[ Name: isValueObject ]]
    -- upvalues: v4 (copy)
    local v11 = false;
    if type(v10) == "table" then
        v11 = getmetatable(v10) == v4;
    end;
    return v11;
end;
v4.Observe = function(v12) --[[ Line: 67 ]] --[[ Name: Observe ]]
    -- upvalues: v3 (copy), v2 (copy)
    return v3.new(function(v13) --[[ Line: 68 ]]
        -- upvalues: v12 (copy), v2 (ref)
        if not v12.Destroy then
            warn("[ValueObject.observeValue] - Connecting to dead ValueObject");
            v13:Complete();
            return;
        else
            local v14 = v2.new();
            v14:GiveTask(v12.Changed:Connect(function() --[[ Line: 78 ]]
                -- upvalues: v13 (copy), v12 (ref)
                v13:Fire(v12.Value);
            end));
            v13:Fire(v12.Value);
            return v14;
        end;
    end);
end;
v4.__index = function(v15, v16) --[[ Line: 94 ]] --[[ Name: __index ]]
    -- upvalues: v4 (copy)
    if v16 == "Value" then
        return v15._value;
    elseif v4[v16] then
        return v4[v16];
    elseif v16 == "_value" then
        return nil;
    else
        error(("%q is not a member of ValueObject"):format((tostring(v16))));
        return;
    end;
end;
v4.__newindex = function(v17, v18, v19) --[[ Line: 106 ]] --[[ Name: __newindex ]]
    -- upvalues: v2 (copy)
    if v18 == "Value" then
        local v20 = rawget(v17, "_value");
        if v20 ~= v19 then
            rawset(v17, "_value", v19);
            local v21 = v2.new();
            v17.Changed:Fire(v19, v20, v21);
            v17._maid._valueMaid = v21;
            return;
        end;
    else
        error(("%q is not a member of ValueObject"):format((tostring(v18))));
    end;
end;
v4.Destroy = function(v22) --[[ Line: 128 ]] --[[ Name: Destroy ]]
    rawset(v22, "_value", nil);
    v22._maid:DoCleaning();
    setmetatable(v22, nil);
end;
return v4;