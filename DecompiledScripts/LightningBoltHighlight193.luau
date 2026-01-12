local l_clock_0 = os.clock;
DiscretePulse = function(v1, v2, v3, v4, v5, v6, v7) --[[ Line: 9 ]] --[[ Name: DiscretePulse ]]
    return (math.clamp(v3 / (2 * v4) - math.abs((v1 - v5 * v2 + 0.5 * v3) / v4), v6, v7));
end;
NoiseBetween = function(v8, v9, v10, v11, v12) --[[ Line: 13 ]] --[[ Name: NoiseBetween ]]
    return v11 + (v12 - v11) * (math.noise(v8, v9, v10) + 0.5);
end;
CubicBezier = function(v13, v14, v15, v16, v17) --[[ Line: 17 ]] --[[ Name: CubicBezier ]]
    return v13 * (1 - v17) ^ 3 + v14 * 3 * v17 * (1 - v17) ^ 2 + v15 * 3 * (1 - v17) * v17 ^ 2 + v16 * v17 ^ 3;
end;
local v18 = script.BoltPart:Clone();
local v19 = 0;
local v20 = 0;
v18.TopSurface = v19;
v18.BottomSurface = v20;
v19 = true;
v20 = false;
v18.Anchored = v19;
v18.CanCollide = v20;
v18.Name = "BoltPart";
v18.Color = Color3.new(1, 1, 1);
v18.Transparency = 1;
v19 = Random.new();
v20 = CFrame.lookAt(Vector3.new(), (Vector3.new(1, 0, 0, 0))):inverse();
local v21 = {};
local v22 = {};
v22.__index = v22;
v22.new = function(v23, v24, v25) --[[ Line: 46 ]] --[[ Name: new ]]
    -- upvalues: v22 (copy), v18 (copy), v20 (copy), l_clock_0 (copy), v21 (copy)
    local v26 = setmetatable({}, v22);
    v26.Enabled = true;
    v26.Attachment0 = v23;
    v26.Attachment1 = v24;
    local v27 = 0;
    local v28 = 0;
    v26.CurveSize0 = v27;
    v26.CurveSize1 = v28;
    v27 = 0;
    v28 = 2.4;
    v26.MinRadius = v27;
    v26.MaxRadius = v28;
    v26.Frequency = 1;
    v26.AnimationSpeed = 7;
    v26.Thickness = 1;
    v27 = 0.2;
    v28 = 1;
    v26.MinThicknessMultiplier = v27;
    v26.MaxThicknessMultiplier = v28;
    v27 = 0;
    v28 = 1;
    v26.MinTransparency = v27;
    v26.MaxTransparency = v28;
    v26.PulseSpeed = 2;
    v26.PulseLength = 1000000;
    v26.FadeLength = 0.2;
    v26.ContractFrom = 0.5;
    v26.Color = Color3.new(1, 1, 1);
    v26.ColorOffsetSpeed = 3;
    v26.OuterColor = Color3.new(0, 0.984314, 1);
    v26.Parts = {};
    v27 = v23;
    v28 = v24;
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    local l_WorldPosition_0 = v27.WorldPosition;
    local v31 = v27.WorldPosition + v27.WorldAxis * v26.CurveSize0;
    local v32 = v28.WorldPosition - v28.WorldAxis * v26.CurveSize1;
    local l_WorldPosition_1 = v28.WorldPosition;
    local l_l_WorldPosition_0_0 = l_WorldPosition_0;
    local l_l_WorldPosition_0_1 = l_WorldPosition_0;
    local v36 = v25 or 30;
    for v37 = 1, v36 do
        local v38 = v37 / v36;
        local v39 = CubicBezier(l_WorldPosition_0, v31, v32, l_WorldPosition_1, v38);
        local v40 = v37 ~= v36 and CFrame.lookAt(l_l_WorldPosition_0_1, v39).Position or v39;
        local v41 = v18:Clone();
        v41.Size = Vector3.new((v40 - l_l_WorldPosition_0_0).Magnitude, 0, 0);
        v41.CFrame = CFrame.lookAt(0.5 * (l_l_WorldPosition_0_0 + v40), v40) * v20;
        v41.Parent = l_CurrentCamera_0;
        local v42 = true;
        local v43 = false;
        v41.Locked = v42;
        v41.CastShadow = v43;
        v26.Parts[v37] = v41;
        l_l_WorldPosition_0_0 = v40;
        l_l_WorldPosition_0_1 = v39;
    end;
    v26.PartsHidden = false;
    v26.DisabledTransparency = 1;
    v26.StartT = l_clock_0();
    v26.RanNum = math.random() * 100;
    v26.RefIndex = #v21 + 1;
    v21[v26.RefIndex] = v26;
    return v26;
end;
v22.Destroy = function(v44) --[[ Line: 112 ]] --[[ Name: Destroy ]]
    -- upvalues: v21 (copy)
    v21[v44.RefIndex] = nil;
    for v45 = 1, #v44.Parts do
        v44.Parts[v45]:Destroy();
        if v45 % 100 == 0 then
            wait();
        end;
    end;
    v44 = nil;
end;
game:GetService("RunService").Heartbeat:Connect(function() --[[ Line: 126 ]]
    -- upvalues: v21 (copy), l_clock_0 (copy), v20 (copy)
    for _, v47 in v21 do
        if v47.Enabled == true then
            v47.PartsHidden = false;
            local v48 = 1 - v47.MaxTransparency;
            local v49 = 1 - v47.MinTransparency;
            local l_MinRadius_0 = v47.MinRadius;
            local l_MaxRadius_0 = v47.MaxRadius;
            local l_Thickness_0 = v47.Thickness;
            local l_Parts_0 = v47.Parts;
            local v54 = #l_Parts_0;
            local l_RanNum_0 = v47.RanNum;
            local l_StartT_0 = v47.StartT;
            local l_AnimationSpeed_0 = v47.AnimationSpeed;
            local l_Frequency_0 = v47.Frequency;
            local l_MinThicknessMultiplier_0 = v47.MinThicknessMultiplier;
            local l_MaxThicknessMultiplier_0 = v47.MaxThicknessMultiplier;
            local l_Attachment0_0 = v47.Attachment0;
            local l_Attachment1_0 = v47.Attachment1;
            local l_CurveSize0_0 = v47.CurveSize0;
            local l_CurveSize1_0 = v47.CurveSize1;
            local l_WorldPosition_2 = l_Attachment0_0.WorldPosition;
            local v66 = l_Attachment0_0.WorldPosition + l_Attachment0_0.WorldAxis * l_CurveSize0_0;
            local v67 = l_Attachment1_0.WorldPosition - l_Attachment1_0.WorldAxis * l_CurveSize1_0;
            local l_WorldPosition_3 = l_Attachment1_0.WorldPosition;
            local v69 = l_clock_0() - l_StartT_0;
            local l_PulseLength_0 = v47.PulseLength;
            local l_PulseSpeed_0 = v47.PulseSpeed;
            local l_FadeLength_0 = v47.FadeLength;
            local l_Color_0 = v47.Color;
            local l_ColorOffsetSpeed_0 = v47.ColorOffsetSpeed;
            local v75 = 1 - v47.ContractFrom;
            local l_l_WorldPosition_2_0 = l_WorldPosition_2;
            local l_l_WorldPosition_2_1 = l_WorldPosition_2;
            if v69 < (l_PulseLength_0 + 1) / l_PulseSpeed_0 then
                local v78 = {};
                local v79 = {};
                for v80 = 1, v54 do
                    local v81 = l_Parts_0[v80];
                    local v82 = v80 / v54;
                    local v83 = DiscretePulse(v82, l_PulseSpeed_0, l_PulseLength_0, l_FadeLength_0, v69, v48, v49);
                    local v84 = CubicBezier(l_WorldPosition_2, v66, v67, l_WorldPosition_3, v82);
                    local v85 = -v69;
                    local v86 = l_AnimationSpeed_0 * v85 + l_Frequency_0 * 10 * v82 - 0.2 + l_RanNum_0 * 4;
                    local v87 = 5 * (l_AnimationSpeed_0 * 0.01 * v85 / 10 + l_Frequency_0 * v82) + l_RanNum_0 * 4;
                    local v88 = NoiseBetween(5 * v86, 1.5, 1 * v87, 0, 0.6283185307179586) + NoiseBetween(0.5 * v86, 1.5, 0.1 * v87, 0, 5.654866776461628);
                    local v89 = NoiseBetween(3.4, v87, v86, l_MinRadius_0, l_MaxRadius_0) * math.exp(-5000 * (v82 - 0.5) ^ 10);
                    local v90 = NoiseBetween(2.3, v87, v86, l_MinThicknessMultiplier_0, l_MaxThicknessMultiplier_0);
                    local v91 = v80 ~= v54 and (CFrame.new(l_l_WorldPosition_2_1, v84) * CFrame.Angles(0, 0, v88) * CFrame.Angles(math.acos((math.clamp(NoiseBetween(v87, v86, 2.7, 6.123233995736766E-17, 1), -1, 1))), 0, 0) * CFrame.new(0, 0, -v89)).Position or v84;
                    local v92 = nil;
                    if v75 < v83 then
                        v81.Size = Vector3.new((v91 - l_l_WorldPosition_2_0).Magnitude, l_Thickness_0 * v90 * v83, l_Thickness_0 * v90 * v83);
                        v92 = CFrame.lookAt(0.5 * (l_l_WorldPosition_2_0 + v91), v91) * v20;
                        v81.Transparency = 1 - v83;
                    elseif v75 - 1 / (v54 * l_FadeLength_0) < v83 then
                        local v93 = (1 - (v83 - (v75 - 1 / (v54 * l_FadeLength_0))) * v54 * l_FadeLength_0) * (v82 < v69 * l_PulseSpeed_0 - 0.5 * l_PulseLength_0 and 1 or -1);
                        v81.Size = Vector3.new((1 - math.abs(v93)) * (v91 - l_l_WorldPosition_2_0).Magnitude, l_Thickness_0 * v90 * v83, l_Thickness_0 * v90 * v83);
                        v92 = CFrame.lookAt(l_l_WorldPosition_2_0 + (v91 - l_l_WorldPosition_2_0) * (math.max(0, v93) + (1 - math.abs(v93)) * 0.5), v91) * v20;
                        v81.Transparency = 1 - v83;
                    else
                        v81.Transparency = 1;
                    end;
                    if typeof(l_Color_0) == "Color3" then
                        v81.Color = l_Color_0;
                    else
                        v82 = (l_RanNum_0 + v82 - v69 * l_ColorOffsetSpeed_0) % 1;
                        local l_Keypoints_0 = l_Color_0.Keypoints;
                        for v95 = 1, #l_Keypoints_0 - 1 do
                            if l_Keypoints_0[v95].Time < v82 and v82 < l_Keypoints_0[v95 + 1].Time then
                                v81.Color = l_Keypoints_0[v95].Value:lerp(l_Keypoints_0[v95 + 1].Value, (v82 - l_Keypoints_0[v95].Time) / (l_Keypoints_0[v95 + 1].Time - l_Keypoints_0[v95].Time));
                                break;
                            end;
                        end;
                    end;
                    v81.InnerBolt.Size = Vector3.new(v81.Size.X, v81.Size.Y * 0.625, v81.Size.Z * 0.625);
                    v81.InnerBolt.Transparency = v81.Transparency - 0.425;
                    v81.InnerBolt.Color = v81.Color;
                    v81.Color = v47.OuterColor;
                    if v92 ~= nil then
                        table.insert(v78, v81);
                        table.insert(v79, v92);
                        table.insert(v78, v81.InnerBolt);
                        table.insert(v79, v92);
                    end;
                    l_l_WorldPosition_2_0 = v91;
                    l_l_WorldPosition_2_1 = v84;
                end;
                workspace:BulkMoveTo(v78, v79);
            else
                v47:Destroy();
            end;
        elseif v47.PartsHidden == false then
            v47.PartsHidden = true;
            local l_DisabledTransparency_0 = v47.DisabledTransparency;
            for v97 = 1, #v47.Parts do
                v47.Parts[v97].Transparency = l_DisabledTransparency_0;
            end;
        end;
    end;
end);
return v22;