return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.Parent.assertDeepEqual);
    local v1 = require(script.Parent.Parent.createElement);
    local v2 = require(script.Parent.Parent.createReconciler);
    local v3 = require(script.Parent.Parent.NoopRenderer);
    local v4 = require(script.Parent.Parent.Component);
    local v5 = v2(v3);
    it("should be provided as a mutable self._context in Component:init", function() --[[ Line: 11 ]]
        -- upvalues: v4 (copy), v1 (copy), v5 (copy), v0 (copy)
        local v6 = v4:extend("Provider");
        v6.init = function(v7) --[[ Line: 14 ]] --[[ Name: init ]]
            v7._context.foo = "bar";
        end;
        v6.render = function(_) --[[ Line: 18 ]] --[[ Name: render ]]

        end;
        local v9 = v1(v6);
        local v10 = v5.mountVirtualNode(v9, nil, "Provider");
        local v11 = {
            foo = "bar"
        };
        v0(v10.legacyContext, v11);
    end);
    it("should be inherited from parent stateful nodes", function() --[[ Line: 32 ]]
        -- upvalues: v4 (copy), v1 (copy), v5 (copy), v0 (copy)
        local v12 = v4:extend("Consumer");
        local v13 = nil;
        v12.init = function(v14) --[[ Line: 36 ]] --[[ Name: init ]]
            -- upvalues: v13 (ref)
            v13 = v14._context;
        end;
        v12.render = function(_) --[[ Line: 40 ]] --[[ Name: render ]]

        end;
        local v16 = v4:extend("Parent");
        v16.render = function(_) --[[ Line: 44 ]] --[[ Name: render ]]
            -- upvalues: v1 (ref), v12 (copy)
            return v1(v12);
        end;
        local v18 = v1(v16);
        local v19 = {
            hello = "world", 
            value = 6
        };
        local v20 = v5.mountVirtualNode(v18, nil, "Parent", nil, v19);
        expect(v13).never.to.equal(v19);
        expect(v13).never.to.equal(v20.legacyContext);
        v0(v20.legacyContext, v19);
        v0(v13, v19);
    end);
    it("should be inherited from parent function nodes", function() --[[ Line: 63 ]]
        -- upvalues: v4 (copy), v1 (copy), v5 (copy), v0 (copy)
        local v21 = v4:extend("Consumer");
        local v22 = nil;
        v21.init = function(v23) --[[ Line: 67 ]] --[[ Name: init ]]
            -- upvalues: v22 (ref)
            v22 = v23._context;
        end;
        v21.render = function(_) --[[ Line: 71 ]] --[[ Name: render ]]

        end;
        local v25 = v1(function() --[[ Line: 73 ]] --[[ Name: Parent ]]
            -- upvalues: v1 (ref), v21 (copy)
            return v1(v21);
        end);
        local v26 = {
            hello = "world", 
            value = 6
        };
        local v27 = v5.mountVirtualNode(v25, nil, "Parent", nil, v26);
        expect(v22).never.to.equal(v26);
        expect(v22).never.to.equal(v27.legacyContext);
        v0(v27.legacyContext, v26);
        v0(v22, v26);
    end);
    it("should contain values put into the tree by parent nodes", function() --[[ Line: 92 ]]
        -- upvalues: v4 (copy), v1 (copy), v5 (copy), v0 (copy)
        local v28 = v4:extend("Consumer");
        local v29 = nil;
        v28.init = function(v30) --[[ Line: 96 ]] --[[ Name: init ]]
            -- upvalues: v29 (ref)
            v29 = v30._context;
        end;
        v28.render = function(_) --[[ Line: 100 ]] --[[ Name: render ]]

        end;
        local v32 = v4:extend("Provider");
        v32.init = function(v33) --[[ Line: 104 ]] --[[ Name: init ]]
            v33._context.frob = "ulator";
        end;
        v32.render = function(_) --[[ Line: 108 ]] --[[ Name: render ]]
            -- upvalues: v1 (ref), v28 (copy)
            return v1(v28);
        end;
        local v35 = v1(v32);
        local v36 = {
            dont = "try it"
        };
        local v37 = v5.mountVirtualNode(v35, nil, "Consumer", nil, v36);
        local v38 = {
            dont = "try it"
        };
        local v39 = {
            dont = "try it", 
            frob = "ulator"
        };
        expect(v37.legacyContext).never.to.equal(v36);
        expect(v29).never.to.equal(v36);
        expect(v29).never.to.equal(v37.legacyContext);
        v0(v36, v38);
        v0(v37.legacyContext, v39);
        v0(v29, v39);
    end);
    it("should transfer context to children that are replaced", function() --[[ Line: 139 ]]
        -- upvalues: v4 (copy), v1 (copy), v5 (copy), v0 (copy)
        local v40 = v4:extend("ConsumerA");
        local v41 = nil;
        v40.init = function(v42) --[[ Line: 143 ]] --[[ Name: init ]]
            -- upvalues: v41 (ref)
            v42._context.A = "hello";
            v41 = v42._context;
        end;
        v40.render = function(_) --[[ Line: 149 ]] --[[ Name: render ]]

        end;
        local v44 = v4:extend("ConsumerB");
        local v45 = nil;
        v44.init = function(v46) --[[ Line: 154 ]] --[[ Name: init ]]
            -- upvalues: v45 (ref)
            v46._context.B = "hello";
            v45 = v46._context;
        end;
        v44.render = function(_) --[[ Line: 160 ]] --[[ Name: render ]]

        end;
        local v48 = v4:extend("Provider");
        v48.init = function(v49) --[[ Line: 164 ]] --[[ Name: init ]]
            v49._context.frob = "ulator";
        end;
        v48.render = function(v50) --[[ Line: 168 ]] --[[ Name: render ]]
            -- upvalues: v1 (ref), v44 (copy), v40 (copy)
            if v50.props.useConsumerB then
                return v1(v44);
            else
                return v1(v40);
            end;
        end;
        local v51 = v1(v48);
        local v52 = v5.mountVirtualNode(v51, nil, "Consumer");
        local v53 = {
            frob = "ulator", 
            A = "hello"
        };
        v0(v41, v53);
        local v54 = {
            frob = "ulator", 
            B = "hello"
        };
        local v55 = v1(v48, {
            useConsumerB = true
        });
        v5.updateVirtualNode(v52, v55);
        v0(v45, v54);
    end);
end;