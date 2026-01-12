local function v0(v1) --[[ Line: 20 ]] --[[ Name: copyDeep ]]
    -- upvalues: v0 (copy)
    local v2 = {};
    for v3, v4 in pairs(v1) do
        if type(v4) == "table" then
            v2[v3] = v0(v4);
        else
            v2[v3] = v4;
        end;
    end;
    return v2;
end;
return v0;