local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local l_Effects_0 = workspace.Effects;
local v3 = Random.new();
local v4 = {};
local function v8(v5, v6) --[[ Line: 7 ]] --[[ Name: Raycast ]]
    local v7 = RaycastParams.new();
    v7.FilterDescendantsInstances = {
        workspace.Islands, 
        workspace.Env, 
        workspace.Ships
    };
    v7.FilterType = Enum.RaycastFilterType.Include;
    return workspace:Raycast(v5, v6, v7);
end;
local function v15(v9) --[[ Line: 15 ]] --[[ Name: createRock ]]
    -- upvalues: l_Effects_0 (copy), l_TweenService_0 (copy)
    local l_Raycast_0 = v9.Raycast;
    local _ = v9.Size;
    local l_FadeDuration_0 = v9.FadeDuration;
    local _ = v9.Direction;
    local l_Part_0 = Instance.new("Part");
    l_Part_0.Anchored = true;
    l_Part_0.CanCollide = false;
    l_Part_0.Color = l_Raycast_0.Instance.Color;
    l_Part_0.CFrame = v9.Angle;
    l_Part_0.Size = v9.Size;
    _G.matchMaterial(l_Part_0, l_Raycast_0.Instance);
    l_Part_0.Parent = l_Effects_0;
    task.delay(l_FadeDuration_0, function() --[[ Line: 31 ]]
        -- upvalues: l_TweenService_0 (ref), l_Part_0 (copy)
        l_TweenService_0:Create(l_Part_0, TweenInfo.new(1), {
            Position = l_Part_0.Position - Vector3.new(0, l_Part_0.Size.Magnitude / 1.25, 0)
        }):Play();
        _G.destroy(l_Part_0, 1);
    end);
    return l_Part_0;
end;
v4.start = function(_, v17) --[[ Line: 44 ]] --[[ Name: start ]]
    -- upvalues: l_RunService_0 (copy), v8 (copy), v3 (copy), v15 (copy)
    local l_Part_1 = v17.Part;
    if _G.checkRenderDistance(l_Part_1.Position) == false then
        return;
    else
        local v19 = v17.Direction or l_Part_1.CFrame.LookVector;
        v19 = CFrame.new(l_Part_1.Position, l_Part_1.Position + v19 * Vector3.new(1, 0, 1, 0)).LookVector;
        local v20 = v17.DownVector or 20;
        local v21 = tick();
        local l_Radius_0 = v17.Radius;
        local l_Size_1 = v17.Size;
        local l_FadeDuration_1 = v17.FadeDuration;
        local l_Angle_0 = v17.Angle;
        local v26 = {};
        local v27 = {};
        local l_Position_0 = l_Part_1.Position;
        local v29 = nil;
        v29 = l_RunService_0.Heartbeat:Connect(function(_) --[[ Line: 69 ]]
            -- upvalues: v19 (ref), v20 (copy), l_Part_1 (copy), v8 (ref), l_Radius_0 (copy), v26 (copy), l_Angle_0 (ref), l_Position_0 (ref), v27 (copy), l_Size_1 (ref), v21 (ref), v29 (ref), v17 (copy), v3 (ref), v15 (ref), l_FadeDuration_1 (copy)
            local v31 = v19:Cross((Vector3.new(0, 1, 0, 0)));
            local v32 = Vector3.new(0, -v20, 0);
            local v33 = l_Part_1.CFrame * CFrame.new(0, l_Part_1.Size.Y / 2, -l_Part_1.Size.Z / 2).Position;
            local v34 = v8(v33, v32);
            local v35 = {
                Right = v8(v33 + v31 * l_Radius_0, v32), 
                Left = v8(v33 - v31 * l_Radius_0, v32)
            };
            if not v34 then
                return;
            else
                for _, v37 in pairs(v26) do
                    local v38 = 3.141592653589793 * v37:GetAttribute("Percent") - 1.5707963267948966;
                    local v39 = v33 + v31 * math.sin(v38) * l_Radius_0 + v19 * math.cos(v38) * l_Radius_0;
                    local v40 = v8(v39, v32);
                    if v40 then
                        v37.Color = v40.Instance.Color;
                        v37.Material = v40.Material;
                        v37.CFrame = CFrame.lookAt(v40.Position, Vector3.new(v33.X, v40.Position.Y, v33.Z), v40.Normal) * CFrame.Angles(l_Angle_0, 0, 0);
                    end;
                end;
                local v41 = false;
                local _ = (l_Position_0 - v33).Magnitude;
                for v43, v44 in pairs(v35) do
                    if v44 and v27[v43] and v27[v43]:GetAttribute("OriginalPosition") then
                        if v27[v43]:GetAttribute("Material") ~= v44.Instance.Material then
                            v41 = true;
                        else
                            local l_Attribute_0 = v27[v43]:GetAttribute("OriginalPosition");
                            local l_Attribute_1 = v27[v43]:GetAttribute("Angle");
                            local l_Magnitude_1 = (v44.Position - l_Attribute_0).Magnitude;
                            v27[v43].CFrame = CFrame.new(l_Attribute_0, v44.Position) * CFrame.new(0, 0, -l_Magnitude_1 / 2) * CFrame.Angles(0, 0, l_Attribute_1);
                            v27[v43].Size = Vector3.new(l_Size_1.X, l_Size_1.Y, l_Magnitude_1);
                        end;
                    end;
                end;
                if tick() - v21 <= 0.05 and not v41 then
                    return;
                elseif not l_Part_1.Parent then
                    v29:Disconnect();
                    return;
                else
                    v21 = tick();
                    l_Angle_0 = v17.Angle * v3:NextNumber(0.75, 1.25);
                    l_Size_1 = v17.Size * v3:NextNumber(0.75, 1.25);
                    for v48, v49 in pairs(v35) do
                        if v49 then
                            local v50 = v27[v48];
                            local v51 = v15({
                                Direction = v19, 
                                Raycast = v49, 
                                Size = Vector3.new(l_Size_1.X, l_Size_1.Y, v27[v48] and (v27[v48].Position - v49.Position).Magnitude or 0), 
                                FadeDuration = l_FadeDuration_1, 
                                Angle = CFrame.lookAt(v49.Position, v49.Position + v19 * Vector3.new(1, 0, 1, 0), v49.Normal) * CFrame.Angles(0, 0, v48 == "Left" and l_Angle_0 or -l_Angle_0)
                            });
                            v27[v48] = v51;
                            v51.Transparency = 1;
                            if v50 then
                                v51.Transparency = 0;
                                v27[v48]:SetAttribute("Material", v51.Material);
                                v27[v48]:SetAttribute("OriginalPosition", v50.CFrame * CFrame.new(0, 0, -v50.Size.Z / 2).Position);
                                v27[v48]:SetAttribute("Angle", v48 == "Left" and l_Angle_0 or -l_Angle_0);
                            end;
                        end;
                    end;
                    for v52 = 0, 10 do
                        local v53 = 3.141592653589793 * v52 / 10 - 1.5707963267948966;
                        local v54 = v33 + v31 * math.sin(v53) * l_Radius_0 + v19 * math.cos(v53) * l_Radius_0;
                        local v55 = v8(v54, v32);
                        if v55 then
                            local v56 = v26[v52];
                            local v57 = CFrame.lookAt(v55.Position, Vector3.new(v33.X, v55.Position.Y, v33.Z), v55.Normal) * CFrame.Angles(l_Angle_0, 0, 0);
                            if v56 == nil then
                                v56 = v15({
                                    Direction = v19, 
                                    Raycast = v55, 
                                    Size = Vector3.new(0.9510565162951535 * l_Radius_0 / 2, l_Size_1.Y, l_Size_1.X), 
                                    FadeDuration = l_FadeDuration_1, 
                                    Angle = v57
                                });
                                v26[v52] = v56;
                            else
                                v56.CFrame = v57;
                            end;
                            v56:SetAttribute("Percent", v52 / 10);
                            v56:SetAttribute("Angle", l_Angle_0);
                            v56.CFrame = v56.CFrame * CFrame.Angles(math.rad((math.random(0, 180))), 0, 0);
                        end;
                    end;
                    l_Position_0 = v33;
                    return;
                end;
            end;
        end);
        l_Part_1.Destroying:Connect(function() --[[ Line: 176 ]]
            -- upvalues: v29 (ref)
            if v29 then
                v29:Disconnect();
                v29 = nil;
            end;
        end);
        return;
    end;
end;
return v4;