return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.Parent.createElement);
    local v1 = require(script.Parent.Parent.createReconciler);
    local v2 = require(script.Parent.Parent.createSpy);
    local v3 = require(script.Parent.Parent.NoopRenderer);
    local v4 = require(script.Parent.Parent.GlobalConfig);
    local v5 = require(script.Parent.Parent.Component);
    local v6 = v1(v3);
    it("should be invoked when mounted", function() --[[ Line: 12 ]]
        -- upvalues: v4 (copy), v5 (copy), v2 (copy), v0 (copy), v6 (copy)
        local v7 = {
            propValidation = true
        };
        v4.scoped(v7, function() --[[ Line: 17 ]]
            -- upvalues: v5 (ref), v2 (ref), v0 (ref), v6 (ref)
            local v8 = v5:extend("MyComponent");
            local v9 = v2(function() --[[ Line: 20 ]]
                return true;
            end);
            v8.validateProps = v9.value;
            v8.render = function(_) --[[ Line: 26 ]] --[[ Name: render ]]
                return nil;
            end;
            local v11 = v0(v8);
            v6.mountVirtualNode(v11, nil, "Test");
            expect(v9.callCount).to.equal(1);
        end);
    end);
    it("should be invoked when props change", function() --[[ Line: 39 ]]
        -- upvalues: v4 (copy), v5 (copy), v2 (copy), v0 (copy), v6 (copy)
        local v12 = {
            propValidation = true
        };
        v4.scoped(v12, function() --[[ Line: 44 ]]
            -- upvalues: v5 (ref), v2 (ref), v0 (ref), v6 (ref)
            local v13 = v5:extend("MyComponent");
            local v14 = v2(function() --[[ Line: 47 ]]
                return true;
            end);
            v13.validateProps = v14.value;
            v13.render = function(_) --[[ Line: 53 ]] --[[ Name: render ]]
                return nil;
            end;
            local v16 = v0(v13, {
                a = 1
            });
            local v17 = v6.mountVirtualNode(v16, nil, "Test");
            expect(v14.callCount).to.equal(1);
            v14:assertCalledWithDeepEqual({
                a = 1
            });
            local v18 = v0(v13, {
                a = 2
            });
            v6.updateVirtualNode(v17, v18);
            expect(v14.callCount).to.equal(2);
            v14:assertCalledWithDeepEqual({
                a = 2
            });
        end);
    end);
    it("should not be invoked when state changes", function() --[[ Line: 76 ]]
        -- upvalues: v4 (copy), v5 (copy), v2 (copy), v0 (copy), v6 (copy)
        local v19 = {
            propValidation = true
        };
        v4.scoped(v19, function() --[[ Line: 81 ]]
            -- upvalues: v5 (ref), v2 (ref), v0 (ref), v6 (ref)
            local v20 = v5:extend("MyComponent");
            local v21 = nil;
            local v22 = v2(function() --[[ Line: 85 ]]
                return true;
            end);
            v20.validateProps = v22.value;
            v20.init = function(v23) --[[ Line: 91 ]] --[[ Name: init ]]
                -- upvalues: v21 (ref)
                v21 = function(v24) --[[ Line: 92 ]]
                    -- upvalues: v23 (copy)
                    v23:setState(v24);
                end;
            end;
            v20.render = function(_) --[[ Line: 97 ]] --[[ Name: render ]]
                return nil;
            end;
            local v26 = v0(v20, {
                a = 1
            });
            v6.mountVirtualNode(v26, nil, "Test");
            expect(v22.callCount).to.equal(1);
            v22:assertCalledWithDeepEqual({
                a = 1
            });
            v21({
                b = 1
            });
            expect(v22.callCount).to.equal(1);
        end);
    end);
    it("should throw if validateProps is not a function", function() --[[ Line: 119 ]]
        -- upvalues: v4 (copy), v5 (copy), v0 (copy), v6 (copy)
        local v27 = {
            propValidation = true
        };
        v4.scoped(v27, function() --[[ Line: 124 ]]
            -- upvalues: v5 (ref), v0 (ref), v6 (ref)
            local v28 = v5:extend("MyComponent");
            v28.validateProps = 1;
            v28.render = function(_) --[[ Line: 128 ]] --[[ Name: render ]]
                return nil;
            end;
            local v30 = v0(v28);
            expect(function() --[[ Line: 136 ]]
                -- upvalues: v6 (ref), v30 (copy)
                v6.mountVirtualNode(v30, nil, "Test");
            end).to.throw();
        end);
    end);
    it("should throw if validateProps returns false", function() --[[ Line: 142 ]]
        -- upvalues: v4 (copy), v5 (copy), v0 (copy), v6 (copy)
        local v31 = {
            propValidation = true
        };
        v4.scoped(v31, function() --[[ Line: 147 ]]
            -- upvalues: v5 (ref), v0 (ref), v6 (ref)
            local v32 = v5:extend("MyComponent");
            v32.validateProps = function() --[[ Line: 149 ]]
                return false;
            end;
            v32.render = function(_) --[[ Line: 153 ]] --[[ Name: render ]]
                return nil;
            end;
            local v34 = v0(v32);
            expect(function() --[[ Line: 161 ]]
                -- upvalues: v6 (ref), v34 (copy)
                v6.mountVirtualNode(v34, nil, "Test");
            end).to.throw();
        end);
    end);
    it("should include the component name in the error message", function() --[[ Line: 167 ]]
        -- upvalues: v4 (copy), v5 (copy), v0 (copy), v6 (copy)
        local v35 = {
            propValidation = true
        };
        v4.scoped(v35, function() --[[ Line: 172 ]]
            -- upvalues: v5 (ref), v0 (ref), v6 (ref)
            local v36 = v5:extend("MyComponent");
            v36.validateProps = function() --[[ Line: 174 ]]
                return false;
            end;
            v36.render = function(_) --[[ Line: 178 ]] --[[ Name: render ]]
                return nil;
            end;
            local v38 = v0(v36);
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 186 ]]
                -- upvalues: v6 (ref), v38 (copy)
                v6.mountVirtualNode(v38, nil, "Test");
            end);
            expect(l_status_0).to.equal(false);
            local v41 = l_result_0:find("MyComponent");
            expect(v41).to.be.ok();
        end);
    end);
    it("should be invoked after defaultProps are applied", function() --[[ Line: 196 ]]
        -- upvalues: v4 (copy), v5 (copy), v2 (copy), v0 (copy), v6 (copy)
        local v42 = {
            propValidation = true
        };
        v4.scoped(v42, function() --[[ Line: 201 ]]
            -- upvalues: v5 (ref), v2 (ref), v0 (ref), v6 (ref)
            local v43 = v5:extend("MyComponent");
            local v44 = v2(function() --[[ Line: 204 ]]
                return true;
            end);
            v43.validateProps = v44.value;
            v43.render = function(_) --[[ Line: 210 ]] --[[ Name: render ]]
                return nil;
            end;
            v43.defaultProps = {
                b = 2
            };
            local v46 = v0(v43, {
                a = 1
            });
            local v47 = v6.mountVirtualNode(v46, nil, "Test");
            expect(v44.callCount).to.equal(1);
            v44:assertCalledWithDeepEqual({
                a = 1, 
                b = 2
            });
            local v48 = v0(v43, {
                a = 2
            });
            v6.updateVirtualNode(v47, v48);
            expect(v44.callCount).to.equal(2);
            v44:assertCalledWithDeepEqual({
                a = 2, 
                b = 2
            });
        end);
    end);
    it("should not be invoked if the flag is off", function() --[[ Line: 239 ]]
        -- upvalues: v4 (copy), v5 (copy), v2 (copy), v0 (copy), v6 (copy)
        local v49 = {
            propValidation = false
        };
        v4.scoped(v49, function() --[[ Line: 244 ]]
            -- upvalues: v5 (ref), v2 (ref), v0 (ref), v6 (ref)
            local v50 = v5:extend("MyComponent");
            local v51 = v2(function() --[[ Line: 247 ]]
                return true;
            end);
            v50.validateProps = v51.value;
            v50.render = function(_) --[[ Line: 253 ]] --[[ Name: render ]]
                return nil;
            end;
            local v53 = v0(v50, {
                a = 1
            });
            local v54 = v6.mountVirtualNode(v53, nil, "Test");
            expect(v51.callCount).to.equal(0);
            local v55 = v0(v50, {
                a = 2
            });
            v6.updateVirtualNode(v54, v55);
            expect(v51.callCount).to.equal(0);
        end);
    end);
end;