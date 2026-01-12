return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.isMotor);
    local v1 = require(script.Parent.SingleMotor);
    local v2 = require(script.Parent.GroupMotor);
    local v3 = v1.new(0);
    local v4 = v2.new({});
    it("should properly detect motors", function() --[[ Line: 10 ]]
        -- upvalues: v0 (copy), v3 (copy), v4 (copy)
        expect(v0(v3)).to.equal(true);
        expect(v0(v4)).to.equal(true);
    end);
    it("shouldn't detect things that aren't motors", function() --[[ Line: 15 ]]
        -- upvalues: v0 (copy)
        expect(v0({})).to.equal(false);
    end);
    it("should return the proper motor type", function() --[[ Line: 19 ]]
        -- upvalues: v0 (copy), v3 (copy), v4 (copy)
        local _, v6 = v0(v3);
        local _, v8 = v0(v4);
        expect(v6).to.equal("Single");
        expect(v8).to.equal("Group");
    end);
end;