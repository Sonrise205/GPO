local l_Parent_0 = script.Parent;
local v1 = require(script.Parent.BounceTemplateUtils);
local v2 = require(script.Parent.GroupInfoUtils);
local v3 = require(script.Parent.PackageInfoUtils);
local v4 = require(script.Parent.ScriptInfoUtils);
local v5 = require(script.Parent.Utils);
local v6 = {
    Utils = v5, 
    ContextTypes = v5.readonly({
        CLIENT = "client", 
        SERVER = "server"
    }), 
    IncludeBehavior = v5.readonly({
        NO_INCLUDE = "noInclude", 
        INCLUDE_ONLY = "includeOnly", 
        INCLUDE_SHARED = "includeShared"
    })
};
v6.toWallyFormat = function(v7, v8) --[[ Line: 26 ]] --[[ Name: toWallyFormat ]]
    -- upvalues: v6 (copy), v4 (copy), v3 (copy), v2 (copy)
    assert(typeof(v7) == "Instance", "Bad instance");
    assert(type(v8) == "boolean", "Bad isPlugin");
    local v9 = {};
    v6.discoverTopLevelPackages(v9, v7);
    v6.injectLoader(v9);
    local v10 = {};
    local v11 = {};
    local v12 = v8 and v4.ModuleReplicationTypes.PLUGIN or v4.ModuleReplicationTypes.SHARED;
    for _, v14 in pairs(v9) do
        table.insert(v10, (v3.getOrCreatePackageInfo(v14, v11, "", v12)));
    end;
    v3.fillDependencySet(v10);
    if v8 then
        local v15 = v2.groupPackageInfos(v10, v4.ModuleReplicationTypes.PLUGIN);
        local v16 = v6.getPublishPackageInfoSet(v10);
        local l_Folder_0 = Instance.new("Folder");
        l_Folder_0.Name = "PluginPackages";
        v6.reifyGroupList(v15, v16, l_Folder_0, v4.ModuleReplicationTypes.PLUGIN);
        return l_Folder_0;
    else
        local v18 = v2.groupPackageInfos(v10, v4.ModuleReplicationTypes.CLIENT);
        local v19 = v2.groupPackageInfos(v10, v4.ModuleReplicationTypes.SERVER);
        local v20 = v2.groupPackageInfos(v10, v4.ModuleReplicationTypes.SHARED);
        local v21 = v6.getPublishPackageInfoSet(v10);
        local l_Folder_1 = Instance.new("Folder");
        l_Folder_1.Name = "Packages";
        local l_Folder_2 = Instance.new("Folder");
        l_Folder_2.Name = "SharedPackages";
        local l_Folder_3 = Instance.new("Folder");
        l_Folder_3.Name = "Packages";
        v6.reifyGroupList(v18, v21, l_Folder_1, v4.ModuleReplicationTypes.CLIENT);
        v6.reifyGroupList(v19, v21, l_Folder_3, v4.ModuleReplicationTypes.SERVER);
        v6.reifyGroupList(v20, v21, l_Folder_2, v4.ModuleReplicationTypes.SHARED);
        return l_Folder_1, l_Folder_3, l_Folder_2;
    end;
end;
v6.isPackage = function(v25) --[[ Line: 86 ]] --[[ Name: isPackage ]]
    -- upvalues: v4 (copy)
    assert(typeof(v25) == "Instance", "Bad instance");
    for _, v27 in pairs(v25:GetChildren()) do
        if v27:IsA("Folder") and (v27.Name == "Server" or v27.Name == "Client" or v27.Name == "Shared" or v27.Name == v4.DEPENDENCY_FOLDER_NAME) then
            return true;
        end;
    end;
    return false;
end;
v6.injectLoader = function(v28) --[[ Line: 103 ]] --[[ Name: injectLoader ]]
    -- upvalues: l_Parent_0 (copy)
    for _, v30 in pairs(v28) do
        if v30 == l_Parent_0 or l_Parent_0:IsDescendantOf(v30) then
            return;
        end;
    end;
    table.insert(v28, l_Parent_0);
end;
v6.discoverTopLevelPackages = function(v31, v32) --[[ Line: 115 ]] --[[ Name: discoverTopLevelPackages ]]
    -- upvalues: v6 (copy)
    assert(type(v31) == "table", "Bad packages");
    assert(typeof(v32) == "Instance", "Bad instance");
    if v6.isPackage(v32) then
        table.insert(v31, v32);
        return;
    else
        if v32:IsA("ObjectValue") then
            local l_Value_0 = v32.Value;
            if l_Value_0 and v6.isPackage(l_Value_0) then
                table.insert(v31, l_Value_0);
                return;
            end;
        else
            for _, v35 in pairs(v32:GetChildren()) do
                if v35:IsA("Folder") then
                    v6.discoverTopLevelPackages(v31, v35);
                elseif v35:IsA("ObjectValue") then
                    local l_Value_1 = v35.Value;
                    if l_Value_1 and v6.isPackage(l_Value_1) then
                        table.insert(v31, l_Value_1);
                    end;
                elseif v35:IsA("ModuleScript") then
                    table.insert(v31, v35);
                end;
            end;
        end;
        return;
    end;
end;
v6.reifyGroupList = function(v37, v38, v39, v40) --[[ Line: 143 ]] --[[ Name: reifyGroupList ]]
    -- upvalues: v6 (copy), v1 (copy)
    assert(type(v37) == "table", "Bad groupInfoList");
    assert(type(v38) == "table", "Bad publishSet");
    assert(typeof(v39) == "Instance", "Bad parent");
    assert(type(v40) == "string", "Bad replicationMode");
    local l_Folder_4 = Instance.new("Folder");
    l_Folder_4.Name = "_Index";
    for _, v43 in pairs(v37) do
        if v6.needToReify(v43, v40) then
            v6.reifyGroup(v43, l_Folder_4, v40);
        end;
    end;
    for v44, _ in pairs(v38) do
        for v46, v47 in pairs(v44.scriptInfoLookup[v40]) do
            v1.create(v47.instance, v46).Parent = v39;
        end;
    end;
    l_Folder_4.Parent = v39;
end;
v6.getPublishPackageInfoSet = function(v48) --[[ Line: 169 ]] --[[ Name: getPublishPackageInfoSet ]]
    local v49 = {};
    for _, v51 in pairs(v48) do
        v49[v51] = true;
        for v52, _ in pairs(v51.explicitDependencySet) do
            v49[v52] = true;
        end;
    end;
    return v49;
end;
v6.needToReify = function(v54, v55) --[[ Line: 181 ]] --[[ Name: needToReify ]]
    for _, v57 in pairs(v54.packageScriptInfoMap) do
        if v57.replicationMode == v55 then
            return true;
        end;
    end;
    return false;
end;
v6.reifyGroup = function(v58, v59, v60) --[[ Line: 191 ]] --[[ Name: reifyGroup ]]
    -- upvalues: l_Parent_0 (copy), v1 (copy)
    assert(type(v58) == "table", "Bad groupInfo");
    assert(typeof(v59) == "Instance", "Bad parent");
    assert(type(v60) == "string", "Bad replicationMode");
    local l_Folder_5 = Instance.new("Folder");
    l_Folder_5.Name = assert(next(v58.packageSet).fullName, "Bad package fullName");
    for v62, v63 in pairs(v58.packageScriptInfoMap) do
        assert(v63.name == v62, "Bad scriptInfo.name");
        if v63.replicationMode == v60 then
            if v63.instance == l_Parent_0 and l_Parent_0.Parent == game:GetService("ReplicatedStorage") then
                v1.create(v63.instance, v62).Parent = l_Folder_5;
            else
                v63.instance.Name = v62;
                v63.instance.Parent = l_Folder_5;
            end;
        elseif v63.instance == l_Parent_0 then
            v1.create(v63.instance, v62).Parent = l_Folder_5;
        else
            v1.createLink(v63.instance, v62).Parent = l_Folder_5;
        end;
    end;
    for v64, v65 in pairs(v58.scriptInfoMap) do
        assert(v65.name == v64, "Bad scriptInfo.name");
        if not v58.packageScriptInfoMap[v64] then
            if v65.instance == l_Parent_0 then
                v1.create(v65.instance, v64).Parent = l_Folder_5;
            else
                v1.createLink(v65.instance, v64).Parent = l_Folder_5;
            end;
        end;
    end;
    l_Folder_5.Parent = v59;
end;
return v6;