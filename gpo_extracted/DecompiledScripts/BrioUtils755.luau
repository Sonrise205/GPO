local v0 = require(script.Parent.loader).load(script);
local v1 = v0("Maid");
local v2 = v0("Brio");
local v12 = {
    clone = function(v3) --[[ Line: 20 ]] --[[ Name: clone ]]
        -- upvalues: v2 (copy)
        assert(v3, "Bad brio");
        if v3:IsDead() then
            return v2.DEAD;
        else
            local v4 = v2.new(v3:GetValue());
            v4:ToMaid():GiveTask(v3:GetDiedSignal():Connect(function() --[[ Line: 29 ]]
                -- upvalues: v4 (copy)
                v4:Kill();
            end));
            return v4;
        end;
    end, 
    aliveOnly = function(v5) --[[ Line: 42 ]] --[[ Name: aliveOnly ]]
        local v6 = {};
        for _, v8 in pairs(v5) do
            if not v8:IsDead() then
                table.insert(v6, v8);
            end;
        end;
        return v6;
    end, 
    firstAlive = function(v9) --[[ Line: 58 ]] --[[ Name: firstAlive ]]
        for _, v11 in pairs(v9) do
            if not v11:IsDead() then
                return v11;
            end;
        end;
        return nil;
    end
};
v12.flatten = function(v13) --[[ Line: 74 ]] --[[ Name: flatten ]]
    -- upvalues: v2 (copy), v12 (copy)
    local v14 = {};
    local v15 = {};
    for v16, v17 in pairs(v13) do
        if v2.isBrio(v17) then
            if v17:IsDead() then
                return v2.DEAD;
            else
                table.insert(v15, v17);
                v14[v16] = v17:GetValue();
            end;
        else
            v14[v16] = v17;
        end;
    end;
    return v12.first(v15, v14);
end;
v12.first = function(v18, ...) --[[ Line: 102 ]] --[[ Name: first ]]
    -- upvalues: v2 (copy), v1 (copy)
    for _, v20 in pairs(v18) do
        if v2.isBrio(v20) and v20:IsDead() then
            return v2.DEAD;
        end;
    end;
    local v21 = v1.new();
    local v22 = v2.new(...);
    for _, v24 in pairs(v18) do
        if v2.isBrio(v24) then
            v21:GiveTask(v24:GetDiedSignal():Connect(function() --[[ Line: 116 ]]
                -- upvalues: v22 (copy)
                v22:Kill();
            end));
        end;
    end;
    v21:GiveTask(v22:GetDiedSignal():Connect(function() --[[ Line: 122 ]]
        -- upvalues: v21 (copy)
        v21:DoCleaning();
    end));
    return v22;
end;
v12.withOtherValues = function(v25, ...) --[[ Line: 138 ]] --[[ Name: withOtherValues ]]
    -- upvalues: v2 (copy)
    assert(v25, "Bad brio");
    if v25:IsDead() then
        return v2.DEAD;
    else
        local v26 = v2.new(...);
        v26:ToMaid():GiveTask(v25:GetDiedSignal():Connect(function() --[[ Line: 147 ]]
            -- upvalues: v26 (copy)
            v26:Kill();
        end));
        return v26;
    end;
end;
v12.extend = function(v27, ...) --[[ Line: 162 ]] --[[ Name: extend ]]
    -- upvalues: v2 (copy), v1 (copy)
    if v27:IsDead() then
        return v2.DEAD;
    else
        local l__values_0 = v27._values;
        local v29 = {};
        for v30 = 1, l__values_0.n do
            v29[v30] = l__values_0[v30];
        end;
        local v31 = table.pack(...);
        for v32 = 1, v31.n do
            v29[l__values_0.n + v32] = v31[v32];
        end;
        local v33 = v1.new();
        local v34 = v2.new(unpack(v29, 1, l__values_0.n + v31.n));
        v33:GiveTask(v27:GetDiedSignal():Connect(function() --[[ Line: 180 ]]
            -- upvalues: v34 (copy)
            v34:Kill();
        end));
        v33:GiveTask(v34:GetDiedSignal():Connect(function() --[[ Line: 184 ]]
            -- upvalues: v33 (copy)
            v33:DoCleaning();
        end));
        return v34;
    end;
end;
v12.prepend = function(v35, ...) --[[ Line: 200 ]] --[[ Name: prepend ]]
    -- upvalues: v2 (copy), v1 (copy)
    if v35:IsDead() then
        return v2.DEAD;
    else
        local l__values_1 = v35._values;
        local v37 = {};
        local v38 = table.pack(...);
        for v39 = 1, v38.n do
            v37[v39] = v38[v39];
        end;
        for v40 = 1, l__values_1.n do
            v37[v38.n + v40] = l__values_1[v40];
        end;
        local v41 = v1.new();
        local v42 = v2.new(unpack(v37, 1, l__values_1.n + v38.n));
        v41:GiveTask(v35:GetDiedSignal():Connect(function() --[[ Line: 218 ]]
            -- upvalues: v42 (copy)
            v42:Kill();
        end));
        v41:GiveTask(v42:GetDiedSignal():Connect(function() --[[ Line: 222 ]]
            -- upvalues: v41 (copy)
            v41:DoCleaning();
        end));
        return v42;
    end;
end;
v12.merge = function(v43, v44) --[[ Line: 236 ]] --[[ Name: merge ]]
    -- upvalues: v2 (copy), v1 (copy)
    assert(v2.isBrio(v43), "Not a brio");
    assert(v2.isBrio(v44), "Not a brio");
    if v43:IsDead() or v44:IsDead() then
        return v2.DEAD;
    else
        local l__values_2 = v43._values;
        local v46 = {};
        for v47 = 1, l__values_2.n do
            v46[v47] = l__values_2[v47];
        end;
        local l__values_3 = v44._values;
        for v49 = 1, l__values_3.n do
            v46[l__values_2.n + v49] = l__values_3[v49];
        end;
        local v50 = v1.new();
        local v51 = v2.new(unpack(v46, 1, l__values_2.n + l__values_3.n));
        v50:GiveTask(v43:GetDiedSignal():Connect(function() --[[ Line: 258 ]]
            -- upvalues: v51 (copy)
            v51:Kill();
        end));
        v50:GiveTask(v44:GetDiedSignal():Connect(function() --[[ Line: 261 ]]
            -- upvalues: v51 (copy)
            v51:Kill();
        end));
        v50:GiveTask(v51:GetDiedSignal():Connect(function() --[[ Line: 265 ]]
            -- upvalues: v50 (copy)
            v50:DoCleaning();
        end));
        return v51;
    end;
end;
return v12;