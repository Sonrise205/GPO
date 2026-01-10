return function(v0, v1, v2) --[[ Line: 25 ]] --[[ Name: find ]]
    local v3 = #v0;
    if type(v2) == "number" then
        if v2 < 1 then
            v2 = v3 + v2;
        end;
    else
        v2 = 1;
    end;
    return table.find(v0, v1, v2);
end;