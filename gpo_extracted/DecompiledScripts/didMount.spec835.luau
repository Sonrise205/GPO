return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.Parent.createElement);
    local v1 = require(script.Parent.Parent.createReconciler);
    local v2 = require(script.Parent.Parent.createSpy);
    local v3 = require(script.Parent.Parent.NoopRenderer);
    local v4 = require(script.Parent.Parent.Type);
    local v5 = require(script.Parent.Parent.Component);
    local v6 = v1(v3);
    it("should be invoked when mounted", function() --[[ Line: 12 ]]
        -- upvalues: v5 (copy), v2 (copy), v0 (copy), v6 (copy), v4 (copy)
        local v7 = v5:extend("MyComponent");
        local v8 = v2();
        v7.didMount = v8.value;
        v7.render = function(_) --[[ Line: 19 ]] --[[ Name: render ]]
            return nil;
        end;
        local v10 = v0(v7);
        v6.mountVirtualNode(v10, nil, "Test");
        expect(v8.callCount).to.equal(1);
        local v11 = v8:captureValues("self");
        expect(v4.of(v11.self)).to.equal(v4.StatefulComponentInstance);
    end);
end;