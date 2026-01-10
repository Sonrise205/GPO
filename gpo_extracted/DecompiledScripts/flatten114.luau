local function v0(v1, v2) --[[ Line: 24 ]] --[[ Name: flatten ]]
    -- upvalues: v0 (copy)
    if type(v2) ~= "number" then
        v2 = 1e999;
    end;
    local v3 = {};
    for _, v5 in ipairs(v1) do
        if type(v5) == "table" and v2 > 0 then
            local v6 = v0(v5, v2 - 1);
            for _, v8 in ipairs(v6) do
                table.insert(v3, v8);
            end;
        else
            table.insert(v3, v5);
        end;
    end;
    return v3;
end;
return v0;