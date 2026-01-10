--!native
local function _(v0) --[[ Line: 2 ]] --[[ Name: SafeUnit ]]
    if v0.Magnitude == 0 then
        return (Vector3.new(0, 0, 0, 0));
    else
        return v0.Unit;
    end;
end;
local function _(v2, v3, v4) --[[ Line: 10 ]] --[[ Name: ClosestPointFunc ]]
    local l_Magnitude_0 = (v2 - v4).Magnitude;
    local v6 = v4 - v2;
    local v7 = if v6.Magnitude == 0 then Vector3.new(0, 0, 0, 0) else v6.Unit;
    return l_Magnitude_0 <= v3, v2 + v7 * v3, v7;
end;
return function(v9, v10, v11, v12) --[[ Line: 18 ]]
    v9 = v9.Position;
    v10 = math.min(v10.X, v10.Y, v10.Z) * 0.5;
    local l_v9_0 = v9;
    local l_v10_0 = v10;
    local l_Magnitude_1 = (l_v9_0 - v11).Magnitude;
    local v16 = v11 - l_v9_0;
    local v17 = if v16.Magnitude == 0 then Vector3.new(0, 0, 0, 0) else v16.Unit;
    local v18 = l_Magnitude_1 <= l_v10_0;
    local v19 = l_v9_0 + v17 * l_v10_0;
    local l_v17_0 = v17;
    if v18 then
        return v18, v19, l_v17_0;
    else
        return (v19 - v11).Magnitude < v12, v19, l_v17_0;
    end;
end;