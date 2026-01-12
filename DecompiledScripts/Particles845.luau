local v8 = {
    Emit = function(v0) --[[ Line: 2 ]]
        for _, v2 in v0:GetDescendants() do
            if v2:IsA("ParticleEmitter") then
                task.delay(v2:GetAttribute("EmitDelay") or 0.001, function() --[[ Line: 5 ]]
                    -- upvalues: v2 (copy)
                    v2:Emit(v2:GetAttribute("EmitCount"));
                end);
            end;
        end;
    end, 
    EnableEmit = function(v3) --[[ Line: 11 ]]
        task.spawn(function() --[[ Line: 12 ]]
            -- upvalues: v3 (copy)
            for _, v5 in v3:GetDescendants() do
                if v5:IsA("ParticleEmitter") then
                    if v5:GetAttribute("EmitCount") then
                        task.delay(v5:GetAttribute("EmitDelay") or 0.001, function() --[[ Line: 16 ]]
                            -- upvalues: v5 (copy)
                            v5:Emit(v5:GetAttribute("EmitCount"));
                        end);
                    end;
                    if v5:GetAttribute("EmitDuration") then
                        task.delay(v5:GetAttribute("EmitDelay") or 0.001, function() --[[ Line: 21 ]]
                            -- upvalues: v5 (copy)
                            v5.Enabled = true;
                            task.wait(v5:GetAttribute("EmitDuration"));
                            v5.Enabled = false;
                        end);
                    end;
                end;
                if v5:IsA("Trail") and v5:GetAttribute("EmitDuration") then
                    task.delay(v5:GetAttribute("EmitDelay") or 0.001, function() --[[ Line: 30 ]]
                        -- upvalues: v5 (copy)
                        v5.Enabled = true;
                        task.wait(v5:GetAttribute("EmitDuration"));
                        v5.Enabled = false;
                    end);
                end;
            end;
        end);
    end, 
    EmitTrail = function(v6) --[[ Line: 41 ]]
        if v6:GetAttribute("EmitDuration") then
            task.delay(v6:GetAttribute("EmitDelay") or 0.001, function() --[[ Line: 43 ]]
                -- upvalues: v6 (copy)
                v6.Enabled = true;
                task.wait(v6:GetAttribute("EmitDuration"));
                v6.Enabled = false;
            end);
        end;
    end, 
    EnableEmitSingle = function(v7) --[[ Line: 51 ]]
        task.spawn(function() --[[ Line: 52 ]]
            -- upvalues: v7 (copy)
            if v7:IsA("Trail") and v7:GetAttribute("EmitDuration") then
                task.delay(v7:GetAttribute("EmitDelay") or 0.001, function() --[[ Line: 55 ]]
                    -- upvalues: v7 (ref)
                    v7.Enabled = true;
                    task.wait(v7:GetAttribute("EmitDuration"));
                    v7.Enabled = false;
                end);
            end;
            if v7:IsA("ParticleEmitter") then
                if v7:GetAttribute("EmitCount") then
                    task.delay(v7:GetAttribute("EmitDelay") or 0.001, function() --[[ Line: 64 ]]
                        -- upvalues: v7 (ref)
                        v7:Emit(v7:GetAttribute("EmitCount"));
                    end);
                end;
                if v7:GetAttribute("EmitDuration") then
                    task.delay(v7:GetAttribute("EmitDelay") or 0.001, function() --[[ Line: 69 ]]
                        -- upvalues: v7 (ref)
                        v7.Enabled = true;
                        task.wait(v7:GetAttribute("EmitDuration"));
                        v7.Enabled = false;
                    end);
                end;
            end;
        end);
    end
};
v8.EnableEmitChildrenAndRepeatForAttachments = function(v9) --[[ Line: 79 ]]
    -- upvalues: v8 (copy)
    task.spawn(function() --[[ Line: 80 ]]
        -- upvalues: v9 (copy), v8 (ref)
        for _, v11 in v9:GetChildren() do
            v8.EnableEmitSingle(v11);
            if v11:IsA("Attachment") then
                v8.EnableEmitChildrenAndRepeatForAttachments(v11);
            end;
        end;
    end);
end;
return v8;