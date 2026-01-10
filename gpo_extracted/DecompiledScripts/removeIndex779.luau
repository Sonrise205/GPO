return function(v0, v1) --[[ Line: 19 ]] --[[ Name: removeIndex ]]
    local v2 = #v0;
    local v3 = {};
    if v1 < 1 then
        v1 = v1 + v2;
    end;
    for v4, v5 in ipairs(v0) do
        if v4 ~= v1 then
            table.insert(v3, v5);
        end;
    end;
    return v3;
end;