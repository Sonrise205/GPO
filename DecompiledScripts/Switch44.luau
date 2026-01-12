return function(v0) --[[ Line: 1 ]]
    return function(v1) --[[ Line: 2 ]]
        -- upvalues: v0 (copy)
        local v2 = false;
        local v3 = nil;
        for v4, v5 in pairs(v1) do
            if not v2 then
                if type(v4) == "table" then
                    for _, v7 in ipairs(v4) do
                        if v7 == v0 then
                            v2 = true;
                            v3 = v5;
                            break;
                        end;
                    end;
                elseif v4 == v0 then
                    v2 = true;
                    v3 = v5;
                    break;
                end;
            else
                break;
            end;
        end;
        if not v2 then
            v3 = v1.default;
        end;
        if v3 then
            if type(v3) == "function" then
                return (v3());
            else
                return v3;
            end;
        else
            return;
        end;
    end;
end;