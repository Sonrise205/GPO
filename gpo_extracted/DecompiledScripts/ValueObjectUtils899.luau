local v0 = require(script.Parent.loader).load(script);
local v1 = v0("Maid");
local v2 = v0("Brio");
local v3 = v0("Observable");
local v4 = v0("ValueObject");
return {
    syncValue = function(v5, v6) --[[ Line: 21 ]] --[[ Name: syncValue ]]
        -- upvalues: v1 (copy)
        local v7 = v1.new();
        v6.Value = v5.Value;
        v7:GiveTask(v5.Changed:Connect(function() --[[ Line: 25 ]]
            -- upvalues: v6 (copy), v5 (copy)
            v6.Value = v5.Value;
        end));
        return v7;
    end, 
    observeValue = function(v8) --[[ Line: 37 ]] --[[ Name: observeValue ]]
        -- upvalues: v4 (copy), v3 (copy), v1 (copy)
        assert(v4.isValueObject(v8), "Bad valueObject");
        return v3.new(function(v9) --[[ Line: 40 ]]
            -- upvalues: v8 (copy), v1 (ref)
            if not v8.Destroy then
                warn("[ValueObjectUtils.observeValue] - Connecting to dead ValueObject");
                v9:Complete();
                return;
            else
                local v10 = v1.new();
                v10:GiveTask(v8.Changed:Connect(function() --[[ Line: 50 ]]
                    -- upvalues: v9 (copy), v8 (ref)
                    v9:Fire(v8.Value);
                end));
                v9:Fire(v8.Value);
                return v10;
            end;
        end);
    end, 
    observeValueBrio = function(v11) --[[ Line: 65 ]] --[[ Name: observeValueBrio ]]
        -- upvalues: v3 (copy), v1 (copy), v2 (copy)
        assert(v11, "Bad valueObject");
        return v3.new(function(v12) --[[ Line: 68 ]]
            -- upvalues: v1 (ref), v2 (ref), v11 (copy)
            local v13 = v1.new();
            local function v15() --[[ Line: 71 ]] --[[ Name: refire ]]
                -- upvalues: v2 (ref), v11 (ref), v13 (copy), v12 (copy)
                local v14 = v2.new(v11.Value);
                v13._lastBrio = v14;
                v12:Fire(v14);
            end;
            v13:GiveTask(v11.Changed:Connect(v15));
            local v16 = v2.new(v11.Value);
            v13._lastBrio = v16;
            v12:Fire(v16);
            return v13;
        end);
    end
};