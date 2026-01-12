return function(v0, ...) --[[ Line: 22 ]] --[[ Name: unshift ]]
    local v1 = {
        ...
    };
    for _, v3 in ipairs(v0) do
        table.insert(v1, v3);
    end;
    return v1;
end;