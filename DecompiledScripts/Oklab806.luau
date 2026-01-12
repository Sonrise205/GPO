local v0 = require(script.Parent.sRGB);
local v8 = {
    fromLinear = function(v1) --[[ Line: 42 ]] --[[ Name: fromLinear ]]
        local v2 = v1.R * 0.4122214708 + v1.G * 0.5363325363 + v1.B * 0.0514459929;
        local v3 = v1.R * 0.2119034982 + v1.G * 0.6806995451 + v1.B * 0.1073969566;
        local v4 = v1.R * 0.0883024619 + v1.G * 0.2817188376 + v1.B * 0.6299787005;
        local v5 = v2 ^ 0.3333333333333333;
        local v6 = v3 ^ 0.3333333333333333;
        local v7 = v4 ^ 0.3333333333333333;
        return (Vector3.new(v5 * 0.2104542553 + v6 * 0.793617785 - v7 * 0.0040720468, v5 * 1.9779984951 - v6 * 2.428592205 + v7 * 0.4505937099, v5 * 0.0259040371 + v6 * 0.7827717662 - v7 * 0.808675766));
    end
};
v8.fromSRGB = function(v9) --[[ Line: 59 ]] --[[ Name: fromSRGB ]]
    -- upvalues: v8 (copy), v0 (copy)
    return v8.fromLinear(v0.toLinear(v9));
end;
v8.toLinear = function(v10, v11) --[[ Line: 65 ]] --[[ Name: toLinear ]]
    local v12 = v10.X + v10.Y * 0.3963377774 + v10.Z * 0.2158037573;
    local v13 = v10.X - v10.Y * 0.1055613458 - v10.Z * 0.0638541728;
    local v14 = v10.X - v10.Y * 0.0894841775 - v10.Z * 1.291485548;
    local v15 = v12 ^ 3;
    local v16 = v13 ^ 3;
    local v17 = v14 ^ 3;
    local v18 = v15 * 4.0767416621 - v16 * 3.3077115913 + v17 * 0.2309699292;
    local v19 = v15 * -1.2684380046 + v16 * 2.6097574011 - v17 * 0.3413193965;
    local v20 = v15 * -0.0041960863 - v16 * 0.7034186147 + v17 * 1.707614701;
    if not v11 then
        v18 = math.clamp(v18, 0, 1);
        v19 = math.clamp(v19, 0, 1);
        v20 = math.clamp(v20, 0, 1);
    end;
    return Color3.new(v18, v19, v20);
end;
v8.toSRGB = function(v21, v22) --[[ Line: 89 ]] --[[ Name: toSRGB ]]
    -- upvalues: v0 (copy), v8 (copy)
    return v0.fromLinear(v8.toLinear(v21, v22));
end;
return v8;