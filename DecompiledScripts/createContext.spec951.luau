return function() --[[ Line: 1 ]]
    local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
    local v1 = require(script.Parent.Component);
    local v2 = require(script.Parent.NoopRenderer);
    local v3 = require(script.Parent.PropMarkers.Children);
    local v4 = require(script.Parent.createContext);
    local v5 = require(script.Parent.createElement);
    local v6 = require(script.Parent.createFragment);
    local v7 = require(script.Parent.createReconciler);
    local v8 = require(script.Parent.createSpy);
    local v9 = v7(v2);
    local v10 = v7((require(script.Parent.RobloxRenderer)));
    it("should return a table", function() --[[ Line: 18 ]]
        -- upvalues: v4 (copy)
        local v11 = v4("Test");
        expect(v11).to.be.ok();
        expect((type(v11))).to.equal("table");
    end);
    it("should contain a Provider and a Consumer", function() --[[ Line: 24 ]]
        -- upvalues: v4 (copy)
        local v12 = v4("Test");
        expect(v12.Provider).to.be.ok();
        expect(v12.Consumer).to.be.ok();
    end);
    describe("Provider", function() --[[ Line: 30 ]]
        -- upvalues: v4 (copy), v8 (copy), v5 (copy), v9 (copy)
        it("should render its children", function() --[[ Line: 31 ]]
            -- upvalues: v4 (ref), v8 (ref), v5 (ref), v9 (ref)
            local v13 = v4("Test");
            local v14 = v8(function() --[[ Line: 34 ]]
                return nil;
            end);
            local v15 = v5(v13.Provider, {
                value = "Test"
            }, {
                Listener = v5(v14.value)
            });
            local v16 = v9.mountVirtualTree(v15, nil, "Provide Tree");
            v9.unmountVirtualTree(v16);
            expect(v14.callCount).to.equal(1);
        end);
    end);
    describe("Consumer", function() --[[ Line: 51 ]]
        -- upvalues: v4 (copy), v5 (copy), v9 (copy), v8 (copy), v1 (copy), v6 (copy), v3 (copy)
        it("should expect a render function", function() --[[ Line: 52 ]]
            -- upvalues: v4 (ref), v5 (ref), v9 (ref)
            local v17 = v4("Test");
            local v18 = v5(v17.Consumer);
            expect(function() --[[ Line: 56 ]]
                -- upvalues: v9 (ref), v18 (copy)
                v9.mountVirtualTree(v18, nil, "Provide Tree");
            end).to.throw();
        end);
        it("should return the default value if there is no Provider", function() --[[ Line: 61 ]]
            -- upvalues: v8 (ref), v4 (ref), v5 (ref), v9 (ref)
            local v19 = v8();
            local v20 = v4("Test");
            local v21 = v5(v20.Consumer, {
                render = v19.value
            });
            local v22 = v9.mountVirtualTree(v21, nil, "Provide Tree");
            v9.unmountVirtualTree(v22);
            v19:assertCalledWith("Test");
        end);
        it("should pass the value to the render function", function() --[[ Line: 75 ]]
            -- upvalues: v8 (ref), v4 (ref), v5 (ref), v9 (ref)
            local v23 = v8();
            local v24 = v4("Test");
            local function v25() --[[ Line: 79 ]] --[[ Name: Listener ]]
                -- upvalues: v5 (ref), v24 (copy), v23 (copy)
                return v5(v24.Consumer, {
                    render = v23.value
                });
            end;
            local v26 = v5(v24.Provider, {
                value = "NewTest"
            }, {
                Listener = v5(v25)
            });
            local v27 = v9.mountVirtualTree(v26, nil, "Provide Tree");
            v9.unmountVirtualTree(v27);
            v23:assertCalledWith("NewTest");
        end);
        it("should update when the value updates", function() --[[ Line: 97 ]]
            -- upvalues: v8 (ref), v4 (ref), v5 (ref), v9 (ref)
            local v28 = v8();
            local v29 = v4("Test");
            local function v30() --[[ Line: 101 ]] --[[ Name: Listener ]]
                -- upvalues: v5 (ref), v29 (copy), v28 (copy)
                return v5(v29.Consumer, {
                    render = v28.value
                });
            end;
            local v31 = v5(v29.Provider, {
                value = "NewTest"
            }, {
                Listener = v5(v30)
            });
            local v32 = v9.mountVirtualTree(v31, nil, "Provide Tree");
            expect(v28.callCount).to.equal(1);
            v28:assertCalledWith("NewTest");
            v9.updateVirtualTree(v32, v5(v29.Provider, {
                value = "ThirdTest"
            }, {
                Listener = v5(v30)
            }));
            expect(v28.callCount).to.equal(2);
            v28:assertCalledWith("ThirdTest");
            v9.unmountVirtualTree(v32);
        end);
        it("should update when the value updates through an update blocking component", function() --[[ Line: 138 ]]
            -- upvalues: v8 (ref), v4 (ref), v1 (ref), v6 (ref), v3 (ref), v5 (ref), v9 (ref)
            local v33 = v8();
            local v34 = v4("Test");
            local v35 = v1:extend("UpdateBlocker");
            v35.render = function(v36) --[[ Line: 144 ]] --[[ Name: render ]]
                -- upvalues: v6 (ref), v3 (ref)
                return v6(v36.props[v3]);
            end;
            v35.shouldUpdate = function(_) --[[ Line: 148 ]] --[[ Name: shouldUpdate ]]
                return false;
            end;
            local function v38() --[[ Line: 152 ]] --[[ Name: Listener ]]
                -- upvalues: v5 (ref), v34 (copy), v33 (copy)
                return v5(v34.Consumer, {
                    render = v33.value
                });
            end;
            local v39 = v5(v34.Provider, {
                value = "NewTest"
            }, {
                Blocker = v5(v35, nil, {
                    Listener = v5(v38)
                })
            });
            local v40 = v9.mountVirtualTree(v39, nil, "Provide Tree");
            expect(v33.callCount).to.equal(1);
            v33:assertCalledWith("NewTest");
            v9.updateVirtualTree(v40, v5(v34.Provider, {
                value = "ThirdTest"
            }, {
                Blocker = v5(v35, nil, {
                    Listener = v5(v38)
                })
            }));
            expect(v33.callCount).to.equal(2);
            v33:assertCalledWith("ThirdTest");
            v9.unmountVirtualTree(v40);
        end);
        it("should behave correctly when the default value is nil", function() --[[ Line: 188 ]]
            -- upvalues: v4 (ref), v8 (ref), v5 (ref), v9 (ref)
            local v41 = v4(nil);
            local v42 = v8();
            local function v43() --[[ Line: 192 ]] --[[ Name: Listener ]]
                -- upvalues: v5 (ref), v41 (copy), v42 (copy)
                return v5(v41.Consumer, {
                    render = v42.value
                });
            end;
            local v44 = v9.mountVirtualTree(v5(v43), nil, "Provide Tree");
            expect(v42.callCount).to.equal(1);
            v42:assertCalledWith(nil);
            v44 = v9.updateVirtualTree(v44, v5(v43));
            v9.unmountVirtualTree(v44);
            expect(v42.callCount).to.equal(2);
            v42:assertCalledWith(nil);
        end);
    end);
    describe("Update order", function() --[[ Line: 210 ]]
        -- upvalues: v4 (copy), v5 (copy), v9 (copy)
        it("should update context at the same time as props", function() --[[ Line: 264 ]]
            -- upvalues: v4 (ref), v5 (ref), v9 (ref)
            local v45 = false;
            local v46 = false;
            local v47 = 0;
            local v48 = v4("default");
            local function v51(v49) --[[ Line: 273 ]] --[[ Name: Listener ]]
                -- upvalues: v5 (ref), v48 (copy), v47 (ref), v45 (ref), v46 (ref)
                return v5(v48.Consumer, {
                    render = function(v50) --[[ Line: 275 ]] --[[ Name: render ]]
                        -- upvalues: v47 (ref), v49 (copy), v45 (ref), v46 (ref)
                        v47 = v47 + 1;
                        if v50 == "context_1" then
                            expect(v49.someProp).to.equal("prop_1");
                            v45 = true;
                            return;
                        elseif v50 == "context_2" then
                            expect(v49.someProp).to.equal("prop_2");
                            v46 = true;
                            return;
                        else
                            error("Unexpected context value");
                            return;
                        end;
                    end
                });
            end;
            local v52 = v5(v48.Provider, {
                value = "context_1"
            }, {
                Child = v5(v51, {
                    someProp = "prop_1"
                })
            });
            local v53 = v5(v48.Provider, {
                value = "context_2"
            }, {
                Child = v5(v51, {
                    someProp = "prop_2"
                })
            });
            local v54 = v9.mountVirtualTree(v52, nil, "UpdateObservationIsFun");
            v9.updateVirtualTree(v54, v53);
            expect(v47).to.equal(2);
            expect(v45).to.equal(true);
            expect(v46).to.equal(true);
        end);
    end);
    it("does not throw if willUnmount is called twice on a context consumer", function() --[[ Line: 317 ]]
        -- upvalues: v4 (copy), v1 (copy), v5 (copy), l_ReplicatedStorage_0 (copy), v10 (copy)
        local v55 = v4({});
        local v56 = v1:extend("LowestComponent");
        v56.init = function(_) --[[ Line: 321 ]] --[[ Name: init ]]

        end;
        v56.render = function(_) --[[ Line: 323 ]] --[[ Name: render ]]
            -- upvalues: v5 (ref)
            return v5("Frame");
        end;
        v56.didMount = function(v59) --[[ Line: 327 ]] --[[ Name: didMount ]]
            v59.props.onDidMountCallback();
        end;
        local v60 = v1:extend("FirstComponent");
        v60.init = function(_) --[[ Line: 332 ]] --[[ Name: init ]]

        end;
        v60.render = function(_) --[[ Line: 334 ]] --[[ Name: render ]]
            -- upvalues: v5 (ref), v55 (copy)
            return v5(v55.Consumer, {
                render = function() --[[ Line: 336 ]] --[[ Name: render ]]
                    -- upvalues: v5 (ref)
                    return v5("TextLabel");
                end
            });
        end;
        local v63 = v1:extend("ChildComponent");
        v63.init = function(v64) --[[ Line: 344 ]] --[[ Name: init ]]
            v64:setState({
                firstTime = true
            });
        end;
        local v65 = nil;
        v63.render = function(v66) --[[ Line: 350 ]] --[[ Name: render ]]
            -- upvalues: v5 (ref), v60 (copy), v56 (copy)
            if v66.state.firstTime then
                return v5(v60);
            else
                return v5(v56, {
                    onDidMountCallback = v66.props.onDidMountCallback
                });
            end;
        end;
        v63.didMount = function(v67) --[[ Line: 360 ]] --[[ Name: didMount ]]
            -- upvalues: v65 (ref)
            v65 = function() --[[ Line: 361 ]]
                -- upvalues: v67 (copy)
                v67:setState({
                    firstTime = false
                });
            end;
        end;
        local v68 = v1:extend("ParentComponent");
        local v69 = 0;
        v68.init = function(v70) --[[ Line: 370 ]] --[[ Name: init ]]
            -- upvalues: v69 (ref)
            v70:setState({
                count = 1
            });
            v70.onDidMountCallback = function() --[[ Line: 373 ]]
                -- upvalues: v69 (ref), v70 (copy)
                v69 = v69 + 1;
                if v70.state.count < 5 then
                    v70:setState({
                        count = v70.state.count + 1
                    });
                end;
            end;
        end;
        v68.render = function(v71) --[[ Line: 381 ]] --[[ Name: render ]]
            -- upvalues: v5 (ref), v55 (copy), v63 (copy)
            return v5("Frame", {}, {
                Provider = v5(v55.Provider, {
                    value = {}
                }, {
                    ChildComponent = v5(v63, {
                        count = v71.state.count, 
                        onDidMountCallback = v71.onDidMountCallback
                    })
                })
            });
        end;
        local l_ScreenGui_0 = Instance.new("ScreenGui");
        l_ScreenGui_0.Parent = l_ReplicatedStorage_0;
        v10.mountVirtualNode(v5(v68), l_ScreenGui_0, "Some Key");
        expect(function() --[[ Line: 400 ]]
            -- upvalues: v65 (ref)
            v65();
        end).never.to.throw();
    end);
end;