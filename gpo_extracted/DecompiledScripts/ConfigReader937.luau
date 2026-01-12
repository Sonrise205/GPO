local l_floor_0 = math.floor;
local l_sqrt_0 = math.sqrt;
GetOffset = function(v2, v3) --[[ Line: 6 ]] --[[ Name: GetOffset ]]
    -- upvalues: l_sqrt_0 (copy), l_floor_0 (copy)
    local v4 = l_sqrt_0(v2.count);
    v3 = l_floor_0(v3) % v2.count;
    return (v2.diameter + v2.padding * 2) * l_floor_0(v3 % v4) + v2.padding, (v2.diameter + v2.padding * 2) * l_floor_0(v3 / v4) + v2.padding;
end;
GetSize = function(v5) --[[ Line: 13 ]] --[[ Name: GetSize ]]
    return v5.diameter, v5.diameter;
end;
return {
    GetOffset = GetOffset, 
    GetSize = GetSize
};