return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.createElement);
    local v1 = require(script.Parent.oneChild);
    it("should get zero children from a table", function() --[[ Line: 6 ]]
        -- upvalues: v1 (copy)
        expect(v1({})).to.equal(nil);
    end);
    it("should get exactly one child", function() --[[ Line: 12 ]]
        -- upvalues: v0 (copy), v1 (copy)
        local v2 = v0("Frame");
        local v3 = {
            foo = v2
        };
        expect(v1(v3)).to.equal(v2);
    end);
    it("should error with more than one child", function() --[[ Line: 21 ]]
        -- upvalues: v0 (copy), v1 (copy)
        local v4 = {
            a = v0("Frame"), 
            b = v0("Frame")
        };
        expect(function() --[[ Line: 27 ]]
            -- upvalues: v1 (ref), v4 (copy)
            v1(v4);
        end).to.throw();
    end);
    it("should handle being passed nil", function() --[[ Line: 32 ]]
        -- upvalues: v1 (copy)
        expect(v1(nil)).to.equal(nil);
    end);
end;