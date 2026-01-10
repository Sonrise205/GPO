return function(v0, v1) --[[ Line: 24 ]] --[[ Name: some ]]
    for v2, v3 in ipairs(v0) do
        if v1(v3, v2, v0) then
            return true;
        end;
    end;
    return false;
end;