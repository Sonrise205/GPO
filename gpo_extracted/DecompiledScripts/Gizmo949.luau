local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local l_Terrain_0 = workspace:WaitForChild("Terrain");
assert(l_Terrain_0, "No terrain object found under workspace...");
local l_AOTGizmoAdornment_0 = l_Terrain_0:FindFirstChild("AOTGizmoAdornment");
local l_GizmoAdornment_0 = l_Terrain_0:FindFirstChild("GizmoAdornment");
if not l_AOTGizmoAdornment_0 then
    l_AOTGizmoAdornment_0 = Instance.new("WireframeHandleAdornment");
    l_AOTGizmoAdornment_0.Adornee = l_Terrain_0;
    l_AOTGizmoAdornment_0.ZIndex = 1;
    l_AOTGizmoAdornment_0.AlwaysOnTop = true;
    l_AOTGizmoAdornment_0.Name = "AOTGizmoAdornment";
    l_AOTGizmoAdornment_0.Parent = l_Terrain_0;
end;
if not l_GizmoAdornment_0 then
    l_GizmoAdornment_0 = Instance.new("WireframeHandleAdornment");
    l_GizmoAdornment_0.Adornee = l_Terrain_0;
    l_GizmoAdornment_0.ZIndex = 1;
    l_GizmoAdornment_0.AlwaysOnTop = false;
    l_GizmoAdornment_0.Name = "GizmoAdornment";
    l_GizmoAdornment_0.Parent = l_Terrain_0;
end;
local l_Gizmos_0 = script:WaitForChild("Gizmos");
local v6 = {};
local v7 = {};
local v8 = {};
local v9 = {};
local v10 = {
    AlwaysOnTop = true
};
local v11 = {};
local v12 = false;
local function v15(v13, v14) --[[ Line: 44 ]] --[[ Name: Retain ]]
    -- upvalues: v7 (copy)
    table.insert(v7, {
        v13, 
        v14
    });
end;
local function v17(v16) --[[ Line: 48 ]] --[[ Name: Register ]]
    -- upvalues: v6 (ref)
    table.insert(v6, v16);
end;
local function v20(v18) --[[ Line: 52 ]] --[[ Name: Release ]]
    -- upvalues: v11 (copy)
    local l_ClassName_0 = v18.ClassName;
    if not v11[l_ClassName_0] then
        v11[l_ClassName_0] = {};
    end;
    v18:Remove();
    table.insert(v11[l_ClassName_0], v18);
end;
local function v23(v21) --[[ Line: 63 ]] --[[ Name: Request ]]
    -- upvalues: v11 (copy)
    if not v11[v21] then
        return Instance.new(v21);
    elseif not v11[v21][1] then
        return Instance.new(v21);
    else
        local v22 = v11[v21][1];
        table.remove(v11[v21], 1);
        return v22;
    end;
end;
local function _(v24, v25, v26) --[[ Line: 76 ]] --[[ Name: Lerp ]]
    return v24 + (v25 - v24) * v26;
end;
local function v28(v29) --[[ Line: 80 ]] --[[ Name: deepCopy ]]
    -- upvalues: v28 (copy)
    local v30 = {};
    for v31, v32 in pairs(v29) do
        if type(v32) == "table" then
            v32 = v28(v32);
        end;
        v30[v31] = v32;
    end;
    return v30;
end;
local v33 = {
    Color = "Color3", 
    Transparency = "Transparency", 
    AlwaysOnTop = "AlwaysOnTop"
};
local v40 = {
    Enabled = true, 
    ActiveRays = 0, 
    ActiveInstances = 0, 
    Styles = v33, 
    AOTWireframeHandle = l_AOTGizmoAdornment_0, 
    WireframeHandle = l_GizmoAdornment_0, 
    GetPoolSize = function() --[[ Line: 472 ]] --[[ Name: GetPoolSize ]]
        -- upvalues: v11 (copy)
        local v34 = 0;
        for _, v36 in v11 do
            v34 = v34 + #v36;
        end;
        return v34;
    end, 
    PushProperty = function(v37, v38) --[[ Line: 482 ]] --[[ Name: PushProperty ]]
        -- upvalues: v10 (copy), l_AOTGizmoAdornment_0 (ref), l_GizmoAdornment_0 (ref)
        v10[v37] = v38;
        if v37 == "AlwaysOnTop" then
            return;
        else
            pcall(function() --[[ Line: 489 ]]
                -- upvalues: l_AOTGizmoAdornment_0 (ref), v37 (copy), v38 (copy), l_GizmoAdornment_0 (ref)
                l_AOTGizmoAdornment_0[v37] = v38;
                l_GizmoAdornment_0[v37] = v38;
            end);
            return;
        end;
    end, 
    PopProperty = function(v39) --[[ Line: 495 ]] --[[ Name: PopProperty ]]
        -- upvalues: v10 (copy), l_AOTGizmoAdornment_0 (ref)
        if v10[v39] then
            return v10[v39];
        else
            return l_AOTGizmoAdornment_0[v39];
        end;
    end
};
v40.SetStyle = function(v41, v42, v43) --[[ Line: 503 ]] --[[ Name: SetStyle ]]
    -- upvalues: v40 (copy)
    if v41 and typeof(v41) == "Color3" then
        v40.PushProperty("Color3", v41);
    end;
    if v42 and typeof(v42) == "number" then
        v40.PushProperty("Transparency", v42);
    end;
    if v43 and typeof(v43) == "boolean" then
        v40.PushProperty("AlwaysOnTop", v43);
    end;
end;
v40.DoCleaning = function() --[[ Line: 517 ]] --[[ Name: DoCleaning ]]
    -- upvalues: l_AOTGizmoAdornment_0 (ref), l_GizmoAdornment_0 (ref), v6 (ref), v11 (copy), v40 (copy)
    l_AOTGizmoAdornment_0:Clear();
    l_GizmoAdornment_0:Clear();
    for _, v45 in v6 do
        local l_ClassName_1 = v45.ClassName;
        if not v11[l_ClassName_1] then
            v11[l_ClassName_1] = {};
        end;
        v45:Remove();
        table.insert(v11[l_ClassName_1], v45);
    end;
    v6 = {};
    v40.ActiveRays = 0;
    v40.ActiveInstances = 0;
end;
v40.ScheduleCleaning = function() --[[ Line: 531 ]] --[[ Name: ScheduleCleaning ]]
    -- upvalues: v12 (ref), v40 (copy)
    if v12 then
        return;
    else
        v12 = true;
        task.delay(0, function() --[[ Line: 538 ]]
            -- upvalues: v40 (ref), v12 (ref)
            v40.DoCleaning();
            v12 = false;
        end);
        return;
    end;
end;
v40.AddDebrisInSeconds = function(v47, v48) --[[ Line: 545 ]] --[[ Name: AddDebrisInSeconds ]]
    -- upvalues: v8 (copy)
    table.insert(v8, {
        "Seconds", 
        v47, 
        os.clock(), 
        v48
    });
end;
v40.AddDebrisInFrames = function(v49, v50) --[[ Line: 549 ]] --[[ Name: AddDebrisInFrames ]]
    -- upvalues: v8 (copy)
    table.insert(v8, {
        "Frames", 
        v49, 
        0, 
        v50
    });
end;
v40.TweenProperties = function(v51, v52, v53) --[[ Line: 553 ]] --[[ Name: TweenProperties ]]
    -- upvalues: v28 (copy), v9 (copy)
    local v54 = v28(v51);
    table.insert(v9, {
        p_Properties = v51, 
        Properties = v54, 
        Goal = v52, 
        TweenInfo = v53, 
        Time = 0
    });
    local v55 = #v9;
    return function() --[[ Line: 567 ]]
        -- upvalues: v9 (ref), v55 (copy)
        table.remove(v9, v55);
    end;
end;
v40.Init = function() --[[ Line: 572 ]] --[[ Name: Init ]]
    -- upvalues: l_RunService_0 (copy), v9 (copy), l_TweenService_0 (copy), v8 (copy), v7 (copy)
    l_RunService_0.RenderStepped:Connect(function(v56) --[[ Line: 573 ]]
        -- upvalues: v9 (ref), l_TweenService_0 (ref), v8 (ref), v7 (ref)
        for v57, v58 in v9 do
            v58.Time = v58.Time + v56;
            local v59 = v58.Time / v58.TweenInfo.Time;
            if v59 > 1 then
                v59 = 1;
            end;
            local function _(v60, v61, v62) --[[ Line: 582 ]] --[[ Name: LerpProperty ]]
                if type(v60) == "number" then
                    return v60 + (v61 - v60) * v62;
                else
                    return v60:Lerp(v61, v62);
                end;
            end;
            for v64, v65 in v58.Properties do
                if v58.Goal[v64] then
                    local l_l_TweenService_0_Value_0 = l_TweenService_0:GetValue(v59, v58.TweenInfo.EasingStyle, v58.TweenInfo.EasingDirection);
                    local v67 = v58.Goal[v64];
                    local v68 = if type(v65) == "number" then v65 + (v67 - v65) * l_l_TweenService_0_Value_0 else v65:Lerp(v67, l_l_TweenService_0_Value_0);
                    v58.p_Properties[v64] = v68;
                end;
            end;
            if v59 == 1 then
                table.remove(v9, v57);
            end;
        end;
        for v69, v70 in v8 do
            local v71 = v70[1];
            local v72 = v70[2];
            local v73 = v70[3];
            local v74 = v70[4];
            if v71 == "Seconds" then
                if v72 < os.clock() - v73 then
                    table.remove(v8, v69);
                else
                    v74();
                end;
            elseif v72 < v73 then
                table.remove(v8, v69);
            else
                v70[2] = v70[2] + 1;
                v74();
            end;
        end;
        for v75, v76 in v7 do
            local v77 = v76[2];
            if v77.Enabled then
                if v77.Destroy then
                    table.remove(v7, v75);
                end;
                v76[1]:Update(v77);
            end;
        end;
    end);
end;
v40.SetEnabled = function(v78) --[[ Line: 649 ]] --[[ Name: SetEnabled ]]
    -- upvalues: v40 (copy)
    v40.Enabled = v78;
    if v78 == false then
        v40.DoCleaning();
    end;
end;
for _, v80 in l_Gizmos_0:GetChildren() do
    v40[v80.Name] = require(v80).Init(v40, v10, v23, v20, v15, v17);
end;
return v40;