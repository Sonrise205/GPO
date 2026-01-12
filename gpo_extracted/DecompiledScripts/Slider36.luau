local v0 = {
    Sliders = {}
};
assert(game:GetService("RunService"):IsClient(), "Slider module can only be used on the Client!");
local l_SoundService_0 = game:GetService("SoundService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_TweenService_0 = game:GetService("TweenService");
local l_clamp_0 = math.clamp;
local _ = math.floor;
local l_min_0 = math.min;
local l_max_0 = math.max;
local l_round_0 = math.round;
local l_abs_0 = math.abs;
local l_lower_0 = string.lower;
local l_upper_0 = string.upper;
local l_sub_0 = string.sub;
local l_format_0 = string.format;
local l_Utils_0 = script.Utils;
local v15 = require(l_Utils_0.Signal);
local v16 = require(l_Utils_0.Switch);
local v17 = require(l_Utils_0.VectorFuncs);
v0.__index = function(v18, v19) --[[ Line: 45 ]]
    -- upvalues: l_sub_0 (copy), l_format_0 (copy), v0 (copy)
    local v20 = {
        {
            ".OnChange", 
            ".Changed", 
            (rawget(v18, "Changed"))
        }
    };
    for _, v22 in ipairs(v20) do
        if l_sub_0(v22[1], 2) == v19 then
            warn(l_format_0("%s is deprecated, please use %s instead", v22[1], v22[2]));
            return v22[3];
        end;
    end;
    return v0[v19];
end;
snapToScale = function(v23, v24) --[[ Line: 62 ]] --[[ Name: snapToScale ]]
    -- upvalues: l_round_0 (copy), l_clamp_0 (copy)
    return (l_clamp_0(l_round_0(v23 / v24) * v24, 0, 1));
end;
lerp = function(v25, v26, v27) --[[ Line: 66 ]] --[[ Name: lerp ]]
    return (1 - v27) * v25 + v27 * v26;
end;
map = function(v28, v29, v30, v31, v32, v33) --[[ Line: 70 ]] --[[ Name: map ]]
    -- upvalues: l_min_0 (copy), l_max_0 (copy)
    local v34 = lerp(v31, v32, getAlphaBetween(v29, v30, v28));
    if not v33 then
        return v34;
    else
        if v31 < v32 then
            local l_v32_0 = v32;
            v32 = v31;
            v31 = l_v32_0;
        end;
        return (l_max_0(l_min_0(v34, v31), v32));
    end;
end;
getNewPosition = function(v36) --[[ Line: 83 ]] --[[ Name: getNewPosition ]]
    -- upvalues: v16 (copy)
    local v37 = v36._button.AbsoluteSize[v36._axis];
    local v38 = v36._holder.AbsoluteSize[v36._axis];
    local v39 = v36._button.AnchorPoint[v36._axis];
    local v40 = v36._padding / v38;
    local v41 = v37 / v38;
    local v42 = v40 + v39 * v41;
    local v43 = 1 - v40 - (1 - v39) * v41;
    local v44 = map(v36._percent, 0, 1, v42, v43, true);
    return v16(v36._axis)({
        X = UDim2.fromScale(v44, v36._button.Position.Y.Scale), 
        Y = UDim2.fromScale(v36._button.Position.X.Scale, v44)
    });
end;
getScaleIncrement = function(v45) --[[ Line: 104 ]] --[[ Name: getScaleIncrement ]]
    return 1 / ((v45._config.End - v45._config.Start) / v45._config.Increment);
end;
getAlphaBetween = function(v46, v47, v48) --[[ Line: 108 ]] --[[ Name: getAlphaBetween ]]
    return (v48 - v46) / (v47 - v46);
end;
getNewValue = function(v49) --[[ Line: 112 ]] --[[ Name: getNewValue ]]
    local v50 = lerp(v49._config.Start, v49._config.End, v49._percent);
    local v51 = 1 / v49._config.Increment;
    return math.round(v50 * v51) / v51;
end;
v0.new = function(v52, v53, v54, v55, v56) --[[ Line: 121 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy), l_lower_0 (copy), l_upper_0 (copy), v16 (copy), l_clamp_0 (copy), v15 (copy)
    assert(pcall(function() --[[ Line: 122 ]]
        -- upvalues: v52 (copy)
        return v52.AbsoluteSize, v52.AbsolutePosition;
    end), "Holder argument does not have an AbsoluteSize/AbsolutePosition");
    local l_Slider_0 = v52:FindFirstChild("Slider");
    assert(l_Slider_0 ~= nil, "Failed to find slider button.");
    assert(l_Slider_0:IsA("GuiButton"), "Slider is not a GuiButton");
    local v58 = false;
    for _, v60 in ipairs(v0.Sliders) do
        if v60._holder == v52 then
            v58 = true;
            break;
        end;
    end;
    assert(not v58, "Cannot set two sliders with same frame!");
    assert(v53.Increment ~= nil, "Failed to find Increment in configuration table");
    assert(v53.Start ~= nil, "Failed to find Start in configuration table");
    assert(v53.End ~= nil, "Failed to find End in configuration table");
    assert(v53.Increment > 0, "Increment must be greater than 0");
    assert(v53.End > v53.Start, "Config.End must be greater than Config.Start (" .. v53.End .. " <= " .. v53.Start .. ")");
    v55 = v55 or "x";
    v55 = l_lower_0(v55);
    local v61 = true;
    if v55 ~= "x" then
        v61 = v55 == "y";
    end;
    assert(v61, "Axis must be X or Y!");
    assert(typeof(v54) == "TweenInfo", "MoveTweenInfo must be a TweenInfo object!");
    v56 = v56 or 5;
    assert(typeof(v56) == "number", "Padding variable must be a number!");
    local v62 = setmetatable({}, v0);
    v62._holder = v52;
    v62._button = l_Slider_0;
    v62._config = v53;
    v62._axis = l_upper_0(v55);
    v62._padding = v56;
    v62.UI_TYPE = v52:FindFirstAncestorOfClass("ScreenGui") and "ScreenGui" or v52:FindFirstAncestorOfClass("SurfaceGui") and "SurfaceGui" or nil;
    v62._holderPart = v16(v62.UI_TYPE)({
        SurfaceGui = v52:FindFirstAncestorWhichIsA("BasePart"), 
        ScreenGui = nil
    });
    v62._surfaceUi = v16(v62.UI_TYPE)({
        SurfaceGui = v52:FindFirstAncestorWhichIsA("SurfaceGui"), 
        ScreenGui = nil
    });
    v62.IsHeld = false;
    v62._CLICKED_OVERRIDE = false;
    v62._mainConnection = nil;
    v62._miscConnections = {};
    v62._inputPos = nil;
    v62._percent = 0;
    if v53.DefaultValue then
        v53.DefaultValue = l_clamp_0(v53.DefaultValue, v53.Start, v53.End);
        v62._percent = getAlphaBetween(v53.Start, v53.End, v53.DefaultValue);
    end;
    v62._percent = l_clamp_0(v62._percent, 0, 1);
    v62._value = getNewValue(v62);
    v62._scaleIncrement = getScaleIncrement(v62);
    v62._currentTween = nil;
    v62._tweenInfo = v54 or TweenInfo.new(1);
    v62.Changed = v15.new();
    v62.Dragged = v15.new();
    v62.Released = v15.new();
    v62.OnClick = v15.new();
    v61 = Instance.new("TextButton");
    v61.BackgroundTransparency = 1;
    v61.Text = "";
    v61.Name = "HolderClickButton";
    v61.Size = UDim2.fromScale(1, 1);
    v61.ZIndex = -1;
    v61.Parent = v62._holder;
    v62._holderClickButton = v61;
    v62._initialized = false;
    v62:Move();
    v62._initialized = true;
    table.insert(v0.Sliders, v62);
    return v62;
end;
v0.Track = function(v63) --[[ Line: 219 ]] --[[ Name: Track ]]
    -- upvalues: l_UserInputService_0 (copy)
    for _, v65 in ipairs(v63._miscConnections) do
        v65:Disconnect();
    end;
    table.insert(v63._miscConnections, v63._button.MouseButton1Down:Connect(function() --[[ Line: 224 ]]
        -- upvalues: v63 (copy)
        v63.IsHeld = true;
    end));
    table.insert(v63._miscConnections, v63._button.MouseButton1Up:Connect(function() --[[ Line: 228 ]]
        -- upvalues: v63 (copy)
        if v63.IsHeld then
            v63.Released:Fire(v63._value);
        end;
        v63.IsHeld = false;
    end));
    table.insert(v63._miscConnections, v63._holderClickButton.MouseButton1Down:Connect(function() --[[ Line: 235 ]]
        -- upvalues: l_UserInputService_0 (ref), v63 (copy)
        local l_l_UserInputService_0_MouseLocation_0 = l_UserInputService_0:GetMouseLocation();
        v63._inputPos = Vector2.new(l_l_UserInputService_0_MouseLocation_0.X, l_l_UserInputService_0_MouseLocation_0.Y);
        v63.IsHeld = true;
        v63._CLICKED_OVERRIDE = true;
        v63:Update();
        v63._CLICKED_OVERRIDE = false;
        v63.OnClick:Fire(v63._value);
    end));
    if v63.Changed then
        v63.Changed:Fire(v63._value);
    end;
    if v63._mainConnection then
        v63._mainConnection:Disconnect();
    end;
    v63._mainConnection = l_UserInputService_0.InputChanged:Connect(function(v67, _) --[[ Line: 253 ]]
        -- upvalues: v63 (copy)
        if v67.UserInputType == Enum.UserInputType.MouseMovement or v67.UserInputType == Enum.UserInputType.Touch then
            v63._inputPos = v67.Position;
            v63:Update();
        end;
    end);
end;
v0.Update = function(v69) --[[ Line: 261 ]] --[[ Name: Update ]]
    -- upvalues: v16 (copy), v17 (copy), l_abs_0 (copy), l_clamp_0 (copy), l_SoundService_0 (copy)
    if (v69.IsHeld or v69._CLICKED_OVERRIDE) and v69._inputPos then
        local v79 = v16(v69.UI_TYPE)({
            ScreenGui = v69._inputPos[v69._axis], 
            SurfaceGui = function() --[[ Line: 266 ]]
                -- upvalues: v69 (copy), v17 (ref), l_abs_0 (ref)
                local v70 = RaycastParams.new();
                v70.FilterType = Enum.RaycastFilterType.Include;
                v70.FilterDescendantsInstances = {
                    v69._holderPart
                };
                local v71 = workspace.CurrentCamera:ScreenPointToRay(v69._inputPos.X, v69._inputPos.Y);
                local v72 = workspace:Raycast(v71.Origin, v71.Direction * 500, v70);
                if v72 then
                    local l_Instance_0 = v72.Instance;
                    local l_Position_0 = v72.Position;
                    local l_Normal_0 = v72.Normal;
                    if v17.normalVectorToFace(l_Instance_0, l_Normal_0) ~= v69._surfaceUi.Face then
                        return;
                    else
                        local v76 = CFrame.new(l_Position_0, l_Position_0 + l_Normal_0);
                        local v77 = v17.getTopLeftCorners(l_Instance_0)[v69._surfaceUi.Face]:ToObjectSpace(v76);
                        local v78 = v17.mapOffsetToFace(v77, v69._axis, v69._surfaceUi.Face);
                        return Vector2.new(l_abs_0(v78.X) * v69._surfaceUi.PixelsPerStud, l_abs_0(v78.Y) * v69._surfaceUi.PixelsPerStud)[v69._axis];
                    end;
                else
                    return;
                end;
            end
        });
        if v79 then
            local v80 = v69._holder.AbsoluteSize[v69._axis];
            local v81 = v69._holder.AbsolutePosition[v69._axis];
            local v82 = v69._button.AbsoluteSize[v69._axis];
            local v83 = v81 + v69._padding + v82 * v69._button.AnchorPoint[v69._axis];
            local v84 = v81 + v80 - v69._padding - v82 * (1 - v69._button.AnchorPoint[v69._axis]);
            local v85 = (l_clamp_0(v79, v83, v84) - v83) / (v84 - v83);
            local v86 = l_clamp_0(snapToScale(v85, v69._scaleIncrement), 0, 1);
            local l__value_0 = v69._value;
            v69._percent = v86;
            local v88 = getNewValue(v69);
            if v69._initialized and l__value_0 ~= v88 and script.ButtonClick then
                l_SoundService_0:PlayLocalSound(script.ButtonClick);
            end;
            v69.Dragged:Fire(v69._value);
            v69:Move();
        end;
    end;
end;
v0.Untrack = function(v89) --[[ Line: 331 ]] --[[ Name: Untrack ]]
    for _, v91 in ipairs(v89._miscConnections) do
        v91:Disconnect();
    end;
    if v89._mainConnection then
        v89._mainConnection:Disconnect();
    end;
    v89.IsHeld = false;
end;
v0.Reset = function(v92) --[[ Line: 341 ]] --[[ Name: Reset ]]
    -- upvalues: l_clamp_0 (copy)
    for _, v94 in ipairs(v92._miscConnections) do
        v94:Disconnect();
    end;
    if v92._mainConnection then
        v92._mainConnection:Disconnect();
    end;
    v92.IsHeld = false;
    v92._percent = 0;
    if v92._config.DefaultValue then
        v92._percent = getAlphaBetween(v92._config.Start, v92._config.End, v92._config.DefaultValue);
    end;
    v92._percent = l_clamp_0(v92._percent, 0, 1);
    v92:Move();
end;
v0.OverrideValue = function(v95, v96) --[[ Line: 359 ]] --[[ Name: OverrideValue ]]
    -- upvalues: l_clamp_0 (copy)
    v95.IsHeld = false;
    v95._percent = getAlphaBetween(v95._config.Start, v95._config.End, v96);
    v95._percent = l_clamp_0(v95._percent, 0, 1);
    v95._percent = snapToScale(v95._percent, v95._scaleIncrement);
    v95:Move();
end;
v0.Move = function(v97) --[[ Line: 367 ]] --[[ Name: Move ]]
    -- upvalues: l_TweenService_0 (copy)
    v97._value = getNewValue(v97);
    if v97._currentTween then
        v97._currentTween:Cancel();
    end;
    v97._currentTween = l_TweenService_0:Create(v97._button, v97._tweenInfo, {
        Position = getNewPosition(v97)
    });
    v97._currentTween:Play();
    v97.Changed:Fire(v97._value);
end;
v0.OverrideIncrement = function(v98, v99) --[[ Line: 380 ]] --[[ Name: OverrideIncrement ]]
    -- upvalues: l_clamp_0 (copy)
    v98._config.Increment = v99;
    v98._scaleIncrement = getScaleIncrement(v98);
    v98._percent = l_clamp_0(v98._percent, 0, 1);
    v98._percent = snapToScale(v98._percent, v98._scaleIncrement);
    v98:Move();
end;
v0.GetValue = function(v100) --[[ Line: 388 ]] --[[ Name: GetValue ]]
    return v100._value;
end;
v0.GetIncrement = function(v101) --[[ Line: 392 ]] --[[ Name: GetIncrement ]]
    return v101._increment;
end;
v0.Destroy = function(v102) --[[ Line: 396 ]] --[[ Name: Destroy ]]
    -- upvalues: v0 (copy)
    for _, v104 in ipairs(v102._miscConnections) do
        v104:Disconnect();
    end;
    if v102._mainConnection then
        v102._mainConnection:Disconnect();
    end;
    v102.Changed:Destroy();
    v102.Dragged:Destroy();
    v102.Released:Destroy();
    for v105 = 1, #v0.Sliders do
        if v0.Sliders[v105] == v102 then
            table.remove(v0.Sliders, v105);
        end;
    end;
    setmetatable(v102, nil);
    v102 = nil;
end;
l_UserInputService_0.InputEnded:Connect(function(v106, _) --[[ Line: 419 ]]
    -- upvalues: v0 (copy)
    if v106.UserInputType == Enum.UserInputType.MouseButton1 or v106.UserInputType == Enum.UserInputType.Touch then
        for _, v109 in ipairs(v0.Sliders) do
            if v109.IsHeld then
                v109.Released:Fire(v109._value);
            end;
            v109.IsHeld = false;
        end;
    end;
end);
return v0;