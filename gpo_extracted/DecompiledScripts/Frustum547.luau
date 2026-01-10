--!native
local l_Parent_0 = script.Parent;
local l_Config_0 = require(l_Parent_0:WaitForChild("Config"));
local l_Utilities_0 = require(l_Parent_0:WaitForChild("Utilities"));
local v29 = {
    GetCFrames = function(v3, v4) --[[ Line: 8 ]] --[[ Name: GetCFrames ]]
        local l_CFrame_0 = v3.CFrame;
        local l_Position_0 = l_CFrame_0.Position;
        local l_RightVector_0 = l_CFrame_0.RightVector;
        local l_UpVector_0 = l_CFrame_0.UpVector;
        local v9 = v4 * 0.5;
        local v10 = math.tan((v3.FieldOfView + 5) * 0.5 * 0.017453) * v4;
        local v11 = v10 * (v3.ViewportSize.X / v3.ViewportSize.Y);
        local v12 = l_CFrame_0 * CFrame.new(0, 0, -v4);
        local v13 = v12 * Vector3.new(v11, v10, 0);
        local v14 = v12 * Vector3.new(-v11, -v10, 0);
        local v15 = v12 * Vector3.new(v11, -v10, 0);
        return (l_CFrame_0 * CFrame.new(0, 0, -v9)):Inverse(), v11, v10, v9, l_UpVector_0:Cross(v15 - l_Position_0).Unit, l_UpVector_0:Cross(v14 - l_Position_0).Unit, l_RightVector_0:Cross(l_Position_0 - v13).Unit, l_RightVector_0:Cross(l_Position_0 - v15).Unit, l_CFrame_0;
    end, 
    InViewFrustum = function(v16, v17, v18, v19, v20, v21, v22, v23, v24, v25) --[[ Line: 32 ]] --[[ Name: InViewFrustum ]]
        local l_Position_1 = v25.Position;
        local v27 = v17 * v16;
        if v18 < v27.X or v27.X < -v18 or v19 < v27.Y or v27.Y < -v19 or v20 < v27.Z or v27.Z < -v20 then
            return false;
        else
            local v28 = v16 - l_Position_1;
            if v21:Dot(v28) < 0 or v22:Dot(v28) > 0 or v23:Dot(v28) < 0 or v24:Dot(v28) > 0 then
                return false;
            else
                return true;
            end;
        end;
    end
};
v29.ObjectInFrustum = function(v30, v31, v32, v33, v34, v35, v36, v37, v38, v39) --[[ Line: 73 ]] --[[ Name: ObjectInFrustum ]]
    -- upvalues: l_Config_0 (copy), l_Utilities_0 (copy), v29 (copy)
    local l_CFrame_1 = v30.CFrame;
    local l_Size_0 = v30.Size;
    local v42 = l_Config_0.FAR_PLANE * 0.5;
    local v43 = v39.Position + v39.LookVector * v42;
    local v44 = l_Utilities_0.ClosestPointOnLine(v43, v39.LookVector, v42, l_CFrame_1.Position);
    local v45, v46 = l_Utilities_0.ClosestPointInBox(l_CFrame_1, l_Size_0, v44);
    if v45 then
        return true;
    elseif v29.InViewFrustum(v46, v31, v32, v33, v34, v35, v36, v37, v38, v39) then
        return true;
    else
        return false;
    end;
end;
return v29;