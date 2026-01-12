return function(v0, v1, v2) --[[ Line: 27 ]] --[[ Name: reduce ]]
    local l_v2_0 = v2;
    local v4 = 1;
    if not l_v2_0 then
        l_v2_0 = v0[1];
        v4 = 2;
    end;
    for v5 = v4, #v0 do
        l_v2_0 = v1(l_v2_0, v0[v5], v5, v0);
    end;
    return l_v2_0;
end;