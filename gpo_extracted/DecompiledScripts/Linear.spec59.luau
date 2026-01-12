return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.SingleMotor);
    local v1 = require(script.Parent.Linear);
    describe("completed state", function() --[[ Line: 5 ]]
        -- upvalues: v0 (copy), v1 (copy)
        local v2 = v0.new(0, false);
        v2:setGoal((v1.new(1, {
            velocity = 1
        })));
        for _ = 1, 60 do
            v2:step(0.016666666666666666);
        end;
        it("should complete", function() --[[ Line: 15 ]]
            -- upvalues: v2 (copy)
            expect(v2._state.complete).to.equal(true);
        end);
        it("should be exactly the goal value when completed", function() --[[ Line: 19 ]]
            -- upvalues: v2 (copy)
            expect(v2._state.value).to.equal(1);
        end);
    end);
    describe("uncompleted state", function() --[[ Line: 24 ]]
        -- upvalues: v0 (copy), v1 (copy)
        local v4 = v0.new(0, false);
        v4:setGoal((v1.new(1, {
            velocity = 1
        })));
        for _ = 1, 59 do
            v4:step(0.016666666666666666);
        end;
        it("should be uncomplete", function() --[[ Line: 34 ]]
            -- upvalues: v4 (copy)
            expect(v4._state.complete).to.equal(false);
        end);
    end);
    describe("negative velocity", function() --[[ Line: 39 ]]
        -- upvalues: v0 (copy), v1 (copy)
        local v6 = v0.new(1, false);
        v6:setGoal((v1.new(0, {
            velocity = 1
        })));
        for _ = 1, 60 do
            v6:step(0.016666666666666666);
        end;
        it("should complete", function() --[[ Line: 49 ]]
            -- upvalues: v6 (copy)
            expect(v6._state.complete).to.equal(true);
        end);
        it("should be exactly the goal value when completed", function() --[[ Line: 53 ]]
            -- upvalues: v6 (copy)
            expect(v6._state.value).to.equal(0);
        end);
    end);
end;