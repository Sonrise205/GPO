return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.Parent.assertDeepEqual);
    local v1 = require(script.Parent.Parent.createElement);
    local v2 = require(script.Parent.Parent.createReconciler);
    local v3 = require(script.Parent.Parent.createSpy);
    local v4 = require(script.Parent.Parent.NoopRenderer);
    local v5 = require(script.Parent.Parent.Type);
    local v6 = require(script.Parent.Parent.Component);
    local v7 = v2(v4);
    it("should be invoked when props update", function() --[[ Line: 13 ]]
        -- upvalues: v6 (copy), v3 (copy), v1 (copy), v7 (copy), v5 (copy), v0 (copy)
        local v8 = v6:extend("MyComponent");
        local v9 = nil;
        local v10 = nil;
        local v12 = v3(function(v11) --[[ Line: 18 ]]
            -- upvalues: v9 (ref), v10 (ref)
            v9 = v11.props;
            v10 = v11.state;
            return true;
        end);
        v8.shouldUpdate = v12.value;
        v8.render = function(_) --[[ Line: 27 ]] --[[ Name: render ]]
            return nil;
        end;
        local v14 = {
            a = 5
        };
        local v15 = v1(v8, v14);
        local v16 = v7.mountVirtualNode(v15, nil, "Test");
        expect(v12.callCount).to.equal(0);
        local v17 = {
            a = 6, 
            b = 2
        };
        local v18 = v1(v8, v17);
        v7.updateVirtualNode(v16, v18);
        expect(v12.callCount).to.equal(1);
        local v19 = v12:captureValues("self", "newProps", "newState");
        expect(v5.of(v19.self)).to.equal(v5.StatefulComponentInstance);
        v0(v19.newProps, v17);
        v0(v9, v14);
        expect(v19.newState).to.equal(v10);
        v0(v10, {});
    end);
    it("should be invoked when state is updated", function() --[[ Line: 63 ]]
        -- upvalues: v6 (copy), v3 (copy), v1 (copy), v7 (copy), v5 (copy), v0 (copy)
        local v20 = v6:extend("MyComponent");
        local v21 = {
            a = 1
        };
        local v22 = nil;
        local v23 = nil;
        v20.init = function(v24) --[[ Line: 72 ]] --[[ Name: init ]]
            -- upvalues: v22 (ref), v21 (copy), v23 (ref)
            v22 = function(...) --[[ Line: 73 ]]
                -- upvalues: v24 (copy)
                return v24:setState(...);
            end;
            v24:setState(v21);
            v23 = v24.state;
        end;
        local v25 = nil;
        local v26 = nil;
        local v28 = v3(function(v27) --[[ Line: 84 ]]
            -- upvalues: v25 (ref), v26 (ref)
            v25 = v27.props;
            v26 = v27.state;
            return true;
        end);
        v20.shouldUpdate = v28.value;
        v20.render = function(_) --[[ Line: 93 ]] --[[ Name: render ]]
            return nil;
        end;
        local v30 = v1(v20);
        v7.mountVirtualNode(v30, nil, "Test");
        expect(v28.callCount).to.equal(0);
        local v31 = {
            a = 2, 
            b = 3
        };
        v22(v31);
        expect(v28.callCount).to.equal(1);
        local v32 = v28:captureValues("self", "newProps", "newState");
        expect(v5.of(v32.self)).to.equal(v5.StatefulComponentInstance);
        expect(v32.newProps).to.equal(v25);
        v0(v25, {});
        v0(v26, v21);
        expect(v26).to.equal(v23);
        v0(v32.newState, v31);
    end);
    it("should not abort an update when returning true", function() --[[ Line: 126 ]]
        -- upvalues: v6 (copy), v3 (copy), v1 (copy), v7 (copy)
        local v33 = v6:extend("MyComponent");
        v33.shouldUpdate = function(_) --[[ Line: 129 ]] --[[ Name: shouldUpdate ]]
            return true;
        end;
        local v35 = v3();
        v33.render = v35.value;
        local v36 = v1(v33);
        local v37 = v7.mountVirtualNode(v36, nil, "Test");
        expect(v35.callCount).to.equal(1);
        local v38 = v1(v33);
        v7.updateVirtualNode(v37, v38);
        expect(v35.callCount).to.equal(2);
    end);
    it("should abort an update when retuning false", function() --[[ Line: 151 ]]
        -- upvalues: v6 (copy), v3 (copy), v1 (copy), v7 (copy)
        local v39 = v6:extend("MyComponent");
        v39.shouldUpdate = function(_) --[[ Line: 154 ]] --[[ Name: shouldUpdate ]]
            return false;
        end;
        local v41 = v3();
        v39.render = v41.value;
        local v42 = v1(v39);
        local v43 = v7.mountVirtualNode(v42, nil, "Test");
        expect(v41.callCount).to.equal(1);
        local v44 = v1(v39);
        v7.updateVirtualNode(v43, v44);
        expect(v41.callCount).to.equal(1);
    end);
end;