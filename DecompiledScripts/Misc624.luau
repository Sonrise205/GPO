local l_TweenService_0 = game:GetService("TweenService");
local v24 = {
    ScaleParticleSize = function(v1, v2) --[[ Line: 4 ]] --[[ Name: ScaleParticleSize ]]
        local v3 = {};
        for _, v5 in next, v1 do
            local v6 = math.max(0, v5.Value * v2);
            table.insert(v3, NumberSequenceKeypoint.new(v5.Time, v6, v6 < v5.Envelope and v6 or v5.Envelope));
        end;
        return NumberSequence.new(v3);
    end, 
    AlignCFrame = function(v7, v8, v9) --[[ Line: 12 ]] --[[ Name: AlignCFrame ]]
        local l_p_0 = v7.p;
        local l_Unit_0 = v7.LookVector:Cross(v8).Unit;
        l_Unit_0 = (l_Unit_0.Magnitude > 0.001 and l_Unit_0 or v7.RightVector).Unit;
        local l_Unit_1 = l_Unit_0:Cross(v8).Unit.Unit;
        if v9 then
            local l_Part_0 = Instance.new("Part");
            local v14 = 0;
            local v15 = 0;
            l_Part_0.TopSurface = v14;
            l_Part_0.BottomSurface = v15;
            l_Part_0.FrontSurface = 6;
            v14 = true;
            v15 = false;
            l_Part_0.Anchored = v14;
            l_Part_0.CanCollide = v15;
            l_Part_0.Size = Vector3.new(1, 1, 1, 0);
            l_Part_0.Color = Color3.new(0, 1, 0);
            v14 = l_Part_0:Clone();
            v14.Color = Color3.new(1, 1, 0);
            v15 = l_Part_0:Clone();
            v15.Color = Color3.new(1, 0, 0);
            l_Part_0.CFrame = CFrame.new(l_p_0, l_p_0 + l_Unit_0);
            v14.CFrame = CFrame.new(l_p_0, l_p_0 + v8);
            v15.CFrame = CFrame.new(l_p_0, l_p_0 + l_Unit_1);
            local l__WorldOrigin_0 = workspace._WorldOrigin;
            local l__WorldOrigin_1 = workspace._WorldOrigin;
            local l__WorldOrigin_2 = workspace._WorldOrigin;
            l_Part_0.Parent = l__WorldOrigin_0;
            v14.Parent = l__WorldOrigin_1;
            v15.Parent = l__WorldOrigin_2;
        end;
        return CFrame.fromMatrix(l_p_0, l_Unit_0, v8, l_Unit_1);
    end, 
    DestroySound = function(v19, v20) --[[ Line: 44 ]] --[[ Name: DestroySound ]]
        -- upvalues: l_TweenService_0 (copy)
        local v21 = TweenInfo.new(v20, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
        local l_v19_0 = v19;
        if l_v19_0:IsA("Attachment") then
            l_v19_0 = l_v19_0:FindFirstChildOfClass("Sound");
        end;
        if not l_v19_0 then
            return;
        else
            local v23 = l_TweenService_0:Create(l_v19_0, v21, {
                Volume = 0
            });
            v23.Completed:Connect(function() --[[ Line: 57 ]]
                -- upvalues: v19 (copy)
                v19:Destroy();
            end);
            v23:Play();
            return;
        end;
    end
};
v24.PlaySound = function(v25, v26, v27, v28) --[[ Line: 63 ]] --[[ Name: PlaySound ]]
    -- upvalues: v24 (copy)
    local l_v25_0 = v25;
    local v30 = nil;
    if typeof(l_v25_0) == "CFrame" or typeof(l_v25_0) == "Vector3" then
        local v31 = typeof(l_v25_0) == "CFrame" and l_v25_0 or CFrame.new(l_v25_0);
        l_v25_0 = Instance.new("Attachment");
        l_v25_0.CFrame = v31;
        l_v25_0.Parent = workspace.Terrain;
        v30 = l_v25_0;
        v25 = l_v25_0;
    end;
    local v32 = v26:Clone();
    v32.Parent = l_v25_0;
    if typeof(v25) == "userdata" and v25:IsA("Attachment") == false then
        l_v25_0 = Instance.new("Attachment", workspace.Terrain);
        l_v25_0.WorldPosition = v25.Position;
        v32.Parent = l_v25_0;
        if v30 then
            v30:Destroy();
        end;
        v24.DestroySound(l_v25_0, v32.TimeLength + 2);
        l_v25_0 = nil;
    else
        v24.DestroySound(v32, v32.TimeLength + 2);
    end;
    if v27 then
        for v33, v34 in v27 do
            if v32[v33] then
                v32[v33] = v34;
            end;
        end;
    end;
    if v28 == nil then
        v32.PlayOnRemove = false;
        v32:Play();
        return v32;
    else
        v32.PlayOnRemove = true;
        v32:Destroy();
        return nil;
    end;
end;
v24.Ray = {
    Whitelist = function(v35, v36, v37) --[[ Line: 108 ]] --[[ Name: Whitelist ]]
        local v38 = Ray.new(v35, v36);
        return _G.raycastWhitelist(v38, v37 or {});
    end
};
v24.Shuffle = function(v39) --[[ Line: 114 ]] --[[ Name: Shuffle ]]
    for v40 = #v39, 2, -1 do
        local v41 = math.random(v40);
        local v42 = v39[v41];
        local v43 = v39[v40];
        v39[v40] = v42;
        v39[v41] = v43;
    end;
    return v39;
end;
local _ = nil;
v24.InCylinder = function(v45, v46, v47) --[[ Line: 124 ]] --[[ Name: IsInRobloxCylinder ]]
    local v48 = v47 - v45.p;
    local v49 = v45:vectorToWorldSpace((Vector3.new(1, 0, 0, 0)));
    local v50 = v49:Dot(v48);
    local v51 = false;
    if v50 < v46.x / 2 then
        v51 = false;
        if -v46.x / 2 < v50 then
            v51 = (v48 - v50 * v49).magnitude < math.max(v46.y, v46.z) / 2;
        end;
    end;
    return v51;
end;
v24.TrailBeacons = function(v52, v53, v54) --[[ Line: 136 ]] --[[ Name: TrailBeacons ]]
    local v55 = (v54 or 1) / 2;
    local v56 = {};
    local l_Magnitude_0 = (v53 - v52).Magnitude;
    local v58 = l_Magnitude_0 <= v55 and 1 or math.floor(l_Magnitude_0 / v55);
    for v59 = 1, v58 do
        table.insert(v56, CFrame.new(v52, v53) * Vector3.new(0, 0, -v55 * v59));
    end;
    return v56;
end;
return v24;