return function(v0, v1, v2) --[[ Line: 20 ]] --[[ Name: set ]]
    local v3 = #v0;
    local v4 = {};
    if v1 < 1 then
        v1 = v1 + v3;
    end;
    for v5, v6 in ipairs(v0) do
        if v5 == v1 then
            table.insert(v4, v2);
        else
            table.insert(v4, v6);
        end;
    end;
    return v4;
end;