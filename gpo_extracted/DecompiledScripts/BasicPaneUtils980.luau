local v0 = require(script.Parent.loader).load(script);
local v1 = v0("Observable");
local v2 = v0("Maid");
local v3 = v0("Rx");
local v4 = v0("BasicPane");
local v9 = {
    observeVisible = function(v5) --[[ Line: 19 ]] --[[ Name: observeVisible ]]
        -- upvalues: v4 (copy), v1 (copy), v2 (copy)
        assert(v4.isBasicPane(v5), "Bad BasicPane");
        return v1.new(function(v6) --[[ Line: 22 ]]
            -- upvalues: v2 (ref), v5 (copy)
            local v7 = v2.new();
            v7:GiveTask(v5.VisibleChanged:Connect(function(v8) --[[ Line: 25 ]]
                -- upvalues: v6 (copy)
                v6:Fire(v8);
            end));
            v6:Fire(v5:IsVisible());
            return v7;
        end);
    end
};
v9.observePercentVisible = function(v10) --[[ Line: 39 ]] --[[ Name: observePercentVisible ]]
    -- upvalues: v4 (copy), v9 (copy), v3 (copy)
    assert(v4.isBasicPane(v10), "Bad BasicPane");
    return v9.observeVisible(v10):Pipe({
        v3.map(function(v11) --[[ Line: 43 ]]
            if v11 then
                return 1;
            else
                return 0;
            end;
        end), 
        v3.startWith({
            0
        })
    });
end;
v9.toTransparency = v3.map(function(v12) --[[ Line: 58 ]]
    return 1 - v12;
end);
v9.observeShow = function(v13) --[[ Line: 67 ]] --[[ Name: observeShow ]]
    -- upvalues: v9 (copy), v3 (copy)
    return v9.observeVisible(v13):Pipe({
        v3.where(function(v14) --[[ Line: 69 ]]
            return v14;
        end)
    });
end;
return v9;