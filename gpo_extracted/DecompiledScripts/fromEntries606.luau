return function(v0) --[[ Line: 17 ]] --[[ Name: fromEntries ]]
    local v1 = {};
    for _, v3 in ipairs(v0) do
        v1[v3[1]] = v3[2];
    end;
    return v1;
end;