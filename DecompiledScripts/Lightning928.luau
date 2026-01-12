local v0 = {};
ConnectPoints = function(v1, v2, v3, v4) --[[ Line: 3 ]] --[[ Name: ConnectPoints ]]
    local l_Part_0 = Instance.new("Part");
    local l_magnitude_0 = (v2 - v1).magnitude;
    l_Part_0.Anchored = true;
    l_Part_0.CanCollide = false;
    l_Part_0.TopSurface = "Smooth";
    l_Part_0.BottomSurface = "Smooth";
    l_Part_0.Material = Enum.Material.Neon;
    l_Part_0.Color = v4;
    l_Part_0.Size = Vector3.new(v3, l_magnitude_0, v3);
    l_Part_0.CFrame = CFrame.new(v1, v2) * CFrame.Angles(1.5707963267948966, 0, 0) * CFrame.new(0, -l_magnitude_0 / 2, 0);
    return l_Part_0;
end;
TraceLine = function(v7, v8, v9, v10) --[[ Line: 22 ]] --[[ Name: TraceLine ]]
    local v11 = {
        v7
    };
    local l_magnitude_1 = (v8 - v7).magnitude;
    local l_l_magnitude_1_0 = l_magnitude_1;
    local v14 = true;
    local v15 = math.random(4, 8);
    local _ = nil;
    local v17 = nil;
    local v18 = nil;
    local v19 = nil;
    local v20 = Vector3.new(math.modf(v9.X), math.modf(v9.Y), math.modf(v9.Z));
    local v21 = Vector3.new(math.modf(v10.X), math.modf(v10.Y), math.modf(v10.Z));
    if l_magnitude_1 < v21.Z or l_magnitude_1 < v20.Z or v20.Z <= 0 or v21.Z <= 0 then
        v14 = false;
    end;
    while l_l_magnitude_1_0 > 0 do
        v17 = math.random(v20.X, v21.X);
        v18 = math.random(v20.Y, v21.Y);
        if v14 then
            v19 = math.random(v20.Z, v21.Z);
            v19 = l_l_magnitude_1_0 - v19 > 0 and v19 or (v8 - v11[#v11]).magnitude;
        else
            v19 = l_magnitude_1 / v15;
        end;
        l_l_magnitude_1_0 = l_l_magnitude_1_0 - v19;
        if l_l_magnitude_1_0 > 0 then
            table.insert(v11, (CFrame.new(v11[#v11], v8) * CFrame.new(v17, v18, -v19)).p);
        else
            break;
        end;
    end;
    table.insert(v11, v8);
    return v11;
end;
v0.Fire = function(_, _, v24, v25, v26, v27, _, _, _, _, _) --[[ Line: 69 ]] --[[ Name: Fire ]]
    return (TraceLine(v24, v25, v26, v27));
end;
return v0;