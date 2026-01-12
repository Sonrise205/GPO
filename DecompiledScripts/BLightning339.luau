local v0 = {};
ConnectPoints = function(v1, v2, v3, v4) --[[ Line: 5 ]] --[[ Name: ConnectPoints ]]
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
TraceLine = function(v7, v8, v9, v10) --[[ Line: 24 ]] --[[ Name: TraceLine ]]
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
v0.Fire = function(_, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32) --[[ Line: 63 ]] --[[ Name: Fire ]]
    local v33 = TraceLine(v24, v25, v26, v27);
    local v34 = Instance.new("Model", v23);
    v34.Name = "Strike";
    local v35 = nil;
    local v36 = nil;
    local _ = nil;
    if v30 == 2 then
        local v38 = {};
        local v39 = nil;
        for v40 = 1, #v33 do
            v35 = Instance.new("Part", v34);
            v35.Anchored = true;
            v35.Size = Vector3.new(1, 1, 1, 0);
            v35.CFrame = CFrame.new(v33[v40]);
            v35.Transparency = 1;
            v35.Parent = v34;
            table.insert(v38, v35);
            v39 = Instance.new("Attachment", v35);
        end;
        for v41 = 1, #v38 - 1 do
            local v42 = script.Beam:Clone();
            v42.Attachment0 = v38[v41].Attachment;
            v42.Attachment1 = v38[v41 + 1].Attachment;
            v42.FaceCamera = true;
            v42.Color = ColorSequence.new(v29);
            v42.Parent = v38[v41];
            _G.tween(v42, {
                v32, 
                Enum.EasingStyle.Sine, 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                Width0 = 0, 
                Width1 = 0
            });
        end;
        return v34;
    else
        for v43 = 2, #v33 do
            v35 = ConnectPoints(v33[v43 - 1], v33[v43], v28, v29);
            v35.Parent = v34;
            if v30 == -1 or v30 == -2 then
                Instance.new("CylinderMesh", v35).Name = "Mesh";
            end;
            if (v30 == 1 or v30 == -2) and v33[v43] ~= v33[#v33] then
                v36 = Instance.new("Part", v34);
                v36.Name = "Joint" .. v43 - 1;
                v36.Anchored = true;
                v36.Shape = "Ball";
                v36.CanCollide = false;
                v36.TopSurface = "Smooth";
                v36.BottomSurface = "Smooth";
                v36.Material = Enum.Material.Neon;
                v36.Color = v29;
                script.Mesh:Clone().Parent = v36;
                if v30 == -2 then
                    v36.Size = Vector3.new(v28, v28, v28);
                else
                    v36.Size = Vector3.new(v28 * 1.5, v28 * 1.5, v28 * 1.5);
                end;
                v36.CFrame = CFrame.new(v33[v43]);
            end;
        end;
        if v31 == nil then
            v31 = v29;
        end;
        spawn(function() --[[ Line: 134 ]]
            -- upvalues: v34 (copy), v32 (copy), v31 (ref)
            local l_v34_Children_0 = v34:GetChildren();
            for v45 = 1, #l_v34_Children_0 do
                if l_v34_Children_0[v45]:FindFirstChild("Mesh") then
                    spawn(function() --[[ Line: 139 ]]
                        -- upvalues: l_v34_Children_0 (copy), v45 (copy), v32 (ref), v31 (ref)
                        local v46 = l_v34_Children_0[v45];
                        if l_v34_Children_0[v45].Mesh.ClassName == "CylinderMesh" then
                            _G.tween(v46.Mesh, {
                                v32, 
                                Enum.EasingStyle.Sine, 
                                Enum.EasingDirection.Out, 
                                0, 
                                false, 
                                0
                            }, {
                                Scale = Vector3.new(0, l_v34_Children_0[v45].Mesh.Scale.Y, l_v34_Children_0[v45].Mesh.Scale.Y)
                            });
                            _G.tween(v46, {
                                v32, 
                                Enum.EasingStyle.Sine, 
                                Enum.EasingDirection.Out, 
                                0, 
                                false, 
                                0
                            }, {
                                Color = v31
                            });
                            return;
                        else
                            _G.tween(v46.Mesh, {
                                v32, 
                                Enum.EasingStyle.Sine, 
                                Enum.EasingDirection.Out, 
                                0, 
                                false, 
                                0
                            }, {
                                Scale = Vector3.new(0, 0, 0, 0)
                            });
                            return;
                        end;
                    end);
                end;
            end;
        end);
        return v34;
    end;
end;
return v0;