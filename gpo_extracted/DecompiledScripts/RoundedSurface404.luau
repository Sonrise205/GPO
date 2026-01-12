local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_WithTheme_0 = require(l_Parent_0.Theme).WithTheme;
local l_Validators_0 = l_Parent_0.Validators;
local v4 = require(l_Validators_0.StyleValidator);
local v5 = require(l_Parent_1.Sift);
local v6 = require(l_Parent_1.t);
local v7 = require(l_Parent_1.Roact);
local l_createElement_0 = v7.createElement;
local v9 = UDim.new(0, 5);
local v10 = v7.PureComponent:extend(script.Name);
v10.Corners = {
    TopLeft = "TopLeft", 
    TopRight = "TopRight", 
    BottomLeft = "BottomLeft", 
    BottomRight = "BottomRight"
};
v10.defaultProps = {
    Size = UDim2.fromScale(1, 1), 
    BackgroundTransparency = 0, 
    CornerRadius = v9, 
    ShowTopLeftCorner = false, 
    ShowTopRightCorner = false, 
    ShowBottomLeftCorner = false, 
    ShowBottomRightCorner = false
};
v10.validateProps = v6.strictInterface({
    AnchorPoint = v6.optional(v6.Vector2), 
    AutomaticSize = v6.optional(v6.enum(Enum.AutomaticSize)), 
    BackgroundColor = v6.optional(v4), 
    BackgroundColor3 = v6.optional(v6.Color3), 
    BackgroundTransparency = v6.optional(v6.number), 
    BorderSizePixel = v6.optional(v6.number), 
    LayoutOrder = v6.optional(v6.number), 
    ShowTopLeftCorner = v6.optional(v6.boolean), 
    ShowTopRightCorner = v6.optional(v6.boolean), 
    ShowBottomLeftCorner = v6.optional(v6.boolean), 
    ShowBottomRightCorner = v6.optional(v6.boolean), 
    CornerRadius = v6.optional(v6.UDim), 
    Position = v6.optional(v6.UDim2), 
    Size = v6.optional(v6.UDim2), 
    Native = v6.optional(v6.table), 
    [v7.Change.AbsoluteSize] = v6.optional(v6.callback), 
    [v7.Children] = v6.optional(v6.table)
});
v10.CreateCornerFilling = function(v11, v12, v13) --[[ Line: 92 ]] --[[ Name: CreateCornerFilling ]]
    -- upvalues: l_createElement_0 (copy)
    local l_props_0 = v11.props;
    local l_state_0 = v11.state;
    local l_CornerRadius_0 = v11.props.CornerRadius;
    local v17 = nil;
    local v18 = nil;
    local v19 = UDim2.new(l_CornerRadius_0.Scale, l_CornerRadius_0.Offset, l_CornerRadius_0.Scale, l_CornerRadius_0.Offset);
    if v12 == v11.Corners.TopLeft then
        v17 = Vector2.new(0, 0);
        v18 = UDim2.fromScale(0, 0);
    elseif v12 == v11.Corners.TopRight then
        v17 = Vector2.new(1, 0);
        v18 = UDim2.fromScale(1, 0);
    elseif v12 == v11.Corners.BottomLeft then
        v17 = Vector2.new(0, 1);
        v18 = UDim2.fromScale(0, 1);
    elseif v12 == v11.Corners.BottomRight then
        v17 = Vector2.new(1, 1);
        v18 = UDim2.fromScale(1, 1);
    end;
    local v20 = v13[l_props_0.BackgroundColor or {
        Color = l_props_0.BackgroundColor3, 
        Transparency = l_props_0.BackgroundTransparency
    }];
    return l_createElement_0("Frame", {
        AnchorPoint = v17, 
        BackgroundColor3 = not l_state_0.FallbackMode and Color3.new(1, 1, 1) or v20.Color, 
        BackgroundTransparency = l_state_0.FallbackMode and v20.Transparency or nil, 
        BorderSizePixel = 0, 
        Position = v18, 
        Size = v19
    });
end;
v10.init = function(v21) --[[ Line: 135 ]] --[[ Name: init ]]
    -- upvalues: v7 (copy)
    local l_props_1 = v21.props;
    local v23, v24 = v7.createBinding(UDim2.fromScale(0, 0));
    v21.Size = v23;
    v21.SetSize = v24;
    v21[v7.Change.AbsoluteSize] = function(v25, ...) --[[ Line: 142 ]]
        -- upvalues: v21 (copy), l_props_1 (copy), v7 (ref)
        local l_AbsoluteSize_0 = v25.AbsoluteSize;
        v21.SetSize(UDim2.fromOffset(l_AbsoluteSize_0.X, l_AbsoluteSize_0.Y));
        local v27 = l_props_1[v7.Change.AbsoluteSize];
        if v27 then
            task.spawn(v27, v25, ...);
        end;
    end;
end;
v10.render = function(v28) --[[ Line: 156 ]] --[[ Name: render ]]
    -- upvalues: l_WithTheme_0 (copy), l_createElement_0 (copy), v7 (copy), v5 (copy)
    local l_props_2 = v28.props;
    local l_state_1 = v28.state;
    return l_WithTheme_0(function(v31) --[[ Line: 160 ]]
        -- upvalues: v28 (copy), l_props_2 (copy), l_createElement_0 (ref), l_state_1 (copy), v7 (ref), v5 (ref)
        local v32 = {};
        for _, v34 in pairs(v28.Corners) do
            if not l_props_2["Show" .. v34 .. "Corner"] then
                v32[v34 .. "CornerFilling"] = v28:CreateCornerFilling(v34, v31);
            end;
        end;
        local v35 = v31[l_props_2.BackgroundColor or {
            Color = l_props_2.BackgroundColor3, 
            Transparency = l_props_2.BackgroundTransparency
        }];
        local v36 = l_createElement_0("Frame", {
            Size = v28.Size, 
            BackgroundColor3 = l_state_1.FallbackMode and v35.Color or Color3.new(1, 1, 1), 
            BorderSizePixel = l_props_2.BorderSizePixel, 
            BackgroundTransparency = l_state_1.FallbackMode and v35.Transparency or 0
        }, {
            CornerFillings = v7.createFragment(v32), 
            Corners = l_createElement_0("UICorner", {
                CornerRadius = l_props_2.CornerRadius
            })
        });
        local v39 = l_createElement_0(not l_state_1.FallbackMode and "CanvasGroup" or "Frame", {
            GroupColor3 = not l_state_1.FallbackMode and v35.Color or nil, 
            GroupTransparency = not l_state_1.FallbackMode and v35.Transparency or nil, 
            BackgroundTransparency = 1, 
            Size = v28.Size, 
            ZIndex = 1, 
            [v7.Ref] = function(v37) --[[ Line: 205 ]]
                -- upvalues: v28 (ref), v7 (ref)
                if v28.DeterminedFallback then
                    return;
                else
                    if v37 then
                        task.spawn(function() --[[ Line: 213 ]]
                            -- upvalues: v37 (copy), v28 (ref), v7 (ref)
                            task.wait(0.1);
                            local v38 = v37:FindFirstAncestorWhichIsA("LayerCollector") or v37:FindFirstAncestorWhichIsA("PluginGui");
                            v28.DeterminedFallback = true;
                            if not v38 then
                                v28:setState({
                                    FallbackMode = true
                                });
                                warn("[Winro Component Library]: The Component Winro.App.Surface.RoundedSurface must be the descendant of a ScreenGui in order to function correctly.\nDue to not being a descendant of a ScreenGui, rounded corners are being rendered in Fallback mode and may not display correctly.");
                                return;
                            elseif v38.ZIndexBehavior ~= Enum.ZIndexBehavior.Sibling then
                                v28:setState({
                                    FallbackMode = true
                                });
                                warn("[Winro Component Library]: The Component Winro.App.Surface.RoundedSurface must be the descendant of a ScreenGui with ZIndexBehavior set to Enum.ZIndexBehavior.Sibling in order to function correctly.\nDue to ZIndexBehavior not being set to Enum.ZIndexBahavior.Sibling, rounded corners are being rendered in Fallback mode and may not display correctly.\nPlease set the ScreenGui's ZIndexBehaviour property to Enum.ZIndexBehavior.Sibling in order to resolve this issue.");
                                return;
                            else
                                v28:setState({
                                    FallbackMode = v7.None
                                });
                                return;
                            end;
                        end);
                    end;
                    return;
                end;
            end
        }, {
            RoundedFrame = v36
        });
        local v40 = l_createElement_0("Frame", {
            AutomaticSize = l_props_2.AutomaticSize, 
            BackgroundTransparency = 1, 
            Size = l_props_2.Size, 
            ZIndex = 2, 
            [v7.Change.AbsoluteSize] = v28[v7.Change.AbsoluteSize]
        }, l_props_2[v7.Children]);
        return l_createElement_0("Frame", v5.Dictionary.join({
            AutomaticSize = l_props_2.AutomaticSize, 
            BackgroundTransparency = 1, 
            LayoutOrder = l_props_2.LayoutOrder, 
            Size = l_props_2.Size, 
            Position = l_props_2.Position, 
            AnchorPoint = l_props_2.AnchorPoint
        }, l_props_2.Native), {
            ContentWrapper = v40, 
            RoundedFilling = v39
        });
    end);
end;
return v10;