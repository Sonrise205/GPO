return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.Parent.assertDeepEqual);
    local v1 = require(script.Parent.Parent.createSpy);
    local v2 = require(script.Parent.Parent.createElement);
    local v3 = require(script.Parent.Parent.createFragment);
    local v4 = require(script.Parent.Parent.createReconciler);
    local v5 = require(script.Parent.Parent.NoopRenderer);
    local v6 = require(script.Parent.Parent.Component);
    local v7 = v4(v5);
    it("should be invoked on initial mount", function() --[[ Line: 13 ]]
        -- upvalues: v1 (copy), v6 (copy), v2 (copy), v7 (copy), v0 (copy)
        local v8 = v1();
        local v9 = v6:extend("WithDerivedState");
        v9.getDerivedStateFromProps = v8.value;
        v9.render = function(_) --[[ Line: 19 ]] --[[ Name: render ]]
            return nil;
        end;
        local v11 = v2(v9, {
            someProp = 1
        });
        v7.mountVirtualNode(v11, nil, "WithDerivedState");
        expect(v8.callCount).to.equal(1);
        local v12 = v8:captureValues("props", "state");
        v0(v12.props, {
            someProp = 1
        });
        v0(v12.state, {});
    end);
    it("should be invoked when updated via props", function() --[[ Line: 39 ]]
        -- upvalues: v1 (copy), v6 (copy), v7 (copy), v2 (copy), v0 (copy)
        local v13 = v1();
        local v14 = v6:extend("WithDerivedState");
        v14.getDerivedStateFromProps = v13.value;
        v14.render = function(_) --[[ Line: 45 ]] --[[ Name: render ]]
            return nil;
        end;
        local v16 = v7.mountVirtualNode(v2(v14, {
            someProp = 1
        }), nil, "WithDerivedState");
        v7.updateVirtualNode(v16, v2(v14, {
            someProp = 2
        }));
        expect(v13.callCount).to.equal(2);
        local v17 = v13:captureValues("props", "state");
        v0(v17.props, {
            someProp = 2
        });
        v0(v17.state, {});
    end);
    it("should be invoked when updated via state", function() --[[ Line: 75 ]]
        -- upvalues: v1 (copy), v6 (copy), v2 (copy), v7 (copy), v0 (copy)
        local v18 = v1();
        local v19 = v6:extend("WithDerivedState");
        v19.getDerivedStateFromProps = v18.value;
        v19.init = function(v20) --[[ Line: 81 ]] --[[ Name: init ]]
            v20:setState({
                someState = 1
            });
        end;
        v19.render = function(_) --[[ Line: 87 ]] --[[ Name: render ]]
            return nil;
        end;
        local v22 = v2(v19);
        local v23 = v7.mountVirtualNode(v22, nil, "WithDerivedState");
        v7.updateVirtualNode(v23, v22, {
            someState = 2
        });
        expect(v18.callCount).to.equal(4);
        local v24 = v18:captureValues("props", "state");
        v0(v24.props, {});
        v0(v24.state, {
            someState = 2
        });
    end);
    it("should be invoked when updating via state in init (which skips reconciliation)", function() --[[ Line: 114 ]]
        -- upvalues: v1 (copy), v6 (copy), v2 (copy), v7 (copy), v0 (copy)
        local v25 = v1();
        local v26 = v6:extend("WithDerivedState");
        v26.getDerivedStateFromProps = v25.value;
        v26.init = function(v27) --[[ Line: 120 ]] --[[ Name: init ]]
            v27:setState({
                stateFromInit = 1
            });
        end;
        v26.render = function(_) --[[ Line: 126 ]] --[[ Name: render ]]
            return nil;
        end;
        local v29 = v2(v26, {
            someProp = 1
        });
        v7.mountVirtualNode(v29, nil, "WithDerivedState");
        expect(v25.callCount).to.equal(3);
        local v30 = v25:captureValues("props", "state");
        v0(v30.props, {
            someProp = 1
        });
        v0(v30.state, {
            stateFromInit = 1
        });
    end);
    it("should receive defaultProps", function() --[[ Line: 154 ]]
        -- upvalues: v1 (copy), v6 (copy), v2 (copy), v7 (copy), v0 (copy)
        local v31 = v1();
        local v32 = v6:extend("WithDerivedState");
        v32.defaultProps = {
            someDefaultProp = "foo"
        };
        v32.getDerivedStateFromProps = v31.value;
        v32.render = function(_) --[[ Line: 164 ]] --[[ Name: render ]]
            return nil;
        end;
        local v34 = v2(v32, {
            someProp = 1
        });
        local v35 = v7.mountVirtualNode(v34, nil, "WithDerivedState");
        expect(v31.callCount).to.equal(1);
        local v36 = v31:captureValues("props", "state");
        v0(v36.props, {
            someDefaultProp = "foo", 
            someProp = 1
        });
        v34 = v2(v32, {
            someProp = 2
        });
        v7.updateVirtualNode(v35, v34);
        expect(v31.callCount).to.equal(2);
        v36 = v31:captureValues("props", "state");
        v0(v36.props, {
            someDefaultProp = "foo", 
            someProp = 2
        });
    end);
    it("should derive state for all setState updates, even when deferred", function() --[[ Line: 202 ]]
        -- upvalues: v6 (copy), v1 (copy), v3 (copy), v2 (copy), v7 (copy)
        local v37 = v6:extend("Child");
        local v38 = v1(function() --[[ Line: 204 ]]
            return {};
        end);
        local v39 = v1();
        v37.render = function(_) --[[ Line: 209 ]] --[[ Name: render ]]
            return nil;
        end;
        v37.didMount = function(v41) --[[ Line: 213 ]] --[[ Name: didMount ]]
            v41.props.callback();
        end;
        local v42 = v6:extend("Parent");
        v42.getDerivedStateFromProps = v39.value;
        v42.render = function(v43) --[[ Line: 221 ]] --[[ Name: render ]]
            -- upvalues: v38 (copy), v3 (ref), v2 (ref), v37 (copy)
            local function v44() --[[ Line: 222 ]]
                -- upvalues: v43 (copy), v38 (ref)
                v43:setState(v38.value);
            end;
            return v3({
                ChildA = v2(v37, {
                    callback = v44
                }), 
                ChildB = v2(v37, {
                    callback = v44
                })
            });
        end;
        local v45 = v2(v42);
        v7.mountVirtualNode(v45, nil, "Test");
        expect(v38.callCount).to.equal(2);
        expect(v39.callCount).to.equal(3);
    end);
    it("should have derived state after assigning to state in init", function() --[[ Line: 248 ]]
        -- upvalues: v1 (copy), v6 (copy), v2 (copy), v7 (copy), v0 (copy)
        local v46 = nil;
        local v47 = v1(function() --[[ Line: 250 ]]
            return {
                derived = true
            };
        end);
        local v48 = v6:extend("WithDerivedState");
        v48.getDerivedStateFromProps = v47.value;
        v48.init = function(v49) --[[ Line: 259 ]] --[[ Name: init ]]
            -- upvalues: v46 (ref)
            v49.state = {
                init = true
            };
            v46 = function() --[[ Line: 264 ]]
                -- upvalues: v49 (copy)
                return v49.state;
            end;
        end;
        v48.render = function(_) --[[ Line: 269 ]] --[[ Name: render ]]
            return nil;
        end;
        local v51 = v2(v48);
        v7.mountVirtualNode(v51, nil, "WithDerivedState");
        expect(v47.callCount).to.equal(2);
        v0(v46(), {
            init = true, 
            derived = true
        });
    end);
end;