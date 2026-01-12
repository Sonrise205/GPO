--!native
local l_Parent_0 = script.Parent;
local l_Config_0 = require(l_Parent_0:WaitForChild("Config"));
local l_Utilities_0 = require(l_Parent_0:WaitForChild("Utilities"));
local v34 = {
    GetCFrames = function(v3, v4) --[[ Line: 8 ]] --[[ Name: GetCFrames ]]
        debug.profilebegin("Frustum::GetCFrames");
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
        local v16 = (l_CFrame_0 * CFrame.new(0, 0, -v9)):Inverse();
        local l_Unit_0 = l_UpVector_0:Cross(v15 - l_Position_0).Unit;
        local l_Unit_1 = l_UpVector_0:Cross(v14 - l_Position_0).Unit;
        local l_Unit_2 = l_RightVector_0:Cross(l_Position_0 - v13).Unit;
        local l_Unit_3 = l_RightVector_0:Cross(l_Position_0 - v15).Unit;
        debug.profileend();
        return v16, v11, v10, v9, l_Unit_0, l_Unit_1, l_Unit_2, l_Unit_3, l_CFrame_0;
    end, 
    InViewFrustum = function(v21, v22, v23, v24, v25, v26, v27, v28, v29, v30) --[[ Line: 32 ]] --[[ Name: InViewFrustum ]]
        debug.profilebegin("Frustum::InViewFrustum");
        local l_Position_1 = v30.Position;
        local v32 = v22 * v21;
        if v23 < v32.X or v32.X < -v23 or v24 < v32.Y or v32.Y < -v24 or v25 < v32.Z or v32.Z < -v25 then
            debug.profileend();
            return false;
        else
            local v33 = v21 - l_Position_1;
            if v26:Dot(v33) < 0 or v27:Dot(v33) > 0 or v28:Dot(v33) < 0 or v29:Dot(v33) > 0 then
                debug.profileend();
                return false;
            else
                debug.profileend();
                return true;
            end;
        end;
    end
};
v34.ObjectInFrustum = function(v35, v36, v37, v38, v39, v40, v41, v42, v43, v44) --[[ Line: 73 ]] --[[ Name: ObjectInFrustum ]]
    -- upvalues: l_Config_0 (copy), l_Utilities_0 (copy), v34 (copy)
    local l_CFrame_1 = v35.CFrame;
    local l_Size_0 = v35.Size;
    local v47 = l_Config_0.FAR_PLANE * 0.5;
    local v48 = v44.Position + v44.LookVector * v47;
    local v49 = l_Utilities_0.ClosestPointOnLine(v48, v44.LookVector, v47, l_CFrame_1.Position);
    local v50, v51 = l_Utilities_0.ClosestPointInBox(l_CFrame_1, l_Size_0, v49);
    if v50 then
        return true;
    elseif v34.InViewFrustum(v51, v36, v37, v38, v39, v40, v41, v42, v43, v44) then
        return true;
    else
        return false;
    end;
end;
return v34;