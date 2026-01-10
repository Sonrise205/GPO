return {
    ShallowCopy = function(_, v1) --[[ Line: 3 ]] --[[ Name: ShallowCopy ]]
        local v2 = {};
        for v3, v4 in pairs(v1) do
            v2[v3] = v4;
        end;
        return v2;
    end, 
    DeepCopy = function(v5, v6) --[[ Line: 11 ]] --[[ Name: DeepCopy ]]
        local v7 = {};
        for v8, v9 in pairs(v6) do
            if type(v9) == "table" then
                v9 = v5:DeepCopy(v9);
            end;
            v7[v8] = v9;
        end;
        return v7;
    end
};