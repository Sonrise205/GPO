local v0 = {};
v0.__index = v0;
v0.__type = "Cuboid";
v0.__newindex = function(_, v2) --[[ Line: 4 ]] --[[ Name: __newindex ]]
    error(tostring(v2) .. " cannot be assigned to");
end;
v0.__tostring = function(v3) --[[ Line: 7 ]] --[[ Name: __tostring ]]
    return tostring(v3.Min) .. ", " .. tostring(v3.Max);
end;
v0.new = function(...) --[[ Line: 12 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v4, v5 = ...;
    if select("#", ...) == 1 then
        error("Invalid number of arguments: 1");
    else
        local v6 = typeof(v4);
        local v7 = typeof(v5);
        if v6 ~= "nil" and v7 ~= "nil" then
            if v6 ~= "Vector3" then
                error("invalid argument #1 to 'new' (Vector3 expected, got " .. v6 .. ")");
            elseif v7 ~= "Vector3" then
                error("invalid argument #2 to 'new' (Vector3 expected, got " .. v7 .. ")");
            end;
        end;
    end;
    v4 = v4 or Vector3.new(0, 0, 0, 0);
    v5 = v5 or Vector3.new(0, 0, 0, 0);
    local l_X_0 = v4.X;
    local l_Y_0 = v4.Y;
    local l_Z_0 = v4.Z;
    local l_X_1 = v5.X;
    local l_Y_1 = v5.Y;
    local l_Z_1 = v5.Z;
    return (setmetatable({
        Min = Vector3.new(l_X_0 < l_X_1 and l_X_0 or l_X_1, l_Y_0 < l_Y_1 and l_Y_0 or l_Y_1, l_Z_0 < l_Z_1 and l_Z_0 or l_Z_1), 
        Max = Vector3.new(l_X_1 < l_X_0 and l_X_0 or l_X_1, l_Y_1 < l_Y_0 and l_Y_0 or l_Y_1, l_Z_1 < l_Z_0 and l_Z_0 or l_Z_1)
    }, v0));
end;
return v0;