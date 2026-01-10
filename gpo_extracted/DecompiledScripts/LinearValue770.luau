local v0 = {
    ClassName = "LinearValue"
};
v0.__index = v0;
v0.new = function(v1, v2) --[[ Line: 17 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({
        _constructor = v1, 
        _values = v2
    }, v0));
end;
v0.isLinear = function(v3) --[[ Line: 30 ]] --[[ Name: isLinear ]]
    -- upvalues: v0 (copy)
    local v4 = false;
    if type(v3) == "table" then
        v4 = getmetatable(v3) == v0;
    end;
    return v4;
end;
v0.ToBaseValue = function(v5) --[[ Line: 39 ]] --[[ Name: ToBaseValue ]]
    return v5._constructor(unpack(v5._values));
end;
local function _(v6) --[[ Line: 43 ]] --[[ Name: operation ]]
    -- upvalues: v0 (copy)
    return function(v7, v8) --[[ Line: 44 ]]
        -- upvalues: v0 (ref), v6 (copy)
        if v0.isLinear(v7) and v0.isLinear(v8) then
            assert(v7._constructor == v8._constructor, "a is not the same type of linearValue as b");
            local v9 = {};
            for v10 = 1, #v7._values do
                v9[v10] = v6(v7._values[v10], v8._values[v10]);
            end;
            return v0.new(v7._constructor, v9);
        elseif v0.isLinear(v7) then
            if type(v8) == "number" then
                local v11 = {};
                for v12 = 1, #v7._values do
                    v11[v12] = v6(v7._values[v12], v8);
                end;
                return v0.new(v7._constructor, v11);
            else
                error("Bad type (b)");
                return;
            end;
        elseif v0.isLinear(v8) then
            if type(v7) == "number" then
                local v13 = {};
                for v14 = 1, #v8._values do
                    v13[v14] = v6(v7, v8._values[v14]);
                end;
                return v0.new(v8._constructor, v13);
            else
                error("Bad type (a)");
                return;
            end;
        else
            error("Neither value is a linearValue");
            return;
        end;
    end;
end;
v0.GetMagnitude = function(v16) --[[ Line: 84 ]] --[[ Name: GetMagnitude ]]
    local v17 = 0;
    for v18 = 1, #v16._values do
        local v19 = v16._values[v18];
        v17 = v17 + v19 * v19;
    end;
    return (math.sqrt(v17));
end;
v0.__index = function(v20, v21) --[[ Line: 100 ]] --[[ Name: __index ]]
    -- upvalues: v0 (copy)
    if v0[v21] then
        return v0[v21];
    elseif v21 == "magnitude" then
        return v20:GetMagnitude();
    else
        return nil;
    end;
end;
local function v24(v22, v23) --[[ Line: 110 ]]
    return v22 + v23;
end;
local l_v24_0 = v24 --[[ copy: 3 -> 4 ]];
v0.__add = function(v26, v27) --[[ Line: 44 ]]
    -- upvalues: v0 (copy), l_v24_0 (copy)
    if v0.isLinear(v26) and v0.isLinear(v27) then
        assert(v26._constructor == v27._constructor, "a is not the same type of linearValue as b");
        local v28 = {};
        for v29 = 1, #v26._values do
            v28[v29] = l_v24_0(v26._values[v29], v27._values[v29]);
        end;
        return v0.new(v26._constructor, v28);
    elseif v0.isLinear(v26) then
        if type(v27) == "number" then
            local v30 = {};
            for v31 = 1, #v26._values do
                v30[v31] = l_v24_0(v26._values[v31], v27);
            end;
            return v0.new(v26._constructor, v30);
        else
            error("Bad type (b)");
            return;
        end;
    elseif v0.isLinear(v27) then
        if type(v26) == "number" then
            local v32 = {};
            for v33 = 1, #v27._values do
                v32[v33] = l_v24_0(v26, v27._values[v33]);
            end;
            return v0.new(v27._constructor, v32);
        else
            error("Bad type (a)");
            return;
        end;
    else
        error("Neither value is a linearValue");
        return;
    end;
end;
v24 = function(v34, v35) --[[ Line: 114 ]]
    return v34 - v35;
end;
local l_v24_1 = v24 --[[ copy: 3 -> 5 ]];
v0.__sub = function(v37, v38) --[[ Line: 44 ]]
    -- upvalues: v0 (copy), l_v24_1 (copy)
    if v0.isLinear(v37) and v0.isLinear(v38) then
        assert(v37._constructor == v38._constructor, "a is not the same type of linearValue as b");
        local v39 = {};
        for v40 = 1, #v37._values do
            v39[v40] = l_v24_1(v37._values[v40], v38._values[v40]);
        end;
        return v0.new(v37._constructor, v39);
    elseif v0.isLinear(v37) then
        if type(v38) == "number" then
            local v41 = {};
            for v42 = 1, #v37._values do
                v41[v42] = l_v24_1(v37._values[v42], v38);
            end;
            return v0.new(v37._constructor, v41);
        else
            error("Bad type (b)");
            return;
        end;
    elseif v0.isLinear(v38) then
        if type(v37) == "number" then
            local v43 = {};
            for v44 = 1, #v38._values do
                v43[v44] = l_v24_1(v37, v38._values[v44]);
            end;
            return v0.new(v38._constructor, v43);
        else
            error("Bad type (a)");
            return;
        end;
    else
        error("Neither value is a linearValue");
        return;
    end;
end;
v24 = function(v45, v46) --[[ Line: 118 ]]
    return v45 * v46;
end;
local l_v24_2 = v24 --[[ copy: 3 -> 6 ]];
v0.__mul = function(v48, v49) --[[ Line: 44 ]]
    -- upvalues: v0 (copy), l_v24_2 (copy)
    if v0.isLinear(v48) and v0.isLinear(v49) then
        assert(v48._constructor == v49._constructor, "a is not the same type of linearValue as b");
        local v50 = {};
        for v51 = 1, #v48._values do
            v50[v51] = l_v24_2(v48._values[v51], v49._values[v51]);
        end;
        return v0.new(v48._constructor, v50);
    elseif v0.isLinear(v48) then
        if type(v49) == "number" then
            local v52 = {};
            for v53 = 1, #v48._values do
                v52[v53] = l_v24_2(v48._values[v53], v49);
            end;
            return v0.new(v48._constructor, v52);
        else
            error("Bad type (b)");
            return;
        end;
    elseif v0.isLinear(v49) then
        if type(v48) == "number" then
            local v54 = {};
            for v55 = 1, #v49._values do
                v54[v55] = l_v24_2(v48, v49._values[v55]);
            end;
            return v0.new(v49._constructor, v54);
        else
            error("Bad type (a)");
            return;
        end;
    else
        error("Neither value is a linearValue");
        return;
    end;
end;
v24 = function(v56, v57) --[[ Line: 122 ]]
    return v56 / v57;
end;
v0.__div = function(v58, v59) --[[ Line: 44 ]]
    -- upvalues: v0 (copy), v24 (copy)
    if v0.isLinear(v58) and v0.isLinear(v59) then
        assert(v58._constructor == v59._constructor, "a is not the same type of linearValue as b");
        local v60 = {};
        for v61 = 1, #v58._values do
            v60[v61] = v24(v58._values[v61], v59._values[v61]);
        end;
        return v0.new(v58._constructor, v60);
    elseif v0.isLinear(v58) then
        if type(v59) == "number" then
            local v62 = {};
            for v63 = 1, #v58._values do
                v62[v63] = v24(v58._values[v63], v59);
            end;
            return v0.new(v58._constructor, v62);
        else
            error("Bad type (b)");
            return;
        end;
    elseif v0.isLinear(v59) then
        if type(v58) == "number" then
            local v64 = {};
            for v65 = 1, #v59._values do
                v64[v65] = v24(v58, v59._values[v65]);
            end;
            return v0.new(v59._constructor, v64);
        else
            error("Bad type (a)");
            return;
        end;
    else
        error("Neither value is a linearValue");
        return;
    end;
end;
v0.__eq = function(_, v67, v68) --[[ Line: 126 ]] --[[ Name: __eq ]]
    -- upvalues: v0 (copy)
    if v0.isLinear(v67) and v0.isLinear(v68) then
        if #v67._values ~= #v68._values then
            return false;
        else
            for v69 = 1, #v67._values do
                if v67._values[v69] ~= v68._values[v69] then
                    return false;
                end;
            end;
            return true;
        end;
    else
        return false;
    end;
end;
return v0;