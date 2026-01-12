return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.createElement);
    local v1 = require(script.Parent.createReconciler);
    local v2 = require(script.Parent.Logging);
    local v3 = require(script.Parent.NoopRenderer);
    local v4 = require(script.Parent.createReconcilerCompat);
    local v5 = v1(v3);
    local v6 = v4(v5);
    it("reify should only warn once per call site", function() --[[ Line: 12 ]]
        -- upvalues: v2 (copy), v6 (copy), v0 (copy), v5 (copy)
        local v8 = v2.capture(function() --[[ Line: 13 ]]
            -- upvalues: v6 (ref), v0 (ref), v5 (ref)
            local v7 = v6.reify(v0("StringValue"));
            v5.unmountVirtualTree(v7);
            v7 = v6.reify(v0("StringValue"));
            v5.unmountVirtualTree(v7);
        end);
        expect(#v8.warnings).to.equal(1);
        expect(v8.warnings[1]:find("reify")).to.be.ok();
        v8 = v2.capture(function() --[[ Line: 25 ]]
            -- upvalues: v6 (ref), v0 (ref), v5 (ref)
            local v9 = v6.reify(v0("StringValue"));
            v5.unmountVirtualTree(v9);
        end);
        expect(#v8.warnings).to.equal(1);
        expect(v8.warnings[1]:find("reify")).to.be.ok();
    end);
    it("teardown should only warn once per call site", function() --[[ Line: 35 ]]
        -- upvalues: v2 (copy), v5 (copy), v0 (copy), v6 (copy)
        local v11 = v2.capture(function() --[[ Line: 36 ]]
            -- upvalues: v5 (ref), v0 (ref), v6 (ref)
            local v10 = v5.mountVirtualTree(v0("StringValue"));
            v6.teardown(v10);
            v10 = v5.mountVirtualTree(v0("StringValue"));
            v6.teardown(v10);
        end);
        expect(#v11.warnings).to.equal(1);
        expect(v11.warnings[1]:find("teardown")).to.be.ok();
        v11 = v2.capture(function() --[[ Line: 48 ]]
            -- upvalues: v5 (ref), v0 (ref), v6 (ref)
            local v12 = v5.mountVirtualTree(v0("StringValue"));
            v6.teardown(v12);
        end);
        expect(#v11.warnings).to.equal(1);
        expect(v11.warnings[1]:find("teardown")).to.be.ok();
    end);
    it("update should only warn once per call site", function() --[[ Line: 58 ]]
        -- upvalues: v2 (copy), v5 (copy), v0 (copy), v6 (copy)
        local v15 = v2.capture(function() --[[ Line: 59 ]]
            -- upvalues: v5 (ref), v0 (ref), v6 (ref)
            for _ = 1, 2 do
                local v14 = v5.mountVirtualTree(v0("StringValue"));
                v6.reconcile(v14, v0("StringValue"));
                v5.unmountVirtualTree(v14);
            end;
        end);
        expect(#v15.warnings).to.equal(1);
        expect(v15.warnings[1]:find("reconcile")).to.be.ok();
        v15 = v2.capture(function() --[[ Line: 72 ]]
            -- upvalues: v5 (ref), v0 (ref), v6 (ref)
            local v16 = v5.mountVirtualTree(v0("StringValue"));
            v6.reconcile(v16, v0("StringValue"));
            v5.unmountVirtualTree(v16);
        end);
        expect(#v15.warnings).to.equal(1);
        expect(v15.warnings[1]:find("reconcile")).to.be.ok();
    end);
end;