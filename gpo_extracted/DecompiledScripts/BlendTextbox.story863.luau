local v0 = require(game:GetService("ServerScriptService"):FindFirstChild("LoaderUtils", true).Parent).load(script);
local v1 = v0("Blend");
local v2 = v0("Maid");
return function(v3) --[[ Line: 10 ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v4 = v2.new();
    local v5 = v1.State("hi");
    v4:GiveTask(v1.New("Frame")({
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        Parent = v3, 
        [v1.Children] = {
            v1.New("TextBox")({
                Size = UDim2.new(0, 200, 0, 50), 
                Text = v5, 
                [v1.OnChange("Text")] = v5, 
                [v1.OnEvent("Focused")] = function() --[[ Line: 25 ]]
                    print("Focused");
                end, 
                [function(v6) --[[ Line: 29 ]]
                    return v6.Focused;
                end] = function() --[[ Line: 29 ]]
                    print("Focused (via func)");
                end, 
                [function(v7) --[[ Line: 34 ]]
                    return v7:GetPropertyChangedSignal("Text");
                end] = function() --[[ Line: 34 ]]
                    print("Property changed from :GetPropertyChangedSignal()");
                end
            }), 
            v1.New("TextBox")({
                Size = UDim2.new(0, 200, 0, 50), 
                [v1.OnChange("Text")] = v5, 
                Text = v5
            }), 
            v1.New("UIListLayout")({
                Padding = UDim.new(0, 10)
            })
        }
    }):Subscribe());
    return function() --[[ Line: 51 ]]
        -- upvalues: v4 (copy)
        v4:DoCleaning();
    end;
end;