local v24 = {
    union = function(v0, v1) --[[ Line: 15 ]] --[[ Name: union ]]
        local v2 = {};
        for v3, _ in pairs(v0) do
            v2[v3] = true;
        end;
        for v5, _ in pairs(v1) do
            v2[v5] = true;
        end;
        return v2;
    end, 
    unionUpdate = function(v7, v8) --[[ Line: 32 ]] --[[ Name: unionUpdate ]]
        for v9, _ in pairs(v8) do
            v7[v9] = true;
        end;
    end, 
    intersection = function(v11, v12) --[[ Line: 44 ]] --[[ Name: intersection ]]
        local v13 = {};
        for v14, _ in pairs(v11) do
            if v12[v14] ~= nil then
                v13[v14] = true;
            end;
        end;
        return v13;
    end, 
    copy = function(v16) --[[ Line: 59 ]] --[[ Name: copy ]]
        local v17 = {};
        for v18, _ in pairs(v16) do
            v17[v18] = true;
        end;
        return v17;
    end, 
    fromTableValue = function(v20) --[[ Line: 72 ]] --[[ Name: fromTableValue ]]
        local v21 = {};
        for _, v23 in pairs(v20) do
            v21[v23] = true;
        end;
        return v21;
    end
};
v24.fromList = v24.fromTableValue;
v24.toList = function(v25) --[[ Line: 96 ]] --[[ Name: toList ]]
    local v26 = {};
    for v27, _ in pairs(v25) do
        table.insert(v26, v27);
    end;
    return v26;
end;
v24.differenceUpdate = function(v29, v30) --[[ Line: 112 ]] --[[ Name: differenceUpdate ]]
    for v31, _ in pairs(v30) do
        v29[v31] = nil;
    end;
end;
v24.difference = function(v33, v34) --[[ Line: 124 ]] --[[ Name: difference ]]
    local v35 = {};
    for v36, _ in pairs(v33) do
        v35[v36] = true;
    end;
    for v38, _ in pairs(v34) do
        v35[v38] = nil;
    end;
    return v35;
end;
return v24;