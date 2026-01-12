local v0 = require(game:GetService("ServerScriptService"):FindFirstChild("LoaderUtils", true).Parent).load(script);
local l_RunService_0 = game:GetService("RunService");
local v2 = v0("Blend");
local v3 = v0("Maid");
local v4 = v0("ValueObject");
local v5 = v0("Rx");
return function(v6) --[[ Line: 14 ]]
    -- upvalues: v3 (copy), v2 (copy), v4 (copy), v5 (copy), l_RunService_0 (copy)
    local v7 = v3.new();
    local v8 = v2.State(0);
    local v9 = v2.State("a");
    v7:GiveTask(v9);
    local v10 = v4.new();
    v10.Value = v2.New("UICorner")({
        CornerRadius = UDim.new(0, 5)
    });
    v7:GiveTask(v10);
    task.delay(1, function() --[[ Line: 28 ]]
        -- upvalues: v10 (copy), v2 (ref)
        if v10.Destroy then
            v10.Value = v2.New("UICorner")({
                CornerRadius = UDim.new(0, 25)
            });
        end;
    end);
    v7:GiveTask(v2.New("TextLabel")({
        Parent = v6, 
        Size = v2.Computed(v8, function(v11) --[[ Line: 38 ]]
            return UDim2.new(0, v11 * 100, 0, 50);
        end), 
        BackgroundTransparency = v2.Computed(v8, function(v12) --[[ Line: 41 ]]
            return 1 - v12;
        end), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Text = v9, 
        TextScaled = true, 
        [v2.Children] = {
            v10, 
            v5.NEVER, 
            v5.EMPTY, 
            {
                v2.Single(v2.Computed(v8, function(v13) --[[ Line: 56 ]]
                    -- upvalues: v2 (ref)
                    if v13 <= 0.5 then
                        return nil;
                    else
                        return v2.New("Frame")({
                            Size = UDim2.new(0, 100, 0, 100), 
                            BackgroundTransparency = 0.5
                        });
                    end;
                end))
            }, 
            {
                v2.Single(v2.Computed(v8, function(v14) --[[ Line: 70 ]]
                    -- upvalues: v2 (ref)
                    local v15 = {};
                    for v16 = 0, v14 * 100, 10 do
                        table.insert(v15, v2.New("Frame")({
                            Size = UDim2.new(0, 8, 0, 8), 
                            Position = UDim2.new(0, v16, 0.9, 0), 
                            AnchorPoint = Vector2.new(0.5, 0.5), 
                            BorderSizePixel = 0, 
                            BackgroundColor3 = Color3.new(v16 / 100, 0.5, 0.5), 
                            [v2.Children] = {
                                v2.New("UICorner")({
                                    CornerRadius = UDim.new(0.5, 5)
                                })
                            }
                        }));
                    end;
                    return v15;
                end))
            }
        }
    }):Subscribe());
    v7:GiveTask(l_RunService_0.RenderStepped:Connect(function() --[[ Line: 97 ]]
        -- upvalues: v9 (copy), v8 (copy)
        v9.Value = tostring(tick());
        v8.Value = (math.sin(tick() * 3.141592653589793 * 2 / 5) + 1) / 2;
    end));
    return function() --[[ Line: 102 ]]
        -- upvalues: v7 (copy)
        v7:DoCleaning();
    end;
end;