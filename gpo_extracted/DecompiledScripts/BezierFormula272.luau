local function _(v0, v1, v2) --[[ Line: 2 ]] --[[ Name: lerp ]]
    return v0 + (v1 - v0) * v2;
end;
return {
    QuadBezier = function(v4, v5, v6, v7) --[[ Line: 7 ]] --[[ Name: QuadBezier ]]
        local v8 = v5 + (v6 - v5) * v4;
        return v8 + (v6 + (v7 - v6) * v4 - v8) * v4;
    end, 
    CubicBezier = function(v9, v10, v11, v12, v13) --[[ Line: 14 ]] --[[ Name: CubicBezier ]]
        local v14 = v10 + (v11 - v10) * v9;
        local v15 = v11 + (v12 - v11) * v9;
        local v16 = v12 + (v13 - v12) * v9;
        local v17 = v14 + (v15 - v14) * v9;
        return v17 + (v15 + (v16 - v15) * v9 - v17) * v9;
    end
};