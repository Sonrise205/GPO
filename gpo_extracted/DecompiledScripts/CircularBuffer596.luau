local function _(v0, v1) --[[ Line: 3 ]] --[[ Name: rotate_indice ]]
    return (v0 - 1) % v1 + 1;
end;
local v6 = {
    filled = function(v3) --[[ Line: 9 ]] --[[ Name: filled ]]
        return #v3.history == v3.max_length;
    end, 
    push = function(v4, v5) --[[ Line: 13 ]] --[[ Name: push ]]
        if v4:filled() then
            v4.history[v4.oldest] = v5;
            v4.oldest = v4.oldest == v4.max_length and 1 or v4.oldest + 1;
            return;
        else
            v4.history[#v4.history + 1] = v5;
            return;
        end;
    end, 
    metatable = {}
};
v6.metatable.__index = function(v7, v8) --[[ Line: 27 ]] --[[ Name: __index ]]
    local v9 = #v7.history;
    if v8 == 0 or v9 < math.abs(v8) then
        return nil;
    elseif v8 >= 1 then
        local v10 = (v7.oldest - v8 - 1) % v9 + 1;
        return v7.history[v10];
    elseif v8 <= -1 then
        local v11 = (v8 + 1 + v7.oldest - 1) % v9 + 1;
        return v7.history[v11];
    else
        return;
    end;
end;
v6.metatable.__len = function(v12) --[[ Line: 41 ]] --[[ Name: __len ]]
    return #v12.history;
end;
v6.new = function(v13) --[[ Line: 45 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy)
    if type(v13) ~= "number" or v13 <= 1 then
        error("Buffer length must be a positive integer");
    end;
    local v14 = {
        history = {}, 
        oldest = 1, 
        max_length = v13, 
        push = v6.push, 
        filled = v6.filled
    };
    setmetatable(v14, v6.metatable);
    return v14;
end;
return v6;