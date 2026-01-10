return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.GlobalConfig);
    it("should have the correct methods", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        expect(v0).to.be.ok();
        expect(v0.set).to.be.ok();
        expect(v0.get).to.be.ok();
    end);
end;