return function(v0, v1) --[[ Line: 20 ]] --[[ Name: map ]]
    local v2 = {};
    for v3, v4 in ipairs(v0) do
        local v5 = v1(v4, v3, v0);
        if v5 ~= nil then
            table.insert(v2, v5);
        end;
    end;
    return v2;
end;