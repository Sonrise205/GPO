return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.createSignal);
    local v1 = require(script.Parent.createSpy);
    it("should fire subscribers and disconnect them", function() --[[ Line: 6 ]]
        -- upvalues: v0 (copy), v1 (copy)
        local v2 = v0();
        local v3 = v1();
        local v4 = v2:subscribe(v3.value);
        expect(v3.callCount).to.equal(0);
        local v5 = {};
        v2:fire(1, v5, "hello");
        expect(v3.callCount).to.equal(1);
        v3:assertCalledWith(1, v5, "hello");
        v4();
        v2:fire();
        expect(v3.callCount).to.equal(1);
    end);
    it("should handle multiple subscribers", function() --[[ Line: 29 ]]
        -- upvalues: v0 (copy), v1 (copy)
        local v6 = v0();
        local v7 = v1();
        local v8 = v1();
        local v9 = v6:subscribe(v7.value);
        local v10 = v6:subscribe(v8.value);
        expect(v7.callCount).to.equal(0);
        expect(v8.callCount).to.equal(0);
        local v11 = {};
        v6:fire(v11, 67);
        expect(v7.callCount).to.equal(1);
        v7:assertCalledWith(v11, 67);
        expect(v8.callCount).to.equal(1);
        v8:assertCalledWith(v11, 67);
        v9();
        v6:fire(67, v11);
        expect(v7.callCount).to.equal(1);
        expect(v8.callCount).to.equal(2);
        v8:assertCalledWith(67, v11);
        v10();
    end);
    it("should stop firing a connection if disconnected mid-fire", function() --[[ Line: 63 ]]
        -- upvalues: v0 (copy), v1 (copy)
        local v12 = v0();
        local v13 = nil;
        local v14 = nil;
        local v15 = v1(function() --[[ Line: 73 ]]
            -- upvalues: v14 (ref)
            v14();
        end);
        local v16 = v1(function() --[[ Line: 77 ]]
            -- upvalues: v13 (ref)
            v13();
        end);
        v13 = v12:subscribe(v15.value);
        v14 = v12:subscribe(v16.value);
        v12:fire();
        expect(v15.callCount + v16.callCount).to.equal(1);
    end);
    it("should allow adding listener in the middle of firing", function() --[[ Line: 90 ]]
        -- upvalues: v0 (copy), v1 (copy)
        local v17 = v0();
        local v18 = nil;
        local v19 = v1();
        local v22 = v17:subscribe(function(_, _) --[[ Line: 95 ]]
            -- upvalues: v18 (ref), v17 (copy), v19 (copy)
            v18 = v17:subscribe(v19.value);
        end);
        expect(v19.callCount).to.equal(0);
        local v23 = {};
        v17:fire(v23, 67);
        expect(v19.callCount).to.equal(0);
        v17:fire(67, v23);
        expect(v19.callCount).to.equal(1);
        v19:assertCalledWith(67, v23);
        v18();
        v22();
        v17:fire(v23);
        expect(v19.callCount).to.equal(1);
    end);
    it("should have one connection instance when add the same listener multiple times", function() --[[ Line: 122 ]]
        -- upvalues: v0 (copy), v1 (copy)
        local v24 = v0();
        local v25 = v1();
        local v26 = v24:subscribe(v25.value);
        expect(v25.callCount).to.equal(0);
        local v27 = {};
        v24:fire(v27, 67);
        expect(v25.callCount).to.equal(1);
        v25:assertCalledWith(v27, 67);
        local v28 = v24:subscribe(v25.value);
        v24:fire(67, v27);
        expect(v25.callCount).to.equal(2);
        v25:assertCalledWith(67, v27);
        v28();
        v24:fire(v27);
        expect(v25.callCount).to.equal(2);
        v26();
        v24:fire(v27);
        expect(v25.callCount).to.equal(2);
    end);
end;