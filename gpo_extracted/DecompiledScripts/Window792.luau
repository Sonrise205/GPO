local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_WithTheme_0 = require(l_Parent_0.Theme).WithTheme;
local l_Validators_0 = l_Parent_0.Validators;
local v4 = require(l_Validators_0.StyleValidator);
local v5 = require(l_Parent_1.Sift);
local v6 = require(l_Parent_1.t);
local v7 = require(l_Parent_1.Roact);
local l_createElement_0 = v7.createElement;
local l_UserInputService_0 = game:GetService("UserInputService");
local v10 = require(l_Parent_0.App.Effect.DropShadow);
local v11 = require(l_Parent_0.App.Surface.RoundedSurface);
local l_Parent_2 = script.Parent;
local v13 = require(l_Parent_2.TitleBar.TitleBar);
local v14 = v7.PureComponent:extend(script.Name);
v14.defaultProps = {
    AnchorPoint = Vector2.new(0.5, 0.5), 
    BackgroundColor = "colors/Background/Fill_Color/Solid_Background/Base", 
    ContentBackgroundColor = {
        Color = Color3.new(), 
        Transparency = 1
    }, 
    DropShadowEnabled = true, 
    Draggable = true, 
    FooterHeight = 0, 
    Position = UDim2.fromScale(0.5, 0.5), 
    Size = UDim2.fromOffset(300, 300), 
    TitleBarProps = {}
};
v14.validateProps = v6.strictInterface({
    AnchorPoint = v6.optional(v6.Vector2), 
    BackgroundColor = v6.optional(v4), 
    ContentBackgroundColor = v6.optional(v4), 
    DropShadowEnabled = v6.optional(v6.boolean), 
    Draggable = v6.optional(v6.boolean), 
    AutomaticSize = v6.optional(v6.EnumItem), 
    FooterHeight = v6.optional(v6.number), 
    FooterContents = v6.optional(v6.table), 
    Position = v6.optional(v6.UDim2), 
    Size = v6.optional(v6.UDim2), 
    TitleBarProps = v6.optional(v6.table), 
    [v7.Children] = v6.optional(v6.table), 
    Native = v6.optional(v6.table)
});
v14.init = function(v15) --[[ Line: 84 ]] --[[ Name: init ]]
    -- upvalues: v7 (copy), l_UserInputService_0 (copy)
    local v16, v17 = v7.createBinding(v15.props.Size);
    v15.Size = v16;
    v15.SetSize = v17;
    v15.TitleBarRef = v7.createRef();
    v15.WindowRef = v7.createRef();
    if v15.props.Draggable then
        v15.DragConnection = l_UserInputService_0.InputChanged:Connect(function(v18) --[[ Line: 98 ]]
            -- upvalues: v15 (copy)
            local v19 = v15.WindowRef:getValue();
            if v19 and v18 == v15.DragInput and v15.Dragging then
                local v20 = v18.Position - v15.DragStart;
                v19.Position = UDim2.new(v15.StartPos.X.Scale, v15.StartPos.X.Offset + v20.X, v15.StartPos.Y.Scale, v15.StartPos.Y.Offset + v20.Y);
            end;
        end);
    end;
end;
v14.willUnmount = function(v21) --[[ Line: 115 ]] --[[ Name: willUnmount ]]
    if v21.DragConnection then
        v21.DragConnection:Disconnect();
    end;
end;
v14.didMount = function(v22) --[[ Line: 122 ]] --[[ Name: didMount ]]
    local v23 = v22.TitleBarRef:getValue();
    local v24 = v22.WindowRef:getValue();
    if v23 then
        v23:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 129 ]]
            -- upvalues: v23 (copy), v22 (copy)
            v22.TitleBarHeight = v23.AbsoluteSize.Y;
        end);
    end;
    if v23 and v24 and v22.props.Draggable then
        v23.InputBegan:Connect(function(v25) --[[ Line: 136 ]]
            -- upvalues: v22 (copy), v24 (copy)
            if v25.UserInputType == Enum.UserInputType.MouseButton1 or v25.UserInputType == Enum.UserInputType.Touch then
                v22.Dragging = true;
                v22.DragStart = v25.Position;
                v22.StartPos = v24.Position;
                local v26 = nil;
                do
                    local l_v26_0 = v26;
                    l_v26_0 = v25.Changed:Connect(function() --[[ Line: 143 ]]
                        -- upvalues: v25 (copy), v22 (ref), l_v26_0 (ref)
                        if v25.UserInputState == Enum.UserInputState.End then
                            v22.Dragging = nil;
                            l_v26_0:Disconnect();
                        end;
                    end);
                end;
            end;
        end);
        v23.InputChanged:Connect(function(v28) --[[ Line: 152 ]]
            -- upvalues: v22 (copy)
            if v28.UserInputType == Enum.UserInputType.MouseMovement or v28.UserInputType == Enum.UserInputType.Touch then
                v22.DragInput = v28;
            end;
        end);
    end;
end;
v14.render = function(v29) --[[ Line: 160 ]] --[[ Name: render ]]
    -- upvalues: l_WithTheme_0 (copy), l_createElement_0 (copy), v13 (copy), v5 (copy), v7 (copy), v11 (copy), v10 (copy)
    local l_props_0 = v29.props;
    return l_WithTheme_0(function(v31) --[[ Line: 163 ]]
        -- upvalues: l_createElement_0 (ref), v13 (ref), v5 (ref), v7 (ref), v29 (copy), l_props_0 (copy), v11 (ref), v10 (ref)
        local v32 = l_createElement_0(v13, v5.Dictionary.join({
            LayoutOrder = 1, 
            Height = 32, 
            CaptionButtonWidth = 45, 
            Native = {
                [v7.Ref] = v29.TitleBarRef
            }
        }, l_props_0.TitleBarProps));
        local v33 = v31[l_props_0.ContentBackgroundColor];
        local v36 = l_createElement_0(v11, {
            AutomaticSize = l_props_0.AutomaticSize, 
            BackgroundColor3 = v33.Color, 
            BackgroundTransparency = v33.Transparency, 
            BorderSizePixel = 0, 
            CornerRadius = UDim.new(0, v31["styles/CornerRadius/Default/Outer"]), 
            ShowBottomLeftCorner = l_props_0.FooterHeight < v31["styles/CornerRadius/Default/Outer"] / 2, 
            ShowBottomRightCorner = l_props_0.FooterHeight < v31["styles/CornerRadius/Default/Outer"] / 2, 
            LayoutOrder = 2, 
            Size = l_props_0.Size, 
            [v7.Change.AbsoluteSize] = function(v34) --[[ Line: 191 ]]
                -- upvalues: v29 (ref)
                local l_AbsoluteSize_0 = v34.AbsoluteSize;
                v29.SetSize(UDim2.fromOffset(l_AbsoluteSize_0.X, l_AbsoluteSize_0.Y));
            end
        }, v29.props[v7.Children]);
        local v37 = l_createElement_0("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = 3, 
            Size = UDim2.new(1, 0, 0, l_props_0.FooterHeight)
        }, l_props_0.FooterContents);
        local v38 = v31[l_props_0.BackgroundColor];
        local v39 = v31["colors/Stroke_Color/Surface_Stroke/Default"];
        local v41 = l_createElement_0("Frame", v5.Dictionary.join({
            AnchorPoint = l_props_0.DropShadowEnabled and Vector2.new(0.5, 0.5) or l_props_0.AnchorPoint, 
            Position = l_props_0.DropShadowEnabled and UDim2.fromScale(0.5, 0.5) or l_props_0.Position, 
            BackgroundColor3 = v38.Color, 
            BackgroundTransparency = v38.Transparency, 
            [v7.Ref] = not l_props_0.Draggable and v29.WindowRef or nil, 
            Size = v29.Size:map(function(v40) --[[ Line: 218 ]]
                -- upvalues: v29 (ref), l_props_0 (ref)
                return v40 + UDim2.fromOffset(0, (v29.TitleBarHeight or 0) + l_props_0.FooterHeight);
            end)
        }, l_props_0.Native), {
            TitleBar = v32, 
            ContentWrapper = v36, 
            Footer = v37, 
            Stroke = l_createElement_0("UIStroke", {
                Color = v39.Color, 
                Transparency = v39.Transparency
            }), 
            Corners = l_createElement_0("UICorner", {
                CornerRadius = UDim.new(0, v31["styles/CornerRadius/Default/Outer"])
            }), 
            Layout = l_createElement_0("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder
            })
        });
        if l_props_0.DropShadowEnabled then
            return l_createElement_0(v10, {
                AnchorPoint = l_props_0.AnchorPoint, 
                Position = l_props_0.Position, 
                CornerRadius = UDim.new(0, v31["styles/CornerRadius/Default/Outer"]), 
                Size = v29.Size:map(function(v42) --[[ Line: 247 ]]
                    -- upvalues: v29 (ref), l_props_0 (ref)
                    return v42 + UDim2.fromOffset(0, (v29.TitleBarHeight or 0) + l_props_0.FooterHeight) + UDim2.new(0, 50, 0, 50);
                end), 
                Native = {
                    [v7.Ref] = v29.WindowRef
                }
            }, v41);
        else
            return v41;
        end;
    end);
end;
return v14;