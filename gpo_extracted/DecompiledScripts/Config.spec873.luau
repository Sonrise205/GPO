return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.Config);
    it("should accept valid configuration", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        local v1 = v0.new();
        local v2 = v1.get();
        expect(v2.elementTracing).to.equal(false);
        v1.set({
            elementTracing = true
        });
        expect(v2.elementTracing).to.equal(true);
    end);
    it("should reject invalid configuration keys", function() --[[ Line: 17 ]]
        -- upvalues: v0 (copy)
        local v3 = v0.new();
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 22 ]]
            -- upvalues: v3 (copy)
            v3.set({
                garblegoop = true
            });
        end);
        expect(l_status_0).to.equal(false);
        expect(l_result_0:find("garblegoop")).to.be.ok();
    end);
    it("should reject invalid configuration values", function() --[[ Line: 34 ]]
        -- upvalues: v0 (copy)
        local v6 = v0.new();
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 40 ]]
            -- upvalues: v6 (copy)
            v6.set({
                elementTracing = "Hello there!"
            });
        end);
        expect(l_status_1).to.equal(false);
        expect(l_result_1:find("elementTracing")).to.be.ok();
        expect(l_result_1:find("Hello there!")).to.be.ok();
    end);
end;