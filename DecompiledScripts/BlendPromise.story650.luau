local v0 = require(game:GetService("ServerScriptService"):FindFirstChild("LoaderUtils", true).Parent).load(script);
local l_RunService_0 = game:GetService("RunService");
local v2 = v0("Blend");
local v3 = v0("Maid");
local v4 = v0("PlayerThumbnailUtils");
return function(v5) --[[ Line: 13 ]]
    -- upvalues: v3 (copy), v2 (copy), v4 (copy), l_RunService_0 (copy)
    local v6 = v3.new();
    local l_IntValue_0 = Instance.new("IntValue");
    l_IntValue_0.Value = 4397833;
    v6:GiveTask(l_IntValue_0);
    local l_BoolValue_0 = Instance.new("BoolValue");
    l_BoolValue_0.Value = false;
    v6:GiveTask(l_BoolValue_0);
    local v10 = v2.Dynamic(l_IntValue_0, function(v9) --[[ Line: 24 ]]
        -- upvalues: v4 (ref)
        return v4.promiseUserThumbnail(v9);
    end);
    local v12 = v2.Dynamic(l_IntValue_0, function(v11) --[[ Line: 27 ]]
        -- upvalues: v4 (ref)
        return v4.promiseUserName(v11);
    end);
    local v14 = v2.Spring(v2.Computed(l_BoolValue_0, function(v13) --[[ Line: 30 ]]
        if v13 then
            return 1;
        else
            return 0;
        end;
    end), 35);
    local v16 = v2.Computed(v14, function(v15) --[[ Line: 33 ]]
        return 1 - v15;
    end);
    v6:GiveTask(v2.New("Frame")({
        Parent = v5, 
        Name = "ProfileImage", 
        LayoutOrder = 15, 
        BackgroundTransparency = 1, 
        Size = UDim2.new(0, 100, 0, 130), 
        Position = UDim2.fromScale(0.5, 0.5), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        [v2.Children] = {
            v2.New("UIScale")({
                Scale = v2.Computed(v14, function(v17) --[[ Line: 47 ]]
                    return 0.8 + 0.2 * v17;
                end)
            }), 
            v2.New("TextLabel")({
                Size = UDim2.new(1, 0, 0, 30), 
                Position = UDim2.new(0.5, 0, 1, 0), 
                AnchorPoint = Vector2.new(0.5, 1), 
                BackgroundTransparency = 1, 
                TextTransparency = v16, 
                TextColor3 = Color3.new(1, 1, 1), 
                TextSize = 20, 
                Font = Enum.Font.Gotham, 
                Text = v12
            }), 
            v2.New("Frame")({
                Position = UDim2.new(0.5, 0, 0, 0), 
                AnchorPoint = Vector2.new(0.5, 0), 
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundColor3 = Color3.new(0.2, 0.25, 0.2), 
                BackgroundTransparency = v16, 
                [v2.Children] = {
                    v2.New("UIAspectRatioConstraint")({
                        AspectRatio = 1
                    }), 
                    v2.New("UICorner")({
                        CornerRadius = UDim.new(1, 0)
                    }), 
                    v2.New("UIPadding")({
                        PaddingLeft = UDim.new(0, 2), 
                        PaddingRight = UDim.new(0, 2), 
                        PaddingTop = UDim.new(0, 2), 
                        PaddingBottom = UDim.new(0, 2)
                    }), 
                    v2.New("ImageLabel")({
                        Size = UDim2.new(1, 0, 1, 0), 
                        Image = v10, 
                        BackgroundTransparency = v16, 
                        ImageTransparency = v16, 
                        BackgroundColor3 = Color3.new(0.1, 0.1, 0.1), 
                        [v2.Children] = {
                            v2.New("UICorner")({
                                CornerRadius = UDim.new(1, 0)
                            })
                        }
                    })
                }
            })
        }
    }):Subscribe());
    v6:GiveTask(l_RunService_0.RenderStepped:Connect(function() --[[ Line: 103 ]]
        -- upvalues: l_BoolValue_0 (copy)
        l_BoolValue_0.Value = tick() / 2 % 1 < 0.5;
    end));
    local v18 = true;
    v6:GiveTask(function() --[[ Line: 108 ]]
        -- upvalues: v18 (ref)
        v18 = false;
    end);
    v6:GiveTask(l_BoolValue_0.Changed:Connect(function() --[[ Line: 111 ]]
        -- upvalues: l_BoolValue_0 (copy), v18 (ref), l_IntValue_0 (copy)
        if not l_BoolValue_0.Value then
            task.delay(1, function() --[[ Line: 113 ]]
                -- upvalues: v18 (ref), l_IntValue_0 (ref)
                if v18 then
                    l_IntValue_0.Value = Random.new():NextInteger(1, 1000000000);
                end;
            end);
        end;
    end));
    return function() --[[ Line: 121 ]]
        -- upvalues: v6 (copy)
        v6:DoCleaning();
    end;
end;