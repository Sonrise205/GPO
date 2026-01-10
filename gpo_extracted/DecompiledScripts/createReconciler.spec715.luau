return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.assign);
    local v1 = require(script.Parent.createElement);
    local v2 = require(script.Parent.createFragment);
    local v3 = require(script.Parent.createSpy);
    local v4 = require(script.Parent.NoopRenderer);
    local v5 = require(script.Parent.Type);
    local v6 = require(script.Parent.ElementKind);
    local v7 = require(script.Parent.createReconciler);
    local v8 = v7(v4);
    describe("tree operations", function() --[[ Line: 14 ]]
        -- upvalues: v8 (copy), v1 (copy)
        it("should mount and unmount", function() --[[ Line: 15 ]]
            -- upvalues: v8 (ref), v1 (ref)
            local v9 = v8.mountVirtualTree(v1("StringValue"));
            expect(v9).to.be.ok();
            v8.unmountVirtualTree(v9);
        end);
        it("should mount, update, and unmount", function() --[[ Line: 23 ]]
            -- upvalues: v8 (ref), v1 (ref)
            local v10 = v8.mountVirtualTree(v1("StringValue"));
            expect(v10).to.be.ok();
            v8.updateVirtualTree(v10, v1("StringValue"));
            v8.unmountVirtualTree(v10);
        end);
    end);
    describe("booleans", function() --[[ Line: 34 ]]
        -- upvalues: v8 (copy), v1 (copy)
        it("should mount booleans as nil", function() --[[ Line: 35 ]]
            -- upvalues: v8 (ref)
            local v11 = v8.mountVirtualNode(false, nil, "test");
            expect(v11).to.equal(nil);
        end);
        it("should unmount nodes if they are updated to a boolean value", function() --[[ Line: 40 ]]
            -- upvalues: v8 (ref), v1 (ref)
            local v12 = v8.mountVirtualNode(v1("StringValue"), nil, "test");
            expect(v12).to.be.ok();
            v12 = v8.updateVirtualNode(v12, true);
            expect(v12).to.equal(nil);
        end);
    end);
    describe("invalid elements", function() --[[ Line: 51 ]]
        -- upvalues: v8 (copy), v1 (copy)
        it("should throw errors when attempting to mount invalid elements", function() --[[ Line: 52 ]]
            -- upvalues: v8 (ref), v1 (ref)
            local function v13() --[[ Line: 54 ]]
                return "Hello";
            end;
            local function v14() --[[ Line: 57 ]]
                return 1;
            end;
            local function v15() --[[ Line: 60 ]]
                return function() --[[ Line: 61 ]]

                end;
            end;
            local function v16() --[[ Line: 63 ]]
                return {};
            end;
            expect(function() --[[ Line: 70 ]]
                -- upvalues: v8 (ref), v1 (ref), v13 (copy)
                v8.mountVirtualNode(v1(v13), nil, "Some Key");
            end).to.throw();
            expect(function() --[[ Line: 74 ]]
                -- upvalues: v8 (ref), v1 (ref), v14 (copy)
                v8.mountVirtualNode(v1(v14), nil, "Some Key");
            end).to.throw();
            expect(function() --[[ Line: 78 ]]
                -- upvalues: v8 (ref), v1 (ref), v15 (copy)
                v8.mountVirtualNode(v1(v15), nil, "Some Key");
            end).to.throw();
            expect(function() --[[ Line: 82 ]]
                -- upvalues: v8 (ref), v1 (ref), v16 (copy)
                v8.mountVirtualNode(v1(v16), nil, "Some Key");
            end).to.throw();
        end);
    end);
    describe("Host components", function() --[[ Line: 88 ]]
        -- upvalues: v3 (copy), v4 (copy), v0 (copy), v7 (copy), v1 (copy), v5 (copy)
        it("should invoke the renderer to mount host nodes", function() --[[ Line: 89 ]]
            -- upvalues: v3 (ref), v4 (ref), v0 (ref), v7 (ref), v1 (ref), v5 (ref)
            local v17 = v3(v4.mountHostNode);
            local v18 = v0({}, v4, {
                mountHostNode = v17.value
            });
            local v19 = v7(v18);
            local v20 = v1("StringValue");
            local v21 = v19.mountVirtualNode(v20, nil, "Some Key");
            expect(v5.of(v21)).to.equal(v5.VirtualNode);
            expect(v17.callCount).to.equal(1);
            local v22 = v17:captureValues("reconciler", "node");
            expect(v22.reconciler).to.equal(v19);
            expect(v22.node).to.equal(v21);
        end);
        it("should invoke the renderer to update host nodes", function() --[[ Line: 113 ]]
            -- upvalues: v3 (ref), v4 (ref), v0 (ref), v7 (ref), v1 (ref), v5 (ref)
            local v23 = v3(v4.updateHostNode);
            local v24 = v0({}, v4, {
                mountHostNode = v4.mountHostNode, 
                updateHostNode = v23.value
            });
            local v25 = v7(v24);
            local v26 = v1("StringValue");
            local v27 = v25.mountVirtualNode(v26, nil, "Key");
            expect(v5.of(v27)).to.equal(v5.VirtualNode);
            local v28 = v1("StringValue");
            local v29 = v25.updateVirtualNode(v27, v28);
            expect(v29).to.equal(v27);
            expect(v23.callCount).to.equal(1);
            local v30 = v23:captureValues("reconciler", "node", "newElement");
            expect(v30.reconciler).to.equal(v25);
            expect(v30.node).to.equal(v27);
            expect(v30.newElement).to.equal(v28);
        end);
        it("should invoke the renderer to unmount host nodes", function() --[[ Line: 144 ]]
            -- upvalues: v3 (ref), v4 (ref), v0 (ref), v7 (ref), v1 (ref), v5 (ref)
            local v31 = v3(v4.unmountHostNode);
            local v32 = v0({}, v4, {
                mountHostNode = v4.mountHostNode, 
                unmountHostNode = v31.value
            });
            local v33 = v7(v32);
            local v34 = v1("StringValue");
            local v35 = v33.mountVirtualNode(v34, nil, "Key");
            expect(v5.of(v35)).to.equal(v5.VirtualNode);
            v33.unmountVirtualNode(v35);
            expect(v31.callCount).to.equal(1);
            local v36 = v31:captureValues("reconciler", "node");
            expect(v36.reconciler).to.equal(v33);
            expect(v36.node).to.equal(v35);
        end);
    end);
    describe("Function components", function() --[[ Line: 172 ]]
        -- upvalues: v3 (copy), v1 (copy), v8 (copy), v5 (copy), v2 (copy)
        it("should mount and unmount function components", function() --[[ Line: 173 ]]
            -- upvalues: v3 (ref), v1 (ref), v8 (ref), v5 (ref)
            local v38 = v3(function(_) --[[ Line: 174 ]]
                return nil;
            end);
            local v39 = v1(v38.value, {
                someValue = 5
            });
            local v40 = v8.mountVirtualNode(v39, nil, "A Key");
            expect(v5.of(v40)).to.equal(v5.VirtualNode);
            expect(v38.callCount).to.equal(1);
            local v41 = v38:captureValues("props");
            expect(v41.props).to.be.a("table");
            expect(v41.props.someValue).to.equal(5);
            v8.unmountVirtualNode(v40);
            expect(v38.callCount).to.equal(1);
        end);
        it("should mount single children of function components", function() --[[ Line: 199 ]]
            -- upvalues: v3 (ref), v1 (ref), v8 (ref), v5 (ref)
            local v43 = v3(function(_) --[[ Line: 200 ]]
                return nil;
            end);
            local v45 = v3(function(v44) --[[ Line: 204 ]]
                -- upvalues: v1 (ref), v43 (copy)
                return v1(v43.value, {
                    value = v44.value + 1
                });
            end);
            local v46 = v1(v45.value, {
                value = 13
            });
            local v47 = v8.mountVirtualNode(v46, nil, "A Key");
            expect(v5.of(v47)).to.equal(v5.VirtualNode);
            expect(v45.callCount).to.equal(1);
            expect(v43.callCount).to.equal(1);
            local v48 = v45:captureValues("props");
            local v49 = v43:captureValues("props");
            expect(v48.props).to.be.a("table");
            expect(v48.props.value).to.equal(13);
            expect(v49.props).to.be.a("table");
            expect(v49.props.value).to.equal(14);
            v8.unmountVirtualNode(v47);
            expect(v45.callCount).to.equal(1);
            expect(v43.callCount).to.equal(1);
        end);
        it("should mount fragments returned by function components", function() --[[ Line: 237 ]]
            -- upvalues: v3 (ref), v2 (ref), v1 (ref), v8 (ref), v5 (ref)
            local v51 = v3(function(_) --[[ Line: 238 ]]
                return nil;
            end);
            local v53 = v3(function(_) --[[ Line: 242 ]]
                return nil;
            end);
            local v55 = v3(function(v54) --[[ Line: 246 ]]
                -- upvalues: v2 (ref), v1 (ref), v51 (copy), v53 (copy)
                return v2({
                    A = v1(v51.value, {
                        value = v54.value + 1
                    }), 
                    B = v1(v53.value, {
                        value = v54.value + 5
                    })
                });
            end);
            local v56 = v1(v55.value, {
                value = 17
            });
            local v57 = v8.mountVirtualNode(v56, nil, "A Key");
            expect(v5.of(v57)).to.equal(v5.VirtualNode);
            expect(v55.callCount).to.equal(1);
            expect(v51.callCount).to.equal(1);
            expect(v53.callCount).to.equal(1);
            local v58 = v55:captureValues("props");
            local v59 = v51:captureValues("props");
            local v60 = v53:captureValues("props");
            expect(v58.props).to.be.a("table");
            expect(v58.props.value).to.equal(17);
            expect(v59.props).to.be.a("table");
            expect(v59.props.value).to.equal(18);
            expect(v60.props).to.be.a("table");
            expect(v60.props.value).to.equal(22);
            v8.unmountVirtualNode(v57);
            expect(v55.callCount).to.equal(1);
            expect(v51.callCount).to.equal(1);
            expect(v53.callCount).to.equal(1);
        end);
    end);
    describe("Fragments", function() --[[ Line: 291 ]]
        -- upvalues: v2 (copy), v8 (copy), v6 (copy), v3 (copy), v1 (copy)
        it("should mount fragments", function() --[[ Line: 292 ]]
            -- upvalues: v2 (ref), v8 (ref), v6 (ref)
            local v61 = v2({});
            local v62 = v8.mountVirtualNode(v61, nil, "test");
            expect(v62).to.be.ok();
            expect(v6.of(v62.currentElement)).to.equal(v6.Fragment);
        end);
        it("should mount an empty fragment", function() --[[ Line: 300 ]]
            -- upvalues: v2 (ref), v8 (ref)
            local v63 = v2({});
            local v64 = v8.mountVirtualNode(v63, nil, "test");
            expect(v64).to.be.ok();
            local v65 = next(v64.children);
            expect(v65).to.never.be.ok();
        end);
        it("should mount all fragment's children", function() --[[ Line: 310 ]]
            -- upvalues: v3 (ref), v1 (ref), v2 (ref), v8 (ref)
            local v67 = v3(function(_) --[[ Line: 311 ]]
                return nil;
            end);
            local v68 = {};
            for v69 = 1, 5 do
                v68["key" .. tostring(v69)] = v1(v67.value, {});
            end;
            local v70 = v2(v68);
            local v71 = v8.mountVirtualNode(v70, nil, "test");
            expect(v71).to.be.ok();
            expect(v67.callCount).to.equal(5);
        end);
    end);
end;