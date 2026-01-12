local v23 = {
    QuickWeld = function(_, v1, v2, v3, v4) --[[ Line: 4 ]] --[[ Name: QuickWeld ]]
        local l_Weld_0 = Instance.new("Weld");
        l_Weld_0.Part0 = v1;
        l_Weld_0.Part1 = v2;
        if v3 ~= nil then
            l_Weld_0.C0 = v3;
        end;
        if v4 ~= nil then
            l_Weld_0.C1 = v4;
        end;
        l_Weld_0.Parent = v1;
        return l_Weld_0;
    end, 
    QuickMotor6d = function(_, v7, v8, v9, v10) --[[ Line: 21 ]] --[[ Name: QuickMotor6d ]]
        local l_Motor6D_0 = Instance.new("Motor6D");
        l_Motor6D_0.Part0 = v7;
        l_Motor6D_0.Part1 = v8;
        if v9 ~= nil then
            l_Motor6D_0.C0 = v9;
        end;
        if v10 ~= nil then
            l_Motor6D_0.C1 = v10;
        end;
        l_Motor6D_0.Parent = v7;
        return l_Motor6D_0;
    end, 
    AddItem = function(_, v13, v14) --[[ Line: 37 ]] --[[ Name: AddItem ]]
        task.delay(v14, function() --[[ Line: 38 ]]
            -- upvalues: v13 (copy)
            if v13.Parent ~= nil then
                v13:Destroy();
            end;
        end);
    end, 
    ClearChildren = function(_, v16) --[[ Line: 45 ]] --[[ Name: ClearChildren ]]
        task.spawn(function() --[[ Line: 46 ]]
            -- upvalues: v16 (copy)
            for _, v18 in ipairs(v16:GetChildren()) do
                v18:Destroy();
            end;
        end);
    end, 
    Emit = function(_, v20) --[[ Line: 55 ]] --[[ Name: Emit ]]
        for _, v22 in ipairs(v20:GetDescendants()) do
            if v22:IsA("ParticleEmitter") then
                v22:Emit(v22:GetAttribute("EmitCount"));
            end;
        end;
    end
};
v23.DelayEmit = function(_, v25, v26) --[[ Line: 63 ]] --[[ Name: DelayEmit ]]
    -- upvalues: v23 (copy)
    task.delay(v26, function() --[[ Line: 64 ]]
        -- upvalues: v23 (ref), v25 (copy)
        v23:Emit(v25);
    end);
end;
v23.ToggleEnabled = function(_, v28, v29) --[[ Line: 69 ]] --[[ Name: ToggleEnabled ]]
    for _, v31 in ipairs(v28:GetDescendants()) do
        if v31:IsA("ParticleEmitter") then
            v31.Enabled = v29;
        end;
    end;
end;
v23.GetBodyParts = function(_) --[[ Line: 77 ]] --[[ Name: GetBodyParts ]]
    return {
        "RightUpperArm", 
        "RightLowerArm", 
        "RightHand", 
        "LeftUpperArm", 
        "LeftLowerArm", 
        "LeftHand", 
        "LeftUpperLeg", 
        "LeftLowerLeg", 
        "LeftFoot", 
        "RightUpperLeg", 
        "RightLowerLeg", 
        "RightFoot", 
        "Head", 
        "UpperTorso", 
        "LowerTorso"
    };
end;
local function _(v33, v34, v35) --[[ Line: 97 ]] --[[ Name: GetLerp ]]
    return v33 + (v34 - v33) * v35;
end;
v23.GetQuadBezier = function(_, v38, v39, v40, v41) --[[ Line: 101 ]] --[[ Name: GetQuadBezier ]]
    local v42 = v39 + (v40 - v39) * v38;
    return v42 + (v40 + (v41 - v40) * v38 - v42) * v38;
end;
v23.GetCubicBezier = function(_, v44, v45, v46, v47, v48) --[[ Line: 108 ]] --[[ Name: GetCubicBezier ]]
    return (1 - v44) ^ 3 * v45 + 3 * (1 - v44) ^ 2 * v44 * v46 + 3 * (1 - v44) * v44 ^ 2 * v47 + v44 ^ 3 * v48;
end;
v23.GetRadialPoints = function(_, v50, v51, v52) --[[ Line: 112 ]] --[[ Name: GetRadialPoints ]]
    local v53 = {};
    for v54 = 1, v51 do
        local v55 = 6.283185307179586 / v51 * v54;
        local v56 = math.sin(v55) * v52;
        local v57 = math.cos(v55) * v52;
        v53[v54] = v50 * CFrame.new(v57, 0, v56);
    end;
    return v53;
end;
v23.VisualizeHitbox = function(_, v59, v60, v61, v62) --[[ Line: 125 ]] --[[ Name: VisualizeHitbox ]]
    -- upvalues: v23 (copy)
    local l_Part_0 = Instance.new("Part");
    l_Part_0.CFrame = v60;
    if typeof(v61) == "number" then
        l_Part_0.Size = Vector3.new(v61, v61, v61);
    else
        l_Part_0.Size = v61;
    end;
    l_Part_0.Shape = v59 or Enum.PartType.Block;
    l_Part_0.Anchored = true;
    l_Part_0.CanCollide = false;
    l_Part_0.CanTouch = false;
    l_Part_0.CanQuery = false;
    l_Part_0.Color = Color3.new(0.9, 0, 0);
    l_Part_0.Transparency = 0.92;
    l_Part_0.Material = Enum.Material.Neon;
    l_Part_0.Parent = workspace.Effects;
    v23:AddItem(l_Part_0, v62 or 1);
end;
return v23;