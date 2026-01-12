return function(v0, v1, v2) --[[ Line: 20 ]] --[[ Name: findLast ]]
    local v3 = #v0;
    if type(v2) == "number" then
        if v2 < 1 then
            v2 = v3 + v2;
        end;
    else
        v2 = v3;
    end;
    for v4 = v2, 1, -1 do
        if v0[v4] == v1 then
            return v4;
        end;
    end;
end;