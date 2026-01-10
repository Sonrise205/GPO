local v0 = {
    Sliders = {}
};
if not game:GetService("RunService"):IsClient() then
    error("Slider module can only be used on the Client!", 2);
    return nil;
else
    local l_UserInputService_0 = game:GetService("UserInputService");
    local l_TweenService_0 = game:GetService("TweenService");
    local l_clamp_0 = math.clamp;
    local l_floor_0 = math.floor;
    local l_min_0 = math.min;
    local l_max_0 = math.max;
    local _ = math.round;
    local l_lower_0 = string.lower;
    local l_upper_0 = string.upper;
    local l_sub_0 = string.sub;
    local l_format_0 = string.format;
    local v12 = require(script.Parent.Signal);
    v0.__index = function(v13, v14) --[[ Line: 42 ]]
        -- upvalues: l_sub_0 (copy), l_format_0 (copy), v0 (copy)
        local v15 = {
            {
                ".OnChange", 
                ".Changed", 
                v13.Changed
            }
        };
        for _, v17 in ipairs(v15) do
            if l_sub_0(v17[1], 2) == v14 then
                warn(l_format_0("%s is deprecated, please use %s instead", v17[1], v17[2]));
                return v17[3];
            end;
        end;
        return v0[v14];
    end;
    snapToScale = function(v18, v19) --[[ Line: 61 ]] --[[ Name: snapToScale ]]
        -- upvalues: l_floor_0 (copy), l_clamp_0 (copy)
        return (l_clamp_0(l_floor_0(v18 / v19) * v19, 0, 1));
    end;
    lerp = function(v20, v21, v22) --[[ Line: 65 ]] --[[ Name: lerp ]]
        return (1 - v22) * v20 + v22 * v21;
    end;
    map = function(v23, v24, v25, v26, v27, v28) --[[ Line: 69 ]] --[[ Name: map ]]
        -- upvalues: l_min_0 (copy), l_max_0 (copy)
        local v29 = lerp(v26, v27, getAlphaBetween(v24, v25, v23));
        if not v28 then
            return v29;
        else
            if v26 < v27 then
                local l_v27_0 = v27;
                v27 = v26;
                v26 = l_v27_0;
            end;
            return (l_max_0(l_min_0(v29, v26), v27));
        end;
    end;
    getNewPosition = function(v31, v32) --[[ Line: 82 ]] --[[ Name: getNewPosition ]]
        local v33 = v31._button.AbsoluteSize[v31._axis];
        local v34 = v31._holder.AbsoluteSize[v31._axis];
        local v35 = v31._button.AnchorPoint[v31._axis];
        local v36 = v31._padding / v34;
        local v37 = v35 * v33 / v34 + v36;
        local v38 = 2 * v33 * v35 - v33;
        local v39 = 1 - v37 + v38 / v34;
        local v40 = map(v32 or v31._percent, 0, 1, v37, v39, true);
        if v31._axis == "X" then
            return UDim2.new(v40, v31._button.Position.X.Offset, v31._button.Position.Y.Scale, v31._button.Position.Y.Offset);
        elseif v31._axis == "Y" then
            return UDim2.fromScale(v31._button.Position.X.Scale, v40);
        else
            return;
        end;
    end;
    getScaleIncrement = function(v41) --[[ Line: 107 ]] --[[ Name: getScaleIncrement ]]
        return 1 / ((v41._config.End - v41._config.Start) / v41._config.Increment);
    end;
    getAlphaBetween = function(v42, v43, v44) --[[ Line: 111 ]] --[[ Name: getAlphaBetween ]]
        return (v44 - v42) / (v43 - v42);
    end;
    getNewValue = function(v45) --[[ Line: 115 ]] --[[ Name: getNewValue ]]
        -- upvalues: l_floor_0 (copy)
        local v46 = lerp(v45._config.Start, v45._config.End, v45._percent);
        local v47 = 1 / v45._config.Increment;
        return l_floor_0(v46 * v47) / v47;
    end;
    v0.new = function(v48, v49, v50, v51, v52) --[[ Line: 123 ]] --[[ Name: new ]]
        -- upvalues: v0 (copy), l_lower_0 (copy), l_upper_0 (copy), l_clamp_0 (copy), v12 (copy)
        assert(pcall(function() --[[ Line: 124 ]]
            -- upvalues: v48 (copy)
            return v48.AbsoluteSize, v48.AbsolutePosition;
        end), "Holder argument does not have an AbsoluteSize/AbsolutePosition");
        local l_Slider_0 = v48:FindFirstChild("Slider");
        assert(l_Slider_0 ~= nil, "Failed to find slider button.");
        assert(l_Slider_0:IsA("GuiButton"), "Slider is not a GuiButton");
        local v54 = false;
        for _, v56 in ipairs(v0.Sliders) do
            if v56._holder == v48 then
                v54 = true;
                break;
            end;
        end;
        assert(not v54, "Cannot set two sliders with same frame!");
        assert(v49.Increment ~= nil, "Failed to find Increment in configuration table");
        assert(v49.Start ~= nil, "Failed to find Start in configuration table");
        assert(v49.End ~= nil, "Failed to find End in configuration table");
        assert(v49.Increment > 0, "Increment must be greater than 0");
        assert(v49.End > v49.Start, (("Config.End must be greater than Config.Start (%* <= %*)"):format(v49.End, v49.Start)));
        v51 = v51 or "x";
        v51 = l_lower_0(v51);
        local v57 = true;
        if v51 ~= "x" then
            v57 = v51 == "y";
        end;
        assert(v57, "Axis must be X or Y!");
        assert(typeof(v50) == "TweenInfo", "MoveTweenInfo must be a TweenInfo object!");
        v52 = v52 or 5;
        assert(type(v52) == "number", "Padding variable must be a number!");
        local v58 = setmetatable({}, v0);
        v58._holder = v48;
        v58._button = l_Slider_0;
        v58._config = v49;
        v58._axis = l_upper_0(v51);
        v58._padding = v52;
        v58.IsHeld = false;
        v58._mainConnection = nil;
        v58._buttonConnections = {};
        v58._inputPos = nil;
        v58._percent = 0;
        if v49.DefaultValue then
            v49.DefaultValue = l_clamp_0(v49.DefaultValue, v49.Start, v49.End);
            v58._percent = getAlphaBetween(v49.Start, v49.End, v49.DefaultValue);
        end;
        v58._percent = l_clamp_0(v58._percent, 0, 1);
        v58._value = getNewValue(v58);
        v58._scaleIncrement = getScaleIncrement(v58);
        v58._currentTween = nil;
        v58._tweenInfo = v50 or TweenInfo.new(1);
        v58.Changed = v12.new();
        v58.Dragged = v12.new();
        v58.Released = v12.new();
        v58:Move();
        table.insert(v0.Sliders, v58);
        return v58;
    end;
    v0.Track = function(v59) --[[ Line: 192 ]] --[[ Name: Track ]]
        -- upvalues: l_UserInputService_0 (copy)
        for _, v61 in ipairs(v59._buttonConnections) do
            v61:Disconnect();
        end;
        table.insert(v59._buttonConnections, v59._button.MouseButton1Down:Connect(function() --[[ Line: 197 ]]
            -- upvalues: v59 (copy)
            v59.IsHeld = true;
        end));
        table.insert(v59._buttonConnections, v59._button.MouseButton1Up:Connect(function() --[[ Line: 201 ]]
            -- upvalues: v59 (copy)
            if v59.IsHeld then
                v59.Released:Fire(v59._value);
            end;
            v59.IsHeld = false;
        end));
        if v59.Changed then
            v59.Changed:Fire(v59._value);
        end;
        if v59._mainConnection then
            v59._mainConnection:Disconnect();
        end;
        v59._mainConnection = l_UserInputService_0.InputChanged:Connect(function(v62, _) --[[ Line: 216 ]]
            -- upvalues: v59 (copy)
            if v62.UserInputType == Enum.UserInputType.MouseMovement or v62.UserInputType == Enum.UserInputType.Touch then
                v59._inputPos = v62.Position;
                v59:Update();
            end;
        end);
    end;
    v0.Update = function(v64) --[[ Line: 224 ]] --[[ Name: Update ]]
        -- upvalues: l_clamp_0 (copy)
        if v64.IsHeld and v64._inputPos then
            local v65 = v64._inputPos[v64._axis];
            local v66 = v64._holder.AbsoluteSize[v64._axis];
            local v67 = v64._holder.AbsolutePosition[v64._axis];
            v64._percent = l_clamp_0(snapToScale((v65 - v67) / v66, v64._scaleIncrement), 0, 1);
            v64:Move();
            v64.Dragged:Fire(v64._value);
        end;
    end;
    v0.Untrack = function(v68) --[[ Line: 239 ]] --[[ Name: Untrack ]]
        for _, v70 in ipairs(v68._buttonConnections) do
            v70:Disconnect();
        end;
        if v68._mainConnection then
            v68._mainConnection:Disconnect();
        end;
        v68.IsHeld = false;
    end;
    v0.Reset = function(v71) --[[ Line: 249 ]] --[[ Name: Reset ]]
        -- upvalues: l_clamp_0 (copy)
        for _, v73 in ipairs(v71._buttonConnections) do
            v73:Disconnect();
        end;
        if v71._mainConnection then
            v71._mainConnection:Disconnect();
        end;
        v71.IsHeld = false;
        v71._percent = 0;
        if v71._config.DefaultValue then
            v71._percent = getAlphaBetween(v71._config.Start, v71._config.End, v71._config.DefaultValue);
        end;
        v71._percent = l_clamp_0(v71._percent, 0, 1);
        v71:Move();
    end;
    v0.OverrideValue = function(v74, v75) --[[ Line: 267 ]] --[[ Name: OverrideValue ]]
        -- upvalues: l_clamp_0 (copy)
        v74.IsHeld = false;
        v74._percent = getAlphaBetween(v74._config.Start, v74._config.End, v75);
        v74._percent = l_clamp_0(v74._percent, 0, 1);
        v74._percent = snapToScale(v74._percent, v74._scaleIncrement);
        v74:Move();
    end;
    v0.Move = function(v76) --[[ Line: 275 ]] --[[ Name: Move ]]
        -- upvalues: l_TweenService_0 (copy)
        v76._value = getNewValue(v76);
        if v76._currentTween then
            v76._currentTween:Cancel();
        end;
        v76._currentTween = l_TweenService_0:Create(v76._button, v76._tweenInfo, {
            Position = getNewPosition(v76)
        });
        v76._currentTween:Play();
        v76.Changed:Fire(v76._value);
    end;
    v0.OverrideVisualValue = function(v77, v78) --[[ Line: 289 ]] --[[ Name: OverrideVisualValue ]]
        -- upvalues: l_clamp_0 (copy), l_TweenService_0 (copy)
        if v77.IsHeld then
            return false;
        else
            local v79 = l_clamp_0(getAlphaBetween(v77._config.Start, v77._config.End, v78), 0, 1);
            v79 = snapToScale(v79, v77._scaleIncrement);
            if v77._currentTween then
                v77._currentTween:Cancel();
            end;
            v77._currentTween = l_TweenService_0:Create(v77._button, v77._tweenInfo, {
                Position = getNewPosition(v77, v79)
            });
            v77._currentTween:Play();
            return;
        end;
    end;
    v0.OverrideIncrement = function(v80, v81) --[[ Line: 308 ]] --[[ Name: OverrideIncrement ]]
        -- upvalues: l_clamp_0 (copy)
        v80._config.Increment = v81;
        v80._scaleIncrement = getScaleIncrement(v80);
        v80._percent = l_clamp_0(v80._percent, 0, 1);
        v80._percent = snapToScale(v80._percent, v80._scaleIncrement);
        v80:Move();
    end;
    v0.GetValue = function(v82) --[[ Line: 316 ]] --[[ Name: GetValue ]]
        return v82._value;
    end;
    v0.GetIncrement = function(v83) --[[ Line: 320 ]] --[[ Name: GetIncrement ]]
        return v83._increment;
    end;
    v0.Destroy = function(v84) --[[ Line: 324 ]] --[[ Name: Destroy ]]
        -- upvalues: v0 (copy)
        for _, v86 in ipairs(v84._buttonConnections) do
            v86:Disconnect();
        end;
        if v84._mainConnection then
            v84._mainConnection:Disconnect();
        end;
        v84.Changed:Destroy();
        v84.Dragged:Destroy();
        v84.Released:Destroy();
        for v87 = 1, #v0.Sliders do
            if v0.Sliders[v87] == v84 then
                table.remove(v0.Sliders, v87);
            end;
        end;
        setmetatable(v84, nil);
        v84 = nil;
    end;
    l_UserInputService_0.InputEnded:Connect(function(v88, _) --[[ Line: 345 ]]
        -- upvalues: v0 (copy)
        if v88.UserInputType == Enum.UserInputType.MouseButton1 or v88.UserInputType == Enum.UserInputType.Touch then
            for _, v91 in ipairs(v0.Sliders) do
                if v91.IsHeld then
                    v91.Released:Fire(v91._value);
                end;
                v91.IsHeld = false;
            end;
        end;
    end);
    return v0;
end;