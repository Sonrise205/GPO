local l_TweenService_0 = game:GetService("TweenService");
local l_Parent_0 = script.Parent.Parent;
local l_Components_0 = l_Parent_0.Components;
local l_Modules_0 = l_Parent_0.Modules;
local v4 = require(l_Modules_0.Packages);
local v5 = require(v4.Directory.Roact);
local v6 = require(l_Components_0.StudioTheme);
local function v8(v7) --[[ Line: 12 ]] --[[ Name: GetSizeUnit ]]
    if v7 < 1000 then
        return v7, "bytes";
    elseif v7 < 1000000 then
        return v7 / 1000, "kilobytes";
    else
        return v7 / 1000000, "megabytes";
    end;
end;
local v9 = v5.Component:extend("DataChartItem");
v9.init = function(v10) --[[ Line: 24 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy)
    local v11, v12 = v5.createBinding(false);
    v10.RemoteData = v11;
    v10.ShowRemoteData = v12;
    v11, v12 = v5.createBinding(Vector2.zero);
    v10.Size = v11;
    v10.SetSize = v12;
    v11, v12 = v5.createBinding(1);
    v10.HighlightTransparency = v11;
    v10.SetHighlightTransparency = v12;
    v10.HighlightFrame = v5.createRef();
    v10.FadeInTween = nil;
    v10.FadeOutTween = nil;
    v10.HighlightTask = nil;
end;
v9.didMount = function(v13) --[[ Line: 35 ]] --[[ Name: didMount ]]
    -- upvalues: l_TweenService_0 (copy)
    if v13.props.OnArcClicked then
        v13.ArcClickConnection = v13.props.OnArcClicked:Connect(function(v14) --[[ Line: 37 ]]
            -- upvalues: v13 (copy), l_TweenService_0 (ref)
            if v14 == v13.props.Arc.Name then
                v13.ShowRemoteData(true);
                if v13.FadeInTween then
                    v13.FadeInTween:Cancel();
                end;
                if v13.FadeOutTween then
                    v13.FadeOutTween:Cancel();
                end;
                if v13.HighlightTask then
                    task.cancel(v13.HighlightTask);
                end;
                local v15 = v13.HighlightFrame:getValue();
                if v15 then
                    v15.BackgroundTransparency = 1;
                    v13.FadeInTween = l_TweenService_0:Create(v15, TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        BackgroundTransparency = 0.7
                    });
                    v13.FadeInTween:Play();
                    v13.HighlightTask = task.delay(0.25, function() --[[ Line: 62 ]]
                        -- upvalues: v13 (ref), l_TweenService_0 (ref), v15 (copy)
                        v13.FadeOutTween = l_TweenService_0:Create(v15, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                            BackgroundTransparency = 1
                        });
                        v13.FadeOutTween:Play();
                    end);
                end;
            end;
        end);
    end;
end;
v9.willUnmount = function(v16) --[[ Line: 76 ]] --[[ Name: willUnmount ]]
    if v16.ArcClickConnection then
        v16.ArcClickConnection:Disconnect();
    end;
    if v16.FadeInTween then
        v16.FadeInTween:Cancel();
    end;
    if v16.FadeOutTween then
        v16.FadeOutTween:Cancel();
    end;
    if v16.HighlightTask then
        task.cancel(v16.HighlightTask);
    end;
end;
v9.render = function(v17) --[[ Line: 91 ]] --[[ Name: render ]]
    -- upvalues: v6 (copy), v5 (copy), v8 (copy)
    local l_Arc_0 = v17.props.Arc;
    local v19 = {};
    for v20, v21 in v17.props.RemoteData do
        local l_Packet_0 = v21.Packet;
        v19[v20] = v6(function(v23) --[[ Line: 97 ]]
            -- upvalues: v20 (copy), v5 (ref), v21 (copy), v17 (copy), l_Packet_0 (copy)
            local v24 = v20 * 2;
            local v25 = v20 * 2 + 1;
            local v26 = v5.createElement("TextButton", {
                AutoLocalize = false, 
                LayoutOrder = v24, 
                Font = Enum.Font.SourceSans, 
                Text = v21.Name, 
                RichText = true, 
                TextColor3 = v23:GetColor("BrightText"), 
                TextSize = 14, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 20), 
                Visible = v17.RemoteData, 
                Selectable = false
            }, {
                Padding = v5.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, 4)
                })
            });
            local v29 = v5.createElement("ScrollingFrame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                AutomaticCanvasSize = Enum.AutomaticSize.X, 
                LayoutOrder = v25, 
                BackgroundColor3 = v23:GetColor("ScrollBarBackground"), 
                Position = UDim2.fromOffset(0, 20), 
                Size = UDim2.new(1, -12, 0, 0), 
                ClipsDescendants = true, 
                BorderSizePixel = 0, 
                ScrollBarImageColor3 = v23:GetColor("ScrollBar"), 
                ScrollBarThickness = 4, 
                ScrollingDirection = Enum.ScrollingDirection.X, 
                Visible = v17.RemoteData, 
                [v5.Ref] = function(v27) --[[ Line: 132 ]]
                    if v27 ~= nil then
                        task.delay(0.1, function() --[[ Line: 137 ]]
                            -- upvalues: v27 (copy)
                            local l_UICorner_0 = Instance.new("UICorner");
                            l_UICorner_0.CornerRadius = UDim.new(0, 4);
                            l_UICorner_0.Parent = v27;
                        end);
                    end;
                end
            }, {
                UIStroke = v5.createElement("UIStroke", {
                    Color = v23:GetColor("DropShadow"), 
                    LineJoinMode = Enum.LineJoinMode.Round, 
                    Transparency = 0.5
                }), 
                Text = v5.createElement("TextLabel", {
                    AutoLocalize = false, 
                    Font = Enum.Font.Code, 
                    RichText = true, 
                    Text = l_Packet_0, 
                    TextColor3 = v23:GetColor("BrightText"), 
                    TextSize = 12, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Top, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 1), 
                    ClipsDescendants = true
                }, {
                    Padding = v5.createElement("UIPadding", {
                        PaddingBottom = UDim.new(0, 8), 
                        PaddingRight = UDim.new(0, 8), 
                        PaddingLeft = UDim.new(0, 4), 
                        PaddingTop = UDim.new(0, 4)
                    })
                })
            });
            return v5.createFragment({
                v26, 
                v29
            });
        end);
    end;
    return v6(function(v30) --[[ Line: 177 ]]
        -- upvalues: v5 (ref), l_Arc_0 (copy), v17 (copy), v8 (ref), v19 (copy)
        return v5.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 22), 
            AutomaticSize = Enum.AutomaticSize.Y
        }, {
            HighlightEffect = v5.createElement("Frame", {
                BackgroundColor3 = l_Arc_0.Color, 
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1), 
                Position = UDim2.fromScale(0, 0), 
                ZIndex = 1, 
                BorderSizePixel = 0, 
                [v5.Ref] = v17.HighlightFrame
            }), 
            Information = v5.createElement("TextButton", {
                AutoLocalize = false, 
                Font = Enum.Font.SourceSans, 
                Text = string.format("<font color=\"#%s\"><b>%s</b></font>: %.1f%%, %d %s", l_Arc_0.Color:ToHex(), l_Arc_0.Name, l_Arc_0.Percent, v8(l_Arc_0.DataSize)), 
                RichText = true, 
                TextColor3 = v30:GetColor("BrightText"), 
                TextSize = 14, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, -18, 0, 20), 
                Position = UDim2.fromOffset(18, 0), 
                ZIndex = 3, 
                [v5.Event.Activated] = function() --[[ Line: 204 ]]
                    -- upvalues: v17 (ref)
                    v17.ShowRemoteData(not v17.RemoteData:getValue());
                end
            }, {
                Padding = v5.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, 4)
                })
            }), 
            Chevron = v5.createElement("ImageLabel", {
                BackgroundTransparency = 1, 
                Image = v17.RemoteData:map(function(v31) --[[ Line: 214 ]]
                    if v31 then
                        return "rbxassetid://18699144520";
                    else
                        return "rbxassetid://18699113012";
                    end;
                end), 
                ImageColor3 = v30:GetColor("BrightText"), 
                Size = UDim2.fromOffset(16, 16), 
                Position = UDim2.fromOffset(0, 2), 
                ZIndex = 3
            }), 
            Container = v5.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = v17.props.ScrollBarChanged:map(function(v32) --[[ Line: 224 ]]
                    return UDim2.new(1, v32.Visible and -12 or 0, 0, 0);
                end), 
                Position = UDim2.fromOffset(8, 24), 
                Transparency = 1, 
                [v5.Change.AbsoluteSize] = function(v33) --[[ Line: 229 ]]
                    -- upvalues: v17 (ref)
                    v17.SetSize(v33.AbsoluteSize);
                end
            }, {
                RemoteData = v5.createFragment(v19), 
                UIListLayout = v5.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    Padding = UDim.new(0, 0)
                })
            }), 
            Divider = v5.createElement("Frame", {
                BackgroundColor3 = v30:GetColor("DropShadow"), 
                Transparency = 0.5, 
                BorderSizePixel = 0, 
                Size = v17.Size:map(function(v34) --[[ Line: 246 ]]
                    return UDim2.new(0, 1, 0, v34.Y);
                end), 
                Position = UDim2.fromOffset(0, 26), 
                ZIndex = 2
            })
        });
    end);
end;
return function(v35) --[[ Line: 256 ]] --[[ Name: DataChartItems ]]
    -- upvalues: v5 (copy), v9 (copy)
    local v36 = {};
    local v37 = 0;
    for _, v39 in v35.Arcs do
        v37 = v37 - v39.Percent;
        v36[v37] = v5.createElement(v9, {
            Arc = v39, 
            RemoteData = v39.RemoteData, 
            ScrollBarChanged = v35.ScrollBarChanged, 
            OnArcClicked = v35.OnArcClicked
        });
    end;
    return v5.createFragment(v36);
end;