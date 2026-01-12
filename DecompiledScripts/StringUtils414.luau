local v2 = {
    FirstToUpper = function(v0) --[[ Line: 3 ]] --[[ Name: FirstToUpper ]]
        return (v0:lower():gsub("^%l", string.upper));
    end, 
    GetNumbersFromString = function(v1) --[[ Line: 7 ]] --[[ Name: GetNumbersFromString ]]
        return string.gsub(v1, "%D", "");
    end
};
local function v4(v3) --[[ Line: 11 ]] --[[ Name: TimeFormat ]]
    return string.format("%02i", v3);
end;
v2.TimeFormat = v4;
v2.ConvertToHMS = function(v5) --[[ Line: 17 ]] --[[ Name: ConvertToHMS ]]
    -- upvalues: v4 (copy)
    local v6 = (v5 - v5 % 60) / 60;
    v5 = v5 - v6 * 60;
    local v7 = (v6 - v6 % 60) / 60;
    v6 = v6 - v7 * 60;
    return string.format("%02i", v7), string.format("%02i", v6), v4(v5);
end;
return v2;