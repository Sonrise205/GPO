local v18 = {
    __index = function(v0, v1) --[[ Line: 28 ]] --[[ Name: __index ]]
        if rawget(v0, "__baseclass") then
            return v0.__baseclass[v1];
        else
            return nil;
        end;
    end, 
    __call = function(v2, ...) --[[ Line: 35 ]] --[[ Name: __call ]]
        return v2:new(...);
    end, 
    __add = function(v3, v4) --[[ Line: 39 ]] --[[ Name: __add ]]
        return v3:addparent(v4);
    end, 
    __eq = function(v5, v6) --[[ Line: 43 ]] --[[ Name: __eq ]]
        if not v6.__baseclass or v6.__baseclass ~= v5.__baseclass then
            return false;
        else
            for v7, _ in v5 do
                if not v6[v7] then
                    return false;
                end;
            end;
            for v9, _ in v6 do
                if not v5[v9] then
                    return false;
                end;
            end;
            return true;
        end;
    end, 
    __lt = function(v11, v12) --[[ Line: 58 ]] --[[ Name: __lt ]]
        if not v12.__baseclass then
            return false;
        else
            if rawget(v12.__baseclass, "__isparenttable") then
                for _, v14 in v12.__baseclass do
                    if v11 == v14 or getmetatable(v11).__lt(v11, v14) then
                        return true;
                    end;
                end;
            elseif v11 == v12.__baseclass or getmetatable(v11).__t(v11, v12.__baseclass) then
                return true;
            end;
            return false;
        end;
    end, 
    __le = function(v15, v16) --[[ Line: 70 ]] --[[ Name: __le ]]
        local v17 = true;
        if v15 >= v16 then
            v17 = v15 == v16;
        end;
        return v17;
    end
};
local v23 = {
    __index = function(v19, v20) --[[ Line: 75 ]] --[[ Name: __index ]]
        for v21, v22 in v19 do
            if v21 ~= "__isparenttable" and v22[v20] then
                return v22[v20];
            end;
        end;
        return nil;
    end
};
class = setmetatable({
    __baseclass = {}
}, v18);
class.new = function(v24, ...) --[[ Line: 86 ]] --[[ Name: new ]]
    local v25 = {
        __baseclass = v24
    };
    setmetatable(v25, (getmetatable(v24)));
    if v25.init then
        v25:init(...);
    end;
    return v25;
end;
class.convert = function(v26, v27) --[[ Line: 96 ]] --[[ Name: convert ]]
    v27.__baseclass = v26;
    setmetatable(v27, (getmetatable(v26)));
    return v27;
end;
class.addparent = function(v28, ...) --[[ Line: 102 ]] --[[ Name: addparent ]]
    -- upvalues: v23 (copy)
    if not rawget(v28.__baseclass, "__isparenttable") then
        v28.__baseclass = setmetatable({
            __isparenttable = true; 
            v28.__baseclass, 
            ...
        }, v23);
        return v28;
    else
        for _, v30 in i({
            ...
        }) do
            table.insert(v28.__baseclass, v30);
        end;
        return v28;
    end;
end;
class.setmetamethod = function(v31, v32, v33) --[[ Line: 114 ]] --[[ Name: setmetamethod ]]
    local v34 = getmetatable(v31);
    local v35 = {};
    for v36, v37 in v34 do
        v35[v36] = v37;
    end;
    v35[v32] = v33;
    setmetatable(v31, v35);
end;
return class;