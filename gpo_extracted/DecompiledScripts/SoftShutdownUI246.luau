local v0 = require(script.Parent.loader).load(script);
local l_RunService_0 = game:GetService("RunService");
local l_Workspace_0 = game:GetService("Workspace");
local v3 = v0("BasicPane");
local v4 = v0("Blend");
local v5 = v0("SpringObject");
local v6 = v0("Rx");
local v7 = v0("Math");
local v8 = setmetatable({}, v3);
v8.ClassName = "SoftShutdownUI";
v8.__index = v8;
v8.new = function() --[[ Line: 20 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v8 (copy), v5 (copy), l_Workspace_0 (copy)
    local v9 = setmetatable(v3.new(), v8);
    v9._title = Instance.new("StringValue");
    v9._title.Value = "";
    v9._maid:GiveTask(v9._title);
    v9._subtitle = Instance.new("StringValue");
    v9._subtitle.Value = "";
    v9._maid:GiveTask(v9._subtitle);
    v9._percentVisible = v5.new(0, 40);
    v9._maid:GiveTask(v9._percentVisible);
    v9._maid:GiveTask(v9.VisibleChanged:Connect(function(v10, v11) --[[ Line: 34 ]]
        -- upvalues: v9 (copy)
        v9._percentVisible.t = v10 and 1 or 0;
        if v11 then
            v9._percentVisible.p = v9._percentVisible.t;
            v9._percentVisible.v = 0;
        end;
    end));
    v9._blur = Instance.new("BlurEffect");
    v9._blur.Name = "SoftShutdownBlur";
    v9._blur.Enabled = false;
    v9._blur.Size = 0;
    v9._blur.Parent = l_Workspace_0.CurrentCamera;
    v9._maid:GiveTask(v9._blur);
    v9._maid:GiveTask(v9:_render():Subscribe(function(v12) --[[ Line: 49 ]]
        -- upvalues: v9 (copy)
        v9.Gui = v12;
    end));
    return v9;
end;
v8.SetTitle = function(v13, v14) --[[ Line: 56 ]] --[[ Name: SetTitle ]]
    v13._title.Value = v14;
end;
v8.SetSubtitle = function(v15, v16) --[[ Line: 60 ]] --[[ Name: SetSubtitle ]]
    v15._subtitle.Value = v16;
end;
v8._render = function(v17) --[[ Line: 64 ]] --[[ Name: _render ]]
    -- upvalues: v4 (copy), v7 (copy), v6 (copy), l_RunService_0 (copy)
    local v18 = v17._percentVisible:ObserveRenderStepped();
    local v20 = v4.Computed(v18, function(v19) --[[ Line: 66 ]]
        return 1 - v19;
    end);
    local v21 = Color3.new(0, 0, 0);
    local v22 = Color3.new(0.9, 0.9, 0.9);
    v17._maid:GiveTask(v18:Subscribe(function(v23) --[[ Line: 72 ]]
        -- upvalues: v17 (copy)
        v17._blur.Size = v23 * 30;
        v17._blur.Enabled = v23 > 0;
    end));
    return v4.New("Frame")({
        Name = "SoftShutdownUI", 
        Size = UDim2.new(1, 0, 1, 0), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.fromScale(0.5, 0.5), 
        Active = v4.Computed(v18, function(v24) --[[ Line: 82 ]]
            return v24 > 0;
        end), 
        Visible = v4.Computed(v18, function(v25) --[[ Line: 85 ]]
            return v25 > 0;
        end), 
        BackgroundColor3 = v21, 
        BackgroundTransparency = v4.Computed(v18, function(v26) --[[ Line: 89 ]]
            -- upvalues: v7 (ref)
            return v7.map(v26, 0, 1, 1, 0.4);
        end), 
        [v4.Children] = {
            v4.New("UIPadding")({
                PaddingLeft = UDim.new(0, 20), 
                PaddingRight = UDim.new(0, 20), 
                PaddingTop = UDim.new(0, 20), 
                PaddingBottom = UDim.new(0, 20)
            }), 
            v4.New("Frame")({
                Name = "ContentContainer", 
                Size = UDim2.new(1, 0, 1, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                BackgroundTransparency = 1, 
                [v4.Children] = {
                    v4.New("UIScale")({
                        Scale = v4.Computed(v18, function(v27) --[[ Line: 110 ]]
                            return 0.7 + 0.3 * v27;
                        end)
                    }), 
                    v4.New("Frame")({
                        Name = "ImageLabelContainer", 
                        Size = UDim2.new(0, 80, 0, 80), 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 1, 
                        [v4.Children] = {
                            v4.New("ImageLabel")({
                                Size = UDim2.new(1, 0, 1, 0), 
                                ImageTransparency = v20, 
                                BackgroundTransparency = 1, 
                                Image = "rbxassetid://6031302916"
                            })
                        }
                    }), 
                    v4.New("Frame")({
                        Name = "LabelContainer", 
                        Size = UDim2.new(1, 0, 0, 80), 
                        Position = UDim2.new(0.5, 0, 0.5, 0), 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 2, 
                        [v4.Children] = {
                            v4.New("TextLabel")({
                                Name = "TitleLabel", 
                                BackgroundTransparency = 1, 
                                Position = UDim2.fromScale(0.5, 0), 
                                Size = UDim2.new(1, 0, 0.6, 0), 
                                AnchorPoint = Vector2.new(0.5, 0), 
                                Text = v17._title, 
                                Font = Enum.Font.SourceSansBold, 
                                TextTransparency = v20, 
                                TextColor3 = v22, 
                                LayoutOrder = 1, 
                                TextScaled = true
                            }), 
                            v4.New("TextLabel")({
                                Name = "SubtitleLabel", 
                                BackgroundTransparency = 1, 
                                Position = UDim2.fromScale(0.5, 1), 
                                Size = UDim2.new(1, 0, 0.3, 0), 
                                AnchorPoint = Vector2.new(0.5, 1), 
                                Text = v17._subtitle, 
                                Font = Enum.Font.SourceSansLight, 
                                TextTransparency = v20, 
                                TextColor3 = v22, 
                                LayoutOrder = 2, 
                                TextScaled = true
                            }), 
                            v4.New("UIAspectRatioConstraint")({
                                AspectRatio = 5
                            })
                        }
                    }), 
                    v4.New("Frame")({
                        Name = "Spacer", 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(0, 0, 0, 50), 
                        LayoutOrder = 3
                    }), 
                    v4.New("Frame")({
                        Name = "LoadingLabel", 
                        Position = UDim2.fromScale(0.5, 0.5), 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        LayoutOrder = 4, 
                        Size = UDim2.fromScale(0.25, 0.25), 
                        BackgroundTransparency = 1, 
                        [v4.Children] = {
                            v4.New("Frame")({
                                Name = "RobloxLogo", 
                                Size = UDim2.new(1, 0, 1, 0), 
                                BackgroundColor3 = v22, 
                                AnchorPoint = Vector2.new(0.5, 0.5), 
                                Position = UDim2.fromScale(0.5, 0.5), 
                                BackgroundTransparency = v20, 
                                Rotation = v6.fromSignal(l_RunService_0.RenderStepped):Pipe({
                                    v6.map(function() --[[ Line: 199 ]]
                                        local v28 = tick() * 3.141592653589793 * 1.5;
                                        local v29 = math.sin(v28);
                                        local v30 = (math.sin(v28 - 1.5707963267948966) + 1) / 2;
                                        if v29 > 0 then
                                            return v30 * 360 + 15;
                                        else
                                            return 15;
                                        end;
                                    end)
                                }), 
                                [v4.Children] = {
                                    v4.New("Frame")({
                                        BackgroundColor3 = v21, 
                                        Size = UDim2.fromScale(0.2, 0.2), 
                                        AnchorPoint = Vector2.new(0.5, 0.5), 
                                        Position = UDim2.fromScale(0.5, 0.5), 
                                        BackgroundTransparency = v20
                                    })
                                }
                            }), 
                            v4.New("UIAspectRatioConstraint")({
                                AspectRatio = 1
                            }), 
                            v4.New("UISizeConstraint")({
                                MaxSize = Vector2.new(1e999, 50)
                            })
                        }
                    }), 
                    v4.New("UIListLayout")({
                        FillDirection = Enum.FillDirection.Vertical, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        Padding = UDim.new(0, 10)
                    })
                }
            })
        }
    });
end;
return v8;