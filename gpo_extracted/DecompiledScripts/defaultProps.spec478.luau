return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.Parent.assertDeepEqual);
    local v1 = require(script.Parent.Parent.createElement);
    local v2 = require(script.Parent.Parent.createReconciler);
    local v3 = require(script.Parent.Parent.None);
    local v4 = require(script.Parent.Parent.NoopRenderer);
    local v5 = require(script.Parent.Parent.Component);
    local v6 = v2(v4);
    it("should fill in when mounting before init", function() --[[ Line: 12 ]]
        -- upvalues: v5 (copy), v1 (copy), v6 (copy), v0 (copy)
        local v7 = {
            a = 3, 
            b = 2
        };
        local v8 = v5:extend("Foo");
        v8.defaultProps = v7;
        local v9 = nil;
        v8.init = function(v10) --[[ Line: 23 ]] --[[ Name: init ]]
            -- upvalues: v9 (ref)
            v9 = v10.props;
        end;
        v8.render = function(_) --[[ Line: 27 ]] --[[ Name: render ]]

        end;
        local v12 = {
            b = 4, 
            c = 6
        };
        local v13 = v1(v8, v12);
        v6.mountVirtualNode(v13, nil, "Some Foo");
        local v14 = {
            a = v7.a, 
            b = v12.b, 
            c = v12.c
        };
        v0(v9, v14);
    end);
    it("should fill in when updating via props", function() --[[ Line: 49 ]]
        -- upvalues: v5 (copy), v1 (copy), v6 (copy), v0 (copy)
        local v15 = {
            a = 3, 
            b = 2
        };
        local v16 = v5:extend("Foo");
        v16.defaultProps = v15;
        local v17 = nil;
        v16.render = function(v18) --[[ Line: 60 ]] --[[ Name: render ]]
            -- upvalues: v17 (ref)
            v17 = v18.props;
        end;
        local v19 = {
            b = 4, 
            c = 6
        };
        local v20 = v1(v16, v19);
        local v21 = v6.mountVirtualNode(v20, nil, "Some Foo");
        local v22 = {
            c = 5
        };
        local v23 = v1(v16, v22);
        v6.updateVirtualNode(v21, v23);
        local v24 = {
            a = v15.a, 
            b = v15.b, 
            c = v22.c
        };
        v0(v17, v24);
    end);
    it("should respect None to override a default prop with nil", function() --[[ Line: 91 ]]
        -- upvalues: v5 (copy), v3 (copy), v1 (copy), v6 (copy), v0 (copy)
        local v25 = {
            a = 3, 
            b = 2
        };
        local v26 = v5:extend("Foo");
        v26.defaultProps = v25;
        local v27 = nil;
        v26.render = function(v28) --[[ Line: 102 ]] --[[ Name: render ]]
            -- upvalues: v27 (ref)
            v27 = v28.props;
        end;
        local v29 = {
            b = v3, 
            c = 4
        };
        local v30 = v1(v26, v29);
        v6.mountVirtualNode(v30, nil, "Some Foo");
        local v31 = {
            a = v25.a, 
            b = nil, 
            c = v29.c
        };
        v0(v27, v31);
    end);
end;