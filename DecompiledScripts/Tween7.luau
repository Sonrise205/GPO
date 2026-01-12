local v0 = {};
local l_pow_0 = math.pow;
local l_sin_0 = math.sin;
local l_cos_0 = math.cos;
local _ = 3.141592653589793;
local l_sqrt_0 = math.sqrt;
local l_abs_0 = math.abs;
local l_asin_0 = math.asin;
local function v12(v8, v9, v10, v11) --[[ Line: 13 ]] --[[ Name: linear ]]
    return v10 * v8 / v11 + v9;
end;
local function v17(v13, v14, v15, v16) --[[ Line: 16 ]] --[[ Name: inQuad ]]
    -- upvalues: l_pow_0 (copy)
    return v15 * l_pow_0(v13 / v16, 2) + v14;
end;
local function v22(v18, v19, v20, v21) --[[ Line: 17 ]] --[[ Name: outQuad ]]
    v18 = v18 / v21;
    return -v20 * v18 * (v18 - 2) + v19;
end;
local function v27(v23, v24, v25, v26) --[[ Line: 21 ]] --[[ Name: inOutQuad ]]
    -- upvalues: l_pow_0 (copy)
    v23 = v23 / v26 * 2;
    if v23 < 1 then
        return v25 / 2 * l_pow_0(v23, 2) + v24;
    else
        return -v25 / 2 * ((v23 - 1) * (v23 - 3) - 1) + v24;
    end;
end;
local function v36(v28, v29, v30, v31) --[[ Line: 26 ]] --[[ Name: outInQuad ]]
    -- upvalues: l_pow_0 (copy)
    if v28 < v31 / 2 then
        local v32 = v28 * 2;
        local v33 = v30 / 2;
        v32 = v32 / v31;
        return -v33 * v32 * (v32 - 2) + v29;
    else
        local v34 = v28 * 2 - v31;
        local v35 = v29 + v30 / 2;
        return v30 / 2 * l_pow_0(v34 / v31, 2) + v35;
    end;
end;
local function v41(v37, v38, v39, v40) --[[ Line: 32 ]] --[[ Name: inCubic ]]
    -- upvalues: l_pow_0 (copy)
    return v39 * l_pow_0(v37 / v40, 3) + v38;
end;
local function v46(v42, v43, v44, v45) --[[ Line: 33 ]] --[[ Name: outCubic ]]
    -- upvalues: l_pow_0 (copy)
    return v44 * (l_pow_0(v42 / v45 - 1, 3) + 1) + v43;
end;
local function v51(v47, v48, v49, v50) --[[ Line: 34 ]] --[[ Name: inOutCubic ]]
    v47 = v47 / v50 * 2;
    if v47 < 1 then
        return v49 / 2 * v47 * v47 * v47 + v48;
    else
        v47 = v47 - 2;
        return v49 / 2 * (v47 * v47 * v47 + 2) + v48;
    end;
end;
local function v59(v52, v53, v54, v55) --[[ Line: 40 ]] --[[ Name: outInCubic ]]
    -- upvalues: l_pow_0 (copy)
    if v52 < v55 / 2 then
        local v56 = v52 * 2;
        return v54 / 2 * (l_pow_0(v56 / v55 - 1, 3) + 1) + v53;
    else
        local v57 = v52 * 2 - v55;
        local v58 = v53 + v54 / 2;
        return v54 / 2 * l_pow_0(v57 / v55, 3) + v58;
    end;
end;
local function v64(v60, v61, v62, v63) --[[ Line: 46 ]] --[[ Name: inQuart ]]
    -- upvalues: l_pow_0 (copy)
    return v62 * l_pow_0(v60 / v63, 4) + v61;
end;
local function v69(v65, v66, v67, v68) --[[ Line: 47 ]] --[[ Name: outQuart ]]
    -- upvalues: l_pow_0 (copy)
    return -v67 * (l_pow_0(v65 / v68 - 1, 4) - 1) + v66;
end;
local function v74(v70, v71, v72, v73) --[[ Line: 48 ]] --[[ Name: inOutQuart ]]
    -- upvalues: l_pow_0 (copy)
    v70 = v70 / v73 * 2;
    if v70 < 1 then
        return v72 / 2 * l_pow_0(v70, 4) + v71;
    else
        return -v72 / 2 * (l_pow_0(v70 - 2, 4) - 2) + v71;
    end;
end;
local function v82(v75, v76, v77, v78) --[[ Line: 53 ]] --[[ Name: outInQuart ]]
    -- upvalues: l_pow_0 (copy)
    if v75 < v78 / 2 then
        local v79 = v75 * 2;
        return -(v77 / 2) * (l_pow_0(v79 / v78 - 1, 4) - 1) + v76;
    else
        local v80 = v75 * 2 - v78;
        local v81 = v76 + v77 / 2;
        return v77 / 2 * l_pow_0(v80 / v78, 4) + v81;
    end;
end;
local function v87(v83, v84, v85, v86) --[[ Line: 59 ]] --[[ Name: inQuint ]]
    -- upvalues: l_pow_0 (copy)
    return v85 * l_pow_0(v83 / v86, 5) + v84;
end;
local function v92(v88, v89, v90, v91) --[[ Line: 60 ]] --[[ Name: outQuint ]]
    -- upvalues: l_pow_0 (copy)
    return v90 * (l_pow_0(v88 / v91 - 1, 5) + 1) + v89;
end;
local function v97(v93, v94, v95, v96) --[[ Line: 61 ]] --[[ Name: inOutQuint ]]
    -- upvalues: l_pow_0 (copy)
    v93 = v93 / v96 * 2;
    if v93 < 1 then
        return v95 / 2 * l_pow_0(v93, 5) + v94;
    else
        return v95 / 2 * (l_pow_0(v93 - 2, 5) + 2) + v94;
    end;
end;
local function v105(v98, v99, v100, v101) --[[ Line: 66 ]] --[[ Name: outInQuint ]]
    -- upvalues: l_pow_0 (copy)
    if v98 < v101 / 2 then
        local v102 = v98 * 2;
        return v100 / 2 * (l_pow_0(v102 / v101 - 1, 5) + 1) + v99;
    else
        local v103 = v98 * 2 - v101;
        local v104 = v99 + v100 / 2;
        return v100 / 2 * l_pow_0(v103 / v101, 5) + v104;
    end;
end;
local function v110(v106, v107, v108, v109) --[[ Line: 72 ]] --[[ Name: inSine ]]
    -- upvalues: l_cos_0 (copy)
    return -v108 * l_cos_0(v106 / v109 * 1.5707963267948966) + v108 + v107;
end;
local function v115(v111, v112, v113, v114) --[[ Line: 73 ]] --[[ Name: outSine ]]
    -- upvalues: l_sin_0 (copy)
    return v113 * l_sin_0(v111 / v114 * 1.5707963267948966) + v112;
end;
local function v120(v116, v117, v118, v119) --[[ Line: 74 ]] --[[ Name: inOutSine ]]
    -- upvalues: l_cos_0 (copy)
    return -v118 / 2 * (l_cos_0(3.141592653589793 * v116 / v119) - 1) + v117;
end;
local function v129(v121, v122, v123, v124) --[[ Line: 75 ]] --[[ Name: outInSine ]]
    -- upvalues: l_sin_0 (copy), l_cos_0 (copy)
    if v121 < v124 / 2 then
        local v125 = v121 * 2;
        return v123 / 2 * l_sin_0(v125 / v124 * 1.5707963267948966) + v122;
    else
        local v126 = v121 * 2 - v124;
        local v127 = v122 + v123 / 2;
        local v128 = v123 / 2;
        return -v128 * l_cos_0(v126 / v124 * 1.5707963267948966) + v128 + v127;
    end;
end;
local function v134(v130, v131, v132, v133) --[[ Line: 81 ]] --[[ Name: inExpo ]]
    -- upvalues: l_pow_0 (copy)
    if v130 == 0 then
        return v131;
    else
        return v132 * l_pow_0(2, 10 * (v130 / v133 - 1)) + v131 - v132 * 0.001;
    end;
end;
local function v139(v135, v136, v137, v138) --[[ Line: 85 ]] --[[ Name: outExpo ]]
    -- upvalues: l_pow_0 (copy)
    if v135 == v138 then
        return v136 + v137;
    else
        return v137 * 1.001 * (-l_pow_0(2, -10 * v135 / v138) + 1) + v136;
    end;
end;
local function v144(v140, v141, v142, v143) --[[ Line: 89 ]] --[[ Name: inOutExpo ]]
    -- upvalues: l_pow_0 (copy)
    if v140 == 0 then
        return v141;
    elseif v140 == v143 then
        return v141 + v142;
    else
        v140 = v140 / v143 * 2;
        if v140 < 1 then
            return v142 / 2 * l_pow_0(2, 10 * (v140 - 1)) + v141 - v142 * 5.0E-4;
        else
            return v142 / 2 * 1.0005 * (-l_pow_0(2, -10 * (v140 - 1)) + 2) + v141;
        end;
    end;
end;
local function v154(v145, v146, v147, v148) --[[ Line: 96 ]] --[[ Name: outInExpo ]]
    -- upvalues: l_pow_0 (copy)
    if v145 < v148 / 2 then
        local v149 = v145 * 2;
        local v150 = v147 / 2;
        if v149 == v148 then
            return v146 + v150;
        else
            return v150 * 1.001 * (-l_pow_0(2, -10 * v149 / v148) + 1) + v146;
        end;
    else
        local v151 = v145 * 2 - v148;
        local v152 = v146 + v147 / 2;
        local v153 = v147 / 2;
        if v151 == 0 then
            return v152;
        else
            return v153 * l_pow_0(2, 10 * (v151 / v148 - 1)) + v152 - v153 * 0.001;
        end;
    end;
end;
local function v159(v155, v156, v157, v158) --[[ Line: 102 ]] --[[ Name: inCirc ]]
    -- upvalues: l_pow_0 (copy), l_sqrt_0 (copy)
    return -v157 * (l_sqrt_0(1 - l_pow_0(v155 / v158, 2)) - 1) + v156;
end;
local function v164(v160, v161, v162, v163) --[[ Line: 103 ]] --[[ Name: outCirc ]]
    -- upvalues: l_pow_0 (copy), l_sqrt_0 (copy)
    return v162 * l_sqrt_0(1 - l_pow_0(v160 / v163 - 1, 2)) + v161;
end;
local function v169(v165, v166, v167, v168) --[[ Line: 104 ]] --[[ Name: inOutCirc ]]
    -- upvalues: l_sqrt_0 (copy)
    v165 = v165 / v168 * 2;
    if v165 < 1 then
        return -v167 / 2 * (l_sqrt_0(1 - v165 * v165) - 1) + v166;
    else
        v165 = v165 - 2;
        return v167 / 2 * (l_sqrt_0(1 - v165 * v165) + 1) + v166;
    end;
end;
local function v177(v170, v171, v172, v173) --[[ Line: 110 ]] --[[ Name: outInCirc ]]
    -- upvalues: l_pow_0 (copy), l_sqrt_0 (copy)
    if v170 < v173 / 2 then
        local v174 = v170 * 2;
        return v172 / 2 * l_sqrt_0(1 - l_pow_0(v174 / v173 - 1, 2)) + v171;
    else
        local v175 = v170 * 2 - v173;
        local v176 = v171 + v172 / 2;
        return -(v172 / 2) * (l_sqrt_0(1 - l_pow_0(v175 / v173, 2)) - 1) + v176;
    end;
end;
local function _(v178, v179, v180, v181) --[[ Line: 116 ]] --[[ Name: calculatePAS ]]
    -- upvalues: l_abs_0 (copy), l_asin_0 (copy)
    v178 = v178 or v181 * 0.3;
    v179 = v179 or 0;
    if v179 < l_abs_0(v180) then
        return v178, v180, v178 / 4;
    else
        return v178, v179, v178 / 6.283185307179586 * l_asin_0(v180 / v179);
    end;
end;
local function v195(v183, v184, v185, v186, v187, v188) --[[ Line: 121 ]] --[[ Name: inElastic ]]
    -- upvalues: l_abs_0 (copy), l_asin_0 (copy), l_pow_0 (copy), l_sin_0 (copy)
    local v189 = nil;
    if v183 == 0 then
        return v184;
    else
        v183 = v183 / v186;
        if v183 == 1 then
            return v184 + v185;
        else
            local l_v188_0 = v188;
            local l_v187_0 = v187;
            l_v188_0 = l_v188_0 or v186 * 0.3;
            l_v187_0 = l_v187_0 or 0;
            local v192, v193, v194;
            if l_v187_0 < l_abs_0(v185) then
                v192 = l_v188_0;
                v193 = v185;
                v194 = l_v188_0 / 4;
            else
                v192 = l_v188_0;
                v193 = l_v187_0;
                v194 = l_v188_0 / 6.283185307179586 * l_asin_0(v185 / l_v187_0);
            end;
            v188 = v192;
            v187 = v193;
            v189 = v194;
            v183 = v183 - 1;
            return -(v187 * l_pow_0(2, 10 * v183) * l_sin_0((v183 * v186 - v189) * 6.283185307179586 / v188)) + v184;
        end;
    end;
end;
local function v208(v196, v197, v198, v199, v200, v201) --[[ Line: 130 ]] --[[ Name: outElastic ]]
    -- upvalues: l_abs_0 (copy), l_asin_0 (copy), l_pow_0 (copy), l_sin_0 (copy)
    local _ = nil;
    if v196 == 0 then
        return v197;
    else
        v196 = v196 / v199;
        if v196 == 1 then
            return v197 + v198;
        else
            local l_v201_0 = v201;
            local l_v200_0 = v200;
            l_v201_0 = l_v201_0 or v199 * 0.3;
            l_v200_0 = l_v200_0 or 0;
            local v205, v206, v207;
            if l_v200_0 < l_abs_0(v198) then
                v207 = l_v201_0;
                v205 = v198;
                v206 = l_v201_0 / 4;
            else
                v207 = l_v201_0;
                v205 = l_v200_0;
                v206 = l_v201_0 / 6.283185307179586 * l_asin_0(v198 / l_v200_0);
            end;
            return v205 * l_pow_0(2, -10 * v196) * l_sin_0((v196 * v199 - v206) * 6.283185307179586 / v207) + v198 + v197;
        end;
    end;
end;
local function v221(v209, v210, v211, v212, v213, v214) --[[ Line: 138 ]] --[[ Name: inOutElastic ]]
    -- upvalues: l_abs_0 (copy), l_asin_0 (copy), l_pow_0 (copy), l_sin_0 (copy)
    local v215 = nil;
    if v209 == 0 then
        return v210;
    else
        v209 = v209 / v212 * 2;
        if v209 == 2 then
            return v210 + v211;
        else
            local l_v214_0 = v214;
            local l_v213_0 = v213;
            l_v214_0 = l_v214_0 or v212 * 0.3;
            l_v213_0 = l_v213_0 or 0;
            local v218, v219, v220;
            if l_v213_0 < l_abs_0(v211) then
                v218 = l_v214_0;
                v219 = v211;
                v220 = l_v214_0 / 4;
            else
                v218 = l_v214_0;
                v219 = l_v213_0;
                v220 = l_v214_0 / 6.283185307179586 * l_asin_0(v211 / l_v213_0);
            end;
            v214 = v218;
            v213 = v219;
            v215 = v220;
            v209 = v209 - 1;
            if v209 < 0 then
                return -0.5 * (v213 * l_pow_0(2, 10 * v209) * l_sin_0((v209 * v212 - v215) * 6.283185307179586 / v214)) + v210;
            else
                return v213 * l_pow_0(2, -10 * v209) * l_sin_0((v209 * v212 - v215) * 6.283185307179586 / v214) * 0.5 + v211 + v210;
            end;
        end;
    end;
end;
local function v228(v222, v223, v224, v225, v226, v227) --[[ Line: 148 ]] --[[ Name: outInElastic ]]
    -- upvalues: v208 (copy), v195 (copy)
    if v222 < v225 / 2 then
        return (v208(v222 * 2, v223, v224 / 2, v225, v226, v227));
    else
        return (v195(v222 * 2 - v225, v223 + v224 / 2, v224 / 2, v225, v226, v227));
    end;
end;
local function v234(v229, v230, v231, v232, v233) --[[ Line: 154 ]] --[[ Name: inBack ]]
    v233 = v233 or 1.70158;
    v229 = v229 / v232;
    return v231 * v229 * v229 * ((v233 + 1) * v229 - v233) + v230;
end;
local function v240(v235, v236, v237, v238, v239) --[[ Line: 159 ]] --[[ Name: outBack ]]
    v239 = v239 or 1.70158;
    v235 = v235 / v238 - 1;
    return v237 * (v235 * v235 * ((v239 + 1) * v235 + v239) + 1) + v236;
end;
local function v246(v241, v242, v243, v244, v245) --[[ Line: 164 ]] --[[ Name: inOutBack ]]
    v245 = (v245 or 1.70158) * 1.525;
    v241 = v241 / v244 * 2;
    if v241 < 1 then
        return v243 / 2 * (v241 * v241 * ((v245 + 1) * v241 - v245)) + v242;
    else
        v241 = v241 - 2;
        return v243 / 2 * (v241 * v241 * ((v245 + 1) * v241 + v245) + 2) + v242;
    end;
end;
local function v259(v247, v248, v249, v250, v251) --[[ Line: 171 ]] --[[ Name: outInBack ]]
    if v247 < v250 / 2 then
        local v252 = v247 * 2;
        local v253 = v249 / 2;
        local v254 = v251 or 1.70158;
        v252 = v252 / v250 - 1;
        return v253 * (v252 * v252 * ((v254 + 1) * v252 + v254) + 1) + v248;
    else
        local v255 = v247 * 2 - v250;
        local v256 = v248 + v249 / 2;
        local v257 = v249 / 2;
        local v258 = v251 or 1.70158;
        v255 = v255 / v250;
        return v257 * v255 * v255 * ((v258 + 1) * v255 - v258) + v256;
    end;
end;
local function v264(v260, v261, v262, v263) --[[ Line: 177 ]] --[[ Name: outBounce ]]
    v260 = v260 / v263;
    if v260 < 0.36363636363636365 then
        return v262 * (7.5625 * v260 * v260) + v261;
    elseif v260 < 0.7272727272727273 then
        v260 = v260 - 0.5454545454545454;
        return v262 * (7.5625 * v260 * v260 + 0.75) + v261;
    elseif v260 < 0.9090909090909091 then
        v260 = v260 - 0.8181818181818182;
        return v262 * (7.5625 * v260 * v260 + 0.9375) + v261;
    else
        v260 = v260 - 0.9545454545454546;
        return v262 * (7.5625 * v260 * v260 + 0.984375) + v261;
    end;
end;
local function v269(v265, v266, v267, v268) --[[ Line: 190 ]] --[[ Name: inBounce ]]
    -- upvalues: v264 (copy)
    return v267 - v264(v268 - v265, 0, v267, v268) + v266;
end;
local function v275(v270, v271, v272, v273) --[[ Line: 191 ]] --[[ Name: inOutBounce ]]
    -- upvalues: v264 (copy)
    if v270 < v273 / 2 then
        local v274 = v270 * 2;
        return (v272 - v264(v273 - v274, 0, v272, v273) + 0) * 0.5 + v271;
    else
        return v264(v270 * 2 - v273, 0, v272, v273) * 0.5 + v272 * 0.5 + v271;
    end;
end;
local function v283(v276, v277, v278, v279) --[[ Line: 195 ]] --[[ Name: outInBounce ]]
    -- upvalues: v264 (copy)
    if v276 < v279 / 2 then
        return (v264(v276 * 2, v277, v278 / 2, v279));
    else
        local v280 = v276 * 2 - v279;
        local v281 = v277 + v278 / 2;
        local v282 = v278 / 2;
        return v282 - v264(v279 - v280, 0, v282, v279) + v281;
    end;
end;
v0.point = function(v284, v285, v286) --[[ Line: 200 ]]
    return (v285 - v284) * v286 + v284;
end;
v0.ease = {
    ["in"] = {
        linear = v12, 
        quad = v17, 
        cubic = v41, 
        quart = v64, 
        quint = v87, 
        sine = v110, 
        expo = v134, 
        circ = v159, 
        elastic = v195, 
        back = v234, 
        bounce = v269
    }, 
    out = {
        quad = v22, 
        cubic = v46, 
        quart = v69, 
        quint = v92, 
        sine = v115, 
        expo = v139, 
        circ = v164, 
        elastic = v208, 
        back = v240, 
        bounce = v264
    }, 
    inout = {
        quad = v27, 
        cubic = v51, 
        quart = v74, 
        quint = v97, 
        sine = v120, 
        expo = v144, 
        circ = v169, 
        elastic = v221, 
        back = v246, 
        bounce = v275
    }, 
    outin = {
        quad = v36, 
        cubic = v59, 
        quart = v82, 
        quint = v105, 
        sine = v129, 
        expo = v154, 
        circ = v177, 
        elastic = v228, 
        back = v259, 
        bounce = v283
    }
};
return v0;