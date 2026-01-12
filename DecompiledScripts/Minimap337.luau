local v0 = {};
local l_RunService_0 = game:GetService("RunService");
local l_InternalMethods_0 = require(script:WaitForChild("InternalMethods"));
local l_Events_0 = require(script:WaitForChild("Events"));
local v4 = setmetatable({}, {
    __index = l_InternalMethods_0
});
local l_Configuration_0 = script:WaitForChild("Configuration");
local v6 = {};
local _ = l_RunService_0.Heartbeat;
local _ = game.Workspace.CurrentCamera;
local l_math_0 = math;
local l_UDim2_0 = UDim2;
local l_clamp_0 = l_math_0.clamp;
local l_new_0 = l_UDim2_0.new;
local function _(v13, v14) --[[ Line: 17 ]] --[[ Name: CalculateDelta ]]
    local v15 = v14:PointToObjectSpace(v13.Position);
    return v15.X, v15.Z;
end;
local function _(v17, v18, v19, v20, v21, v22) --[[ Line: 22 ]] --[[ Name: CalculateBlipOffsetClamp ]]
    -- upvalues: l_clamp_0 (copy)
    return l_clamp_0(v17 * v19, -v21, v21), l_clamp_0(v18 * v20, -v22, v22);
end;
local function _(v24, v25, v26, v27) --[[ Line: 26 ]] --[[ Name: CalculateBlipOffset ]]
    return v24 * v26, v25 * v27;
end;
local function _(v29, v30) --[[ Line: 30 ]] --[[ Name: CloneTable ]]
    coroutine.wrap(function() --[[ Line: 31 ]]
        -- upvalues: v30 (copy), v29 (copy)
        for v31, v32 in pairs(v30) do
            v29[v31] = v32;
        end;
    end)();
    return v29;
end;
local function _(v34, v35) --[[ Line: 39 ]] --[[ Name: MainBlipAdded ]]
    -- upvalues: l_UDim2_0 (copy)
    v35.Parent = v34.Map;
    v35.AnchorPoint = Vector2.new(0.5, 0.5);
    v35.Position = l_UDim2_0.fromScale(0.5, 0.5);
    v35.ZIndex = 20;
    return v35;
end;
v4.ImportMap = function(v37, v38, v39) --[[ Line: 48 ]] --[[ Name: ImportMap ]]
    v38 = v37:CreateMap(v38, v39);
    v38.Parent = v37.Frame;
    if v37.Map then
        v37:RemoveMapConnection(v37.Map);
        v37.Map:Destroy();
    end;
    v37.Map = v38;
    v37:CreateMapConnections(v38);
    v37:CalculateRatios(v38);
end;
v4.ImportMainBlip = function(v40, v41, v42, v43) --[[ Line: 60 ]] --[[ Name: ImportMainBlip ]]
    -- upvalues: l_UDim2_0 (copy), l_Events_0 (copy)
    if v40.MainBlip then
        v40.MainBlip:Destroy();
        v40.MainBlip = nil;
        v40.MainPart = nil;
    end;
    if v43 then
        v40.UsingOrientation = true;
    end;
    v41.Parent = v40.Map;
    v41.AnchorPoint = Vector2.new(0.5, 0.5);
    v41.Position = l_UDim2_0.fromScale(0.5, 0.5);
    v41.ZIndex = 20;
    v40.MainBlip = v41;
    v40.MainPart = v42;
    l_Events_0.CreateBindableEvent(v40.MainPartChanged);
    l_Events_0.CreateBindableEvent(v40.MainBlipChanged);
end;
v4.ImportBlip = function(v44, v45, v46, v47, v48) --[[ Line: 75 ]] --[[ Name: ImportBlip ]]
    v46.Destroying:Connect(function() --[[ Line: 76 ]]
        -- upvalues: v44 (copy), v46 (copy)
        v44:RemoveBlip(v46);
    end);
    return v44:AddBlip(v45, v46, v47, v48);
end;
v4.UpdateMainBlipPart = function(v49, v50) --[[ Line: 82 ]] --[[ Name: UpdateMainBlipPart ]]
    -- upvalues: l_Events_0 (copy)
    coroutine.wrap(function() --[[ Line: 83 ]]
        -- upvalues: v49 (copy), v50 (copy), l_Events_0 (ref)
        v49.MainPart = nil;
        v49.MainPart = v50;
        l_Events_0.ReturnBindableEvent(v49.MainPartChanged):Fire();
    end)();
end;
v4.UpdateMainBlip = function(v51, v52) --[[ Line: 90 ]] --[[ Name: UpdateMainBlip ]]
    -- upvalues: l_UDim2_0 (copy), l_Events_0 (copy)
    coroutine.wrap(function() --[[ Line: 91 ]]
        -- upvalues: v51 (copy), v52 (copy), l_UDim2_0 (ref), l_Events_0 (ref)
        v51.MainBlip:Destroy();
        local l_v51_0 = v51;
        local l_v51_1 = v51;
        local l_v52_0 = v52;
        l_v52_0.Parent = l_v51_1.Map;
        l_v52_0.AnchorPoint = Vector2.new(0.5, 0.5);
        l_v52_0.Position = l_UDim2_0.fromScale(0.5, 0.5);
        l_v52_0.ZIndex = 20;
        l_v51_0.MainBlip = l_v52_0;
        l_Events_0.ReturnBindableEvent(v51.MainBlipChanged):Fire();
    end)();
end;
v4.EnableBlip = function(v56, v57) --[[ Line: 98 ]] --[[ Name: EnableBlip ]]
    -- upvalues: l_Events_0 (copy)
    coroutine.wrap(function() --[[ Line: 99 ]]
        -- upvalues: v56 (copy), v57 (copy), l_Events_0 (ref)
        local v58 = v56.Blips[v57];
        local l_Blip_0 = v58.Blip;
        v56.ActiveBlips[v57] = l_Blip_0;
        l_Events_0.ReturnBindableEvent(v56.ActiveBlips):Fire(v57, true);
        if v58.Orientation then
            v56.ActiveOrientationBlips[v57] = v58.Blip;
            l_Events_0.ReturnBindableEvent(v56.ActiveOrientationBlips):Fire(v57, true);
        end;
        if l_Blip_0.Name == "stormCenter" and l_Blip_0:findFirstChild("stormRing") == nil then
            local v60 = script.stormRing:Clone();
            v60.Parent = l_Blip_0;
            v60.LocalScript:SetAttribute("Resolution", script:GetAttribute("Resolution"));
            v60.LocalScript.Disabled = false;
        end;
        task.wait();
        l_Blip_0.Visible = true;
    end)();
end;
v4.DisableBlip = function(v61, v62) --[[ Line: 119 ]] --[[ Name: DisableBlip ]]
    -- upvalues: l_Events_0 (copy)
    coroutine.wrap(function() --[[ Line: 120 ]]
        -- upvalues: v61 (copy), v62 (copy), l_Events_0 (ref)
        local v63 = v61.Blips[v62];
        v63.Blip.Visible = false;
        v61.ActiveBlips[v62] = nil;
        l_Events_0.ReturnBindableEvent(v61.ActiveBlips):Fire(v62, false);
        if v63.Orientation then
            v61.ActiveOrientationBlips[v62] = nil;
            l_Events_0.ReturnBindableEvent(v61.ActiveOrientationBlips):Fire(v62, true);
        end;
    end)();
end;
v4.RemoveBlip = function(v64, v65) --[[ Line: 133 ]] --[[ Name: RemoveBlip ]]
    -- upvalues: l_Events_0 (copy)
    coroutine.wrap(function() --[[ Line: 134 ]]
        -- upvalues: v64 (copy), v65 (copy), l_Events_0 (ref)
        local v66 = v64.Blips[v65];
        if v66 == nil then
            return;
        else
            v66.Blip:Destroy();
            v64.ActiveBlips[v65] = nil;
            l_Events_0.ReturnBindableEvent(v64.ActiveBlips):Fire(v65, false);
            if v66.Orientation then
                v64.ActiveOrientationBlips[v65] = nil;
                l_Events_0.ReturnBindableEvent(v64.ActiveOrientationBlips):Fire(v65, true);
            end;
            v64.Blips[v65] = nil;
            return;
        end;
    end)();
end;
v4.UpdateBlipPart = function(v67, v68, v69) --[[ Line: 151 ]] --[[ Name: UpdateBlipPart ]]
    -- upvalues: l_Events_0 (copy)
    local l_Blips_0 = v67.Blips;
    local l_ActiveBlips_0 = v67.ActiveBlips;
    local v72 = l_Blips_0[v68];
    if v72 == nil then
        return;
    else
        local v73 = l_Events_0.ReturnBindableEvent(l_ActiveBlips_0);
        l_Blips_0[v69] = v72;
        l_Blips_0[v68] = nil;
        l_ActiveBlips_0[v69] = v72;
        l_ActiveBlips_0[v68] = nil;
        v73:Fire(v68, false);
        v73:Fire(v69, true);
        if v72.Orientation then
            local l_ActiveOrientationBlips_0 = v67.ActiveOrientationBlips;
            local v75 = l_Events_0.ReturnBindableEvent(l_ActiveOrientationBlips_0);
            l_ActiveOrientationBlips_0[v69] = v72;
            l_ActiveOrientationBlips_0[v68] = nil;
            v75:Fire(v68, false);
            v75:Fire(v69, true);
        end;
        return;
    end;
end;
v4.UpdateBlipIcon = function(v76, v77, _) --[[ Line: 175 ]] --[[ Name: UpdateBlipIcon ]]
    local l_Blips_1 = v76.Blips;
    local l_ActiveBlips_1 = v76.ActiveBlips;
    local _ = v76.ActiveOrientationBlips;
    local _ = l_Blips_1[v77];
    l_ActiveBlips_1[v77] = nil;
end;
v4.ChangeMap = function(v83, v84, v85, v86, v87) --[[ Line: 183 ]] --[[ Name: ChangeMap ]]
    v83:AddNewMap(v84, v85, v86, v87);
end;
v4.Run = function(v88) --[[ Line: 187 ]] --[[ Name: Run ]]
    -- upvalues: l_Configuration_0 (copy), l_Events_0 (copy), l_clamp_0 (copy), l_new_0 (copy), l_math_0 (copy)
    local v89 = nil;
    l_Configuration_0:WaitForChild("UsingOrientation");
    if l_Configuration_0.UsingOrientation.Value then
        v89 = true;
    end;
    v89 = true;
    local v90 = {};
    local l_ActiveBlips_2 = v88.ActiveBlips;
    local l_l_ActiveBlips_2_0 = l_ActiveBlips_2 --[[ copy: 4 -> 19 ]];
    local l_v90_0 = v90 --[[ copy: 3 -> 20 ]];
    coroutine.wrap(function() --[[ Line: 31 ]]
        -- upvalues: l_l_ActiveBlips_2_0 (copy), l_v90_0 (copy)
        for v94, v95 in pairs(l_l_ActiveBlips_2_0) do
            l_v90_0[v94] = v95;
        end;
    end)();
    local l_v90_1 = v90;
    v90 = nil;
    if v89 then
        l_ActiveBlips_2 = {};
        local l_ActiveOrientationBlips_2 = v88.ActiveOrientationBlips;
        local l_l_ActiveOrientationBlips_2_0 = l_ActiveOrientationBlips_2 --[[ copy: 5 -> 21 ]];
        local l_l_ActiveBlips_2_1 = l_ActiveBlips_2 --[[ copy: 4 -> 22 ]];
        coroutine.wrap(function() --[[ Line: 31 ]]
            -- upvalues: l_l_ActiveOrientationBlips_2_0 (copy), l_l_ActiveBlips_2_1 (copy)
            for v100, v101 in pairs(l_l_ActiveOrientationBlips_2_0) do
                l_l_ActiveBlips_2_1[v100] = v101;
            end;
        end)();
        v90 = l_ActiveBlips_2;
    end;
    l_Events_0.ReturnBindableEvent(v88.ActiveBlips).Event:Connect(function(v102, v103) --[[ Line: 203 ]]
        -- upvalues: v88 (copy), l_v90_1 (copy)
        if v103 and v88.Blips[v102] then
            l_v90_1[v102] = v88.Blips[v102].Blip;
            return;
        else
            l_v90_1[v102] = nil;
            return;
        end;
    end);
    l_Events_0.ReturnBindableEvent(v88.ActiveOrientationBlips).Event:Connect(function(v104, v105) --[[ Line: 211 ]]
        -- upvalues: v90 (ref), v88 (copy)
        if v105 then
            v90[v104] = v88.Blips[v104].Blip;
            return;
        else
            v90[v104] = nil;
            return;
        end;
    end);
    l_ActiveBlips_2 = v88.MapCenterPoint;
    local v106 = CFrame.new(l_ActiveBlips_2.X, 0, l_ActiveBlips_2.Y);
    l_Events_0.ReturnBindableEvent(v88.CenterPointChanged).Event:Connect(function() --[[ Line: 221 ]]
        -- upvalues: l_ActiveBlips_2 (ref), v88 (copy), v106 (ref)
        l_ActiveBlips_2 = v88.MapCenterPoint;
        v106 = CFrame.new(l_ActiveBlips_2.X, 0, l_ActiveBlips_2.Y);
    end);
    local l_TruePixelsPerStudX_0 = v88.TruePixelsPerStudX;
    local l_TruePixelsPerStudY_0 = v88.TruePixelsPerStudY;
    local l_MaximumMapOffsetX_0 = v88.MaximumMapOffsetX;
    local l_MaximumMapOffsetY_0 = v88.MaximumMapOffsetY;
    local l_MaximumMainBlipOffsetX_0 = v88.MaximumMainBlipOffsetX;
    local l_MaximumMainBlipOffsetY_0 = v88.MaximumMainBlipOffsetY;
    local l_MaximumBlipOffsetX_0 = v88.MaximumBlipOffsetX;
    local l_MaximumBlipOffsetY_0 = v88.MaximumBlipOffsetY;
    local l_MaximumOffsetX_0 = v88.MaximumOffsetX;
    local l_MaximumOffsetY_0 = v88.MaximumOffsetY;
    l_Events_0.ReturnBindableEvent(v88.RatiosChanged).Event:Connect(function() --[[ Line: 238 ]]
        -- upvalues: l_TruePixelsPerStudX_0 (ref), v88 (copy), l_TruePixelsPerStudY_0 (ref), l_MaximumMapOffsetX_0 (ref), l_MaximumMapOffsetY_0 (ref), l_MaximumMainBlipOffsetX_0 (ref), l_MaximumMainBlipOffsetY_0 (ref), l_MaximumBlipOffsetX_0 (ref), l_MaximumBlipOffsetY_0 (ref), l_MaximumOffsetX_0 (ref), l_MaximumOffsetY_0 (ref)
        l_TruePixelsPerStudX_0 = v88.TruePixelsPerStudX;
        l_TruePixelsPerStudY_0 = v88.TruePixelsPerStudY;
        l_MaximumMapOffsetX_0 = v88.MaximumMapOffsetX;
        l_MaximumMapOffsetY_0 = v88.MaximumMapOffsetY;
        l_MaximumMainBlipOffsetX_0 = v88.MaximumMainBlipOffsetX;
        l_MaximumMainBlipOffsetY_0 = v88.MaximumMainBlipOffsetY;
        l_MaximumBlipOffsetX_0 = v88.MaximumBlipOffsetX;
        l_MaximumBlipOffsetY_0 = v88.MaximumBlipOffsetY;
        l_MaximumOffsetX_0 = v88.MaximumOffsetX;
        l_MaximumOffsetY_0 = v88.MaximumOffsetY;
    end);
    local l_MainPart_0 = v88.MainPart;
    local l_MainBlip_0 = v88.MainBlip;
    local l_Map_0 = v88.Map;
    l_Events_0.ReturnBindableEvent(v88.MainPartChanged).Event:Connect(function() --[[ Line: 256 ]]
        -- upvalues: l_MainPart_0 (ref), v88 (copy)
        l_MainPart_0 = v88.MainPart;
    end);
    l_Events_0.ReturnBindableEvent(v88.MainBlipChanged).Event:Connect(function() --[[ Line: 259 ]]
        -- upvalues: l_MainBlip_0 (ref), v88 (copy)
        l_MainBlip_0 = v88.MainBlip;
    end);
    l_Events_0.ReturnBindableEvent(v88.MapChanged).Event:Connect(function() --[[ Line: 262 ]]
        -- upvalues: l_Map_0 (ref), v88 (copy)
        l_Map_0 = v88.Map;
    end);
    game["Run Service"].RenderStepped:Connect(function() --[[ Line: 266 ]]
        -- upvalues: l_MainPart_0 (ref), v106 (ref), l_TruePixelsPerStudX_0 (ref), l_TruePixelsPerStudY_0 (ref), l_MaximumMainBlipOffsetX_0 (ref), l_MaximumMainBlipOffsetY_0 (ref), l_clamp_0 (ref), l_MainBlip_0 (ref), l_new_0 (ref), l_Map_0 (ref), l_math_0 (ref), l_MaximumMapOffsetX_0 (ref), l_MaximumMapOffsetY_0 (ref), l_v90_1 (copy), l_MaximumBlipOffsetX_0 (ref), l_MaximumBlipOffsetY_0 (ref)
        local v120 = v106:PointToObjectSpace(l_MainPart_0.Position);
        local l_X_0 = v120.X;
        local l_Z_0 = v120.Z;
        v120 = l_TruePixelsPerStudX_0;
        local l_l_TruePixelsPerStudY_0_0 = l_TruePixelsPerStudY_0;
        local l_l_MaximumMainBlipOffsetX_0_0 = l_MaximumMainBlipOffsetX_0;
        local l_l_MaximumMainBlipOffsetY_0_0 = l_MaximumMainBlipOffsetY_0;
        local v126 = l_clamp_0(l_X_0 * v120, -l_l_MaximumMainBlipOffsetX_0_0, l_l_MaximumMainBlipOffsetX_0_0);
        local v127 = l_clamp_0(l_Z_0 * l_l_TruePixelsPerStudY_0_0, -l_l_MaximumMainBlipOffsetY_0_0, l_l_MaximumMainBlipOffsetY_0_0);
        l_MainBlip_0.Position = l_new_0(0.5, v126, 0.5, v127);
        l_Map_0.Position = l_new_0(0.5, l_clamp_0(-v126, -l_math_0.abs(l_MaximumMapOffsetX_0), l_math_0.abs(l_MaximumMapOffsetX_0)), 0.5, l_clamp_0(-v127, -l_math_0.abs(l_MaximumMapOffsetY_0), l_math_0.abs(l_MaximumMapOffsetY_0)));
        v120, l_l_TruePixelsPerStudY_0_0, l_l_MaximumMainBlipOffsetX_0_0 = workspace.CurrentCamera.CFrame:ToOrientation();
        l_MainBlip_0.Rotation = -l_math_0.deg(l_l_TruePixelsPerStudY_0_0);
        for v128, v129 in pairs(l_v90_1) do
            local v130 = v106:PointToObjectSpace(v128.Position);
            local l_X_1 = v130.X;
            local l_Z_1 = v130.Z;
            local l_l_TruePixelsPerStudX_0_0 = l_TruePixelsPerStudX_0;
            local l_l_TruePixelsPerStudY_0_1 = l_TruePixelsPerStudY_0;
            local v135 = l_X_1 * l_l_TruePixelsPerStudX_0_0;
            v130 = l_Z_1 * l_l_TruePixelsPerStudY_0_1;
            l_l_TruePixelsPerStudX_0_0 = l_MaximumBlipOffsetX_0;
            l_l_TruePixelsPerStudY_0_1 = l_MaximumBlipOffsetY_0;
            if v129.Name == "stormCenter" then
                l_l_TruePixelsPerStudX_0_0 = 100000000000;
                l_l_TruePixelsPerStudY_0_1 = 100000000000;
            end;
            v129.Position = l_new_0(0.5, l_clamp_0(v135 + l_Map_0.Position.X.Offset, -l_l_TruePixelsPerStudX_0_0, l_l_TruePixelsPerStudX_0_0), 0.5, l_clamp_0(v130 + l_Map_0.Position.Y.Offset, -l_l_TruePixelsPerStudY_0_1, l_l_TruePixelsPerStudY_0_1));
        end;
        for v136, v137 in pairs(l_v90_1) do
            if v137 ~= l_MainBlip_0 and v137.Name ~= "stormCenter" and v137.Name ~= "phoLabel" and v137.Name ~= "hotZone" and v137.Name ~= "campfire" and v137.Name ~= "areaLabel" and v137.Name ~= "customBlip" then
                v137.Rotation = -v136.Orientation.Y;
            end;
        end;
    end);
end;
v0.CreateMinimap = function(v138, v139, v140, v141, v142, v143, v144, v145, v146) --[[ Line: 297 ]] --[[ Name: CreateMinimap ]]
    -- upvalues: v4 (copy), v6 (copy)
    local v147 = setmetatable({}, {
        __index = v4
    });
    v147:Initialise(v138, v139, v140, v141, v142, v143, v144, v145);
    if v146 then
        v6[v146] = v147;
    end;
    return v147;
end;
v0.ReturnMap = function(v148) --[[ Line: 307 ]] --[[ Name: ReturnMap ]]
    -- upvalues: v6 (copy)
    if not v6[v148] then
        warn("Map not found, have you created a key for your map?");
        warn("Returning nil");
    end;
    return v6[v148];
end;
return v0;