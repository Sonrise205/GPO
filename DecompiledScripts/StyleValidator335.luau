return function(v0, ...) --[[ Line: 3 ]]
    local v1 = typeof(v0);
    local v2 = true;
    if v1 ~= "string" then
        v2 = v1 == "table";
    end;
    return v2, "Invalid style type. expected string or table, got " .. typeof(v0);
end;