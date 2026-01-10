local v9 = {
    Emit = function(_, v1) --[[ Line: 3 ]] --[[ Name: Emit ]]
        for _, v3 in ipairs(v1:GetDescendants()) do
            if v3:IsA("ParticleEmitter") then
                v3:Emit(v3:GetAttribute("EmitCount"));
            end;
        end;
    end, 
    ToggleEnabled = function(_, v5, v6) --[[ Line: 11 ]] --[[ Name: ToggleEnabled ]]
        for _, v8 in ipairs(v5:GetDescendants()) do
            if v8:IsA("ParticleEmitter") then
                v8.Enabled = v6;
            end;
        end;
    end
};
v9.DelayEmit = function(_, v11, v12) --[[ Line: 19 ]] --[[ Name: DelayEmit ]]
    -- upvalues: v9 (copy)
    task.delay(v12, function() --[[ Line: 20 ]]
        -- upvalues: v9 (ref), v11 (copy)
        v9:Emit(v11);
    end);
end;
return v9;