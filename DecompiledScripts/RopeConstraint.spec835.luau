local l_RopeConstraint_0 = require(script.Parent:WaitForChild("RopeConstraint"));
local function _(v1, v2, v3) --[[ Line: 3 ]] --[[ Name: CreateBone ]]
    return {
        Position = v1, 
        FreeLength = v2, 
        ParentIndex = v3
    };
end;
return function() --[[ Line: 11 ]]
    -- upvalues: l_RopeConstraint_0 (copy)
    local v5 = {
        Bones = {
            {
                Position = Vector3.new(0, 0, 0, 0), 
                FreeLength = 3, 
                ParentIndex = 0
            }, 
            {
                Position = Vector3.new(0, 10, 0, 0), 
                FreeLength = 3, 
                ParentIndex = 1
            }
        }
    };
    describe("Rope Constraint", function() --[[ Line: 19 ]]
        -- upvalues: v5 (copy), l_RopeConstraint_0 (ref)
        local v6 = v5.Bones[2];
        local v7 = 0;
        local v8 = nil;
        local function v10() --[[ Line: 25 ]] --[[ Name: LimitCallback ]]
            -- upvalues: l_RopeConstraint_0 (ref), v6 (copy), v5 (ref), v8 (ref)
            local v9 = l_RopeConstraint_0(v6, v6.Position, v5);
            expect(v9.Magnitude).to.equal(v6.FreeLength);
            v6.FreeLength = math.random(1, 20);
            v8();
        end;
        local function v12() --[[ Line: 35 ]] --[[ Name: SameCallback ]]
            -- upvalues: l_RopeConstraint_0 (ref), v6 (copy), v5 (ref), v8 (ref)
            local v11 = l_RopeConstraint_0(v6, v6.Position, v5);
            expect(v11.Magnitude).to.equal(v6.Position.Magnitude);
            v6.FreeLength = math.random(1, 20);
            v8();
        end;
        v8 = function() --[[ Line: 45 ]]
            -- upvalues: v7 (ref), v6 (copy), v12 (copy), v10 (copy)
            if v7 >= 10 then
                return;
            else
                v7 = v7 + 1;
                if v6.Position.Magnitude < v6.FreeLength then
                    it(("Should stay the same #%*"):format(v7), v12);
                    return;
                else
                    it(("Should limit to %* studs #%*"):format(v6.FreeLength, v7), v10);
                    return;
                end;
            end;
        end;
        v8();
    end);
end;