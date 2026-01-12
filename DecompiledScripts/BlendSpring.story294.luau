local v0 = require(game:GetService("ServerScriptService"):FindFirstChild("LoaderUtils", true).Parent).load(script);
local l_RunService_0 = game:GetService("RunService");
local v2 = v0("Blend");
local v3 = v0("Maid");
return function(v4) --[[ Line: 12 ]]
    -- upvalues: v3 (copy), v2 (copy), l_RunService_0 (copy)
    local v5 = v3.new();
    local l_BoolValue_0 = Instance.new("BoolValue");
    l_BoolValue_0.Value = false;
    local v8 = v2.Spring(v2.Computed(l_BoolValue_0, function(v7) --[[ Line: 18 ]]
        if v7 then
            return 1;
        else
            return 0;
        end;
    end), 35);
    local v10 = v2.Computed(v8, function(v9) --[[ Line: 22 ]]
        return 1 - v9;
    end);
    v5:GiveTask(v2.New("Frame")({
        Size = UDim2.new(0.5, 0, 0.5, 0), 
        BackgroundColor3 = Color3.new(0.9, 0.9, 0.9), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        BackgroundTransparency = v10, 
        Parent = v4, 
        [v2.Children] = {
            v2.New("UIScale")({
                Scale = v2.Computed(v8, function(v11) --[[ Line: 36 ]]
                    return 0.8 + 0.2 * v11;
                end)
            }), 
            v2.New("UICorner")({
                CornerRadius = UDim.new(0.05, 0)
            })
        }
    }):Subscribe());
    v5:GiveTask(l_RunService_0.RenderStepped:Connect(function() --[[ Line: 47 ]]
        -- upvalues: l_BoolValue_0 (copy)
        l_BoolValue_0.Value = tick() / 5 % 1 < 0.5;
    end));
    return function() --[[ Line: 51 ]]
        -- upvalues: v5 (copy)
        v5:DoCleaning();
    end;
end;