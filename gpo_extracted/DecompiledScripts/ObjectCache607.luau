local v0 = require("../mod/utility");
local v1 = {};
v1.__index = v1;
local function _(v2, v3) --[[ Line: 39 ]] --[[ Name: reconcile ]]
    for v4, v5 in v3 do
        if v2[v4] == nil then
            v2[v4] = v5;
        end;
    end;
    return v2;
end;
local v7 = table.create(10000);
local v8 = table.create(10000);
local v9 = false;
local v10 = coroutine.create(function() --[[ Line: 54 ]]
    -- upvalues: v7 (copy), v8 (copy), v9 (ref)
    while true do
        workspace:BulkMoveTo(v7, v8, Enum.BulkMoveMode.FireCFrameChanged);
        table.clear(v7);
        table.clear(v8);
        v9 = false;
        coroutine.yield();
    end;
end);
v1.new = function(v11, v12, v13) --[[ Line: 67 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy)
    local v14 = setmetatable({}, v1);
    v14.ref = v11;
    v14.parent = v12;
    v14.amount = 0;
    v14.restore_amount = 0;
    local v15 = v13 or {};
    for v16, v17 in {
        size = 100, 
        excess_lifetime = 30
    } do
        if v15[v16] == nil then
            v15[v16] = v17;
        end;
    end;
    v14.params = v15;
    v14.scope = {
        v11, 
        v12
    };
    v14.unused = table.create(v14.params.size);
    v14.item_map = {};
    v14.part_mode = v11:IsA("BasePart");
    for _ = 1, v14.params.size do
        v14:_add();
    end;
    table.insert(v14.scope, task.spawn(function() --[[ Line: 93 ]]
        -- upvalues: v14 (copy)
        while task.wait(15) do
            if v14.restore_amount > 0 then
                for _ = 1, v14.restore_amount do
                    v14:_add();
                    local l_v14_0 = v14;
                    l_v14_0.restore_amount = l_v14_0.restore_amount - 1;
                end;
            end;
            if v14.amount > v14.params.size then
                local v21 = 0;
                for v22 = 1, #v14.unused do
                    local l_v22_0 = v22;
                    if v14.amount > v14.params.size then
                        l_v22_0 = l_v22_0 - v21;
                        local v24 = v14.unused[l_v22_0];
                        if v24.dependents == 0 and os.clock() - v24.added <= v14.params.excess_lifetime then
                            v24.value:Destroy();
                            table.remove(v14.unused, l_v22_0);
                            v14.item_map[v24.key] = nil;
                            local l_v14_1 = v14;
                            l_v14_1.amount = l_v14_1.amount - 1;
                            v21 = v21 + 1;
                        end;
                    else
                        break;
                    end;
                end;
            end;
        end;
    end));
    return v14;
end;
v1._add = function(v26, v27, v28) --[[ Line: 137 ]] --[[ Name: _add ]]
    local v29 = v26.ref:Clone();
    v29.Archivable = false;
    v29.Parent = v26.parent;
    local v30 = {
        key = v27, 
        value = v29, 
        added = os.clock(), 
        dependents = 1
    };
    v26.amount = v26.amount + 1;
    v29.Destroying:Connect(function() --[[ Line: 152 ]]
        -- upvalues: v26 (copy), v30 (copy)
        local v31 = table.find(v26.unused, v30);
        if v31 then
            table.remove(v26.unused, v31);
        end;
        if v30.key then
            v26.item_map[v30.key] = nil;
        end;
        local l_v26_0 = v26;
        l_v26_0.amount = l_v26_0.amount - 1;
        l_v26_0 = v26;
        l_v26_0.restore_amount = l_v26_0.restore_amount + 1;
    end);
    if v27 then
        v26.item_map[v27] = v30;
    end;
    if not v28 then
        table.insert(v26.unused, v30);
    end;
    return v30;
end;
v1.has = function(v33, v34) --[[ Line: 178 ]] --[[ Name: has ]]
    if v33.item_map[v34] then
        return true;
    else
        return false;
    end;
end;
v1.peek = function(v35, v36) --[[ Line: 182 ]] --[[ Name: peek ]]
    return v35.item_map[v36];
end;
v1.get = function(v37, v38) --[[ Line: 186 ]] --[[ Name: get ]]
    -- upvalues: v7 (copy), v8 (copy), v9 (ref), v10 (copy)
    if v37:has(v38) then
        local v39 = v37:peek(v38);
        if v39 then
            v39.dependents = v39.dependents + 1;
        end;
        return v39.value;
    else
        local v40 = table.remove(v37.unused);
        if v40 then
            v40.key = v38;
            v40.added = os.clock();
            v37.item_map[v38] = v40;
        else
            v40 = v37:_add(v38, true);
        end;
        if v37.part_mode then
            local v48 = {
                __newindex = function(_, v42, v43) --[[ Line: 211 ]] --[[ Name: __newindex ]]
                    -- upvalues: v7 (ref), v40 (ref), v8 (ref), v9 (ref), v10 (ref)
                    if v42 == "CFrame" then
                        table.insert(v7, v40.value);
                        table.insert(v8, v43);
                        if not v9 then
                            v9 = true;
                            task.defer(v10);
                            return;
                        end;
                    else
                        v40.value[v42] = v43;
                    end;
                end, 
                __index = function(_, v45) --[[ Line: 225 ]] --[[ Name: __index ]]
                    -- upvalues: v40 (ref)
                    local v46 = v40.value[v45];
                    if typeof(v46) == "function" then
                        return function(_, ...) --[[ Line: 229 ]]
                            -- upvalues: v46 (copy), v40 (ref)
                            return v46(v40.value, ...);
                        end;
                    else
                        return v46;
                    end;
                end
            };
            return (setmetatable({
                _getReal = function() --[[ Line: 238 ]] --[[ Name: _getReal ]]
                    -- upvalues: v40 (ref)
                    return v40.value;
                end
            }, v48));
        else
            return v40.value;
        end;
    end;
end;
v1.free = function(v49, v50) --[[ Line: 247 ]] --[[ Name: free ]]
    local v51 = v49.item_map[v50];
    if not v51 then
        return;
    else
        v51.dependents = math.max(v51.dependents - 1, 0);
        if v51.dependents == 0 then
            v51.added = os.clock();
            if v49.params.on_free then
                task.spawn(v49.params.on_free, v51);
            end;
            table.insert(v49.unused, v51);
        end;
        return;
    end;
end;
v1.destroy = function(v52) --[[ Line: 267 ]] --[[ Name: destroy ]]
    -- upvalues: v0 (copy)
    v0.cleanupScope(v52.scope);
    for _, v54 in v52.item_map do
        v54.value:Destroy();
    end;
    table.clear(v52.unused);
    table.clear(v52.item_map);
end;
return v1;