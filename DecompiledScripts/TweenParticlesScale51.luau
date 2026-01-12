local v8 = {
    ScaleNumberSequence = function(_, v1, v2) --[[ Line: 3 ]] --[[ Name: ScaleNumberSequence ]]
        local l_Keypoints_0 = v1.Keypoints;
        for v4 = 1, #l_Keypoints_0 do
            l_Keypoints_0[v4] = NumberSequenceKeypoint.new(l_Keypoints_0[v4].Time, l_Keypoints_0[v4].Value * v2, l_Keypoints_0[v4].Envelope * v2);
        end;
        return NumberSequence.new(l_Keypoints_0);
    end, 
    ScaleNumberRange = function(_, v6, v7) --[[ Line: 11 ]] --[[ Name: ScaleNumberRange ]]
        return NumberRange.new(v6.Min * v7, v6.Max * v7);
    end, 
    ParticleScaler = {}
};
v8.ParticleScaler.new = function(v9, v10) --[[ Line: 17 ]] --[[ Name: new ]]
    -- upvalues: v8 (copy)
    local v11 = {
        CurrentScale = 1, 
        OldScale = 1, 
        Particles = {}
    };
    for _, v13 in v9:GetDescendants() do
        if v13:IsA("ParticleEmitter") then
            local v14 = {
                Size = v13.Size, 
                ZOffset = v13.ZOffset, 
                Acceleration = v13.Acceleration, 
                Speed = v13.Speed
            };
            v11.Particles[v13] = v14;
        end;
    end;
    v11.SetScale = function(_, v16) --[[ Line: 36 ]] --[[ Name: SetScale ]]
        -- upvalues: v11 (copy)
        v11.OldScale = v11.CurrentScale;
        v11.CurrentScale = v16;
    end;
    v11.GetParticles = function(_) --[[ Line: 41 ]] --[[ Name: GetParticles ]]
        -- upvalues: v11 (copy)
        local v18 = {};
        for v19, _ in v11.Particles do
            table.insert(v18, v19);
        end;
        return v18;
    end;
    v11.Scale = function(_, v22) --[[ Line: 51 ]] --[[ Name: Scale ]]
        -- upvalues: v11 (copy), v8 (ref)
        if v11.Particles[v22] then
            v22.Size = v8:ScaleNumberSequence(v11.Particles[v22].Size, v11.CurrentScale);
            v22.ZOffset = v11.Particles[v22].ZOffset * v11.CurrentScale;
            v22.Acceleration = v11.Particles[v22].Acceleration * v11.CurrentScale;
            v22.Speed = v8:ScaleNumberRange(v11.Particles[v22].Speed, v11.CurrentScale);
        end;
    end;
    v11.ScaleAll = function(_) --[[ Line: 60 ]] --[[ Name: ScaleAll ]]
        -- upvalues: v11 (copy), v8 (ref)
        for v24, v25 in v11.Particles do
            v24.Size = v8:ScaleNumberSequence(v25.Size, v11.CurrentScale);
            v24.ZOffset = v25.ZOffset * v11.CurrentScale;
            v24.Acceleration = v25.Acceleration * v11.CurrentScale;
            v24.Speed = v8:ScaleNumberRange(v25.Speed, v11.CurrentScale);
        end;
    end;
    v11.RestoreAll = function(_) --[[ Line: 69 ]] --[[ Name: RestoreAll ]]
        -- upvalues: v11 (copy)
        for _, v28 in v11:GetParticles() do
            v28.Size = v11.Particles[v28].Size;
            v28.ZOffset = v11.Particles[v28].ZOffset;
            v28.Acceleration = v11.Particles[v28].Acceleration;
            v28.Speed = v11.Particles[v28].Speed;
        end;
    end;
    if v10 ~= nil then
        v11:SetScale(v10);
        v11:ScaleAll();
    end;
    return v11;
end;
v8.start = function(_, v30, v31, v32) --[[ Line: 86 ]] --[[ Name: start ]]
    -- upvalues: v8 (copy)
    if v30 == nil then
        return;
    else
        local v33 = v8.ParticleScaler.new(v30, v31.startScale);
        local l_NumberValue_0 = Instance.new("NumberValue");
        l_NumberValue_0.Value = v31.startScale;
        local v35 = game:GetService("TweenService"):Create(l_NumberValue_0, TweenInfo.new(v32), {
            Value = v31.endScale
        });
        local function _() --[[ Line: 99 ]] --[[ Name: endScale ]]
            -- upvalues: l_NumberValue_0 (copy), v35 (copy)
            l_NumberValue_0:Destroy();
            v35:Destroy();
        end;
        l_NumberValue_0.Changed:Connect(function() --[[ Line: 104 ]]
            -- upvalues: v31 (copy), l_NumberValue_0 (copy), v35 (copy), v33 (copy)
            if v31.customEnd ~= nil and v31.customEnd() == true then
                l_NumberValue_0:Destroy();
                v35:Destroy();
                return;
            else
                v33:SetScale(l_NumberValue_0.Value);
                v33:ScaleAll();
                return;
            end;
        end);
        l_NumberValue_0.Parent = script;
        v35.Completed:Connect(function() --[[ Line: 114 ]]
            -- upvalues: l_NumberValue_0 (copy), v35 (copy)
            _G.destroy(l_NumberValue_0, 1);
            v35:Destroy();
        end);
        v35:Play();
        return;
    end;
end;
return v8;