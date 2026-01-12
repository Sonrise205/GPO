return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.assertDeepEqual);
    it("should fail with a message when args are not equal", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        local l_status_0, l_result_0 = pcall(v0, 1, 2);
        expect(l_status_0).to.equal(false);
        expect(l_result_0:find("first ~= second")).to.be.ok();
        local l_status_1, l_result_1 = pcall(v0, {
            foo = 1
        }, {
            foo = 2
        });
        l_status_0 = l_status_1;
        l_result_0 = l_result_1;
        expect(l_status_0).to.equal(false);
        expect(l_result_0:find("first%[foo%] ~= second%[foo%]")).to.be.ok();
    end);
    it("should compare non-table values using standard '==' equality", function() --[[ Line: 20 ]]
        -- upvalues: v0 (copy)
        v0(1, 1);
        v0("hello", "hello");
        v0(nil, nil);
        local function v5() --[[ Line: 25 ]]

        end;
        v0(v5, v5);
        local v6 = {
            foo = v5
        };
        local v7 = {
            foo = v5
        };
        v0(v6, v7);
    end);
    it("should fail when types differ", function() --[[ Line: 40 ]]
        -- upvalues: v0 (copy)
        local l_status_2, l_result_2 = pcall(v0, 1, "1");
        expect(l_status_2).to.equal(false);
        expect(l_result_2:find("first is of type number, but second is of type string")).to.be.ok();
    end);
    it("should compare (and report about) nested tables", function() --[[ Line: 47 ]]
        -- upvalues: v0 (copy)
        local v10 = {
            foo = "bar", 
            nested = {
                foo = 1, 
                bar = 2
            }
        };
        local v11 = {
            foo = "bar", 
            nested = {
                foo = 1, 
                bar = 2
            }
        };
        v0(v10, v11);
        local v12 = {
            foo = "bar", 
            nested = {
                foo = 1, 
                bar = 3
            }
        };
        local l_status_3, l_result_3 = pcall(v0, v10, v12);
        expect(l_status_3).to.equal(false);
        expect(l_result_3:find("first%[nested%]%[bar%] ~= second%[nested%]%[bar%]")).to.be.ok();
    end);
    it("should be commutative", function() --[[ Line: 79 ]]
        -- upvalues: v0 (copy)
        local v15 = {
            foo = "bar", 
            hello = "world"
        };
        local v16 = {
            foo = "bar", 
            hello = "world"
        };
        v0(v15, v16);
        v0(v16, v15);
        local v17 = {
            foo = "bar"
        };
        expect(function() --[[ Line: 96 ]]
            -- upvalues: v0 (ref), v15 (copy), v17 (copy)
            v0(v15, v17);
        end).to.throw();
        expect(function() --[[ Line: 99 ]]
            -- upvalues: v0 (ref), v17 (copy), v15 (copy)
            v0(v17, v15);
        end).to.throw();
    end);
end;