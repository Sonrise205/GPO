return function(v0) --[[ Line: 1 ]]
    local v1 = true;
    if v0 ~= "Default" then
        v1 = true;
        if v0 ~= "Accent" then
            v1 = true;
            if v0 ~= "Standard" then
                v1 = true;
                if v0 ~= "Primary" then
                    v1 = v0 == "Secondary";
                end;
            end;
        end;
    end;
    return v1, "Expected `Accent`, `Standard`, `Primary`, `Secondary` or `Default`";
end;