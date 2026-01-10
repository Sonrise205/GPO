return function(v0, v1) --[[ Line: 19 ]] --[[ Name: isSubset ]]
    for v2, v3 in pairs(v0) do
        if v1[v2] ~= v3 then
            return false;
        end;
    end;
    return true;
end;