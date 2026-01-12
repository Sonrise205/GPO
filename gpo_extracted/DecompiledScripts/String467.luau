local v12 = {
    trim = function(v0, v1) --[[ Line: 15 ]] --[[ Name: trim ]]
        if not v1 then
            return v0:match("^%s*(.-)%s*$");
        else
            return v0:match("^" .. v1 .. "*(.-)" .. v1 .. "*$");
        end;
    end, 
    toCamelCase = function(v2) --[[ Line: 31 ]] --[[ Name: toCamelCase ]]
        return (v2:lower():gsub("[ _](%a)", string.upper):gsub("^%a", string.upper):gsub("%p", ""));
    end, 
    uppercaseFirstLetter = function(v3) --[[ Line: 46 ]] --[[ Name: uppercaseFirstLetter ]]
        return v3:gsub("^%a", string.upper);
    end, 
    toLowerCamelCase = function(v4) --[[ Line: 55 ]] --[[ Name: toLowerCamelCase ]]
        return (v4:lower():gsub("[ _](%a)", string.upper):gsub("^%a", string.lower):gsub("%p", ""));
    end, 
    toPrivateCase = function(v5) --[[ Line: 69 ]] --[[ Name: toPrivateCase ]]
        return "_" .. v5:sub(1, 1):lower() .. v5:sub(2, #v5);
    end, 
    trimFront = function(v6, v7) --[[ Line: 79 ]] --[[ Name: trimFront ]]
        v7 = v7 or "%s";
        return (v6:gsub("^" .. v7 .. "*(.-)" .. v7 .. "*", "%1"));
    end, 
    checkNumOfCharacterInString = function(v8, v9) --[[ Line: 95 ]] --[[ Name: checkNumOfCharacterInString ]]
        local v10 = 0;
        for _ in string.gmatch(v8, v9) do
            v10 = v10 + 1;
        end;
        return v10;
    end
};
v12.isEmptyOrWhitespaceOrNil = function(v13) --[[ Line: 108 ]] --[[ Name: isEmptyOrWhitespaceOrNil ]]
    -- upvalues: v12 (copy)
    local v14 = true;
    if type(v13) == "string" then
        v14 = true;
        if v13 ~= "" then
            v14 = v12.isWhitespace(v13);
        end;
    end;
    return v14;
end;
v12.isWhitespace = function(v15) --[[ Line: 117 ]] --[[ Name: isWhitespace ]]
    return string.match(v15, "[%s]+") == v15;
end;
v12.elipseLimit = function(v16, v17) --[[ Line: 127 ]] --[[ Name: elipseLimit ]]
    if v17 < #v16 then
        v16 = v16:sub(1, v17 - 3) .. "...";
    end;
    return v16;
end;
v12.removePrefix = function(v18, v19) --[[ Line: 140 ]] --[[ Name: removePrefix ]]
    if v18:sub(1, #v19) == v19 then
        return v18:sub(#v19 + 1);
    else
        return v18;
    end;
end;
v12.removePostfix = function(v20, v21) --[[ Line: 154 ]] --[[ Name: removePostfix ]]
    if v20:sub(-#v21) == v21 then
        return v20:sub(1, -#v21 - 1);
    else
        return v20;
    end;
end;
v12.endsWith = function(v22, v23) --[[ Line: 168 ]] --[[ Name: endsWith ]]
    return v22:sub(-#v23) == v23;
end;
v12.startsWith = function(v24, v25) --[[ Line: 178 ]] --[[ Name: startsWith ]]
    return v24:sub(1, #v25) == v25;
end;
v12.addCommas = function(v26) --[[ Line: 187 ]] --[[ Name: addCommas ]]
    if type(v26) == "number" then
        v26 = tostring(v26);
    end;
    local v27 = -1;
    while v27 ~= 0 do
        local v28, v29 = string.gsub(v26, "^(-?%d+)(%d%d%d)", "%1,%2");
        v26 = v28;
        v27 = v29;
    end;
    return v26;
end;
return v12;