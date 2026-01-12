local v0 = require(script.Parent.loader).load(script);
local v1 = v0("Observable");
local v2 = v0("Maid");
return {
    observeAttribute = function(v3, v4, v5) --[[ Line: 20 ]] --[[ Name: observeAttribute ]]
        -- upvalues: v1 (copy), v2 (copy)
        assert(typeof(v3) == "Instance", "Bad instance");
        assert(type(v4) == "string", "Bad attributeName");
        return v1.new(function(v6) --[[ Line: 24 ]]
            -- upvalues: v2 (ref), v3 (copy), v4 (copy), v5 (copy)
            local v7 = v2.new();
            local function v9() --[[ Line: 27 ]] --[[ Name: update ]]
                -- upvalues: v3 (ref), v4 (ref), v6 (copy), v5 (ref)
                local l_v3_Attribute_0 = v3:GetAttribute(v4);
                if l_v3_Attribute_0 == nil then
                    v6:Fire(v5);
                    return;
                else
                    v6:Fire(l_v3_Attribute_0);
                    return;
                end;
            end;
            v7:GiveTask(v3:GetAttributeChangedSignal(v4):Connect(v9));
            local l_v3_Attribute_1 = v3:GetAttribute(v4);
            if l_v3_Attribute_1 == nil then
                v6:Fire(v5);
                return v7;
            else
                v6:Fire(l_v3_Attribute_1);
                return v7;
            end;
        end);
    end
};