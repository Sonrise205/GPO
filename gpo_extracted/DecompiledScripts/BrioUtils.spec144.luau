local v0 = require(game:GetService("ServerScriptService"):FindFirstChild("LoaderUtils", true).Parent).load(script);
local v1 = v0("BrioUtils");
local v2 = v0("Brio");
return function() --[[ Line: 10 ]]
    -- upvalues: v1 (copy), v2 (copy)
    describe("BrioUtils.flatten({})", function() --[[ Line: 11 ]]
        -- upvalues: v1 (ref), v2 (ref)
        local v3 = v1.flatten({});
        describe("should return a brio that", function() --[[ Line: 14 ]]
            -- upvalues: v3 (copy), v2 (ref)
            it("is a brio", function() --[[ Line: 15 ]]
                -- upvalues: v3 (ref), v2 (ref)
                expect(v3).to.be.a("table");
                expect(v2.isBrio(v3)).to.equal(true);
            end);
            it("is alive", function() --[[ Line: 20 ]]
                -- upvalues: v3 (ref)
                expect(not v3:IsDead()).to.equal(true);
            end);
            it("contains a table", function() --[[ Line: 24 ]]
                -- upvalues: v3 (ref)
                expect(v3:GetValue()).to.be.a("table");
            end);
            it("contains a table with nothing in it", function() --[[ Line: 28 ]]
                -- upvalues: v3 (ref)
                expect(next(v3:GetValue())).to.equal(nil);
            end);
        end);
    end);
    describe("BrioUtils.flatten with out a brio in it", function() --[[ Line: 34 ]]
        -- upvalues: v1 (ref), v2 (ref)
        local v4 = v1.flatten({
            value = 5
        });
        describe("should return a brio that", function() --[[ Line: 39 ]]
            -- upvalues: v4 (copy), v2 (ref)
            it("is a brio", function() --[[ Line: 40 ]]
                -- upvalues: v4 (ref), v2 (ref)
                expect(v4).to.be.a("table");
                expect(v2.isBrio(v4)).to.equal(true);
            end);
            it("is alive", function() --[[ Line: 45 ]]
                -- upvalues: v4 (ref)
                expect(not v4:IsDead()).to.equal(true);
            end);
            it("contains a table", function() --[[ Line: 49 ]]
                -- upvalues: v4 (ref)
                expect(v4:GetValue()).to.be.a("table");
            end);
            it("contains a table with value", function() --[[ Line: 53 ]]
                -- upvalues: v4 (ref)
                expect(v4:GetValue().value).to.equal(5);
            end);
        end);
    end);
    describe("BrioUtils.flatten a dead brio in it", function() --[[ Line: 59 ]]
        -- upvalues: v1 (ref), v2 (ref)
        local v5 = v1.flatten({
            value = v2.DEAD
        });
        describe("should return a brio that", function() --[[ Line: 64 ]]
            -- upvalues: v5 (copy), v2 (ref)
            it("is a brio", function() --[[ Line: 65 ]]
                -- upvalues: v5 (ref), v2 (ref)
                expect(v5).to.be.a("table");
                expect(v2.isBrio(v5)).to.equal(true);
            end);
            it("is dead", function() --[[ Line: 70 ]]
                -- upvalues: v5 (ref)
                expect(v5:IsDead()).to.equal(true);
            end);
        end);
    end);
end;