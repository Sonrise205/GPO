local _ = require(script.Parent.Types);
return function(v1) --[[ Line: 3 ]]
    local function _(v2) --[[ Line: 5 ]] --[[ Name: wrapper ]]
        -- upvalues: v1 (copy)
        return function(v3, v4) --[[ Line: 6 ]]
            -- upvalues: v1 (ref), v2 (copy)
            return v1.Internal._Insert(v2, v3, v4);
        end;
    end;
    local v6 = "Window";
    local l_v6_0 = v6 --[[ copy: 3 -> 4 ]];
    v1.Window = function(v8, v9) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_0 (copy)
        return v1.Internal._Insert(l_v6_0, v8, v9);
    end;
    v1.SetFocusedWindow = v1.Internal.SetFocusedWindow;
    v6 = "Tooltip";
    local l_v6_1 = v6 --[[ copy: 3 -> 5 ]];
    v1.Tooltip = function(v11, v12) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_1 (copy)
        return v1.Internal._Insert(l_v6_1, v11, v12);
    end;
    v6 = "MenuBar";
    local l_v6_2 = v6 --[[ copy: 3 -> 6 ]];
    v1.MenuBar = function(v14, v15) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_2 (copy)
        return v1.Internal._Insert(l_v6_2, v14, v15);
    end;
    v6 = "Menu";
    local l_v6_3 = v6 --[[ copy: 3 -> 7 ]];
    v1.Menu = function(v17, v18) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_3 (copy)
        return v1.Internal._Insert(l_v6_3, v17, v18);
    end;
    v6 = "MenuItem";
    local l_v6_4 = v6 --[[ copy: 3 -> 8 ]];
    v1.MenuItem = function(v20, v21) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_4 (copy)
        return v1.Internal._Insert(l_v6_4, v20, v21);
    end;
    v6 = "MenuToggle";
    local l_v6_5 = v6 --[[ copy: 3 -> 9 ]];
    v1.MenuToggle = function(v23, v24) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_5 (copy)
        return v1.Internal._Insert(l_v6_5, v23, v24);
    end;
    v6 = "Separator";
    local l_v6_6 = v6 --[[ copy: 3 -> 10 ]];
    v1.Separator = function(v26, v27) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_6 (copy)
        return v1.Internal._Insert(l_v6_6, v26, v27);
    end;
    v6 = "Indent";
    local l_v6_7 = v6 --[[ copy: 3 -> 11 ]];
    v1.Indent = function(v29, v30) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_7 (copy)
        return v1.Internal._Insert(l_v6_7, v29, v30);
    end;
    v6 = "SameLine";
    local l_v6_8 = v6 --[[ copy: 3 -> 12 ]];
    v1.SameLine = function(v32, v33) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_8 (copy)
        return v1.Internal._Insert(l_v6_8, v32, v33);
    end;
    v6 = "Group";
    local l_v6_9 = v6 --[[ copy: 3 -> 13 ]];
    v1.Group = function(v35, v36) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_9 (copy)
        return v1.Internal._Insert(l_v6_9, v35, v36);
    end;
    v6 = "Text";
    local l_v6_10 = v6 --[[ copy: 3 -> 14 ]];
    v1.Text = function(v38, v39) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_10 (copy)
        return v1.Internal._Insert(l_v6_10, v38, v39);
    end;
    v1.TextWrapped = function(v40) --[[ Line: 41 ]]
        -- upvalues: v1 (copy)
        v40[2] = true;
        return v1.Internal._Insert("Text", v40);
    end;
    v1.TextColored = function(v41) --[[ Line: 46 ]]
        -- upvalues: v1 (copy)
        v41[3] = v41[2];
        v41[2] = nil;
        return v1.Internal._Insert("Text", v41);
    end;
    v6 = "SeparatorText";
    local l_v6_11 = v6 --[[ copy: 3 -> 15 ]];
    v1.SeparatorText = function(v43, v44) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_11 (copy)
        return v1.Internal._Insert(l_v6_11, v43, v44);
    end;
    v6 = "InputText";
    local l_v6_12 = v6 --[[ copy: 3 -> 16 ]];
    v1.InputText = function(v46, v47) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_12 (copy)
        return v1.Internal._Insert(l_v6_12, v46, v47);
    end;
    v6 = "Button";
    local l_v6_13 = v6 --[[ copy: 3 -> 17 ]];
    v1.Button = function(v49, v50) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_13 (copy)
        return v1.Internal._Insert(l_v6_13, v49, v50);
    end;
    v6 = "SmallButton";
    local l_v6_14 = v6 --[[ copy: 3 -> 18 ]];
    v1.SmallButton = function(v52, v53) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_14 (copy)
        return v1.Internal._Insert(l_v6_14, v52, v53);
    end;
    v6 = "Checkbox";
    local l_v6_15 = v6 --[[ copy: 3 -> 19 ]];
    v1.Checkbox = function(v55, v56) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_15 (copy)
        return v1.Internal._Insert(l_v6_15, v55, v56);
    end;
    v6 = "RadioButton";
    local l_v6_16 = v6 --[[ copy: 3 -> 20 ]];
    v1.RadioButton = function(v58, v59) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_16 (copy)
        return v1.Internal._Insert(l_v6_16, v58, v59);
    end;
    v6 = "Tree";
    local l_v6_17 = v6 --[[ copy: 3 -> 21 ]];
    v1.Tree = function(v61, v62) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_17 (copy)
        return v1.Internal._Insert(l_v6_17, v61, v62);
    end;
    v6 = "CollapsingHeader";
    local l_v6_18 = v6 --[[ copy: 3 -> 22 ]];
    v1.CollapsingHeader = function(v64, v65) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_18 (copy)
        return v1.Internal._Insert(l_v6_18, v64, v65);
    end;
    v6 = "InputNum";
    local l_v6_19 = v6 --[[ copy: 3 -> 23 ]];
    v1.InputNum = function(v67, v68) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_19 (copy)
        return v1.Internal._Insert(l_v6_19, v67, v68);
    end;
    v6 = "InputVector2";
    local l_v6_20 = v6 --[[ copy: 3 -> 24 ]];
    v1.InputVector2 = function(v70, v71) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_20 (copy)
        return v1.Internal._Insert(l_v6_20, v70, v71);
    end;
    v6 = "InputVector3";
    local l_v6_21 = v6 --[[ copy: 3 -> 25 ]];
    v1.InputVector3 = function(v73, v74) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_21 (copy)
        return v1.Internal._Insert(l_v6_21, v73, v74);
    end;
    v6 = "InputUDim";
    local l_v6_22 = v6 --[[ copy: 3 -> 26 ]];
    v1.InputUDim = function(v76, v77) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_22 (copy)
        return v1.Internal._Insert(l_v6_22, v76, v77);
    end;
    v6 = "InputUDim2";
    local l_v6_23 = v6 --[[ copy: 3 -> 27 ]];
    v1.InputUDim2 = function(v79, v80) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_23 (copy)
        return v1.Internal._Insert(l_v6_23, v79, v80);
    end;
    v6 = "InputRect";
    local l_v6_24 = v6 --[[ copy: 3 -> 28 ]];
    v1.InputRect = function(v82, v83) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_24 (copy)
        return v1.Internal._Insert(l_v6_24, v82, v83);
    end;
    v6 = "DragNum";
    local l_v6_25 = v6 --[[ copy: 3 -> 29 ]];
    v1.DragNum = function(v85, v86) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_25 (copy)
        return v1.Internal._Insert(l_v6_25, v85, v86);
    end;
    v6 = "DragVector2";
    local l_v6_26 = v6 --[[ copy: 3 -> 30 ]];
    v1.DragVector2 = function(v88, v89) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_26 (copy)
        return v1.Internal._Insert(l_v6_26, v88, v89);
    end;
    v6 = "DragVector3";
    local l_v6_27 = v6 --[[ copy: 3 -> 31 ]];
    v1.DragVector3 = function(v91, v92) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_27 (copy)
        return v1.Internal._Insert(l_v6_27, v91, v92);
    end;
    v6 = "DragUDim";
    local l_v6_28 = v6 --[[ copy: 3 -> 32 ]];
    v1.DragUDim = function(v94, v95) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_28 (copy)
        return v1.Internal._Insert(l_v6_28, v94, v95);
    end;
    v6 = "DragUDim2";
    local l_v6_29 = v6 --[[ copy: 3 -> 33 ]];
    v1.DragUDim2 = function(v97, v98) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_29 (copy)
        return v1.Internal._Insert(l_v6_29, v97, v98);
    end;
    v6 = "DragRect";
    local l_v6_30 = v6 --[[ copy: 3 -> 34 ]];
    v1.DragRect = function(v100, v101) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_30 (copy)
        return v1.Internal._Insert(l_v6_30, v100, v101);
    end;
    v6 = "InputColor3";
    local l_v6_31 = v6 --[[ copy: 3 -> 35 ]];
    v1.InputColor3 = function(v103, v104) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_31 (copy)
        return v1.Internal._Insert(l_v6_31, v103, v104);
    end;
    v6 = "InputColor4";
    local l_v6_32 = v6 --[[ copy: 3 -> 36 ]];
    v1.InputColor4 = function(v106, v107) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_32 (copy)
        return v1.Internal._Insert(l_v6_32, v106, v107);
    end;
    v6 = "SliderNum";
    local l_v6_33 = v6 --[[ copy: 3 -> 37 ]];
    v1.SliderNum = function(v109, v110) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_33 (copy)
        return v1.Internal._Insert(l_v6_33, v109, v110);
    end;
    v6 = "SliderVector2";
    local l_v6_34 = v6 --[[ copy: 3 -> 38 ]];
    v1.SliderVector2 = function(v112, v113) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_34 (copy)
        return v1.Internal._Insert(l_v6_34, v112, v113);
    end;
    v6 = "SliderVector3";
    local l_v6_35 = v6 --[[ copy: 3 -> 39 ]];
    v1.SliderVector3 = function(v115, v116) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_35 (copy)
        return v1.Internal._Insert(l_v6_35, v115, v116);
    end;
    v6 = "SliderUDim";
    local l_v6_36 = v6 --[[ copy: 3 -> 40 ]];
    v1.SliderUDim = function(v118, v119) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_36 (copy)
        return v1.Internal._Insert(l_v6_36, v118, v119);
    end;
    v6 = "SliderUDim2";
    local l_v6_37 = v6 --[[ copy: 3 -> 41 ]];
    v1.SliderUDim2 = function(v121, v122) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_37 (copy)
        return v1.Internal._Insert(l_v6_37, v121, v122);
    end;
    v6 = "SliderRect";
    local l_v6_38 = v6 --[[ copy: 3 -> 42 ]];
    v1.SliderRect = function(v124, v125) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_38 (copy)
        return v1.Internal._Insert(l_v6_38, v124, v125);
    end;
    v6 = "Selectable";
    local l_v6_39 = v6 --[[ copy: 3 -> 43 ]];
    v1.Selectable = function(v127, v128) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_39 (copy)
        return v1.Internal._Insert(l_v6_39, v127, v128);
    end;
    v6 = "Combo";
    local l_v6_40 = v6 --[[ copy: 3 -> 44 ]];
    v1.Combo = function(v130, v131) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), l_v6_40 (copy)
        return v1.Internal._Insert(l_v6_40, v130, v131);
    end;
    v1.ComboArray = function(v132, v133, v134) --[[ Line: 112 ]]
        -- upvalues: v1 (copy)
        local v135 = nil;
        v135 = if v133 == nil then v1.State(v134[1]) else v133;
        local v136 = v1.Internal._Insert("Combo", v132, v135);
        local l_index_0 = v136.state.index;
        for _, v139 in v134 do
            v1.Internal._Insert("Selectable", {
                v139, 
                v139
            }, {
                index = l_index_0
            });
        end;
        v1.End();
        return v136;
    end;
    v1.ComboEnum = function(v140, v141, v142) --[[ Line: 129 ]]
        -- upvalues: v1 (copy)
        local v143 = nil;
        v143 = if v141 == nil then v1.State(v142[1]) else v141;
        local v144 = v1.Internal._Insert("Combo", v140, v143);
        local l_index_1 = v144.state.index;
        for _, v147 in v142:GetEnumItems() do
            v1.Internal._Insert("Selectable", {
                v147.Name, 
                v147
            }, {
                index = l_index_1
            });
        end;
        v1.End();
        return v144;
    end;
    v1.InputEnum = v1.ComboEnum;
    v6 = "Table";
    v1.Table = function(v148, v149) --[[ Line: 6 ]]
        -- upvalues: v1 (copy), v6 (copy)
        return v1.Internal._Insert(v6, v148, v149);
    end;
    v1.NextColumn = function() --[[ Line: 149 ]]
        -- upvalues: v1 (copy)
        local v150 = v1.Internal._GetParentWidget();
        v150.RowColumnIndex = v150.RowColumnIndex + 1;
    end;
    v1.SetColumnIndex = function(v151) --[[ Line: 153 ]]
        -- upvalues: v1 (copy)
        local v152 = v1.Internal._GetParentWidget();
        assert(v152.InitialNumColumns <= v151, "Iris.SetColumnIndex Argument must be in column range");
        v152.RowColumnIndex = math.floor(v152.RowColumnIndex / v152.InitialNumColumns) + (v151 - 1);
    end;
    v1.NextRow = function() --[[ Line: 159 ]]
        -- upvalues: v1 (copy)
        local v153 = v1.Internal._GetParentWidget();
        local l_InitialNumColumns_0 = v153.InitialNumColumns;
        v153.RowColumnIndex = math.floor((v153.RowColumnIndex + 1) / l_InitialNumColumns_0) * l_InitialNumColumns_0;
    end;
end;