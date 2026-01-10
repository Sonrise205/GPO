return function(v0, v1, ...) --[[ Line: 21 ]] --[[ Name: insert ]]
    local v2 = #v0;
    if v1 < 1 then
        v1 = v1 + (v2 + 1);
    end;
    if v2 < v1 then
        if v2 + 1 < v1 then
            return v0;
        else
            v1 = v2 + 1;
            v2 = v2 + 1;
        end;
    end;
    local v3 = {};
    for v4 = 1, v2 do
        if v4 == v1 then
            for _, v6 in ipairs({
                ...
            }) do
                table.insert(v3, v6);
            end;
        end;
        table.insert(v3, v0[v4]);
    end;
    return v3;
end;