local v0 = require(game:GetService("ServerScriptService"):FindFirstChild("LoaderUtils", true).Parent).load(script)("RxInstanceUtils");
return function() --[[ Line: 9 ]]
    -- upvalues: v0 (copy)
    describe("RxInstanceUtils.observeChildrenBrio", function() --[[ Line: 10 ]]
        -- upvalues: v0 (ref)
        local l_Part_0 = Instance.new("Part");
        local v2 = v0.observeChildrenBrio(l_Part_0);
        local v3 = nil;
        it("should not emit anything", function() --[[ Line: 15 ]]
            -- upvalues: v2 (copy), v3 (ref)
            v2:Subscribe(function(v4) --[[ Line: 16 ]]
                -- upvalues: v3 (ref)
                v3 = v4;
            end);
            expect(v3).to.equal(nil);
        end);
    end);
end;