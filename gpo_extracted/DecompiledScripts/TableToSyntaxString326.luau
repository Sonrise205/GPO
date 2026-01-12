local l_Parent_0 = script.Parent.Parent;
local l_Modules_0 = l_Parent_0.Modules;
local l_Components_0 = l_Parent_0.Components;
local v3 = require(l_Modules_0.Packages);
local v4 = require(v3.Directory.PacketSizeCounter);
local v5 = require(l_Components_0.StudioSettings);
local v6 = {
    ["\a"] = "\\a", 
    ["\b"] = "\\b", 
    ["\f"] = "\\f", 
    ["\n"] = "\\n", 
    ["\r"] = "\\r", 
    ["\t"] = "\\t", 
    ["\v"] = "\\v", 
    ["\000"] = "\\0"
};
local v7 = {
    ["and"] = true, 
    ["break"] = true, 
    ["do"] = true, 
    ["else"] = true, 
    ["elseif"] = true, 
    ["end"] = true, 
    ["false"] = true, 
    ["for"] = true, 
    ["function"] = true, 
    ["if"] = true, 
    ["in"] = true, 
    ["local"] = true, 
    ["nil"] = true, 
    ["not"] = true, 
    ["or"] = true, 
    ["repeat"] = true, 
    ["return"] = true, 
    ["then"] = true, 
    ["true"] = true, 
    ["until"] = true, 
    ["while"] = true, 
    continue = true
};
local v8 = {
    ["&"] = "&amp;", 
    ["<"] = "&lt;", 
    [">"] = "&gt;", 
    ["\""] = "&quot;", 
    ["'"] = "&apos;"
};
local function _(v9) --[[ Line: 23 ]] --[[ Name: GetByteSize ]]
    -- upvalues: v4 (copy)
    local v10 = v4.GetDataByteSize(v9);
    if v10 < 1000 then
        return (("%* bytes"):format(v10));
    else
        return string.format("%.3f kilobytes", v10 / 1000);
    end;
end;
local v12 = {
    string = "ScriptString", 
    number = "ScriptNumber", 
    operator = "ScriptOperator", 
    keyword = "ScriptKeyword", 
    boolean = "ScriptKeyword", 
    builtin = "ScriptBuiltInFunction", 
    funcname = "ScriptFunctionName", 
    text = "ScriptText", 
    ["nil"] = "ScriptKeyword", 
    bytesize = "ScriptComment", 
    bracket = "ScriptBracket"
};
local v13 = {};
local function v17() --[[ Line: 47 ]] --[[ Name: UpdateStyleGuideColors ]]
    -- upvalues: v5 (copy), v12 (copy), v13 (copy)
    local l_Theme_0 = v5.Theme;
    for v15, v16 in v12 do
        v13[v15] = ("#%*"):format((l_Theme_0:GetColor(v16):ToHex()));
    end;
end;
v17();
v5.ThemeChanged:Connect(v17);
local v18 = {};
v18.__index = v18;
v18.new = function(v19) --[[ Line: 61 ]] --[[ Name: new ]]
    -- upvalues: v18 (copy)
    return (setmetatable({
        parts = {}, 
        glyphCount = 0, 
        maxGlyphs = v19 or 20000, 
        trimmed = false
    }, v18));
end;
v18.getRemainingGlyphs = function(v20) --[[ Line: 70 ]] --[[ Name: getRemainingGlyphs ]]
    return (math.max(0, v20.maxGlyphs - v20.glyphCount - 13));
end;
v18.canAddGlyphs = function(v21, v22) --[[ Line: 74 ]] --[[ Name: canAddGlyphs ]]
    return v21.glyphCount + v22 + 13 <= v21.maxGlyphs;
end;
v18.addRaw = function(v23, v24) --[[ Line: 78 ]] --[[ Name: addRaw ]]
    if v23.trimmed then
        return false;
    else
        local v25 = #v24;
        if not v23:canAddGlyphs(v25) then
            v23.trimmed = true;
            table.insert(v23.parts, "... [Trimmed]");
            v23.glyphCount = v23.glyphCount + 13;
            return false;
        else
            table.insert(v23.parts, v24);
            v23.glyphCount = v23.glyphCount + v25;
            return true;
        end;
    end;
end;
v18.addFormatted = function(v26, v27, v28) --[[ Line: 94 ]] --[[ Name: addFormatted ]]
    -- upvalues: v13 (copy)
    if v26.trimmed then
        return false;
    else
        local v29 = #v28;
        if not v26:canAddGlyphs(v29) then
            local v30 = v26:getRemainingGlyphs();
            if v30 > 0 then
                local v31 = string.sub(v28, 1, v30);
                table.insert(v26.parts, string.format("<font color=\"%s\">%s</font>", string.match(v27, "color=\"([^\"]+)\"") or v13.text, v31));
                v26.glyphCount = v26.glyphCount + #v31;
            end;
            v26.trimmed = true;
            table.insert(v26.parts, "... [Trimmed]");
            v26.glyphCount = v26.glyphCount + 13;
            return false;
        else
            table.insert(v26.parts, v27);
            v26.glyphCount = v26.glyphCount + v29;
            return true;
        end;
    end;
end;
v18.toString = function(v32) --[[ Line: 121 ]] --[[ Name: toString ]]
    return table.concat(v32.parts);
end;
v18.isTrimmed = function(v33) --[[ Line: 125 ]] --[[ Name: isTrimmed ]]
    return v33.trimmed;
end;
local function _(v34, v35, v36) --[[ Line: 129 ]] --[[ Name: Syntax ]]
    -- upvalues: v13 (copy)
    local v37 = string.format("<font color=\"%s\">%s</font>", v13[v35] or v13.text, v34);
    if v36 then
        v36:addFormatted(v37, v34);
        return v37;
    else
        return v37;
    end;
end;
local v57 = {
    ["."] = function(v39) --[[ Line: 139 ]]
        -- upvalues: v13 (copy)
        local v40 = string.format("<font color=\"%s\">%s</font>", v13.operator or v13.text, ".");
        if v39 then
            v39:addFormatted(v40, ".");
            return v40;
        else
            return v40;
        end;
    end, 
    [","] = function(v41) --[[ Line: 140 ]]
        -- upvalues: v13 (copy)
        local v42 = string.format("<font color=\"%s\">%s</font>", v13.text or v13.text, ",");
        if v41 then
            v41:addFormatted(v42, ",");
            return v42;
        else
            return v42;
        end;
    end, 
    ["="] = function(v43) --[[ Line: 141 ]]
        -- upvalues: v13 (copy)
        local v44 = string.format("<font color=\"%s\">%s</font>", v13.operator or v13.text, "=");
        if v43 then
            v43:addFormatted(v44, "=");
            return v44;
        else
            return v44;
        end;
    end, 
    ["("] = function(v45) --[[ Line: 142 ]]
        -- upvalues: v13 (copy)
        local v46 = string.format("<font color=\"%s\">%s</font>", v13.bracket or v13.text, "(");
        if v45 then
            v45:addFormatted(v46, "(");
            return v46;
        else
            return v46;
        end;
    end, 
    [")"] = function(v47) --[[ Line: 143 ]]
        -- upvalues: v13 (copy)
        local v48 = string.format("<font color=\"%s\">%s</font>", v13.bracket or v13.text, ")");
        if v47 then
            v47:addFormatted(v48, ")");
            return v48;
        else
            return v48;
        end;
    end, 
    ["{"] = function(v49) --[[ Line: 144 ]]
        -- upvalues: v13 (copy)
        local v50 = string.format("<font color=\"%s\">%s</font>", v13.bracket or v13.text, "{");
        if v49 then
            v49:addFormatted(v50, "{");
            return v50;
        else
            return v50;
        end;
    end, 
    ["}"] = function(v51) --[[ Line: 145 ]]
        -- upvalues: v13 (copy)
        local v52 = string.format("<font color=\"%s\">%s</font>", v13.bracket or v13.text, "}");
        if v51 then
            v51:addFormatted(v52, "}");
            return v52;
        else
            return v52;
        end;
    end, 
    ["["] = function(v53) --[[ Line: 146 ]]
        -- upvalues: v13 (copy)
        local v54 = string.format("<font color=\"%s\">%s</font>", v13.bracket or v13.text, "[");
        if v53 then
            v53:addFormatted(v54, "[");
            return v54;
        else
            return v54;
        end;
    end, 
    ["]"] = function(v55) --[[ Line: 147 ]]
        -- upvalues: v13 (copy)
        local v56 = string.format("<font color=\"%s\">%s</font>", v13.bracket or v13.text, "]");
        if v55 then
            v55:addFormatted(v56, "]");
            return v56;
        else
            return v56;
        end;
    end
};
local function _(v58) --[[ Line: 150 ]] --[[ Name: CleanupString ]]
    -- upvalues: v6 (copy), v8 (copy)
    local v59 = string.gsub(v58, "[%c%z]", v6);
    return (string.gsub(v59, "[%&%<%>%\"%']", v8));
end;
local function v72(v61, v62) --[[ Line: 156 ]] --[[ Name: GetHierarchy ]]
    -- upvalues: v6 (copy), v8 (copy), v7 (copy), v13 (copy), v57 (copy)
    local v63 = {};
    local v64 = {};
    local v65 = true;
    while v65 do
        local l_Parent_1 = v61.Parent;
        v65 = l_Parent_1 and l_Parent_1.Parent and l_Parent_1 ~= game;
        local l_Name_0 = v61.Name;
        local v68 = string.gsub(l_Name_0, "[%c%z]", v6);
        local v69 = string.gsub(v68, "[%&%<%>%\"%']", v8);
        if v7[v69] or not string.match(v69, "^[_%a][_%w]*$") then
            l_Name_0 = ("&quot;%*&quot;"):format(v69);
            v68 = string.format("<font color=\"%s\">%s</font>", v13.string or v13.text, l_Name_0);
            table.insert(v63, 1, (("%*%*%*"):format(v57["["](nil), v68, (v57["]"](nil)))));
            table.insert(v64, 1, (("[\"%*\"]"):format(v69)));
        else
            table.insert(v63, 1, (("%*%*"):format(v65 and v57["."](nil) or "", (string.format("<font color=\"%s\">%s</font>", v13.text or v13.text, v69)))));
            table.insert(v64, 1, (("%*%*"):format(v65 and "." or "", v69)));
        end;
        v61 = l_Parent_1;
    end;
    local v70 = table.concat(v63);
    local v71 = table.concat(v64);
    if v62 then
        v62:addFormatted(v70, v71);
    end;
    return v70;
end;
local function v77(v73) --[[ Line: 192 ]] --[[ Name: ReadBuffer ]]
    local v74 = buffer.len(v73);
    local v75 = table.create(v74);
    for v76 = 0, v74 - 1 do
        table.insert(v75, (buffer.readu8(v73, v76)));
    end;
    return table.concat(v75, " ");
end;
local function v88(v78, v79, v80) --[[ Line: 202 ]] --[[ Name: SerializeType ]]
    -- upvalues: v6 (copy), v8 (copy), v13 (copy), v72 (copy), v77 (copy), v57 (copy)
    local v81 = nil;
    local v82 = nil;
    if v79 == "string" then
        local v83 = string.gsub(v78, "[%c%z]", v6);
        local v84 = string.gsub(v83, "[%&%<%>%\"%']", v8);
        v82 = ("\"%*\""):format(v84);
        v83 = ("&quot;%*&quot;"):format(v84);
        v81 = string.format("<font color=\"%s\">%s</font>", v13.string or v13.text, v83);
    elseif v79 == "Instance" then
        return (v72(v78, v80));
    elseif v79 == "buffer" then
        local v85 = v77(v78);
        v82 = ("buffer.new($%*)"):format(v85);
        v81 = ("%*%*%*%*%*%*"):format(string.format("<font color=\"%s\">%s</font>", v13.builtin or v13.text, "buffer"), v57["."](nil), string.format("<font color=\"%s\">%s</font>", v13.builtin or v13.text, "new"), v57["("](nil), string.format("<font color=\"%s\">%s</font>", v13.number or v13.text, v85), (v57[")"](nil)));
    elseif type(v78) ~= v79 then
        local v86 = tostring(v78);
        v82 = ("%*.new(%*)"):format(v79, v86);
        v81 = ("%*%*%*%*%*%*"):format(string.format("<font color=\"%s\">%s</font>", v13.builtin or v13.text, v79), v57["."](nil), string.format("<font color=\"%s\">%s</font>", v13.builtin or v13.text, "new"), v57["("](nil), string.format("<font color=\"%s\">%s</font>", v13.number or v13.text, v86), (v57[")"](nil)));
    else
        local v87 = tostring(v78);
        v82 = v87;
        v81 = string.format("<font color=\"%s\">%s</font>", v13[v79] or v13.text, v87);
    end;
    if v80 then
        v80:addFormatted(v81, v82);
    end;
    return v81;
end;
local function v89(v90, v91, v92, v93, v94) --[[ Line: 232 ]] --[[ Name: TableToSyntaxString ]]
    -- upvalues: v18 (copy), v13 (copy), v57 (copy), v6 (copy), v8 (copy), v7 (copy), v89 (copy), v88 (copy), v4 (copy)
    v94 = v94 or v18.new();
    v92 = v92 or {};
    if v92[v90] then
        local l_v94_0 = v94;
        local v96 = string.format("<font color=\"%s\">%s</font>", v13.string or v13.text, "&quot;[Cyclic reference]&quot;");
        if l_v94_0 then
            l_v94_0:addFormatted(v96, "&quot;[Cyclic reference]&quot;");
        end;
        return v94:toString();
    else
        v92[v90] = true;
        local v97 = not v91;
        local v98 = (v93 or 0) + 1;
        local v99 = string.rep("    ", v98 - 1);
        local v100 = string.rep("    ", v98 - 2);
        local v101 = next(v90) == nil;
        local v102 = true;
        if v98 ~= 1 and not v101 then
            v57["{"](v94);
            v94:addRaw("\n");
        end;
        local v103 = 1;
        for v104, v105 in v90 do
            if not v94:isTrimmed() then
                if v103 ~= v104 then
                    v102 = false;
                end;
                local v106 = typeof(v104);
                local v107 = typeof(v105);
                if v103 > 1 then
                    v94:addRaw("\n");
                end;
                v94:addRaw(v99);
                if not v102 then
                    if v106 == "string" then
                        local v108 = string.gsub(v104, "[%c%z]", v6);
                        v104 = string.gsub(v108, "[%&%<%>%\"%']", v8);
                        if v7[v104] or not string.match(v104, "^[_%a][_%w]*$") then
                            v57["["](v94);
                            local v109 = ("&quot;%*&quot;"):format(v104);
                            v108 = v94;
                            local v110 = string.format("<font color=\"%s\">%s</font>", v13.string or v13.text, v109);
                            if v108 then
                                v108:addFormatted(v110, v109);
                            end;
                            v57["]"](v94);
                        else
                            v94:addRaw(v104);
                        end;
                    else
                        v57["["](v94);
                        if v106 == "table" then
                            v89(v104, v91, v92, 1, v94);
                        else
                            v88(v104, v106, v94);
                        end;
                        v57["]"](v94);
                    end;
                    if v106 ~= "table" and v97 then
                        local v111 = v4.GetDataByteSize(v104);
                        local v112 = (": %* "):format(if v111 < 1000 then ("%* bytes"):format(v111) else string.format("%.3f kilobytes", v111 / 1000));
                        v111 = v94;
                        local v113 = string.format("<font color=\"%s\">%s</font>", v13.bytesize or v13.text, v112);
                        if v111 then
                            v111:addFormatted(v113, v112);
                        end;
                    end;
                    v94:addRaw(" ");
                    v57["="](v94);
                    v94:addRaw(" ");
                end;
                if v107 == "table" then
                    v89(v105, v91, v92, v98, v94);
                else
                    v88(v105, v107, v94);
                end;
                if v107 ~= "table" and v97 then
                    local v114 = v4.GetDataByteSize(v105);
                    v114 = (": %*"):format(if v114 < 1000 then ("%* bytes"):format(v114) else string.format("%.3f kilobytes", v114 / 1000));
                    local l_v94_1 = v94;
                    local v116 = string.format("<font color=\"%s\">%s</font>", v13.bytesize or v13.text, v114);
                    if l_v94_1 then
                        l_v94_1:addFormatted(v116, v114);
                    end;
                end;
                v57[","](v94);
                v103 = v103 + 1;
            else
                break;
            end;
        end;
        if v98 == 1 then
            return v94:toString();
        else
            if v101 then
                v57["{"](v94);
                v57["}"](v94);
            else
                v94:addRaw("\n");
                v94:addRaw(v100);
                v57["}"](v94);
            end;
            return v94:toString();
        end;
    end;
end;
return v89;