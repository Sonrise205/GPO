local l_RunService_0 = game:GetService("RunService");
local v1 = require(script.ParallaxWindows);
local v2 = {};
v2.__index = v2;
v2.new = function(v3) --[[ Line: 13 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    local v4 = setmetatable({}, v2);
    v4.Part = v3.Part;
    v4.Color = v3.Color;
    v4.Icon = v3.Icon;
    v4.Window = v4:_createWindow();
    v4:_main();
    return v4;
end;
v2._createWindow = function(v5) --[[ Line: 27 ]] --[[ Name: _createWindow ]]
    -- upvalues: v1 (copy)
    local v6 = v1.new();
    v6:UpdateSettings({
        MaxFramerate = -1, 
        ZOffset = 0, 
        AlwaysOnTop = false, 
        Brightness = 1, 
        LightInfluence = 0, 
        MaxDistance = 1000, 
        PixelsPerStud = 100, 
        SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud
    }, {
        UpdateRange = 1000, 
        ZIndex = 0, 
        Image = "rbxassetid://73886715549936", 
        ImageTransparency = 0.5, 
        BackgroundTransparency = 1, 
        ImageColor3 = Color3.fromRGB(255, 255, 255), 
        BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
        ResampleMode = Enum.ResamplerMode.Default, 
        ScaleType = Enum.ScaleType.Fit, 
        ImageSize = Vector3.new(v5.Part.Size.X * 10, v5.Part.Size.Y * 2, 0), 
        PosOffset = Vector3.new(0, 0, 0, 0)
    });
    return v6;
end;
v2._main = function(v7) --[[ Line: 60 ]] --[[ Name: _main ]]
    -- upvalues: l_RunService_0 (copy)
    for v8 = 1, 20 do
        local v9 = v8 / 20;
        local v10 = v7.Window:AddFrame(v7.Part, Enum.NormalId.Front);
        local v11 = Vector3.new(-v8 * 2, 0, 0);
        local v12 = v7.Color.Keypoints[1].Value:Lerp(v7.Color.Keypoints[2].Value, v9);
        v7.Window:UpdateFrameSettings(v10, {
            PosOffset = v11, 
            ZIndex = v8, 
            ImageTransparency = 0, 
            ImageColor3 = v12, 
            Image = "rbxassetid://119704968945044"
        });
    end;
    local v13 = v7.Window:AddFrame(v7.Part, Enum.NormalId.Front);
    v7.Window:UpdateFrameSettings(v13, {
        PosOffset = Vector3.new(-100, 0, 0, 0), 
        ImageSize = Vector3.new(40, 40, 0, 0), 
        ZIndex = 1000, 
        ImageTransparency = 0, 
        Image = v7.Icon
    });
    v7.Heartbeat = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 93 ]]
        -- upvalues: v7 (copy)
        v7.Window:Step();
    end);
end;
v2.Destroy = function(v14) --[[ Line: 98 ]] --[[ Name: Destroy ]]
    v14.Window:Clear();
    if v14.Heartbeat then
        v14.Heartbeat:Disconnect();
        v14.Heartbeat = nil;
    end;
    setmetatable(v14, nil);
end;
return v2;