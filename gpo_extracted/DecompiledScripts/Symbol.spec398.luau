return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.Symbol);
    describe("named", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        it("should give an opaque object", function() --[[ Line: 5 ]]
            -- upvalues: v0 (ref)
            local v1 = v0.named("foo");
            expect(v1).to.be.a("userdata");
        end);
        it("should coerce to the given name", function() --[[ Line: 11 ]]
            -- upvalues: v0 (ref)
            local v2 = tostring((v0.named("foo"))):find("foo");
            expect(v2).to.be.ok();
        end);
        it("should be unique when constructed", function() --[[ Line: 18 ]]
            -- upvalues: v0 (ref)
            local v3 = v0.named("abc");
            local v4 = v0.named("abc");
            expect(v3).never.to.equal(v4);
        end);
    end);
end;