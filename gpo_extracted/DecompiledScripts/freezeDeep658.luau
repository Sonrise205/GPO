local function v0(v1) --[[ Line: 21 ]] --[[ Name: freezeDeep ]]
    -- upvalues: v0 (copy)
    local v2 = {};
    for v3 = 1, #v1 do
        local v4 = v1[v3];
        if type(v4) == "table" then
            table.insert(v2, v0(v4));
        else
            table.insert(v2, v4);
        end;
    end;
    table.freeze(v2);
    return v2;
end;
return v0;