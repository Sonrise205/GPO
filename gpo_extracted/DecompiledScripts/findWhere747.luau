return function(v0, v1, v2) --[[ Line: 21 ]] --[[ Name: findWhere ]]
    local v3 = #v0;
    if type(v2) == "number" then
        if v2 < 1 then
            v2 = v3 + v2;
        end;
    else
        v2 = 1;
    end;
    for v4 = v2, #v0 do
        if v1(v0[v4], v4, v0) then
            return v4;
        end;
    end;
end;