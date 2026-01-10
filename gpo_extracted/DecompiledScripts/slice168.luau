return function(v0, v1, v2) --[[ Line: 21 ]] --[[ Name: slice ]]
    local v3 = #v0;
    local v4 = {};
    if type(v1) ~= "number" then
        v1 = 1;
    end;
    if type(v2) ~= "number" then
        v2 = v3;
    end;
    if v1 < 1 then
        v1 = v1 + v3;
    end;
    if v2 < 1 then
        v2 = v2 + v3;
    end;
    for v5 = v1, v2 do
        table.insert(v4, v0[v5]);
    end;
    return v4;
end;