local v0 = {
    ClassName = "Loader"
};
v0.__index = v0;
v0.new = function(v1) --[[ Line: 12 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({
        _script = v1
    }, v0));
end;
local function v4(v2) --[[ Line: 18 ]] --[[ Name: waitForValue ]]
    local l_Value_0 = v2.Value;
    if l_Value_0 then
        return l_Value_0;
    else
        return v2.Changed:Wait();
    end;
end;
v0.__call = function(v5, v6) --[[ Line: 27 ]] --[[ Name: __call ]]
    -- upvalues: v4 (copy)
    if type(v6) == "string" then
        local v7 = v5._script.Parent[v6];
        if v7:IsA("ObjectValue") then
            return require(v4(v7));
        else
            return require(v7);
        end;
    else
        return require(v6);
    end;
end;
v0.__index = function(v8, v9) --[[ Line: 40 ]] --[[ Name: __index ]]
    -- upvalues: v4 (copy)
    if type(v9) == "string" then
        local v10 = v8._script.Parent[v9];
        if v10:IsA("ObjectValue") then
            return require(v4(v10));
        else
            return require(v10);
        end;
    else
        return require(v9);
    end;
end;
return v0;