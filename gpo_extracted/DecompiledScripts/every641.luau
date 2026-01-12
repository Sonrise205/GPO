return function(v0, v1) --[[ Line: 24 ]] --[[ Name: every ]]
    for v2, v3 in pairs(v0) do
        if not v1(v3, v2, v0) then
            return false;
        end;
    end;
    return true;
end;