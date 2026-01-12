local v0 = require(script.Parent.loader).load(script);
local v1 = v0("Promise");
local v2 = v0("Maid");
return {
    promiseRemoved = function(v3) --[[ Line: 16 ]] --[[ Name: promiseRemoved ]]
        -- upvalues: v2 (copy), v1 (copy)
        assert(v3:IsDescendantOf(game));
        local v4 = v2.new();
        local v5 = v1.new();
        v4:GiveTask(v3.AncestryChanged:Connect(function(_, v7) --[[ Line: 23 ]]
            -- upvalues: v5 (copy)
            if not v7 then
                v5:Resolve();
            end;
        end));
        v5:Finally(function() --[[ Line: 29 ]]
            -- upvalues: v4 (copy)
            v4:DoCleaning();
        end);
        return v5;
    end
};