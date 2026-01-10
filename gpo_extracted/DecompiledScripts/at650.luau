return function(v0, v1) --[[ Line: 19 ]] --[[ Name: at ]]
    local v2 = #v0;
    if v1 < 1 then
        v1 = v1 + v2;
    end;
    return v0[v1];
end;