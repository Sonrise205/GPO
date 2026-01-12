--!native
local v0 = nil;
local v1 = nil;
local v2 = {
    [22] = 18, 
    [31] = 8, 
    [33] = 28, 
    [0] = 3, 
    [1] = 13, 
    [2] = 23, 
    [26] = 33, 
    [12] = 1, 
    [13] = 6, 
    [14] = 10, 
    [15] = 16, 
    [16] = 20, 
    [17] = 26, 
    [18] = 30, 
    [19] = 36, 
    [3] = 0, 
    [4] = 2, 
    [5] = 4, 
    [6] = 7, 
    [7] = 9, 
    [8] = 12, 
    [9] = 14, 
    [10] = 17, 
    [20] = 19, 
    [21] = 22, 
    [23] = 24, 
    [24] = 27, 
    [25] = 29, 
    [27] = 32, 
    [32] = 34, 
    [34] = 37, 
    [11] = 5, 
    [28] = 11, 
    [29] = 15, 
    [30] = 21, 
    [35] = 25, 
    [36] = 31, 
    [37] = 35
};
local v3 = {
    [0] = "ABC"; 
    "ABx", 
    "ABC", 
    "ABC", 
    "ABC", 
    "ABx", 
    "ABC", 
    "ABx", 
    "ABC", 
    "ABC", 
    "ABC", 
    "ABC", 
    "ABC", 
    "ABC", 
    "ABC", 
    "ABC", 
    "ABC", 
    "ABC", 
    "ABC", 
    "ABC", 
    "ABC", 
    "ABC", 
    "AsBx", 
    "ABC", 
    "ABC", 
    "ABC", 
    "ABC", 
    "ABC", 
    "ABC", 
    "ABC", 
    "ABC", 
    "AsBx", 
    "AsBx", 
    "ABC", 
    "ABC", 
    "ABC", 
    "ABx", 
    "ABC"
};
local v4 = {
    [0] = {
        b = "OpArgR", 
        c = "OpArgN"
    }; 
    {
        b = "OpArgK", 
        c = "OpArgN"
    }, 
    {
        b = "OpArgU", 
        c = "OpArgU"
    }, 
    {
        b = "OpArgR", 
        c = "OpArgN"
    }, 
    {
        b = "OpArgU", 
        c = "OpArgN"
    }, 
    {
        b = "OpArgK", 
        c = "OpArgN"
    }, 
    {
        b = "OpArgR", 
        c = "OpArgK"
    }, 
    {
        b = "OpArgK", 
        c = "OpArgN"
    }, 
    {
        b = "OpArgU", 
        c = "OpArgN"
    }, 
    {
        b = "OpArgK", 
        c = "OpArgK"
    }, 
    {
        b = "OpArgU", 
        c = "OpArgU"
    }, 
    {
        b = "OpArgR", 
        c = "OpArgK"
    }, 
    {
        b = "OpArgK", 
        c = "OpArgK"
    }, 
    {
        b = "OpArgK", 
        c = "OpArgK"
    }, 
    {
        b = "OpArgK", 
        c = "OpArgK"
    }, 
    {
        b = "OpArgK", 
        c = "OpArgK"
    }, 
    {
        b = "OpArgK", 
        c = "OpArgK"
    }, 
    {
        b = "OpArgK", 
        c = "OpArgK"
    }, 
    {
        b = "OpArgR", 
        c = "OpArgN"
    }, 
    {
        b = "OpArgR", 
        c = "OpArgN"
    }, 
    {
        b = "OpArgR", 
        c = "OpArgN"
    }, 
    {
        b = "OpArgR", 
        c = "OpArgR"
    }, 
    {
        b = "OpArgR", 
        c = "OpArgN"
    }, 
    {
        b = "OpArgK", 
        c = "OpArgK"
    }, 
    {
        b = "OpArgK", 
        c = "OpArgK"
    }, 
    {
        b = "OpArgK", 
        c = "OpArgK"
    }, 
    {
        b = "OpArgR", 
        c = "OpArgU"
    }, 
    {
        b = "OpArgR", 
        c = "OpArgU"
    }, 
    {
        b = "OpArgU", 
        c = "OpArgU"
    }, 
    {
        b = "OpArgU", 
        c = "OpArgU"
    }, 
    {
        b = "OpArgU", 
        c = "OpArgN"
    }, 
    {
        b = "OpArgR", 
        c = "OpArgN"
    }, 
    {
        b = "OpArgR", 
        c = "OpArgN"
    }, 
    {
        b = "OpArgN", 
        c = "OpArgU"
    }, 
    {
        b = "OpArgU", 
        c = "OpArgU"
    }, 
    {
        b = "OpArgN", 
        c = "OpArgN"
    }, 
    {
        b = "OpArgU", 
        c = "OpArgN"
    }, 
    {
        b = "OpArgU", 
        c = "OpArgN"
    }
};
local v5 = {
    [1] = buffer.readu8, 
    [2] = buffer.readu16, 
    [4] = buffer.readu32
};
local v6 = {
    [1] = buffer.writeu8, 
    [2] = buffer.writeu16, 
    [4] = buffer.writeu32
};
local function v10(v7, v8, v9) --[[ Line: 173 ]] --[[ Name: rd_int ]]
    -- upvalues: v5 (copy)
    return v5[v9 - v8](v7, v8);
end;
local function _(v11, v12) --[[ Line: 180 ]] --[[ Name: big_endian ]]
    -- upvalues: v6 (copy), v5 (copy)
    return function(v13, v14, v15) --[[ Line: 181 ]]
        -- upvalues: v12 (copy), v6 (ref), v5 (ref), v11 (copy)
        local v16 = (v15 or v12) * 8;
        local v17 = v6[v15];
        v17(v13, v14, (bit32.rshift(bit32.byteswap((v5[v16 - v14](v13, v14))), 32 - v16)));
        local v18 = v11(v13, v14);
        v17(v13, v14, (bit32.rshift(bit32.byteswap((v5[v16 - v14](v13, v14))), 32 - v16)));
        return v18;
    end;
end;
local v20 = {};
local v21 = {
    little = buffer.readf32
};
local l_readf32_0 = buffer.readf32;
local v23 = nil;
local l_v23_0 = v23 --[[ copy: 13 -> 26 ]];
local l_l_readf32_0_0 = l_readf32_0 --[[ copy: 12 -> 27 ]];
v21.big = function(v26, v27, v28) --[[ Line: 181 ]]
    -- upvalues: l_v23_0 (copy), v6 (copy), v5 (copy), l_l_readf32_0_0 (copy)
    local v29 = (v28 or l_v23_0) * 8;
    local v30 = v6[v28];
    v30(v26, v27, (bit32.rshift(bit32.byteswap((v5[v29 - v27](v26, v27))), 32 - v29)));
    local v31 = l_l_readf32_0_0(v26, v27);
    v30(v26, v27, (bit32.rshift(bit32.byteswap((v5[v29 - v27](v26, v27))), 32 - v29)));
    return v31;
end;
v20[4] = v21;
v21 = {
    little = buffer.readf64
};
l_readf32_0 = buffer.readf64;
v23 = nil;
local l_v23_1 = v23 --[[ copy: 13 -> 28 ]];
local l_l_readf32_0_1 = l_readf32_0 --[[ copy: 12 -> 29 ]];
v21.big = function(v34, v35, v36) --[[ Line: 181 ]]
    -- upvalues: l_v23_1 (copy), v6 (copy), v5 (copy), l_l_readf32_0_1 (copy)
    local v37 = (v36 or l_v23_1) * 8;
    local v38 = v6[v36];
    v38(v34, v35, (bit32.rshift(bit32.byteswap((v5[v37 - v35](v34, v35))), 32 - v37)));
    local v39 = l_l_readf32_0_1(v34, v35);
    v38(v34, v35, (bit32.rshift(bit32.byteswap((v5[v37 - v35](v34, v35))), 32 - v37)));
    return v39;
end;
v20[8] = v21;
v21 = function(v40) --[[ Line: 199 ]] --[[ Name: stm_byte ]]
    local l_index_0 = v40.index;
    local v42 = buffer.readu8(v40.source, l_index_0);
    v40.index = l_index_0 + 1;
    return v42;
end;
local function _(v43, v44) --[[ Line: 210 ]] --[[ Name: stm_string ]]
    local v45 = buffer.readstring(v43.source, v43.index, v44);
    v43.index = v43.index + v44;
    return v45;
end;
l_readf32_0 = function(v47) --[[ Line: 219 ]] --[[ Name: stm_lstring ]]
    local v48 = v47:s_szt();
    local v49 = nil;
    if v48 ~= 0 then
        local v50 = buffer.readstring(v47.source, v47.index, v48);
        v47.index = v47.index + v48;
        v49 = string.sub(v50, 1, -2);
    end;
    return v49;
end;
v23 = function(v51, v52) --[[ Line: 231 ]] --[[ Name: cst_int_rdr ]]
    return function(v53) --[[ Line: 232 ]]
        -- upvalues: v51 (copy), v52 (copy)
        local v54 = v53.index + v51;
        local v55 = v52(v53.source, v53.index, v54);
        v53.index = v54;
        return v55;
    end;
end;
local function _(v56, v57) --[[ Line: 244 ]] --[[ Name: cst_flt_rdr ]]
    return function(v58) --[[ Line: 245 ]]
        -- upvalues: v57 (copy), v56 (copy)
        local v59 = v57(v58.source, v58.index);
        v58.index = v58.index + v56;
        return v59;
    end;
end;
local function v71(v61) --[[ Line: 253 ]] --[[ Name: stm_inst_list ]]
    -- upvalues: v3 (copy), v4 (copy), v2 (copy)
    local v62 = v61:s_int();
    local v63 = table.create(v62);
    for v64 = 1, v62 do
        local v65 = v61:s_ins();
        local v66 = bit32.band(v65, 63);
        local v67 = v3[v66];
        local v68 = v4[v66];
        local v69 = {
            value = v65, 
            op = v2[v66], 
            A = bit32.band(bit32.rshift(v65, 6), 255)
        };
        if v67 == "ABC" then
            v69.B = bit32.band(bit32.rshift(v65, 23), 511);
            v69.C = bit32.band(bit32.rshift(v65, 14), 511);
            local v70 = false;
            if v68.b == "OpArgK" then
                v70 = v69.B > 255;
            end;
            v69.is_KB = v70;
            v70 = false;
            if v68.c == "OpArgK" then
                v70 = v69.C > 255;
            end;
            v69.is_KC = v70;
            if v66 == 10 then
                v70 = bit32.band(bit32.rshift(v69.B, 3), 31);
                if v70 == 0 then
                    v69.const = v69.B;
                else
                    v69.const = bit32.lshift(bit32.band(v69.B, 7) + 8, v70 - 1);
                end;
            end;
        elseif v67 == "ABx" then
            v69.Bx = bit32.band(bit32.rshift(v65, 14), 262143);
            v69.is_K = v68.b == "OpArgK";
        elseif v67 == "AsBx" then
            v69.sBx = bit32.band(bit32.rshift(v65, 14), 262143) - 131071;
        end;
        v63[v64] = v69;
    end;
    return v63;
end;
local function v83(v72) --[[ Line: 291 ]] --[[ Name: stm_const_list ]]
    local v73 = v72:s_int();
    local v74 = table.create(v73);
    for v75 = 1, v73 do
        local l_index_1 = v72.index;
        local v77 = buffer.readu8(v72.source, l_index_1);
        v72.index = l_index_1 + 1;
        local l_v77_0 = v77;
        l_index_1 = nil;
        if l_v77_0 == 1 then
            local l_index_2 = v72.index;
            local v80 = buffer.readu8(v72.source, l_index_2);
            v72.index = l_index_2 + 1;
            l_index_1 = v80 ~= 0;
        elseif l_v77_0 == 3 then
            l_index_1 = v72:s_num();
        elseif l_v77_0 == 4 then
            v77 = v72:s_szt();
            local v81 = nil;
            if v77 ~= 0 then
                local v82 = buffer.readstring(v72.source, v72.index, v77);
                v72.index = v72.index + v77;
                v81 = string.sub(v82, 1, -2);
            end;
            l_index_1 = v81;
        end;
        v74[v75] = l_index_1;
    end;
    return v74;
end;
local function v89(v84, v85) --[[ Line: 313 ]] --[[ Name: stm_sub_list ]]
    -- upvalues: v1 (ref)
    local v86 = v84:s_int();
    local v87 = table.create(v86);
    for v88 = 1, v86 do
        v87[v88] = v1(v84, v85);
    end;
    return v87;
end;
local function v94(v90) --[[ Line: 324 ]] --[[ Name: stm_line_list ]]
    local v91 = v90:s_int();
    local v92 = table.create(v91);
    for v93 = 1, v91 do
        v92[v93] = v90:s_int();
    end;
    return v92;
end;
local function v103(v95) --[[ Line: 333 ]] --[[ Name: stm_loc_list ]]
    local v96 = v95:s_int();
    local v97 = table.create(v96);
    for v98 = 1, v96 do
        local v99 = {};
        local v100 = v95:s_szt();
        local v101 = nil;
        if v100 ~= 0 then
            local v102 = buffer.readstring(v95.source, v95.index, v100);
            v95.index = v95.index + v100;
            v101 = string.sub(v102, 1, -2);
        end;
        v99.varname = v101;
        v99.startpc = v95:s_int();
        v99.endpc = v95:s_int();
        v97[v98] = v99;
    end;
    return v97;
end;
local function v111(v104) --[[ Line: 342 ]] --[[ Name: stm_upval_list ]]
    local v105 = v104:s_int();
    local v106 = table.create(v105);
    for v107 = 1, v105 do
        local v108 = v104:s_szt();
        local v109 = nil;
        if v108 ~= 0 then
            local v110 = buffer.readstring(v104.source, v104.index, v108);
            v104.index = v104.index + v108;
            v109 = string.sub(v110, 1, -2);
        end;
        v106[v107] = v109;
    end;
    return v106;
end;
v1 = function(v112, v113) --[[ Line: 351 ]] --[[ Name: stm_lua_func ]]
    -- upvalues: v71 (copy), v83 (copy), v89 (copy), v94 (copy), v103 (copy), v111 (copy)
    local v114 = {};
    local v115 = v112:s_szt();
    local v116 = nil;
    if v115 ~= 0 then
        local v117 = buffer.readstring(v112.source, v112.index, v115);
        v112.index = v112.index + v115;
        v116 = string.sub(v117, 1, -2);
    end;
    local v118 = v116 or v113;
    v114.source = v118;
    v112:s_int();
    v112:s_int();
    v115 = v112.index;
    v116 = buffer.readu8(v112.source, v115);
    v112.index = v115 + 1;
    v114.num_upval = v116;
    v115 = v112.index;
    v116 = buffer.readu8(v112.source, v115);
    v112.index = v115 + 1;
    v114.num_param = v116;
    local l_index_3 = v112.index;
    v115 = buffer.readu8(v112.source, l_index_3);
    v112.index = l_index_3 + 1;
    v115 = v112.index;
    v116 = buffer.readu8(v112.source, v115);
    v112.index = v115 + 1;
    v114.max_stack = v116;
    v114.code = v71(v112);
    v114.const = v83(v112);
    v114.subs = v89(v112, v118);
    v114.lines = v94(v112);
    v103(v112);
    v111(v112);
    for _, v121 in ipairs(v114.code) do
        if v121.is_K then
            v121.const = v114.const[v121.Bx + 1];
        else
            if v121.is_KB then
                v121.const_B = v114.const[v121.B - 255];
            end;
            if v121.is_KC then
                v121.const_C = v114.const[v121.C - 255];
            end;
        end;
    end;
    return v114;
end;
local function v165(v122) --[[ Line: 388 ]] --[[ Name: lua_bc_to_state ]]
    -- upvalues: v10 (copy), v6 (copy), v5 (copy), v20 (copy), v1 (ref)
    local v123 = false;
    local v124 = nil;
    local v125 = nil;
    local v126 = nil;
    local v127 = nil;
    local v128 = nil;
    local v129 = nil;
    local v130 = nil;
    local v131 = {
        index = 0, 
        source = typeof(v122) == "buffer" and v122 or buffer.fromstring(v122)
    };
    local v132 = buffer.readstring(v131.source, v131.index, 4);
    v131.index = v131.index + 4;
    assert(v132 == "\027Lua", "invalid Lua signature");
    v132 = v131.index;
    local v133 = buffer.readu8(v131.source, v132);
    v131.index = v132 + 1;
    assert(v133 == 81, "invalid Lua version");
    v132 = v131.index;
    v133 = buffer.readu8(v131.source, v132);
    v131.index = v132 + 1;
    assert(v133 == 0, "invalid Lua format");
    local l_index_4 = v131.index;
    local v135 = buffer.readu8(v131.source, l_index_4);
    v131.index = l_index_4 + 1;
    v125 = v135 ~= 0;
    local l_index_5 = v131.index;
    l_index_4 = buffer.readu8(v131.source, l_index_5);
    v131.index = l_index_5 + 1;
    v126 = l_index_4;
    l_index_5 = v131.index;
    l_index_4 = buffer.readu8(v131.source, l_index_5);
    v131.index = l_index_5 + 1;
    v127 = l_index_4;
    l_index_5 = v131.index;
    l_index_4 = buffer.readu8(v131.source, l_index_5);
    v131.index = l_index_5 + 1;
    v128 = l_index_4;
    l_index_5 = v131.index;
    l_index_4 = buffer.readu8(v131.source, l_index_5);
    v131.index = l_index_5 + 1;
    v129 = l_index_4;
    l_index_4 = v131.index;
    v135 = buffer.readu8(v131.source, l_index_4);
    v131.index = l_index_4 + 1;
    v130 = v135 ~= 0;
    local v137, v138;
    if v125 then
        l_index_5 = v10;
        v123 = l_index_5;
    end;
    if not v123 then
        l_index_4 = v10;
        v135 = nil;
        v137 = v135 --[[ copy: 11 -> 14 ]];
        v138 = l_index_4 --[[ copy: 10 -> 15 ]];
        l_index_5 = function(v139, v140, v141) --[[ Line: 181 ]]
            -- upvalues: v137 (copy), v6 (ref), v5 (ref), v138 (copy)
            local v142 = (v141 or v137) * 8;
            local v143 = v6[v141];
            v143(v139, v140, (bit32.rshift(bit32.byteswap((v5[v142 - v140](v139, v140))), 32 - v142)));
            local v144 = v138(v139, v140);
            v143(v139, v140, (bit32.rshift(bit32.byteswap((v5[v142 - v140](v139, v140))), 32 - v142)));
            return v144;
        end;
    end;
    v123 = false;
    v124 = l_index_5;
    l_index_4 = v126;
    v135 = v124;
    local l_l_index_4_0 = l_index_4 --[[ copy: 10 -> 16 ]];
    local l_v135_0 = v135 --[[ copy: 11 -> 17 ]];
    v131.s_int = function(v147) --[[ Line: 232 ]]
        -- upvalues: l_l_index_4_0 (copy), l_v135_0 (copy)
        local v148 = v147.index + l_l_index_4_0;
        local v149 = l_v135_0(v147.source, v147.index, v148);
        v147.index = v148;
        return v149;
    end;
    l_index_4 = v127;
    v135 = v124;
    local l_l_index_4_1 = l_index_4 --[[ copy: 10 -> 18 ]];
    local l_v135_1 = v135 --[[ copy: 11 -> 19 ]];
    v131.s_szt = function(v152) --[[ Line: 232 ]]
        -- upvalues: l_l_index_4_1 (copy), l_v135_1 (copy)
        local v153 = v152.index + l_l_index_4_1;
        local v154 = l_v135_1(v152.source, v152.index, v153);
        v152.index = v153;
        return v154;
    end;
    l_index_4 = v128;
    v135 = v124;
    local l_l_index_4_2 = l_index_4 --[[ copy: 10 -> 20 ]];
    local l_v135_2 = v135 --[[ copy: 11 -> 21 ]];
    v131.s_ins = function(v157) --[[ Line: 232 ]]
        -- upvalues: l_l_index_4_2 (copy), l_v135_2 (copy)
        local v158 = v157.index + l_l_index_4_2;
        local v159 = l_v135_2(v157.source, v157.index, v158);
        v157.index = v158;
        return v159;
    end;
    if v130 then
        l_index_4 = v129;
        v135 = v124;
        v131.s_num = function(v160) --[[ Line: 232 ]]
            -- upvalues: l_index_4 (copy), v135 (copy)
            local v161 = v160.index + l_index_4;
            local v162 = v135(v160.source, v160.index, v161);
            v160.index = v161;
            return v162;
        end;
    elseif v20[v129] then
        l_index_4 = v129;
        v135 = v20[v129][v125 and "little" or "big"];
        v131.s_num = function(v163) --[[ Line: 245 ]]
            -- upvalues: v135 (copy), l_index_4 (copy)
            local v164 = v135(v163.source, v163.index);
            v163.index = v163.index + l_index_4;
            return v164;
        end;
    else
        error("unsupported float size");
    end;
    return v1(v131, "@virtual");
end;
local function v170(v166, v167) --[[ Line: 434 ]] --[[ Name: close_lua_upvalues ]]
    for v168, v169 in pairs(v166) do
        if v167 <= v169.index then
            v169.value = v169.store[v169.index];
            v169.store = v169;
            v169.index = "value";
            v166[v168] = nil;
        end;
    end;
end;
local function _(v171, v172, v173) --[[ Line: 445 ]] --[[ Name: open_lua_upvalue ]]
    local v174 = v171[v172];
    if not v174 then
        v174 = {
            index = v172, 
            store = v173
        };
        v171[v172] = v174;
    end;
    return v174;
end;
local function _(v176, v177) --[[ Line: 456 ]] --[[ Name: on_lua_error ]]
    local l_source_0 = v176.source;
    local v179 = v176.lines[v176.pc - 1];
    error(string.format("%s:%i: %s", l_source_0, v179, v177), 0);
end;
local function v274(v181, v182, v183) --[[ Line: 463 ]] --[[ Name: run_lua_func ]]
    -- upvalues: v170 (copy), v2 (copy), v0 (ref)
    local l_code_0 = v181.code;
    local l_subs_0 = v181.subs;
    local l_vararg_0 = v181.vararg;
    local v187 = -1;
    local v188 = {};
    local l_memory_0 = v181.memory;
    local l_pc_0 = v181.pc;
    while true do
        local v191 = l_code_0[l_pc_0];
        local l_op_0 = v191.op;
        l_pc_0 = l_pc_0 + 1;
        if l_op_0 < 18 then
            if l_op_0 < 8 then
                if l_op_0 < 3 then
                    if l_op_0 < 1 then
                        for v193 = v191.A, v191.B do
                            l_memory_0[v193] = nil;
                        end;
                    elseif l_op_0 > 1 then
                        local v194 = v183[v191.B];
                        l_memory_0[v191.A] = v194.store[v194.index];
                    else
                        local v195 = nil;
                        local v196 = nil;
                        v195 = if v191.is_KB then v191.const_B else l_memory_0[v191.B];
                        v196 = if v191.is_KC then v191.const_C else l_memory_0[v191.C];
                        l_memory_0[v191.A] = v195 + v196;
                    end;
                elseif l_op_0 > 3 then
                    if l_op_0 < 6 then
                        if l_op_0 > 4 then
                            local l_A_0 = v191.A;
                            local l_B_0 = v191.B;
                            local v199 = nil;
                            v199 = if v191.is_KC then v191.const_C else l_memory_0[v191.C];
                            l_memory_0[l_A_0 + 1] = l_memory_0[l_B_0];
                            l_memory_0[l_A_0] = l_memory_0[l_B_0][v199];
                        else
                            l_memory_0[v191.A] = v182[v191.const];
                        end;
                    elseif l_op_0 > 6 then
                        local v200 = nil;
                        v200 = if v191.is_KC then v191.const_C else l_memory_0[v191.C];
                        l_memory_0[v191.A] = l_memory_0[v191.B][v200];
                    else
                        local v201 = nil;
                        local v202 = nil;
                        v201 = if v191.is_KB then v191.const_B else l_memory_0[v191.B];
                        v202 = if v191.is_KC then v191.const_C else l_memory_0[v191.C];
                        l_memory_0[v191.A] = v201 - v202;
                    end;
                else
                    l_memory_0[v191.A] = l_memory_0[v191.B];
                end;
            elseif l_op_0 > 8 then
                if l_op_0 < 13 then
                    if l_op_0 < 10 then
                        v182[v191.const] = l_memory_0[v191.A];
                    elseif l_op_0 > 10 then
                        if l_op_0 < 12 then
                            local l_A_1 = v191.A;
                            local l_B_1 = v191.B;
                            local l_C_0 = v191.C;
                            local v206 = nil;
                            v206 = if l_B_1 == 0 then v187 - l_A_1 else l_B_1 - 1;
                            local v207 = table.pack(l_memory_0[l_A_1](table.unpack(l_memory_0, l_A_1 + 1, l_A_1 + v206)));
                            local l_n_0 = v207.n;
                            if l_C_0 == 0 then
                                v187 = l_A_1 + l_n_0 - 1;
                            else
                                l_n_0 = l_C_0 - 1;
                            end;
                            table.move(v207, 1, l_n_0, l_A_1, l_memory_0);
                        else
                            local v209 = v183[v191.B];
                            v209.store[v209.index] = l_memory_0[v191.A];
                        end;
                    else
                        local v210 = nil;
                        local v211 = nil;
                        v210 = if v191.is_KB then v191.const_B else l_memory_0[v191.B];
                        v211 = if v191.is_KC then v191.const_C else l_memory_0[v191.C];
                        l_memory_0[v191.A] = v210 * v211;
                    end;
                elseif l_op_0 > 13 then
                    if l_op_0 < 16 then
                        if l_op_0 > 14 then
                            local l_A_2 = v191.A;
                            local l_B_2 = v191.B;
                            local v214 = nil;
                            v214 = if l_B_2 == 0 then v187 - l_A_2 else l_B_2 - 1;
                            v170(v188, 0);
                            return l_memory_0[l_A_2](table.unpack(l_memory_0, l_A_2 + 1, l_A_2 + v214));
                        else
                            local v215 = nil;
                            local v216 = nil;
                            v215 = if v191.is_KB then v191.const_B else l_memory_0[v191.B];
                            v216 = if v191.is_KC then v191.const_C else l_memory_0[v191.C];
                            l_memory_0[v191.A][v215] = v216;
                        end;
                    elseif l_op_0 > 16 then
                        l_memory_0[v191.A] = table.create(v191.const);
                    else
                        local v217 = nil;
                        local v218 = nil;
                        v217 = if v191.is_KB then v191.const_B else l_memory_0[v191.B];
                        v218 = if v191.is_KC then v191.const_C else l_memory_0[v191.C];
                        l_memory_0[v191.A] = v217 / v218;
                    end;
                else
                    l_memory_0[v191.A] = v191.const;
                end;
            else
                local l_A_3 = v191.A;
                local v220 = l_memory_0[l_A_3 + 2];
                local v221 = l_memory_0[l_A_3] + v220;
                local v222 = l_memory_0[l_A_3 + 1];
                local _ = nil;
                if if v220 == math.abs(v220) then v221 <= v222 else v222 <= v221 then
                    l_memory_0[l_A_3] = v221;
                    l_memory_0[l_A_3 + 3] = v221;
                    l_pc_0 = l_pc_0 + v191.sBx;
                end;
            end;
        elseif l_op_0 > 18 then
            if l_op_0 < 28 then
                if l_op_0 < 23 then
                    if l_op_0 < 20 then
                        l_memory_0[v191.A] = #l_memory_0[v191.B];
                    elseif l_op_0 > 20 then
                        if l_op_0 < 22 then
                            local l_A_4 = v191.A;
                            local l_B_3 = v191.B;
                            local v226 = nil;
                            v226 = if l_B_3 == 0 then v187 - l_A_4 + 1 else l_B_3 - 1;
                            v170(v188, 0);
                            return table.unpack(l_memory_0, l_A_4, l_A_4 + v226 - 1);
                        else
                            local l_B_4 = v191.B;
                            local l_C_1 = v191.C;
                            local l_status_0, l_result_0 = pcall(table.concat, l_memory_0, "", l_B_4, l_C_1);
                            if not l_status_0 then
                                l_result_0 = l_memory_0[l_B_4];
                                for v231 = l_B_4 + 1, l_C_1 do
                                    l_result_0 = l_result_0 .. l_memory_0[v231];
                                end;
                            end;
                            l_memory_0[v191.A] = l_result_0;
                        end;
                    else
                        local v232 = nil;
                        local v233 = nil;
                        v232 = if v191.is_KB then v191.const_B else l_memory_0[v191.B];
                        v233 = if v191.is_KC then v191.const_C else l_memory_0[v191.C];
                        l_memory_0[v191.A] = v232 % v233;
                    end;
                elseif l_op_0 > 23 then
                    if l_op_0 < 26 then
                        if l_op_0 > 24 then
                            v170(v188, v191.A);
                        else
                            local _ = nil;
                            local _ = nil;
                            if (if v191.is_KB then v191.const_B else l_memory_0[v191.B]) == (if v191.is_KC then v191.const_C else l_memory_0[v191.C]) == (v191.A ~= 0) then
                                l_pc_0 = l_pc_0 + l_code_0[l_pc_0].sBx;
                            end;
                            l_pc_0 = l_pc_0 + 1;
                        end;
                    elseif l_op_0 > 26 then
                        local _ = nil;
                        local _ = nil;
                        if (if v191.is_KB then v191.const_B else l_memory_0[v191.B]) < (if v191.is_KC then v191.const_C else l_memory_0[v191.C]) == (v191.A ~= 0) then
                            l_pc_0 = l_pc_0 + l_code_0[l_pc_0].sBx;
                        end;
                        l_pc_0 = l_pc_0 + 1;
                    else
                        local v238 = nil;
                        local v239 = nil;
                        v238 = if v191.is_KB then v191.const_B else l_memory_0[v191.B];
                        v239 = if v191.is_KC then v191.const_C else l_memory_0[v191.C];
                        l_memory_0[v191.A] = v238 ^ v239;
                    end;
                else
                    l_memory_0[v191.A] = v191.B ~= 0;
                    if v191.C ~= 0 then
                        l_pc_0 = l_pc_0 + 1;
                    end;
                end;
            elseif l_op_0 > 28 then
                if l_op_0 < 33 then
                    if l_op_0 < 30 then
                        local _ = nil;
                        local _ = nil;
                        if (if v191.is_KB then v191.const_B else l_memory_0[v191.B]) <= (if v191.is_KC then v191.const_C else l_memory_0[v191.C]) == (v191.A ~= 0) then
                            l_pc_0 = l_pc_0 + l_code_0[l_pc_0].sBx;
                        end;
                        l_pc_0 = l_pc_0 + 1;
                    elseif l_op_0 > 30 then
                        if l_op_0 < 32 then
                            local v242 = l_subs_0[v191.Bx + 1];
                            local l_num_upval_0 = v242.num_upval;
                            local v244 = nil;
                            if l_num_upval_0 ~= 0 then
                                v244 = table.create(l_num_upval_0 - 1);
                                for v245 = 1, l_num_upval_0 do
                                    local v246 = l_code_0[l_pc_0 + v245 - 1];
                                    if v246.op == v2[0] then
                                        local v247 = v245 - 1;
                                        local l_B_5 = v246.B;
                                        local v249 = v188[l_B_5];
                                        if not v249 then
                                            v249 = {
                                                index = l_B_5, 
                                                store = l_memory_0
                                            };
                                            v188[l_B_5] = v249;
                                        end;
                                        v244[v247] = v249;
                                    elseif v246.op == v2[4] then
                                        v244[v245 - 1] = v183[v246.B];
                                    end;
                                end;
                                l_pc_0 = l_pc_0 + l_num_upval_0;
                            end;
                            l_memory_0[v191.A] = v0(v242, v182, v244);
                        else
                            local l_A_5 = v191.A;
                            local l_B_6 = v191.B;
                            if not l_memory_0[l_B_6] ~= (v191.C ~= 0) then
                                l_memory_0[l_A_5] = l_memory_0[l_B_6];
                                l_pc_0 = l_pc_0 + l_code_0[l_pc_0].sBx;
                            end;
                            l_pc_0 = l_pc_0 + 1;
                        end;
                    else
                        l_memory_0[v191.A] = -l_memory_0[v191.B];
                    end;
                elseif l_op_0 > 33 then
                    if l_op_0 < 36 then
                        if l_op_0 > 34 then
                            local l_A_6 = v191.A;
                            local l_B_7 = v191.B;
                            if l_B_7 == 0 then
                                l_B_7 = l_vararg_0.len;
                                v187 = l_A_6 + l_B_7 - 1;
                            end;
                            table.move(l_vararg_0.list, 1, l_B_7, l_A_6, l_memory_0);
                        else
                            local l_A_7 = v191.A;
                            local v255 = nil;
                            local v256 = nil;
                            local v257 = nil;
                            v255 = assert(tonumber(l_memory_0[l_A_7]), "`for` initial value must be a number");
                            v256 = assert(tonumber(l_memory_0[l_A_7 + 1]), "`for` limit must be a number");
                            v257 = assert(tonumber(l_memory_0[l_A_7 + 2]), "`for` step must be a number");
                            l_memory_0[l_A_7] = v255 - v257;
                            l_memory_0[l_A_7 + 1] = v256;
                            l_memory_0[l_A_7 + 2] = v257;
                            l_pc_0 = l_pc_0 + v191.sBx;
                        end;
                    elseif l_op_0 > 36 then
                        local l_A_8 = v191.A;
                        local l_C_2 = v191.C;
                        local l_B_8 = v191.B;
                        local v261 = l_memory_0[l_A_8];
                        local v262 = nil;
                        if l_B_8 == 0 then
                            l_B_8 = v187 - l_A_8;
                        end;
                        if l_C_2 == 0 then
                            l_C_2 = v191[l_pc_0].value;
                            l_pc_0 = l_pc_0 + 1;
                        end;
                        v262 = (l_C_2 - 1) * 50;
                        table.move(l_memory_0, l_A_8 + 1, l_A_8 + l_B_8, v262 + 1, v261);
                    else
                        l_memory_0[v191.A] = not l_memory_0[v191.B];
                    end;
                else
                    if not l_memory_0[v191.A] ~= (v191.C ~= 0) then
                        l_pc_0 = l_pc_0 + l_code_0[l_pc_0].sBx;
                    end;
                    l_pc_0 = l_pc_0 + 1;
                end;
            else
                local l_A_9 = v191.A;
                local v264 = l_memory_0[l_A_9];
                local v265 = l_memory_0[l_A_9 + 1];
                local v266 = l_memory_0[l_A_9 + 2];
                local v267 = l_A_9 + 3;
                local v268 = nil;
                if not v266 and not v265 and type(v264) == "table" then
                    local v269 = pcall(getmetatable, v264);
                    local v270 = v269 and not pcall(setmetatable, v264, (getmetatable(v264))) or not v269;
                    local v271 = v269 and getmetatable(v264);
                    if (not table.isfrozen or not table.isfrozen(v264)) and v270 and not v271 then
                        warn("[FiOne]: The table has a metatable buts it's hidden, __iter and __call won't work in forloop.");
                    end;
                    if type(v271) ~= "table" or not rawget(v271, "__call") then
                        local v272 = type(v271) == "table" and rawget(v271, "__iter") or next;
                        v265 = v264;
                        v266 = nil;
                        v264 = v272;
                        v272 = l_A_9 + 1;
                        local v273 = l_A_9 + 2;
                        l_memory_0[l_A_9] = v264;
                        l_memory_0[v272] = v265;
                        l_memory_0[v273] = v266;
                    end;
                end;
                v268 = {
                    v264(v265, v266)
                };
                table.move(v268, 1, v191.C, v267, l_memory_0);
                if l_memory_0[v267] ~= nil then
                    l_memory_0[l_A_9 + 2] = l_memory_0[v267];
                    l_pc_0 = l_pc_0 + l_code_0[l_pc_0].sBx;
                end;
                l_pc_0 = l_pc_0 + 1;
            end;
        else
            l_pc_0 = l_pc_0 + v191.sBx;
        end;
        v181.pc = l_pc_0;
    end;
end;
v0 = function(v275, v276, v277) --[[ Line: 977 ]] --[[ Name: lua_wrap_state ]]
    -- upvalues: v274 (copy)
    return function(...) --[[ Line: 978 ]] --[[ Name: wrapped ]]
        -- upvalues: v275 (copy), v274 (ref), v276 (copy), v277 (copy)
        local v278 = table.pack(...);
        local v279 = table.create(v275.max_stack);
        local v280 = {
            len = 0, 
            list = {}
        };
        table.move(v278, 1, v275.num_param, 0, v279);
        if v275.num_param < v278.n then
            local v281 = v275.num_param + 1;
            local v282 = v278.n - v275.num_param;
            v280.len = v282;
            table.move(v278, v281, v281 + v282 - 1, 1, v280.list);
        end;
        local v283 = {
            vararg = v280, 
            memory = v279, 
            code = v275.code, 
            subs = v275.subs, 
            pc = 1
        };
        local v284 = table.pack(pcall(v274, v283, v276, v277));
        if v284[1] then
            return table.unpack(v284, 2, v284.n);
        else
            local v285 = {
                pc = v283.pc, 
                source = v275.source, 
                lines = v275.lines
            };
            local v286 = v284[2];
            local l_source_1 = v285.source;
            local v288 = v285.lines[v285.pc - 1];
            error(string.format("%s:%i: %s", l_source_1, v288, v286), 0);
            return;
        end;
    end;
end;
return (setmetatable({
    bc_to_state = v165, 
    wrap_state = v0, 
    OPCODE_RM = v2, 
    OPCODE_T = v3, 
    OPCODE_M = v4
}, {
    __call = function(_, v290, v291) --[[ Line: 1017 ]] --[[ Name: __call ]]
        -- upvalues: v0 (ref), v165 (copy)
        return v0(v165(v290), v291 or {});
    end
}));