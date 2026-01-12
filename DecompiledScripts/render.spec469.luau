return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.Parent.assertDeepEqual);
    local v1 = require(script.Parent.Parent.createElement);
    local v2 = require(script.Parent.Parent.createReconciler);
    local v3 = require(script.Parent.Parent.createSpy);
    local v4 = require(script.Parent.Parent.NoopRenderer);
    local v5 = require(script.Parent.Parent.Type);
    local v6 = require(script.Parent.Parent.Component);
    local v7 = v2(v4);
    it("should throw on mount if not overridden", function() --[[ Line: 13 ]]
        -- upvalues: v6 (copy), v1 (copy), v7 (copy)
        local v8 = v6:extend("MyComponent");
        local v9 = v1(v8);
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 20 ]]
            -- upvalues: v7 (ref), v9 (copy)
            v7.mountVirtualNode(v9, nil, "Test");
        end);
        expect(l_status_0).to.equal(false);
        expect(l_result_0:match("MyComponent")).to.be.ok();
        expect(l_result_0:match("render")).to.be.ok();
    end);
    it("should be invoked when a component is mounted", function() --[[ Line: 29 ]]
        -- upvalues: v6 (copy), v3 (copy), v1 (copy), v7 (copy), v5 (copy), v0 (copy)
        local v12 = v6:extend("Foo");
        local v13 = nil;
        local v14 = nil;
        local v16 = v3(function(v15) --[[ Line: 34 ]]
            -- upvalues: v13 (ref), v14 (ref)
            v13 = v15.props;
            v14 = v15.state;
        end);
        v12.render = v16.value;
        local v17 = v1(v12);
        v7.mountVirtualNode(v17, nil, "Foo Test");
        expect(v16.callCount).to.equal(1);
        local v18 = v16:captureValues("self");
        expect(v5.of(v18.self)).to.equal(v5.StatefulComponentInstance);
        v0(v13, {});
        v0(v14, {});
    end);
    it("should be invoked when a component is updated via props", function() --[[ Line: 55 ]]
        -- upvalues: v6 (copy), v3 (copy), v1 (copy), v7 (copy), v5 (copy), v0 (copy)
        local v19 = v6:extend("Foo");
        local v20 = nil;
        local v21 = nil;
        local v23 = v3(function(v22) --[[ Line: 60 ]]
            -- upvalues: v20 (ref), v21 (ref)
            v20 = v22.props;
            v21 = v22.state;
        end);
        v19.render = v23.value;
        local v24 = {
            a = 2
        };
        local v25 = v1(v19, v24);
        local v26 = v7.mountVirtualNode(v25, nil, "Foo Test");
        expect(v23.callCount).to.equal(1);
        local v27 = v23:captureValues("self");
        local l_v20_0 = v20;
        local l_v21_0 = v21;
        expect(v5.of(v27.self)).to.equal(v5.StatefulComponentInstance);
        v0(l_v20_0, v24);
        v0(l_v21_0, {});
        local v30 = {
            a = 3
        };
        local v31 = v1(v19, v30);
        v7.updateVirtualNode(v26, v31);
        expect(v23.callCount).to.equal(2);
        local v32 = v23:captureValues("self");
        local l_v20_1 = v20;
        local l_v21_1 = v21;
        expect(v5.of(v32.self)).to.equal(v5.StatefulComponentInstance);
        expect(l_v20_1).never.to.equal(l_v20_0);
        v0(l_v20_1, v30);
        expect(l_v21_1).to.equal(l_v21_0);
    end);
    it("should be invoked when a component is updated via state", function() --[[ Line: 104 ]]
        -- upvalues: v6 (copy), v3 (copy), v1 (copy), v7 (copy), v5 (copy)
        local v35 = v6:extend("Foo");
        local v36 = nil;
        v35.init = function(v37) --[[ Line: 108 ]] --[[ Name: init ]]
            -- upvalues: v36 (ref)
            v36 = function(...) --[[ Line: 109 ]]
                -- upvalues: v37 (copy)
                return v37:setState(...);
            end;
        end;
        local v38 = nil;
        local v39 = nil;
        local v41 = v3(function(v40) --[[ Line: 116 ]]
            -- upvalues: v38 (ref), v39 (ref)
            v38 = v40.props;
            v39 = v40.state;
        end);
        v35.render = v41.value;
        local v42 = v1(v35);
        v7.mountVirtualNode(v42, nil, "Foo Test");
        expect(v41.callCount).to.equal(1);
        local v43 = v41:captureValues("self");
        local l_v38_0 = v38;
        local l_v39_0 = v39;
        expect(v5.of(v43.self)).to.equal(v5.StatefulComponentInstance);
        v36({});
        expect(v41.callCount).to.equal(2);
        local v46 = v41:captureValues("self");
        expect(v5.of(v46.self)).to.equal(v5.StatefulComponentInstance);
        expect(v38).to.equal(l_v38_0);
        expect(v39).never.to.equal(l_v39_0);
    end);
    itSKIP("Test defaultProps on initial render", function() --[[ Line: 147 ]]

    end);
    itSKIP("Test defaultProps on prop update", function() --[[ Line: 148 ]]

    end);
    itSKIP("Test defaultProps on state update", function() --[[ Line: 149 ]]

    end);
end;