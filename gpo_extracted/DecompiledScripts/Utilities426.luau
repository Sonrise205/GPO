return {
    GetRotationBetween = function(v0, v1, v2) --[[ Line: 3 ]] --[[ Name: GetRotationBetween ]]
        local v3 = v0:Dot(v1);
        local v4 = v0:Cross(v1);
        if v3 < -0.99999 then
            return CFrame.fromAxisAngle(v2, 3.141592653589793);
        else
            return CFrame.new(0, 0, 0, v4.X, v4.Y, v4.Z, v3 + 1);
        end;
    end, 
    GetHierarchyLength = function(v5, v6) --[[ Line: 11 ]] --[[ Name: GetHierarchyLength ]]
        if v5 == v6 then
            warn("Child and Root are the same Instance!");
            return;
        elseif v5 == nil then
            warn("Child is nil!");
            return;
        else
            local l_v5_0 = v5;
            local v8 = 0;
            repeat
                v8 = v8 + 1;
                l_v5_0 = l_v5_0.Parent;
            until l_v5_0 == v6;
            return v8;
        end;
    end, 
    WaitForChildOfClass = function(v9, v10, v11) --[[ Line: 28 ]] --[[ Name: WaitForChildOfClass ]]
        local v12 = os.clock();
        v11 = v11 or 10;
        repeat
            task.wait();
        until v9:FindFirstChildOfClass(v10) or v11 < os.clock() - v12;
        return v9:FindFirstChildOfClass(v10);
    end, 
    BoxPointIntersection = function(v13, v14, v15) --[[ Line: 37 ]] --[[ Name: BoxPointIntersection ]]
        local v16 = v13:PointToObjectSpace(v15);
        local l_X_0 = v14.X;
        local l_Y_0 = v14.Y;
        local l_Z_0 = v14.Z;
        local l_X_1 = v16.X;
        local l_Y_1 = v16.Y;
        local l_Z_1 = v16.Z;
        local v23 = math.clamp(l_X_1, -l_X_0 / 2, l_X_0 / 2);
        local v24 = math.clamp(l_Y_1, -l_Y_0 / 2, l_Y_0 / 2);
        local v25 = math.clamp(l_Z_1, -l_Z_0 / 2, l_Z_0 / 2);
        if v23 ~= l_X_1 or v24 ~= l_Y_1 or v25 ~= l_Z_1 then
            return false;
        else
            local v26 = l_X_1 - l_X_0 / 2;
            local v27 = l_Y_1 - l_Y_0 / 2;
            local v28 = l_Z_1 - l_Z_0 / 2;
            local v29 = -l_X_1 - l_X_0 / 2;
            local v30 = -l_Y_1 - l_Y_0 / 2;
            local v31 = -l_Z_1 - l_Z_0 / 2;
            local v32 = math.max(v26, v27, v28, v29, v30, v31);
            if v32 == v26 then
                return true, v13 * Vector3.new(l_X_0 / 2, l_Y_1, l_Z_1), v13.XVector;
            elseif v32 == v27 then
                return true, v13 * Vector3.new(l_X_1, l_Y_0 / 2, l_Z_1), v13.YVector;
            elseif v32 == v28 then
                return true, v13 * Vector3.new(l_X_1, l_Y_1, l_Z_0 / 2), v13.ZVector;
            elseif v32 == v29 then
                return true, v13 * Vector3.new(-l_X_0 / 2, l_Y_1, l_Z_1), -v13.XVector;
            elseif v32 == v30 then
                return true, v13 * Vector3.new(l_X_1, -l_Y_0 / 2, l_Z_1), -v13.YVector;
            elseif v32 == v31 then
                return true, v13 * Vector3.new(l_X_1, l_Y_1, -l_Z_0 / 2), -v13.ZVector;
            else
                return false;
            end;
        end;
    end
};