local function v0(v1) --[[ Line: 20 ]] --[[ Name: copyDeep ]]
    -- upvalues: v0 (copy)
    local v2 = {};
    for _, v4 in ipairs(v1) do
        if type(v4) == "table" then
            table.insert(v2, v0(v4));
        else
            table.insert(v2, v4);
        end;
    end;
    return v2;
end;
return v0;