return function(...) --[[ Line: 20 ]] --[[ Name: intersection ]]
    local v0 = select("#", ...);
    local v1 = select(1, ...);
    local v2 = {};
    for v3, _ in pairs(v1) do
        local v5 = true;
        for v6 = 2, v0 do
            if select(v6, ...)[v3] ~= true then
                v5 = false;
                break;
            end;
        end;
        if v5 then
            v2[v3] = true;
        end;
    end;
    return v2;
end;