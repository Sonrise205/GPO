local v0 = require(game:GetService("ServerScriptService"):FindFirstChild("LoaderUtils", true).Parent).load(script);
local v1 = v0("Maid");
local v2 = v0("Observable");
local v3 = v0("Blend");
return function(v4) --[[ Line: 11 ]]
    -- upvalues: v1 (copy), v3 (copy), v2 (copy)
    local v5 = v1.new();
    local v6 = v3.State("a");
    v5:GiveTask(v3.Single(v3.Dynamic(v6, function(v7) --[[ Line: 16 ]]
        -- upvalues: v3 (ref), v4 (copy), v2 (ref), v1 (ref)
        return v3.New("TextLabel")({
            Parent = v4, 
            Text = v7, 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 0.5, 
            [function() --[[ Line: 22 ]]
                -- upvalues: v2 (ref), v1 (ref), v7 (copy)
                return v2.new(function() --[[ Line: 23 ]]
                    -- upvalues: v1 (ref), v7 (ref)
                    local v8 = v1.new();
                    print("Made for", v7);
                    v8:GiveTask(function() --[[ Line: 27 ]]
                        -- upvalues: v7 (ref)
                        print("Cleaning up", v7);
                    end);
                    return v8;
                end);
            end] = true
        });
    end)):Subscribe());
    v6.Value = "b";
    return function() --[[ Line: 42 ]]
        -- upvalues: v5 (copy)
        v5:DoCleaning();
    end;
end;