local v41 = {
    append = function(v0, v1) --[[ Line: 15 ]] --[[ Name: append ]]
        for _, v3 in pairs(v1) do
            v0[#v0 + 1] = v3;
        end;
        return v0;
    end, 
    merge = function(v4, v5) --[[ Line: 30 ]] --[[ Name: merge ]]
        local v6 = {};
        for v7, v8 in pairs(v4) do
            v6[v7] = v8;
        end;
        for v9, v10 in pairs(v5) do
            v6[v9] = v10;
        end;
        return v6;
    end, 
    reverse = function(v11) --[[ Line: 47 ]] --[[ Name: reverse ]]
        local v12 = {};
        for v13 = #v11, 1, -1 do
            table.insert(v12, v11[v13]);
        end;
        return v12;
    end, 
    values = function(v14) --[[ Line: 61 ]] --[[ Name: values ]]
        local v15 = {};
        for _, v17 in pairs(v14) do
            table.insert(v15, v17);
        end;
        return v15;
    end, 
    keys = function(v18) --[[ Line: 75 ]] --[[ Name: keys ]]
        local v19 = {};
        for v20, _ in pairs(v18) do
            table.insert(v19, v20);
        end;
        return v19;
    end, 
    mergeLists = function(v22, v23) --[[ Line: 90 ]] --[[ Name: mergeLists ]]
        local v24 = {};
        for _, v26 in pairs(v22) do
            table.insert(v24, v26);
        end;
        for _, v28 in pairs(v23) do
            table.insert(v24, v28);
        end;
        return v24;
    end, 
    swapKeyValue = function(v29) --[[ Line: 107 ]] --[[ Name: swapKeyValue ]]
        local v30 = {};
        for v31, v32 in pairs(v29) do
            v30[v32] = v31;
        end;
        return v30;
    end, 
    toList = function(v33) --[[ Line: 121 ]] --[[ Name: toList ]]
        local v34 = {};
        for _, v36 in pairs(v33) do
            table.insert(v34, v36);
        end;
        return v34;
    end, 
    count = function(v37) --[[ Line: 136 ]] --[[ Name: count ]]
        local v38 = 0;
        for _, _ in pairs(v37) do
            v38 = v38 + 1;
        end;
        return v38;
    end, 
    copy = table.clone
};
v41.deepCopy = function(v42, v43) --[[ Line: 161 ]] --[[ Name: deepCopy ]]
    -- upvalues: v41 (copy)
    v43 = v43 or {};
    if v43[v42] then
        return v43[v42];
    elseif type(v42) == "table" then
        local v44 = {};
        v43[v42] = v44;
        for v45, v46 in pairs(v42) do
            v44[v41.deepCopy(v45, v43)] = v41.deepCopy(v46, v43);
        end;
        return (setmetatable(v44, v41.deepCopy(getmetatable(v42), v43)));
    else
        return v42;
    end;
end;
v41.deepOverwrite = function(v47, v48) --[[ Line: 185 ]] --[[ Name: deepOverwrite ]]
    -- upvalues: v41 (copy)
    for v49, v50 in pairs(v48) do
        if type(v47[v49]) == "table" and type(v50) == "table" then
            v47[v49] = v41.deepOverwrite(v47[v49], v50);
        else
            v47[v49] = v50;
        end;
    end;
    return v47;
end;
v41.getIndex = function(v51, v52) --[[ Line: 203 ]] --[[ Name: getIndex ]]
    assert(v52 ~= nil, "Needle cannot be nil");
    for v53, v54 in pairs(v51) do
        if v52 == v54 then
            return v53;
        end;
    end;
    return nil;
end;
v41.stringify = function(v55, v56, v57) --[[ Line: 222 ]] --[[ Name: stringify ]]
    -- upvalues: v41 (copy)
    v57 = v57 or tostring(v55);
    v56 = v56 or 0;
    for v58, v59 in pairs(v55) do
        local v60 = "\n" .. string.rep("  ", v56) .. tostring(v58) .. ": ";
        if type(v59) == "table" then
            v57 = v57 .. v60;
            v57 = v41.stringify(v59, v56 + 1, v57);
        else
            v57 = v57 .. v60 .. tostring(v59);
        end;
    end;
    return v57;
end;
v41.contains = function(v61, v62) --[[ Line: 244 ]] --[[ Name: contains ]]
    for _, v64 in pairs(v61) do
        if v64 == v62 then
            return true;
        end;
    end;
    return false;
end;
v41.overwrite = function(v65, v66) --[[ Line: 261 ]] --[[ Name: overwrite ]]
    for v67, v68 in pairs(v66) do
        v65[v67] = v68;
    end;
    return v65;
end;
v41.take = function(v69, v70) --[[ Line: 278 ]] --[[ Name: take ]]
    local v71 = {};
    for v72 = 1, math.min(#v69, v70) do
        v71[v72] = v69[v72];
    end;
    return v71;
end;
local function v75(_, v74) --[[ Line: 286 ]] --[[ Name: errorOnIndex ]]
    error(("Bad index %q"):format((tostring(v74))), 2);
end;
local v76 = {
    __index = v75, 
    __newindex = v75
};
v41.readonly = function(v77) --[[ Line: 302 ]] --[[ Name: readonly ]]
    -- upvalues: v76 (copy)
    return (setmetatable(v77, v76));
end;
v41.deepReadonly = function(v78) --[[ Line: 312 ]] --[[ Name: deepReadonly ]]
    -- upvalues: v41 (copy)
    for _, v80 in pairs(v78) do
        if type(v80) == "table" then
            v41.deepReadonly(v80);
        end;
    end;
    return v41.readonly(v78);
end;
return v41;