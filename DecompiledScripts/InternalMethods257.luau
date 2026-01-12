local v0 = {};
local l_Events_0 = require(script.Parent:WaitForChild("Events"));
local l_Configuration_0 = script.Parent:WaitForChild("Configuration");
local v3 = {};
v0.Initialise = function(v4, v5, v6, v7, v8, v9, v10, v11, v12) --[[ Line: 6 ]] --[[ Name: Initialise ]]
    -- upvalues: l_Events_0 (copy), l_Configuration_0 (copy)
    if not v5 then
        v5 = UDim2.fromOffset(200, 200);
    end;
    if not v6 then
        v6 = UDim2.new(0, 5, 1, -5);
    end;
    if not v7 then
        v7 = Vector2.new(0.5, 0.5);
    end;
    if not v8 then
        warn("MapCenterPoint not passed through, setting MapCenterPoint to 0, 0");
        v8 = Vector2.new(0, 0);
    end;
    if not v10 then
        warn("OriginalSize not passed through, Map.AbsoluteSize will be used instead");
    end;
    if not v9 then
        warn("PixelsPerStud not passed through, setting PixelsPerStud to 0.5");
        v9 = 0.5;
    end;
    if not v11 then
        v11 = false;
    end;
    v5 = UDim2.new(0.5, 150, 0.5, 150);
    v6 = UDim2.new(0.5, 0, 0.5, 0);
    local l_ScreenGui_0 = Instance.new("ScreenGui");
    local l_Frame_0 = Instance.new("Frame");
    l_ScreenGui_0.ResetOnSpawn = false;
    l_ScreenGui_0.ZIndexBehavior = Enum.ZIndexBehavior.Global;
    l_ScreenGui_0.IgnoreGuiInset = true;
    l_Frame_0.Size = v5;
    l_Frame_0.Position = v6;
    l_Frame_0.AnchorPoint = v7;
    l_Frame_0.ClipsDescendants = true;
    l_Frame_0.BackgroundTransparency = 1;
    l_Frame_0.SizeConstraint = Enum.SizeConstraint.RelativeYY;
    if v12 then
        for v15, v16 in pairs(v12) do
            l_Frame_0[tostring(v15)] = v16;
        end;
    end;
    l_ScreenGui_0.Enabled = v11;
    l_ScreenGui_0.Name = "Map";
    l_ScreenGui_0.Parent = game.Players.LocalPlayer.PlayerGui;
    l_Frame_0.Parent = l_ScreenGui_0;
    v4.MapCenterPoint = v8;
    v4.OriginalSizeX = v10[1] or false;
    v4.OriginalSizeY = v10[2] or false;
    if type(v9) == "table" then
        v4.PixelsPerStudX = v9[1];
        v4.PixelsPerStudY = v9[2];
    else
        v4.PixelsPerStudX = v9;
        v4.PixelsPerStudY = v9;
    end;
    v4.ScreenGui = l_ScreenGui_0;
    v4.Frame = l_Frame_0;
    v4.CurrentFrame = l_Frame_0;
    v4.Blips = {};
    v4.ActiveBlips = {};
    v4.ActiveOrientationBlips = {};
    v4.MainPartChanged = newproxy(false);
    v4.MainBlipChanged = newproxy(false);
    v4.CameraFrameChanged = newproxy(false);
    v4.RatiosChanged = newproxy(false);
    v4.MapChanged = newproxy(false);
    v4.CenterPointChanged = newproxy(false);
    l_Events_0.CreateBindableEvent(v4.ActiveBlips);
    l_Events_0.CreateBindableEvent(v4.ActiveOrientationBlips);
    l_Events_0.CreateBindableEvent(v4.MapChanged);
    l_Events_0.CreateBindableEvent(v4.CenterPointChanged);
    if l_Configuration_0.DontClipBlips.Value then
        local l_Frame_1 = Instance.new("Frame");
        l_Frame_1.Size = v5;
        l_Frame_1.SizeConstraint = l_Frame_0.SizeConstraint;
        l_Frame_1.Position = v6;
        l_Frame_1.AnchorPoint = v7;
        l_Frame_1.ClipsDescendants = true;
        l_Frame_1.BackgroundTransparency = 1;
        l_Frame_1.Parent = l_ScreenGui_0;
        l_Frame_1.Name = "Overlay";
        script.UIStroke:Clone().Parent = l_Frame_1;
        v4.CurrentFrame = l_Frame_1;
    end;
    local v18 = Instance.new("Folder", v4.CurrentFrame);
    v18.Name = "Blips";
    v4.BlipsFolder = v18;
end;
v0.CreateMap = function(_, v20, v21) --[[ Line: 108 ]] --[[ Name: CreateMap ]]
    if type(v20) == "string" then
        local l_ImageLabel_0 = Instance.new("ImageLabel");
        l_ImageLabel_0.Image = v20;
        l_ImageLabel_0.ResampleMode = Enum.ResamplerMode.Default;
        if not v21 then
            warn("Map Size not passed through, setting map size to 1024x1024");
            v21 = UDim2.new(0, 1024, 0, 1024);
        end;
        l_ImageLabel_0.Size = v21;
        v20 = l_ImageLabel_0;
    end;
    v20.AnchorPoint = Vector2.new(0.5, 0.5);
    v20.Position = UDim2.new(0.5, 0, 0.5, 0);
    return v20;
end;
v0.CalculateRatios = function(v23, v24) --[[ Line: 126 ]] --[[ Name: CalculateRatios ]]
    local l_X_0 = v24.AbsoluteSize.X;
    local l_Y_0 = v24.AbsoluteSize.Y;
    local v27 = v23.OriginalSizeX or l_X_0;
    local v28 = v23.OriginalSizeY or l_Y_0;
    local v29 = l_X_0 / v27;
    local v30 = l_Y_0 / v28;
    local v31 = v23.PixelsPerStudX * v29;
    local v32 = v23.PixelsPerStudY * v30;
    v23.TruePixelsPerStudX = v31;
    v23.TruePixelsPerStudY = v32;
    v23.MaximumMapOffsetX = v24.AbsoluteSize.X / 2 - v23.Frame.AbsoluteSize.X / 2;
    v23.MaximumMapOffsetY = v24.AbsoluteSize.Y / 2 - v23.Frame.AbsoluteSize.Y / 2;
    v23.MaximumMainBlipOffsetX = v24.AbsoluteSize.X / 2;
    v23.MaximumMainBlipOffsetY = v24.AbsoluteSize.Y / 2;
    v23.MaximumBlipOffsetX = v23.Frame.AbsoluteSize.X / 2;
    v23.MaximumBlipOffsetY = v23.Frame.AbsoluteSize.Y / 2;
    v23.MaximumOffsetX = l_X_0 / 2;
    v23.MaximumOffsetY = l_Y_0 / 2;
end;
v0.CreateMapConnections = function(v33, v34) --[[ Line: 147 ]] --[[ Name: CreateMapConnections ]]
    -- upvalues: l_Events_0 (copy), v3 (copy)
    if not l_Events_0.ReturnBindableEvent(v33.RatiosChanged) then
        l_Events_0.CreateBindableEvent(v33.RatiosChanged);
    end;
    v3[v34] = v34:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 151 ]]
        -- upvalues: v33 (copy), v34 (copy), l_Events_0 (ref)
        v33:CalculateRatios(v34);
        l_Events_0.ReturnBindableEvent(v33.RatiosChanged):Fire();
    end);
    v3[v33.Frame] = v33.Frame:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 155 ]]
        -- upvalues: v33 (copy), l_Events_0 (ref)
        v33:CalculateRatios(v33.Map);
        l_Events_0.ReturnBindableEvent(v33.RatiosChanged):Fire();
    end);
end;
v0.RemoveMapConnection = function(v35, v36) --[[ Line: 161 ]] --[[ Name: RemoveMapConnection ]]
    -- upvalues: v3 (copy)
    v3[v36]:Disconnect();
    v3[v35.Frame]:Disconnect();
    v3[v36] = nil;
    v3[v35.Frame] = nil;
end;
v0.AddBlip = function(v37, v38, v39, v40, v41) --[[ Line: 168 ]] --[[ Name: AddBlip ]]
    v38.Parent = v37.BlipsFolder;
    v38.AnchorPoint = Vector2.new(0.5, 0.5);
    v37.Blips[v39] = {
        Blip = v38, 
        Orientation = v40
    };
    if v41 then
        v37:EnableBlip(v39, v38);
        return v38;
    else
        v38.Visible = false;
        return v38;
    end;
end;
v0.AddNewMap = function(v42, v43, v44, v45, v46) --[[ Line: 180 ]] --[[ Name: AddNewMap ]]
    -- upvalues: v3 (copy), l_Events_0 (copy)
    v43.AnchorPoint = Vector2.new(0.5, 0.5);
    v42.MapCenterPoint = v44;
    if type(v45) == "table" then
        v42.PixelsPerStudX = v45[1];
        v42.PixelsPerStudY = v45[2];
    else
        v42.PixelsPerStudX = v45;
        v42.PixelsPerStudY = v45;
    end;
    v42.OriginalSizeX = v46[1] or false;
    v42.OriginalSizeY = v46[2] or false;
    v42:CalculateRatios(v43);
    v3[v42.Map]:Disconnect();
    v3[v42.Map] = nil;
    v3[v43] = v43:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 195 ]]
        -- upvalues: v42 (copy), v43 (copy), l_Events_0 (ref)
        v42:CalculateRatios(v43);
        l_Events_0.ReturnBindableEvent(v42.RatiosChanged):Fire();
    end);
    v42.MainBlip.Parent = v43;
    v42.Map:Destroy();
    v43.Parent = v42.Frame;
    v42.Map = v43;
    l_Events_0.ReturnBindableEvent(v42.MapChanged):Fire();
    l_Events_0.ReturnBindableEvent(v42.RatiosChanged):Fire();
    l_Events_0.ReturnBindableEvent(v42.CenterPointChanged):Fire();
end;
return v0;