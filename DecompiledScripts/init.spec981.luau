return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.Parent.assertDeepEqual);
    local v1 = require(script.Parent.Parent.createElement);
    local v2 = require(script.Parent.Parent.createReconciler);
    local v3 = require(script.Parent.Parent.createSpy);
    local v4 = require(script.Parent.Parent.NoopRenderer);
    local v5 = require(script.Parent.Parent.Type);
    local v6 = require(script.Parent.Parent.Component);
    local v7 = v2(v4);
    it("should be invoked with props when mounted", function() --[[ Line: 13 ]]
        -- upvalues: v6 (copy), v3 (copy), v1 (copy), v7 (copy), v5 (copy), v0 (copy)
        local v8 = v6:extend("MyComponent");
        local v9 = v3();
        v8.init = v9.value;
        v8.render = function(_) --[[ Line: 20 ]] --[[ Name: render ]]
            return nil;
        end;
        local v11 = {
            a = 5
        };
        local v12 = v1(v8, v11);
        v7.mountVirtualNode(v12, nil, "Some Component Key");
        expect(v9.callCount).to.equal(1);
        local v13 = v9:captureValues("self", "props");
        expect(v5.of(v13.self)).to.equal(v5.StatefulComponentInstance);
        expect((typeof(v13.props))).to.equal("table");
        v0(v13.props, v11);
    end);
end;