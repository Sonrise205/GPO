local v0 = require(script.Parent.BounceTemplateUtils);
local v1 = require(script.Parent.LoaderConstants);
local v2 = require(script.Parent.Queue);
local v3 = require(script.Parent.ScriptInfoUtils);
local v4 = require(script.Parent.Utils);
local v11 = {
    createPackageInfo = function(v5, v6, v7, v8) --[[ Line: 15 ]] --[[ Name: createPackageInfo ]]
        -- upvalues: v4 (copy)
        assert(typeof(v5) == "Instance", "Bad packageFolder");
        assert(type(v6) == "table", "Bad explicitDependencySet");
        assert(type(v7) == "table", "Bad scriptInfoLookup");
        assert(type(v8) == "string", "Bad fullName");
        return v4.readonly({
            name = v5.Name, 
            fullName = v8, 
            instance = v5, 
            explicitDependencySet = v6, 
            dependencySet = false, 
            scriptInfoLookup = v7
        });
    end, 
    createDependencyQueueInfo = function(v9, v10) --[[ Line: 31 ]] --[[ Name: createDependencyQueueInfo ]]
        -- upvalues: v4 (copy)
        assert(type(v9) == "table", "Bad packageInfo");
        assert(type(v10) == "table", "Bad implicitDependencySet");
        return v4.readonly({
            packageInfo = v9, 
            implicitDependencySet = v10
        });
    end
};
v11.fillDependencySet = function(v12) --[[ Line: 41 ]] --[[ Name: fillDependencySet ]]
    -- upvalues: v2 (copy), v11 (copy)
    assert(type(v12) == "table", "Bad packageInfoList");
    local v13 = v2.new();
    local v14 = {};
    local v15 = {};
    for _, v17 in pairs(v12) do
        if not v14[v17] then
            v15[v17] = v17;
            v14[v17] = true;
            v13:PushRight(v11.createDependencyQueueInfo(v17, v15));
        end;
    end;
    while not v13:IsEmpty() do
        v15 = v13:PopLeft();
        assert(not v15.packageInfo.dependencySet, "Already wrote dependencySet");
        local v18 = v11.computePackageDependencySet(v15.packageInfo, v15.implicitDependencySet);
        v15.packageInfo.dependencySet = v18;
        for v19, _ in pairs(v15.packageInfo.explicitDependencySet) do
            if not v14[v19] then
                v14[v19] = true;
                v13:PushRight(v11.createDependencyQueueInfo(v19, v18));
            end;
        end;
    end;
end;
v11.computePackageDependencySet = function(v21, v22) --[[ Line: 79 ]] --[[ Name: computePackageDependencySet ]]
    -- upvalues: v1 (copy)
    assert(type(v21) == "table", "Bad packageInfo");
    assert(type(v22) == "table", "Bad implicitDependencySet");
    local v23 = {};
    if v1.INCLUDE_IMPLICIT_DEPENDENCIES then
        for v24, _ in pairs(v22) do
            v23[v24.name] = v24;
        end;
    end;
    for v26, _ in pairs(v21.explicitDependencySet) do
        v23[v26.name] = v26;
    end;
    v23[v21.name] = nil;
    local v28 = {};
    for _, v30 in pairs(v23) do
        v28[v30] = true;
    end;
    return v28;
end;
v11.getOrCreatePackageInfo = function(v31, v32, v33, v34) --[[ Line: 110 ]] --[[ Name: getOrCreatePackageInfo ]]
    -- upvalues: v3 (copy), v11 (copy)
    assert(typeof(v31) == "Instance", "Bad packageFolder");
    assert(type(v32) == "table", "Bad packageInfoMap");
    assert(type(v33) == "string", "Bad scope");
    assert(v34, "No defaultReplicationType");
    if v32[v31] then
        return v32[v31];
    else
        local v35 = v3.createScriptInfoLookup();
        v3.populateScriptInfoLookup(v31, v35, v34);
        local v36 = {};
        local v37 = nil;
        v37 = if v33 == "" then v31.Name else v33 .. "/" .. v31.Name;
        local v38 = v11.createPackageInfo(v31, v36, v35, v37);
        v32[v31] = v38;
        v11.fillExplicitPackageDependencySet(v36, v31, v32, v34);
        return v38;
    end;
end;
v11.getPackageInfoListFromDependencyFolder = function(v39, v40, v41) --[[ Line: 148 ]] --[[ Name: getPackageInfoListFromDependencyFolder ]]
    -- upvalues: v11 (copy)
    local v42 = false;
    if typeof(v39) == "Instance" then
        v42 = v39:IsA("Folder");
    end;
    assert(v42, "Bad folder");
    assert(type(v40) == "table", "Bad packageInfoMap");
    assert(v41, "No defaultReplicationType");
    local v43 = {};
    for _, v45 in pairs(v39:GetChildren()) do
        if v45:IsA("Folder") then
            if v45.Name:sub(1, 1) == "@" then
                local l_Name_0 = v45.Name;
                for _, v48 in pairs(v45:GetChildren()) do
                    v11.tryLoadPackageFromInstance(v43, v40, v48, l_Name_0, v41);
                end;
            else
                v11.tryLoadPackageFromInstance(v43, v40, v45, "", v41);
            end;
        else
            warn(("Unknown instance in dependencyFolder - %q"):format(v45:GetFullName()));
        end;
    end;
    return v43;
end;
v11.tryLoadPackageFromInstance = function(v49, v50, v51, v52, v53) --[[ Line: 176 ]] --[[ Name: tryLoadPackageFromInstance ]]
    -- upvalues: v0 (copy), v11 (copy)
    assert(type(v49) == "table", "Bad packageInfoList");
    assert(type(v50) == "table", "Bad packageInfoMap");
    assert(typeof(v51) == "Instance", "Bad instance");
    assert(type(v52) == "string", "Bad scope");
    assert(v53, "No defaultReplicationType");
    if v0.isBounceTemplate(v51) then
        return;
    elseif v51:IsA("Folder") or v51:IsA("ModuleScript") then
        table.insert(v49, v11.getOrCreatePackageInfo(v51, v50, v52, v53));
        return;
    else
        if v51:IsA("ObjectValue") then
            local l_Value_0 = v51.Value;
            if l_Value_0 and (l_Value_0:IsA("Folder") or l_Value_0:IsA("ModuleScript")) then
                table.insert(v49, v11.getOrCreatePackageInfo(l_Value_0, v50, v52, v53));
                return;
            else
                error(("Invalid %q ObjectValue in package linking to nothing cannot be resolved into package dependency\n\t-> %s"):format(v51.Name, v51:GetFullName()));
            end;
        end;
        return;
    end;
end;
v11.fillExplicitPackageDependencySet = function(v55, v56, v57, v58) --[[ Line: 206 ]] --[[ Name: fillExplicitPackageDependencySet ]]
    -- upvalues: v3 (copy), v11 (copy)
    assert(type(v55) == "table", "Bad explicitDependencySet");
    assert(typeof(v56) == "Instance", "Bad packageFolder");
    assert(type(v57) == "table", "Bad packageInfoMap");
    assert(v58, "No defaultReplicationType");
    for _, v60 in pairs(v56:GetChildren()) do
        if v60:IsA("Folder") and v60.Name == v3.DEPENDENCY_FOLDER_NAME then
            local v61 = v11.getPackageInfoListFromDependencyFolder(v60, v57, v58);
            for _, v63 in pairs(v61) do
                v55[v63] = true;
            end;
        end;
    end;
end;
return v11;