--!native
return function(v0, v1, v2, v3, v4) --[[ Line: 2 ]]
    debug.profilebegin("Spring Constraint");
    local l_Settings_0 = v3.Settings;
    local l_Stiffness_0 = l_Settings_0.Stiffness;
    local l_Elasticity_0 = l_Settings_0.Elasticity;
    local v8 = v3.Bones[v0.ParentIndex];
    if v8 then
        local l_FreeLength_0 = v0.FreeLength;
        if l_Stiffness_0 > 0 or l_Elasticity_0 > 0 then
            local v10 = CFrame.new(v8.Position) * v8.TransformOffset.Rotation;
            v2 = v2 or (v10 * CFrame.new(v0.LocalTransformOffset.Position)).Position;
            v1 = v1 + (v2 - v1) * (l_Elasticity_0 * v4);
            if l_Stiffness_0 > 0 then
                local v11 = v2 - v1;
                local l_Magnitude_0 = v11.Magnitude;
                local v13 = l_FreeLength_0 * (1 - l_Stiffness_0) * 2;
                if v13 < l_Magnitude_0 then
                    v1 = v1 + v11 * ((l_Magnitude_0 - v13) / l_Magnitude_0);
                end;
            end;
        end;
        local v14 = v8.Position - v1;
        local l_Magnitude_1 = v14.Magnitude;
        if l_Magnitude_1 > 0 then
            v1 = v1 + v14 * ((l_Magnitude_1 - l_FreeLength_0) / l_Magnitude_1);
        end;
    end;
    debug.profileend();
    return v1;
end;