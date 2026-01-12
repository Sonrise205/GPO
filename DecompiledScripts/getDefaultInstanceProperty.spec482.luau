return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.getDefaultInstanceProperty);
    it("should get default name string values", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        local _, v2 = v0("StringValue", "Name");
        expect(v2).to.equal("Value");
    end);
    it("should get default empty string values", function() --[[ Line: 10 ]]
        -- upvalues: v0 (copy)
        local _, v4 = v0("StringValue", "Value");
        expect(v4).to.equal("");
    end);
    it("should get default number values", function() --[[ Line: 16 ]]
        -- upvalues: v0 (copy)
        local _, v6 = v0("IntValue", "Value");
        expect(v6).to.equal(0);
    end);
    it("should get nil default values", function() --[[ Line: 22 ]]
        -- upvalues: v0 (copy)
        local _, v8 = v0("ObjectValue", "Value");
        expect(v8).to.equal(nil);
    end);
    it("should get bool default values", function() --[[ Line: 28 ]]
        -- upvalues: v0 (copy)
        local _, v10 = v0("BoolValue", "Value");
        expect(v10).to.equal(false);
    end);
end;