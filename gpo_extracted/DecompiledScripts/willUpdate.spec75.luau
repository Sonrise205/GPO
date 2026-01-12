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
        v8.willUpdate = v9.value;
        v8.render = function(_) --[[ Line: 20 ]] --[[ Name: render ]]
            return nil;
        end;
        local v11 = {
            a = 5
        };
        local v12 = v1(v8, v11);
        local v13 = v7.mountVirtualNode(v12, nil, "Test");
        local v14 = {
            a = 6, 
            b = 2
        };
        local v15 = v1(v8, v14);
        v7.updateVirtualNode(v13, v15);
        expect(v9.callCount).to.equal(1);
        local v16 = v9:captureValues("self", "newProps", "newState");
        expect(v5.of(v16.self)).to.equal(v5.StatefulComponentInstance);
        v0(v16.newProps, v14);
        v0(v16.newState, {});
    end);
    it("it should be invoked when updated via setState", function() --[[ Line: 49 ]]
        -- upvalues: v6 (copy), v3 (copy), v1 (copy), v7 (copy), v5 (copy), v0 (copy)
        local v17 = v6:extend("MyComponent");
        local v18 = nil;
        local v19 = v3();
        v17.willUpdate = v19.value;
        v17.init = function(v20) --[[ Line: 57 ]] --[[ Name: init ]]
            -- upvalues: v18 (ref)
            v18 = function(v21) --[[ Line: 58 ]]
                -- upvalues: v20 (copy)
                v20:setState(v21);
            end;
            v20:setState({
                foo = 1
            });
        end;
        v17.render = function(_) --[[ Line: 67 ]] --[[ Name: render ]]
            return nil;
        end;
        local v23 = v1(v17);
        v7.mountVirtualNode(v23, nil, "Test");
        expect(v19.callCount).to.equal(0);
        v18({
            foo = 2
        });
        expect(v19.callCount).to.equal(1);
        local v24 = v19:captureValues("self", "newProps", "newState");
        expect(v5.of(v24.self)).to.equal(v5.StatefulComponentInstance);
        v0(v24.newProps, {});
        v0(v24.newState, {
            foo = 2
        });
    end);
end;