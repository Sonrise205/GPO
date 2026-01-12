return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.Parent.assertDeepEqual);
    local v1 = require(script.Parent.Parent.createElement);
    local v2 = require(script.Parent.Parent.createReconciler);
    local v3 = require(script.Parent.Parent.createSpy);
    local v4 = require(script.Parent.Parent.NoopRenderer);
    local v5 = require(script.Parent.Parent.Type);
    local v6 = require(script.Parent.Parent.Component);
    local v7 = v2(v4);
    it("should be invoked when updated via updateVirtualNode", function() --[[ Line: 13 ]]
        -- upvalues: v6 (copy), v3 (copy), v1 (copy), v7 (copy), v5 (copy), v0 (copy)
        local v8 = v6:extend("MyComponent");
        local v9 = v3();
        v8.didUpdate = v9.value;
        v8.render = function(_) --[[ Line: 19 ]] --[[ Name: render ]]
            return nil;
        end;
        local v11 = {
            a = 5
        };
        local v12 = v1(v8, v11);
        local v13 = v7.mountVirtualNode(v12, nil, "Test");
        expect(v9.callCount).to.equal(0);
        local v14 = {
            a = 6, 
            b = 2
        };
        local v15 = v1(v8, v14);
        v7.updateVirtualNode(v13, v15);
        expect(v9.callCount).to.equal(1);
        local v16 = v9:captureValues("self", "oldProps", "oldState");
        expect(v5.of(v16.self)).to.equal(v5.StatefulComponentInstance);
        v0(v16.oldProps, v11);
        v0(v16.oldState, {});
    end);
    it("should be invoked when updated via setState", function() --[[ Line: 50 ]]
        -- upvalues: v6 (copy), v3 (copy), v1 (copy), v7 (copy), v5 (copy), v0 (copy)
        local v17 = v6:extend("MyComponent");
        local v18 = v3();
        v17.didUpdate = v18.value;
        local v19 = {
            a = 4
        };
        local v20 = nil;
        v17.init = function(v21) --[[ Line: 61 ]] --[[ Name: init ]]
            -- upvalues: v20 (ref), v19 (copy)
            v20 = function(...) --[[ Line: 62 ]]
                -- upvalues: v21 (copy)
                return v21:setState(...);
            end;
            v21:setState(v19);
        end;
        v17.render = function(_) --[[ Line: 69 ]] --[[ Name: render ]]

        end;
        local v23 = v1(v17);
        v7.mountVirtualNode(v23, nil, "Test");
        expect(v18.callCount).to.equal(0);
        v20({
            a = 5
        });
        expect(v18.callCount).to.equal(1);
        local v24 = v18:captureValues("self", "oldProps", "oldState");
        expect(v5.of(v24.self)).to.equal(v5.StatefulComponentInstance);
        v0(v24.oldProps, {});
        v0(v24.oldState, v19);
    end);
end;