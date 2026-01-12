return function(v0) --[[ Line: 17 ]] --[[ Name: reverse ]]
    local v1 = {};
    for v2 = #v0, 1, -1 do
        table.insert(v1, v0[v2]);
    end;
    return v1;
end;