local l_ipairs_0 = ipairs;
local v1 = Color3.new();
local function v5(v2, v3) --[[ Line: 5 ]] --[[ Name: RobloxLerp ]]
    return function(v4) --[[ Line: 6 ]]
        -- upvalues: v2 (copy), v3 (copy)
        return v2:Lerp(v3, v4);
    end;
end;
local function _(v6, v7, v8) --[[ Line: 11 ]] --[[ Name: Lerp ]]
    return v6 + v8 * (v7 - v6);
end;
local function v12(v10, v11) --[[ Line: 15 ]] --[[ Name: SortByTime ]]
    return v10.Time < v11.Time;
end;
local function v48(v13, v14) --[[ Line: 19 ]] --[[ Name: Color3Lerp ]]
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
    return function(v35) --[[ Line: 54 ]]
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
            v42 = v42 > 1 and 1 or v42 < 0 and 0 or v42;
            v43 = v43 > 1 and 1 or v43 < 0 and 0 or v43;
            local v47 = v44 > 1 and 1 or v44 < 0 and 0 or v44;
            return Color3.new(v42, v43, v47);
        end;
    end;
end;
return (setmetatable({
    boolean = function(v49, v50) --[[ Line: 93 ]] --[[ Name: boolean ]]
        return function(v51) --[[ Line: 94 ]]
            -- upvalues: v49 (copy), v50 (copy)
            if v51 < 0.5 then
                return v49;
            else
                return v50;
            end;
        end;
    end, 
    number = function(v52, v53) --[[ Line: 103 ]] --[[ Name: number ]]
        local v54 = v53 - v52;
        return function(v55) --[[ Line: 105 ]]
            -- upvalues: v52 (copy), v54 (copy)
            return v52 + v54 * v55;
        end;
    end, 
    string = function(v56, v57) --[[ Line: 110 ]] --[[ Name: string ]]
        local v58 = false;
        local v59 = nil;
        local v60 = nil;
        local v61, v62, v63, v64 = string.match(v56, "^([+-]?)(%d*):[+-]?(%d*):[+-]?(%d*)$");
        local v65, v66, v67, v68 = string.match(v57, "^([+-]?)(%d*):[+-]?(%d*):[+-]?(%d*)$");
        if v61 and v65 then
            v59 = 3600 * (tonumber(v62) or 0) + 60 * (tonumber(v63) or 0) + (tonumber(v64) or 0);
            local v69 = 3600 * (tonumber(v66) or 0) + 60 * (tonumber(v67) or 0) + (tonumber(v68) or 0);
            if v61 == "-" then
                v59 = -v59;
            end;
            v60 = (43200 + (v65 ~= "-" and v69 or -v69) - v59) % 86400 - 43200;
        else
            v58 = true;
        end;
        if v58 then
            v61 = #v57;
            return function(v70) --[[ Line: 131 ]]
                -- upvalues: v61 (copy), v57 (copy)
                v70 = 1 + v61 * v70;
                return (string.sub(v57, 1, v70 < v61 and v70 or v61));
            end;
        else
            return function(v71) --[[ Line: 136 ]]
                -- upvalues: v59 (ref), v60 (ref)
                local v72 = (v59 + v60 * v71) % 86400;
                local v73 = math.abs(v72);
                return string.format(v72 < 0 and "-%.2u:%.2u:%.2u" or "%.2u:%.2u:%.2u", (v73 - v73 % 3600) / 3600, (v73 % 3600 - v73 % 60) / 60, v73 % 60);
            end;
        end;
    end, 
    CFrame = v5, 
    Color3 = v48, 
    NumberRange = function(v74, v75) --[[ Line: 151 ]] --[[ Name: NumberRange ]]
        local l_Min_0 = v74.Min;
        local l_Max_0 = v74.Max;
        local v78 = v75.Min - l_Min_0;
        local v79 = v75.Max - l_Max_0;
        return function(v80) --[[ Line: 155 ]]
            -- upvalues: l_Min_0 (copy), v78 (copy), l_Max_0 (copy), v79 (copy)
            return NumberRange.new(l_Min_0 + v80 * v78, l_Max_0 + v80 * v79);
        end;
    end, 
    NumberSequenceKeypoint = function(v81, v82) --[[ Line: 160 ]] --[[ Name: NumberSequenceKeypoint ]]
        local l_Time_0 = v81.Time;
        local l_Value_0 = v81.Value;
        local l_Envelope_0 = v81.Envelope;
        local v86 = v82.Time - l_Time_0;
        local v87 = v82.Value - l_Value_0;
        local v88 = v82.Envelope - l_Envelope_0;
        return function(v89) --[[ Line: 164 ]]
            -- upvalues: l_Time_0 (copy), v86 (copy), l_Value_0 (copy), v87 (copy), l_Envelope_0 (copy), v88 (copy)
            return NumberSequenceKeypoint.new(l_Time_0 + v89 * v86, l_Value_0 + v89 * v87, l_Envelope_0 + v89 * v88);
        end;
    end, 
    PhysicalProperties = function(v90, v91) --[[ Line: 169 ]] --[[ Name: PhysicalProperties ]]
        local l_Density_0 = v90.Density;
        local l_Elasticity_0 = v90.Elasticity;
        local l_ElasticityWeight_0 = v90.ElasticityWeight;
        local l_Friction_0 = v90.Friction;
        local l_FrictionWeight_0 = v90.FrictionWeight;
        local v97 = v91.Density - l_Density_0;
        local v98 = v91.Elasticity - l_Elasticity_0;
        local v99 = v91.ElasticityWeight - l_ElasticityWeight_0;
        local v100 = v91.Friction - l_Friction_0;
        local v101 = v91.FrictionWeight - l_FrictionWeight_0;
        return function(v102) --[[ Line: 180 ]]
            -- upvalues: l_Density_0 (copy), v97 (copy), l_Elasticity_0 (copy), v98 (copy), l_ElasticityWeight_0 (copy), v99 (copy), l_Friction_0 (copy), v100 (copy), l_FrictionWeight_0 (copy), v101 (copy)
            return PhysicalProperties.new(l_Density_0 + v102 * v97, l_Elasticity_0 + v102 * v98, l_ElasticityWeight_0 + v102 * v99, l_Friction_0 + v102 * v100, l_FrictionWeight_0 + v102 * v101);
        end;
    end, 
    Ray = function(v103, v104) --[[ Line: 189 ]] --[[ Name: Ray ]]
        local l_Origin_0 = v103.Origin;
        local l_Direction_0 = v103.Direction;
        local l_Origin_1 = v104.Origin;
        local l_Direction_1 = v104.Direction;
        local l_X_0 = l_Origin_0.X;
        local l_Y_0 = l_Origin_0.Y;
        local l_Z_0 = l_Origin_0.Z;
        local l_X_1 = l_Direction_0.X;
        local l_Y_1 = l_Direction_0.Y;
        local l_Z_1 = l_Direction_0.Z;
        local v115 = l_Origin_1.X - l_X_0;
        local v116 = l_Origin_1.Y - l_Y_0;
        local v117 = l_Origin_1.Z - l_Z_0;
        local v118 = l_Direction_1.X - l_X_1;
        local v119 = l_Direction_1.Y - l_Y_1;
        local v120 = l_Direction_1.Z - l_Z_1;
        return function(v121) --[[ Line: 194 ]]
            -- upvalues: l_X_0 (copy), v115 (copy), l_Y_0 (copy), v116 (copy), l_Z_0 (copy), v117 (copy), l_X_1 (copy), v118 (copy), l_Y_1 (copy), v119 (copy), l_Z_1 (copy), v120 (copy)
            return Ray.new(Vector3.new(l_X_0 + v121 * v115, l_Y_0 + v121 * v116, l_Z_0 + v121 * v117), (Vector3.new(l_X_1 + v121 * v118, l_Y_1 + v121 * v119, l_Z_1 + v121 * v120)));
        end;
    end, 
    UDim = function(v122, v123) --[[ Line: 202 ]] --[[ Name: UDim ]]
        local l_Scale_0 = v122.Scale;
        local l_Offset_0 = v122.Offset;
        local v126 = v123.Scale - l_Scale_0;
        local v127 = v123.Offset - l_Offset_0;
        return function(v128) --[[ Line: 206 ]]
            -- upvalues: l_Scale_0 (copy), v126 (copy), l_Offset_0 (copy), v127 (copy)
            return UDim.new(l_Scale_0 + v128 * v126, l_Offset_0 + v128 * v127);
        end;
    end, 
    UDim2 = v5, 
    Vector2 = v5, 
    Vector3 = v5, 
    Rect = function(v129, v130) --[[ Line: 214 ]] --[[ Name: Rect ]]
        return function(v131) --[[ Line: 215 ]]
            -- upvalues: v129 (copy), v130 (copy)
            return Rect.new(v129.Min.X + v131 * (v130.Min.X - v129.Min.X), v129.Min.Y + v131 * (v130.Min.Y - v129.Min.Y), v129.Max.X + v131 * (v130.Max.X - v129.Max.X), v129.Max.Y + v131 * (v130.Max.Y - v129.Max.Y));
        end;
    end, 
    Region3 = function(v132, v133) --[[ Line: 223 ]] --[[ Name: Region3 ]]
        return function(v134) --[[ Line: 224 ]]
            -- upvalues: v132 (copy), v133 (copy)
            local v135 = v132.CFrame * (-v132.Size / 2);
            local v136 = v135 + v134 * (v133.CFrame * (-v133.Size / 2) - v135);
            local v137 = v132.CFrame * (v132.Size / 2);
            v135 = v137 + v134 * (v133.CFrame * (v133.Size / 2) - v137);
            v137 = v136.X;
            local l_X_2 = v135.X;
            local l_Y_2 = v136.Y;
            local l_Y_3 = v135.Y;
            local l_Z_2 = v136.Z;
            local l_Z_3 = v135.Z;
            return Region3.new(Vector3.new(v137 < l_X_2 and v137 or l_X_2, l_Y_2 < l_Y_3 and l_Y_2 or l_Y_3, l_Z_2 < l_Z_3 and l_Z_2 or l_Z_3), (Vector3.new(l_X_2 < v137 and v137 or l_X_2, l_Y_3 < l_Y_2 and l_Y_2 or l_Y_3, l_Z_3 < l_Z_2 and l_Z_2 or l_Z_3)));
        end;
    end, 
    NumberSequence = function(v143, v144) --[[ Line: 242 ]] --[[ Name: NumberSequence ]]
        -- upvalues: l_ipairs_0 (copy), v12 (copy)
        return function(v145) --[[ Line: 243 ]]
            -- upvalues: l_ipairs_0 (ref), v143 (copy), v144 (copy), v12 (ref)
            local v146 = {};
            local v147 = {};
            local v148 = 0;
            for _, v150 in l_ipairs_0(v143.Keypoints) do
                local v151 = nil;
                local v152 = nil;
                for _, v154 in l_ipairs_0(v144.Keypoints) do
                    if v154.Time == v150.Time then
                        v151 = v154;
                        v152 = v154;
                        break;
                    elseif v154.Time < v150.Time and (v152 == nil or v154.Time > v152.Time) then
                        v152 = v154;
                    elseif v154.Time > v150.Time and (v151 == nil or v154.Time < v151.Time) then
                        v151 = v154;
                    end;
                end;
                local v155 = nil;
                local v156 = nil;
                if v151 == v152 then
                    v155 = v151.Value;
                    v156 = v151.Envelope;
                else
                    local v157 = (v150.Time - v152.Time) / (v151.Time - v152.Time);
                    v155 = (v151.Value - v152.Value) * v157 + v152.Value;
                    v156 = (v151.Envelope - v152.Envelope) * v157 + v152.Envelope;
                end;
                v148 = v148 + 1;
                v146[v148] = NumberSequenceKeypoint.new(v150.Time, (v155 - v150.Value) * v145 + v150.Value, (v156 - v150.Envelope) * v145 + v150.Envelope);
                v147[v150.Time] = true;
            end;
            for _, v159 in l_ipairs_0(v144.Keypoints) do
                if not v147[v159.Time] then
                    local v160 = nil;
                    local v161 = nil;
                    for _, v163 in l_ipairs_0(v143.Keypoints) do
                        if v163.Time == v159.Time then
                            v160 = v163;
                            v161 = v163;
                            break;
                        elseif v163.Time < v159.Time and (v161 == nil or v163.Time > v161.Time) then
                            v161 = v163;
                        elseif v163.Time > v159.Time and (v160 == nil or v163.Time < v160.Time) then
                            v160 = v163;
                        end;
                    end;
                    local v164 = nil;
                    local v165 = nil;
                    if v160 == v161 then
                        v164 = v160.Value;
                        v165 = v160.Envelope;
                    else
                        local v166 = (v159.Time - v161.Time) / (v160.Time - v161.Time);
                        v164 = (v160.Value - v161.Value) * v166 + v161.Value;
                        v165 = (v160.Envelope - v161.Envelope) * v166 + v161.Envelope;
                    end;
                    v148 = v148 + 1;
                    v146[v148] = NumberSequenceKeypoint.new(v159.Time, (v159.Value - v164) * v145 + v164, (v159.Envelope - v165) * v145 + v165);
                end;
            end;
            table.sort(v146, v12);
            return NumberSequence.new(v146);
        end;
    end, 
    ColorSequence = function(v167, v168) --[[ Line: 310 ]] --[[ Name: ColorSequence ]]
        -- upvalues: l_ipairs_0 (copy), v48 (copy), v12 (copy)
        return function(v169) --[[ Line: 311 ]]
            -- upvalues: l_ipairs_0 (ref), v167 (copy), v168 (copy), v48 (ref), v12 (ref)
            local v170 = {};
            local v171 = {};
            local v172 = 0;
            for _, v174 in l_ipairs_0(v167.Keypoints) do
                local v175 = nil;
                local v176 = nil;
                for _, v178 in l_ipairs_0(v168.Keypoints) do
                    if v178.Time == v174.Time then
                        v175 = v178;
                        v176 = v178;
                        break;
                    elseif v178.Time < v174.Time and (v176 == nil or v178.Time > v176.Time) then
                        v176 = v178;
                    elseif v178.Time > v174.Time and (v175 == nil or v178.Time < v175.Time) then
                        v175 = v178;
                    end;
                end;
                local v179 = nil;
                v179 = if v175 == v176 then v175.Value else v48(v176.Value, v175.Value)((v174.Time - v176.Time) / (v175.Time - v176.Time));
                v172 = v172 + 1;
                v170[v172] = ColorSequenceKeypoint.new(v174.Time, v48(v174.Value, v179)(v169));
                v171[v174.Time] = true;
            end;
            for _, v181 in l_ipairs_0(v168.Keypoints) do
                if not v171[v181.Time] then
                    local v182 = nil;
                    local v183 = nil;
                    for _, v185 in l_ipairs_0(v167.Keypoints) do
                        if v185.Time == v181.Time then
                            v182 = v185;
                            v183 = v185;
                            break;
                        elseif v185.Time < v181.Time and (v183 == nil or v185.Time > v183.Time) then
                            v183 = v185;
                        elseif v185.Time > v181.Time and (v182 == nil or v185.Time < v182.Time) then
                            v182 = v185;
                        end;
                    end;
                    local v186 = nil;
                    v186 = if v182 == v183 then v182.Value else v48(v183.Value, v182.Value)((v181.Time - v183.Time) / (v182.Time - v183.Time));
                    v172 = v172 + 1;
                    v170[v172] = ColorSequenceKeypoint.new(v181.Time, v48(v181.Value, v186)(v169));
                end;
            end;
            table.sort(v170, v12);
            return ColorSequence.new(v170);
        end;
    end
}, {
    __index = function(_, v188) --[[ Line: 374 ]] --[[ Name: __index ]]
        error("No lerp function is defined for type " .. tostring(v188) .. ".", 4);
    end, 
    __newindex = function(_, v190) --[[ Line: 378 ]] --[[ Name: __newindex ]]
        error("No lerp function is defined for type " .. tostring(v190) .. ".", 4);
    end
}));