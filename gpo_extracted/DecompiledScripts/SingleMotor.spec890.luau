return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.SingleMotor);
    local v1 = require(script.Parent.Instant);
    it("should assign new state on step", function() --[[ Line: 5 ]]
        -- upvalues: v0 (copy), v1 (copy)
        local v2 = v0.new(0, false);
        v2:setGoal(v1.new(5));
        v2:step(0.016666666666666666);
        expect(v2._state.complete).to.equal(true);
        expect(v2._state.value).to.equal(5);
    end);
    it("should invoke onComplete listeners when the goal is completed", function() --[[ Line: 15 ]]
        -- upvalues: v0 (copy), v1 (copy)
        local v3 = v0.new(0, false);
        local v4 = false;
        v3:onComplete(function() --[[ Line: 19 ]]
            -- upvalues: v4 (ref)
            v4 = true;
        end);
        v3:setGoal(v1.new(5));
        v3:step(0.016666666666666666);
        expect(v4).to.equal(true);
    end);
    it("should start when the goal is set", function() --[[ Line: 29 ]]
        -- upvalues: v0 (copy), v1 (copy)
        local v5 = v0.new(0, false);
        local v6 = false;
        v5:onStart(function() --[[ Line: 33 ]]
            -- upvalues: v6 (ref)
            v6 = not v6;
        end);
        v5:setGoal(v1.new(5));
        expect(v6).to.equal(true);
        v5:setGoal(v1.new(5));
        expect(v6).to.equal(false);
    end);
end;