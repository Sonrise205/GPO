--!native
local v0 = CFrame.new(16777216, 16777216, 16777216);
local v1 = table.create(10000);
local v2 = table.create(10000);
local v3 = false;
local function v4() --[[ Line: 10 ]] --[[ Name: UpdateMovement ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (ref)
    while true do
        workspace:BulkMoveTo(v1, v2, Enum.BulkMoveMode.FireCFrameChanged);
        table.clear(v1);
        table.clear(v2);
        v3 = false;
        coroutine.yield();
    end;
end;
local v5 = coroutine.create(v4);
local v6 = {};
v6.__index = v6;
v6._GetNew = function(v7, v8, v9) --[[ Line: 26 ]] --[[ Name: _GetNew ]]
    -- upvalues: v0 (copy)
    if v9 then
        warn((("ObjectCache: Cache retrieval exceeded preallocated amount! expanding by %*..."):format(v8)));
    end;
    local l__FreeObjects_0 = v7._FreeObjects;
    local v11 = #v7._FreeObjects;
    local l_CacheHolder_0 = v7.CacheHolder;
    local l__IsTemplateModel_0 = v7._IsTemplateModel;
    local l__Template_0 = v7._Template;
    local v15 = table.create(v8);
    local v16 = table.create(v8);
    local v17 = table.create(v8);
    for v18 = v11 + 1, v11 + v8 do
        local v19 = l__Template_0:Clone();
        local v20 = if l__IsTemplateModel_0 then v19.PrimaryPart else v19;
        l__FreeObjects_0[v18] = v20;
        local v21 = v18 - v11;
        v15[v21] = v20;
        v16[v21] = v0;
        v17[v21] = v19;
    end;
    workspace:BulkMoveTo(v15, v16, Enum.BulkMoveMode.FireCFrameChanged);
    for _, v23 in v17 do
        v23.Parent = l_CacheHolder_0;
    end;
    return table.remove(l__FreeObjects_0);
end;
v6.GetPart = function(v24, v25) --[[ Line: 62 ]] --[[ Name: GetPart ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (ref), v5 (copy)
    local v26 = table.remove(v24._FreeObjects) or v24:_GetNew(v24._ExpandAmount, true);
    v24._Objects[v26] = nil;
    if v24._ReturnFunction then
        v24._ReturnFunction(v26);
    end;
    if v25 then
        table.insert(v1, v26);
        table.insert(v2, v25);
        if not v3 then
            v3 = true;
            task.defer(v5);
        end;
    end;
    return v26;
end;
v6.ReturnPart = function(v27, v28) --[[ Line: 84 ]] --[[ Name: ReturnPart ]]
    -- upvalues: v1 (copy), v2 (copy), v0 (copy), v3 (ref), v5 (copy)
    if v27._Objects[v28] then
        return;
    else
        if v27._ReturnFunction then
            v27._ReturnFunction(v28);
        end;
        v27._Objects[v28] = true;
        table.insert(v27._FreeObjects, v28);
        table.insert(v1, v28);
        table.insert(v2, v0);
        if not v3 then
            v3 = true;
            task.defer(v5);
        end;
        return;
    end;
end;
v6.Update = function(_) --[[ Line: 105 ]] --[[ Name: Update ]]
    -- upvalues: v5 (copy)
    task.spawn(v5);
end;
v6.ExpandCache = function(v30, v31) --[[ Line: 109 ]] --[[ Name: ExpandCache ]]
    local v32 = true;
    if typeof(v31) == "number" then
        v32 = v31 >= 0;
    end;
    assert(v32, (("Invalid argument #1 to 'ObjectCache:ExpandCache' (positive number expected, got %*)"):format((typeof(v31)))));
    v30:_GetNew(v31, false);
end;
v6.SetExpandAmount = function(v33, v34) --[[ Line: 113 ]] --[[ Name: SetExpandAmount ]]
    local v35 = true;
    if typeof(v34) == "number" then
        v35 = v34 > 0;
    end;
    assert(v35, (("Invalid argument #1 to 'ObjectCache:SetExpandAmount' (positive number expected, got %*)"):format((typeof(v34)))));
    v33._ExpandAmount = v34;
end;
v6.IsInUse = function(v36, v37) --[[ Line: 118 ]] --[[ Name: IsInUse ]]
    return v36._Objects[v37] == nil;
end;
v6.Destroy = function(v38) --[[ Line: 122 ]] --[[ Name: Destroy ]]
    v38.CacheHolder:Destroy();
end;
local function _() --[[ Line: 126 ]] --[[ Name: GetCacheContainer ]]
    local l_Folder_0 = Instance.new("Folder");
    l_Folder_0.Name = "ObjectCache";
    return l_Folder_0;
end;
return {
    new = function(v41, v42, v43, v44) --[[ Line: 134 ]] --[[ Name: new ]]
        -- upvalues: v0 (copy), v6 (copy)
        local v45 = typeof(v41);
        assert(v45 == "Instance", (("Invalid argument #1 to 'ObjectCache.new' (BasePart expected, got %*)"):format(v45)));
        assert(v41:IsA("BasePart") or v41:IsA("Model"), (("Invalid argument #1 to 'ObjectCache.new' (BasePart or Model expected, got %*)"):format(v41.ClassName)));
        assert(v41.Archivable, "ObjectCache: Cannot use template object provided, as it has Archivable set to false.");
        if v41:IsA("Model") then
            assert(v41.PrimaryPart ~= nil, "Invalid Template provided to 'ObjectCache.new': Model has no PrimaryPart set!");
        end;
        local v46 = typeof(v42);
        local v47 = true;
        if v42 ~= nil then
            v47 = v46 == "number";
        end;
        assert(v47, (("Invalid argument #2 to 'ObjectCache.new' (number expected, got %*)"):format(v46)));
        v47 = true;
        if v42 ~= nil then
            v47 = v42 >= 0;
        end;
        assert(v47, (("Invalid argument #2 to 'ObjectCache.new' (positive number expected, got %*)"):format(v42)));
        local v48 = typeof(v43);
        local v49 = true;
        if v43 ~= nil then
            v49 = v48 == "Instance";
        end;
        assert(v49, (("Invalid argument #3 to 'ObjectCache.new' (Instance expected, got %*)"):format(v48)));
        v47 = v42 or 10;
        local l_Folder_1 = Instance.new("Folder");
        l_Folder_1.Name = "ObjectCache";
        v49 = l_Folder_1;
        l_Folder_1 = {};
        local v51 = table.create(v47);
        local v52 = table.create(v47);
        local v53 = v41:IsA("Model");
        for v54 = 1, v47 do
            local v55 = v41:Clone();
            local v56 = if v53 then v55.PrimaryPart else v55;
            v51[v54] = v55;
            v52[v54] = v56;
            v56.CFrame = v0;
            v55.Parent = v49;
        end;
        v49.Parent = v43 or workspace;
        return (setmetatable({
            CacheHolder = v49, 
            _ReturnFunction = v44 and v44.ReturnFunction or nil, 
            _ExpandAmount = 50, 
            _Template = v41, 
            _FreeObjects = v52, 
            _Objects = l_Folder_1, 
            _IsTemplateModel = v53, 
            _PreallocatedAmount = v47
        }, v6));
    end
};