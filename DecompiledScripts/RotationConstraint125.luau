local function _(v0) --[[ Line: 1 ]] --[[ Name: SafeUnit ]]
    if v0.Magnitude == 0 then
        return (Vector3.new(0, 0, 0, 0));
    else
        return v0.Unit;
    end;
end;
return function(v2, v3, v4) --[[ Line: 9 ]]
    local l_ParentIndex_0 = v2.ParentIndex;
    local v6 = v4.Bones[l_ParentIndex_0];
    if not v6 then
        return v3;
    else
        local l_RotationLimit_0 = v6.RotationLimit;
        if l_RotationLimit_0 >= 180 then
            return v3;
        else
            local v8 = v4.Bones[v6.ParentIndex];
            if not v8 then
                return v3;
            else
                local l_Position_0 = v6.Position;
                local v10 = v6.Position - v8.Position;
                local v11 = if v10.Magnitude == 0 then Vector3.new(0, 0, 0, 0) else v10.Unit;
                v10 = (v3 - l_Position_0).Magnitude;
                local v12 = v3 - l_Position_0;
                local v13 = if v12.Magnitude == 0 then Vector3.new(0, 0, 0, 0) else v12.Unit;
                if l_RotationLimit_0 <= 0 then
                    return l_Position_0 + v11 * v10;
                else
                    v12 = math.rad(v2.RotationLimit);
                    local v14 = math.acos((v11:Dot(v13)));
                    local v15 = nil;
                    if v12 <= v14 then
                        local v16 = v11:Cross(v13);
                        local v17 = if v16.Magnitude == 0 then Vector3.new(0, 0, 0, 0) else v16.Unit;
                        v15 = CFrame.fromAxisAngle(v17, v12) * v11;
                    else
                        v15 = v13;
                    end;
                    if v15 ~= v15 then
                        v15 = v11;
                    end;
                    return l_Position_0 + v15 * v10;
                end;
            end;
        end;
    end;
end;