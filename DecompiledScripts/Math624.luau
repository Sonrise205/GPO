return {
    map = function(v0, v1, v2, v3, v4) --[[ Line: 27 ]] --[[ Name: map ]]
        if v2 == v1 then
            error("Range of zero");
        end;
        return (v0 - v1) * (v4 - v3) / (v2 - v1) + v3;
    end, 
    lerp = function(v5, v6, v7) --[[ Line: 49 ]] --[[ Name: lerp ]]
        return v5 + (v6 - v5) * v7;
    end, 
    lawOfCosines = function(v8, v9, v10) --[[ Line: 61 ]] --[[ Name: lawOfCosines ]]
        local v11 = math.acos((v8 * v8 + v9 * v9 - v10 * v10) / (v8 * 2 * v9));
        if v11 ~= v11 then
            return nil;
        else
            return v11;
        end;
    end, 
    round = function(v12, v13) --[[ Line: 81 ]] --[[ Name: round ]]
        if v13 then
            return math.floor(v12 / v13 + 0.5) * v13;
        else
            return (math.floor(v12 + 0.5));
        end;
    end, 
    roundUp = function(v14, v15) --[[ Line: 96 ]] --[[ Name: roundUp ]]
        return math.ceil(v14 / v15) * v15;
    end, 
    roundDown = function(v16, v17) --[[ Line: 107 ]] --[[ Name: roundDown ]]
        return math.floor(v16 / v17) * v17;
    end
};