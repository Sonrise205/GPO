local v0 = require(script.Parent);
local v1 = {};
local v2 = Random.new();
local v3 = {};
v3.__index = v3;
v3.new = function(v4, v5) --[[ Line: 11 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v1 (copy)
    local v6 = setmetatable({}, v3);
    v6.Enabled = true;
    v6.LightningBolt = v4;
    v6.MaxSparkCount = v5 or 10;
    local v7 = 4;
    local v8 = 6;
    v6.MinSpeed = v7;
    v6.MaxSpeed = v8;
    v7 = 3;
    v8 = 6;
    v6.MinDistance = v7;
    v6.MaxDistance = v8;
    v7 = 8;
    v8 = 10;
    v6.MinPartsPerSpark = v7;
    v6.MaxPartsPerSpark = v8;
    v6.SparksN = 0;
    v6.SlotTable = {};
    v6.RefIndex = #v1 + 1;
    v1[v6.RefIndex] = v6;
    return v6;
end;
v3.Destroy = function(v9) --[[ Line: 34 ]] --[[ Name: Destroy ]]
    -- upvalues: v1 (copy)
    v1[v9.RefIndex] = nil;
    for v10, v11 in v9.SlotTable do
        if v11.Parts[1].Parent == nil then
            v9.SlotTable[v10] = nil;
        end;
    end;
    v9 = nil;
end;
RandomVectorOffset = function(v12, v13) --[[ Line: 46 ]] --[[ Name: RandomVectorOffset ]]
    -- upvalues: v2 (copy)
    return (CFrame.lookAt(Vector3.new(), v12) * CFrame.Angles(0, 0, v2:NextNumber(0, 6.283185307179586)) * CFrame.Angles(math.acos((v2:NextNumber(math.cos(v13), 1))), 0, 0)).LookVector;
end;
game:GetService("RunService").Heartbeat:Connect(function() --[[ Line: 50 ]]
    -- upvalues: v1 (copy), v2 (copy), v0 (copy)
    for _, v15 in v1 do
        if v15.Enabled == true and v15.SparksN < v15.MaxSparkCount then
            local l_LightningBolt_0 = v15.LightningBolt;
            if l_LightningBolt_0.Parts[1].Parent == nil then
                v15:Destroy();
                return;
            else
                local l_Parts_0 = l_LightningBolt_0.Parts;
                local v18 = #l_Parts_0;
                local v19 = {};
                for v20 = 1, #l_Parts_0 do
                    if l_Parts_0[v20].Transparency < 0.3 then
                        v19[#v19 + 1] = (v20 - 0.5) / v18;
                    end;
                end;
                local v21 = nil;
                local v22 = nil;
                if #v19 ~= 0 then
                    v21 = math.ceil(v19[1] * v15.MaxSparkCount);
                    v22 = math.ceil(v19[#v19] * v15.MaxSparkCount);
                end;
                for _ = 1, v2:NextInteger(1, v15.MaxSparkCount - v15.SparksN) do
                    if #v19 ~= 0 then
                        local v24 = {};
                        for v25 = v21, v22 do
                            if v15.SlotTable[v25] == nil then
                                v24[#v24 + 1] = v25;
                            end;
                        end;
                        if #v24 ~= 0 then
                            local v26 = v24[v2:NextInteger(1, #v24)];
                            local v27 = v2:NextNumber(-0.5, 0.5);
                            local v28 = (v26 - 0.5 + v27) / v15.MaxSparkCount;
                            local v29 = 10;
                            local v30 = 1;
                            for v31 = 1, #v19 do
                                local v32 = math.abs(v19[v31] - v28);
                                if v32 < v29 then
                                    v29 = v32;
                                    v30 = math.floor(v19[v31] * v18 + 0.5 + 0.5);
                                end;
                            end;
                            local v33 = l_Parts_0[v30];
                            local v34 = {};
                            local v35 = {};
                            v34.WorldPosition = v33.Position + v27 * v33.CFrame.RightVector * v33.Size.X;
                            v35.WorldPosition = v34.WorldPosition + RandomVectorOffset(v33.CFrame.RightVector, 0.7853981633974483) * v2:NextNumber(v15.MinDistance, v15.MaxDistance);
                            v34.WorldAxis = (v35.WorldPosition - v34.WorldPosition).Unit;
                            v35.WorldAxis = v34.WorldAxis;
                            local v36 = v0.new(v34, v35, v2:NextInteger(v15.MinPartsPerSpark, v15.MaxPartsPerSpark));
                            local v37 = 0;
                            local v38 = 0.8;
                            v36.MinRadius = v37;
                            v36.MaxRadius = v38;
                            v36.AnimationSpeed = 0;
                            v36.Thickness = v33.Size.Y / 2;
                            v37 = 1;
                            v38 = 1;
                            v36.MinThicknessMultiplier = v37;
                            v36.MaxThicknessMultiplier = v38;
                            v36.PulseLength = 0.5;
                            v36.PulseSpeed = v2:NextNumber(v15.MinSpeed, v15.MaxSpeed);
                            v36.FadeLength = 0.25;
                            local v39;
                            v37, v38, v39 = Color3.toHSV(v33.Color);
                            v36.Color = Color3.fromHSV(v37, 0.5, v39);
                            v15.SlotTable[v26] = v36;
                        end;
                    else
                        break;
                    end;
                end;
            end;
        end;
        local v40 = 0;
        for v41, v42 in v15.SlotTable do
            if v42.Parts[1].Parent ~= nil then
                v40 = v40 + 1;
            else
                v15.SlotTable[v41] = nil;
            end;
        end;
        v15.SparksN = v40;
    end;
end);
return v3;