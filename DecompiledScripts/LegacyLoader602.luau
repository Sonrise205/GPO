local l_RunService_0 = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ServerScriptService_0 = game:GetService("ServerScriptService");
local v3 = require(script.Parent.LoaderUtils);
local v4 = require(script.Parent.BounceTemplateUtils);
local v5 = require(script.Parent.Loader);
local v6 = {
    ClassName = "LegacyLoader"
};
v6.__index = v6;
v6.new = function(v7) --[[ Line: 20 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy)
    return (setmetatable({
        _script = assert(v7, "No script"), 
        _container = false, 
        _locked = false, 
        _lookupMap = {}
    }, v6));
end;
v6.Lock = function(v8) --[[ Line: 29 ]] --[[ Name: Lock ]]
    assert(not v8._container, "Cannot bootstrap game when legacy loader was already used");
    v8._locked = true;
end;
v6.GetLoader = function(_, v10) --[[ Line: 34 ]] --[[ Name: GetLoader ]]
    -- upvalues: v5 (copy)
    return v5.new(v10);
end;
v6.Require = function(v11, v12) --[[ Line: 38 ]] --[[ Name: Require ]]
    assert(not v11._locked, "Cannot use legacy loader after already transformed");
    v11:_setupIfNeeded();
    if type(v12) == "number" then
        return require(v12);
    elseif type(v12) == "string" then
        local v13 = v11._lookupMap[v12];
        if v13 then
            return require(v13);
        else
            error("Error: Library '" .. tostring(v12) .. "' does not exist.", 2);
            return;
        end;
    elseif typeof(v12) == "Instance" and v12:IsA("ModuleScript") then
        return require(v12);
    else
        error(("Error: module must be a string or ModuleScript, got '%s' for '%s'"):format(typeof(v12), (tostring(v12))));
        return;
    end;
end;
v6._buildLookupContainer = function(v14) --[[ Line: 60 ]] --[[ Name: _buildLookupContainer ]]
    -- upvalues: v4 (copy)
    for _, v16 in pairs(v14._container:GetDescendants()) do
        if v16:IsA("ModuleScript") and not v16:FindFirstAncestorWhichIsA("ModuleScript") then
            local l_v16_0 = v16;
            if v4.isBounceTemplate(v16) then
                l_v16_0 = v4.getTarget(v16) or v16;
            end;
            local v18 = v14._lookupMap[v16.Name];
            if v18 then
                if l_v16_0 ~= v18 then
                    warn(("[LegacyLoader] - Duplicate module %q found, using first found\n\t(1) %s (used)\n\t(2) %s"):format(v16.Name, v14._lookupMap[v16.Name]:GetFullName(), v16:GetFullName()));
                end;
            else
                v14._lookupMap[v16.Name] = l_v16_0;
            end;
        end;
    end;
end;
v6._setupIfNeeded = function(v19) --[[ Line: 85 ]] --[[ Name: _setupIfNeeded ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), l_RunService_0 (copy), l_ServerScriptService_0 (copy), v3 (copy)
    local v20 = rawget(v19, "_container");
    if v20 then
        return v20;
    else
        assert(v19._script.Name == "Nevermore", "Cannot invoke legacy mode if not at ReplicatedStorage.Nevermore");
        assert(v19._script.Parent == l_ReplicatedStorage_0, "Cannot invoke legacy mode if not at ReplicatedStorage.Nevermore");
        if not l_RunService_0:IsRunning() then
            error("Test mode not supported");
            return;
        else
            if l_RunService_0:IsServer() and l_RunService_0:IsClient() or not l_RunService_0:IsRunning() then
                if l_RunService_0:IsRunning() then
                    error("Warning: Loading all modules in PlaySolo. It's recommended you use accurate play solo.");
                    return;
                end;
            elseif l_RunService_0:IsServer() then
                local v21 = l_ServerScriptService_0:FindFirstChild("Nevermore") or error("No ServerScriptService.Nevermore folder");
                local v22, v23, v24 = v3.toWallyFormat(v21);
                v22.Name = "_nevermoreClient";
                v22.Parent = l_ReplicatedStorage_0;
                v24.Name = "_nevermoreShared";
                v24.Parent = l_ReplicatedStorage_0;
                v23.Name = "_nevermoreServer";
                v23.Parent = l_ServerScriptService_0;
                rawset(v19, "_container", v23);
                v19:_buildLookupContainer();
                return;
            elseif l_RunService_0:IsClient() then
                local v25 = l_ReplicatedStorage_0:WaitForChild("_nevermoreClient", 2);
                if not v25 then
                    warn("[Nevermore] - Be sure to call require(ServerScriptService.Nevermore) on the server to replicate nevermore");
                    v25 = l_ReplicatedStorage_0:WaitForChild("_nevermoreClient");
                end;
                rawset(v19, "_container", v25);
                v19:_buildLookupContainer();
                return;
            else
                error("Error: Unknown RunService state (Not client/server/test mode)");
            end;
            return;
        end;
    end;
end;
return v6;