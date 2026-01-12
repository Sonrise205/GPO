local v0 = require(game:GetService("ServerScriptService"):FindFirstChild("LoaderUtils", true).Parent).load(script)("Rx");
return function() --[[ Line: 9 ]]
    -- upvalues: v0 (copy)
    describe("Rx.combineLatest({})", function() --[[ Line: 10 ]]
        -- upvalues: v0 (ref)
        local v1 = v0.combineLatest({});
        local v2 = nil;
        it("should execute immediately", function() --[[ Line: 14 ]]
            -- upvalues: v1 (copy), v2 (ref)
            local v4 = v1:Subscribe(function(v3) --[[ Line: 15 ]]
                -- upvalues: v2 (ref)
                v2 = v3;
            end);
            expect(v2).to.be.a("table");
            v4:Destroy();
        end);
    end);
    describe("Rx.combineLatest({ value = 5 })", function() --[[ Line: 24 ]]
        -- upvalues: v0 (ref)
        local v5 = v0.combineLatest({
            value = 5
        });
        local v6 = nil;
        it("should execute immediately", function() --[[ Line: 28 ]]
            -- upvalues: v5 (copy), v6 (ref)
            local v8 = v5:Subscribe(function(v7) --[[ Line: 29 ]]
                -- upvalues: v6 (ref)
                v6 = v7;
            end);
            expect(v6).to.be.a("table");
            expect(v6.value).to.equal(5);
            v8:Destroy();
        end);
    end);
    describe("Rx.combineLatest({ value = Rx.of(5) })", function() --[[ Line: 39 ]]
        -- upvalues: v0 (ref)
        local v9 = v0.combineLatest({
            value = v0.of(5)
        });
        local v10 = nil;
        it("should execute immediately", function() --[[ Line: 43 ]]
            -- upvalues: v9 (copy), v10 (ref)
            local v12 = v9:Subscribe(function(v11) --[[ Line: 44 ]]
                -- upvalues: v10 (ref)
                v10 = v11;
            end);
            expect(v10).to.be.a("table");
            expect(v10.value).to.equal(5);
            v12:Destroy();
        end);
    end);
end;