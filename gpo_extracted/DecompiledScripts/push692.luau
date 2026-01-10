return function(v0, ...) --[[ Line: 22 ]] --[[ Name: push ]]
    local v1 = {};
    for _, v3 in ipairs(v0) do
        table.insert(v1, v3);
    end;
    for _, v5 in ipairs({
        ...
    }) do
        table.insert(v1, v5);
    end;
    return v1;
end;