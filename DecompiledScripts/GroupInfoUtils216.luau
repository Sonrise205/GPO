local v0 = require(script.Parent.Utils);
local v1 = require(script.Parent.Queue);
local v2 = require(script.Parent.LoaderConstants);
local v3 = {
    createGroupInfo = function() --[[ Line: 13 ]] --[[ Name: createGroupInfo ]]
        -- upvalues: v0 (copy)
        return v0.readonly({
            scriptInfoMap = {}, 
            packageScriptInfoMap = {}, 
            packageSet = {}
        });
    end
};
v3.groupPackageInfos = function(v4, v5) --[[ Line: 21 ]] --[[ Name: groupPackageInfos ]]
    -- upvalues: v1 (copy), v3 (copy), v2 (copy)
    assert(type(v4) == "table", "Bad packageInfoList");
    assert(type(v5) == "string", "Bad replicationMode");
    local v6 = v1.new();
    local v7 = {};
    for _, v9 in pairs(v4) do
        if not v7[v9] then
            v7[v9] = true;
            v6:PushRight(v9);
        end;
    end;
    local v10 = {};
    local v11 = v3.createGroupInfo();
    while not v6:IsEmpty() do
        local v12 = v6:PopLeft();
        if v3.hasAnythingToReplicate(v12, v5) then
            if v3.canAddPackageInfoToGroup(v11, v12, v5) then
                v3.addPackageInfoToGroup(v11, v12, v5);
                if v2.GROUP_EACH_PACKAGE_INDIVIDUALLY then
                    table.insert(v10, v11);
                    v11 = v3.createGroupInfo();
                end;
            elseif v2.ALLOW_MULTIPLE_GROUPS then
                table.insert(v10, v11);
                v11 = v3.createGroupInfo();
                v3.addPackageInfoToGroup(v11, v12, v5);
            else
                v3.addPackageInfoToGroup(v11, v12, v5);
                error("Cannot add package to group");
            end;
        end;
        for v13, _ in pairs(v12.dependencySet) do
            if not v7[v13] then
                v7[v13] = true;
                v6:PushRight(v13);
            end;
        end;
    end;
    if next(v11.packageSet) then
        table.insert(v10, v11);
    end;
    return v10;
end;
v3.hasAnythingToReplicate = function(v15, v16) --[[ Line: 75 ]] --[[ Name: hasAnythingToReplicate ]]
    return next(v15.scriptInfoLookup[v16]) ~= nil;
end;
v3.canAddScriptInfoToGroup = function(v17, v18, v19, v20) --[[ Line: 79 ]] --[[ Name: canAddScriptInfoToGroup ]]
    assert(type(v17) == "table", "Bad groupInfo");
    assert(type(v18) == "table", "Bad scriptInfo");
    assert(type(v19) == "string", "Bad scriptName");
    assert(type(v20) == "table", "Bad tempScriptInfoMap");
    local v21 = v20[v19];
    if v21 and v21 ~= v18 then
        return false;
    else
        local v22 = v17.scriptInfoMap[v19];
        if v22 and v22 ~= v18 then
            return false;
        else
            return true;
        end;
    end;
end;
v3.canAddPackageInfoToGroup = function(v23, v24, v25) --[[ Line: 98 ]] --[[ Name: canAddPackageInfoToGroup ]]
    -- upvalues: v3 (copy)
    assert(type(v23) == "table", "Bad groupInfo");
    assert(type(v24) == "table", "Bad packageInfo");
    assert(type(v25) == "string", "Bad replicationMode");
    local v26 = {};
    for v27, v28 in pairs(v24.scriptInfoLookup[v25]) do
        if v3.canAddScriptInfoToGroup(v23, v28, v27, v26) then
            v26[v27] = v28;
        else
            return false;
        end;
    end;
    for v29, _ in pairs(v24.dependencySet) do
        if not v23.packageSet[v29] then
            for v31, v32 in pairs(v29.scriptInfoLookup[v25]) do
                if v3.canAddScriptInfoToGroup(v23, v32, v31, v26) then
                    v26[v31] = v32;
                else
                    return false;
                end;
            end;
        end;
    end;
    return true;
end;
v3.addScriptToGroup = function(v33, v34, v35) --[[ Line: 132 ]] --[[ Name: addScriptToGroup ]]
    assert(type(v33) == "table", "Bad groupInfo");
    assert(type(v35) == "table", "Bad scriptInfo");
    assert(type(v34) == "string", "Bad scriptName");
    local v36 = v33.scriptInfoMap[v34];
    if v36 and v36 ~= v35 then
        error(("Cannot add to package group, conflicting scriptInfo for %q already there"):format(v34));
    end;
    v33.scriptInfoMap[v34] = v35;
end;
v3.addPackageInfoToGroup = function(v37, v38, v39) --[[ Line: 146 ]] --[[ Name: addPackageInfoToGroup ]]
    -- upvalues: v3 (copy)
    v37.packageSet[v38] = true;
    for v40, v41 in pairs(v38.scriptInfoLookup[v39]) do
        v3.addScriptToGroup(v37, v40, v41);
        v37.packageScriptInfoMap[v40] = v41;
    end;
    for v42, _ in pairs(v38.dependencySet) do
        if not v37.packageSet[v42] then
            for v44, v45 in pairs(v42.scriptInfoLookup[v39]) do
                v3.addScriptToGroup(v37, v44, v45);
            end;
        end;
    end;
end;
return v3;