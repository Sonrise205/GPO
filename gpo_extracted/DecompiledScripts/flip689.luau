return function(v0) --[[ Line: 17 ]] --[[ Name: flip ]]
    local v1 = {};
    for v2, v3 in pairs(v0) do
        v1[v3] = v2;
    end;
    return v1;
end;