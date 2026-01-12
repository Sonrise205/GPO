return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.Parent.assertDeepEqual);
    local v1 = require(script.Parent.Parent.createElement);
    local v2 = require(script.Parent.Parent.createReconciler);
    local v3 = require(script.Parent.Parent.NoopRenderer);
    local v4 = require(script.Parent.Parent.oneChild);
    local v5 = require(script.Parent.Parent.Component);
    local v6 = v2(v3);
    it("should be provided as an internal api on Component", function() --[[ Line: 12 ]]
        -- upvalues: v5 (copy), v1 (copy), v6 (copy), v0 (copy)
        local v7 = v5:extend("Provider");
        v7.init = function(v8) --[[ Line: 15 ]] --[[ Name: init ]]
            v8:__addContext("foo", "bar");
        end;
        v7.render = function(_) --[[ Line: 19 ]] --[[ Name: render ]]

        end;
        local v10 = v1(v7);
        local v11 = v6.mountVirtualNode(v10, nil, "Provider");
        local v12 = {
            foo = "bar"
        };
        v0(v11.context, v12);
    end);
    it("should be inherited from parent stateful nodes", function() --[[ Line: 33 ]]
        -- upvalues: v5 (copy), v1 (copy), v6 (copy), v0 (copy)
        local v13 = v5:extend("Consumer");
        local v14 = nil;
        v13.init = function(v15) --[[ Line: 37 ]] --[[ Name: init ]]
            -- upvalues: v14 (ref)
            v14 = {
                hello = v15:__getContext("hello"), 
                value = v15:__getContext("value")
            };
        end;
        v13.render = function(_) --[[ Line: 44 ]] --[[ Name: render ]]

        end;
        local v17 = v5:extend("Parent");
        v17.render = function(_) --[[ Line: 48 ]] --[[ Name: render ]]
            -- upvalues: v1 (ref), v13 (copy)
            return v1(v13);
        end;
        local v19 = v1(v17);
        local v20 = {
            hello = "world", 
            value = 6
        };
        local v21 = v6.mountVirtualNode(v19, nil, "Parent", v20);
        expect(v14).never.to.equal(v20);
        expect(v14).never.to.equal(v21.context);
        v0(v21.context, v20);
        v0(v14, v20);
    end);
    it("should be inherited from parent function nodes", function() --[[ Line: 67 ]]
        -- upvalues: v5 (copy), v1 (copy), v6 (copy), v0 (copy)
        local v22 = v5:extend("Consumer");
        local v23 = nil;
        v22.init = function(v24) --[[ Line: 71 ]] --[[ Name: init ]]
            -- upvalues: v23 (ref)
            v23 = {
                hello = v24:__getContext("hello"), 
                value = v24:__getContext("value")
            };
        end;
        v22.render = function(_) --[[ Line: 78 ]] --[[ Name: render ]]

        end;
        local v26 = v1(function() --[[ Line: 80 ]] --[[ Name: Parent ]]
            -- upvalues: v1 (ref), v22 (copy)
            return v1(v22);
        end);
        local v27 = {
            hello = "world", 
            value = 6
        };
        local v28 = v6.mountVirtualNode(v26, nil, "Parent", v27);
        expect(v23).never.to.equal(v27);
        expect(v23).never.to.equal(v28.context);
        v0(v28.context, v27);
        v0(v23, v27);
    end);
    it("should not copy the context table if it doesn't need to", function() --[[ Line: 99 ]]
        -- upvalues: v5 (copy), v1 (copy), v6 (copy), v0 (copy), v4 (copy)
        local v29 = v5:extend("Parent");
        v29.init = function(v30) --[[ Line: 102 ]] --[[ Name: init ]]
            v30:__addContext("parent", "I'm here!");
        end;
        v29.render = function(_) --[[ Line: 106 ]] --[[ Name: render ]]
            -- upvalues: v1 (ref)
            return v1(function() --[[ Line: 108 ]]

            end);
        end;
        local v32 = v1(v29);
        local v33 = v6.mountVirtualNode(v32, nil, "Parent");
        local v34 = {
            parent = "I'm here!"
        };
        v0(v33.context, v34);
        local v35 = v4(v33.children);
        expect(v33.context).to.equal(v35.context);
    end);
    it("should not allow context to move up the tree", function() --[[ Line: 128 ]]
        -- upvalues: v5 (copy), v1 (copy), v6 (copy), v4 (copy), v0 (copy)
        local v36 = v5:extend("ChildProvider");
        v36.init = function(v37) --[[ Line: 131 ]] --[[ Name: init ]]
            v37:__addContext("child", "I'm here too!");
        end;
        v36.render = function(_) --[[ Line: 135 ]] --[[ Name: render ]]

        end;
        local v39 = v5:extend("ParentProvider");
        v39.init = function(v40) --[[ Line: 139 ]] --[[ Name: init ]]
            v40:__addContext("parent", "I'm here!");
        end;
        v39.render = function(_) --[[ Line: 143 ]] --[[ Name: render ]]
            -- upvalues: v1 (ref), v36 (copy)
            return v1(v36);
        end;
        local v42 = v1(v39);
        local v43 = v6.mountVirtualNode(v42, nil, "Parent");
        local v44 = v4(v43.children);
        local v45 = {
            parent = "I'm here!"
        };
        local v46 = {
            parent = "I'm here!", 
            child = "I'm here too!"
        };
        v0(v43.context, v45);
        v0(v44.context, v46);
    end);
    it("should contain values put into the tree by parent nodes", function() --[[ Line: 168 ]]
        -- upvalues: v5 (copy), v1 (copy), v6 (copy), v0 (copy)
        local v47 = v5:extend("Consumer");
        local v48 = nil;
        v47.init = function(v49) --[[ Line: 172 ]] --[[ Name: init ]]
            -- upvalues: v48 (ref)
            v48 = {
                dont = v49:__getContext("dont"), 
                frob = v49:__getContext("frob")
            };
        end;
        v47.render = function(_) --[[ Line: 179 ]] --[[ Name: render ]]

        end;
        local v51 = v5:extend("Provider");
        v51.init = function(v52) --[[ Line: 183 ]] --[[ Name: init ]]
            v52:__addContext("frob", "ulator");
        end;
        v51.render = function(_) --[[ Line: 187 ]] --[[ Name: render ]]
            -- upvalues: v1 (ref), v47 (copy)
            return v1(v47);
        end;
        local v54 = v1(v51);
        local v55 = {
            dont = "try it"
        };
        local v56 = v6.mountVirtualNode(v54, nil, "Consumer", v55);
        local v57 = {
            dont = "try it"
        };
        local v58 = {
            dont = "try it", 
            frob = "ulator"
        };
        expect(v56.context).never.to.equal(v55);
        expect(v48).never.to.equal(v55);
        expect(v48).never.to.equal(v56.context);
        v0(v55, v57);
        v0(v56.context, v58);
        v0(v48, v58);
    end);
    it("should transfer context to children that are replaced", function() --[[ Line: 218 ]]
        -- upvalues: v5 (copy), v1 (copy), v6 (copy), v0 (copy)
        local v59 = v5:extend("ConsumerA");
        local function v61(v60) --[[ Line: 221 ]] --[[ Name: captureAllContext ]]
            return {
                A = v60:__getContext("A"), 
                B = v60:__getContext("B"), 
                frob = v60:__getContext("frob")
            };
        end;
        local v62 = nil;
        v59.init = function(v63) --[[ Line: 230 ]] --[[ Name: init ]]
            -- upvalues: v62 (ref), v61 (copy)
            v63:__addContext("A", "hello");
            v62 = v61(v63);
        end;
        v59.render = function(_) --[[ Line: 236 ]] --[[ Name: render ]]

        end;
        local v65 = v5:extend("ConsumerB");
        local v66 = nil;
        v65.init = function(v67) --[[ Line: 241 ]] --[[ Name: init ]]
            -- upvalues: v66 (ref), v61 (copy)
            v67:__addContext("B", "hello");
            v66 = v61(v67);
        end;
        v65.render = function(_) --[[ Line: 247 ]] --[[ Name: render ]]

        end;
        local v69 = v5:extend("Provider");
        v69.init = function(v70) --[[ Line: 251 ]] --[[ Name: init ]]
            v70:__addContext("frob", "ulator");
        end;
        v69.render = function(v71) --[[ Line: 255 ]] --[[ Name: render ]]
            -- upvalues: v1 (ref), v65 (copy), v59 (copy)
            if v71.props.useConsumerB then
                return v1(v65);
            else
                return v1(v59);
            end;
        end;
        local v72 = v1(v69);
        local v73 = v6.mountVirtualNode(v72, nil, "Consumer");
        local v74 = {
            frob = "ulator", 
            A = "hello"
        };
        v0(v62, v74);
        local v75 = {
            frob = "ulator", 
            B = "hello"
        };
        local v76 = v1(v69, {
            useConsumerB = true
        });
        v6.updateVirtualNode(v73, v76);
        v0(v66, v75);
    end);
end;