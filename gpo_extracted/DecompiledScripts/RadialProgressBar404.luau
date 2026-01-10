local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_WithTheme_0 = require(l_Parent_0.Theme).WithTheme;
local l_Validators_0 = l_Parent_0.Validators;
local v4 = require(l_Validators_0.StyleValidator);
local _ = require(l_Parent_1.Sift);
local v6 = require(l_Parent_1.t);
local v7 = require(l_Parent_1.Roact);
local l_createElement_0 = v7.createElement;
local v9 = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 0), 
    NumberSequenceKeypoint.new(0.5, 0), 
    NumberSequenceKeypoint.new(0.505, 1), 
    NumberSequenceKeypoint.new(1, 1)
});
local v10 = v7.PureComponent:extend(script.Name);
v10.defaultProps = {
    StrokeColor = "colors/UNKNOWN", 
    Value = 1, 
    Size = UDim2.fromOffset(100, 100), 
    Thickness = 30, 
    Clockwise = true
};
v10.validateProps = v6.strictInterface({
    AnchorPoint = v6.optional(v6.Vector2), 
    StrokeColor = v6.optional(v4), 
    Clockwise = v6.optional(v6.boolean), 
    Position = v6.optional(v6.UDim2), 
    Size = v6.optional(v6.UDim2), 
    Thickness = v6.optional(v6.number), 
    Value = v6.optional(v6.numberConstrained(0, 1)), 
    Native = v6.optional(v6.table)
});
v10.init = function(v11) --[[ Line: 62 ]] --[[ Name: init ]]
    v11:setState({
        Size = UDim2.new()
    });
end;
v10.render = function(v12) --[[ Line: 70 ]] --[[ Name: render ]]
    -- upvalues: l_WithTheme_0 (copy), l_createElement_0 (copy), v9 (copy), v7 (copy)
    local l_props_0 = v12.props;
    local l_state_0 = v12.state;
    return l_WithTheme_0(function(v15) --[[ Line: 74 ]]
        -- upvalues: l_props_0 (copy), l_createElement_0 (ref), v9 (ref), l_state_0 (copy), v7 (ref), v12 (copy)
        local v16 = nil;
        local l_Value_0 = l_props_0.Value;
        local v18 = nil;
        local v19 = nil;
        if l_props_0.Clockwise then
            v16 = l_Value_0 < 0.5 and "Right" or l_Value_0 >= 0.5 and "Left";
            local v20 = true;
            if v16 ~= "Left" then
                v20 = true;
                if l_Value_0 < 0.5 then
                    v20 = nil;
                end;
            end;
            v18 = v20;
            v20 = true;
            if v16 ~= "Right" then
                v20 = true;
                if l_Value_0 < 0.5 then
                    v20 = nil;
                end;
            end;
            v19 = v20;
        else
            l_Value_0 = 0.5 - l_Value_0;
            v16 = l_Value_0 < 0.5 and "Left" or l_Value_0 >= 0.5 and "Right";
            local v21 = true;
            if v16 ~= "Left" then
                v21 = true;
                if l_Value_0 < 0.5 then
                    v21 = true;
                end;
            end;
            v18 = v21;
            v21 = true;
            if v16 ~= "Right" then
                v21 = true;
                if l_Value_0 < 0.5 then
                    v21 = true;
                end;
            end;
            v19 = v21;
        end;
        local v22 = v16 == "Left" and l_createElement_0("UIGradient", {
            Transparency = v9, 
            Rotation = l_Value_0 * 360
        }) or nil;
        local v23 = v16 == "Right" and l_createElement_0("UIGradient", {
            Transparency = v9, 
            Rotation = l_Value_0 * 360
        }) or nil;
        local v24 = v15[l_props_0.StrokeColor];
        local v25 = -UDim2.fromOffset(l_props_0.Thickness * 2, l_props_0.Thickness * 2);
        local v26 = UDim2.new(l_props_0.Size.X.Scale / 2, l_props_0.Size.X.Offset / 2, l_props_0.Size.Y.Scale, l_props_0.Size.Y.Offset);
        local v27 = l_createElement_0("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(1, 0.5), 
            BackgroundTransparency = 1, 
            Size = l_state_0.Size + v25
        }, {
            Stroke = l_createElement_0("UIStroke", {
                Thickness = l_props_0.Thickness, 
                Color = v24.Color, 
                Transparency = v24.Transparency
            }, {
                Gradient = v22
            }), 
            Corner = l_createElement_0("UICorner", {
                CornerRadius = UDim.new(1, 0)
            })
        });
        local v28 = l_createElement_0("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0, 0.5), 
            BackgroundTransparency = 1, 
            Size = l_state_0.Size + v25
        }, {
            Stroke = l_createElement_0("UIStroke", {
                Thickness = l_props_0.Thickness, 
                Color = v24.Color, 
                Transparency = v24.Transparency
            }, {
                Gradient = v23
            }), 
            Corner = l_createElement_0("UICorner", {
                CornerRadius = UDim.new(1, 0)
            })
        });
        local v29 = v18 and l_createElement_0("CanvasGroup", {
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(1, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = v26
        }, {
            StrokeWrapper = v27
        });
        local v30 = v19 and l_createElement_0("CanvasGroup", {
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = v26
        }, {
            StrokeWrapper = v28
        });
        return l_createElement_0("Frame", {
            Anchorpoint = l_props_0.AnchorPoint, 
            BackgroundTransparency = 1, 
            Positon = l_props_0.Position, 
            Size = l_props_0.Size, 
            [v7.Change.AbsoluteSize] = function(v31) --[[ Line: 184 ]]
                -- upvalues: v12 (ref)
                local l_AbsoluteSize_0 = v31.AbsoluteSize;
                v12:setState({
                    Size = UDim2.fromOffset(l_AbsoluteSize_0.X, l_AbsoluteSize_0.Y)
                });
            end
        }, {
            LeftSemiCircle = v29, 
            RightSemiCircle = v30
        });
    end);
end;
return v10;