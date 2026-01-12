return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.Parent.Type);
    local v1 = require(script.Parent.Change);
    it("should yield change listener objects when indexed", function() --[[ Line: 6 ]]
        -- upvalues: v0 (copy), v1 (copy)
        expect(v0.of(v1.Text)).to.equal(v0.HostChangeEvent);
        expect(v0.of(v1.Selected)).to.equal(v0.HostChangeEvent);
    end);
    it("should yield the same object when indexed again", function() --[[ Line: 11 ]]
        -- upvalues: v1 (copy)
        local l_Text_0 = v1.Text;
        local l_Text_1 = v1.Text;
        local l_Selected_0 = v1.Selected;
        expect(l_Text_0).to.equal(l_Text_1);
        expect(l_Text_0).never.to.equal(l_Selected_0);
    end);
end;