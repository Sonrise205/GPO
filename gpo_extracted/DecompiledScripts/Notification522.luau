local l_Packages_0 = script.Parent.Parent.Packages;
local v1 = require(l_Packages_0.Roact);
local l_createElement_0 = v1.createElement;
return function(v3) --[[ Line: 9 ]]
    -- upvalues: l_createElement_0 (copy), v1 (copy)
    return l_createElement_0("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundColor3 = Color3.fromRGB(0, 0, 0), 
        BackgroundTransparency = 0.4, 
        BorderSizePixel = 0, 
        Size = UDim2.fromScale(1, 0), 
        AutoLocalize = false
    }, {
        content = l_createElement_0("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            Size = UDim2.fromScale(1, 0)
        }, v3[v1.Children]), 
        uIListLayout = l_createElement_0("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Bottom
        }), 
        header = l_createElement_0("Frame", {
            BackgroundColor3 = Color3.fromRGB(0, 0, 0), 
            BackgroundTransparency = 1, 
            BorderColor3 = Color3.fromRGB(27, 42, 53), 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 0, 25)
        }, {
            fill = l_createElement_0("CanvasGroup", {
                GroupColor3 = Color3.fromRGB(0, 0, 0), 
                GroupTransparency = 0.5, 
                BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Size = UDim2.fromScale(1, 1), 
                ZIndex = 0
            }, {
                corner = l_createElement_0("Frame", {
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
                    Size = UDim2.new(1, 0, 0, 35)
                }, {
                    uICorner = l_createElement_0("UICorner", {
                        CornerRadius = UDim.new(0, 4)
                    }), 
                    cornerFilling = l_createElement_0("Frame", {
                        AnchorPoint = Vector2.new(0, 1), 
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
                        BorderSizePixel = 0, 
                        Position = UDim2.fromScale(0, 1), 
                        Size = UDim2.new(1, 0, 0, 5)
                    })
                })
            }), 
            wrapper = l_createElement_0("Frame", {
                BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1)
            }, {
                uIPadding = l_createElement_0("UIPadding", {
                    PaddingBottom = UDim.new(0, 5), 
                    PaddingLeft = UDim.new(0, 5), 
                    PaddingRight = UDim.new(0, 5), 
                    PaddingTop = UDim.new(0, 5)
                }), 
                left = l_createElement_0("Frame", {
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 1)
                }, {
                    icon = v3.Image and l_createElement_0("ImageLabel", {
                        Image = v3.Image, 
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Position = UDim2.fromOffset(5, 5), 
                        Size = UDim2.fromOffset(16, 16), 
                        ZIndex = 10, 
                        AutoLocalize = false
                    }), 
                    title = l_createElement_0("TextLabel", {
                        FontFace = Font.fromEnum(Enum.Font.SourceSansBold), 
                        Text = v3.TitleText, 
                        TextColor3 = Color3.fromRGB(255, 255, 255), 
                        TextSize = 14, 
                        TextStrokeColor3 = Color3.fromRGB(90, 90, 90), 
                        TextWrapped = true, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Position = UDim2.fromOffset(30, 8), 
                        Size = UDim2.new(1, -60, 0, 15), 
                        ZIndex = 10, 
                        AutoLocalize = false
                    }), 
                    uIListLayout1 = l_createElement_0("UIListLayout", {
                        Padding = UDim.new(0, 5), 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        VerticalAlignment = Enum.VerticalAlignment.Center
                    })
                }), 
                right = l_createElement_0("Frame", {
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 1)
                }, {
                    close = l_createElement_0("TextButton", {
                        FontFace = Font.fromEnum(Enum.Font.FredokaOne), 
                        Text = "x", 
                        TextColor3 = Color3.fromRGB(255, 255, 255), 
                        TextSize = 19, 
                        TextWrapped = true, 
                        BackgroundColor3 = Color3.fromRGB(195, 33, 35), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Position = UDim2.new(1, -25, 0, 5), 
                        Size = UDim2.fromOffset(12, 12), 
                        ZIndex = 10, 
                        AutoLocalize = false, 
                        [v1.Event.Activated] = v3.OnClose
                    }), 
                    uIListLayout2 = l_createElement_0("UIListLayout", {
                        Padding = UDim.new(0, 5), 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    })
                })
            })
        }), 
        uICorner1 = l_createElement_0("UICorner", {
            CornerRadius = UDim.new(0, 4)
        })
    });
end;