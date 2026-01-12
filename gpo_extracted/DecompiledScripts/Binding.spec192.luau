return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.createSpy);
    local v1 = require(script.Parent.Type);
    local v2 = require(script.Parent.GlobalConfig);
    local v3 = require(script.Parent.Binding);
    describe("Binding.create", function() --[[ Line: 8 ]]
        -- upvalues: v3 (copy), v1 (copy)
        it("should return a Binding object and an update function", function() --[[ Line: 9 ]]
            -- upvalues: v3 (ref), v1 (ref)
            local v4, v5 = v3.create(1);
            expect(v1.of(v4)).to.equal(v1.Binding);
            expect((typeof(v5))).to.equal("function");
        end);
        it("should support tostring on bindings", function() --[[ Line: 16 ]]
            -- upvalues: v3 (ref)
            local v6, v7 = v3.create(1);
            expect((tostring(v6))).to.equal("RoactBinding(1)");
            v7("foo");
            expect((tostring(v6))).to.equal("RoactBinding(foo)");
        end);
    end);
    describe("Binding object", function() --[[ Line: 25 ]]
        -- upvalues: v3 (copy), v0 (copy)
        it("should provide a getter and setter", function() --[[ Line: 26 ]]
            -- upvalues: v3 (ref)
            local v8, v9 = v3.create(1);
            expect(v8:getValue()).to.equal(1);
            v9(3);
            expect(v8:getValue()).to.equal(3);
        end);
        it("should let users subscribe and unsubscribe to its updates", function() --[[ Line: 36 ]]
            -- upvalues: v3 (ref), v0 (ref)
            local v10, v11 = v3.create(1);
            local v12 = v0();
            local v13 = v3.subscribe(v10, v12.value);
            expect(v12.callCount).to.equal(0);
            v11(2);
            expect(v12.callCount).to.equal(1);
            v12:assertCalledWith(2);
            v13();
            v11(3);
            expect(v12.callCount).to.equal(1);
        end);
    end);
    describe("Mapped bindings", function() --[[ Line: 56 ]]
        -- upvalues: v3 (copy), v0 (copy)
        it("should be composable", function() --[[ Line: 57 ]]
            -- upvalues: v3 (ref)
            local v14, v15 = v3.create("hi");
            local v16 = v14:map(string.len);
            local v18 = v16:map(function(v17) --[[ Line: 61 ]]
                return v17 % 2 == 0;
            end);
            expect(v14:getValue()).to.equal("hi");
            expect(v16:getValue()).to.equal(2);
            expect(v18:getValue()).to.equal(true);
            v15("sup");
            expect(v14:getValue()).to.equal("sup");
            expect(v16:getValue()).to.equal(3);
            expect(v18:getValue()).to.equal(false);
        end);
        it("should cascade updates when subscribed", function() --[[ Line: 76 ]]
            -- upvalues: v3 (ref), v0 (ref)
            local v19, v20 = v3.create("hi");
            local v21 = v0();
            local v22 = v3.subscribe(v19, v21.value);
            local v23 = v19:map(string.len);
            local v24 = v0();
            local v25 = v3.subscribe(v23, v24.value);
            local v27 = v23:map(function(v26) --[[ Line: 90 ]]
                return v26 % 2 == 0;
            end);
            local v28 = v0();
            local v29 = v3.subscribe(v27, v28.value);
            expect(v21.callCount).to.equal(0);
            expect(v24.callCount).to.equal(0);
            expect(v28.callCount).to.equal(0);
            v20("nice");
            expect(v21.callCount).to.equal(1);
            v21:assertCalledWith("nice");
            expect(v24.callCount).to.equal(1);
            v24:assertCalledWith(4);
            expect(v28.callCount).to.equal(1);
            v28:assertCalledWith(true);
            v22();
            v25();
            v29();
            v20("goodbye");
            expect(v21.callCount).to.equal(1);
            expect(v28.callCount).to.equal(1);
            expect(v24.callCount).to.equal(1);
        end);
        it("should throw when updated directly", function() --[[ Line: 123 ]]
            -- upvalues: v3 (ref)
            local v31 = v3.create(1):map(function(v30) --[[ Line: 125 ]]
                return v30;
            end);
            expect(function() --[[ Line: 129 ]]
                -- upvalues: v3 (ref), v31 (copy)
                v3.update(v31, 5);
            end).to.throw();
        end);
    end);
    describe("Binding.join", function() --[[ Line: 135 ]]
        -- upvalues: v3 (copy), v0 (copy), v2 (copy)
        it("should have getValue", function() --[[ Line: 136 ]]
            -- upvalues: v3 (ref)
            local v32 = v3.create(1);
            local v33 = v3.create(2);
            local v34 = v3.create(3);
            local v35 = v3.join({
                v32, 
                v33; 
                foo = v34
            }):getValue();
            expect(v35).to.be.a("table");
            expect(v35[1]).to.equal(1);
            expect(v35[2]).to.equal(2);
            expect(v35.foo).to.equal(3);
        end);
        it("should update when any one of the subscribed bindings updates", function() --[[ Line: 154 ]]
            -- upvalues: v3 (ref), v0 (ref)
            local v36, v37 = v3.create(1);
            local v38, v39 = v3.create(2);
            local v40, v41 = v3.create(3);
            local v42 = v3.join({
                v36, 
                v38; 
                foo = v40
            });
            local v43 = v0();
            v3.subscribe(v42, v43.value);
            expect(v43.callCount).to.equal(0);
            v37(3);
            expect(v43.callCount).to.equal(1);
            local v44 = v43:captureValues("value");
            expect(v44.value).to.be.a("table");
            expect(v44.value[1]).to.equal(3);
            expect(v44.value[2]).to.equal(2);
            expect(v44.value.foo).to.equal(3);
            v39(4);
            expect(v43.callCount).to.equal(2);
            v44 = v43:captureValues("value");
            expect(v44.value).to.be.a("table");
            expect(v44.value[1]).to.equal(3);
            expect(v44.value[2]).to.equal(4);
            expect(v44.value.foo).to.equal(3);
            v41(8);
            expect(v43.callCount).to.equal(3);
            v44 = v43:captureValues("value");
            expect(v44.value).to.be.a("table");
            expect(v44.value[1]).to.equal(3);
            expect(v44.value[2]).to.equal(4);
            expect(v44.value.foo).to.equal(8);
        end);
        it("should disconnect from all upstream bindings", function() --[[ Line: 198 ]]
            -- upvalues: v3 (ref), v0 (ref)
            local v45, v46 = v3.create(1);
            local v47, v48 = v3.create(2);
            local v49 = v3.join({
                v45, 
                v47
            });
            local v50 = v0();
            local v51 = v3.subscribe(v49, v50.value);
            expect(v50.callCount).to.equal(0);
            v46(3);
            expect(v50.callCount).to.equal(1);
            v48(3);
            expect(v50.callCount).to.equal(2);
            v51();
            v46(4);
            expect(v50.callCount).to.equal(2);
            v48(2);
            expect(v50.callCount).to.equal(2);
            local v52 = v49:getValue();
            expect(v52[1]).to.equal(4);
            expect(v52[2]).to.equal(2);
        end);
        it("should be okay with calling disconnect multiple times", function() --[[ Line: 227 ]]
            -- upvalues: v3 (ref)
            local v53 = v3.join({});
            local v54 = v3.subscribe(v53, function() --[[ Line: 230 ]]

            end);
            v54();
            v54();
        end);
        it("should throw if updated directly", function() --[[ Line: 236 ]]
            -- upvalues: v3 (ref)
            local v55 = v3.join({});
            expect(function() --[[ Line: 239 ]]
                -- upvalues: v3 (ref), v55 (copy)
                v3.update(v55, 0);
            end);
        end);
        it("should throw when a non-table value is passed", function() --[[ Line: 244 ]]
            -- upvalues: v2 (ref), v3 (ref)
            v2.scoped({
                typeChecks = true
            }, function() --[[ Line: 247 ]]
                -- upvalues: v3 (ref)
                expect(function() --[[ Line: 248 ]]
                    -- upvalues: v3 (ref)
                    v3.join("hi");
                end).to.throw();
            end);
        end);
        it("should throw when a non-binding value is passed via table", function() --[[ Line: 254 ]]
            -- upvalues: v2 (ref), v3 (ref)
            v2.scoped({
                typeChecks = true
            }, function() --[[ Line: 257 ]]
                -- upvalues: v3 (ref)
                expect(function() --[[ Line: 258 ]]
                    -- upvalues: v3 (ref)
                    local v56 = v3.create(123);
                    v3.join({
                        v56, 
                        "abcde"
                    });
                end).to.throw();
            end);
        end);
    end);
end;