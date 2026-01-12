return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.Binding);
    local v1 = require(script.Parent.Type);
    local v2 = require(script.Parent.createRef);
    it("should create refs, which are specialized bindings", function() --[[ Line: 7 ]]
        -- upvalues: v2 (copy), v1 (copy)
        local v3 = v2();
        expect(v1.of(v3)).to.equal(v1.Binding);
        expect(v3.current).to.equal(nil);
    end);
    it("should have a 'current' field that is the same as the internal binding's value", function() --[[ Line: 14 ]]
        -- upvalues: v2 (copy), v0 (copy)
        local v4 = v2();
        expect(v4.current).to.equal(nil);
        v0.update(v4, 10);
        expect(v4.current).to.equal(10);
    end);
    it("should support tostring on refs", function() --[[ Line: 23 ]]
        -- upvalues: v2 (copy), v0 (copy)
        local v5 = v2();
        expect(v5.current).to.equal(nil);
        expect((tostring(v5))).to.equal("RoactRef(nil)");
        v0.update(v5, 10);
        expect((tostring(v5))).to.equal("RoactRef(10)");
    end);
    it("should not allow assignments to the 'current' field", function() --[[ Line: 33 ]]
        -- upvalues: v2 (copy), v0 (copy)
        local v6 = v2();
        expect(v6.current).to.equal(nil);
        v0.update(v6, 99);
        expect(v6.current).to.equal(99);
        expect(function() --[[ Line: 41 ]]
            -- upvalues: v6 (copy)
            v6.current = 77;
        end).to.throw();
        expect(v6.current).to.equal(99);
    end);
    it("should return the same thing from getValue as its current field", function() --[[ Line: 48 ]]
        -- upvalues: v2 (copy), v0 (copy)
        local v7 = v2();
        v0.update(v7, 10);
        expect(v7:getValue()).to.equal(10);
        expect(v7:getValue()).to.equal(v7.current);
    end);
end;