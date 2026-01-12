local _ = game:GetService("ReplicatedStorage");
local _ = game:GetService("Players");
local l_TweenService_0 = game:GetService("TweenService");
local v3 = {
    types = {
        Part = 1, 
        BasePart = 1, 
        MeshPart = 1, 
        Attachment = 2, 
        ParticleEmitter = 0, 
        Beam = 3, 
        PointLight = 4
    }
};
local v8 = {
    Beam = function(v4) --[[ Line: 18 ]]
        -- upvalues: l_TweenService_0 (copy)
        task.spawn(function() --[[ Line: 19 ]]
            -- upvalues: v4 (copy), l_TweenService_0 (ref)
            if v4:GetAttribute("Duration") then
                if not v4:GetAttribute("Duration") then
                    return;
                else
                    task.delay(v4:GetAttribute("EmitDelay"), function() --[[ Line: 21 ]]
                        -- upvalues: v4 (ref), l_TweenService_0 (ref)
                        local v5 = v4:GetAttribute("TweenDuration") or 0.2;
                        l_TweenService_0:Create(v4, TweenInfo.new(v5), {
                            Width0 = v4:GetAttribute("Width0"), 
                            Width1 = v4:GetAttribute("Width1")
                        }):Play();
                        task.wait(v4:GetAttribute("Duration"));
                        l_TweenService_0:Create(v4, TweenInfo.new(v5), {
                            Width0 = 0, 
                            Width1 = 0
                        }):Play();
                    end);
                end;
            end;
        end);
    end, 
    ParticleEmitter = function(v6) --[[ Line: 31 ]]
        -- upvalues: v3 (copy)
        v3:EmitParticle(v6);
    end, 
    Trail = function(_) --[[ Line: 35 ]]

    end
};
v3.TypeHandler = {
    [0] = function(v9) --[[ Line: 41 ]]
        -- upvalues: v3 (copy)
        v3:EmitParticle(v9);
    end, 
    [1] = function(v10) --[[ Line: 45 ]]
        -- upvalues: v8 (copy)
        for _, v12 in pairs(v10:GetDescendants()) do
            if v8[v12.ClassName] then
                v8[v12.ClassName](v12);
            end;
        end;
    end, 
    [2] = function(v13) --[[ Line: 53 ]]
        -- upvalues: v3 (copy)
        for _, v15 in pairs(v13:GetChildren()) do
            if not v15.Enabled then
                v3:EmitParticle(v15);
            end;
        end;
    end, 
    [3] = function(v16) --[[ Line: 61 ]]
        -- upvalues: v8 (copy)
        for _, v18 in pairs(v16:GetDescendants()) do
            if v8[v18.ClassName] then
                v8[v18.ClassName](v18);
            end;
        end;
    end, 
    [4] = function(v19) --[[ Line: 69 ]]
        -- upvalues: v8 (copy)
        if v8[v19.ClassName] then
            v8[v19.ClassName](v19);
        end;
    end
};
v3.EmitParticle = function(_, v21) --[[ Line: 76 ]] --[[ Name: EmitParticle ]]
    if v21.ClassName ~= "ParticleEmitter" then
        return;
    else
        local v22 = v21:GetAttribute("EmitDelay") or 0;
        local v23 = v21:GetAttribute("EmitCount") or 0;
        local v24 = v21:GetAttribute("EmitDuration") or 0;
        task.delay(v22, function() --[[ Line: 83 ]]
            -- upvalues: v21 (copy), v23 (copy), v24 (copy)
            if v21:IsA("ParticleEmitter") then
                v21:Emit(v23);
            end;
            if v21:IsA("Sound") then
                local v25 = v21:Clone();
                v25.Parent = v21.Parent;
                v25:Play();
                task.delay(v25.TimeLength, v25.Destroy, v25);
            end;
            if v24 > 0 then
                task.defer(function() --[[ Line: 96 ]]
                    -- upvalues: v21 (ref), v24 (ref)
                    v21.Enabled = true;
                    task.wait(v24);
                    v21.Enabled = false;
                end);
            end;
        end);
        return;
    end;
end;
v3.EmitBeam = function(_, v27, v28) --[[ Line: 106 ]] --[[ Name: EmitBeam ]]
    -- upvalues: l_TweenService_0 (copy)
    if not v27 then
        return;
    else
        local v29 = v28.Duration or 1;
        local v30 = v28.Speed or 0.2;
        local v31 = v28.Delay or 0;
        local v32 = TweenInfo.new(v30, v28.Style or Enum.EasingStyle.Linear);
        local function _(v33) --[[ Line: 115 ]] --[[ Name: _emitBeam ]]
            -- upvalues: v31 (copy), l_TweenService_0 (ref), v32 (copy), v29 (copy)
            delay(v31, function() --[[ Line: 116 ]]
                -- upvalues: v33 (copy), l_TweenService_0 (ref), v32 (ref), v29 (ref)
                local l_Width0_0 = v33.Width0;
                local l_Width1_0 = v33.Width1;
                v33.Width0 = 0;
                v33.Width1 = 0;
                l_TweenService_0:Create(v33, v32, {
                    Width0 = l_Width0_0, 
                    Width1 = l_Width1_0
                }):Play();
                task.defer(function() --[[ Line: 123 ]]
                    -- upvalues: v29 (ref), l_TweenService_0 (ref), v33 (ref), v32 (ref)
                    task.wait(v29);
                    l_TweenService_0:Create(v33, v32, {
                        Width0 = 0, 
                        Width1 = 0
                    }):Play();
                end);
            end);
        end;
        for _, v38 in pairs(v27:GetDescendants()) do
            if v38:IsA("Beam") then
                delay(v31, function() --[[ Line: 116 ]]
                    -- upvalues: v38 (copy), l_TweenService_0 (ref), v32 (copy), v29 (copy)
                    local l_Width0_1 = v38.Width0;
                    local l_Width1_1 = v38.Width1;
                    v38.Width0 = 0;
                    v38.Width1 = 0;
                    l_TweenService_0:Create(v38, v32, {
                        Width0 = l_Width0_1, 
                        Width1 = l_Width1_1
                    }):Play();
                    task.defer(function() --[[ Line: 123 ]]
                        -- upvalues: v29 (ref), l_TweenService_0 (ref), v38 (ref), v32 (ref)
                        task.wait(v29);
                        l_TweenService_0:Create(v38, v32, {
                            Width0 = 0, 
                            Width1 = 0
                        }):Play();
                    end);
                end);
            end;
        end;
        return;
    end;
end;
v3.Resize = function(_, v42, v43) --[[ Line: 138 ]] --[[ Name: Resize ]]
    local l_Parent_0 = v42.Parent;
    local l_Model_0 = Instance.new("Model");
    v42.Parent = l_Model_0;
    l_Model_0:ScaleTo(v43);
    v42.Parent = l_Parent_0;
    l_Model_0:Destroy();
    return v42;
end;
v3.EmitHandler = function(_, v47) --[[ Line: 149 ]] --[[ Name: EmitHandler ]]
    -- upvalues: v3 (copy)
    if v47:IsA("Model") then
        for _, v49 in pairs(v47:GetChildren()) do
            v3:EmitHandler(v49);
        end;
        return;
    else
        if v3.types[v47.ClassName] then
            v3.TypeHandler[v3.types[v47.ClassName]](v47);
        end;
        return;
    end;
end;
v3.ToggleEmit = function(_, v51, v52) --[[ Line: 161 ]] --[[ Name: ToggleEmit ]]
    -- upvalues: v8 (copy)
    if v8[v51.ClassName] then
        if v52 ~= nil then
            v51.Enabled = v52;
            return;
        else
            v51.Enabled = not v51.Enabled;
            return;
        end;
    else
        for _, v54 in pairs(v51:GetDescendants()) do
            if v8[v54.ClassName] then
                if v52 ~= nil then
                    v54.Enabled = v52;
                else
                    v54.Enabled = not v54.Enabled;
                end;
            end;
        end;
        return;
    end;
end;
v3.Cleanup = function(_, v56, v57) --[[ Line: 181 ]] --[[ Name: Cleanup ]]
    -- upvalues: l_TweenService_0 (copy)
    local v58 = v57 or 0;
    task.delay(v58, function() --[[ Line: 183 ]]
        -- upvalues: v56 (copy), l_TweenService_0 (ref)
        if v56 then
            for _, v60 in pairs(v56:GetDescendants()) do
                if v60:IsA("ParticleEmitter") then
                    v60.Enabled = false;
                end;
                if v60:IsA("BasePart") or v60:IsA("MeshPart") then
                    l_TweenService_0:Create(v60, TweenInfo.new(0.5), {
                        Transparency = 1
                    }):Play();
                end;
            end;
            task.wait(10);
            v56:Destroy();
        end;
    end);
end;
v3.Destroy = function(_, v62) --[[ Line: 201 ]] --[[ Name: Destroy ]]
    -- upvalues: v3 (copy)
    local l_v62_Descendants_0 = v62:GetDescendants();
    for _, _ in pairs(l_v62_Descendants_0) do
        v3:ToggleEmit(v62, false);
    end;
    task.delay(v3:GetMaxLifetime(l_v62_Descendants_0), v62.Destroy, v62);
end;
v3.ParticleDestroy = function(_, v67) --[[ Line: 209 ]] --[[ Name: ParticleDestroy ]]
    -- upvalues: v3 (copy), l_TweenService_0 (copy)
    if not v67 then
        return;
    else
        local l_v67_Descendants_0 = v67:GetDescendants();
        local l_v3_MaxLifetime_0 = v3:GetMaxLifetime(l_v67_Descendants_0);
        for _, v71 in pairs(l_v67_Descendants_0) do
            v3:ToggleEmit(v67, false);
            if v71.ClassName:match("Light") then
                l_TweenService_0:Create(v71, TweenInfo.new(l_v3_MaxLifetime_0), {
                    Brightness = 0
                }):Play();
            end;
        end;
        task.delay(l_v3_MaxLifetime_0, v67.Destroy, v67);
        return;
    end;
end;
v3.WeldToPart = function(_, v73, v74) --[[ Line: 224 ]] --[[ Name: WeldToPart ]]
    if not v73 or not v74 then
        return false;
    else
        local l_Weld_0 = Instance.new("Weld");
        l_Weld_0.Part0 = v73;
        l_Weld_0.Part1 = v74;
        l_Weld_0.Parent = v73;
        return l_Weld_0;
    end;
end;
v3.EmitToParent = function(_, v77, v78) --[[ Line: 235 ]] --[[ Name: EmitToParent ]]
    -- upvalues: v3 (copy)
    if v77 then
        if v78:IsA("BasePart") or v78:IsA("MeshPart") then
            for _, v80 in pairs(v78:GetChildren()) do
                v80.Parent = v77;
                v3:EmitHandler(v80);
            end;
            return v77;
        else
            v78.Parent = v77;
            v3:EmitHandler(v78);
        end;
    end;
    return v77;
end;
v3.GetMaxLifetime = function(_, v82) --[[ Line: 250 ]] --[[ Name: GetMaxLifetime ]]
    local v83 = 0;
    for _, v85 in pairs(v82) do
        if v85:IsA("ParticleEmitter") then
            local v86 = v85.Lifetime.Max + (v85:GetAttribute("EmitDuration") or 0);
            if v83 <= v86 then
                v83 = v86;
            end;
        end;
        if v85:IsA("Trail") then
            local l_Lifetime_0 = v85.Lifetime;
            if v83 <= l_Lifetime_0 then
                v83 = l_Lifetime_0;
            end;
        end;
    end;
    return v83;
end;
return v3;