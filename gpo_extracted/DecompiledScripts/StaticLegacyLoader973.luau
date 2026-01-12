local l_Parent_0 = script.Parent;
local v1 = require(script.Parent.ScriptInfoUtils);
local v2 = require(script.Parent.LoaderUtils);
local v3 = require(script.Parent.BounceTemplateUtils);
local v4 = {
    ClassName = "StaticLegacyLoader"
};
v4.__index = v4;
v4.new = function() --[[ Line: 15 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy)
    return (setmetatable({
        _packageLookups = {}
    }, v4));
end;
v4.__call = function(v5, v6) --[[ Line: 23 ]] --[[ Name: __call ]]
    return v5:Require(v6);
end;
v4.Lock = function(_) --[[ Line: 27 ]] --[[ Name: Lock ]]
    error("Cannot start loader while not running");
end;
v4.Require = function(v8, v9, v10) --[[ Line: 31 ]] --[[ Name: Require ]]
    if type(v10) == "number" then
        return require(v10);
    elseif type(v10) == "string" then
        local v11 = v8:_findModule(v9, v10);
        if v11 then
            v8:_ensureFakeLoader(v11);
            return require(v11);
        else
            error("Error: Library '" .. tostring(v10) .. "' does not exist.", 2);
            return;
        end;
    elseif typeof(v10) == "Instance" and v10:IsA("ModuleScript") then
        return require(v10);
    else
        error(("Error: module must be a string or ModuleScript, got '%s' for '%s'"):format(typeof(v10), (tostring(v10))));
        return;
    end;
end;
v4._findModule = function(v12, v13, v14) --[[ Line: 51 ]] --[[ Name: _findModule ]]
    -- upvalues: v1 (copy)
    assert(typeof(v13) == "Instance", "Bad root");
    assert(type(v14) == "string", "Bad name");
    local v15 = v12:_findPackageRoot(v13);
    while true do
        if v15 then
            local v16 = v12:_getOrCreateLookup(v15);
            if v16[v14] then
                return v16[v14];
            else
                local l_v15_FirstChild_0 = v15:FindFirstChild(v1.DEPENDENCY_FOLDER_NAME);
                if l_v15_FirstChild_0 then
                    for _, v19 in pairs(l_v15_FirstChild_0:GetChildren()) do
                        if v19:IsA("Folder") and v19.Name:sub(1, 1) == "@" then
                            for _, v21 in pairs(v19:GetChildren()) do
                                local v22 = v12:_getPackageFolderLookup(v21);
                                if v22[v14] then
                                    return v22[v14];
                                end;
                            end;
                        else
                            local v23 = v12:_getPackageFolderLookup(v19);
                            if v23[v14] then
                                return v23[v14];
                            end;
                        end;
                    end;
                end;
                v15 = v12:_findPackageRoot(v15);
            end;
        else
            return nil;
        end;
    end;
end;
v4.GetLoader = function(v24, v25) --[[ Line: 91 ]] --[[ Name: GetLoader ]]
    assert(typeof(v25) == "Instance", "Bad moduleScript");
    return (setmetatable({}, {
        __call = function(_, v27) --[[ Line: 95 ]] --[[ Name: __call ]]
            -- upvalues: v24 (copy), v25 (copy)
            return v24:Require(v25, v27);
        end, 
        __index = function(_, v29) --[[ Line: 98 ]] --[[ Name: __index ]]
            -- upvalues: v24 (copy), v25 (copy)
            return v24:Require(v25, v29);
        end
    }));
end;
v4._getPackageFolderLookup = function(v30, v31) --[[ Line: 104 ]] --[[ Name: _getPackageFolderLookup ]]
    if v31:IsA("ObjectValue") then
        if v31.Value then
            return v30:_getOrCreateLookup(v31.Value);
        else
            warn("[StaticLegacyLoader] - Bad link in packageFolder");
            return {};
        end;
    elseif v31:IsA("Folder") then
        return v30:_getOrCreateLookup(v31);
    elseif v31:IsA("ModuleScript") then
        return v30:_getOrCreateLookup(v31);
    else
        warn(("Unknown instance %q (%s) in dependencyFolder - %q"):format(v31.Name, v31.ClassName, v31:GetFullName()));
        return {};
    end;
end;
v4._getOrCreateLookup = function(v32, v33) --[[ Line: 123 ]] --[[ Name: _getOrCreateLookup ]]
    assert(typeof(v33) == "Instance", "Bad packageFolderOrModuleScript");
    if v32._packageLookups[v33] then
        return v32._packageLookups[v33];
    else
        local v34 = {};
        v32:_buildLookup(v34, v33);
        v32._packageLookups[v33] = v34;
        return v34;
    end;
end;
v4._buildLookup = function(v35, v36, v37) --[[ Line: 138 ]] --[[ Name: _buildLookup ]]
    -- upvalues: v1 (copy)
    if v37:IsA("Folder") then
        if v37.Name ~= v1.DEPENDENCY_FOLDER_NAME then
            for _, v39 in pairs(v37:GetChildren()) do
                v35:_buildLookup(v36, v39);
            end;
            return;
        end;
    elseif v37:IsA("ModuleScript") then
        v36[v37.Name] = v37;
    end;
end;
v4._findPackageRoot = function(_, v41) --[[ Line: 150 ]] --[[ Name: _findPackageRoot ]]
    -- upvalues: v2 (copy)
    assert(typeof(v41) == "Instance", "Bad instance");
    local l_Parent_1 = v41.Parent;
    while true do
        if l_Parent_1 and l_Parent_1 ~= game then
            if v2.isPackage(l_Parent_1) then
                return l_Parent_1;
            else
                l_Parent_1 = l_Parent_1.Parent;
            end;
        else
            return nil;
        end;
    end;
end;
v4._ensureFakeLoader = function(_, v44) --[[ Line: 166 ]] --[[ Name: _ensureFakeLoader ]]
    -- upvalues: v3 (copy), l_Parent_0 (copy)
    assert(typeof(v44) == "Instance", "Bad module");
    local l_Parent_2 = v44.Parent;
    if not l_Parent_2 then
        warn("[StaticLegacyLoader] - No parent");
        return;
    else
        local v46 = Load and true or false;
        local l_loader_0 = l_Parent_2:FindFirstChild("loader");
        if l_loader_0 then
            if v3.isBounceTemplate(l_loader_0) then
                l_loader_0.Archivable = v46;
            end;
            return;
        else
            local v48 = v3.create(l_Parent_0, "loader");
            v48.Archivable = v46;
            v48.Parent = l_Parent_2;
            return;
        end;
    end;
end;
return v4;