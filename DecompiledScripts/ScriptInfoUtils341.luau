local l_CollectionService_0 = game:GetService("CollectionService");
local l_Parent_0 = script.Parent;
local v2 = require(script.Parent.Utils);
local v3 = require(script.Parent.BounceTemplateUtils);
local v7 = {
    DEPENDENCY_FOLDER_NAME = "node_modules", 
    ModuleReplicationTypes = v2.readonly({
        CLIENT = "client", 
        SERVER = "server", 
        SHARED = "shared", 
        IGNORE = "ignore", 
        PLUGIN = "plugin"
    }), 
    createScriptInfo = function(v4, v5, v6) --[[ Line: 23 ]] --[[ Name: createScriptInfo ]]
        -- upvalues: v2 (copy)
        assert(typeof(v4) == "Instance", "Bad instance");
        assert(type(v5) == "string", "Bad name");
        assert(type(v6) == "string", "Bad replicationMode");
        return v2.readonly({
            name = v5, 
            replicationMode = v6, 
            instance = v4
        });
    end
};
v7.createScriptInfoLookup = function() --[[ Line: 35 ]] --[[ Name: createScriptInfoLookup ]]
    -- upvalues: v2 (copy), v7 (copy)
    return v2.readonly({
        [v7.ModuleReplicationTypes.SERVER] = {}, 
        [v7.ModuleReplicationTypes.CLIENT] = {}, 
        [v7.ModuleReplicationTypes.SHARED] = {}, 
        [v7.ModuleReplicationTypes.PLUGIN] = {}
    });
end;
v7.getScriptInfoLookupForMode = function(v8, v9) --[[ Line: 45 ]] --[[ Name: getScriptInfoLookupForMode ]]
    assert(type(v8) == "table", "Bad scriptInfoLookup");
    assert(type(v9) == "string", "Bad replicationMode");
    return v8[v9];
end;
v7.populateScriptInfoLookup = function(v10, v11, v12) --[[ Line: 52 ]] --[[ Name: populateScriptInfoLookup ]]
    -- upvalues: v7 (copy), v3 (copy), l_Parent_0 (copy)
    assert(typeof(v10) == "Instance", "Bad instance");
    assert(type(v11) == "table", "Bad scriptInfoLookup");
    assert(type(v12) == "string", "Bad lastReplicationMode");
    if v10:IsA("Folder") then
        local v13 = v7.getFolderReplicationMode(v10.Name, v12);
        if v13 ~= v7.ModuleReplicationTypes.IGNORE then
            for _, v15 in pairs(v10:GetChildren()) do
                if not v3.isBounceTemplate(v15) then
                    if v15:IsA("Folder") then
                        v7.populateScriptInfoLookup(v15, v11, v13);
                    elseif v15:IsA("ModuleScript") then
                        v7.addToInfoMap(v11, v7.createScriptInfo(v15, v15.Name, v13));
                    end;
                end;
            end;
            return;
        end;
    elseif v10:IsA("ModuleScript") then
        if not v3.isBounceTemplate(v10) then
            if v10 == l_Parent_0 then
                v7.addToInfoMap(v11, v7.createScriptInfo(v10, "loader", v12));
                return;
            else
                v7.addToInfoMap(v11, v7.createScriptInfo(v10, v10.Name, v12));
                return;
            end;
        end;
    elseif v10:IsA("ObjectValue") then
        error("ObjectValue links are not supported at this time for retrieving inline module scripts");
    end;
end;
local v16 = {
    HoldingBindersServer = true, 
    HoldingBindersClient = true, 
    IKService = true, 
    IKServiceClient = true
};
v7.isAvailableInShared = function(v17) --[[ Line: 94 ]] --[[ Name: isAvailableInShared ]]
    -- upvalues: l_CollectionService_0 (copy), v16 (copy)
    if l_CollectionService_0:HasTag(v17.instance, "LinkToShared") then
        return true;
    else
        return v16[v17.name];
    end;
end;
v7.addToInfoMap = function(v18, v19) --[[ Line: 103 ]] --[[ Name: addToInfoMap ]]
    -- upvalues: v7 (copy)
    assert(type(v18) == "table", "Bad scriptInfoLookup");
    assert(type(v19) == "table", "Bad scriptInfo");
    local v20 = assert(v19.replicationMode, "Bad replicationMode");
    local v21 = assert(v18[v20], "Bad replicationMode");
    v7.addToInfoMapForMode(v21, v19);
    if v20 == v7.ModuleReplicationTypes.SHARED then
        v7.addToInfoMapForMode(v18[v7.ModuleReplicationTypes.SERVER], v19);
        v7.addToInfoMapForMode(v18[v7.ModuleReplicationTypes.CLIENT], v19);
        return;
    else
        if v7.isAvailableInShared(v19) then
            v7.addToInfoMapForMode(v18[v7.ModuleReplicationTypes.SHARED], v19);
        end;
        return;
    end;
end;
v7.addToInfoMapForMode = function(v22, v23) --[[ Line: 123 ]] --[[ Name: addToInfoMapForMode ]]
    if v22[v23.name] then
        warn(("Duplicate module %q in same package under same replication scope. Only using first one. \n- %q\n- %q"):format(v23.name, v23.instance:GetFullName(), v22[v23.name].instance:GetFullName()));
        return;
    else
        v22[v23.name] = v23;
        return;
    end;
end;
v7.getFolderReplicationMode = function(v24, v25) --[[ Line: 135 ]] --[[ Name: getFolderReplicationMode ]]
    -- upvalues: v7 (copy)
    assert(type(v24) == "string", "Bad folderName");
    assert(type(v25) == "string", "Bad lastReplicationMode");
    if v24 == v7.DEPENDENCY_FOLDER_NAME then
        return v7.ModuleReplicationTypes.IGNORE;
    elseif v25 == v7.ModuleReplicationTypes.PLUGIN then
        return v25;
    elseif v24 == "Shared" then
        return v7.ModuleReplicationTypes.SHARED;
    elseif v24 == "Client" then
        return v7.ModuleReplicationTypes.CLIENT;
    elseif v24 == "Server" then
        return v7.ModuleReplicationTypes.SERVER;
    else
        return v25;
    end;
end;
return v7;