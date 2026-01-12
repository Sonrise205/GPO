return function(v0, v1) --[[ Line: 20 ]] --[[ Name: pop ]]
    local v2 = #v0;
    local v3 = {};
    if type(v1) ~= "number" then
        v1 = 1;
    end;
    for v4 = 1, v2 - v1 do
        table.insert(v3, v0[v4]);
    end;
    return v3;
end;