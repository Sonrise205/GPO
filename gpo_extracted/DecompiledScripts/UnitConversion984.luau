local v0 = {
    Conversions = {
        Kilometer = 280.0336040324839, 
        Hektometer = 28.00336040324839, 
        Decameter = 2.800336040324839, 
        Meter = 0.2800336040324839, 
        Decimeter = 0.02800336040324839, 
        Centimeter = 0.002800336040324839, 
        Millimeter = 2.800336040324839E-4, 
        Miles = 4850.975973116774, 
        Yards = 2.7562363483618033, 
        Feet = 0.9187454494539344, 
        Inches = 0.07656212078782787
    }
};
v0.Convert = function(v1, v2) --[[ Line: 22 ]] --[[ Name: Convert ]]
    -- upvalues: v0 (copy)
    local v3 = false;
    if v0.Conversions[v2] ~= nil then
        v3 = v1 * v0.Conversions[v2];
    end;
    return v3;
end;
v0.ConvertInverse = function(v4, v5) --[[ Line: 26 ]] --[[ Name: ConvertInverse ]]
    -- upvalues: v0 (copy)
    local v6 = false;
    if v0.Conversions[v5] ~= nil then
        v6 = v0.Conversions[v5] / v4;
    end;
    return v6;
end;
v0.ConvertRounded = function(v7, v8) --[[ Line: 30 ]] --[[ Name: ConvertRounded ]]
    -- upvalues: v0 (copy)
    local v9 = false;
    if v0.Conversions[v8] ~= nil then
        v9 = math.floor(v7 * v0.Conversions[v8]);
    end;
    return v9;
end;
return v0;