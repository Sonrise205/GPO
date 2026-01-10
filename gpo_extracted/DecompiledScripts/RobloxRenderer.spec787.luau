return function() --[[ Line: 1 ]]
    local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
    local v1 = require(script.Parent.assertDeepEqual);
    local v2 = require(script.Parent.Binding);
    local v3 = require(script.Parent.PropMarkers.Children);
    local v4 = require(script.Parent.Component);
    local v5 = require(script.Parent.createElement);
    local v6 = require(script.Parent.createFragment);
    local v7 = require(script.Parent.createReconciler);
    local v8 = require(script.Parent.createRef);
    local v9 = require(script.Parent.createSpy);
    local v10 = require(script.Parent.GlobalConfig);
    local v11 = require(script.Parent.Portal);
    local v12 = require(script.Parent.PropMarkers.Ref);
    local v13 = require(script.Parent.PropMarkers.Event);
    local v14 = require(script.Parent.RobloxRenderer);
    local v15 = v7(v14);
    describe("mountHostNode", function() --[[ Line: 22 ]]
        -- upvalues: v5 (copy), v15 (copy), v14 (copy), v2 (copy), v8 (copy), v12 (copy), v9 (copy), v10 (copy)
        it("should create instances with correct props", function() --[[ Line: 23 ]]
            -- upvalues: v5 (ref), v15 (ref), v14 (ref)
            local l_Folder_0 = Instance.new("Folder");
            local v17 = v5("StringValue", {
                Value = "Hello!"
            });
            local v18 = v15.createVirtualNode(v17, l_Folder_0, "Some Key");
            v14.mountHostNode(v15, v18);
            expect(#l_Folder_0:GetChildren()).to.equal(1);
            local v19 = l_Folder_0:GetChildren()[1];
            expect(v19.ClassName).to.equal("StringValue");
            expect(v19.Value).to.equal("Hello!");
            expect(v19.Name).to.equal("Some Key");
        end);
        it("should create children with correct names and props", function() --[[ Line: 45 ]]
            -- upvalues: v5 (ref), v15 (ref), v14 (ref)
            local l_Folder_1 = Instance.new("Folder");
            local v21 = v5("StringValue", {
                Value = "Hey there!"
            }, {
                ChildA = v5("IntValue", {
                    Value = 173
                }), 
                ChildB = v5("Folder")
            });
            local v22 = v15.createVirtualNode(v21, l_Folder_1, "Some Key");
            v14.mountHostNode(v15, v22);
            expect(#l_Folder_1:GetChildren()).to.equal(1);
            local v23 = l_Folder_1:GetChildren()[1];
            expect(v23.ClassName).to.equal("StringValue");
            expect(v23.Value).to.equal("Hey there!");
            expect(v23.Name).to.equal("Some Key");
            expect(#v23:GetChildren()).to.equal(2);
            local l_ChildA_0 = v23.ChildA;
            local l_ChildB_0 = v23.ChildB;
            expect(l_ChildA_0).to.be.ok();
            expect(l_ChildB_0).to.be.ok();
            expect(l_ChildA_0.ClassName).to.equal("IntValue");
            expect(l_ChildA_0.Value).to.equal(173);
            expect(l_ChildB_0.ClassName).to.equal("Folder");
        end);
        it("should attach Bindings to Roblox properties", function() --[[ Line: 87 ]]
            -- upvalues: v2 (ref), v5 (ref), v15 (ref), v14 (ref)
            local l_Folder_2 = Instance.new("Folder");
            local v27, v28 = v2.create(10);
            local v29 = v5("IntValue", {
                Value = v27
            });
            local v30 = v15.createVirtualNode(v29, l_Folder_2, "Some Key");
            v14.mountHostNode(v15, v30);
            expect(#l_Folder_2:GetChildren()).to.equal(1);
            local v31 = l_Folder_2:GetChildren()[1];
            expect(v31.ClassName).to.equal("IntValue");
            expect(v31.Value).to.equal(10);
            v28(20);
            expect(v31.Value).to.equal(20);
            v14.unmountHostNode(v15, v30);
        end);
        it("should connect Binding refs", function() --[[ Line: 114 ]]
            -- upvalues: v8 (ref), v5 (ref), v12 (ref), v15 (ref), v14 (ref)
            local l_Folder_3 = Instance.new("Folder");
            local v33 = v8();
            local v34 = v5("Frame", {
                [v12] = v33
            });
            local v35 = v15.createVirtualNode(v34, l_Folder_3, "Some Key");
            v14.mountHostNode(v15, v35);
            expect(#l_Folder_3:GetChildren()).to.equal(1);
            local v36 = l_Folder_3:GetChildren()[1];
            expect(v33.current).to.be.ok();
            expect(v33.current).to.equal(v36);
            v14.unmountHostNode(v15, v35);
        end);
        it("should call function refs", function() --[[ Line: 137 ]]
            -- upvalues: v9 (ref), v5 (ref), v12 (ref), v15 (ref), v14 (ref)
            local l_Folder_4 = Instance.new("Folder");
            local v38 = v9();
            local v39 = v5("Frame", {
                [v12] = v38.value
            });
            local v40 = v15.createVirtualNode(v39, l_Folder_4, "Some Key");
            v14.mountHostNode(v15, v40);
            expect(#l_Folder_4:GetChildren()).to.equal(1);
            local v41 = l_Folder_4:GetChildren()[1];
            expect(v38.callCount).to.equal(1);
            v38:assertCalledWith(v41);
            v14.unmountHostNode(v15, v40);
        end);
        it("should throw if setting invalid instance properties", function() --[[ Line: 160 ]]
            -- upvalues: v10 (ref), v5 (ref), v15 (ref), v14 (ref)
            local v42 = {
                elementTracing = true
            };
            v10.scoped(v42, function() --[[ Line: 165 ]]
                -- upvalues: v5 (ref), v15 (ref), v14 (ref)
                local l_Folder_5 = Instance.new("Folder");
                local v44 = v5("Frame", {
                    Frob = 6
                });
                local v45 = v15.createVirtualNode(v44, l_Folder_5, "Some Key");
                local l_status_0, l_result_0 = pcall(v14.mountHostNode, v15, v45);
                assert(not l_status_0, "Expected call to fail");
                expect(l_result_0:find("Frob")).to.be.ok();
                expect(l_result_0:find("Frame")).to.be.ok();
                expect(l_result_0:find("RobloxRenderer%.spec")).to.be.ok();
            end);
        end);
    end);
    describe("updateHostNode", function() --[[ Line: 185 ]]
        -- upvalues: v5 (copy), v15 (copy), v14 (copy), v2 (copy), v8 (copy), v12 (copy), v9 (copy), v10 (copy)
        it("should update node props and children", function() --[[ Line: 186 ]]
            -- upvalues: v5 (ref), v15 (ref), v14 (ref)
            local l_Folder_6 = Instance.new("Folder");
            local l_Value_0 = Instance.new("StringValue").Value;
            local v50 = v5("StringValue", {
                Value = "foo"
            }, {
                ChildA = v5("IntValue", {
                    Value = 1
                }), 
                ChildB = v5("BoolValue", {
                    Value = true
                }), 
                ChildC = v5("StringValue", {
                    Value = "test"
                }), 
                ChildD = v5("StringValue", {
                    Value = "test"
                })
            });
            local v51 = v15.createVirtualNode(v50, l_Folder_6, "updateHostNodeTest");
            v14.mountHostNode(v15, v51);
            local v52 = v5("StringValue", {
                Value = "bar"
            }, {
                ChildA = v5("StringValue", {
                    Value = "test"
                }), 
                ChildB = v5("BoolValue", {
                    Value = false
                }), 
                ChildC = v5("StringValue", {}), 
                ChildE = v5("Folder", {})
            });
            v14.updateHostNode(v15, v51, v52);
            local l_updateHostNodeTest_0 = l_Folder_6.updateHostNodeTest;
            expect(l_updateHostNodeTest_0.ClassName).to.equal("StringValue");
            expect(l_updateHostNodeTest_0.Value).to.equal("bar");
            expect(#l_updateHostNodeTest_0:GetChildren()).to.equal(4);
            local l_ChildA_1 = l_updateHostNodeTest_0.ChildA;
            expect(l_ChildA_1.ClassName).to.equal("StringValue");
            expect(l_ChildA_1.Value).to.equal("test");
            local l_ChildB_1 = l_updateHostNodeTest_0.ChildB;
            expect(l_ChildB_1.ClassName).to.equal("BoolValue");
            expect(l_ChildB_1.Value).to.equal(false);
            local l_ChildC_0 = l_updateHostNodeTest_0.ChildC;
            expect(l_ChildC_0.ClassName).to.equal("StringValue");
            expect(l_ChildC_0.Value).to.equal(l_Value_0);
            local l_ChildE_0 = l_updateHostNodeTest_0.ChildE;
            expect(l_ChildE_0.ClassName).to.equal("Folder");
        end);
        it("should update Bindings", function() --[[ Line: 260 ]]
            -- upvalues: v2 (ref), v5 (ref), v15 (ref), v14 (ref)
            local l_Folder_7 = Instance.new("Folder");
            local v59, v60 = v2.create(10);
            local v61 = v5("IntValue", {
                Value = v59
            });
            local v62 = v15.createVirtualNode(v61, l_Folder_7, "Some Key");
            v14.mountHostNode(v15, v62);
            local v63 = l_Folder_7:GetChildren()[1];
            expect(v63.Value).to.equal(10);
            local v64, v65 = v2.create(99);
            local v66 = v5("IntValue", {
                Value = v64
            });
            v14.updateHostNode(v15, v62, v66);
            expect(v63.Value).to.equal(99);
            v60(123);
            expect(v63.Value).to.equal(99);
            v65(123);
            expect(v63.Value).to.equal(123);
            v14.unmountHostNode(v15, v62);
        end);
        it("should update Binding refs", function() --[[ Line: 297 ]]
            -- upvalues: v8 (ref), v5 (ref), v12 (ref), v15 (ref), v14 (ref)
            local l_Folder_8 = Instance.new("Folder");
            local v68 = v8();
            local v69 = v8();
            local v70 = v5("Frame", {
                [v12] = v68
            });
            local v71 = v15.createVirtualNode(v70, l_Folder_8, "Some Key");
            v14.mountHostNode(v15, v71);
            expect(#l_Folder_8:GetChildren()).to.equal(1);
            local v72 = l_Folder_8:GetChildren()[1];
            expect(v68.current).to.equal(v72);
            expect(v69.current).never.to.be.ok();
            local v73 = v5("Frame", {
                [v12] = v69
            });
            v14.updateHostNode(v15, v71, v73);
            expect(v68.current).never.to.be.ok();
            expect(v69.current).to.equal(v72);
            v14.unmountHostNode(v15, v71);
        end);
        it("should call old function refs with nil and new function refs with a valid rbx", function() --[[ Line: 331 ]]
            -- upvalues: v9 (ref), v5 (ref), v12 (ref), v15 (ref), v14 (ref)
            local l_Folder_9 = Instance.new("Folder");
            local v75 = v9();
            local v76 = v9();
            local v77 = v5("Frame", {
                [v12] = v75.value
            });
            local v78 = v15.createVirtualNode(v77, l_Folder_9, "Some Key");
            v14.mountHostNode(v15, v78);
            expect(#l_Folder_9:GetChildren()).to.equal(1);
            local v79 = l_Folder_9:GetChildren()[1];
            expect(v75.callCount).to.equal(1);
            v75:assertCalledWith(v79);
            expect(v76.callCount).to.equal(0);
            local v80 = v5("Frame", {
                [v12] = v76.value
            });
            v14.updateHostNode(v15, v78, v80);
            expect(v75.callCount).to.equal(2);
            v75:assertCalledWith(nil);
            expect(v76.callCount).to.equal(1);
            v76:assertCalledWith(v79);
            v14.unmountHostNode(v15, v78);
        end);
        it("should not call function refs again if they didn't change", function() --[[ Line: 368 ]]
            -- upvalues: v9 (ref), v5 (ref), v12 (ref), v15 (ref), v14 (ref)
            local l_Folder_10 = Instance.new("Folder");
            local v82 = v9();
            local v83 = v5("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                [v12] = v82.value
            });
            local v84 = v15.createVirtualNode(v83, l_Folder_10, "Some Key");
            v14.mountHostNode(v15, v84);
            expect(#l_Folder_10:GetChildren()).to.equal(1);
            local v85 = l_Folder_10:GetChildren()[1];
            expect(v82.callCount).to.equal(1);
            v82:assertCalledWith(v85);
            local v86 = v5("Frame", {
                Size = UDim2.new(0.5, 0, 0.5, 0), 
                [v12] = v82.value
            });
            v14.updateHostNode(v15, v84, v86);
            expect(v82.callCount).to.equal(1);
        end);
        it("should throw if setting invalid instance properties", function() --[[ Line: 401 ]]
            -- upvalues: v10 (ref), v5 (ref), v15 (ref), v14 (ref)
            local v87 = {
                elementTracing = true
            };
            v10.scoped(v87, function() --[[ Line: 406 ]]
                -- upvalues: v5 (ref), v15 (ref), v14 (ref)
                local l_Folder_11 = Instance.new("Folder");
                local v89 = v5("Frame");
                local v90 = v5("Frame", {
                    Frob = 6
                });
                local v91 = v15.createVirtualNode(v89, l_Folder_11, "Some Key");
                v14.mountHostNode(v15, v91);
                local l_status_1, l_result_1 = pcall(v14.updateHostNode, v15, v91, v90);
                assert(not l_status_1, "Expected call to fail");
                expect(l_result_1:find("Frob")).to.be.ok();
                expect(l_result_1:find("Frame")).to.be.ok();
                expect(l_result_1:find("RobloxRenderer%.spec")).to.be.ok();
            end);
        end);
        it("should delete instances when reconciling to nil children", function() --[[ Line: 427 ]]
            -- upvalues: v5 (ref), v15 (ref), v14 (ref)
            local l_Folder_12 = Instance.new("Folder");
            local v95 = v5("Frame", {
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                child = v5("Frame")
            });
            local v96 = v15.createVirtualNode(v95, l_Folder_12, "Some Key");
            v14.mountHostNode(v15, v96);
            expect(#l_Folder_12:GetChildren()).to.equal(1);
            local v97 = l_Folder_12:GetChildren()[1];
            expect(#v97:GetChildren()).to.equal(1);
            local v98 = v5("Frame", {
                Size = UDim2.new(0.5, 0, 0.5, 0)
            });
            v14.updateHostNode(v15, v96, v98);
            expect(#v97:GetChildren()).to.equal(0);
        end);
    end);
    describe("unmountHostNode", function() --[[ Line: 455 ]]
        -- upvalues: v5 (copy), v15 (copy), v14 (copy), v2 (copy), v8 (copy), v12 (copy), v9 (copy)
        it("should delete instances from the inside-out", function() --[[ Line: 456 ]]
            -- upvalues: v5 (ref), v15 (ref), v14 (ref)
            local l_Folder_13 = Instance.new("Folder");
            local v100 = v5("Folder", nil, {
                Child = v5("Folder", nil, {
                    Grandchild = v5("Folder")
                })
            });
            local v101 = v15.mountVirtualNode(v100, l_Folder_13, "Root");
            expect(#l_Folder_13:GetChildren()).to.equal(1);
            local v102 = l_Folder_13:GetChildren()[1];
            expect(#v102:GetChildren()).to.equal(1);
            local v103 = v102:GetChildren()[1];
            expect(#v103:GetChildren()).to.equal(1);
            local v104 = v103:GetChildren()[1];
            v14.unmountHostNode(v15, v101);
            expect(v104.Parent).to.equal(nil);
            expect(v103.Parent).to.equal(nil);
            expect(v102.Parent).to.equal(nil);
        end);
        it("should unsubscribe from any Bindings", function() --[[ Line: 484 ]]
            -- upvalues: v2 (ref), v5 (ref), v15 (ref), v14 (ref)
            local l_Folder_14 = Instance.new("Folder");
            local v106, v107 = v2.create(10);
            local v108 = v5("IntValue", {
                Value = v106
            });
            local v109 = v15.createVirtualNode(v108, l_Folder_14, "Some Key");
            v14.mountHostNode(v15, v109);
            local v110 = l_Folder_14:GetChildren()[1];
            expect(v110.Value).to.equal(10);
            v14.unmountHostNode(v15, v109);
            v107(56);
            expect(v110.Value).to.equal(10);
        end);
        it("should clear Binding refs", function() --[[ Line: 507 ]]
            -- upvalues: v8 (ref), v5 (ref), v12 (ref), v15 (ref), v14 (ref)
            local l_Folder_15 = Instance.new("Folder");
            local v112 = v8();
            local v113 = v5("Frame", {
                [v12] = v112
            });
            local v114 = v15.createVirtualNode(v113, l_Folder_15, "Some Key");
            v14.mountHostNode(v15, v114);
            expect(v112.current).to.be.ok();
            v14.unmountHostNode(v15, v114);
            expect(v112.current).never.to.be.ok();
        end);
        it("should call function refs with nil", function() --[[ Line: 527 ]]
            -- upvalues: v9 (ref), v5 (ref), v12 (ref), v15 (ref), v14 (ref)
            local l_Folder_16 = Instance.new("Folder");
            local v116 = v9();
            local v117 = v5("Frame", {
                [v12] = v116.value
            });
            local v118 = v15.createVirtualNode(v117, l_Folder_16, "Some Key");
            v14.mountHostNode(v15, v118);
            expect(v116.callCount).to.equal(1);
            v14.unmountHostNode(v15, v118);
            expect(v116.callCount).to.equal(2);
            v116:assertCalledWith(nil);
        end);
    end);
    describe("Portals", function() --[[ Line: 549 ]]
        -- upvalues: v5 (copy), v11 (copy), v15 (copy)
        it("should create and destroy instances as children of `target`", function() --[[ Line: 550 ]]
            -- upvalues: v5 (ref), v11 (ref), v15 (ref)
            local l_Folder_17 = Instance.new("Folder");
            local function v121(v120) --[[ Line: 553 ]] --[[ Name: FunctionComponent ]]
                -- upvalues: v5 (ref)
                return v5("IntValue", {
                    Value = v120.value
                });
            end;
            local v122 = v5(v11, {
                target = l_Folder_17
            }, {
                folderOne = v5("Folder"), 
                folderTwo = v5("Folder"), 
                intValueOne = v5(v121, {
                    value = 42
                })
            });
            local v123 = v15.mountVirtualNode(v122, nil, "Some Key");
            expect(#l_Folder_17:GetChildren()).to.equal(3);
            expect(l_Folder_17:FindFirstChild("folderOne")).to.be.ok();
            expect(l_Folder_17:FindFirstChild("folderTwo")).to.be.ok();
            expect(l_Folder_17:FindFirstChild("intValueOne")).to.be.ok();
            expect(l_Folder_17:FindFirstChild("intValueOne").Value).to.equal(42);
            v15.unmountVirtualNode(v123);
            expect(#l_Folder_17:GetChildren()).to.equal(0);
        end);
        it("should pass prop updates through to children", function() --[[ Line: 584 ]]
            -- upvalues: v5 (ref), v11 (ref), v15 (ref)
            local l_Folder_18 = Instance.new("Folder");
            local v125 = v5(v11, {
                target = l_Folder_18
            }, {
                ChildValue = v5("IntValue", {
                    Value = 1
                })
            });
            local v126 = v5(v11, {
                target = l_Folder_18
            }, {
                ChildValue = v5("IntValue", {
                    Value = 2
                })
            });
            local v127 = v15.mountVirtualNode(v125, nil, "A Host Key");
            expect(#l_Folder_18:GetChildren()).to.equal(1);
            local l_ChildValue_0 = l_Folder_18.ChildValue;
            expect(l_ChildValue_0.Value).to.equal(1);
            v127 = v15.updateVirtualNode(v127, v126);
            expect(#l_Folder_18:GetChildren()).to.equal(1);
            local l_ChildValue_1 = l_Folder_18.ChildValue;
            expect(l_ChildValue_0).to.equal(l_ChildValue_1);
            expect(l_ChildValue_1.Value).to.equal(2);
            v15.unmountVirtualNode(v127);
            expect(#l_Folder_18:GetChildren()).to.equal(0);
        end);
        it("should throw if `target` is nil", function() --[[ Line: 625 ]]
            -- upvalues: v5 (ref), v11 (ref), v15 (ref)
            local v130 = v5(v11);
            expect(function() --[[ Line: 631 ]]
                -- upvalues: v15 (ref), v130 (copy)
                v15.mountVirtualNode(v130, nil, "Keys for Everyone");
            end).to.throw();
        end);
        it("should throw if `target` is not a Roblox instance", function() --[[ Line: 636 ]]
            -- upvalues: v5 (ref), v11 (ref), v15 (ref)
            local v131 = v5(v11, {
                target = {}
            });
            expect(function() --[[ Line: 643 ]]
                -- upvalues: v15 (ref), v131 (copy)
                v15.mountVirtualNode(v131, nil, "Unleash the keys!");
            end).to.throw();
        end);
        it("should recreate instances if `target` changes in an update", function() --[[ Line: 648 ]]
            -- upvalues: v5 (ref), v11 (ref), v15 (ref)
            local l_Folder_19 = Instance.new("Folder");
            local l_Folder_20 = Instance.new("Folder");
            local v134 = v5(v11, {
                target = l_Folder_19
            }, {
                ChildValue = v5("IntValue", {
                    Value = 1
                })
            });
            local v135 = v5(v11, {
                target = l_Folder_20
            }, {
                ChildValue = v5("IntValue", {
                    Value = 2
                })
            });
            local v136 = v15.mountVirtualNode(v134, nil, "Some Key");
            expect(#l_Folder_19:GetChildren()).to.equal(1);
            expect(#l_Folder_20:GetChildren()).to.equal(0);
            local l_ChildValue_2 = l_Folder_19.ChildValue;
            expect(l_ChildValue_2.Value).to.equal(1);
            v136 = v15.updateVirtualNode(v136, v135);
            expect(#l_Folder_19:GetChildren()).to.equal(0);
            expect(#l_Folder_20:GetChildren()).to.equal(1);
            local l_ChildValue_3 = l_Folder_20.ChildValue;
            expect(l_ChildValue_3.Value).to.equal(2);
            v15.unmountVirtualNode(v136);
            expect(#l_Folder_19:GetChildren()).to.equal(0);
            expect(#l_Folder_20:GetChildren()).to.equal(0);
        end);
    end);
    describe("Fragments", function() --[[ Line: 693 ]]
        -- upvalues: v6 (copy), v5 (copy), v15 (copy)
        it("should parent the fragment's elements into the fragment's parent", function() --[[ Line: 694 ]]
            -- upvalues: v6 (ref), v5 (ref), v15 (ref)
            local l_Folder_21 = Instance.new("Folder");
            local v140 = v6({
                key = v5("IntValue", {
                    Value = 1
                }), 
                key2 = v5("IntValue", {
                    Value = 2
                })
            });
            local v141 = v15.mountVirtualNode(v140, l_Folder_21, "test");
            expect(l_Folder_21:FindFirstChild("key")).to.be.ok();
            expect(l_Folder_21.key.ClassName).to.equal("IntValue");
            expect(l_Folder_21.key.Value).to.equal(1);
            expect(l_Folder_21:FindFirstChild("key2")).to.be.ok();
            expect(l_Folder_21.key2.ClassName).to.equal("IntValue");
            expect(l_Folder_21.key2.Value).to.equal(2);
            v15.unmountVirtualNode(v141);
            expect(#l_Folder_21:GetChildren()).to.equal(0);
        end);
        it("should allow sibling fragment to have common keys", function() --[[ Line: 721 ]]
            -- upvalues: v5 (ref), v6 (ref), v15 (ref)
            local l_Folder_22 = Instance.new("Folder");
            local function v144(_) --[[ Line: 725 ]] --[[ Name: parent ]]
                -- upvalues: v5 (ref), v6 (ref)
                return v5("IntValue", {}, {
                    fragmentA = v6({
                        key = v5("StringValue", {
                            Value = "A"
                        }), 
                        key2 = v5("StringValue", {
                            Value = "B"
                        })
                    }), 
                    fragmentB = v6({
                        key = v5("StringValue", {
                            Value = "C"
                        }), 
                        key2 = v5("StringValue", {
                            Value = "D"
                        })
                    })
                });
            end;
            local v145 = v15.mountVirtualNode(v5(v144), l_Folder_22, "Test");
            local l_Children_0 = l_Folder_22.Test:GetChildren();
            expect(#l_Children_0).to.equal(4);
            local v147 = {};
            for _, v149 in pairs(l_Children_0) do
                expect(v149.ClassName).to.equal("StringValue");
                v147[v149.Value] = 1 + (v147[v149.Value] or 0);
            end;
            expect(v147.A).to.equal(1);
            expect(v147.B).to.equal(1);
            expect(v147.C).to.equal(1);
            expect(v147.D).to.equal(1);
            v15.unmountVirtualNode(v145);
            expect(#l_Folder_22:GetChildren()).to.equal(0);
        end);
        it("should render nested fragments", function() --[[ Line: 769 ]]
            -- upvalues: v6 (ref), v5 (ref), v15 (ref)
            local l_Folder_23 = Instance.new("Folder");
            local v151 = v6({
                key = v6({
                    TheValue = v5("IntValue", {
                        Value = 1
                    }), 
                    TheOtherValue = v5("IntValue", {
                        Value = 2
                    })
                })
            });
            local v152 = v15.mountVirtualNode(v151, l_Folder_23, "Test");
            expect(l_Folder_23:FindFirstChild("TheValue")).to.be.ok();
            expect(l_Folder_23.TheValue.ClassName).to.equal("IntValue");
            expect(l_Folder_23.TheValue.Value).to.equal(1);
            expect(l_Folder_23:FindFirstChild("TheOtherValue")).to.be.ok();
            expect(l_Folder_23.TheOtherValue.ClassName).to.equal("IntValue");
            expect(l_Folder_23.TheOtherValue.Value).to.equal(2);
            v15.unmountVirtualNode(v152);
            expect(#l_Folder_23:GetChildren()).to.equal(0);
        end);
        it("should not add any instances if the fragment is empty", function() --[[ Line: 798 ]]
            -- upvalues: v15 (ref), v6 (ref)
            local l_Folder_24 = Instance.new("Folder");
            local v154 = v15.mountVirtualNode(v6({}), l_Folder_24, "test");
            expect(#l_Folder_24:GetChildren()).to.equal(0);
            v15.unmountVirtualNode(v154);
            expect(#l_Folder_24:GetChildren()).to.equal(0);
        end);
    end);
    describe("Context", function() --[[ Line: 811 ]]
        -- upvalues: v4 (copy), v5 (copy), v15 (copy), v1 (copy), v3 (copy), v11 (copy)
        it("should pass context values through Roblox host nodes", function() --[[ Line: 812 ]]
            -- upvalues: v4 (ref), v5 (ref), v15 (ref), v1 (ref)
            local v155 = v4:extend("Consumer");
            local v156 = nil;
            v155.init = function(v157) --[[ Line: 816 ]] --[[ Name: init ]]
                -- upvalues: v156 (ref)
                v156 = {
                    hello = v157:__getContext("hello")
                };
            end;
            v155.render = function(_) --[[ Line: 822 ]] --[[ Name: render ]]

            end;
            local v159 = v5("Folder", nil, {
                Consumer = v5(v155)
            });
            local v160 = {
                hello = "world"
            };
            local v161 = v15.mountVirtualNode(v159, nil, "Context Test", v160);
            expect(v156).never.to.equal(v160);
            v1(v156, v160);
            v15.unmountVirtualNode(v161);
        end);
        it("should pass context values through portal nodes", function() --[[ Line: 840 ]]
            -- upvalues: v4 (ref), v5 (ref), v3 (ref), v11 (ref), v15 (ref), v1 (ref)
            local l_Folder_25 = Instance.new("Folder");
            local v163 = v4:extend("Provider");
            v163.init = function(v164) --[[ Line: 845 ]] --[[ Name: init ]]
                v164:__addContext("foo", "bar");
            end;
            v163.render = function(v165) --[[ Line: 849 ]] --[[ Name: render ]]
                -- upvalues: v5 (ref), v3 (ref)
                return v5("Folder", nil, v165.props[v3]);
            end;
            local v166 = v4:extend("Consumer");
            local v167 = nil;
            v166.init = function(v168) --[[ Line: 856 ]] --[[ Name: init ]]
                -- upvalues: v167 (ref)
                v167 = {
                    foo = v168:__getContext("foo")
                };
            end;
            v166.render = function(_) --[[ Line: 862 ]] --[[ Name: render ]]
                return nil;
            end;
            local v170 = v5(v163, nil, {
                Portal = v5(v11, {
                    target = l_Folder_25
                }, {
                    Consumer = v5(v166)
                })
            });
            v15.mountVirtualNode(v170, nil, "Some Key");
            v1(v167, {
                foo = "bar"
            });
        end);
    end);
    describe("Legacy context", function() --[[ Line: 883 ]]
        -- upvalues: v4 (copy), v5 (copy), v15 (copy), v1 (copy), v3 (copy), v11 (copy)
        it("should pass context values through Roblox host nodes", function() --[[ Line: 884 ]]
            -- upvalues: v4 (ref), v5 (ref), v15 (ref), v1 (ref)
            local v171 = v4:extend("Consumer");
            local v172 = nil;
            v171.init = function(v173) --[[ Line: 888 ]] --[[ Name: init ]]
                -- upvalues: v172 (ref)
                v172 = v173._context;
            end;
            v171.render = function(_) --[[ Line: 892 ]] --[[ Name: render ]]

            end;
            local v175 = v5("Folder", nil, {
                Consumer = v5(v171)
            });
            local v176 = {
                hello = "world"
            };
            local v177 = v15.mountVirtualNode(v175, nil, "Context Test", nil, v176);
            expect(v172).never.to.equal(v176);
            v1(v172, v176);
            v15.unmountVirtualNode(v177);
        end);
        it("should pass context values through portal nodes", function() --[[ Line: 910 ]]
            -- upvalues: v4 (ref), v5 (ref), v3 (ref), v11 (ref), v15 (ref), v1 (ref)
            local l_Folder_26 = Instance.new("Folder");
            local v179 = v4:extend("Provider");
            v179.init = function(v180) --[[ Line: 915 ]] --[[ Name: init ]]
                v180._context.foo = "bar";
            end;
            v179.render = function(v181) --[[ Line: 919 ]] --[[ Name: render ]]
                -- upvalues: v5 (ref), v3 (ref)
                return v5("Folder", nil, v181.props[v3]);
            end;
            local v182 = v4:extend("Consumer");
            local v183 = nil;
            v182.init = function(v184) --[[ Line: 926 ]] --[[ Name: init ]]
                -- upvalues: v183 (ref)
                v183 = v184._context;
            end;
            v182.render = function(_) --[[ Line: 930 ]] --[[ Name: render ]]
                return nil;
            end;
            local v186 = v5(v179, nil, {
                Portal = v5(v11, {
                    target = l_Folder_26
                }, {
                    Consumer = v5(v182)
                })
            });
            v15.mountVirtualNode(v186, nil, "Some Key");
            v1(v183, {
                foo = "bar"
            });
        end);
    end);
    describe("Integration Tests", function() --[[ Line: 951 ]]
        -- upvalues: l_ReplicatedStorage_0 (copy), v4 (copy), v5 (copy), v13 (copy), v15 (copy)
        local v187 = nil;
        beforeEach(function() --[[ Line: 953 ]]
            -- upvalues: v187 (ref), l_ReplicatedStorage_0 (ref)
            v187 = Instance.new("Folder");
            v187.Parent = l_ReplicatedStorage_0;
        end);
        afterEach(function() --[[ Line: 958 ]]
            -- upvalues: v187 (ref)
            v187:Destroy();
            v187 = nil;
        end);
        it("should not allow re-entrancy in updateChildren", function() --[[ Line: 963 ]]
            -- upvalues: v4 (ref), v5 (ref), v13 (ref), v187 (ref), v15 (ref)
            local v188 = v4:extend("ChildComponent");
            v188.init = function(v189) --[[ Line: 966 ]] --[[ Name: init ]]
                v189:setState({
                    firstTime = true
                });
            end;
            local v190 = nil;
            v188.render = function(v191) --[[ Line: 974 ]] --[[ Name: render ]]
                -- upvalues: v5 (ref)
                if v191.state.firstTime then
                    return v5("Frame");
                else
                    return v5("TextLabel");
                end;
            end;
            v188.didMount = function(v192) --[[ Line: 982 ]] --[[ Name: didMount ]]
                -- upvalues: v190 (ref)
                v190 = coroutine.create(function() --[[ Line: 983 ]]
                    -- upvalues: v192 (copy)
                    v192:setState({
                        firstTime = false
                    });
                end);
            end;
            local v193 = v4:extend("ParentComponent");
            v193.init = function(v194) --[[ Line: 992 ]] --[[ Name: init ]]
                v194:setState({
                    count = 1
                });
                v194.childAdded = function() --[[ Line: 997 ]]
                    -- upvalues: v194 (copy)
                    v194:setState({
                        count = v194.state.count + 1
                    });
                end;
            end;
            v193.render = function(v195) --[[ Line: 1004 ]] --[[ Name: render ]]
                -- upvalues: v5 (ref), v13 (ref), v188 (copy)
                return v5("Frame", {
                    [v13.ChildAdded] = v195.childAdded
                }, {
                    ChildComponent = v5(v188, {
                        count = v195.state.count
                    })
                });
            end;
            local l_ScreenGui_0 = Instance.new("ScreenGui");
            l_ScreenGui_0.Parent = v187;
            local v197 = v5(v193);
            local v198 = v15.mountVirtualNode(v197, l_ScreenGui_0, "Some Key");
            coroutine.resume(v190);
            expect(#l_ScreenGui_0:GetChildren()).to.equal(1);
            local v199 = l_ScreenGui_0:GetChildren()[1];
            expect(#v199:GetChildren()).to.equal(1);
            v15.unmountVirtualNode(v198);
        end);
        it("should not allow re-entrancy in updateChildren even with callbacks", function() --[[ Line: 1033 ]]
            -- upvalues: v4 (ref), v5 (ref), v187 (ref), v15 (ref)
            local v200 = v4:extend("LowestComponent");
            v200.render = function(_) --[[ Line: 1036 ]] --[[ Name: render ]]
                -- upvalues: v5 (ref)
                return v5("Frame");
            end;
            v200.didMount = function(v202) --[[ Line: 1040 ]] --[[ Name: didMount ]]
                v202.props.onDidMountCallback();
            end;
            local v203 = v4:extend("ChildComponent");
            v203.init = function(v204) --[[ Line: 1046 ]] --[[ Name: init ]]
                v204:setState({
                    firstTime = true
                });
            end;
            local v205 = nil;
            v203.render = function(v206) --[[ Line: 1054 ]] --[[ Name: render ]]
                -- upvalues: v5 (ref), v200 (copy)
                if v206.state.firstTime then
                    return v5("Frame");
                else
                    return v5(v200, {
                        onDidMountCallback = v206.props.onDidMountCallback
                    });
                end;
            end;
            v203.didMount = function(v207) --[[ Line: 1064 ]] --[[ Name: didMount ]]
                -- upvalues: v205 (ref)
                v205 = coroutine.create(function() --[[ Line: 1065 ]]
                    -- upvalues: v207 (copy)
                    v207:setState({
                        firstTime = false
                    });
                end);
            end;
            local v208 = v4:extend("ParentComponent");
            local v209 = 0;
            v208.init = function(v210) --[[ Line: 1076 ]] --[[ Name: init ]]
                -- upvalues: v209 (ref)
                v210:setState({
                    count = 1
                });
                v210.onDidMountCallback = function() --[[ Line: 1081 ]]
                    -- upvalues: v209 (ref), v210 (copy)
                    v209 = v209 + 1;
                    if v210.state.count < 5 then
                        v210:setState({
                            count = v210.state.count + 1
                        });
                    end;
                end;
            end;
            v208.render = function(v211) --[[ Line: 1091 ]] --[[ Name: render ]]
                -- upvalues: v5 (ref), v203 (copy)
                return v5("Frame", {}, {
                    ChildComponent = v5(v203, {
                        count = v211.state.count, 
                        onDidMountCallback = v211.onDidMountCallback
                    })
                });
            end;
            local l_ScreenGui_1 = Instance.new("ScreenGui");
            l_ScreenGui_1.Parent = v187;
            local v213 = v5(v208);
            local v214 = v15.mountVirtualNode(v213, l_ScreenGui_1, "Some Key");
            coroutine.resume(v205);
            expect(#l_ScreenGui_1:GetChildren()).to.equal(1);
            local v215 = l_ScreenGui_1:GetChildren()[1];
            expect(#v215:GetChildren()).to.equal(1);
            expect(v209 <= 2).to.equal(true);
            v15.unmountVirtualNode(v214);
        end);
        it("should never call unmount twice in the case of update children re-rentrancy", function() --[[ Line: 1123 ]]
            -- upvalues: v4 (ref), v5 (ref), v187 (ref), v15 (ref)
            local v216 = {};
            local function _(v217) --[[ Line: 1126 ]] --[[ Name: addUnmount ]]
                -- upvalues: v216 (copy)
                v216[v217] = v216[v217] + 1;
            end;
            local function _(v219) --[[ Line: 1130 ]] --[[ Name: addInit ]]
                -- upvalues: v216 (copy)
                v216[v219] = 0;
            end;
            local v221 = v4:extend("LowestComponent");
            v221.init = function(v222) --[[ Line: 1135 ]] --[[ Name: init ]]
                -- upvalues: v216 (copy)
                v216[tostring(v222)] = 0;
            end;
            v221.render = function(_) --[[ Line: 1139 ]] --[[ Name: render ]]
                -- upvalues: v5 (ref)
                return v5("Frame");
            end;
            v221.didMount = function(v224) --[[ Line: 1143 ]] --[[ Name: didMount ]]
                v224.props.onDidMountCallback();
            end;
            v221.willUnmount = function(v225) --[[ Line: 1147 ]] --[[ Name: willUnmount ]]
                -- upvalues: v216 (copy)
                local v226 = tostring(v225);
                v216[v226] = v216[v226] + 1;
            end;
            local v227 = v4:extend("FirstComponent");
            v227.init = function(v228) --[[ Line: 1152 ]] --[[ Name: init ]]
                -- upvalues: v216 (copy)
                v216[tostring(v228)] = 0;
            end;
            v227.render = function(_) --[[ Line: 1156 ]] --[[ Name: render ]]
                -- upvalues: v5 (ref)
                return v5("TextLabel");
            end;
            v227.willUnmount = function(v230) --[[ Line: 1160 ]] --[[ Name: willUnmount ]]
                -- upvalues: v216 (copy)
                local v231 = tostring(v230);
                v216[v231] = v216[v231] + 1;
            end;
            local v232 = v4:extend("ChildComponent");
            v232.init = function(v233) --[[ Line: 1166 ]] --[[ Name: init ]]
                -- upvalues: v216 (copy)
                v216[tostring(v233)] = 0;
                v233:setState({
                    firstTime = true
                });
            end;
            local v234 = nil;
            v232.render = function(v235) --[[ Line: 1176 ]] --[[ Name: render ]]
                -- upvalues: v5 (ref), v227 (copy), v221 (copy)
                if v235.state.firstTime then
                    return v5(v227);
                else
                    return v5(v221, {
                        onDidMountCallback = v235.props.onDidMountCallback
                    });
                end;
            end;
            v232.didMount = function(v236) --[[ Line: 1186 ]] --[[ Name: didMount ]]
                -- upvalues: v234 (ref)
                v234 = coroutine.create(function() --[[ Line: 1187 ]]
                    -- upvalues: v236 (copy)
                    v236:setState({
                        firstTime = false
                    });
                end);
            end;
            v232.willUnmount = function(v237) --[[ Line: 1194 ]] --[[ Name: willUnmount ]]
                -- upvalues: v216 (copy)
                local v238 = tostring(v237);
                v216[v238] = v216[v238] + 1;
            end;
            local v239 = v4:extend("ParentComponent");
            local v240 = 0;
            v239.init = function(v241) --[[ Line: 1202 ]] --[[ Name: init ]]
                -- upvalues: v240 (ref)
                v241:setState({
                    count = 1
                });
                v241.onDidMountCallback = function() --[[ Line: 1207 ]]
                    -- upvalues: v240 (ref), v241 (copy)
                    v240 = v240 + 1;
                    if v241.state.count < 5 then
                        v241:setState({
                            count = v241.state.count + 1
                        });
                    end;
                end;
            end;
            v239.render = function(v242) --[[ Line: 1217 ]] --[[ Name: render ]]
                -- upvalues: v5 (ref), v232 (copy)
                return v5("Frame", {}, {
                    ChildComponent = v5(v232, {
                        count = v242.state.count, 
                        onDidMountCallback = v242.onDidMountCallback
                    })
                });
            end;
            local l_ScreenGui_2 = Instance.new("ScreenGui");
            l_ScreenGui_2.Parent = v187;
            local v244 = v5(v239);
            local v245 = v15.mountVirtualNode(v244, l_ScreenGui_2, "Some Key");
            coroutine.resume(v234);
            expect(#l_ScreenGui_2:GetChildren()).to.equal(1);
            local v246 = l_ScreenGui_2:GetChildren()[1];
            expect(#v246:GetChildren()).to.equal(1);
            expect(v240 <= 2).to.equal(true);
            v15.unmountVirtualNode(v245);
            for _, v248 in pairs(v216) do
                expect(v248).to.equal(1);
            end;
        end);
        it("should never unmount a node unnecesarily in the case of re-rentry", function() --[[ Line: 1253 ]]
            -- upvalues: v4 (ref), v5 (ref), v187 (ref), v15 (ref)
            local v249 = v4:extend("LowestComponent");
            v249.render = function(_) --[[ Line: 1255 ]] --[[ Name: render ]]
                -- upvalues: v5 (ref)
                return v5("Frame");
            end;
            v249.didUpdate = function(v251, v252, _) --[[ Line: 1259 ]] --[[ Name: didUpdate ]]
                if v252.firstTime and not v251.props.firstTime then
                    v251.props.onChangedCallback();
                end;
            end;
            local v254 = v4:extend("ChildComponent");
            v254.init = function(v255) --[[ Line: 1267 ]] --[[ Name: init ]]
                v255:setState({
                    firstTime = true
                });
            end;
            local v256 = nil;
            v254.render = function(v257) --[[ Line: 1275 ]] --[[ Name: render ]]
                -- upvalues: v5 (ref), v249 (copy)
                return v5(v249, {
                    firstTime = v257.state.firstTime, 
                    onChangedCallback = v257.props.onChangedCallback
                });
            end;
            v254.didMount = function(v258) --[[ Line: 1282 ]] --[[ Name: didMount ]]
                -- upvalues: v256 (ref)
                v256 = coroutine.create(function() --[[ Line: 1283 ]]
                    -- upvalues: v258 (copy)
                    v258:setState({
                        firstTime = false
                    });
                end);
            end;
            local v259 = v4:extend("ParentComponent");
            local v260 = 0;
            v259.init = function(v261) --[[ Line: 1294 ]] --[[ Name: init ]]
                -- upvalues: v260 (ref)
                v261:setState({
                    count = 1
                });
                v261.onChangedCallback = function() --[[ Line: 1299 ]]
                    -- upvalues: v260 (ref), v261 (copy)
                    v260 = v260 + 1;
                    if v261.state.count < 5 then
                        v261:setState({
                            count = v261.state.count + 1
                        });
                    end;
                end;
            end;
            v259.render = function(v262) --[[ Line: 1309 ]] --[[ Name: render ]]
                -- upvalues: v5 (ref), v254 (copy)
                return v5("Frame", {}, {
                    ChildComponent = v5(v254, {
                        count = v262.state.count, 
                        onChangedCallback = v262.onChangedCallback
                    })
                });
            end;
            local l_ScreenGui_3 = Instance.new("ScreenGui");
            l_ScreenGui_3.Parent = v187;
            local v264 = v5(v259);
            local v265 = v15.mountVirtualNode(v264, l_ScreenGui_3, "Some Key");
            coroutine.resume(v256);
            expect(#l_ScreenGui_3:GetChildren()).to.equal(1);
            local v266 = l_ScreenGui_3:GetChildren()[1];
            expect(#v266:GetChildren()).to.equal(1);
            expect(v260).to.equal(1);
            v15.unmountVirtualNode(v265);
        end);
    end);
end;