local v0 = {};
local v1 = require(script.BoatTween);
v0.ResizeParticles = function(_, v3, v4, v5, v6, v7) --[[ Line: 4 ]] --[[ Name: ResizeParticles ]]
    -- upvalues: v1 (copy)
    local v8 = {
        ParticleEmitter = {
            Size = "Size", 
            Speed = "Speed", 
            Acceleration = "Acceleration"
        }, 
        Beam = {
            Width0 = "Width0", 
            Width1 = "Width1", 
            CurveSize0 = "CurveSize0", 
            CurveSize1 = "CurveSize1"
        }, 
        Trail = {}
    };
    local v20 = {
        NumberSequence = function(v9, v10) --[[ Line: 24 ]]
            local v11 = {};
            for v12, v13 in v9.Keypoints do
                v11[v12] = NumberSequenceKeypoint.new(v13.Time, v13.Value * v10, v13.Envelope);
            end;
            return NumberSequence.new(v11);
        end, 
        NumberRange = function(v14, v15) --[[ Line: 33 ]]
            return NumberRange.new(v14.Min * v15, v14.Max * v15);
        end, 
        number = function(v16, v17) --[[ Line: 37 ]]
            return v16 * v17;
        end, 
        Vector3 = function(v18, v19) --[[ Line: 41 ]]
            return (Vector3.new(v18.X * v19, v18.Y * v19, v18.Z * v19));
        end
    };
    for _, v22 in pairs(v3:GetDescendants()) do
        local v23 = v8[v22.ClassName];
        if v23 then
            for v24, _ in pairs(v23) do
                local v26 = v22[v24];
                local v27 = v20[typeof(v26)](v26, v4);
                if v27 then
                    local v28 = v1:Create(v22, {
                        Time = v5, 
                        Goal = {
                            [v24] = v27
                        }, 
                        EasingStyle = v6, 
                        EasingDirection = v7
                    });
                    v28:Play();
                    task.defer(function() --[[ Line: 64 ]]
                        -- upvalues: v28 (copy)
                        v28.Completed:Wait();
                        v28:Destroy();
                    end);
                end;
            end;
        end;
    end;
end;
return v0;