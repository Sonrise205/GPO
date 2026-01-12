local l_DistanceConstraint_0 = require(script.Parent:WaitForChild("DistanceConstraint"));
local function _(v1, v2, v3) --[[ Line: 3 ]] --[[ Name: CreateBone ]]
    return {
        Position = v1, 
        FreeLength = v2, 
        ParentIndex = v3
    };
end;
return function() --[[ Line: 11 ]]
    -- upvalues: l_DistanceConstraint_0 (copy)
    local v5 = {
        Bones = {
            {
                Position = Vector3.new(0, 0, 0, 0), 
                FreeLength = 3, 
                ParentIndex = 0
            }, 
            {
                Position = Vector3.new(0, 1, 0, 0), 
                FreeLength = 3, 
                ParentIndex = 1
            }
        }
    };
    describe("Distance Constraint", function() --[[ Line: 19 ]]
        -- upvalues: v5 (copy), l_DistanceConstraint_0 (ref)
        local v6 = v5.Bones[2];
        local function v8() --[[ Line: 22 ]] --[[ Name: Callback ]]
            -- upvalues: l_DistanceConstraint_0 (ref), v6 (copy), v5 (ref)
            local v7 = l_DistanceConstraint_0(v6, v6.Position, v5);
            expect(v7.Magnitude).to.equal(v6.FreeLength);
            v6.Position = v7;
        end;
        for v9 = 1, 10 do
            it(("Should limit to %* studs #%*"):format(v6.FreeLength, v9), v8);
            v6.FreeLength = math.random(1, 20);
        end;
    end);
end;