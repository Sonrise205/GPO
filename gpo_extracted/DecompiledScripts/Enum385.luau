local v0 = {};
local v1 = {};
v0.enums = v1;
v0.createEnum = function(v2, v3) --[[ Line: 6 ]] --[[ Name: createEnum ]]
    -- upvalues: v1 (copy)
    assert(typeof(v2) == "string", "bad argument #1 - enums must be created using a string name!");
    assert(typeof(v3) == "table", "bad argument #2 - enums must be created using a table!");
    assert(not v1[v2], ("enum '%s' already exists!"):format(v2));
    local v4 = {};
    local v5 = {};
    local v6 = {};
    local v7 = {};
    local v14 = {
        getName = function(v8) --[[ Line: 16 ]] --[[ Name: getName ]]
            -- upvalues: v6 (copy), v7 (copy), v3 (copy)
            v8 = tostring(v8);
            local v9 = v6[v8] or v7[v8];
            if v9 then
                return v3[v9][1];
            else
                return;
            end;
        end, 
        getValue = function(v10) --[[ Line: 26 ]] --[[ Name: getValue ]]
            -- upvalues: v5 (copy), v7 (copy), v3 (copy)
            v10 = tostring(v10);
            local v11 = v5[v10] or v7[v10];
            if v11 then
                return v3[v11][2];
            else
                return;
            end;
        end, 
        getProperty = function(v12) --[[ Line: 36 ]] --[[ Name: getProperty ]]
            -- upvalues: v5 (copy), v6 (copy), v3 (copy)
            v12 = tostring(v12);
            local v13 = v5[v12] or v6[v12];
            if v13 then
                return v3[v13][3];
            else
                return;
            end;
        end
    };
    for v15, v16 in pairs(v3) do
        assert(typeof(v16) == "table", ("bad argument #2.%s - details must only be comprised of tables!"):format(v15));
        local v17 = v16[1];
        assert(typeof(v17) == "string", ("bad argument #2.%s.1 - detail name must be a string!"):format(v15));
        assert(typeof(not v5[v17]), ("bad argument #2.%s.1 - the detail name '%s' already exists!"):format(v15, v17));
        assert(typeof(not v14[v17]), ("bad argument #2.%s.1 - that name is reserved."):format(v15, v17));
        v5[tostring(v17)] = v15;
        local v18 = v16[2];
        local v19 = tostring(v18);
        assert(typeof(not v6[v19]), ("bad argument #2.%s.2 - the detail value '%s' already exists!"):format(v15, v19));
        v6[v19] = v15;
        local v20 = v16[3];
        if v20 then
            assert(typeof(not v7[v20]), ("bad argument #2.%s.3 - the detail property '%s' already exists!"):format(v15, (tostring(v20))));
            v7[tostring(v20)] = v15;
        end;
        v4[v17] = v18;
        setmetatable(v4, {
            __index = function(_, v22) --[[ Line: 66 ]] --[[ Name: __index ]]
                -- upvalues: v14 (copy)
                return v14[v22];
            end
        });
    end;
    v1[v2] = v4;
    return v4;
end;
v0.getEnums = function() --[[ Line: 76 ]] --[[ Name: getEnums ]]
    -- upvalues: v1 (copy)
    return v1;
end;
local l_createEnum_0 = v0.createEnum;
for _, v25 in pairs(script:GetChildren()) do
    if v25:IsA("ModuleScript") then
        local v26 = require(v25);
        l_createEnum_0(v25.Name, v26);
    end;
end;
return v0;