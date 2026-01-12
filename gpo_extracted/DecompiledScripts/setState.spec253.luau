return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.Parent.createElement);
    local v1 = require(script.Parent.Parent.createReconciler);
    local v2 = require(script.Parent.Parent.createSpy);
    local v3 = require(script.Parent.Parent.None);
    local v4 = require(script.Parent.Parent.NoopRenderer);
    local v5 = require(script.Parent.Parent.Component);
    local v6 = v1(v4);
    describe("setState", function() --[[ Line: 12 ]]
        -- upvalues: v5 (copy), v0 (copy), v6 (copy), v3 (copy)
        it("should not trigger an extra update when called in init", function() --[[ Line: 13 ]]
            -- upvalues: v5 (ref), v0 (ref), v6 (ref)
            local v7 = 0;
            local v8 = 0;
            local v9 = nil;
            local v10 = v5:extend("InitComponent");
            v10.init = function(v11) --[[ Line: 20 ]] --[[ Name: init ]]
                v11:setState({
                    a = 1
                });
            end;
            v10.willUpdate = function(_) --[[ Line: 26 ]] --[[ Name: willUpdate ]]
                -- upvalues: v8 (ref)
                v8 = v8 + 1;
            end;
            v10.render = function(v13) --[[ Line: 30 ]] --[[ Name: render ]]
                -- upvalues: v7 (ref), v9 (ref)
                v7 = v7 + 1;
                v9 = v13.state;
                return nil;
            end;
            local v14 = v0(v10);
            v6.mountVirtualTree(v14);
            expect(v7).to.equal(1);
            expect(v8).to.equal(0);
            expect(v9.a).to.equal(1);
        end);
        it("should throw when called in render", function() --[[ Line: 45 ]]
            -- upvalues: v5 (ref), v0 (ref), v6 (ref)
            local v15 = v5:extend("TestComponent");
            v15.render = function(v16) --[[ Line: 48 ]] --[[ Name: render ]]
                v16:setState({
                    a = 1
                });
            end;
            local v17 = v0(v15);
            local l_status_0, l_result_0 = pcall(v6.mountVirtualTree, v17);
            expect(l_status_0).to.equal(false);
            expect(l_result_0:match("render")).to.be.ok();
            expect(l_result_0:match("TestComponent")).to.be.ok();
        end);
        it("should throw when called in shouldUpdate", function() --[[ Line: 63 ]]
            -- upvalues: v5 (ref), v0 (ref), v6 (ref)
            local v20 = v5:extend("TestComponent");
            v20.render = function(_) --[[ Line: 66 ]] --[[ Name: render ]]
                return nil;
            end;
            v20.shouldUpdate = function(v22) --[[ Line: 70 ]] --[[ Name: shouldUpdate ]]
                v22:setState({
                    a = 1
                });
            end;
            local v23 = v0(v20);
            local v24 = v0(v20);
            local v25 = v6.mountVirtualTree(v23);
            local l_status_1, l_result_1 = pcall(v6.updateVirtualTree, v25, v24);
            expect(l_status_1).to.equal(false);
            expect(l_result_1:match("shouldUpdate")).to.be.ok();
            expect(l_result_1:match("TestComponent")).to.be.ok();
        end);
        it("should throw when called in willUpdate", function() --[[ Line: 88 ]]
            -- upvalues: v5 (ref), v0 (ref), v6 (ref)
            local v28 = v5:extend("TestComponent");
            v28.render = function(_) --[[ Line: 91 ]] --[[ Name: render ]]
                return nil;
            end;
            v28.willUpdate = function(v30) --[[ Line: 95 ]] --[[ Name: willUpdate ]]
                v30:setState({
                    a = 1
                });
            end;
            local v31 = v0(v28);
            local v32 = v0(v28);
            local v33 = v6.mountVirtualTree(v31);
            local l_status_2, l_result_2 = pcall(v6.updateVirtualTree, v33, v32);
            expect(l_status_2).to.equal(false);
            expect(l_result_2:match("willUpdate")).to.be.ok();
            expect(l_result_2:match("TestComponent")).to.be.ok();
        end);
        it("should not throw when called in willUnmount", function() --[[ Line: 112 ]]
            -- upvalues: v5 (ref), v0 (ref), v6 (ref)
            local v36 = v5:extend("TestComponent");
            v36.render = function(_) --[[ Line: 115 ]] --[[ Name: render ]]
                return nil;
            end;
            v36.willUnmount = function(v38) --[[ Line: 119 ]] --[[ Name: willUnmount ]]
                v38:setState({
                    a = 1
                });
            end;
            local v39 = v0(v36);
            local v40 = v6.mountVirtualTree(v39);
            local l_status_3, _ = pcall(v6.unmountVirtualTree, v40);
            expect(l_status_3).to.equal(true);
        end);
        it("should remove values from state when the value is None", function() --[[ Line: 133 ]]
            -- upvalues: v5 (ref), v0 (ref), v6 (ref), v3 (ref)
            local v43 = v5:extend("TestComponent");
            local v44 = nil;
            local v45 = nil;
            v43.init = function(v46) --[[ Line: 137 ]] --[[ Name: init ]]
                -- upvalues: v44 (ref), v45 (ref)
                v44 = function(v47) --[[ Line: 138 ]]
                    -- upvalues: v46 (copy)
                    v46:setState(v47);
                end;
                v45 = function() --[[ Line: 142 ]]
                    -- upvalues: v46 (copy)
                    return v46.state;
                end;
                v46:setState({
                    value = 0
                });
            end;
            v43.render = function(_) --[[ Line: 151 ]] --[[ Name: render ]]
                return nil;
            end;
            local v49 = v0(v43);
            local v50 = v6.mountVirtualNode(v49, nil, "Test");
            expect(v45().value).to.equal(0);
            v44({
                value = v3
            });
            expect(v45().value).to.equal(nil);
            v6.unmountVirtualNode(v50);
        end);
        it("should invoke functions to compute a partial state", function() --[[ Line: 169 ]]
            -- upvalues: v5 (ref), v0 (ref), v6 (ref)
            local v51 = v5:extend("TestComponent");
            local v52 = nil;
            local v53 = nil;
            local v54 = nil;
            v51.init = function(v55) --[[ Line: 173 ]] --[[ Name: init ]]
                -- upvalues: v52 (ref), v53 (ref), v54 (ref)
                v52 = function(v56) --[[ Line: 174 ]]
                    -- upvalues: v55 (copy)
                    v55:setState(v56);
                end;
                v53 = function() --[[ Line: 178 ]]
                    -- upvalues: v55 (copy)
                    return v55.state;
                end;
                v54 = function() --[[ Line: 182 ]]
                    -- upvalues: v55 (copy)
                    return v55.props;
                end;
                v55:setState({
                    value = 0
                });
            end;
            v51.render = function(_) --[[ Line: 191 ]] --[[ Name: render ]]
                return nil;
            end;
            local v58 = v0(v51);
            local v59 = v6.mountVirtualNode(v58, nil, "Test");
            expect(v53().value).to.equal(0);
            v52(function(v60, v61) --[[ Line: 200 ]]
                -- upvalues: v53 (ref), v54 (ref)
                expect(v60).to.equal(v53());
                expect(v61).to.equal(v54());
                return {
                    value = v60.value + 1
                };
            end);
            expect(v53().value).to.equal(1);
            v6.unmountVirtualNode(v59);
        end);
        it("should cancel rendering if the function returns nil", function() --[[ Line: 214 ]]
            -- upvalues: v5 (ref), v0 (ref), v6 (ref)
            local v62 = v5:extend("TestComponent");
            local v63 = nil;
            local v64 = 0;
            v62.init = function(v65) --[[ Line: 219 ]] --[[ Name: init ]]
                -- upvalues: v63 (ref)
                v63 = function(v66) --[[ Line: 220 ]]
                    -- upvalues: v65 (copy)
                    v65:setState(v66);
                end;
                v65:setState({
                    value = 0
                });
            end;
            v62.render = function(_) --[[ Line: 229 ]] --[[ Name: render ]]
                -- upvalues: v64 (ref)
                v64 = v64 + 1;
                return nil;
            end;
            local v68 = v0(v62);
            local v69 = v6.mountVirtualNode(v68, nil, "Test");
            expect(v64).to.equal(1);
            v63(function(_, _) --[[ Line: 238 ]]
                return nil;
            end);
            expect(v64).to.equal(1);
            v6.unmountVirtualNode(v69);
        end);
    end);
    describe("setState suspension", function() --[[ Line: 248 ]]
        -- upvalues: v5 (copy), v0 (copy), v6 (copy), v2 (copy)
        it("should defer setState triggered while reconciling", function() --[[ Line: 249 ]]
            -- upvalues: v5 (ref), v0 (ref), v6 (ref)
            local v72 = v5:extend("Child");
            local v73 = nil;
            v72.render = function(_) --[[ Line: 253 ]] --[[ Name: render ]]
                return nil;
            end;
            v72.didMount = function(v75) --[[ Line: 257 ]] --[[ Name: didMount ]]
                v75.props.callback();
            end;
            local v76 = v5:extend("Parent");
            v76.init = function(v77) --[[ Line: 263 ]] --[[ Name: init ]]
                -- upvalues: v73 (ref)
                v73 = function() --[[ Line: 264 ]]
                    -- upvalues: v77 (copy)
                    return v77.state;
                end;
            end;
            v76.render = function(v78) --[[ Line: 269 ]] --[[ Name: render ]]
                -- upvalues: v0 (ref), v72 (copy)
                return v0(v72, {
                    callback = function() --[[ Line: 271 ]] --[[ Name: callback ]]
                        -- upvalues: v78 (copy)
                        v78:setState({
                            foo = "bar"
                        });
                    end
                });
            end;
            local v79 = v0(v76);
            local v80 = v6.mountVirtualNode(v79, nil, "Test");
            expect(v80).to.be.ok();
            expect(v73().foo).to.equal("bar");
        end);
        it("should defer setState triggered while reconciling during an update", function() --[[ Line: 289 ]]
            -- upvalues: v5 (ref), v0 (ref), v6 (ref)
            local v81 = v5:extend("Child");
            local v82 = nil;
            v81.render = function(_) --[[ Line: 293 ]] --[[ Name: render ]]
                return nil;
            end;
            v81.didUpdate = function(v84) --[[ Line: 297 ]] --[[ Name: didUpdate ]]
                v84.props.callback();
            end;
            local v85 = v5:extend("Parent");
            v85.init = function(v86) --[[ Line: 303 ]] --[[ Name: init ]]
                -- upvalues: v82 (ref)
                v82 = function() --[[ Line: 304 ]]
                    -- upvalues: v86 (copy)
                    return v86.state;
                end;
            end;
            v85.render = function(v87) --[[ Line: 309 ]] --[[ Name: render ]]
                -- upvalues: v0 (ref), v81 (copy)
                return v0(v81, {
                    callback = function() --[[ Line: 311 ]] --[[ Name: callback ]]
                        -- upvalues: v87 (copy)
                        if not v87.state.foo then
                            v87:setState({
                                foo = "bar"
                            });
                        end;
                    end
                });
            end;
            local v88 = v0(v85);
            local v89 = v6.mountVirtualNode(v88, nil, "Test");
            expect(v89).to.be.ok();
            expect(v82().foo).to.equal(nil);
            v89 = v6.updateVirtualNode(v89, v0(v85));
            expect(v89).to.be.ok();
            expect(v82().foo).to.equal("bar");
            v6.unmountVirtualNode(v89);
        end);
        it("should combine pending state changes properly", function() --[[ Line: 339 ]]
            -- upvalues: v5 (ref), v0 (ref), v6 (ref)
            local v90 = v5:extend("Child");
            local v91 = nil;
            v90.render = function(_) --[[ Line: 343 ]] --[[ Name: render ]]
                return nil;
            end;
            v90.didMount = function(v93) --[[ Line: 347 ]] --[[ Name: didMount ]]
                v93.props.callback("foo", 1);
                v93.props.callback("bar", 3);
            end;
            local v94 = v5:extend("Parent");
            v94.init = function(v95) --[[ Line: 354 ]] --[[ Name: init ]]
                -- upvalues: v91 (ref)
                v91 = function() --[[ Line: 355 ]]
                    -- upvalues: v95 (copy)
                    return v95.state;
                end;
            end;
            v94.render = function(v96) --[[ Line: 360 ]] --[[ Name: render ]]
                -- upvalues: v0 (ref), v90 (copy)
                return v0(v90, {
                    callback = function(v97, v98) --[[ Line: 362 ]] --[[ Name: callback ]]
                        -- upvalues: v96 (copy)
                        v96:setState({
                            [v97] = v98
                        });
                    end
                });
            end;
            local v99 = v0(v94);
            local v100 = v6.mountVirtualNode(v99, nil, "Test");
            expect(v100).to.be.ok();
            expect(v91().foo).to.equal(1);
            expect(v91().bar).to.equal(3);
            v6.unmountVirtualNode(v100);
        end);
        it("should abort properly when functional setState returns nil while deferred", function() --[[ Line: 383 ]]
            -- upvalues: v5 (ref), v2 (ref), v0 (ref), v6 (ref)
            local v101 = v5:extend("Child");
            v101.render = function(_) --[[ Line: 386 ]] --[[ Name: render ]]
                return nil;
            end;
            v101.didMount = function(v103) --[[ Line: 390 ]] --[[ Name: didMount ]]
                v103.props.callback();
            end;
            local v104 = v5:extend("Parent");
            local v106 = v2(function(v105) --[[ Line: 396 ]]
                -- upvalues: v0 (ref), v101 (copy)
                return v0(v101, {
                    callback = function() --[[ Line: 398 ]] --[[ Name: callback ]]
                        -- upvalues: v105 (copy)
                        v105:setState(function() --[[ Line: 399 ]]
                            return nil;
                        end);
                    end
                });
            end);
            v104.render = v106.value;
            local v107 = v0(v104);
            local v108 = v6.mountVirtualNode(v107, nil, "Test");
            expect(v108).to.be.ok();
            expect(v106.callCount).to.equal(1);
            v6.unmountVirtualNode(v108);
        end);
        it("should still apply pending state if a subsequent state update was aborted", function() --[[ Line: 421 ]]
            -- upvalues: v5 (ref), v0 (ref), v6 (ref)
            local v109 = v5:extend("Child");
            local v110 = nil;
            v109.render = function(_) --[[ Line: 425 ]] --[[ Name: render ]]
                return nil;
            end;
            v109.didMount = function(v112) --[[ Line: 429 ]] --[[ Name: didMount ]]
                v112.props.callback(function() --[[ Line: 430 ]]
                    return {
                        foo = 1
                    };
                end);
                v112.props.callback(function() --[[ Line: 435 ]]
                    return nil;
                end);
            end;
            local v113 = v5:extend("Parent");
            v113.init = function(v114) --[[ Line: 442 ]] --[[ Name: init ]]
                -- upvalues: v110 (ref)
                v110 = function() --[[ Line: 443 ]]
                    -- upvalues: v114 (copy)
                    return v114.state;
                end;
            end;
            v113.render = function(v115) --[[ Line: 448 ]] --[[ Name: render ]]
                -- upvalues: v0 (ref), v109 (copy)
                return v0(v109, {
                    callback = function(v116) --[[ Line: 450 ]] --[[ Name: callback ]]
                        -- upvalues: v115 (copy)
                        v115:setState(v116);
                    end
                });
            end;
            local v117 = v0(v113);
            local v118 = v6.mountVirtualNode(v117, nil, "Test");
            expect(v118).to.be.ok();
            expect(v110().foo).to.equal(1);
            v6.unmountVirtualNode(v118);
        end);
        it("should not re-process new state when pending state is present after update", function() --[[ Line: 468 ]]
            -- upvalues: v5 (ref), v0 (ref), v6 (ref)
            local v119 = nil;
            local v120 = nil;
            local v121 = v5:extend("MyComponent");
            v121.init = function(v122) --[[ Line: 474 ]] --[[ Name: init ]]
                -- upvalues: v119 (ref), v120 (ref)
                v122:setState({
                    hasUpdatedOnce = false, 
                    counter = 0
                });
                v119 = function(v123) --[[ Line: 480 ]]
                    -- upvalues: v122 (copy)
                    v122:setState(v123);
                end;
                v120 = function() --[[ Line: 484 ]]
                    -- upvalues: v122 (copy)
                    return v122.state;
                end;
            end;
            v121.render = function(_) --[[ Line: 489 ]] --[[ Name: render ]]
                return nil;
            end;
            v121.didUpdate = function(v125) --[[ Line: 493 ]] --[[ Name: didUpdate ]]
                if v125.state.hasUpdatedOnce == false then
                    v125:setState({
                        hasUpdatedOnce = true
                    });
                end;
            end;
            local v126 = v0(v121);
            v6.mountVirtualNode(v126, nil, "Test");
            expect(v120().hasUpdatedOnce).to.equal(false);
            expect(v120().counter).to.equal(0);
            v119(function(v127) --[[ Line: 510 ]]
                return {
                    counter = v127.counter + 1
                };
            end);
            expect(v120().hasUpdatedOnce).to.equal(true);
            expect(v120().counter).to.equal(1);
        end);
        it("should throw when an infinite update is triggered", function() --[[ Line: 520 ]]
            -- upvalues: v5 (ref), v0 (ref), v6 (ref)
            local v128 = v5:extend("InfiniteUpdater");
            v128.render = function(_) --[[ Line: 523 ]] --[[ Name: render ]]
                return nil;
            end;
            v128.didMount = function(v130) --[[ Line: 527 ]] --[[ Name: didMount ]]
                v130:setState({});
            end;
            v128.didUpdate = function(v131) --[[ Line: 531 ]] --[[ Name: didUpdate ]]
                v131:setState({});
            end;
            local v132 = v0(v128);
            local l_status_4, l_result_4 = pcall(v6.mountVirtualNode, v132, nil, "Test");
            expect(l_status_4).to.equal(false);
            expect(l_result_4:find("InfiniteUpdater")).to.be.ok();
            expect(l_result_4:find("reached the setState update recursion limit")).to.be.ok();
        end);
        itSKIP("should process single updates with both new and pending state", function() --[[ Line: 546 ]]

        end);
        it("should call trigger update after didMount when setting state in didMount", function() --[[ Line: 553 ]]
            -- upvalues: v5 (ref), v0 (ref), v6 (ref)
            local v135 = v5:extend("MyComponent");
            v135.init = function(v136) --[[ Line: 564 ]] --[[ Name: init ]]
                v136:setState({
                    status = "initial mount"
                });
                v136.isMounted = false;
            end;
            v135.render = function(_) --[[ Line: 572 ]] --[[ Name: render ]]
                return nil;
            end;
            v135.didMount = function(v138) --[[ Line: 576 ]] --[[ Name: didMount ]]
                v138:setState({
                    status = "mounted"
                });
                v138.isMounted = true;
            end;
            v135.didUpdate = function(v139, _, v141) --[[ Line: 584 ]] --[[ Name: didUpdate ]]
                expect(v141.status).to.equal("initial mount");
                expect(v139.state.status).to.equal("mounted");
                expect(v139.isMounted).to.equal(true);
            end;
            local v142 = v0(v135);
            local v143 = v6.mountVirtualNode(v142, nil, "Test");
            expect(v143).to.be.ok();
        end);
    end);
end;