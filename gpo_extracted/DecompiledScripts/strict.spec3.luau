return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.strict);
    it("should error when getting a nonexistent key", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        local v1 = v0({
            a = 1, 
            b = 2
        });
        expect(function() --[[ Line: 10 ]]
            -- upvalues: v1 (copy)
            return v1.c;
        end).to.throw();
    end);
    it("should error when setting a nonexistent key", function() --[[ Line: 15 ]]
        -- upvalues: v0 (copy)
        local v2 = v0({
            a = 1, 
            b = 2
        });
        expect(function() --[[ Line: 21 ]]
            -- upvalues: v2 (copy)
            v2.c = 3;
        end).to.throw();
    end);
end;