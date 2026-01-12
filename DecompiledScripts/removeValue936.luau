return function(v0, v1) --[[ Line: 18 ]] --[[ Name: removeValue ]]
    local v2 = {};
    for _, v4 in ipairs(v0) do
        if v4 ~= v1 then
            table.insert(v2, v4);
        end;
    end;
    return v2;
end;