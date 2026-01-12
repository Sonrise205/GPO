return function(v0, v1) --[[ Line: 19 ]] --[[ Name: removeValue ]]
    local v2 = {};
    for v3, v4 in pairs(v0) do
        if v4 ~= v1 then
            v2[v3] = v4;
        end;
    end;
    return v2;
end;