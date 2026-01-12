return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.createSpy);
    describe("createSpy", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        it("should create spies", function() --[[ Line: 5 ]]
            -- upvalues: v0 (ref)
            local v1 = v0(function() --[[ Line: 6 ]]

            end);
            expect(v1).to.be.ok();
        end);
        it("should throw if spies are indexed by an invalid key", function() --[[ Line: 11 ]]
            -- upvalues: v0 (ref)
            local v2 = v0(function() --[[ Line: 12 ]]

            end);
            expect(function() --[[ Line: 14 ]]
                -- upvalues: v2 (copy)
                return v2.test;
            end).to.throw();
        end);
    end);
    describe("value", function() --[[ Line: 20 ]]
        -- upvalues: v0 (copy)
        it("should increment callCount when called", function() --[[ Line: 21 ]]
            -- upvalues: v0 (ref)
            local v3 = v0(function() --[[ Line: 22 ]]

            end);
            v3.value();
            expect(v3.callCount).to.equal(1);
        end);
        it("should store all values passed", function() --[[ Line: 28 ]]
            -- upvalues: v0 (ref)
            local v4 = v0(function() --[[ Line: 29 ]]

            end);
            v4.value(1, true, "3");
            expect(v4.valuesLength).to.equal(3);
            expect(v4.values[1]).to.equal(1);
            expect(v4.values[2]).to.equal(true);
            expect(v4.values[3]).to.equal("3");
        end);
        it("should return the value of the inner function", function() --[[ Line: 38 ]]
            -- upvalues: v0 (ref)
            local v5 = v0(function() --[[ Line: 39 ]]
                return true;
            end);
            expect(v5.value()).to.equal(true);
        end);
    end);
    describe("assertCalledWith", function() --[[ Line: 47 ]]
        -- upvalues: v0 (copy)
        it("should throw if the number of values differs", function() --[[ Line: 48 ]]
            -- upvalues: v0 (ref)
            local v6 = v0(function() --[[ Line: 49 ]]

            end);
            v6.value(1, 2);
            expect(function() --[[ Line: 52 ]]
                -- upvalues: v6 (copy)
                v6:assertCalledWith(1);
            end).to.throw();
        end);
        it("should throw if any value differs", function() --[[ Line: 57 ]]
            -- upvalues: v0 (ref)
            local v7 = v0(function() --[[ Line: 58 ]]

            end);
            v7.value(1, 2);
            expect(function() --[[ Line: 61 ]]
                -- upvalues: v7 (copy)
                v7:assertCalledWith(1, 3);
            end).to.throw();
            expect(function() --[[ Line: 65 ]]
                -- upvalues: v7 (copy)
                v7:assertCalledWith(2, 3);
            end).to.throw();
        end);
    end);
    describe("captureValues", function() --[[ Line: 71 ]]
        -- upvalues: v0 (copy)
        it("should throw if the number of values differs", function() --[[ Line: 72 ]]
            -- upvalues: v0 (ref)
            local v8 = v0(function() --[[ Line: 73 ]]

            end);
            v8.value(1, 2);
            expect(function() --[[ Line: 76 ]]
                -- upvalues: v8 (copy)
                v8:captureValues("a");
            end).to.throw();
        end);
        it("should capture all values in a table", function() --[[ Line: 81 ]]
            -- upvalues: v0 (ref)
            local v9 = v0(function() --[[ Line: 82 ]]

            end);
            v9.value(1, 2);
            local v10 = v9:captureValues("a", "b");
            expect(v10.a).to.equal(1);
            expect(v10.b).to.equal(2);
        end);
    end);
end;