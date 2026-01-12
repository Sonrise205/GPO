return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.Signal);
    it("should invoke all connections, instantly", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        local v1 = v0.new();
        local v2 = nil;
        local v3 = nil;
        v1:connect(function(v4) --[[ Line: 9 ]]
            -- upvalues: v2 (ref)
            v2 = v4;
        end);
        v1:connect(function(v5) --[[ Line: 13 ]]
            -- upvalues: v3 (ref)
            v3 = v5;
        end);
        v1:fire("hello");
        expect(v2).to.equal("hello");
        expect(v3).to.equal("hello");
    end);
    it("should return values when :wait() is called", function() --[[ Line: 23 ]]
        -- upvalues: v0 (copy)
        local v6 = v0.new();
        spawn(function() --[[ Line: 26 ]]
            -- upvalues: v6 (copy)
            v6:fire(123, "hello");
        end);
        local v7, v8 = v6:wait();
        expect(v7).to.equal(123);
        expect(v8).to.equal("hello");
    end);
    it("should properly handle disconnections", function() --[[ Line: 36 ]]
        -- upvalues: v0 (copy)
        local v9 = v0.new();
        local v10 = false;
        v9:connect(function() --[[ Line: 41 ]]
            -- upvalues: v10 (ref)
            v10 = true;
        end):disconnect();
        v9:fire();
        expect(v10).to.equal(false);
    end);
end;