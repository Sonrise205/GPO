local l_ipairs_0 = ipairs;
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
local function v47(v13, v14) --[[ Line: 20 ]] --[[ Name: Color3Lerp ]]
    -- upvalues: v1 (copy)
    local v15 = nil;
    local v16 = nil;
    local v17 = nil;
    local l_R_0 = v13.R;
    local l_G_0 = v13.G;
    local l_B_0 = v13.B;
    l_R_0 = l_R_0 < 0.0404482362771076 and l_R_0 / 12.92 or 0.87941546140213 * (l_R_0 + 0.055) ^ 2.4;
    l_G_0 = l_G_0 < 0.0404482362771076 and l_G_0 / 12.92 or 0.87941546140213 * (l_G_0 + 0.055) ^ 2.4;
    l_B_0 = l_B_0 < 0.0404482362771076 and l_B_0 / 12.92 or 0.87941546140213 * (l_B_0 + 0.055) ^ 2.4;
    local v21 = 0.2125862307855956 * l_R_0 + 0.7151703037034108 * l_G_0 + 0.0722004986433362 * l_B_0;
    local v22 = 3.6590806972265884 * l_R_0 + 11.442689580057424 * l_G_0 + 4.114991502426484 * l_B_0;
    local v23 = v21 > 0.008856451679035631 and 116 * v21 ^ 0.3333333333333333 - 16 or 903.296296296296 * v21;
    if v22 > 1.0E-15 then
        local v24 = 0.9257063972951867 * l_R_0 - 0.8333736323779866 * l_G_0 - 0.09209820666085898 * l_B_0;
        v15 = v23;
        v16 = v23 * v24 / v22;
        v17 = v23 * (9 * v21 / v22 - 0.46832);
    else
        v15 = v23;
        v16 = -0.19783 * v23;
        v17 = -0.46832 * v23;
    end;
    local v25 = nil;
    local v26 = nil;
    local v27 = nil;
    local l_R_1 = v14.R;
    local l_G_1 = v14.G;
    local l_B_1 = v14.B;
    l_R_1 = l_R_1 < 0.0404482362771076 and l_R_1 / 12.92 or 0.87941546140213 * (l_R_1 + 0.055) ^ 2.4;
    l_G_1 = l_G_1 < 0.0404482362771076 and l_G_1 / 12.92 or 0.87941546140213 * (l_G_1 + 0.055) ^ 2.4;
    l_B_1 = l_B_1 < 0.0404482362771076 and l_B_1 / 12.92 or 0.87941546140213 * (l_B_1 + 0.055) ^ 2.4;
    local v31 = 0.2125862307855956 * l_R_1 + 0.7151703037034108 * l_G_1 + 0.0722004986433362 * l_B_1;
    local v32 = 3.6590806972265884 * l_R_1 + 11.442689580057424 * l_G_1 + 4.114991502426484 * l_B_1;
    local v33 = v31 > 0.008856451679035631 and 116 * v31 ^ 0.3333333333333333 - 16 or 903.296296296296 * v31;
    if v32 > 1.0E-15 then
        local v34 = 0.9257063972951867 * l_R_1 - 0.8333736323779866 * l_G_1 - 0.09209820666085898 * l_B_1;
        v25 = v33;
        v26 = v33 * v34 / v32;
        v27 = v33 * (9 * v31 / v32 - 0.46832);
    else
        v25 = v33;
        v26 = -0.19783 * v33;
        v27 = -0.46832 * v33;
    end;
    return function(v35) --[[ Line: 55 ]]
        -- upvalues: v15 (ref), v25 (ref), v1 (ref), v16 (ref), v26 (ref), v17 (ref), v27 (ref)
        local v36 = (1 - v35) * v15 + v35 * v25;
        if v36 < 0.0197955 then
            return v1;
        else
            local v37 = ((1 - v35) * v16 + v35 * v26) / v36 + 0.19783;
            local v38 = ((1 - v35) * v17 + v35 * v27) / v36 + 0.46832;
            local v39 = (v36 + 16) / 116;
            v39 = v39 > 0.20689655172413793 and v39 * v39 * v39 or 0.12841854934601665 * v39 - 0.01771290335807126;
            local v40 = v39 * v37 / v38;
            local v41 = v39 * ((3 - 0.75 * v37) / v38 - 5);
            local v42 = 7.2914074 * v40 - 1.537208 * v39 - 0.4986286 * v41;
            local v43 = -2.180094 * v40 + 1.8757561 * v39 + 0.0415175 * v41;
            local v44 = 0.1253477 * v40 - 0.2040211 * v39 + 1.0569959 * v41;
            if v42 < 0 and v42 < v43 and v42 < v44 then
                local v45 = 0;
                v43 = v43 - v42;
                v44 = v44 - v42;
                v42 = v45;
            elseif v43 < 0 and v43 < v44 then
                v42 = v42 - v43;
                local v46 = 0;
                v44 = v44 - v43;
                v43 = v46;
            elseif v44 < 0 then
                v42 = v42 - v44;
                v43 = v43 - v44;
                v44 = 0;
            end;
            v42 = v42 < 0.0031306684425 and 12.92 * v42 or 1.055 * v42 ^ 0.4166666666666667 - 0.055;
            v43 = v43 < 0.0031306684425 and 12.92 * v43 or 1.055 * v43 ^ 0.4166666666666667 - 0.055;
            v44 = v44 < 0.0031306684425 and 12.92 * v44 or 1.055 * v44 ^ 0.4166666666666667 - 0.055;
            return Color3.new(v42 > 1 and 1 or v42 < 0 and 0 or v42, v43 > 1 and 1 or v43 < 0 and 0 or v43, v44 > 1 and 1 or v44 < 0 and 0 or v44);
        end;
    end;
end;
return (setmetatable({
    boolean = function(v48, v49) --[[ Line: 94 ]] --[[ Name: boolean ]]
        return function(v50) --[[ Line: 95 ]]
            -- upvalues: v48 (copy), v49 (copy)
            if v50 < 0.5 then
                return v48;
            else
                return v49;
            end;
        end;
    end, 
    number = function(v51, v52) --[[ Line: 104 ]] --[[ Name: number ]]
        local v53 = v52 - v51;
        return function(v54) --[[ Line: 106 ]]
            -- upvalues: v51 (copy), v53 (copy)
            return v51 + v53 * v54;
        end;
    end, 
    CFrame = v5, 
    Color3 = v47, 
    NumberRange = function(v55, v56) --[[ Line: 114 ]] --[[ Name: NumberRange ]]
        local l_Min_0 = v55.Min;
        local l_Max_0 = v55.Max;
        local v59 = v56.Min - l_Min_0;
        local v60 = v56.Max - l_Max_0;
        return function(v61) --[[ Line: 118 ]]
            -- upvalues: l_Min_0 (copy), v59 (copy), l_Max_0 (copy), v60 (copy)
            return NumberRange.new(l_Min_0 + v61 * v59, l_Max_0 + v61 * v60);
        end;
    end, 
    NumberSequenceKeypoint = function(v62, v63) --[[ Line: 123 ]] --[[ Name: NumberSequenceKeypoint ]]
        local l_Time_0 = v62.Time;
        local l_Value_0 = v62.Value;
        local l_Envelope_0 = v62.Envelope;
        local v67 = v63.Time - l_Time_0;
        local v68 = v63.Value - l_Value_0;
        local v69 = v63.Envelope - l_Envelope_0;
        return function(v70) --[[ Line: 127 ]]
            -- upvalues: l_Time_0 (copy), v67 (copy), l_Value_0 (copy), v68 (copy), l_Envelope_0 (copy), v69 (copy)
            return NumberSequenceKeypoint.new(l_Time_0 + v70 * v67, l_Value_0 + v70 * v68, l_Envelope_0 + v70 * v69);
        end;
    end, 
    PhysicalProperties = function(v71, v72) --[[ Line: 132 ]] --[[ Name: PhysicalProperties ]]
        local l_Density_0 = v71.Density;
        local l_Elasticity_0 = v71.Elasticity;
        local l_ElasticityWeight_0 = v71.ElasticityWeight;
        local l_Friction_0 = v71.Friction;
        local l_FrictionWeight_0 = v71.FrictionWeight;
        local v78 = v72.Density - l_Density_0;
        local v79 = v72.Elasticity - l_Elasticity_0;
        local v80 = v72.ElasticityWeight - l_ElasticityWeight_0;
        local v81 = v72.Friction - l_Friction_0;
        local v82 = v72.FrictionWeight - l_FrictionWeight_0;
        return function(v83) --[[ Line: 143 ]]
            -- upvalues: l_Density_0 (copy), v78 (copy), l_Elasticity_0 (copy), v79 (copy), l_ElasticityWeight_0 (copy), v80 (copy), l_Friction_0 (copy), v81 (copy), l_FrictionWeight_0 (copy), v82 (copy)
            return PhysicalProperties.new(l_Density_0 + v83 * v78, l_Elasticity_0 + v83 * v79, l_ElasticityWeight_0 + v83 * v80, l_Friction_0 + v83 * v81, l_FrictionWeight_0 + v83 * v82);
        end;
    end, 
    Ray = function(v84, v85) --[[ Line: 152 ]] --[[ Name: Ray ]]
        local l_Origin_0 = v84.Origin;
        local l_Direction_0 = v84.Direction;
        local l_Origin_1 = v85.Origin;
        local l_Direction_1 = v85.Direction;
        local l_X_0 = l_Origin_0.X;
        local l_Y_0 = l_Origin_0.Y;
        local l_Z_0 = l_Origin_0.Z;
        local l_X_1 = l_Direction_0.X;
        local l_Y_1 = l_Direction_0.Y;
        local l_Z_1 = l_Direction_0.Z;
        local v96 = l_Origin_1.X - l_X_0;
        local v97 = l_Origin_1.Y - l_Y_0;
        local v98 = l_Origin_1.Z - l_Z_0;
        local v99 = l_Direction_1.X - l_X_1;
        local v100 = l_Direction_1.Y - l_Y_1;
        local v101 = l_Direction_1.Z - l_Z_1;
        return function(v102) --[[ Line: 157 ]]
            -- upvalues: l_X_0 (copy), v96 (copy), l_Y_0 (copy), v97 (copy), l_Z_0 (copy), v98 (copy), l_X_1 (copy), v99 (copy), l_Y_1 (copy), v100 (copy), l_Z_1 (copy), v101 (copy)
            return Ray.new(Vector3.new(l_X_0 + v102 * v96, l_Y_0 + v102 * v97, l_Z_0 + v102 * v98), (Vector3.new(l_X_1 + v102 * v99, l_Y_1 + v102 * v100, l_Z_1 + v102 * v101)));
        end;
    end, 
    UDim = function(v103, v104) --[[ Line: 165 ]] --[[ Name: UDim ]]
        local l_Scale_0 = v103.Scale;
        local l_Offset_0 = v103.Offset;
        local v107 = v104.Scale - l_Scale_0;
        local v108 = v104.Offset - l_Offset_0;
        return function(v109) --[[ Line: 169 ]]
            -- upvalues: l_Scale_0 (copy), v107 (copy), l_Offset_0 (copy), v108 (copy)
            return UDim.new(l_Scale_0 + v109 * v107, l_Offset_0 + v109 * v108);
        end;
    end, 
    UDim2 = v5, 
    Vector2 = v5, 
    Vector3 = v5, 
    Rect = function(v110, v111) --[[ Line: 177 ]] --[[ Name: Rect ]]
        return function(v112) --[[ Line: 178 ]]
            -- upvalues: v110 (copy), v111 (copy)
            return Rect.new(v110.Min.X + v112 * (v111.Min.X - v110.Min.X), v110.Min.Y + v112 * (v111.Min.Y - v110.Min.Y), v110.Max.X + v112 * (v111.Max.X - v110.Max.X), v110.Max.Y + v112 * (v111.Max.Y - v110.Max.Y));
        end;
    end, 
    Region3 = function(v113, v114) --[[ Line: 186 ]] --[[ Name: Region3 ]]
        return function(v115) --[[ Line: 187 ]]
            -- upvalues: v113 (copy), v114 (copy)
            local v116 = v113.CFrame * (-v113.Size / 2);
            local v117 = v116 + v115 * (v114.CFrame * (-v114.Size / 2) - v116);
            local v118 = v113.CFrame * (v113.Size / 2);
            v116 = v118 + v115 * (v114.CFrame * (v114.Size / 2) - v118);
            v118 = v117.X;
            local l_X_2 = v116.X;
            local l_Y_2 = v117.Y;
            local l_Y_3 = v116.Y;
            local l_Z_2 = v117.Z;
            local l_Z_3 = v116.Z;
            return Region3.new(Vector3.new(v118 < l_X_2 and v118 or l_X_2, l_Y_2 < l_Y_3 and l_Y_2 or l_Y_3, l_Z_2 < l_Z_3 and l_Z_2 or l_Z_3), (Vector3.new(l_X_2 < v118 and v118 or l_X_2, l_Y_3 < l_Y_2 and l_Y_2 or l_Y_3, l_Z_3 < l_Z_2 and l_Z_2 or l_Z_3)));
        end;
    end, 
    NumberSequence = function(v124, v125) --[[ Line: 205 ]] --[[ Name: NumberSequence ]]
        -- upvalues: v12 (copy)
        return function(v126) --[[ Line: 206 ]]
            -- upvalues: v124 (copy), v125 (copy), v12 (ref)
            local v127 = {};
            local v128 = {};
            local v129 = 0;
            for _, v131 in v124.Keypoints do
                local v132 = nil;
                local v133 = nil;
                for _, v135 in v125.Keypoints do
                    if v135.Time == v131.Time then
                        v132 = v135;
                        v133 = v135;
                        break;
                    elseif v135.Time < v131.Time and (v133 == nil or v135.Time > v133.Time) then
                        v133 = v135;
                    elseif v135.Time > v131.Time and (v132 == nil or v135.Time < v132.Time) then
                        v132 = v135;
                    end;
                end;
                local v136 = nil;
                local v137 = nil;
                if v132 == v133 then
                    v136 = v132.Value;
                    v137 = v132.Envelope;
                else
                    local v138 = (v131.Time - v133.Time) / (v132.Time - v133.Time);
                    v136 = (v132.Value - v133.Value) * v138 + v133.Value;
                    v137 = (v132.Envelope - v133.Envelope) * v138 + v133.Envelope;
                end;
                local v139 = (v136 - v131.Value) * v126 + v131.Value;
                local v140 = (v137 - v131.Envelope) * v126 + v131.Envelope;
                local v141 = NumberSequenceKeypoint.new(v131.Time, v139, v140);
                v129 = v129 + 1;
                v127[v129] = v141;
                v128[v131.Time] = true;
            end;
            for _, v143 in v125.Keypoints do
                if not v128[v143.Time] then
                    local v144 = nil;
                    local v145 = nil;
                    for _, v147 in v124.Keypoints do
                        if v147.Time == v143.Time then
                            v144 = v147;
                            v145 = v147;
                            break;
                        elseif v147.Time < v143.Time and (v145 == nil or v147.Time > v145.Time) then
                            v145 = v147;
                        elseif v147.Time > v143.Time and (v144 == nil or v147.Time < v144.Time) then
                            v144 = v147;
                        end;
                    end;
                    local v148 = nil;
                    local v149 = nil;
                    if v144 == v145 then
                        v148 = v144.Value;
                        v149 = v144.Envelope;
                    else
                        local v150 = (v143.Time - v145.Time) / (v144.Time - v145.Time);
                        v148 = (v144.Value - v145.Value) * v150 + v145.Value;
                        v149 = (v144.Envelope - v145.Envelope) * v150 + v145.Envelope;
                    end;
                    local v151 = (v143.Value - v148) * v126 + v148;
                    local v152 = (v143.Envelope - v149) * v126 + v149;
                    local v153 = NumberSequenceKeypoint.new(v143.Time, v151, v152);
                    v129 = v129 + 1;
                    v127[v129] = v153;
                end;
            end;
            table.sort(v127, v12);
            return NumberSequence.new(v127);
        end;
    end, 
    ColorSequence = function(v154, v155) --[[ Line: 281 ]] --[[ Name: ColorSequence ]]
        -- upvalues: l_ipairs_0 (copy), v47 (copy), v12 (copy)
        return function(v156) --[[ Line: 282 ]]
            -- upvalues: l_ipairs_0 (ref), v154 (copy), v155 (copy), v47 (ref), v12 (ref)
            local v157 = {};
            local v158 = {};
            local v159 = 0;
            for _, v161 in l_ipairs_0(v154.Keypoints) do
                local v162 = nil;
                local v163 = nil;
                for _, v165 in l_ipairs_0(v155.Keypoints) do
                    if v165.Time == v161.Time then
                        v162 = v165;
                        v163 = v165;
                        break;
                    elseif v165.Time < v161.Time and (v163 == nil or v165.Time > v163.Time) then
                        v163 = v165;
                    elseif v165.Time > v161.Time and (v162 == nil or v165.Time < v162.Time) then
                        v162 = v165;
                    end;
                end;
                local v166 = nil;
                v166 = if v162 == v163 then v162.Value else v47(v163.Value, v162.Value)((v161.Time - v163.Time) / (v162.Time - v163.Time));
                v159 = v159 + 1;
                v157[v159] = ColorSequenceKeypoint.new(v161.Time, v47(v161.Value, v166)(v156));
                v158[v161.Time] = true;
            end;
            for _, v168 in l_ipairs_0(v155.Keypoints) do
                if not v158[v168.Time] then
                    local v169 = nil;
                    local v170 = nil;
                    for _, v172 in l_ipairs_0(v154.Keypoints) do
                        if v172.Time == v168.Time then
                            v169 = v172;
                            v170 = v172;
                            break;
                        elseif v172.Time < v168.Time and (v170 == nil or v172.Time > v170.Time) then
                            v170 = v172;
                        elseif v172.Time > v168.Time and (v169 == nil or v172.Time < v169.Time) then
                            v169 = v172;
                        end;
                    end;
                    local v173 = nil;
                    v173 = if v169 == v170 then v169.Value else v47(v170.Value, v169.Value)((v168.Time - v170.Time) / (v169.Time - v170.Time));
                    v159 = v159 + 1;
                    v157[v159] = ColorSequenceKeypoint.new(v168.Time, v47(v168.Value, v173)(v156));
                end;
            end;
            table.sort(v157, v12);
            return ColorSequence.new(v157);
        end;
    end
}, {
    __index = function(_, v175) --[[ Line: 345 ]] --[[ Name: __index ]]
        error("No lerp function is defined for type " .. tostring(v175) .. ".", 4);
    end, 
    __newindex = function(_, v177) --[[ Line: 349 ]] --[[ Name: __newindex ]]
        error("No lerp function is defined for type " .. tostring(v177) .. ".", 4);
    end
}));