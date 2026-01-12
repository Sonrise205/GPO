return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.SingleMotor);
    local v1 = require(script.Parent.Spring);
    describe("completed state", function() --[[ Line: 5 ]]
        -- upvalues: v0 (copy), v1 (copy)
        local v2 = v0.new(0, false);
        v2:setGoal((v1.new(1, {
            frequency = 2, 
            dampingRatio = 0.75
        })));
        for _ = 1, 100 do
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
    it("should inherit velocity", function() --[[ Line: 24 ]]
        -- upvalues: v0 (copy), v1 (copy)
        local v4 = v0.new(0, false);
        v4._state = {
            complete = false, 
            value = 0, 
            velocity = -5
        };
        v4:setGoal((v1.new(1, {
            frequency = 2, 
            dampingRatio = 1
        })));
        v4:step(0.016666666666666666);
        expect(v4._state.velocity < 0).to.equal(true);
    end);
end;