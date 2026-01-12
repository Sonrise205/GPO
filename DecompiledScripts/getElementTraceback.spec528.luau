return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.Parent.createElement);
    local v1 = require(script.Parent.Parent.createReconciler);
    local v2 = require(script.Parent.Parent.GlobalConfig);
    local v3 = require(script.Parent.Parent.NoopRenderer);
    local v4 = require(script.Parent.Parent.Component);
    local v5 = v1(v3);
    it("should return stack traces in initial renders", function() --[[ Line: 11 ]]
        -- upvalues: v4 (copy), v2 (copy), v0 (copy), v5 (copy)
        local v6 = v4:extend("TestComponent");
        local v7 = nil;
        v6.init = function(v8) --[[ Line: 15 ]] --[[ Name: init ]]
            -- upvalues: v7 (ref)
            v7 = v8:getElementTraceback();
        end;
        v6.render = function(_) --[[ Line: 19 ]] --[[ Name: render ]]
            return nil;
        end;
        local v10 = {
            elementTracing = true
        };
        v2.scoped(v10, function() --[[ Line: 27 ]]
            -- upvalues: v0 (ref), v6 (copy), v5 (ref)
            local v11 = v0(v6);
            v5.mountVirtualNode(v11, nil, "Some key");
        end);
        expect(v7).to.be.a("string");
    end);
    itSKIP("it should return an updated stack trace after an update", function() --[[ Line: 38 ]]

    end);
    it("should return nil when elementTracing is off", function() --[[ Line: 40 ]]
        -- upvalues: v4 (copy), v2 (copy), v0 (copy), v5 (copy)
        local v12 = nil;
        local v13 = {
            elementTracing = false
        };
        local v14 = v4:extend("TestComponent");
        v14.init = function(v15) --[[ Line: 49 ]] --[[ Name: init ]]
            -- upvalues: v12 (ref)
            v12 = v15:getElementTraceback();
        end;
        v14.render = function(_) --[[ Line: 53 ]] --[[ Name: render ]]
            return nil;
        end;
        v2.scoped(v13, function() --[[ Line: 57 ]]
            -- upvalues: v0 (ref), v14 (copy), v5 (ref)
            local v17 = v0(v14);
            v5.mountVirtualNode(v17, nil, "Some key");
        end);
        expect(v12).to.equal(nil);
    end);
end;