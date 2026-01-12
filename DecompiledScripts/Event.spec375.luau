return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.Parent.Type);
    local v1 = require(script.Parent.Event);
    it("should yield event objects when indexed", function() --[[ Line: 6 ]]
        -- upvalues: v0 (copy), v1 (copy)
        expect(v0.of(v1.MouseButton1Click)).to.equal(v0.HostEvent);
        expect(v0.of(v1.Touched)).to.equal(v0.HostEvent);
    end);
    it("should yield the same object when indexed again", function() --[[ Line: 11 ]]
        -- upvalues: v1 (copy)
        local l_MouseButton1Click_0 = v1.MouseButton1Click;
        local l_MouseButton1Click_1 = v1.MouseButton1Click;
        local l_Touched_0 = v1.Touched;
        expect(l_MouseButton1Click_0).to.equal(l_MouseButton1Click_1);
        expect(l_MouseButton1Click_0).never.to.equal(l_Touched_0);
    end);
end;