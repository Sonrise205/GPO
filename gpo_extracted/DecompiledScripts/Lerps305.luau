local _ = ipairs;
local v1 = Color3.new();
local function v5(v2, v3) --[[ Line: 6 ]] --[[ Name: RobloxLerp ]]
    return function(v4) --[[ Line: 7 ]]
        -- upvalues: v2 (copy), v3 (copy)
        return v2:Lerp(v3, v4);
    end;
end;
local function _(v6, v7, v8) --[[ Line: 12 ]] --[[ Name: Lerp ]]
    return v6 + v8 * (v7 - v6);
end;
local function v12(v10, v11) --[[ Line: 16 ]] --[[ Name: SortByTime ]]
    return v10.Time < v11.Time;
end;
return (setmetatable({
    boolean = function(v13, v14) --[[ Line: 21 ]] --[[ Name: boolean ]]
        return function(v15) --[[ Line: 22 ]]
            -- upvalues: v13 (copy), v14 (copy)
            if v15 < 0.5 then
                return v13;
            else
                return v14;
            end;
        end;
    end, 
    number = function(v16, v17) --[[ Line: 31 ]] --[[ Name: number ]]
        local v18 = v17 - v16;
        return function(v19) --[[ Line: 33 ]]
            -- upvalues: v16 (copy), v18 (copy)
            return v16 + v18 * v19;
        end;
    end, 
    CFrame = v5, 
    Color3 = function(v20, v21) --[[ Line: 39 ]] --[[ Name: Color3 ]]
        -- upvalues: v1 (copy)
        local v22 = nil;
        local v23 = nil;
        local v24 = nil;
        local l_R_0 = v20.R;
        local l_G_0 = v20.G;
        local l_B_0 = v20.B;
        l_R_0 = l_R_0 < 0.0404482362771076 and l_R_0 / 12.92 or 0.87941546140213 * (l_R_0 + 0.055) ^ 2.4;
        l_G_0 = l_G_0 < 0.0404482362771076 and l_G_0 / 12.92 or 0.87941546140213 * (l_G_0 + 0.055) ^ 2.4;
        l_B_0 = l_B_0 < 0.0404482362771076 and l_B_0 / 12.92 or 0.87941546140213 * (l_B_0 + 0.055) ^ 2.4;
        local v28 = 0.2125862307855956 * l_R_0 + 0.7151703037034108 * l_G_0 + 0.0722004986433362 * l_B_0;
        local v29 = 3.6590806972265884 * l_R_0 + 11.442689580057424 * l_G_0 + 4.114991502426484 * l_B_0;
        local v30 = v28 > 0.008856451679035631 and 116 * v28 ^ 0.3333333333333333 - 16 or 903.296296296296 * v28;
        if v29 > 1.0E-15 then
            local v31 = 0.9257063972951867 * l_R_0 - 0.8333736323779866 * l_G_0 - 0.09209820666085898 * l_B_0;
            v22 = v30;
            v23 = v30 * v31 / v29;
            v24 = v30 * (9 * v28 / v29 - 0.46832);
        else
            v22 = v30;
            v23 = -0.19783 * v30;
            v24 = -0.46832 * v30;
        end;
        local v32 = nil;
        local v33 = nil;
        local v34 = nil;
        local l_R_1 = v21.R;
        local l_G_1 = v21.G;
        local l_B_1 = v21.B;
        l_R_1 = l_R_1 < 0.0404482362771076 and l_R_1 / 12.92 or 0.87941546140213 * (l_R_1 + 0.055) ^ 2.4;
        l_G_1 = l_G_1 < 0.0404482362771076 and l_G_1 / 12.92 or 0.87941546140213 * (l_G_1 + 0.055) ^ 2.4;
        l_B_1 = l_B_1 < 0.0404482362771076 and l_B_1 / 12.92 or 0.87941546140213 * (l_B_1 + 0.055) ^ 2.4;
        local v38 = 0.2125862307855956 * l_R_1 + 0.7151703037034108 * l_G_1 + 0.0722004986433362 * l_B_1;
        local v39 = 3.6590806972265884 * l_R_1 + 11.442689580057424 * l_G_1 + 4.114991502426484 * l_B_1;
        local v40 = v38 > 0.008856451679035631 and 116 * v38 ^ 0.3333333333333333 - 16 or 903.296296296296 * v38;
        if v39 > 1.0E-15 then
            local v41 = 0.9257063972951867 * l_R_1 - 0.8333736323779866 * l_G_1 - 0.09209820666085898 * l_B_1;
            v32 = v40;
            v33 = v40 * v41 / v39;
            v34 = v40 * (9 * v38 / v39 - 0.46832);
        else
            v32 = v40;
            v33 = -0.19783 * v40;
            v34 = -0.46832 * v40;
        end;
        return function(v42) --[[ Line: 74 ]]
            -- upvalues: v22 (ref), v32 (ref), v1 (ref), v23 (ref), v33 (ref), v24 (ref), v34 (ref)
            local v43 = (1 - v42) * v22 + v42 * v32;
            if v43 < 0.0197955 then
                return v1;
            else
                local v44 = ((1 - v42) * v23 + v42 * v33) / v43 + 0.19783;
                local v45 = ((1 - v42) * v24 + v42 * v34) / v43 + 0.46832;
                local v46 = (v43 + 16) / 116;
                v46 = v46 > 0.20689655172413793 and v46 * v46 * v46 or 0.12841854934601665 * v46 - 0.01771290335807126;
                local v47 = v46 * v44 / v45;
                local v48 = v46 * ((3 - 0.75 * v44) / v45 - 5);
                local v49 = 7.2914074 * v47 - 1.537208 * v46 - 0.4986286 * v48;
                local v50 = -2.180094 * v47 + 1.8757561 * v46 + 0.0415175 * v48;
                local v51 = 0.1253477 * v47 - 0.2040211 * v46 + 1.0569959 * v48;
                if v49 < 0 and v49 < v50 and v49 < v51 then
                    local v52 = 0;
                    v50 = v50 - v49;
                    v51 = v51 - v49;
                    v49 = v52;
                elseif v50 < 0 and v50 < v51 then
                    v49 = v49 - v50;
                    local v53 = 0;
                    v51 = v51 - v50;
                    v50 = v53;
                elseif v51 < 0 then
                    v49 = v49 - v51;
                    v50 = v50 - v51;
                    v51 = 0;
                end;
                v49 = v49 < 0.0031306684425 and 12.92 * v49 or 1.055 * v49 ^ 0.4166666666666667 - 0.055;
                v50 = v50 < 0.0031306684425 and 12.92 * v50 or 1.055 * v50 ^ 0.4166666666666667 - 0.055;
                v51 = v51 < 0.0031306684425 and 12.92 * v51 or 1.055 * v51 ^ 0.4166666666666667 - 0.055;
                return Color3.new(v49 > 1 and 1 or v49 < 0 and 0 or v49, v50 > 1 and 1 or v50 < 0 and 0 or v50, v51 > 1 and 1 or v51 < 0 and 0 or v51);
            end;
        end;
    end, 
    NumberRange = function(v54, v55) --[[ Line: 112 ]] --[[ Name: NumberRange ]]
        local l_Min_0 = v54.Min;
        local l_Max_0 = v54.Max;
        local v58 = v55.Min - l_Min_0;
        local v59 = v55.Max - l_Max_0;
        return function(v60) --[[ Line: 116 ]]
            -- upvalues: l_Min_0 (copy), v58 (copy), l_Max_0 (copy), v59 (copy)
            return NumberRange.new(l_Min_0 + v60 * v58, l_Max_0 + v60 * v59);
        end;
    end, 
    NumberSequenceKeypoint = function(v61, v62) --[[ Line: 121 ]] --[[ Name: NumberSequenceKeypoint ]]
        local l_Time_0 = v61.Time;
        local l_Value_0 = v61.Value;
        local l_Envelope_0 = v61.Envelope;
        local v66 = v62.Time - l_Time_0;
        local v67 = v62.Value - l_Value_0;
        local v68 = v62.Envelope - l_Envelope_0;
        return function(v69) --[[ Line: 125 ]]
            -- upvalues: l_Time_0 (copy), v66 (copy), l_Value_0 (copy), v67 (copy), l_Envelope_0 (copy), v68 (copy)
            return NumberSequenceKeypoint.new(l_Time_0 + v69 * v66, l_Value_0 + v69 * v67, l_Envelope_0 + v69 * v68);
        end;
    end, 
    PhysicalProperties = function(v70, v71) --[[ Line: 130 ]] --[[ Name: PhysicalProperties ]]
        local l_Density_0 = v70.Density;
        local l_Elasticity_0 = v70.Elasticity;
        local l_ElasticityWeight_0 = v70.ElasticityWeight;
        local l_Friction_0 = v70.Friction;
        local l_FrictionWeight_0 = v70.FrictionWeight;
        local v77 = v71.Density - l_Density_0;
        local v78 = v71.Elasticity - l_Elasticity_0;
        local v79 = v71.ElasticityWeight - l_ElasticityWeight_0;
        local v80 = v71.Friction - l_Friction_0;
        local v81 = v71.FrictionWeight - l_FrictionWeight_0;
        return function(v82) --[[ Line: 141 ]]
            -- upvalues: l_Density_0 (copy), v77 (copy), l_Elasticity_0 (copy), v78 (copy), l_ElasticityWeight_0 (copy), v79 (copy), l_Friction_0 (copy), v80 (copy), l_FrictionWeight_0 (copy), v81 (copy)
            return PhysicalProperties.new(l_Density_0 + v82 * v77, l_Elasticity_0 + v82 * v78, l_ElasticityWeight_0 + v82 * v79, l_Friction_0 + v82 * v80, l_FrictionWeight_0 + v82 * v81);
        end;
    end, 
    Ray = function(v83, v84) --[[ Line: 150 ]] --[[ Name: Ray ]]
        local l_Origin_0 = v83.Origin;
        local l_Direction_0 = v83.Direction;
        local l_Origin_1 = v84.Origin;
        local l_Direction_1 = v84.Direction;
        local l_X_0 = l_Origin_0.X;
        local l_Y_0 = l_Origin_0.Y;
        local l_Z_0 = l_Origin_0.Z;
        local l_X_1 = l_Direction_0.X;
        local l_Y_1 = l_Direction_0.Y;
        local l_Z_1 = l_Direction_0.Z;
        local v95 = l_Origin_1.X - l_X_0;
        local v96 = l_Origin_1.Y - l_Y_0;
        local v97 = l_Origin_1.Z - l_Z_0;
        local v98 = l_Direction_1.X - l_X_1;
        local v99 = l_Direction_1.Y - l_Y_1;
        local v100 = l_Direction_1.Z - l_Z_1;
        return function(v101) --[[ Line: 155 ]]
            -- upvalues: l_X_0 (copy), v95 (copy), l_Y_0 (copy), v96 (copy), l_Z_0 (copy), v97 (copy), l_X_1 (copy), v98 (copy), l_Y_1 (copy), v99 (copy), l_Z_1 (copy), v100 (copy)
            return Ray.new(Vector3.new(l_X_0 + v101 * v95, l_Y_0 + v101 * v96, l_Z_0 + v101 * v97), (Vector3.new(l_X_1 + v101 * v98, l_Y_1 + v101 * v99, l_Z_1 + v101 * v100)));
        end;
    end, 
    UDim = function(v102, v103) --[[ Line: 163 ]] --[[ Name: UDim ]]
        local l_Scale_0 = v102.Scale;
        local l_Offset_0 = v102.Offset;
        local v106 = v103.Scale - l_Scale_0;
        local v107 = v103.Offset - l_Offset_0;
        return function(v108) --[[ Line: 167 ]]
            -- upvalues: l_Scale_0 (copy), v106 (copy), l_Offset_0 (copy), v107 (copy)
            return UDim.new(l_Scale_0 + v108 * v106, l_Offset_0 + v108 * v107);
        end;
    end, 
    UDim2 = v5, 
    Vector2 = v5, 
    Vector3 = v5, 
    Rect = function(v109, v110) --[[ Line: 175 ]] --[[ Name: Rect ]]
        return function(v111) --[[ Line: 176 ]]
            -- upvalues: v109 (copy), v110 (copy)
            return Rect.new(v109.Min.X + v111 * (v110.Min.X - v109.Min.X), v109.Min.Y + v111 * (v110.Min.Y - v109.Min.Y), v109.Max.X + v111 * (v110.Max.X - v109.Max.X), v109.Max.Y + v111 * (v110.Max.Y - v109.Max.Y));
        end;
    end, 
    Region3 = function(v112, v113) --[[ Line: 184 ]] --[[ Name: Region3 ]]
        return function(v114) --[[ Line: 185 ]]
            -- upvalues: v112 (copy), v113 (copy)
            local v115 = v112.CFrame * (-v112.Size / 2);
            local v116 = v115 + v114 * (v113.CFrame * (-v113.Size / 2) - v115);
            local v117 = v112.CFrame * (v112.Size / 2);
            v115 = v117 + v114 * (v113.CFrame * (v113.Size / 2) - v117);
            v117 = v116.X;
            local l_X_2 = v115.X;
            local l_Y_2 = v116.Y;
            local l_Y_3 = v115.Y;
            local l_Z_2 = v116.Z;
            local l_Z_3 = v115.Z;
            return Region3.new(Vector3.new(v117 < l_X_2 and v117 or l_X_2, l_Y_2 < l_Y_3 and l_Y_2 or l_Y_3, l_Z_2 < l_Z_3 and l_Z_2 or l_Z_3), (Vector3.new(l_X_2 < v117 and v117 or l_X_2, l_Y_3 < l_Y_2 and l_Y_2 or l_Y_3, l_Z_3 < l_Z_2 and l_Z_2 or l_Z_3)));
        end;
    end, 
    NumberSequence = function(v123, v124) --[[ Line: 203 ]] --[[ Name: NumberSequence ]]
        -- upvalues: v12 (copy)
        return function(v125) --[[ Line: 204 ]]
            -- upvalues: v123 (copy), v124 (copy), v12 (ref)
            local v126 = {};
            local v127 = {};
            local v128 = 0;
            for _, v130 in v123.Keypoints do
                local v131 = nil;
                local v132 = nil;
                for _, v134 in v124.Keypoints do
                    if v134.Time == v130.Time then
                        v131 = v134;
                        v132 = v134;
                        break;
                    elseif v134.Time < v130.Time and (v132 == nil or v134.Time > v132.Time) then
                        v132 = v134;
                    elseif v134.Time > v130.Time and (v131 == nil or v134.Time < v131.Time) then
                        v131 = v134;
                    end;
                end;
                local v135 = nil;
                local v136 = nil;
                if v131 == v132 then
                    v135 = v131.Value;
                    v136 = v131.Envelope;
                else
                    local v137 = (v130.Time - v132.Time) / (v131.Time - v132.Time);
                    v135 = (v131.Value - v132.Value) * v137 + v132.Value;
                    v136 = (v131.Envelope - v132.Envelope) * v137 + v132.Envelope;
                end;
                local v138 = (v135 - v130.Value) * v125 + v130.Value;
                local v139 = (v136 - v130.Envelope) * v125 + v130.Envelope;
                local v140 = NumberSequenceKeypoint.new(v130.Time, v138, v139);
                v128 = v128 + 1;
                v126[v128] = v140;
                v127[v130.Time] = true;
            end;
            for _, v142 in v124.Keypoints do
                if not v127[v142.Time] then
                    local v143 = nil;
                    local v144 = nil;
                    for _, v146 in v123.Keypoints do
                        if v146.Time == v142.Time then
                            v143 = v146;
                            v144 = v146;
                            break;
                        elseif v146.Time < v142.Time and (v144 == nil or v146.Time > v144.Time) then
                            v144 = v146;
                        elseif v146.Time > v142.Time and (v143 == nil or v146.Time < v143.Time) then
                            v143 = v146;
                        end;
                    end;
                    local v147 = nil;
                    local v148 = nil;
                    if v143 == v144 then
                        v147 = v143.Value;
                        v148 = v143.Envelope;
                    else
                        local v149 = (v142.Time - v144.Time) / (v143.Time - v144.Time);
                        v147 = (v143.Value - v144.Value) * v149 + v144.Value;
                        v148 = (v143.Envelope - v144.Envelope) * v149 + v144.Envelope;
                    end;
                    local v150 = (v142.Value - v147) * v125 + v147;
                    local v151 = (v142.Envelope - v148) * v125 + v148;
                    local v152 = NumberSequenceKeypoint.new(v142.Time, v150, v151);
                    v128 = v128 + 1;
                    v126[v128] = v152;
                end;
            end;
            table.sort(v126, v12);
            return NumberSequence.new(v126);
        end;
    end
}, {
    __index = function(_, v154) --[[ Line: 279 ]] --[[ Name: __index ]]
        error("No lerp function is defined for type " .. tostring(v154) .. ".", 4);
    end, 
    __newindex = function(_, v156) --[[ Line: 283 ]] --[[ Name: __newindex ]]
        error("No lerp function is defined for type " .. tostring(v156) .. ".", 4);
    end
}));