local l_Frustum_0 = require(script.Parent:WaitForChild("Frustum"));
return function() --[[ Line: 3 ]]
    -- upvalues: l_Frustum_0 (copy)
    local v1 = {
        CFrame = CFrame.identity, 
        FieldOfView = 70, 
        ViewportSize = Vector2.new(1920, 1080)
    };
    local v2 = {};
    describe("Generates CFrames", function() --[[ Line: 12 ]]
        -- upvalues: v2 (ref), l_Frustum_0 (ref), v1 (copy)
        local v3 = os.clock();
        local v4 = nil;
        v2 = table.pack(l_Frustum_0.GetCFrames(v1, 500));
        v4 = os.clock();
        v2.n = nil;
        print((("Solved view frustum in %*\206\188s"):format((string.format("%.2f", (v4 - v3) * 1000000)))));
    end);
    describe("Point In View", function() --[[ Line: 24 ]]
        -- upvalues: l_Frustum_0 (ref), v2 (ref)
        it("Close In View Point", function() --[[ Line: 29 ]]
            -- upvalues: l_Frustum_0 (ref), v2 (ref)
            expect(l_Frustum_0.InViewFrustum(Vector3.new(0, 0, -5, 0), table.unpack(v2))).to.equal(true);
        end);
        it("Past FarPlane Point", function() --[[ Line: 33 ]]
            -- upvalues: l_Frustum_0 (ref), v2 (ref)
            expect(l_Frustum_0.InViewFrustum(Vector3.new(0, 0, -550, 0), table.unpack(v2))).to.equal(false);
        end);
        it("Out Of View Point", function() --[[ Line: 37 ]]
            -- upvalues: l_Frustum_0 (ref), v2 (ref)
            expect(l_Frustum_0.InViewFrustum(Vector3.new(0, 0, 5, 0), table.unpack(v2))).to.equal(false);
        end);
    end);
    describe("Object In View", function() --[[ Line: 42 ]]
        -- upvalues: l_Frustum_0 (ref), v2 (ref)
        local v5 = {
            CFrame = CFrame.new(0, 0, -5), 
            Size = Vector3.new(1, 1, 3, 0)
        };
        local v6 = {
            CFrame = CFrame.new(0, 0, -550), 
            Size = Vector3.new(1, 1, 3, 0)
        };
        local v7 = {
            CFrame = CFrame.new(0, 0, 5), 
            Size = Vector3.new(1, 1, 3, 0)
        };
        it("Close In View Object", function() --[[ Line: 58 ]]
            -- upvalues: l_Frustum_0 (ref), v5 (copy), v2 (ref)
            expect(l_Frustum_0.ObjectInFrustum(v5, table.unpack(v2))).to.equal(true);
        end);
        it("Past FarPlane Object", function() --[[ Line: 62 ]]
            -- upvalues: l_Frustum_0 (ref), v6 (copy), v2 (ref)
            expect(l_Frustum_0.ObjectInFrustum(v6, table.unpack(v2))).to.equal(false);
        end);
        it("Out Of View Object", function() --[[ Line: 66 ]]
            -- upvalues: l_Frustum_0 (ref), v7 (copy), v2 (ref)
            expect(l_Frustum_0.ObjectInFrustum(v7, table.unpack(v2))).to.equal(false);
        end);
    end);
end;