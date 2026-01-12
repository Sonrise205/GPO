return function(v0, v1, v2, ...) --[[ Line: 22 ]] --[[ Name: splice ]]
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
    for v5 = 1, v1 - 1 do
        table.insert(v4, v0[v5]);
    end;
    for _, v7 in ipairs({
        ...
    }) do
        table.insert(v4, v7);
    end;
    for v8 = v2 + 1, v3 do
        table.insert(v4, v0[v8]);
    end;
    return v4;
end;