return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.Parent.Type);
    local v1 = require(script.Parent.Parent.Component);
    it("should be extendable", function() --[[ Line: 6 ]]
        -- upvalues: v1 (copy), v0 (copy)
        local v2 = v1:extend("The Senate");
        expect(v2).to.be.ok();
        expect(v0.of(v2)).to.equal(v0.StatefulComponentClass);
    end);
    it("should prevent extending a user component", function() --[[ Line: 13 ]]
        -- upvalues: v1 (copy)
        local v3 = v1:extend("Sheev");
        expect(function() --[[ Line: 16 ]]
            -- upvalues: v3 (copy)
            v3:extend("Frank");
        end).to.throw();
    end);
    it("should use a given name", function() --[[ Line: 21 ]]
        -- upvalues: v1 (copy)
        local v4 = tostring((v1:extend("FooBar")));
        expect(v4).to.be.a("string");
        expect(v4:find("FooBar")).to.be.ok();
    end);
end;