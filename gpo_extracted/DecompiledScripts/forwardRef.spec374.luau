return function() --[[ Line: 4 ]]
    local v0 = require(script.Parent.assign);
    local v1 = require(script.Parent.createElement);
    local v2 = require(script.Parent.createRef);
    local v3 = require(script.Parent.forwardRef);
    local v4 = require(script.Parent.createReconciler);
    local v5 = require(script.Parent.Component);
    local v6 = require(script.Parent.GlobalConfig);
    local v7 = require(script.Parent.PropMarkers.Ref);
    local v8 = v4((require(script.Parent.RobloxRenderer)));
    it("should update refs when switching between children", function() --[[ Line: 18 ]]
        -- upvalues: v1 (copy), v7 (copy), v3 (copy), v0 (copy), v2 (copy), v8 (copy)
        local function v14(v9) --[[ Line: 19 ]] --[[ Name: FunctionComponent ]]
            -- upvalues: v1 (ref), v7 (ref)
            local l_forwardedRef_0 = v9.forwardedRef;
            local l_setRefOnDiv_0 = v9.setRefOnDiv;
            local v12 = nil;
            local v13 = nil;
            if l_setRefOnDiv_0 then
                v12 = l_forwardedRef_0;
            else
                v13 = l_forwardedRef_0;
            end;
            return v1("Frame", nil, {
                First = v1("Frame", {
                    [v7] = v12
                }, {
                    Child = v1("TextLabel", {
                        Text = "First"
                    })
                }), 
                Second = v1("ScrollingFrame", {
                    [v7] = v13
                }, {
                    Child = v1("TextLabel", {
                        Text = "Second"
                    })
                })
            });
        end;
        local v17 = v3(function(v15, v16) --[[ Line: 48 ]]
            -- upvalues: v1 (ref), v14 (copy), v0 (ref)
            return v1(v14, v0({}, v15, {
                forwardedRef = v16
            }));
        end);
        local v18 = v2();
        local v19 = v1(v17, {
            [v7] = v18, 
            setRefOnDiv = true
        });
        local v20 = v8.mountVirtualTree(v19, nil, "switch refs");
        expect(v18.current.ClassName).to.equal("Frame");
        v8.unmountVirtualTree(v20);
        v19 = v1(v17, {
            [v7] = v18, 
            setRefOnDiv = false
        });
        v20 = v8.mountVirtualTree(v19, nil, "switch refs");
        expect(v18.current.ClassName).to.equal("ScrollingFrame");
        v8.unmountVirtualTree(v20);
    end);
    it("should support rendering nil", function() --[[ Line: 71 ]]
        -- upvalues: v3 (copy), v2 (copy), v1 (copy), v7 (copy), v8 (copy)
        local v23 = v3(function(_, _) --[[ Line: 72 ]]
            return nil;
        end);
        local v24 = v2();
        local v25 = v1(v23, {
            [v7] = v24
        });
        local v26 = v8.mountVirtualTree(v25, nil, "nil ref");
        expect(v24.current).to.equal(nil);
        v8.unmountVirtualTree(v26);
    end);
    it("should support rendering nil for multiple children", function() --[[ Line: 84 ]]
        -- upvalues: v3 (copy), v2 (copy), v1 (copy), v7 (copy), v8 (copy)
        local v29 = v3(function(_, _) --[[ Line: 85 ]]
            return nil;
        end);
        local v30 = v2();
        local v31 = v1("Frame", nil, {
            NoRef1 = v1("Frame"), 
            WithRef = v1(v29, {
                [v7] = v30
            }), 
            NoRef2 = v1("Frame")
        });
        local v32 = v8.mountVirtualTree(v31, nil, "multiple children nil ref");
        expect(v30.current).to.equal(nil);
        v8.unmountVirtualTree(v32);
    end);
    itSKIP("should support defaultProps", function() --[[ Line: 103 ]]
        -- upvalues: v1 (copy), v7 (copy), v3 (copy), v0 (copy), v2 (copy), v8 (copy)
        local function v37(v33) --[[ Line: 104 ]] --[[ Name: FunctionComponent ]]
            -- upvalues: v1 (ref), v7 (ref)
            local l_forwardedRef_1 = v33.forwardedRef;
            local l_optional_0 = v33.optional;
            local l_required_0 = v33.required;
            return v1("Frame", {
                [v7] = l_forwardedRef_1
            }, {
                OptionalChild = l_optional_0, 
                RequiredChild = l_required_0
            });
        end;
        local v40 = v3(function(v38, v39) --[[ Line: 116 ]]
            -- upvalues: v1 (ref), v37 (copy), v0 (ref)
            return v1(v37, v0({}, v38, {
                forwardedRef = v39
            }));
        end);
        v40.defaultProps = {
            optional = v1("TextLabel")
        };
        local v41 = v2();
        local v42 = v1(v40, {
            [v7] = v41, 
            optional = v1("Frame"), 
            required = v1("ScrollingFrame")
        });
        local v43 = v8.mountVirtualTree(v42, nil, "with optional");
        expect(v41.current:FindFirstChild("OptionalChild").ClassName).to.equal("Frame");
        expect(v41.current:FindFirstChild("RequiredChild").ClassName).to.equal("ScrollingFrame");
        v8.unmountVirtualTree(v43);
        v42 = v1(v40, {
            [v7] = v41, 
            required = v1("ScrollingFrame")
        });
        v43 = v8.mountVirtualTree(v42, nil, "with default");
        expect(v41.current:FindFirstChild("OptionalChild").ClassName).to.equal("TextLabel");
        expect(v41.current:FindFirstChild("RequiredChild").ClassName).to.equal("ScrollingFrame");
        v8.unmountVirtualTree(v43);
    end);
    it("should error if not provided a callback when type checking is enabled", function() --[[ Line: 153 ]]
        -- upvalues: v6 (copy), v3 (copy)
        v6.scoped({
            typeChecks = true
        }, function() --[[ Line: 156 ]]
            -- upvalues: v3 (ref)
            expect(function() --[[ Line: 157 ]]
                -- upvalues: v3 (ref)
                v3(nil);
            end).to.throw();
        end);
        v6.scoped({
            typeChecks = true
        }, function() --[[ Line: 164 ]]
            -- upvalues: v3 (ref)
            expect(function() --[[ Line: 165 ]]
                -- upvalues: v3 (ref)
                v3("foo");
            end).to.throw();
        end);
    end);
    it("should work without a ref to be forwarded", function() --[[ Line: 171 ]]
        -- upvalues: v1 (copy), v0 (copy), v7 (copy), v3 (copy), v8 (copy)
        local function v44() --[[ Line: 172 ]] --[[ Name: Child ]]
            return nil;
        end;
        local function v46(v45) --[[ Line: 176 ]] --[[ Name: Wrapper ]]
            -- upvalues: v1 (ref), v44 (copy), v0 (ref), v7 (ref)
            return v1(v44, v0({}, v45, {
                [v7] = v45.forwardedRef
            }));
        end;
        local v49 = v3(function(v47, v48) --[[ Line: 180 ]]
            -- upvalues: v1 (ref), v46 (copy), v0 (ref)
            return v1(v46, v0({}, v47, {
                forwardedRef = v48
            }));
        end);
        local v50 = v1(v49, {
            value = 123
        });
        local v51 = v8.mountVirtualTree(v50, nil, "nil ref");
        v8.unmountVirtualTree(v51);
    end);
    it("should forward a ref for a single child", function() --[[ Line: 189 ]]
        -- upvalues: v1 (copy), v7 (copy), v0 (copy), v3 (copy), v2 (copy), v8 (copy)
        local v52 = nil;
        local function v54(v53) --[[ Line: 191 ]] --[[ Name: Child ]]
            -- upvalues: v52 (ref), v1 (ref), v7 (ref)
            v52 = v53.value;
            return v1("Frame", {
                [v7] = v53[v7]
            });
        end;
        local function v56(v55) --[[ Line: 198 ]] --[[ Name: Wrapper ]]
            -- upvalues: v1 (ref), v54 (copy), v0 (ref), v7 (ref)
            return v1(v54, v0({}, v55, {
                [v7] = v55.forwardedRef
            }));
        end;
        local v59 = v3(function(v57, v58) --[[ Line: 202 ]]
            -- upvalues: v1 (ref), v56 (copy), v0 (ref)
            return v1(v56, v0({}, v57, {
                forwardedRef = v58
            }));
        end);
        local v60 = v2();
        local v61 = v1(v59, {
            [v7] = v60, 
            value = 123
        });
        local v62 = v8.mountVirtualTree(v61, nil, "single child ref");
        expect(v52).to.equal(123);
        expect(v60.current.ClassName).to.equal("Frame");
        v8.unmountVirtualTree(v62);
    end);
    it("should forward a ref for multiple children", function() --[[ Line: 215 ]]
        -- upvalues: v1 (copy), v7 (copy), v0 (copy), v3 (copy), v2 (copy), v8 (copy)
        local function v64(v63) --[[ Line: 216 ]] --[[ Name: Child ]]
            -- upvalues: v1 (ref), v7 (ref)
            return v1("Frame", {
                [v7] = v63[v7]
            });
        end;
        local function v66(v65) --[[ Line: 222 ]] --[[ Name: Wrapper ]]
            -- upvalues: v1 (ref), v64 (copy), v0 (ref), v7 (ref)
            return v1(v64, v0({}, v65, {
                [v7] = v65.forwardedRef
            }));
        end;
        local v69 = v3(function(v67, v68) --[[ Line: 226 ]]
            -- upvalues: v1 (ref), v66 (copy), v0 (ref)
            return v1(v66, v0({}, v67, {
                forwardedRef = v68
            }));
        end);
        local v70 = v2();
        local v71 = v1("Frame", nil, {
            NoRef1 = v1("Frame"), 
            WithRef = v1(v69, {
                [v7] = v70
            }), 
            NoRef2 = v1("Frame")
        });
        local v72 = v8.mountVirtualTree(v71, nil, "multi child ref");
        expect(v70.current.ClassName).to.equal("Frame");
        v8.unmountVirtualTree(v72);
    end);
    it("should maintain child instance and ref through updates", function() --[[ Line: 242 ]]
        -- upvalues: v1 (copy), v7 (copy), v0 (copy), v3 (copy), v8 (copy)
        local v73 = nil;
        local function v75(v74) --[[ Line: 244 ]] --[[ Name: Child ]]
            -- upvalues: v73 (ref), v1 (ref), v7 (ref)
            v73 = v74.value;
            return v1("Frame", {
                [v7] = v74[v7]
            });
        end;
        local function v77(v76) --[[ Line: 251 ]] --[[ Name: Wrapper ]]
            -- upvalues: v1 (ref), v75 (copy), v0 (ref), v7 (ref)
            return v1(v75, v0({}, v76, {
                [v7] = v76.forwardedRef
            }));
        end;
        local v80 = v3(function(v78, v79) --[[ Line: 255 ]]
            -- upvalues: v1 (ref), v77 (copy), v0 (ref)
            return v1(v77, v0({}, v78, {
                forwardedRef = v79
            }));
        end);
        local v81 = 0;
        local v82 = nil;
        local function v84(v83) --[[ Line: 262 ]]
            -- upvalues: v81 (ref), v82 (ref)
            v81 = v81 + 1;
            v82 = v83;
        end;
        local v85 = v1(v80, {
            [v7] = v84, 
            value = 123
        });
        local v86 = v8.mountVirtualTree(v85, nil, "maintains instance");
        expect(v73).to.equal(123);
        expect(v82.ClassName).to.equal("Frame");
        expect(v81).to.equal(1);
        v85 = v1(v80, {
            [v7] = v84, 
            value = 456
        });
        v86 = v8.updateVirtualTree(v86, v85);
        expect(v73).to.equal(456);
        expect(v81).to.equal(1);
        v8.unmountVirtualTree(v86);
    end);
    it("should not re-run the render callback on a deep setState", function() --[[ Line: 282 ]]
        -- upvalues: v5 (copy), v1 (copy), v7 (copy), v3 (copy), v0 (copy), v8 (copy)
        local v87 = nil;
        local v88 = {};
        local v89 = v5:extend("Inner");
        v89.render = function(v90) --[[ Line: 287 ]] --[[ Name: render ]]
            -- upvalues: v88 (ref), v87 (ref), v1 (ref), v7 (ref)
            table.insert(v88, "Inner");
            v87 = v90;
            return v1("Frame", {
                [v7] = v90.props.forwardedRef
            });
        end;
        local function v92(v91) --[[ Line: 293 ]] --[[ Name: Middle ]]
            -- upvalues: v88 (ref), v1 (ref), v89 (copy)
            table.insert(v88, "Middle");
            return v1(v89, v91);
        end;
        local v95 = v3(function(v93, v94) --[[ Line: 298 ]]
            -- upvalues: v88 (ref), v1 (ref), v92 (copy), v0 (ref)
            table.insert(v88, "Forward");
            return v1(v92, v0({}, v93, {
                forwardedRef = v94
            }));
        end);
        local function v96() --[[ Line: 303 ]] --[[ Name: App ]]
            -- upvalues: v88 (ref), v1 (ref), v95 (copy)
            table.insert(v88, "App");
            return v1(v95);
        end;
        local v97 = v8.mountVirtualTree(v1(v96), nil, "deep setState");
        expect(#v88).to.equal(4);
        expect(v88[1]).to.equal("App");
        expect(v88[2]).to.equal("Forward");
        expect(v88[3]).to.equal("Middle");
        expect(v88[4]).to.equal("Inner");
        v88 = {};
        v87:setState({});
        expect(#v88).to.equal(1);
        expect(v88[1]).to.equal("Inner");
        v8.unmountVirtualTree(v97);
    end);
    it("should not include the ref in the forwarded props", function() --[[ Line: 322 ]]
        -- upvalues: v1 (copy), v7 (copy), v3 (copy), v0 (copy), v2 (copy), v8 (copy)
        local v98 = nil;
        local function v100(v99) --[[ Line: 324 ]] --[[ Name: CaptureProps ]]
            -- upvalues: v98 (ref), v1 (ref), v7 (ref)
            v98 = v99;
            return v1("Frame", {
                [v7] = v99.forwardedRef
            });
        end;
        local v103 = v3(function(v101, v102) --[[ Line: 329 ]]
            -- upvalues: v1 (ref), v100 (copy), v0 (ref)
            return v1(v100, v0({}, v101, {
                forwardedRef = v102
            }));
        end);
        local v104 = v2();
        local v105 = v1(v103, {
            [v7] = v104
        });
        local v106 = v8.mountVirtualTree(v105, nil, "no ref in props");
        expect(v98).to.be.ok();
        expect(v98.forwardedRef).to.equal(v104);
        expect(v98[v7]).to.equal(nil);
        v8.unmountVirtualTree(v106);
    end);
end;