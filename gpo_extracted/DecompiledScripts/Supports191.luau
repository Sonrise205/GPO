local function _(v0, v1, v2, v3) --[[ Line: 6 ]] --[[ Name: rayPlane ]]
    local v4 = -(v0 - v2):Dot(v3) / v1:Dot(v3);
    return v0 + v4 * v1, v4;
end;
return {
    PointCloud = function(v6, v7) --[[ Line: 16 ]] --[[ Name: PointCloud ]]
        local v8 = v6[1];
        local v9 = v6[1]:Dot(v7);
        for v10 = 2, #v6 do
            local v11 = v6[v10]:Dot(v7);
            if v9 < v11 then
                v8 = v6[v10];
                v9 = v11;
            end;
        end;
        return v8;
    end, 
    Cylinder = function(v12, v13) --[[ Line: 28 ]] --[[ Name: Cylinder ]]
        local v14, v15 = unpack(v12);
        v13 = v14:VectorToObjectSpace(v13);
        local v16 = math.min(v15.y, v15.z);
        local v17 = v13:Dot((Vector3.new(1, 0, 0, 0)));
        local v18 = Vector3.new(v15.x, 0, 0);
        local v19 = nil;
        local v20 = nil;
        local v21 = nil;
        if v17 == 0 then
            v21 = v13.Unit * v16;
        else
            v18 = v17 > 0 and v18 or -v18;
            local l_v13_0 = v13;
            local v23 = -(Vector3.new(0, 0, 0, 0) - v18):Dot((Vector3.new(1, 0, 0, 0))) / l_v13_0:Dot((Vector3.new(1, 0, 0, 0)));
            local v24 = Vector3.new(0, 0, 0, 0) + v23 * l_v13_0;
            local l_v23_0 = v23;
            v19 = v24;
            v20 = l_v23_0;
            v21 = v18 + (v19 - v18).Unit * v16;
        end;
        return v14:PointToWorldSpace(v21);
    end, 
    Ellipsoid = function(v26, v27) --[[ Line: 46 ]] --[[ Name: Ellipsoid ]]
        local v28, v29 = unpack(v26);
        return v28:PointToWorldSpace(v29 * (v29 * v28:VectorToObjectSpace(v27)).Unit);
    end
};