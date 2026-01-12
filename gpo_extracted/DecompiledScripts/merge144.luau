return function(...) --[[ Line: 20 ]] --[[ Name: merge ]]
    local v0 = {};
    for v1 = 1, select("#", ...) do
        local v2 = select(v1, ...);
        if type(v2) == "table" then
            for v3, _ in pairs(v2) do
                v0[v3] = true;
            end;
        end;
    end;
    return v0;
end;