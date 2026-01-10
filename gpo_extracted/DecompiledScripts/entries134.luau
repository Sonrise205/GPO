return function(v0) --[[ Line: 17 ]] --[[ Name: entries ]]
    local v1 = {};
    for v2, v3 in pairs(v0) do
        table.insert(v1, {
            v2, 
            v3
        });
    end;
    return v1;
end;