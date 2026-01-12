return function(v0, v1) --[[ Line: 20 ]] --[[ Name: map ]]
    local v2 = {};
    for v3, _ in pairs(v0) do
        local v5 = v1(v3, v0);
        if v5 ~= nil then
            v2[v5] = true;
        end;
    end;
    return v2;
end;