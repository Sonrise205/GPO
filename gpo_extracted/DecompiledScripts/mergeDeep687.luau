local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.None);
local v2 = require(script.Parent.copyDeep);
local function v3(...) --[[ Line: 28 ]] --[[ Name: mergeDeep ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy)
    local v4 = {};
    for v5 = 1, select("#", ...) do
        local v6 = select(v5, ...);
        if type(v6) == "table" then
            for v7, v8 in pairs(v6) do
                if v8 == v1 then
                    v4[v7] = nil;
                elseif type(v8) == "table" then
                    if v4[v7] == nil or type(v4[v7]) ~= "table" then
                        v4[v7] = v2(v8);
                    else
                        v4[v7] = v3(v4[v7], v8);
                    end;
                else
                    v4[v7] = v8;
                end;
            end;
        end;
    end;
    return v4;
end;
return v3;