local v0 = {};
local v1 = require(script.Parent.Parent.Utility);
local v2 = require(script.Default);
v0.getThemeValue = function(v3, v4, v5, _) --[[ Line: 16 ]] --[[ Name: getThemeValue ]]
    if v3 then
        for _, v8 in pairs(v3) do
            local v9, v10, v11 = unpack(v8);
            if v4 == v9 and v5 == v10 then
                return v11;
            end;
        end;
    end;
    return nil;
end;
v0.getInstanceValue = function(v12, v13) --[[ Line: 28 ]] --[[ Name: getInstanceValue ]]
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 29 ]]
        -- upvalues: v12 (copy), v13 (copy)
        return v12[v13];
    end);
    if not l_status_0 then
        l_result_0 = v12:GetAttribute(v13);
    end;
    return l_result_0;
end;
v0.getRealInstance = function(v16) --[[ Line: 38 ]] --[[ Name: getRealInstance ]]
    if not v16:GetAttribute("IsAClippedClone") then
        return;
    else
        local l_OriginalInstance_0 = v16:FindFirstChild("OriginalInstance");
        if not l_OriginalInstance_0 then
            return;
        else
            return l_OriginalInstance_0.Value;
        end;
    end;
end;
v0.getClippedClone = function(v18) --[[ Line: 49 ]] --[[ Name: getClippedClone ]]
    if not v18:GetAttribute("HasAClippedClone") then
        return;
    else
        local l_ClippedClone_0 = v18:FindFirstChild("ClippedClone");
        if not l_ClippedClone_0 then
            return;
        else
            return l_ClippedClone_0.Value;
        end;
    end;
end;
v0.refresh = function(v20, v21, v22) --[[ Line: 60 ]] --[[ Name: refresh ]]
    -- upvalues: v0 (copy)
    if v22 then
        local v23 = v20:getStateGroup();
        local v24 = v0.getThemeValue(v23, v21.Name, v22) or v0.getInstanceValue(v21, v22);
        v0.apply(v20, v21, v22, v24, true);
        return;
    else
        local v25 = v20:getStateGroup();
        if not v25 then
            return;
        else
            local v26 = {
                [v21.Name] = v21
            };
            for _, v28 in pairs(v21:GetDescendants()) do
                local l_v28_Attribute_0 = v28:GetAttribute("Collective");
                if l_v28_Attribute_0 then
                    v26[l_v28_Attribute_0] = v28;
                end;
                v26[v28.Name] = v28;
            end;
            for _, v31 in pairs(v25) do
                local v32, v33, v34 = unpack(v31);
                local v35 = v26[v32];
                if v35 then
                    v0.apply(v20, v35.Name, v33, v34, true);
                end;
            end;
            return;
        end;
    end;
end;
v0.apply = function(v36, v37, v38, v39, v40) --[[ Line: 93 ]] --[[ Name: apply ]]
    -- upvalues: v0 (copy)
    if v36.isDestroyed then
        return;
    else
        local v41 = nil;
        local l_v37_0 = v37;
        if typeof(v37) == "Instance" then
            v41 = {
                v37
            };
            l_v37_0 = v37.Name;
        else
            v41 = v36:getInstanceOrCollective(v37);
        end;
        local v43 = l_v37_0 .. "-" .. v38;
        local v44 = v36.customBehaviours[v43];
        for _, v46 in pairs(v41) do
            local v47 = v0.getClippedClone(v46);
            if v47 then
                table.insert(v41, v47);
            end;
        end;
        for _, v49 in pairs(v41) do
            if (v38 ~= "Position" or not v0.getClippedClone(v49)) and (v38 ~= "Size" or not v0.getRealInstance(v49)) then
                local v50 = v0.getInstanceValue(v49, v38);
                if v40 or v39 ~= v50 then
                    if v44 then
                        local v51 = v44(v39, v49, v38);
                        if v51 ~= nil then
                            v39 = v51;
                        end;
                    end;
                    if not pcall(function() --[[ Line: 139 ]]
                        -- upvalues: v49 (copy), v38 (copy), v39 (ref)
                        v49[v38] = v39;
                    end) then
                        v49:SetAttribute(v38, v39);
                    end;
                end;
            end;
        end;
        return;
    end;
end;
v0.getModifications = function(v52) --[[ Line: 153 ]] --[[ Name: getModifications ]]
    if typeof(v52[1]) ~= "table" then
        v52 = {
            v52
        };
    end;
    return v52;
end;
v0.merge = function(v53, v54, v55) --[[ Line: 162 ]] --[[ Name: merge ]]
    -- upvalues: v0 (copy)
    local v56, v57, v58, v59 = table.unpack(v54);
    local v60, v61, _, v63 = table.unpack(v53);
    if v56 == v60 and v57 == v61 and v0.statesMatch(v59, v63) then
        v53[3] = v58;
        if v55 then
            v55(v53);
        end;
        return true;
    else
        return false;
    end;
end;
v0.modify = function(v64, v65, v66) --[[ Line: 175 ]] --[[ Name: modify ]]
    -- upvalues: v1 (copy), v0 (copy)
    task.spawn(function() --[[ Line: 183 ]]
        -- upvalues: v66 (ref), v1 (ref), v65 (ref), v0 (ref), v64 (copy)
        v66 = v66 or v1.generateUID();
        v65 = v0.getModifications(v65);
        for _, v68 in pairs(v65) do
            local v69, v70, v71, v72 = table.unpack(v68);
            if v72 == nil then
                v0.modify(v64, {
                    v69, 
                    v70, 
                    v71, 
                    "Selected"
                }, v66);
                v0.modify(v64, {
                    v69, 
                    v70, 
                    v71, 
                    "Viewing"
                }, v66);
            end;
            local v73 = v1.formatStateName(v72 or "Deselected");
            local v74 = v64:getStateGroup(v73);
            local function _() --[[ Line: 195 ]] --[[ Name: nowSetIt ]]
                -- upvalues: v73 (copy), v64 (ref), v0 (ref), v69 (copy), v70 (copy), v71 (copy)
                if v73 == v64.activeState then
                    v0.apply(v64, v69, v70, v71);
                end;
            end;
            (function() --[[ Line: 200 ]] --[[ Name: updateRecord ]]
                -- upvalues: v74 (copy), v0 (ref), v68 (copy), v66 (ref), v73 (copy), v64 (ref), v69 (copy), v70 (copy), v71 (copy)
                for _, v77 in pairs(v74) do
                    if v0.merge(v77, v68, function(v78) --[[ Line: 202 ]]
                        -- upvalues: v66 (ref), v73 (ref), v64 (ref), v0 (ref), v69 (ref), v70 (ref), v71 (ref)
                        v78[5] = v66;
                        if v73 == v64.activeState then
                            v0.apply(v64, v69, v70, v71);
                        end;
                    end) then
                        return;
                    end;
                end;
                table.insert(v74, {
                    v69, 
                    v70, 
                    v71, 
                    v73, 
                    v66
                });
                if v73 == v64.activeState then
                    v0.apply(v64, v69, v70, v71);
                end;
            end)();
        end;
    end);
    return v66;
end;
v0.remove = function(v79, v80) --[[ Line: 220 ]] --[[ Name: remove ]]
    -- upvalues: v0 (copy)
    for _, v82 in pairs(v79.appearance) do
        for v83 = #v82, 1, -1 do
            if v82[v83][5] == v80 then
                table.remove(v82, v83);
            end;
        end;
    end;
    v0.rebuild(v79);
end;
v0.removeWith = function(v84, v85, v86, v87) --[[ Line: 233 ]] --[[ Name: removeWith ]]
    -- upvalues: v0 (copy)
    for v88, v89 in pairs(v84.appearance) do
        if v87 == v88 or not v87 then
            for v90 = #v89, 1, -1 do
                local v91 = v89[v90];
                local v92 = v91[1];
                local v93 = v91[2];
                if v92 == v85 and v93 == v86 then
                    table.remove(v89, v90);
                end;
            end;
        end;
    end;
    v0.rebuild(v84);
end;
v0.change = function(v94) --[[ Line: 249 ]] --[[ Name: change ]]
    -- upvalues: v0 (copy)
    local v95 = v94:getStateGroup();
    for _, v97 in pairs(v95) do
        local v98, v99, v100 = unpack(v97);
        v0.apply(v94, v98, v99, v100);
    end;
end;
v0.set = function(v101, v102) --[[ Line: 259 ]] --[[ Name: set ]]
    -- upvalues: v0 (copy)
    local l_themesJanitor_0 = v101.themesJanitor;
    l_themesJanitor_0:clean();
    l_themesJanitor_0:add(v101.stateChanged:Connect(function() --[[ Line: 265 ]]
        -- upvalues: v0 (ref), v101 (copy)
        v0.change(v101);
    end));
    if typeof(v102) == "Instance" and v102:IsA("ModuleScript") then
        v102 = require(v102);
    end;
    v101.appliedTheme = v102;
    v0.rebuild(v101);
end;
v0.statesMatch = function(v104, v105) --[[ Line: 275 ]] --[[ Name: statesMatch ]]
    local v106 = v104 and string.lower(v104);
    local v107 = v105 and string.lower(v105);
    local v108 = true;
    if v106 ~= v107 then
        v108 = not v104 or not v105;
    end;
    return v108;
end;
v0.rebuild = function(v109) --[[ Line: 282 ]] --[[ Name: rebuild ]]
    -- upvalues: v0 (copy), v1 (copy), v2 (copy)
    local l_appliedTheme_0 = v109.appliedTheme;
    local v111 = {
        "Deselected", 
        "Selected", 
        "Viewing"
    };
    (function() --[[ Line: 289 ]] --[[ Name: generateTheme ]]
        -- upvalues: v111 (copy), v0 (ref), v1 (ref), v2 (ref), l_appliedTheme_0 (copy), v109 (copy)
        for _, v113 in pairs(v111) do
            local v114 = {};
            local function v123(v115, v116) --[[ Line: 295 ]] --[[ Name: updateDetails ]]
                -- upvalues: v0 (ref), v1 (ref), v114 (copy)
                if not v115 then
                    return;
                else
                    for _, v118 in pairs(v115) do
                        local v119 = v118[5];
                        local v120 = v118[4];
                        if v0.statesMatch(v116, v120) then
                            local v121 = v118[1] .. "-" .. v118[2];
                            local v122 = v1.copyTable(v118);
                            v122[5] = v119;
                            v114[v121] = v122;
                        end;
                    end;
                    return;
                end;
            end;
            if v113 == "Selected" then
                v123(v2, "Deselected");
            end;
            v123(v2, "Empty");
            v123(v2, v113);
            if l_appliedTheme_0 ~= v2 then
                if v113 == "Selected" then
                    v123(l_appliedTheme_0, "Deselected");
                end;
                v123(v2, "Empty");
                v123(l_appliedTheme_0, v113);
            end;
            local v124 = {};
            local v125 = v109.appearance[v113];
            if v125 then
                for _, v127 in pairs(v125) do
                    local v128 = v127[5];
                    if v128 ~= nil then
                        table.insert(v124, {
                            v127[1], 
                            v127[2], 
                            v127[3], 
                            v113, 
                            v128
                        });
                    end;
                end;
            end;
            v123(v124, v113);
            local v129 = {};
            for _, v131 in pairs(v114) do
                table.insert(v129, v131);
            end;
            v109.appearance[v113] = v129;
        end;
        v0.change(v109);
    end)();
end;
return v0;