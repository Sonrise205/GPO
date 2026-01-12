return function(v0, v1) --[[ Line: 19 ]] --[[ Name: includes ]]
    for _, v3 in pairs(v0) do
        if v3 == v1 then
            return true;
        end;
    end;
    return false;
end;