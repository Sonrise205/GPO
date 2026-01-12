return function(v0) --[[ Line: 20 ]] --[[ Name: fromArray ]]
    local v1 = table.create(#v0);
    for _, v3 in ipairs(v0) do
        v1[v3] = true;
    end;
    return v1;
end;