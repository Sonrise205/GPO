--!native
local v0 = {};
ccw = function(v1, v2, v3) --[[ Line: 4 ]] --[[ Name: ccw ]]
    return (v2.x - v1.x) * (v3.y - v1.y) - (v2.y - v1.y) * (v3.x - v1.x) > 0;
end;
pop_back = function(v4) --[[ Line: 9 ]] --[[ Name: pop_back ]]
    table.remove(v4, #v4);
    return v4;
end;
inside = function(v5, v6, v7) --[[ Line: 14 ]] --[[ Name: inside ]]
    return (v7.x - v6.x) * (v5.y - v6.y) > (v7.y - v6.y) * (v5.x - v6.x);
end;
outside = function(v8, v9, v10) --[[ Line: 17 ]] --[[ Name: outside ]]
    return (v10.x - v9.x) * (v8.y - v9.y) < (v10.y - v9.y) * (v8.x - v9.x);
end;
intersection = function(v11, v12, v13, v14) --[[ Line: 21 ]] --[[ Name: intersection ]]
    local v15 = v11.x - v12.x;
    local v16 = v11.y - v12.y;
    local v17 = v13.x - v14.x;
    local v18 = v13.y - v14.y;
    local v19 = v11.x * v12.y - v11.y * v12.x;
    local v20 = v13.x * v14.y - v13.y * v14.x;
    local v21 = 1 / (v15 * v18 - v16 * v17);
    local v22 = (v19 * v17 - v20 * v15) * v21;
    local v23 = (v19 * v18 - v20 * v16) * v21;
    return Vector2.new(v22, v23);
end;
v0.MakeConvexHull = function(_, v25) --[[ Line: 32 ]] --[[ Name: MakeConvexHull ]]
    table.sort(v25, function(v26, v27) --[[ Line: 34 ]]
        if math.abs(v26.x - v27.x) < 1.0E-6 then
            return v26.y < v27.y;
        else
            return v26.x < v27.x;
        end;
    end);
    local v28 = {};
    for _, v30 in v25 do
        while #v28 >= 2 and not ccw(v28[#v28 - 1], v28[#v28], v30) do
            table.remove(v28, #v28);
        end;
        table.insert(v28, v30);
    end;
    local v31 = #v28 + 1;
    for v32 = #v25, 1, -1 do
        local v33 = v25[v32];
        while v31 <= #v28 and not ccw(v28[#v28 - 1], v28[#v28], v33) do
            table.remove(v28, #v28);
        end;
        table.insert(v28, v33);
    end;
    table.remove(v28, #v28);
    return v28;
end;
return v0;