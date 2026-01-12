local v0 = require(script.Parent.loader).load(script)("Promise");
return function(v1, v2, v3) --[[ Line: 20 ]]
    -- upvalues: v0 (copy)
    local l_v1_FirstChild_0 = v1:FindFirstChild(v2);
    if l_v1_FirstChild_0 then
        return v0.resolved(l_v1_FirstChild_0);
    else
        return v0.spawn(function(v5, v6) --[[ Line: 26 ]]
            -- upvalues: v1 (copy), v2 (copy), v3 (copy)
            local v7 = v1:WaitForChild(v2, v3);
            if v7 then
                v5(v7);
                return;
            else
                v6("Timed out");
                return;
            end;
        end);
    end;
end;