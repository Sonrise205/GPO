return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.GroupMotor);
    local v1 = require(script.Parent.Instant);
    local v2 = require(script.Parent.Spring);
    it("should complete when all child motors are complete", function() --[[ Line: 7 ]]
        -- upvalues: v0 (copy), v1 (copy), v2 (copy)
        local v3 = v0.new({
            A = 1, 
            B = 2
        }, false);
        expect(v3._complete).to.equal(true);
        v3:setGoal({
            A = v1.new(3), 
            B = v2.new(4, {
                frequency = 7.5, 
                dampingRatio = 1
            })
        });
        expect(v3._complete).to.equal(false);
        v3:step(0.016666666666666666);
        expect(v3._complete).to.equal(false);
        for _ = 1, 30 do
            v3:step(0.016666666666666666);
        end;
        expect(v3._complete).to.equal(true);
    end);
    it("should start when the goal is set", function() --[[ Line: 33 ]]
        -- upvalues: v0 (copy), v1 (copy)
        local v5 = v0.new({
            A = 0
        }, false);
        local v6 = false;
        v5:onStart(function() --[[ Line: 39 ]]
            -- upvalues: v6 (ref)
            v6 = not v6;
        end);
        v5:setGoal({
            A = v1.new(1)
        });
        expect(v6).to.equal(true);
        v5:setGoal({
            A = v1.new(1)
        });
        expect(v6).to.equal(false);
    end);
    it("should properly return all values", function() --[[ Line: 56 ]]
        -- upvalues: v0 (copy)
        local v7 = v0.new({
            A = 1, 
            B = 2
        }, false):getValue();
        expect(v7.A).to.equal(1);
        expect(v7.B).to.equal(2);
    end);
    it("should error when a goal is given to GroupMotor.new", function() --[[ Line: 68 ]]
        -- upvalues: v0 (copy), v1 (copy)
        local v8 = pcall(function() --[[ Line: 69 ]]
            -- upvalues: v0 (ref), v1 (ref)
            v0.new(v1.new(0));
        end);
        expect(v8).to.equal(false);
    end);
    it("should error when a single goal is provided to GroupMotor:step", function() --[[ Line: 76 ]]
        -- upvalues: v0 (copy), v1 (copy)
        local v9 = pcall(function() --[[ Line: 77 ]]
            -- upvalues: v0 (ref), v1 (ref)
            v0.new({
                a = 1
            }):setGoal(v1.new(0));
        end);
        expect(v9).to.equal(false);
    end);
end;