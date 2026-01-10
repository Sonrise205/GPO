return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.Portal);
    local v1 = require(script.Parent.Component);
    local v2 = require(script.Parent.ElementKind);
    describe("of", function() --[[ Line: 7 ]]
        -- upvalues: v2 (copy)
        it("should return nil for non-table values", function() --[[ Line: 8 ]]
            -- upvalues: v2 (ref)
            expect(v2.of(nil)).to.equal(nil);
            expect(v2.of(5)).to.equal(nil);
            expect(v2.of(newproxy(true))).to.equal(nil);
        end);
        it("should return nil for table values without an ElementKind key", function() --[[ Line: 14 ]]
            -- upvalues: v2 (ref)
            expect(v2.of({})).to.equal(nil);
        end);
        it("should return the ElementKind from a table", function() --[[ Line: 18 ]]
            -- upvalues: v2 (ref)
            local v3 = {
                [v2] = v2.Stateful
            };
            expect(v2.of(v3)).to.equal(v2.Stateful);
        end);
    end);
    describe("fromComponent", function() --[[ Line: 27 ]]
        -- upvalues: v2 (copy), v1 (copy), v0 (copy)
        it("should handle host components", function() --[[ Line: 28 ]]
            -- upvalues: v2 (ref)
            expect(v2.fromComponent("foo")).to.equal(v2.Host);
        end);
        it("should handle function components", function() --[[ Line: 32 ]]
            -- upvalues: v2 (ref)
            expect(v2.fromComponent(function() --[[ Line: 33 ]] --[[ Name: foo ]]

            end)).to.equal(v2.Function);
        end);
        it("should handle stateful components", function() --[[ Line: 38 ]]
            -- upvalues: v1 (ref), v2 (ref)
            local v4 = v1:extend("Foo");
            expect(v2.fromComponent(v4)).to.equal(v2.Stateful);
        end);
        it("should handle portals", function() --[[ Line: 44 ]]
            -- upvalues: v2 (ref), v0 (ref)
            expect(v2.fromComponent(v0)).to.equal(v2.Portal);
        end);
        it("should return nil for invalid inputs", function() --[[ Line: 48 ]]
            -- upvalues: v2 (ref)
            expect(v2.fromComponent(5)).to.equal(nil);
            expect(v2.fromComponent(newproxy(true))).to.equal(nil);
        end);
    end);
end;