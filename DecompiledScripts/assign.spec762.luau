return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.None);
    local v1 = require(script.Parent.assign);
    it("should accept zero additional tables", function() --[[ Line: 6 ]]
        -- upvalues: v1 (copy)
        local v2 = {};
        local v3 = v1(v2);
        expect(v2).to.equal(v3);
    end);
    it("should merge multiple tables onto the given target table", function() --[[ Line: 13 ]]
        -- upvalues: v1 (copy)
        local v4 = {
            a = 5, 
            b = 6
        };
        local v5 = {
            b = 7, 
            c = 8
        };
        local v6 = {
            b = 8
        };
        v1(v4, v5, v6);
        expect(v4.a).to.equal(5);
        expect(v4.b).to.equal(v6.b);
        expect(v4.c).to.equal(v5.c);
    end);
    it("should remove keys if specified as None", function() --[[ Line: 35 ]]
        -- upvalues: v0 (copy), v1 (copy)
        local v7 = {
            foo = 2, 
            bar = 3
        };
        local v8 = {
            foo = v0
        };
        v1(v7, v8);
        expect(v7.foo).to.equal(nil);
        expect(v7.bar).to.equal(3);
    end);
    it("should re-add keys if specified after None", function() --[[ Line: 51 ]]
        -- upvalues: v0 (copy), v1 (copy)
        local v9 = {
            foo = 2
        };
        local v10 = {
            foo = v0
        };
        local v11 = {
            foo = 3
        };
        v1(v9, v10, v11);
        expect(v9.foo).to.equal(v11.foo);
    end);
end;