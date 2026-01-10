local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local l_Terrain_0 = workspace:WaitForChild("Terrain");
local l_Terrain_1 = workspace:WaitForChild("Terrain");
assert(l_Terrain_0, "No terrain object found under workspace");
assert(l_Terrain_1, "No target parent found.");
local l_AOTGizmoAdornment_0 = l_Terrain_1:FindFirstChild("AOTGizmoAdornment");
local l_GizmoAdornment_0 = l_Terrain_1:FindFirstChild("GizmoAdornment");
if not l_AOTGizmoAdornment_0 then
    l_AOTGizmoAdornment_0 = Instance.new("WireframeHandleAdornment");
    l_AOTGizmoAdornment_0.Adornee = l_Terrain_0;
    l_AOTGizmoAdornment_0.ZIndex = 1;
    l_AOTGizmoAdornment_0.AlwaysOnTop = true;
    l_AOTGizmoAdornment_0.Name = "AOTGizmoAdornment";
    l_AOTGizmoAdornment_0.Parent = l_Terrain_1;
end;
if not l_GizmoAdornment_0 then
    l_GizmoAdornment_0 = Instance.new("WireframeHandleAdornment");
    l_GizmoAdornment_0.Adornee = l_Terrain_0;
    l_GizmoAdornment_0.ZIndex = 1;
    l_GizmoAdornment_0.AlwaysOnTop = false;
    l_GizmoAdornment_0.Name = "GizmoAdornment";
    l_GizmoAdornment_0.Parent = l_Terrain_1;
end;
local l_Gizmos_0 = script.Parent:WaitForChild("Gizmos");
local v7 = {};
local v8 = {};
local v9 = {};
local v10 = {};
local v11 = {
    AlwaysOnTop = true, 
    Color3 = Color3.fromRGB(13, 105, 172), 
    Transparency = 0
};
local v12 = {};
local v13 = false;
local function v16(v14, v15) --[[ Line: 46 ]] --[[ Name: Retain ]]
    -- upvalues: v8 (copy)
    table.insert(v8, {
        v14, 
        v15
    });
end;
local function v18(v17) --[[ Line: 50 ]] --[[ Name: Register ]]
    -- upvalues: l_Terrain_1 (copy), v7 (ref)
    v17.Parent = l_Terrain_1;
    table.insert(v7, v17);
end;
local function v21(v19) --[[ Line: 55 ]] --[[ Name: Release ]]
    -- upvalues: v12 (copy)
    local l_ClassName_0 = v19.ClassName;
    if not v12[l_ClassName_0] then
        v12[l_ClassName_0] = {};
    end;
    v19:Remove();
    table.insert(v12[l_ClassName_0], v19);
end;
local function v24(v22) --[[ Line: 66 ]] --[[ Name: Request ]]
    -- upvalues: v12 (copy)
    if not v12[v22] then
        return Instance.new(v22);
    else
        local v23 = table.remove(v12[v22]);
        if not v23 then
            return Instance.new(v22);
        else
            return v23;
        end;
    end;
end;
local function _(v25, v26, v27) --[[ Line: 80 ]] --[[ Name: Lerp ]]
    return v25 + (v26 - v25) * v27;
end;
local function v29(v30) --[[ Line: 84 ]] --[[ Name: deepCopy ]]
    -- upvalues: v29 (copy)
    local v31 = {};
    for v32, v33 in pairs(v30) do
        if type(v33) == "table" then
            v33 = v29(v33);
        end;
        v31[v32] = v33;
    end;
    return v31;
end;
local v34 = {
    Color = "Color3", 
    Transparency = "Transparency", 
    AlwaysOnTop = "AlwaysOnTop"
};
local v41 = {
    Enabled = true, 
    ActiveRays = 0, 
    ActiveInstances = 0, 
    Styles = v34, 
    AOTWireframeHandle = l_AOTGizmoAdornment_0, 
    WireframeHandle = l_GizmoAdornment_0, 
    GetPoolSize = function() --[[ Line: 506 ]] --[[ Name: GetPoolSize ]]
        -- upvalues: v12 (copy)
        local v35 = 0;
        for _, v37 in v12 do
            v35 = v35 + #v37;
        end;
        return v35;
    end, 
    PushProperty = function(v38, v39) --[[ Line: 521 ]] --[[ Name: PushProperty ]]
        -- upvalues: v11 (copy), l_AOTGizmoAdornment_0 (ref), l_GizmoAdornment_0 (ref)
        v11[v38] = v39;
        if v38 == "AlwaysOnTop" then
            return;
        else
            pcall(function() --[[ Line: 528 ]]
                -- upvalues: l_AOTGizmoAdornment_0 (ref), v38 (copy), v39 (copy), l_GizmoAdornment_0 (ref)
                l_AOTGizmoAdornment_0[v38] = v39;
                l_GizmoAdornment_0[v38] = v39;
            end);
            return;
        end;
    end, 
    PopProperty = function(v40) --[[ Line: 539 ]] --[[ Name: PopProperty ]]
        -- upvalues: v11 (copy), l_AOTGizmoAdornment_0 (ref)
        if v11[v40] then
            return v11[v40];
        else
            return l_AOTGizmoAdornment_0[v40];
        end;
    end
};
v41.SetStyle = function(v42, v43, v44) --[[ Line: 553 ]] --[[ Name: SetStyle ]]
    -- upvalues: v41 (copy)
    if v42 ~= nil and typeof(v42) == "Color3" then
        v41.PushProperty("Color3", v42);
    end;
    if v43 ~= nil and typeof(v43) == "number" then
        v41.PushProperty("Transparency", v43);
    end;
    if v44 ~= nil and typeof(v44) == "boolean" then
        v41.PushProperty("AlwaysOnTop", v44);
    end;
end;
v41.DoCleaning = function() --[[ Line: 569 ]] --[[ Name: DoCleaning ]]
    -- upvalues: l_AOTGizmoAdornment_0 (ref), l_GizmoAdornment_0 (ref), v7 (ref), v12 (copy), v41 (copy)
    l_AOTGizmoAdornment_0:Clear();
    l_GizmoAdornment_0:Clear();
    for _, v46 in v7 do
        local l_ClassName_1 = v46.ClassName;
        if not v12[l_ClassName_1] then
            v12[l_ClassName_1] = {};
        end;
        v46:Remove();
        table.insert(v12[l_ClassName_1], v46);
    end;
    v7 = {};
    v41.ActiveRays = 0;
    v41.ActiveInstances = 0;
end;
v41.ScheduleCleaning = function() --[[ Line: 585 ]] --[[ Name: ScheduleCleaning ]]
    -- upvalues: v13 (ref), v41 (copy)
    if v13 then
        return;
    else
        v13 = true;
        task.delay(0, function() --[[ Line: 592 ]]
            -- upvalues: v41 (ref), v13 (ref)
            v41.DoCleaning();
            v13 = false;
        end);
        return;
    end;
end;
v41.AddDebrisInSeconds = function(v48, v49) --[[ Line: 604 ]] --[[ Name: AddDebrisInSeconds ]]
    -- upvalues: v9 (copy)
    table.insert(v9, {
        "Seconds", 
        v48, 
        os.clock(), 
        v49
    });
end;
v41.AddDebrisInFrames = function(v50, v51) --[[ Line: 613 ]] --[[ Name: AddDebrisInFrames ]]
    -- upvalues: v9 (copy)
    table.insert(v9, {
        "Frames", 
        v50, 
        0, 
        v51
    });
end;
v41.TweenProperties = function(v52, v53, v54) --[[ Line: 624 ]] --[[ Name: TweenProperties ]]
    -- upvalues: v29 (copy), v10 (copy)
    local v55 = v29(v52);
    local v56 = {
        p_Properties = v52, 
        Properties = v55, 
        Goal = v53, 
        TweenInfo = v54, 
        Time = 0
    };
    v10[v56] = true;
    return function() --[[ Line: 638 ]]
        -- upvalues: v10 (ref), v56 (copy)
        v10[v56] = nil;
    end;
end;
v41.Init = function() --[[ Line: 645 ]] --[[ Name: Init ]]
    -- upvalues: l_RunService_0 (copy), v41 (copy), l_Terrain_1 (copy), l_AOTGizmoAdornment_0 (ref), l_Terrain_0 (copy), l_GizmoAdornment_0 (ref), v10 (copy), l_TweenService_0 (copy), v9 (copy), v8 (copy)
    l_RunService_0.RenderStepped:Connect(function(v57) --[[ Line: 646 ]]
        -- upvalues: v41 (ref), l_Terrain_1 (ref), l_AOTGizmoAdornment_0 (ref), l_Terrain_0 (ref), l_GizmoAdornment_0 (ref), v10 (ref), l_TweenService_0 (ref), v9 (ref), v8 (ref)
        if v41.Enabled then
            if not l_Terrain_1:FindFirstChild("AOTGizmoAdornment") then
                l_AOTGizmoAdornment_0 = Instance.new("WireframeHandleAdornment");
                l_AOTGizmoAdornment_0.Adornee = l_Terrain_0;
                l_AOTGizmoAdornment_0.ZIndex = 1;
                l_AOTGizmoAdornment_0.AlwaysOnTop = true;
                l_AOTGizmoAdornment_0.Name = "AOTGizmoAdornment";
                l_AOTGizmoAdornment_0.Parent = l_Terrain_1;
                v41.AOTWireframeHandle = l_AOTGizmoAdornment_0;
            end;
            if not l_Terrain_1:FindFirstChild("GizmoAdornment") then
                l_GizmoAdornment_0 = Instance.new("WireframeHandleAdornment");
                l_GizmoAdornment_0.Adornee = l_Terrain_0;
                l_GizmoAdornment_0.ZIndex = 1;
                l_GizmoAdornment_0.AlwaysOnTop = false;
                l_GizmoAdornment_0.Name = "GizmoAdornment";
                l_GizmoAdornment_0.Parent = l_Terrain_1;
                v41.WireframeHandle = l_GizmoAdornment_0;
            end;
        end;
        for v58 in v10 do
            v58.Time = v58.Time + v57;
            local v59 = v58.Time / v58.TweenInfo.Time;
            if v59 > 1 then
                v59 = 1;
            end;
            local function _(v60, v61, v62) --[[ Line: 680 ]] --[[ Name: LerpProperty ]]
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
                v10[v58] = nil;
            end;
        end;
        for v69 = #v9, 1, -1 do
            local v70 = v9[v69];
            local v71 = v70[1];
            local v72 = v70[2];
            local v73 = v70[3];
            local v74 = v70[4];
            if v71 == "Seconds" then
                if v72 < os.clock() - v73 then
                    table.remove(v9, v69);
                else
                    v74();
                end;
            elseif v72 < v73 then
                table.remove(v9, v69);
            else
                v70[2] = v70[2] + 1;
                v74();
            end;
        end;
        for v75 = #v8, 1, -1 do
            local v76 = v8[v75];
            local v77 = v76[2];
            if v77.Enabled then
                if v77.Destroy then
                    table.remove(v8, v75);
                end;
                v76[1]:Update(v77);
            end;
        end;
    end);
end;
v41.SetEnabled = function(v78) --[[ Line: 752 ]] --[[ Name: SetEnabled ]]
    -- upvalues: v41 (copy)
    v41.Enabled = v78;
    if v78 == false then
        v41.DoCleaning();
    end;
end;
v41.RemoveAdornments = function() --[[ Line: 763 ]] --[[ Name: RemoveAdornments ]]
    -- upvalues: l_Terrain_1 (copy)
    if l_Terrain_1:FindFirstChild("AOTGizmoAdornment") then
        l_Terrain_1:FindFirstChild("AOTGizmoAdornment"):Destroy();
    end;
    if l_Terrain_1:FindFirstChild("GizmoAdornment") then
        l_Terrain_1:FindFirstChild("GizmoAdornment"):Destroy();
    end;
end;
for _, v80 in l_Gizmos_0:GetChildren() do
    v41[v80.Name] = require(v80).Init(v41, v11, v24, v21, v16, v18);
end;
return v41;