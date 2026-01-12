local l_AxisConstraint_0 = require(script.Parent:WaitForChild("AxisConstraint"));
return function() --[[ Line: 3 ]]
    -- upvalues: l_AxisConstraint_0 (copy)
    local v1 = {
        Radius = 0, 
        XAxisLimits = NumberRange.new(-1e999, 1e999), 
        YAxisLimits = NumberRange.new(-1e999, 1e999), 
        ZAxisLimits = NumberRange.new(-1e999, 1e999), 
        AxisLocked = {
            false, 
            false, 
            false
        }, 
        ClipVelocity = function() --[[ Line: 10 ]] --[[ Name: ClipVelocity ]]

        end
    };
    afterEach(function() --[[ Line: 13 ]]
        -- upvalues: v1 (copy)
        v1.AxisLocked = {
            false, 
            false, 
            false
        };
    end);
    describe("Axis Lock", function() --[[ Line: 17 ]]
        -- upvalues: v1 (copy), l_AxisConstraint_0 (ref)
        it("Should lock X Axis", function() --[[ Line: 18 ]]
            -- upvalues: v1 (ref), l_AxisConstraint_0 (ref)
            v1.AxisLocked = {
                true, 
                false, 
                false
            };
            local v2 = l_AxisConstraint_0(v1, Vector3.new(-10, 0, 0, 0), Vector3.new(0, 0, 0, 0), CFrame.identity);
            expect(v2.X).to.equal(0);
        end);
        it("Should lock Y Axis", function() --[[ Line: 26 ]]
            -- upvalues: v1 (ref), l_AxisConstraint_0 (ref)
            v1.AxisLocked = {
                false, 
                true, 
                false
            };
            local v3 = l_AxisConstraint_0(v1, Vector3.new(0, -10, 0, 0), Vector3.new(0, 0, 0, 0), CFrame.identity);
            expect(v3.Y).to.equal(0);
        end);
        it("Should lock Z Axis", function() --[[ Line: 34 ]]
            -- upvalues: v1 (ref), l_AxisConstraint_0 (ref)
            v1.AxisLocked = {
                false, 
                false, 
                true
            };
            local v4 = l_AxisConstraint_0(v1, Vector3.new(0, 0, -10, 0), Vector3.new(0, 0, 0, 0), CFrame.identity);
            expect(v4.Z).to.equal(0);
        end);
    end);
    describe("Axis Limit", function() --[[ Line: 43 ]]
        -- upvalues: v1 (copy), l_AxisConstraint_0 (ref)
        describe("Should limit X Axis", function() --[[ Line: 44 ]]
            -- upvalues: v1 (ref), l_AxisConstraint_0 (ref)
            it("Min Limit", function() --[[ Line: 45 ]]
                -- upvalues: v1 (ref), l_AxisConstraint_0 (ref)
                v1.XAxisLimits = NumberRange.new(-5, 1e999);
                local v5 = l_AxisConstraint_0(v1, Vector3.new(-10, 0, 0, 0), Vector3.new(0, 0, 0, 0), CFrame.identity);
                expect(v5.X).to.equal(-5);
            end);
            it("Max Limit", function() --[[ Line: 53 ]]
                -- upvalues: v1 (ref), l_AxisConstraint_0 (ref)
                v1.XAxisLimits = NumberRange.new(-1e999, 5);
                local v6 = l_AxisConstraint_0(v1, Vector3.new(10, 0, 0, 0), Vector3.new(0, 0, 0, 0), CFrame.identity);
                expect(v6.X).to.equal(5);
            end);
        end);
        describe("Should limit Y Axis", function() --[[ Line: 62 ]]
            -- upvalues: v1 (ref), l_AxisConstraint_0 (ref)
            it("Min Limit", function() --[[ Line: 63 ]]
                -- upvalues: v1 (ref), l_AxisConstraint_0 (ref)
                v1.YAxisLimits = NumberRange.new(-5, 1e999);
                local v7 = l_AxisConstraint_0(v1, Vector3.new(0, -10, 0, 0), Vector3.new(0, 0, 0, 0), CFrame.identity);
                expect(v7.Y).to.equal(-5);
            end);
            it("Max Limit", function() --[[ Line: 71 ]]
                -- upvalues: v1 (ref), l_AxisConstraint_0 (ref)
                v1.YAxisLimits = NumberRange.new(-1e999, 5);
                local v8 = l_AxisConstraint_0(v1, Vector3.new(0, 10, 0, 0), Vector3.new(0, 0, 0, 0), CFrame.identity);
                expect(v8.Y).to.equal(5);
            end);
        end);
        describe("Should limit Z Axis", function() --[[ Line: 80 ]]
            -- upvalues: v1 (ref), l_AxisConstraint_0 (ref)
            it("Min Limit", function() --[[ Line: 81 ]]
                -- upvalues: v1 (ref), l_AxisConstraint_0 (ref)
                v1.ZAxisLimits = NumberRange.new(-5, 1e999);
                local v9 = l_AxisConstraint_0(v1, Vector3.new(0, 0, -10, 0), Vector3.new(0, 0, 0, 0), CFrame.identity);
                expect(v9.Z).to.equal(-5);
            end);
            it("Max Limit", function() --[[ Line: 89 ]]
                -- upvalues: v1 (ref), l_AxisConstraint_0 (ref)
                v1.ZAxisLimits = NumberRange.new(-1e999, 5);
                local v10 = l_AxisConstraint_0(v1, Vector3.new(0, 0, 10, 0), Vector3.new(0, 0, 0, 0), CFrame.identity);
                expect(v10.Z).to.equal(5);
            end);
        end);
    end);
end;