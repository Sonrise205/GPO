return function(v0, v1) --[[ Line: 20 ]] --[[ Name: fromArrays ]]
    local v2 = #v0;
    local v3 = {};
    for v4 = 1, v2 do
        v3[v0[v4]] = v1[v4];
    end;
    return v3;
end;