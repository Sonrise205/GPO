local v0 = require(script.Parent.copy);
return function(v1) --[[ Line: 19 ]] --[[ Name: shuffle ]]
    -- upvalues: v0 (copy)
    local v2 = Random.new(os.time() * #v1);
    local v3 = v0(v1);
    for v4 = #v3, 1, -1 do
        local v5 = v2:NextInteger(1, v4);
        local v6 = v3[v4];
        v3[v4] = v3[v5];
        v3[v5] = v6;
    end;
    return v3;
end;