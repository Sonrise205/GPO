return function(v0, v1) --[[ Line: 20 ]] --[[ Name: shift ]]
    local v2 = #v0;
    local v3 = {};
    v1 = if type(v1) == "number" then v1 + 1 else 2;
    for v4 = v1, v2 do
        table.insert(v3, v0[v4]);
    end;
    return v3;
end;