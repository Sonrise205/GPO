return function(v0) --[[ Line: 1 ]]
    for _, v2 in v0:GetDescendants() do
        if v2:IsA("ParticleEmitter") then
            local l_v2_Attribute_0 = v2:GetAttribute("EmitDelay");
            if l_v2_Attribute_0 then
                task.delay(l_v2_Attribute_0, function() --[[ Line: 8 ]]
                    -- upvalues: v2 (copy)
                    v2:Emit(v2:GetAttribute("EmitCount"));
                end);
            else
                v2:Emit(v2:GetAttribute("EmitCount"));
            end;
        end;
    end;
end;