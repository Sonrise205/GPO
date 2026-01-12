local v0 = require(game:GetService("ServerScriptService"):FindFirstChild("LoaderUtils", true).Parent).load(script);
local v1 = v0("RxBrioUtils");
local v2 = v0("Brio");
local v3 = v0("Observable");
return function() --[[ Line: 11 ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy)
    describe("RxBrioUtils.combineLatest({})", function() --[[ Line: 12 ]]
        -- upvalues: v1 (ref), v2 (ref)
        it("should execute immediately", function() --[[ Line: 13 ]]
            -- upvalues: v1 (ref), v2 (ref)
            local v4 = v1.combineLatest({});
            local v5 = nil;
            local v7 = v4:Subscribe(function(v6) --[[ Line: 16 ]]
                -- upvalues: v5 (ref)
                v5 = v6;
            end);
            expect(v5).to.be.ok();
            expect(v2.isBrio(v5)).to.equal(true);
            expect(v5:IsDead()).to.equal(true);
            v7:Destroy();
        end);
    end);
    describe("RxBrioUtils.combineLatest({ value = Observable(Brio(5)) })", function() --[[ Line: 27 ]]
        -- upvalues: v1 (ref), v3 (ref), v2 (ref)
        it("should execute immediately", function() --[[ Line: 28 ]]
            -- upvalues: v1 (ref), v3 (ref), v2 (ref)
            local v9 = v1.combineLatest({
                value = v3.new(function(v8) --[[ Line: 30 ]]
                    -- upvalues: v2 (ref)
                    v8:Fire(v2.new(5));
                end), 
                otherValue = 25
            });
            local v10 = nil;
            local v12 = v9:Subscribe(function(v11) --[[ Line: 37 ]]
                -- upvalues: v10 (ref)
                v10 = v11;
            end);
            expect(v10).to.be.ok();
            expect(v2.isBrio(v10)).to.equal(true);
            expect(not v10:IsDead()).to.equal(true);
            expect(v10:GetValue()).to.be.a("table");
            expect(v10:GetValue().value).to.equal(5);
            v12:Destroy();
        end);
    end);
    describe("RxBrioUtils.flatCombineLatest", function() --[[ Line: 50 ]]
        -- upvalues: v2 (ref), v1 (ref), v3 (ref)
        local v13 = nil;
        local v14 = v2.new(5);
        local v16 = v1.flatCombineLatest({
            value = v3.new(function(v15) --[[ Line: 54 ]]
                -- upvalues: v14 (copy), v13 (ref)
                v15:Fire(v14);
                v13 = function(...) --[[ Line: 56 ]]
                    -- upvalues: v15 (copy)
                    v15:Fire(...);
                end;
            end), 
            otherValue = 25
        });
        local v17 = nil;
        local v18 = 0;
        it("should execute immediately", function() --[[ Line: 66 ]]
            -- upvalues: v16 (copy), v17 (ref), v18 (ref), v2 (ref)
            local v20 = v16:Subscribe(function(v19) --[[ Line: 67 ]]
                -- upvalues: v17 (ref), v18 (ref)
                v17 = v19;
                v18 = v18 + 1;
            end);
            expect(v18).to.equal(1);
            expect(v17).to.be.a("table");
            expect(v2.isBrio(v17)).to.equal(false);
            expect(v17.value).to.equal(5);
            expect(v17.otherValue).to.equal(25);
            v20:Destroy();
        end);
        it("should reset when the brio is killed", function() --[[ Line: 80 ]]
            -- upvalues: v18 (ref), v14 (copy), v17 (ref), v2 (ref)
            expect(v18).to.equal(1);
            v14:Kill();
            expect(v18).to.equal(2);
            expect(v17).to.be.a("table");
            expect(v2.isBrio(v17)).to.equal(false);
            expect(v17.value).to.equal(nil);
            expect(v17.otherValue).to.equal(25);
        end);
        it("should allow a new value", function() --[[ Line: 92 ]]
            -- upvalues: v18 (ref), v13 (ref), v2 (ref), v17 (ref)
            expect(v18).to.equal(2);
            v13(v2.new(70));
            expect(v18).to.equal(3);
            expect(v17).to.be.a("table");
            expect(v2.isBrio(v17)).to.equal(false);
            expect(v17.value).to.equal(70);
            expect(v17.otherValue).to.equal(25);
        end);
        it("should only fire once if we replace the value", function() --[[ Line: 104 ]]
            -- upvalues: v18 (ref), v13 (ref), v2 (ref), v17 (ref)
            expect(v18).to.equal(3);
            v13(v2.new(75));
            expect(v18).to.equal(4);
            expect(v17).to.be.a("table");
            expect(v2.isBrio(v17)).to.equal(false);
            expect(v17.value).to.equal(75);
            expect(v17.otherValue).to.equal(25);
        end);
    end);
end;