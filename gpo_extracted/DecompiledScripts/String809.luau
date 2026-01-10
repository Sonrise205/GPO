local v0 = {};
local v1 = nil;
v0.encode = function(v2) --[[ Line: 10 ]] --[[ Name: encode ]]
    -- upvalues: v1 (ref)
    if not v1 then
        v1 = {};
        for v3 = 0, 127 do
            local v4 = -1;
            repeat
                v4 = v4 + 2;
            until v4 * (2 * v3 + 1) % 256 == 1;
            v1[v3] = v4;
        end;
    end;
    local v5 = 666666;
    local _ = 460828;
    return (v2:gsub(".", function(v7) --[[ Line: 22 ]]
        -- upvalues: v5 (ref), v1 (ref)
        local v8 = v5 % 274877906944;
        local v9 = (v5 - v8) / 274877906944;
        local v10 = v9 % 128;
        v7 = v7:byte();
        local v11 = (v7 * v1[v10] - (v9 - v10) / 128) % 256;
        v5 = v8 * 460828 + v9 + v11 + v7;
        return ("%02x"):format(v11);
    end));
end;
v0.decode = function(v12) --[[ Line: 34 ]] --[[ Name: decode ]]
    local v13 = 666666;
    local _ = 460828;
    if v12 == nil then
        return "";
    else
        return (v12:gsub("%x%x", function(v15) --[[ Line: 40 ]]
            -- upvalues: v13 (ref)
            local v16 = v13 % 274877906944;
            local v17 = (v13 - v16) / 274877906944;
            local v18 = v17 % 128;
            v15 = tonumber(v15, 16);
            local v19 = (v15 + (v17 - v18) / 128) * (v18 * 2 + 1) % 256;
            v13 = v16 * 460828 + v17 + v15 + v19;
            return (string.char(v19));
        end));
    end;
end;
return v0;