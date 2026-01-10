local v0 = require(game:GetService("ServerScriptService"):FindFirstChild("LoaderUtils", true).Parent).load(script);
local v1 = v0("Blend");
local v2 = v0("Maid");
return function(v3) --[[ Line: 10 ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v4 = v2.new();
    local v5 = v1.State({
        "a", 
        "b", 
        "c"
    });
    v4:GiveTask(v5);
    v4:GiveTask(v1.New("TextLabel")({
        Parent = v3, 
        [v1.Children] = {
            v1.New("TextButton")({
                Text = "Add", 
                AutoButtonColor = true, 
                Size = UDim2.new(0, 100, 0, 20), 
                [v1.OnEvent("Activated")] = function() --[[ Line: 24 ]]
                    -- upvalues: v5 (copy)
                    local v6 = {};
                    for _, v8 in pairs(v5.Value) do
                        table.insert(v6, v8);
                    end;
                    table.insert(v6, (string.char(#v6 + 97)));
                    v5.Value = v6;
                end
            }), 
            v1.ComputedPairs(v5, function(_, v10) --[[ Line: 33 ]]
                -- upvalues: v1 (ref)
                print("Compute", v10);
                return v1.New("TextLabel")({
                    Text = tostring(v10), 
                    Size = UDim2.new(0, 20, 0, 20)
                });
            end), 
            v1.New("UIListLayout")({
                Padding = UDim.new(0, 5)
            })
        }
    }):Subscribe());
    return function() --[[ Line: 47 ]]
        -- upvalues: v4 (copy)
        v4:DoCleaning();
    end;
end;