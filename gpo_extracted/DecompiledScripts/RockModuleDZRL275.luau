local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local l_Effects_0 = workspace.Effects;
local v3 = Random.new();
local v4 = RaycastParams.new();
v4.FilterDescendantsInstances = {
    l_Effects_0, 
    workspace.PlayerCharacters, 
    workspace.NPCs
};
v4.FilterType = Enum.RaycastFilterType.Exclude;
local function _(v5, v6) --[[ Line: 10 ]] --[[ Name: Raycast ]]
    -- upvalues: v4 (copy)
    return workspace:Raycast(v5, v6, v4);
end;
local function v10(v8, v9) --[[ Line: 14 ]] --[[ Name: cleanPart ]]
    -- upvalues: l_TweenService_0 (copy)
    v9 = v9 or 1;
    l_TweenService_0:Create(v8, TweenInfo.new(v9), {
        Position = v8.Position - Vector3.new(0, v8.Size.Magnitude / 2, 0)
    }):Play();
    _G.destroy(v8, v9);
end;
local function v17(v11) --[[ Line: 27 ]] --[[ Name: createRock ]]
    -- upvalues: l_Effects_0 (copy), v10 (copy)
    local l_Raycast_0 = v11.Raycast;
    local _ = v11.Size;
    local l_FadeDuration_0 = v11.FadeDuration;
    local _ = v11.Direction;
    local l_Part_0 = Instance.new("Part");
    l_Part_0.Anchored = true;
    l_Part_0.CanCollide = false;
    l_Part_0.Color = l_Raycast_0.Instance.Color;
    l_Part_0.Material = l_Raycast_0.Material;
    l_Part_0.CFrame = v11.CFrame;
    l_Part_0.Size = v11.Size;
    l_Part_0.TopSurface = "Smooth";
    l_Part_0.BottomSurface = "Smooth";
    l_Part_0.Parent = l_Effects_0;
    task.delay(l_FadeDuration_0, v10, l_Part_0);
    return l_Part_0;
end;
return {
    start = function(_, v19) --[[ Line: 64 ]] --[[ Name: start ]]
        -- upvalues: v3 (copy), l_Effects_0 (copy), v10 (copy), v17 (copy), l_RunService_0 (copy), v4 (copy)
        local v20 = v19.PartCountLimit or 150;
        local v21 = {};
        local l_Part_1 = v19.Part;
        local v23 = v19.Direction or l_Part_1.CFrame.LookVector;
        v23 = CFrame.new(l_Part_1.Position, l_Part_1.Position + v23 * Vector3.new(1, 0, 1, 0)).LookVector;
        local v24 = v19.DownVector or 20;
        local v25 = 0;
        local l_Radius_0 = v19.Radius;
        local l_Size_1 = v19.Size;
        local l_FadeDuration_1 = v19.FadeDuration;
        local l_Angle_0 = v19.Angle;
        local v30 = v19.Interval or 0.05;
        local v31 = v19.EndSegments or 10;
        local v32 = {};
        for v33 = 0, v31 do
            local l_Part_2 = Instance.new("Part");
            l_Part_2.Anchored = true;
            l_Part_2.CanCollide = false;
            l_Part_2.Size = Vector3.new(math.sin(1.5707963267948966 / v31) * l_Radius_0 * 2, l_Size_1.Y, l_Size_1.X) * v3:NextNumber(0.85, 1.15);
            l_Part_2.Name = v33;
            l_Part_2.TopSurface = "Smooth";
            l_Part_2.BottomSurface = "Smooth";
            l_Part_2.Parent = l_Effects_0;
            v32[v33] = {
                Part = l_Part_2, 
                Thread = task.delay(l_FadeDuration_1, v10, l_Part_2), 
                Angle = l_Angle_0 * v3:NextNumber(0.85, 1.15)
            };
        end;
        local v35 = {};
        local v36 = nil;
        l_Part_1.Destroying:Connect(function() --[[ Line: 106 ]]
            -- upvalues: v36 (ref)
            v36:Disconnect();
        end);
        local function v44(v37) --[[ Line: 110 ]] --[[ Name: update ]]
            -- upvalues: l_Size_1 (copy), v3 (ref), l_Angle_0 (copy), v35 (copy), v17 (ref), l_FadeDuration_1 (copy), v23 (ref), v21 (copy)
            local v38 = l_Size_1 * v3:NextNumber(0.85, 1.25);
            local v39 = l_Angle_0 * v3:NextNumber(0.85, 1.25);
            for v40, v41 in pairs(v37) do
                if v41 then
                    local v42 = v35[v40];
                    local v43 = v17({
                        Raycast = v41, 
                        Size = not v42 and v38 or Vector3.new(v38.X, v38.Y, (v41.Position - v42.Part.Position).Magnitude), 
                        FadeDuration = l_FadeDuration_1, 
                        CFrame = not v42 and CFrame.new(v41.Position, v41.Position + v23) or CFrame.lookAt(v41.Position, v42.Part.Position, v41.Normal) * CFrame.new(0, 0, -(v41.Position - v42.Part.Position).Magnitude / 2) * CFrame.Angles(0, 0, (v40 == "Left" and 1 or -1) * v39)
                    });
                    table.insert(v21, v43);
                    v43.Transparency = not v42 and 1 or 0;
                    v35[v40] = {
                        Part = v43, 
                        OldPart = v42 and v42.Part or nil, 
                        HitInstance = v41.Instance, 
                        HitPosition = v41.Position, 
                        Size = v38, 
                        Angle = v39
                    };
                end;
            end;
        end;
        v36 = l_RunService_0.Heartbeat:Connect(function(v45) --[[ Line: 141 ]]
            -- upvalues: l_Part_1 (copy), v24 (copy), v23 (ref), v31 (copy), v32 (copy), l_Radius_0 (copy), v4 (ref), l_FadeDuration_1 (copy), v10 (ref), v35 (copy), v44 (copy), v21 (copy), v20 (copy), v25 (ref), v30 (copy)
            local v46 = l_Part_1.CFrame * CFrame.new(0, l_Part_1.Size.Y / 2, -l_Part_1.Size.Z / 2).Position;
            local v47 = Vector3.new(0, -v24, 0);
            local v48 = v23:Cross((Vector3.new(0, 1, 0, 0)));
            for v49 = 0, v31 do
                local l_Part_3 = v32[v49].Part;
                local v51 = 3.141592653589793 * v49 / v31 - 1.5707963267948966;
                local v52 = v46 + v48 * math.sin(v51) * l_Radius_0 + v23 * math.cos(v51) * l_Radius_0;
                local v53 = workspace:Raycast(v52, v47, v4);
                if v53 then
                    l_Part_3.Color = v53.Instance.Color;
                    l_Part_3.Material = v53.Material;
                    l_Part_3.CFrame = CFrame.lookAt(v53.Position, Vector3.new(v46.X, v53.Position.Y, v46.Z), v53.Normal) * CFrame.Angles(v32[v49].Angle, 0, 0);
                    task.cancel(v32[v49].Thread);
                    v32[v49].Thread = task.delay(l_FadeDuration_1, v10, l_Part_3);
                end;
            end;
            local v54 = {};
            local v55 = v46 - v48 * l_Radius_0;
            v54.Left = workspace:Raycast(v55, v47, v4);
            v55 = v46 + v48 * l_Radius_0;
            v54.Right = workspace:Raycast(v55, v47, v4);
            for v56, v57 in pairs(v54) do
                if v35[v56] and v35[v56].OldPart then
                    if v35[v56].HitInstance ~= v57.Instance then
                        if (v57.Position - v35[v56].HitPosition).Magnitude < 50 then
                            v44(v54);
                        else
                            continue;
                        end;
                    end;
                    local l_Part_4 = (v56 == "Left" and v32[0] or v32[v31]).Part;
                    local v59 = l_Part_4.CFrame * CFrame.new((v56 == "Left" and -1 or 1) * l_Part_4.Size.X / 2, 0, 0).Position;
                    local l_Position_0 = (v35[v56].OldPart.CFrame * CFrame.new(0, 0, -v35[v56].OldPart.Size.Z / 2)).Position;
                    local l_Magnitude_0 = (v59 - l_Position_0).Magnitude;
                    if l_Magnitude_0 < 50 then
                        local v62 = v35[v56];
                        local l_Part_5 = v62.Part;
                        l_Part_5.Transparency = 0;
                        l_Part_5.CFrame = CFrame.lookAt(l_Position_0, v59, v57.Normal) * CFrame.new(0, 0, -l_Magnitude_0 / 2) * CFrame.Angles(0, 0, (v56 == "Left" and 1 or -1) * v62.Angle);
                        l_Part_5.Size = Vector3.new(v62.Size.X, v62.Size.Y, l_Magnitude_0);
                        if #v21 >= v20 then
                            task.spawn(v10, v21[1], 0.5);
                            table.remove(v21, 1);
                        end;
                    end;
                end;
            end;
            v25 = v25 + v45;
            if v25 <= v30 then
                return;
            else
                v25 = 0;
                v44(v54);
                return;
            end;
        end);
    end
};