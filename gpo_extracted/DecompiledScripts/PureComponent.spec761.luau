return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.createElement);
    local v1 = require(script.Parent.NoopRenderer);
    local v2 = require(script.Parent.createReconciler);
    local v3 = require(script.Parent.PureComponent);
    local v4 = v2(v1);
    it("should be extendable", function() --[[ Line: 10 ]]
        -- upvalues: v3 (copy)
        local v5 = v3:extend("MyComponent");
        expect(v5).to.be.ok();
    end);
    it("should skip updates for shallow-equal props", function() --[[ Line: 16 ]]
        -- upvalues: v3 (copy), v0 (copy), v4 (copy)
        local v6 = 0;
        local v7 = nil;
        local v8 = v3:extend("PureChild");
        v8.willUpdate = function(_) --[[ Line: 22 ]] --[[ Name: willUpdate ]]
            -- upvalues: v6 (ref)
            v6 = v6 + 1;
        end;
        v8.render = function(_) --[[ Line: 26 ]] --[[ Name: render ]]
            return nil;
        end;
        local v11 = v3:extend("PureContainer");
        v11.init = function(v12) --[[ Line: 32 ]] --[[ Name: init ]]
            v12.state = {
                value = 0
            };
        end;
        v11.didMount = function(v13) --[[ Line: 38 ]] --[[ Name: didMount ]]
            -- upvalues: v7 (ref)
            v7 = function(v14) --[[ Line: 39 ]]
                -- upvalues: v13 (copy)
                v13:setState({
                    value = v14
                });
            end;
        end;
        v11.render = function(v15) --[[ Line: 46 ]] --[[ Name: render ]]
            -- upvalues: v0 (ref), v8 (copy)
            return v0(v8, {
                value = v15.state.value
            });
        end;
        local v16 = v0(v11);
        local v17 = v4.mountVirtualTree(v16, nil, "PureComponent Tree");
        expect(v6).to.equal(0);
        v7(1);
        expect(v6).to.equal(1);
        v7(1);
        expect(v6).to.equal(1);
        v7(2);
        expect(v6).to.equal(2);
        v7(1);
        expect(v6).to.equal(3);
        v4.unmountVirtualTree(v17);
    end);
end;