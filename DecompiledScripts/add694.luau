return function(v0, ...) --[[ Line: 18 ]] --[[ Name: add ]]
    local v1 = {};
    for v2, _ in pairs(v0) do
        v1[v2] = true;
    end;
    for _, v5 in ipairs({
        ...
    }) do
        v1[v5] = true;
    end;
    return v1;
end;