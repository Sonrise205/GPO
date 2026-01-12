local v0 = {};
v0.__index = v0;
local v1 = nil;
if not workspace:FindFirstChild("Cache") then
    v1 = Instance.new("Folder");
    v1.Name = "Cache";
    v1.Parent = workspace.Effects;
end;
local function v7(v2, v3) --[[ Line: 18 ]]
    local v4 = Instance.new(v2);
    for v5, v6 in next, v3 do
        if v5 ~= "Parent" and v4[v5] ~= nil then
            v4[v5] = v6;
        end;
    end;
    v4.Parent = v3.Parent;
    return v4;
end;
clearTables = function(v8) --[[ Line: 29 ]]
    for v9 = 1, #v8 do
        if type(v8[v9]) == "table" then
            clearTables(v8);
        end;
        v8[v9] = nil;
    end;
    v8 = nil;
end;
v0.new = function(v10, v11, v12) --[[ Line: 40 ]]
    -- upvalues: v0 (copy), v7 (copy), v1 (ref)
    local v13 = setmetatable({}, v0);
    local v14 = v7("Folder", {
        Parent = v1, 
        Name = v12 or "CachedFolder"
    });
    if v10:IsA("BasePart") or v10:IsA("MeshPart") then
        if not v10.Anchored then
            v10.Anchored = true;
        end;
    elseif v10:IsA("Model") then
        for _, _ in v10:GetChildren() do
            if (v10:IsA("BasePart") or v10:IsA("MeshPart")) and not v10.Anchored then
                v10.Anchored = true;
            end;
        end;
    end;
    v13.Active = {};
    v13.Inactive = {};
    v13.Cached = {};
    v13.ExtraObjects = {};
    v13.Template = v10;
    v13.CacheArea = v14;
    v13.AddCache = function(v17, v18, v19) --[[ Line: 60 ]] --[[ Name: AddCache ]]
        for _ = 1, v18 do
            local v21 = v17.Template:Clone();
            v21.Position = Vector3.new(0, 1000000000, 0, 0);
            v21.Parent = v17.CacheArea;
            table.insert(v17.Cached, v21);
            table.insert(v17.Inactive, v21);
            if v19 then
                table.insert(v17.ExtraObjects, v21);
            end;
        end;
    end;
    v13.GetObject = function(v22) --[[ Line: 73 ]] --[[ Name: GetObject ]]
        if v22.Inactive[1] then
            local v23 = v22.Inactive[1];
            table.remove(v22.Inactive, table.find(v22.Inactive, v23));
            table.insert(v22.Active, v23);
            return v23;
        else
            v22:AddCache(1, true);
            local v24 = v22.Inactive[1];
            table.remove(v22.Inactive, table.find(v22.Inactive, v24));
            table.insert(v22.Active, v24);
            return v24;
        end;
    end;
    v13.ReturnObject = function(v25, v26) --[[ Line: 90 ]] --[[ Name: ReturnObject ]]
        if table.find(v25.Cached, v26) then
            table.remove(v25.Active, table.find(v25.Inactive, v26));
            if table.find(v25.ExtraObjects, v26) then
                v26:Destroy();
                v26 = nil;
                return;
            else
                table.insert(v25.Inactive, v26);
                if (v26:IsA("BasePart") or v26:IsA("MeshPart")) and not v26.Anchored then
                    v26.Anchored = true;
                end;
                v26.Position = Vector3.new(0, 1000000000, 0, 0);
            end;
        end;
    end;
    v13.Delete = function(v27) --[[ Line: 106 ]] --[[ Name: Delete ]]
        v27.CacheArea:Destroy();
        clearTables(v27);
        warn("CACHED DESTROYED");
    end;
    v13.DeleteExtra = function(v28) --[[ Line: 127 ]] --[[ Name: DeleteExtra ]]
        for _, v30 in ipairs(v28.ExtraCache) do
            if os.clock() - v30[2] < 60 or not table.find(v28.Active, v30) then

            end;
        end;
    end;
    v13:AddCache(v11 or 20);
    warn("CACHED CREATED");
    return v13;
end;
return v0;