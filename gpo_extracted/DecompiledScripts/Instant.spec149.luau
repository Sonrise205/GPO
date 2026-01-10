return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.Instant);
    it("should return a completed state with the provided value", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        local v1 = v0.new(1.23):step(0.1, {
            value = 0, 
            complete = false
        });
        expect(v1.complete).to.equal(true);
        expect(v1.value).to.equal(1.23);
    end);
end;