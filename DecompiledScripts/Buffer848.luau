--!native
local v0 = {};
v0.__index = v0;
local v1 = require(script.Dedicated);
local l_tostring_0 = buffer.tostring;
local l_fromstring_0 = buffer.fromstring;
local l_readu8_0 = buffer.readu8;
local l_readi8_0 = buffer.readi8;
local l_readu16_0 = buffer.readu16;
local l_readi16_0 = buffer.readi16;
local l_readi32_0 = buffer.readi32;
local l_readf32_0 = buffer.readf32;
local l_readf64_0 = buffer.readf64;
local l_readstring_0 = buffer.readstring;
local l_len_0 = buffer.len;
local function v13(v14, v15, v16) --[[ Line: 21 ]] --[[ Name: readValue ]]
    -- upvalues: l_readi8_0 (copy), l_readu8_0 (copy), l_readu16_0 (copy), v13 (copy), l_readstring_0 (copy), l_readi16_0 (copy), l_readi32_0 (copy), l_readf64_0 (copy), l_readf32_0 (copy)
    local v17 = l_readi8_0(v14, v15);
    v15 = v15 + 1;
    if v17 == 0 then
        return nil, v15;
    elseif v17 == -1 then
        if not v16 or #v16 == 0 then
            return nil, v15 + 1;
        else
            local v18 = v16[l_readu8_0(v14, v15)];
            if typeof(v18) == "Instance" then
                return v18, v15 + 1;
            else
                return nil, v15 + 1;
            end;
        end;
    elseif v17 == -2 then
        local v19 = l_readu16_0(v14, v15);
        v15 = v15 + 2;
        local v20 = {};
        for _ = 1, v19 do
            local v22 = nil;
            local v23, v24 = v13(v14, v15, v16);
            v22 = v23;
            v15 = v24;
            table.insert(v20, v22);
        end;
        return v20, v15;
    elseif v17 == -3 then
        local v25 = l_readu16_0(v14, v15);
        v15 = v15 + 2;
        local v26 = {};
        for _ = 1, v25 do
            local v28 = nil;
            local v29 = nil;
            local v30, v31 = v13(v14, v15, v16);
            v28 = v30;
            v30, v31 = v13(v14, v31, v16);
            v29 = v30;
            v15 = v31;
            v26[v28] = v29;
        end;
        return v26, v15;
    elseif v17 == -4 then
        local v32 = l_readi8_0(v14, v15);
        local v33 = l_readstring_0(v14, v15 + 1, v32);
        local v34 = l_readu8_0(v14, v15 + 1 + v32);
        return Enum[v33]:FromValue(v34), v15 + 2 + v32;
    elseif v17 == -5 then
        local v35 = l_readi16_0(v14, v15);
        return BrickColor.new(v35), v15 + 2;
    elseif v17 == -6 then
        local v36 = l_readi8_0(v14, v15);
        local v37 = l_readstring_0(v14, v15 + 1, v36);
        return Enum[v37], v15 + 1 + v36;
    elseif v17 == 1 then
        return l_readu8_0(v14, v15), v15 + 1;
    elseif v17 == 2 then
        return l_readi16_0(v14, v15), v15 + 2;
    elseif v17 == 3 then
        return l_readi32_0(v14, v15), v15 + 4;
    elseif v17 == 4 then
        return l_readf64_0(v14, v15), v15 + 8;
    elseif v17 == 5 then
        return l_readu8_0(v14, v15) == 1, v15 + 1;
    elseif v17 == 6 then
        local v38 = l_readu8_0(v14, v15);
        return l_readstring_0(v14, v15 + 1, v38), v15 + v38 + 1;
    elseif v17 == 7 then
        local v39 = l_readu16_0(v14, v15);
        return l_readstring_0(v14, v15 + 2, v39), v15 + v39 + 2;
    elseif v17 == 8 then
        local v40 = l_readi32_0(v14, v15);
        return l_readstring_0(v14, v15 + 4, v40), v15 + v40 + 4;
    elseif v17 == 9 then
        return Vector3.new(l_readf32_0(v14, v15), l_readf32_0(v14, v15 + 4), (l_readf32_0(v14, v15 + 8))), v15 + 12;
    elseif v17 == 10 then
        local v41 = l_readf32_0(v14, v15);
        local v42 = l_readf32_0(v14, v15 + 8);
        return Vector2.new(v41, v42), v15 + 8;
    elseif v17 == 11 then
        local v43 = {};
        for v44 = 1, 12 do
            table.insert(v43, (l_readf32_0(v14, v15 + (v44 - 1) * 4)));
        end;
        return CFrame.new(unpack(v43)), v15 + 48;
    elseif v17 == 12 then
        local v45 = l_readu8_0(v14, v15);
        local v46 = l_readu8_0(v14, v15 + 1);
        local v47 = l_readu8_0(v14, v15 + 2);
        return Color3.fromRGB(v45, v46, v47), v15 + 3;
    else
        error((("Unsupported type marker: %*"):format(v17)));
        return;
    end;
end;
v0.new = function() --[[ Line: 119 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy)
    return v1();
end;
v0.convert = function(v48) --[[ Line: 123 ]] --[[ Name: convert ]]
    -- upvalues: l_tostring_0 (copy)
    return l_tostring_0(v48);
end;
v0.revert = function(v49) --[[ Line: 127 ]] --[[ Name: revert ]]
    -- upvalues: l_fromstring_0 (copy)
    return l_fromstring_0(v49);
end;
v0.write = function(v50) --[[ Line: 131 ]] --[[ Name: write ]]
    -- upvalues: v1 (copy)
    local v51 = v1();
    v51:pack(v50);
    return v51:buildAndRemove();
end;
v0.read = function(v52, v53) --[[ Line: 137 ]] --[[ Name: read ]]
    -- upvalues: l_len_0 (copy), v13 (copy)
    local v54 = 0;
    local v55 = {};
    while v54 < l_len_0(v52) do
        local v56 = nil;
        local v57, v58 = v13(v52, v54, v53);
        v56 = v57;
        v54 = v58;
        table.insert(v55, v56);
    end;
    v53 = nil;
    return table.unpack(v55);
end;
return v0;