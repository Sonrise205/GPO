local l_UserInputService_0 = game:GetService("UserInputService");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_Players_0 = game:GetService("Players");
local _ = require(script.Types);
local l_script_0 = script;
local v6 = require(l_script_0.Reference);
local v7 = v6.getObject();
local v8 = v7 and v7.Value;
if v8 and v8 ~= l_script_0 then
    return (require(v8));
else
    if not v7 then
        v6.addToReplicatedStorage();
    end;
    local v9 = require(l_script_0.Packages.GoodSignal);
    local v10 = require(l_script_0.Packages.Janitor);
    local v11 = require(l_script_0.Utility);
    local v12 = require(l_script_0.Features.Themes);
    local v13 = require(l_script_0.Features.Gamepad);
    local v14 = require(l_script_0.Features.Overflow);
    local v15 = {};
    v15.__index = v15;
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    local l_Themes_0 = l_script_0.Features.Themes;
    local v18 = {};
    local v19 = v9.new();
    local l_Elements_0 = l_script_0.Elements;
    local v21 = 0;
    local v22 = {
        mobile = Enum.PreferredInput.Touch, 
        desktop = Enum.PreferredInput.KeyboardAndMouse, 
        console = Enum.PreferredInput.Gamepad
    };
    v15.baseDisplayOrderChanged = v9.new();
    v15.baseDisplayOrder = 10;
    v15.baseTheme = require(l_Themes_0.Default);
    v15.isOldTopbar = false;
    v15.iconsDictionary = v18;
    v15.insetHeightChanged = v9.new();
    v15.container = require(l_Elements_0.Container)(v15);
    v15.topbarEnabled = true;
    v15.iconAdded = v9.new();
    v15.iconRemoved = v9.new();
    v15.iconChanged = v9.new();
    v15.getIcons = function() --[[ Line: 110 ]] --[[ Name: getIcons ]]
        -- upvalues: v15 (copy)
        return v15.iconsDictionary;
    end;
    v15.getIconByUID = function(v23) --[[ Line: 114 ]] --[[ Name: getIconByUID ]]
        -- upvalues: v15 (copy)
        local v24 = v15.iconsDictionary[v23];
        if v24 then
            return v24;
        else
            return nil;
        end;
    end;
    v15.getIcon = function(v25) --[[ Line: 122 ]] --[[ Name: getIcon ]]
        -- upvalues: v15 (copy), v18 (copy)
        local v26 = v15.getIconByUID(v25);
        if v26 then
            return v26;
        else
            for _, v28 in pairs(v18) do
                if v28.name == v25 then
                    return v28;
                end;
            end;
            return nil;
        end;
    end;
    v15.setTopbarEnabled = function(v29, v30) --[[ Line: 135 ]] --[[ Name: setTopbarEnabled ]]
        -- upvalues: v15 (copy)
        if typeof(v29) ~= "boolean" then
            v29 = v15.topbarEnabled;
        end;
        if not v30 then
            v15.topbarEnabled = v29;
        end;
        for _, v32 in pairs(v15.container) do
            v32.Enabled = v29;
        end;
    end;
    v15.modifyBaseTheme = function(v33) --[[ Line: 147 ]] --[[ Name: modifyBaseTheme ]]
        -- upvalues: v12 (copy), v15 (copy), v18 (copy)
        v33 = v12.getModifications(v33);
        for _, v35 in pairs(v33) do
            for _, v37 in pairs(v15.baseTheme) do
                v12.merge(v37, v35);
            end;
        end;
        for _, v39 in pairs(v18) do
            v39:setTheme(v15.baseTheme);
        end;
    end;
    v15.setDisplayOrder = function(v40) --[[ Line: 159 ]] --[[ Name: setDisplayOrder ]]
        -- upvalues: v15 (copy)
        v15.baseDisplayOrder = v40;
        v15.baseDisplayOrderChanged:Fire(v40);
    end;
    task.defer(v13.start, v15);
    task.defer(v14.start, v15);
    task.defer(function() --[[ Line: 169 ]]
        -- upvalues: l_LocalPlayer_0 (copy), v15 (copy), l_script_0 (copy)
        local l_PlayerGui_0 = l_LocalPlayer_0:WaitForChild("PlayerGui");
        for _, v43 in pairs(v15.container) do
            v43.Parent = l_PlayerGui_0;
        end;
        require(l_script_0.Attribute);
    end);
    v15.new = function() --[[ Line: 180 ]] --[[ Name: new ]]
        -- upvalues: v15 (copy), v10 (copy), v11 (copy), v18 (copy), v9 (copy), l_script_0 (copy), l_Elements_0 (copy), v21 (ref), l_UserInputService_0 (copy), v22 (copy), v19 (copy), l_StarterGui_0 (copy)
        local v44 = {};
        setmetatable(v44, v15);
        local v45 = v10.new();
        v44.janitor = v45;
        v44.themesJanitor = v45:add(v10.new());
        v44.singleClickJanitor = v45:add(v10.new());
        v44.captionJanitor = v45:add(v10.new());
        v44.joinJanitor = v45:add(v10.new());
        v44.menuJanitor = v45:add(v10.new());
        v44.dropdownJanitor = v45:add(v10.new());
        local v46 = v11.generateUID();
        v18[v46] = v44;
        v45:add(function() --[[ Line: 197 ]]
            -- upvalues: v18 (ref), v46 (copy)
            v18[v46] = nil;
        end);
        v44.selected = v45:add(v9.new());
        v44.deselected = v45:add(v9.new());
        v44.toggled = v45:add(v9.new());
        v44.viewingStarted = v45:add(v9.new());
        v44.viewingEnded = v45:add(v9.new());
        v44.stateChanged = v45:add(v9.new());
        v44.notified = v45:add(v9.new());
        v44.noticeStarted = v45:add(v9.new());
        v44.noticeChanged = v45:add(v9.new());
        v44.endNotices = v45:add(v9.new());
        v44.toggleKeyAdded = v45:add(v9.new());
        v44.fakeToggleKeyChanged = v45:add(v9.new());
        v44.alignmentChanged = v45:add(v9.new());
        v44.updateSize = v45:add(v9.new());
        v44.resizingComplete = v45:add(v9.new());
        v44.joinedParent = v45:add(v9.new());
        v44.menuSet = v45:add(v9.new());
        v44.dropdownSet = v45:add(v9.new());
        v44.updateMenu = v45:add(v9.new());
        v44.startMenuUpdate = v45:add(v9.new());
        v44.childThemeModified = v45:add(v9.new());
        v44.indicatorSet = v45:add(v9.new());
        v44.dropdownChildAdded = v45:add(v9.new());
        v44.menuChildAdded = v45:add(v9.new());
        v44.iconModule = l_script_0;
        v44.UID = v46;
        v44.isEnabled = true;
        v44.enabled = v44.isEnabled;
        v44.isSelected = false;
        v44.isViewing = false;
        v44.joinedFrame = false;
        v44.parentIconUID = false;
        v44.deselectWhenOtherIconSelected = true;
        v44.totalNotices = 0;
        v44.activeState = "Deselected";
        v44.alignment = "";
        v44.originalAlignment = "";
        v44.appliedTheme = {};
        v44.appearance = {};
        v44.cachedInstances = {};
        v44.cachedNamesToInstances = {};
        v44.cachedCollectives = {};
        v44.bindedToggleKeys = {};
        v44.customBehaviours = {};
        v44.toggleItems = {};
        v44.bindedEvents = {};
        v44.notices = {};
        v44.menuIcons = {};
        v44.dropdownIcons = {};
        v44.childIconsDict = {};
        v44.creationTime = os.clock();
        v44.widget = v45:add(require(l_Elements_0.Widget)(v44, v15));
        v44:setAlignment();
        v21 = v21 + 1;
        local v47 = v21 * 0.01 + 1;
        v44:setOrder(v47, "deselected");
        v44:setOrder(v47, "selected");
        v44:setTheme(v15.baseTheme);
        local v48 = v44:getInstance("ClickRegion");
        local v49 = false;
        local v50 = 0;
        local function _() --[[ Line: 277 ]] --[[ Name: handleToggle ]]
            -- upvalues: v44 (copy), v50 (ref)
            if v44.locked then
                return;
            else
                local v51 = tick();
                if v51 - v50 < 0.1 then
                    return;
                else
                    v50 = v51;
                    if v44.isSelected then
                        v44:deselect("User", v44);
                        return;
                    else
                        v44:select("User", v44);
                        return;
                    end;
                end;
            end;
        end;
        v48.MouseButton1Click:Connect(function() --[[ Line: 296 ]]
            -- upvalues: v49 (ref), v44 (copy), v50 (ref)
            v49 = true;
            if v44.locked then
                return;
            else
                local v53 = tick();
                if v53 - v50 < 0.1 then
                    return;
                else
                    v50 = v53;
                    if v44.isSelected then
                        v44:deselect("User", v44);
                        return;
                    else
                        v44:select("User", v44);
                        return;
                    end;
                end;
            end;
        end);
        v48.TouchTap:Connect(function() --[[ Line: 301 ]]
            -- upvalues: v49 (ref), v44 (copy), v50 (ref)
            if not v49 then
                if v44.locked then
                    return;
                else
                    local v54 = tick();
                    if v54 - v50 < 0.1 then
                        return;
                    else
                        v50 = v54;
                        if v44.isSelected then
                            v44:deselect("User", v44);
                            return;
                        else
                            v44:select("User", v44);
                        end;
                    end;
                end;
            end;
        end);
        v45:add(l_UserInputService_0.InputBegan:Connect(function(v55, v56) --[[ Line: 314 ]]
            -- upvalues: v44 (copy), v50 (ref)
            if v44.locked then
                return;
            else
                if v44.bindedToggleKeys[v55.KeyCode] and not v56 then
                    if v44.locked then
                        return;
                    else
                        local v57 = tick();
                        if v57 - v50 < 0.1 then
                            return;
                        else
                            v50 = v57;
                            if v44.isSelected then
                                v44:deselect("User", v44);
                                return;
                            else
                                v44:select("User", v44);
                            end;
                        end;
                    end;
                end;
                return;
            end;
        end));
        local function v59(v58) --[[ Line: 326 ]] --[[ Name: viewingStarted ]]
            -- upvalues: v44 (copy)
            if v44.locked then
                return;
            else
                v44.isViewing = true;
                v44.viewingStarted:Fire(true);
                if not v58 then
                    v44:setState("Viewing", "User", v44);
                end;
                return;
            end;
        end;
        local function v60() --[[ Line: 336 ]] --[[ Name: viewingEnded ]]
            -- upvalues: v44 (copy)
            if v44.locked then
                return;
            else
                v44.isViewing = false;
                v44.viewingEnded:Fire(true);
                v44:setState(nil, "User", v44);
                return;
            end;
        end;
        v44.joinedParent:Connect(function() --[[ Line: 344 ]]
            -- upvalues: v44 (copy)
            if v44.isViewing then
                if v44.locked then
                    return;
                else
                    v44.isViewing = false;
                    v44.viewingEnded:Fire(true);
                    v44:setState(nil, "User", v44);
                end;
            end;
        end);
        v48.MouseEnter:Connect(function() --[[ Line: 349 ]]
            -- upvalues: l_UserInputService_0 (ref), v22 (ref), v44 (copy)
            local v61 = l_UserInputService_0.PreferredInput ~= v22.desktop;
            if v44.locked then
                return;
            else
                v44.isViewing = true;
                v44.viewingStarted:Fire(true);
                if not v61 then
                    v44:setState("Viewing", "User", v44);
                end;
                return;
            end;
        end);
        local v62 = 0;
        v45:add(l_UserInputService_0.TouchEnded:Connect(v60));
        v48.MouseLeave:Connect(v60);
        v48.SelectionGained:Connect(v59);
        v48.SelectionLost:Connect(v60);
        v48.MouseButton1Down:Connect(function() --[[ Line: 358 ]]
            -- upvalues: v44 (copy), l_UserInputService_0 (ref), v22 (ref), v62 (ref)
            if not v44.locked and l_UserInputService_0.PreferredInput == v22.mobile then
                v62 = v62 + 1;
                local l_v62_0 = v62;
                task.delay(0.2, function() --[[ Line: 362 ]]
                    -- upvalues: l_v62_0 (copy), v62 (ref), v44 (ref)
                    if l_v62_0 == v62 then
                        if v44.locked then
                            return;
                        else
                            v44.isViewing = true;
                            v44.viewingStarted:Fire(true);
                            v44:setState("Viewing", "User", v44);
                        end;
                    end;
                end);
            end;
        end);
        v48.MouseButton1Up:Connect(function() --[[ Line: 369 ]]
            -- upvalues: v62 (ref)
            v62 = v62 + 1;
        end);
        local v64 = v44:getInstance("IconOverlay");
        v44.viewingStarted:Connect(function() --[[ Line: 375 ]]
            -- upvalues: v64 (copy), v44 (copy)
            v64.Visible = not v44.overlayDisabled;
        end);
        v44.viewingEnded:Connect(function() --[[ Line: 378 ]]
            -- upvalues: v64 (copy)
            v64.Visible = false;
        end);
        v45:add(v19:Connect(function(v65) --[[ Line: 383 ]]
            -- upvalues: v44 (copy)
            if v65 ~= v44 and v44.deselectWhenOtherIconSelected and v65.deselectWhenOtherIconSelected then
                v44:deselect("AutoDeselect", v65);
            end;
        end));
        local v66 = debug.info(2, "s");
        local v67 = string.split(v66, ".");
        local l_game_0 = game;
        local v69 = nil;
        for _, v71 in pairs(v67) do
            l_game_0 = l_game_0:FindFirstChild(v71);
            if l_game_0 then
                if l_game_0:IsA("ScreenGui") then
                    v69 = l_game_0;
                end;
            else
                break;
            end;
        end;
        if l_game_0 and v69 and v69.ResetOnSpawn == true then
            v44.originsScreenGui = v69;
            v11.localPlayerRespawned(function() --[[ Line: 409 ]]
                -- upvalues: v44 (copy)
                v44:destroy();
            end);
        end;
        v44.toggled:Connect(function(v72) --[[ Line: 415 ]]
            -- upvalues: v44 (copy), v15 (ref)
            v44.noticeChanged:Fire(v44.totalNotices);
            for v73, _ in pairs(v44.childIconsDict) do
                local v75 = v15.getIconByUID(v73);
                if v75 ~= nil then
                    v75.noticeChanged:Fire(v75.totalNotices);
                    if not v72 and v75.isSelected then
                        for _, _ in pairs(v75.childIconsDict) do
                            v75:deselect("HideParentFeature", v44);
                        end;
                    end;
                end;
            end;
        end);
        v44.selected:Connect(function() --[[ Line: 441 ]]
            -- upvalues: v44 (copy), l_StarterGui_0 (ref)
            if #v44.dropdownIcons > 0 then
                if l_StarterGui_0:GetCore("ChatActive") and v44.alignment ~= "Right" then
                    v44.chatWasPreviouslyActive = true;
                    l_StarterGui_0:SetCore("ChatActive", false);
                end;
                if l_StarterGui_0:GetCoreGuiEnabled("PlayerList") and v44.alignment ~= "Left" then
                    v44.playerlistWasPreviouslyActive = true;
                    l_StarterGui_0:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false);
                end;
            end;
        end);
        v44.deselected:Connect(function() --[[ Line: 454 ]]
            -- upvalues: v44 (copy), l_StarterGui_0 (ref)
            if v44.chatWasPreviouslyActive then
                v44.chatWasPreviouslyActive = nil;
                l_StarterGui_0:SetCore("ChatActive", true);
            end;
            if v44.playerlistWasPreviouslyActive then
                v44.playerlistWasPreviouslyActive = nil;
                l_StarterGui_0:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true);
            end;
        end);
        task.delay(0.1, function() --[[ Line: 468 ]]
            -- upvalues: v44 (copy)
            if v44.activeState == "Deselected" then
                v44.stateChanged:Fire("Deselected");
                v44:refresh();
            end;
        end);
        v15.iconAdded:Fire(v44);
        return v44;
    end;
    v15.setName = function(v78, v79) --[[ Line: 484 ]] --[[ Name: setName ]]
        v78.widget.Name = v79;
        v78.name = v79;
        return v78;
    end;
    v15.setState = function(v80, v81, v82, v83) --[[ Line: 490 ]] --[[ Name: setState ]]
        -- upvalues: v11 (copy), v19 (copy)
        if not v81 then
            v81 = v80.isSelected and "Selected" or "Deselected";
        end;
        local v84 = v11.formatStateName(v81);
        if v80.activeState == v84 then
            return;
        else
            local l_isSelected_0 = v80.isSelected;
            v80.activeState = v84;
            if v84 == "Deselected" then
                v80.isSelected = false;
                if l_isSelected_0 then
                    v80.toggled:Fire(false, v82, v83);
                    v80.deselected:Fire(v82, v83);
                end;
                v80:_setToggleItemsVisible(false, v82, v83);
            elseif v84 == "Selected" then
                v80.isSelected = true;
                if not l_isSelected_0 then
                    v80.toggled:Fire(true, v82, v83);
                    v80.selected:Fire(v82, v83);
                    v19:Fire(v80, v82, v83);
                end;
                v80:_setToggleItemsVisible(true, v82, v83);
            end;
            v80.stateChanged:Fire(v84, v82, v83);
            return;
        end;
    end;
    v15.getInstance = function(v86, v87) --[[ Line: 523 ]] --[[ Name: getInstance ]]
        -- upvalues: v12 (copy)
        local v88 = v86.cachedNamesToInstances[v87];
        if v88 then
            return v88;
        else
            local function v93(v89, v90) --[[ Line: 531 ]] --[[ Name: cacheInstance ]]
                -- upvalues: v86 (copy)
                if not v86.cachedInstances[v90] then
                    local l_v90_Attribute_0 = v90:GetAttribute("Collective");
                    local v92 = l_v90_Attribute_0 and v86.cachedCollectives[l_v90_Attribute_0];
                    if v92 then
                        table.insert(v92, v90);
                    end;
                    v86.cachedNamesToInstances[v89] = v90;
                    v86.cachedInstances[v90] = true;
                    v90.Destroying:Once(function() --[[ Line: 541 ]]
                        -- upvalues: v86 (ref), v89 (copy), v90 (copy)
                        v86.cachedNamesToInstances[v89] = nil;
                        v86.cachedInstances[v90] = nil;
                    end);
                end;
            end;
            local l_widget_0 = v86.widget;
            v93("Widget", l_widget_0);
            if v87 == "Widget" then
                return l_widget_0;
            else
                local v95 = nil;
                local function v96(v97) --[[ Line: 554 ]] --[[ Name: scanChildren ]]
                    -- upvalues: v86 (copy), v12 (ref), v96 (copy), v93 (copy), v87 (copy), v95 (ref)
                    for _, v99 in pairs(v97:GetChildren()) do
                        local l_v99_Attribute_0 = v99:GetAttribute("WidgetUID");
                        if not l_v99_Attribute_0 or l_v99_Attribute_0 == v86.UID then
                            local v101 = v12.getRealInstance(v99);
                            if v101 then
                                v99 = v101;
                            end;
                            v96(v99);
                            if v99:IsA("GuiBase") or v99:IsA("UIBase") or v99:IsA("ValueBase") then
                                local l_Name_0 = v99.Name;
                                v93(l_Name_0, v99);
                                if l_Name_0 == v87 then
                                    v95 = v99;
                                end;
                            end;
                        end;
                    end;
                end;
                v96(l_widget_0);
                return v95;
            end;
        end;
    end;
    v15.getCollective = function(v103, v104) --[[ Line: 583 ]] --[[ Name: getCollective ]]
        local v105 = v103.cachedCollectives[v104];
        if v105 then
            return v105;
        else
            v105 = {};
            for v106, _ in pairs(v103.cachedInstances) do
                if v106:GetAttribute("Collective") == v104 then
                    table.insert(v105, v106);
                end;
            end;
            v103.cachedCollectives[v104] = v105;
            return v105;
        end;
    end;
    v15.getInstanceOrCollective = function(v108, v109) --[[ Line: 604 ]] --[[ Name: getInstanceOrCollective ]]
        local v110 = {};
        local v111 = v108:getInstance(v109);
        if v111 then
            table.insert(v110, v111);
        end;
        if #v110 == 0 then
            v110 = v108:getCollective(v109);
        end;
        return v110;
    end;
    v15.getStateGroup = function(v112, v113) --[[ Line: 618 ]] --[[ Name: getStateGroup ]]
        local v114 = v113 or v112.activeState;
        local v115 = v112.appearance[v114];
        if not v115 then
            v115 = {};
            v112.appearance[v114] = v115;
        end;
        return v115;
    end;
    v15.refreshAppearance = function(v116, v117, v118) --[[ Line: 628 ]] --[[ Name: refreshAppearance ]]
        -- upvalues: v12 (copy)
        v12.refresh(v116, v117, v118);
        return v116;
    end;
    v15.refresh = function(v119) --[[ Line: 633 ]] --[[ Name: refresh ]]
        v119:refreshAppearance(v119.widget);
        v119.updateSize:Fire();
        return v119;
    end;
    v15.updateParent = function(v120) --[[ Line: 639 ]] --[[ Name: updateParent ]]
        -- upvalues: v15 (copy)
        local v121 = v15.getIconByUID(v120.parentIconUID);
        if v121 then
            v121.updateSize:Fire();
        end;
    end;
    v15.setBehaviour = function(v122, v123, v124, v125, v126) --[[ Line: 646 ]] --[[ Name: setBehaviour ]]
        local v127 = v123 .. "-" .. v124;
        v122.customBehaviours[v127] = v125;
        if v126 then
            local v128 = v122:getInstanceOrCollective(v123);
            for _, v130 in pairs(v128) do
                v122:refreshAppearance(v130, v124);
            end;
        end;
    end;
    v15.modifyTheme = function(v131, v132, v133) --[[ Line: 659 ]] --[[ Name: modifyTheme ]]
        -- upvalues: v12 (copy)
        return v131, (v12.modify(v131, v132, v133));
    end;
    v15.modifyChildTheme = function(v134, v135, v136) --[[ Line: 664 ]] --[[ Name: modifyChildTheme ]]
        -- upvalues: v15 (copy)
        v134.childModifications = v135;
        v134.childModificationsUID = v136;
        for v137, _ in pairs(v134.childIconsDict) do
            v15.getIconByUID(v137):modifyTheme(v135, v136);
        end;
        v134.childThemeModified:Fire();
        return v134;
    end;
    v15.removeModification = function(v139, v140) --[[ Line: 677 ]] --[[ Name: removeModification ]]
        -- upvalues: v12 (copy)
        v12.remove(v139, v140);
        return v139;
    end;
    v15.removeModificationWith = function(v141, v142, v143, v144) --[[ Line: 682 ]] --[[ Name: removeModificationWith ]]
        -- upvalues: v12 (copy)
        v12.removeWith(v141, v142, v143, v144);
        return v141;
    end;
    v15.setTheme = function(v145, v146) --[[ Line: 687 ]] --[[ Name: setTheme ]]
        -- upvalues: v12 (copy)
        v12.set(v145, v146);
        return v145;
    end;
    v15.setEnabled = function(v147, v148) --[[ Line: 692 ]] --[[ Name: setEnabled ]]
        v147.isEnabled = v148;
        v147.enabled = v147.isEnabled;
        v147.widget.Visible = v148;
        v147:updateParent();
        return v147;
    end;
    v15.select = function(v149, v150, v151) --[[ Line: 700 ]] --[[ Name: select ]]
        v149:setState("Selected", v150, v151);
        return v149;
    end;
    v15.deselect = function(v152, v153, v154) --[[ Line: 705 ]] --[[ Name: deselect ]]
        v152:setState("Deselected", v153, v154);
        return v152;
    end;
    v15.notify = function(v155, v156, v157) --[[ Line: 710 ]] --[[ Name: notify ]]
        -- upvalues: l_Elements_0 (copy), v15 (copy)
        if not v155.notice then
            v155.notice = require(l_Elements_0.Notice)(v155, v15);
        end;
        v155.noticeStarted:Fire(v156, v157);
        return v155;
    end;
    v15.clearNotices = function(v158) --[[ Line: 724 ]] --[[ Name: clearNotices ]]
        v158.endNotices:Fire();
        return v158;
    end;
    v15.disableOverlay = function(v159, v160) --[[ Line: 729 ]] --[[ Name: disableOverlay ]]
        v159.overlayDisabled = v160;
        return v159;
    end;
    v15.disableStateOverlay = v15.disableOverlay;
    v15.setImage = function(v161, v162, v163) --[[ Line: 735 ]] --[[ Name: setImage ]]
        -- upvalues: l_ContentProvider_0 (copy)
        v161:modifyTheme({
            "IconImage", 
            "Image", 
            v162, 
            v163
        });
        task.spawn(function() --[[ Line: 739 ]]
            -- upvalues: v162 (copy), l_ContentProvider_0 (ref)
            local v164 = if tonumber(v162) then ("rbxassetid://%*"):format(v162) else v162;
            if l_ContentProvider_0:GetAssetFetchStatus(v164) ~= Enum.AssetFetchStatus.Success then
                pcall(l_ContentProvider_0.PreloadAsync, l_ContentProvider_0, {
                    v164
                });
            end;
        end);
        return v161;
    end;
    v15.setLabel = function(v165, v166, v167) --[[ Line: 751 ]] --[[ Name: setLabel ]]
        v165:modifyTheme({
            "IconLabel", 
            "Text", 
            v166, 
            v167
        });
        return v165;
    end;
    v15.setOrder = function(v168, v169, v170) --[[ Line: 756 ]] --[[ Name: setOrder ]]
        local v171 = v169 * 100;
        v168:modifyTheme({
            "IconSpot", 
            "LayoutOrder", 
            v171, 
            v170
        });
        v168:modifyTheme({
            "Widget", 
            "LayoutOrder", 
            v171, 
            v170
        });
        return v168;
    end;
    v15.setCornerRadius = function(v172, v173, v174) --[[ Line: 765 ]] --[[ Name: setCornerRadius ]]
        v172:modifyTheme({
            "IconCorners", 
            "CornerRadius", 
            v173, 
            v174
        });
        return v172;
    end;
    v15.align = function(v175, v176, v177) --[[ Line: 770 ]] --[[ Name: align ]]
        -- upvalues: v15 (copy)
        local v178 = tostring(v176):lower();
        if v178 == "mid" or v178 == "centre" then
            v178 = "center";
        end;
        if v178 ~= "left" and v178 ~= "center" and v178 ~= "right" then
            v178 = "left";
        end;
        local v179 = v178 == "center" and v15.container.TopbarCentered or v15.container.TopbarStandard;
        local l_Holders_0 = v179.Holders;
        local v181 = string.upper((string.sub(v178, 1, 1))) .. string.sub(v178, 2);
        if not v177 then
            v175.originalAlignment = v181;
        end;
        local l_joinedFrame_0 = v175.joinedFrame;
        local v183 = l_Holders_0[v181];
        v175.screenGui = v179;
        v175.alignmentHolder = v183;
        if not v175.isDestroyed then
            v175.widget.Parent = l_joinedFrame_0 or v183;
        end;
        v175.alignment = v181;
        v175.alignmentChanged:Fire(v181);
        v15.iconChanged:Fire(v175);
        return v175;
    end;
    v15.setAlignment = v15.align;
    v15.setLeft = function(v184) --[[ Line: 799 ]] --[[ Name: setLeft ]]
        v184:setAlignment("Left");
        return v184;
    end;
    v15.setMid = function(v185) --[[ Line: 804 ]] --[[ Name: setMid ]]
        v185:setAlignment("Center");
        return v185;
    end;
    v15.setRight = function(v186) --[[ Line: 809 ]] --[[ Name: setRight ]]
        v186:setAlignment("Right");
        return v186;
    end;
    v15.setWidth = function(v187, v188, v189) --[[ Line: 814 ]] --[[ Name: setWidth ]]
        v187:modifyTheme({
            "Widget", 
            "DesiredWidth", 
            v188, 
            v189
        });
        return v187;
    end;
    v15.setImageScale = function(v190, v191, v192) --[[ Line: 822 ]] --[[ Name: setImageScale ]]
        v190:modifyTheme({
            "IconImageScale", 
            "Value", 
            v191, 
            v192
        });
        return v190;
    end;
    v15.setImageRatio = function(v193, v194, v195) --[[ Line: 827 ]] --[[ Name: setImageRatio ]]
        v193:modifyTheme({
            "IconImageRatio", 
            "AspectRatio", 
            v194, 
            v195
        });
        return v193;
    end;
    v15.setTextSize = function(v196, v197, v198) --[[ Line: 832 ]] --[[ Name: setTextSize ]]
        v196:modifyTheme({
            "IconLabel", 
            "TextSize", 
            v197, 
            v198
        });
        return v196;
    end;
    v15.setTextFont = function(v199, v200, v201, v202, v203) --[[ Line: 837 ]] --[[ Name: setTextFont ]]
        v201 = v201 or Enum.FontWeight.Regular;
        v202 = v202 or Enum.FontStyle.Normal;
        local v204 = nil;
        local v205 = typeof(v200);
        if v205 == "number" then
            v204 = Font.fromId(v200, v201, v202);
        elseif v205 == "EnumItem" then
            v204 = Font.fromEnum(v200);
        elseif v205 == "string" and not v200:match("rbxasset") then
            v204 = Font.fromName(v200, v201, v202);
        end;
        if not v204 then
            v204 = Font.new(v200, v201, v202);
        end;
        v199:modifyTheme({
            "IconLabel", 
            "FontFace", 
            v204, 
            v203
        });
        return v199;
    end;
    v15.setTextColor = function(v206, v207, v208) --[[ Line: 858 ]] --[[ Name: setTextColor ]]
        if v207 == nil or v207 == "" or type(v207) ~= "userdata" or typeof(v207) ~= "Color3" then
            if v207 ~= nil and v207 ~= "" then
                warn("setTextColor item must be a Color3 value! Changed the color to white.");
            end;
            v207 = Color3.fromRGB(255, 255, 255);
        end;
        v206:modifyTheme({
            "IconLabel", 
            "TextColor3", 
            v207, 
            v208
        });
        return v206;
    end;
    v15.bindToggleItem = function(v209, v210) --[[ Line: 870 ]] --[[ Name: bindToggleItem ]]
        if not v210:IsA("GuiObject") and not v210:IsA("LayerCollector") then
            error("Toggle item must be a GuiObject or LayerCollector!");
        end;
        v209.toggleItems[v210] = true;
        v209:_updateSelectionInstances();
        return v209;
    end;
    v15.unbindToggleItem = function(v211, v212) --[[ Line: 879 ]] --[[ Name: unbindToggleItem ]]
        v211.toggleItems[v212] = nil;
        v211:_updateSelectionInstances();
        return v211;
    end;
    v15._updateSelectionInstances = function(v213) --[[ Line: 885 ]] --[[ Name: _updateSelectionInstances ]]
        for v214, _ in pairs(v213.toggleItems) do
            local v216 = {};
            for _, v218 in pairs(v214:GetDescendants()) do
                if (v218:IsA("TextButton") or v218:IsA("ImageButton")) and v218.Active then
                    table.insert(v216, v218);
                end;
            end;
            v213.toggleItems[v214] = v216;
        end;
    end;
    v15._setToggleItemsVisible = function(v219, v220, _, v222) --[[ Line: 899 ]] --[[ Name: _setToggleItemsVisible ]]
        for v223, _ in pairs(v219.toggleItems) do
            if not v222 or v222 == v219 or v222.toggleItems[v223] == nil then
                local v225 = "Visible";
                if v223:IsA("LayerCollector") then
                    v225 = "Enabled";
                end;
                v223[v225] = v220;
            end;
        end;
    end;
    v15.bindEvent = function(v226, v227, v228) --[[ Line: 911 ]] --[[ Name: bindEvent ]]
        local v229 = v226[v227];
        assert(v229 and typeof(v229) == "table" and v229.Connect, "argument[1] must be a valid topbarplus icon event name!");
        assert(typeof(v228) == "function", "argument[2] must be a function!");
        v226.bindedEvents[v227] = v229:Connect(function(...) --[[ Line: 915 ]]
            -- upvalues: v228 (copy), v226 (copy)
            v228(v226, ...);
        end);
        return v226;
    end;
    v15.unbindEvent = function(v230, v231) --[[ Line: 921 ]] --[[ Name: unbindEvent ]]
        local v232 = v230.bindedEvents[v231];
        if v232 then
            v232:Disconnect();
            v230.bindedEvents[v231] = nil;
        end;
        return v230;
    end;
    v15.bindToggleKey = function(v233, v234) --[[ Line: 930 ]] --[[ Name: bindToggleKey ]]
        assert(typeof(v234) == "EnumItem", "argument[1] must be a KeyCode EnumItem!");
        v233.bindedToggleKeys[v234] = true;
        v233.toggleKeyAdded:Fire(v234);
        v233:setCaption("_hotkey_");
        return v233;
    end;
    v15.unbindToggleKey = function(v235, v236) --[[ Line: 938 ]] --[[ Name: unbindToggleKey ]]
        assert(typeof(v236) == "EnumItem", "argument[1] must be a KeyCode EnumItem!");
        v235.bindedToggleKeys[v236] = nil;
        return v235;
    end;
    v15.call = function(v237, v238, ...) --[[ Line: 944 ]] --[[ Name: call ]]
        local v239 = table.pack(...);
        task.spawn(function() --[[ Line: 946 ]]
            -- upvalues: v238 (copy), v237 (copy), v239 (copy)
            v238(v237, table.unpack(v239));
        end);
        return v237;
    end;
    v15.addToJanitor = function(v240, v241, v242, v243) --[[ Line: 952 ]] --[[ Name: addToJanitor ]]
        v240.janitor:add(v241, v242, v243);
        return v240;
    end;
    v15.lock = function(v244) --[[ Line: 957 ]] --[[ Name: lock ]]
        v244:getInstance("ClickRegion").Visible = false;
        v244.locked = true;
        return v244;
    end;
    v15.unlock = function(v245) --[[ Line: 965 ]] --[[ Name: unlock ]]
        v245:getInstance("ClickRegion").Visible = true;
        v245.locked = false;
        return v245;
    end;
    v15.debounce = function(v246, v247) --[[ Line: 972 ]] --[[ Name: debounce ]]
        v246:lock();
        task.wait(v247);
        v246:unlock();
        return v246;
    end;
    v15.autoDeselect = function(v248, v249) --[[ Line: 979 ]] --[[ Name: autoDeselect ]]
        if v249 == nil then
            v249 = true;
        end;
        v248.deselectWhenOtherIconSelected = v249;
        return v248;
    end;
    v15.oneClick = function(v250, v251) --[[ Line: 989 ]] --[[ Name: oneClick ]]
        local l_singleClickJanitor_0 = v250.singleClickJanitor;
        l_singleClickJanitor_0:clean();
        if v251 or v251 == nil then
            l_singleClickJanitor_0:add(v250.selected:Connect(function() --[[ Line: 995 ]]
                -- upvalues: v250 (copy)
                v250:deselect("OneClick", v250);
            end));
        end;
        v250.oneClickEnabled = true;
        return v250;
    end;
    v15.setCaption = function(v253, v254) --[[ Line: 1003 ]] --[[ Name: setCaption ]]
        -- upvalues: l_Elements_0 (copy)
        if v254 == "_hotkey_" and v253.captionText then
            return v253;
        else
            local l_captionJanitor_0 = v253.captionJanitor;
            v253.captionJanitor:clean();
            if not v254 or v254 == "" then
                v253.caption = nil;
                v253.captionText = nil;
                return v253;
            else
                local v256 = l_captionJanitor_0:add(require(l_Elements_0.Caption)(v253));
                v256:SetAttribute("CaptionText", v254);
                v253.caption = v256;
                v253.captionText = v254;
                return v253;
            end;
        end;
    end;
    v15.setCaptionHint = function(v257, v258) --[[ Line: 1021 ]] --[[ Name: setCaptionHint ]]
        assert(typeof(v258) == "EnumItem", "argument[1] must be a KeyCode EnumItem!");
        v257.fakeToggleKey = v258;
        v257.fakeToggleKeyChanged:Fire(v258);
        v257:setCaption("_hotkey_");
        return v257;
    end;
    v15.leave = function(v259) --[[ Line: 1029 ]] --[[ Name: leave ]]
        v259.joinJanitor:clean();
        return v259;
    end;
    v15.joinMenu = function(v260, v261) --[[ Line: 1035 ]] --[[ Name: joinMenu ]]
        -- upvalues: v11 (copy)
        v11.joinFeature(v260, v261, v261.menuIcons, v261:getInstance("Menu"));
        v261.menuChildAdded:Fire(v260);
        return v260;
    end;
    v15.setMenu = function(v262, v263) --[[ Line: 1041 ]] --[[ Name: setMenu ]]
        v262.menuSet:Fire(v263);
        return v262;
    end;
    v15.setFixedMenu = function(v264, v265) --[[ Line: 1046 ]] --[[ Name: setFixedMenu ]]
        v264:freezeMenu(v265);
        v264:setMenu(v265);
    end;
    v15.setFrozenMenu = v15.setFixedMenu;
    v15.freezeMenu = function(v266) --[[ Line: 1052 ]] --[[ Name: freezeMenu ]]
        v266:select("FrozenMenu", v266);
        v266:bindEvent("deselected", function(v267) --[[ Line: 1056 ]]
            -- upvalues: v266 (copy)
            v267:select("FrozenMenu", v266);
        end);
        v266:modifyTheme({
            "IconSpot", 
            "Visible", 
            false
        });
    end;
    v15.joinDropdown = function(v268, v269) --[[ Line: 1062 ]] --[[ Name: joinDropdown ]]
        -- upvalues: v11 (copy)
        local l_UID_0 = v268.UID;
        if table.find(v269.dropdownIcons, l_UID_0) == nil then
            v269:getDropdown();
            v11.joinFeature(v268, v269, v269.dropdownIcons, v269:getInstance("DropdownScroller"));
            v269.dropdownChildAdded:Fire(v268);
            return v268;
        else
            return v268;
        end;
    end;
    v15.getDropdown = function(v271) --[[ Line: 1075 ]] --[[ Name: getDropdown ]]
        -- upvalues: l_Elements_0 (copy)
        local l_dropdown_0 = v271.dropdown;
        if not l_dropdown_0 then
            l_dropdown_0 = require(l_Elements_0.Dropdown)(v271);
            v271.dropdown = l_dropdown_0;
            v271:clipOutside(l_dropdown_0);
        end;
        return l_dropdown_0;
    end;
    v15.setDropdown = function(v273, v274) --[[ Line: 1085 ]] --[[ Name: setDropdown ]]
        v273:getDropdown();
        v273.dropdownSet:Fire(v274);
        return v273;
    end;
    v15.clipOutside = function(v275, v276) --[[ Line: 1091 ]] --[[ Name: clipOutside ]]
        -- upvalues: v11 (copy)
        local v277 = v11.clipOutside(v275, v276);
        v275:refreshAppearance(v276);
        return v275, v277;
    end;
    v15.setIndicator = function(v278, v279) --[[ Line: 1102 ]] --[[ Name: setIndicator ]]
        -- upvalues: l_Elements_0 (copy), v15 (copy)
        if not v278.indicator then
            v278.indicator = v278.janitor:add(require(l_Elements_0.Indicator)(v278, v15));
        end;
        v278.indicatorSet:Fire(v279);
    end;
    v15.convertLabelToNumberSpinner = function(v280, v281, v282) --[[ Line: 1114 ]] --[[ Name: convertLabelToNumberSpinner ]]
        task.defer(function() --[[ Line: 1115 ]]
            -- upvalues: v280 (copy), v281 (copy), v282 (copy)
            local v283 = v280:getInstance("IconLabel");
            v283.Transparency = 1;
            v281.Parent = v283.Parent;
            v281.Size = UDim2.fromScale(1, 1);
            v281.AnchorPoint = Vector2.new(0.5, 0.5);
            v281.Position = UDim2.new(0.5, 0, 0.5, 0);
            v281.TextXAlignment = Enum.TextXAlignment.Center;
            v281.ClipsDescendants = false;
            for _, v285 in ipairs({
                "FontFace", 
                "BorderSizePixel", 
                "BorderColor3", 
                "Rotation", 
                "TextStrokeTransparency", 
                "TextStrokeColor3", 
                "TextStrokeTransparency", 
                "TextColor3"
            }) do
                v281[v285] = v283[v285];
                v280:addToJanitor(v283:GetPropertyChangedSignal(v285):Connect(function() --[[ Line: 1138 ]]
                    -- upvalues: v281 (ref), v285 (copy), v283 (copy)
                    v281[v285] = v283[v285];
                end));
            end;
            local function v291() --[[ Line: 1145 ]] --[[ Name: getSpinnerSizeAndDigitCount ]]
                -- upvalues: v281 (ref)
                local v286 = 0;
                local v287 = 0;
                for _, v289 in v281.Frame:GetChildren() do
                    local v290 = string.lower(v289.Name);
                    if v290 == "digit" then
                        v286 = v286 + v289.AbsoluteSize.X;
                        v287 = v287 + 1;
                    elseif (v290 == "prefix" or v290 == "suffix" or v290 == "comma") and v289.Text ~= "" then
                        v286 = v286 + v289.AbsoluteSize.X;
                        v287 = v287 + 1;
                    end;
                end;
                return v286, v287;
            end;
            local function _() --[[ Line: 1163 ]] --[[ Name: getLabelParentContainerXSize ]]
                -- upvalues: v283 (copy), v281 (ref)
                local l_Parent_0 = v283.Parent;
                local v293 = l_Parent_0 and l_Parent_0.Parent;
                if v293 == nil then
                    return 0;
                elseif v293.IconImage.Visible == true then
                    return v281.Frame.AbsoluteSize.X + v283.Parent.Parent.IconImage.AbsoluteSize.X;
                else
                    return v293.AbsoluteSize.X;
                end;
            end;
            local function _() --[[ Line: 1175 ]] --[[ Name: getNumberSpinnerXSize ]]
                -- upvalues: v281 (ref)
                return v281.Frame.AbsoluteSize.X;
            end;
            local function v304() --[[ Line: 1179 ]] --[[ Name: adjustSize ]]
                -- upvalues: v291 (copy), v280 (ref), v281 (ref), v283 (copy)
                local v296, v297 = v291();
                if v297 < 18 then
                    v280:setLabel(v281.Value);
                end;
                local l_X_0 = v281.Frame.AbsoluteSize.X;
                while v296 < l_X_0 and v280.isDestroyed ~= true do
                    task.wait(0.05);
                    if v297 > 0 and v297 < 8 then
                        v281.TextSize = v283.TextSize;
                        break;
                    else
                        local l_v281_0 = v281;
                        l_v281_0.TextSize = l_v281_0.TextSize + 1;
                        l_X_0 = v281.Frame.AbsoluteSize.X;
                        local v300;
                        l_v281_0, v300 = v291();
                        v296 = l_v281_0;
                        v297 = v300;
                    end;
                end;
                local l_Parent_1 = v283.Parent;
                local v302 = l_Parent_1 and l_Parent_1.Parent;
                local v303 = v302 == nil and 0 or if v302.IconImage.Visible == true then v281.Frame.AbsoluteSize.X + v283.Parent.Parent.IconImage.AbsoluteSize.X else v302.AbsoluteSize.X;
                while true do
                    if v303 < v296 and v280.isDestroyed ~= true then
                        task.wait(0.05);
                        if v297 < 8 and v297 > 0 then
                            v281.TextSize = v283.TextSize;
                            return;
                        else
                            l_Parent_1 = v281;
                            l_Parent_1.TextSize = l_Parent_1.TextSize - 1;
                            l_Parent_1 = v283.Parent;
                            v302 = l_Parent_1 and l_Parent_1.Parent;
                            v303 = v302 == nil and 0 or if v302.IconImage.Visible == true then v281.Frame.AbsoluteSize.X + v283.Parent.Parent.IconImage.AbsoluteSize.X else v302.AbsoluteSize.X;
                            l_Parent_1, v302 = v291();
                            v296 = l_Parent_1;
                            v297 = v302;
                        end;
                    else
                        return;
                    end;
                end;
            end;
            v280:addToJanitor(v281.Frame.ChildAdded:Connect(v304));
            v280:addToJanitor(v281.Frame.ChildRemoved:Connect(v304));
            v280:addToJanitor(v280.iconAdded:Connect(function() --[[ Line: 1217 ]]
                -- upvalues: v304 (copy)
                task.wait(1);
                v304();
            end));
            v280:updateParent();
            v281.Name = "LabelSpinner";
            v281.Prefix = "$";
            v281.Commas = true;
            v281.Decimals = 0;
            v281.Duration = 0.25;
            v281.Value = 10;
            task.wait(0.2);
            if typeof(v282) == "function" then
                v282();
            end;
        end);
        return v280;
    end;
    v15.destroy = function(v305) --[[ Line: 1244 ]] --[[ Name: destroy ]]
        -- upvalues: v15 (copy)
        if v305.isDestroyed then
            return;
        else
            v305:clearNotices();
            if v305.parentIconUID then
                v305:leave();
            end;
            v305.isDestroyed = true;
            v305.janitor:clean();
            v15.iconRemoved:Fire(v305);
            return;
        end;
    end;
    v15.Destroy = v15.destroy;
    return v15;
end;