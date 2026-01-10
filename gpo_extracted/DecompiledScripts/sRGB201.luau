local v0 = {};
local function _(v1) --[[ Line: 42 ]] --[[ Name: transform ]]
    if v1 >= 0.04045 then
        return ((v1 + 0.055) / 1.055) ^ 2.4;
    else
        return v1 / 12.92;
    end;
end;
local function _(v3) --[[ Line: 52 ]] --[[ Name: inverse ]]
    if v3 >= 0.0031308 then
        return v3 ^ 0.4166666666666667 * 1.055 - 0.055;
    else
        return v3 * 12.92;
    end;
end;
v0.fromLinear = function(v5) --[[ Line: 61 ]] --[[ Name: fromLinear ]]
    local l_new_0 = Color3.new;
    local l_R_0 = v5.R;
    local v8 = if l_R_0 >= 0.04045 then ((l_R_0 + 0.055) / 1.055) ^ 2.4 else l_R_0 / 12.92;
    local l_G_0 = v5.G;
    l_R_0 = if l_G_0 >= 0.04045 then ((l_G_0 + 0.055) / 1.055) ^ 2.4 else l_G_0 / 12.92;
    local l_B_0 = v5.B;
    return l_new_0(v8, l_R_0, if l_B_0 >= 0.04045 then ((l_B_0 + 0.055) / 1.055) ^ 2.4 else l_B_0 / 12.92);
end;
v0.toLinear = function(v11) --[[ Line: 67 ]] --[[ Name: toLinear ]]
    local l_new_1 = Color3.new;
    local l_R_1 = v11.R;
    local v14 = if l_R_1 >= 0.0031308 then l_R_1 ^ 0.4166666666666667 * 1.055 - 0.055 else l_R_1 * 12.92;
    local l_G_1 = v11.G;
    l_R_1 = if l_G_1 >= 0.0031308 then l_G_1 ^ 0.4166666666666667 * 1.055 - 0.055 else l_G_1 * 12.92;
    local l_B_1 = v11.B;
    return l_new_1(v14, l_R_1, if l_B_1 >= 0.0031308 then l_B_1 ^ 0.4166666666666667 * 1.055 - 0.055 else l_B_1 * 12.92);
end;
return v0;