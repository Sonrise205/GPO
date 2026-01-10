local _ = require(script.Parent.Types);
local v1 = {};
return function(v2) --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    v1.GuiService = game:GetService("GuiService");
    v1.RunService = game:GetService("RunService");
    v1.UserInputService = game:GetService("UserInputService");
    v1.ContextActionService = game:GetService("ContextActionService");
    v1.TextService = game:GetService("TextService");
    v1.ICONS = {
        RIGHT_POINTING_TRIANGLE = "rbxasset://textures/DeveloperFramework/button_arrow_right.png", 
        DOWN_POINTING_TRIANGLE = "rbxasset://textures/DeveloperFramework/button_arrow_down.png", 
        MULTIPLICATION_SIGN = "rbxasset://textures/AnimationEditor/icon_close.png", 
        BOTTOM_RIGHT_CORNER = "\226\151\162", 
        CHECK_MARK = "rbxasset://textures/AnimationEditor/icon_checkmark.png", 
        ALPHA_BACKGROUND_TEXTURE = "rbxasset://textures/meshPartFallback.png"
    };
    v1.GuiInset = v1.GuiService:GetGuiInset();
    v1.IS_STUDIO = v1.RunService:IsStudio();
    v1.getTime = function() --[[ Line: 24 ]] --[[ Name: getTime ]]
        -- upvalues: v1 (ref)
        if v1.IS_STUDIO then
            return os.clock();
        else
            return time();
        end;
    end;
    v1.getMouseLocation = function() --[[ Line: 33 ]] --[[ Name: getMouseLocation ]]
        -- upvalues: v1 (ref)
        return v1.UserInputService:GetMouseLocation() - v1.GuiInset;
    end;
    v1.findBestWindowPosForPopup = function(v3, v4, v5, v6) --[[ Line: 37 ]] --[[ Name: findBestWindowPosForPopup ]]
        v3 = if v3.X + v4.X + 20 > v6.X then if v3.Y + v4.Y + 20 > v6.Y then v3 + Vector2.new(0, -(20 + v4.Y)) else v3 + Vector2.new(0, 20) else v3 + Vector2.new(20, 0);
        return (Vector2.new(math.max(math.min(v3.X + v4.X, v6.X) - v4.X, v5.X), (math.max(math.min(v3.Y + v4.Y, v6.Y) - v4.Y, v5.Y))));
    end;
    v1.isPosInsideRect = function(v7, v8, v9) --[[ Line: 57 ]] --[[ Name: isPosInsideRect ]]
        local v10 = false;
        if v7.X > v8.X then
            v10 = false;
            if v7.X < v9.X then
                v10 = false;
                if v7.Y > v8.Y then
                    v10 = v7.Y < v9.Y;
                end;
            end;
        end;
        return v10;
    end;
    v1.extend = function(v11, v12) --[[ Line: 61 ]] --[[ Name: extend ]]
        local v13 = table.clone(v11);
        for v14, v15 in v12 do
            v13[v14] = v15;
        end;
        return v13;
    end;
    v1.UIPadding = function(v16, v17) --[[ Line: 69 ]] --[[ Name: UIPadding ]]
        local l_UIPadding_0 = Instance.new("UIPadding");
        l_UIPadding_0.PaddingLeft = UDim.new(0, v17.X);
        l_UIPadding_0.PaddingRight = UDim.new(0, v17.X);
        l_UIPadding_0.PaddingTop = UDim.new(0, v17.Y);
        l_UIPadding_0.PaddingBottom = UDim.new(0, v17.Y);
        l_UIPadding_0.Parent = v16;
        return l_UIPadding_0;
    end;
    v1.UIListLayout = function(v19, v20, v21) --[[ Line: 79 ]] --[[ Name: UIListLayout ]]
        local l_UIListLayout_0 = Instance.new("UIListLayout");
        l_UIListLayout_0.SortOrder = Enum.SortOrder.LayoutOrder;
        l_UIListLayout_0.Padding = v21;
        l_UIListLayout_0.FillDirection = v20;
        l_UIListLayout_0.Parent = v19;
        return l_UIListLayout_0;
    end;
    v1.UIStroke = function(v23, v24, v25, v26) --[[ Line: 88 ]] --[[ Name: UIStroke ]]
        local l_UIStroke_0 = Instance.new("UIStroke");
        l_UIStroke_0.Thickness = v24;
        l_UIStroke_0.Color = v25;
        l_UIStroke_0.Transparency = v26;
        l_UIStroke_0.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
        l_UIStroke_0.LineJoinMode = Enum.LineJoinMode.Round;
        l_UIStroke_0.Parent = v23;
        return l_UIStroke_0;
    end;
    v1.UICorner = function(v28, v29) --[[ Line: 99 ]] --[[ Name: UICorner ]]
        local l_UICorner_0 = Instance.new("UICorner");
        l_UICorner_0.CornerRadius = UDim.new(v29 and 0 or 1, v29 or 0);
        l_UICorner_0.Parent = v28;
        return l_UICorner_0;
    end;
    v1.UISizeConstraint = function(v31, v32, v33) --[[ Line: 106 ]] --[[ Name: UISizeConstraint ]]
        local l_UISizeConstraint_0 = Instance.new("UISizeConstraint");
        l_UISizeConstraint_0.MinSize = v32 or l_UISizeConstraint_0.MinSize;
        l_UISizeConstraint_0.MaxSize = v33 or l_UISizeConstraint_0.MaxSize;
        l_UISizeConstraint_0.Parent = v31;
        return l_UISizeConstraint_0;
    end;
    v1.UIReference = function(v35, v36, v37) --[[ Line: 114 ]] --[[ Name: UIReference ]]
        local l_ObjectValue_0 = Instance.new("ObjectValue");
        l_ObjectValue_0.Name = v37;
        l_ObjectValue_0.Value = v36;
        l_ObjectValue_0.Parent = v35;
        return l_ObjectValue_0;
    end;
    v1.getScreenSizeForWindow = function(v39) --[[ Line: 123 ]] --[[ Name: getScreenSizeForWindow ]]
        local _ = nil;
        if v39.usesScreenGUI then
            return v39.Instance.AbsoluteSize;
        else
            local l_Parent_0 = v39.Instance.Parent;
            if l_Parent_0:IsA("GuiBase2d") then
                return l_Parent_0.AbsoluteSize;
            elseif l_Parent_0.Parent:IsA("GuiBase2d") then
                return l_Parent_0.AbsoluteSize;
            else
                return workspace.CurrentCamera.ViewportSize;
            end;
        end;
    end;
    local l_GetTextBoundsParams_0 = Instance.new("GetTextBoundsParams");
    l_GetTextBoundsParams_0.Font = v2._config.TextFont;
    l_GetTextBoundsParams_0.Size = v2._config.TextSize;
    l_GetTextBoundsParams_0.Width = 1e999;
    v1.calculateTextSize = function(v43, v44) --[[ Line: 148 ]] --[[ Name: calculateTextSize ]]
        -- upvalues: l_GetTextBoundsParams_0 (copy), v1 (ref)
        if v44 then
            l_GetTextBoundsParams_0.Width = v44;
        end;
        l_GetTextBoundsParams_0.Text = v43;
        local l_TextBoundsAsync_0 = v1.TextService:GetTextBoundsAsync(l_GetTextBoundsParams_0);
        if v44 then
            l_GetTextBoundsParams_0.Width = 1e999;
        end;
        return l_TextBoundsAsync_0;
    end;
    v1.applyTextStyle = function(v46) --[[ Line: 163 ]] --[[ Name: applyTextStyle ]]
        -- upvalues: v2 (copy)
        v46.FontFace = v2._config.TextFont;
        v46.TextSize = v2._config.TextSize;
        v46.TextColor3 = v2._config.TextColor;
        v46.TextTransparency = v2._config.TextTransparency;
        v46.TextXAlignment = Enum.TextXAlignment.Left;
        v46.AutoLocalize = false;
        v46.RichText = false;
    end;
    v1.applyInteractionHighlights = function(v47, v48, v49) --[[ Line: 174 ]] --[[ Name: applyInteractionHighlights ]]
        -- upvalues: v2 (copy)
        local v50 = false;
        v47.MouseEnter:Connect(function() --[[ Line: 176 ]]
            -- upvalues: v48 (copy), v49 (copy), v50 (ref)
            v48.BackgroundColor3 = v49.ButtonHoveredColor;
            v48.BackgroundTransparency = v49.ButtonHoveredTransparency;
            v50 = false;
        end);
        v47.MouseLeave:Connect(function() --[[ Line: 183 ]]
            -- upvalues: v48 (copy), v49 (copy), v50 (ref)
            v48.BackgroundColor3 = v49.ButtonColor;
            v48.BackgroundTransparency = v49.ButtonTransparency;
            v50 = true;
        end);
        v47.InputBegan:Connect(function(v51) --[[ Line: 190 ]]
            -- upvalues: v48 (copy), v49 (copy)
            if v51.UserInputType ~= Enum.UserInputType.MouseButton1 and v51.UserInputType ~= Enum.UserInputType.Gamepad1 then
                return;
            else
                v48.BackgroundColor3 = v49.ButtonActiveColor;
                v48.BackgroundTransparency = v49.ButtonActiveTransparency;
                return;
            end;
        end);
        v47.InputEnded:Connect(function(v52) --[[ Line: 198 ]]
            -- upvalues: v50 (ref), v48 (copy), v49 (copy)
            if v52.UserInputType ~= Enum.UserInputType.MouseButton1 and v52.UserInputType ~= Enum.UserInputType.Gamepad1 or v50 then
                return;
            else
                if v52.UserInputType == Enum.UserInputType.MouseButton1 then
                    v48.BackgroundColor3 = v49.ButtonHoveredColor;
                    v48.BackgroundTransparency = v49.ButtonHoveredTransparency;
                end;
                if v52.UserInputType == Enum.UserInputType.Gamepad1 then
                    v48.BackgroundColor3 = v49.ButtonColor;
                    v48.BackgroundTransparency = v49.ButtonTransparency;
                end;
                return;
            end;
        end);
        v47.SelectionImageObject = v2.SelectionImageObject;
    end;
    v1.applyInteractionHighlightsWithMultiHighlightee = function(v53, v54) --[[ Line: 215 ]] --[[ Name: applyInteractionHighlightsWithMultiHighlightee ]]
        -- upvalues: v2 (copy)
        local v55 = false;
        v53.MouseEnter:Connect(function() --[[ Line: 217 ]]
            -- upvalues: v54 (copy), v55 (ref)
            for _, v57 in v54 do
                v57[1].BackgroundColor3 = v57[2].ButtonHoveredColor;
                v57[1].BackgroundTransparency = v57[2].ButtonHoveredTransparency;
                v55 = false;
            end;
        end);
        v53.MouseLeave:Connect(function() --[[ Line: 226 ]]
            -- upvalues: v54 (copy), v55 (ref)
            for _, v59 in v54 do
                v59[1].BackgroundColor3 = v59[2].ButtonColor;
                v59[1].BackgroundTransparency = v59[2].ButtonTransparency;
                v55 = true;
            end;
        end);
        v53.InputBegan:Connect(function(v60) --[[ Line: 235 ]]
            -- upvalues: v54 (copy)
            if v60.UserInputType ~= Enum.UserInputType.MouseButton1 and v60.UserInputType ~= Enum.UserInputType.Gamepad1 then
                return;
            else
                for _, v62 in v54 do
                    v62[1].BackgroundColor3 = v62[2].ButtonActiveColor;
                    v62[1].BackgroundTransparency = v62[2].ButtonActiveTransparency;
                end;
                return;
            end;
        end);
        v53.InputEnded:Connect(function(v63) --[[ Line: 245 ]]
            -- upvalues: v55 (ref), v54 (copy)
            if v63.UserInputType ~= Enum.UserInputType.MouseButton1 and v63.UserInputType ~= Enum.UserInputType.Gamepad1 or v55 then
                return;
            else
                for _, v65 in v54 do
                    if v63.UserInputType == Enum.UserInputType.MouseButton1 then
                        v65[1].BackgroundColor3 = v65[2].ButtonHoveredColor;
                        v65[1].BackgroundTransparency = v65[2].ButtonHoveredTransparency;
                    end;
                    if v63.UserInputType == Enum.UserInputType.Gamepad1 then
                        v65[1].BackgroundColor3 = v65[2].ButtonColor;
                        v65[1].BackgroundTransparency = v65[2].ButtonTransparency;
                    end;
                end;
                return;
            end;
        end);
        v53.SelectionImageObject = v2.SelectionImageObject;
    end;
    v1.applyTextInteractionHighlights = function(v66, v67, v68) --[[ Line: 264 ]] --[[ Name: applyTextInteractionHighlights ]]
        -- upvalues: v2 (copy)
        local v69 = false;
        v66.MouseEnter:Connect(function() --[[ Line: 266 ]]
            -- upvalues: v67 (copy), v68 (copy), v69 (ref)
            v67.TextColor3 = v68.ButtonHoveredColor;
            v67.TextTransparency = v68.ButtonHoveredTransparency;
            v69 = false;
        end);
        v66.MouseLeave:Connect(function() --[[ Line: 273 ]]
            -- upvalues: v67 (copy), v68 (copy), v69 (ref)
            v67.TextColor3 = v68.ButtonColor;
            v67.TextTransparency = v68.ButtonTransparency;
            v69 = true;
        end);
        v66.InputBegan:Connect(function(v70) --[[ Line: 280 ]]
            -- upvalues: v67 (copy), v68 (copy)
            if v70.UserInputType ~= Enum.UserInputType.MouseButton1 and v70.UserInputType ~= Enum.UserInputType.Gamepad1 then
                return;
            else
                v67.TextColor3 = v68.ButtonActiveColor;
                v67.TextTransparency = v68.ButtonActiveTransparency;
                return;
            end;
        end);
        v66.InputEnded:Connect(function(v71) --[[ Line: 288 ]]
            -- upvalues: v69 (ref), v67 (copy), v68 (copy)
            if v71.UserInputType ~= Enum.UserInputType.MouseButton1 and v71.UserInputType ~= Enum.UserInputType.Gamepad1 or v69 then
                return;
            else
                if v71.UserInputType == Enum.UserInputType.MouseButton1 then
                    v67.TextColor3 = v68.ButtonHoveredColor;
                    v67.TextTransparency = v68.ButtonHoveredTransparency;
                end;
                if v71.UserInputType == Enum.UserInputType.Gamepad1 then
                    v67.TextColor3 = v68.ButtonColor;
                    v67.TextTransparency = v68.ButtonTransparency;
                end;
                return;
            end;
        end);
        v66.SelectionImageObject = v2.SelectionImageObject;
    end;
    v1.applyFrameStyle = function(v72, v73, v74) --[[ Line: 305 ]] --[[ Name: applyFrameStyle ]]
        -- upvalues: v2 (copy), v1 (ref)
        local l_FramePadding_0 = v2._config.FramePadding;
        local l_FrameBorderSize_0 = v2._config.FrameBorderSize;
        local l_BorderColor_0 = v2._config.BorderColor;
        local l_ButtonTransparency_0 = v2._config.ButtonTransparency;
        local l_FrameRounding_0 = v2._config.FrameRounding;
        if l_FrameBorderSize_0 > 0 and l_FrameRounding_0 > 0 then
            v72.BorderSizePixel = 0;
            local l_UIStroke_1 = Instance.new("UIStroke");
            l_UIStroke_1.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
            l_UIStroke_1.LineJoinMode = Enum.LineJoinMode.Round;
            l_UIStroke_1.Transparency = l_ButtonTransparency_0;
            l_UIStroke_1.Thickness = l_FrameBorderSize_0;
            l_UIStroke_1.Color = l_BorderColor_0;
            v1.UICorner(v72, l_FrameRounding_0);
            l_UIStroke_1.Parent = v72;
            if not v73 then
                v1.UIPadding(v72, v2._config.FramePadding);
                return;
            end;
        elseif l_FrameBorderSize_0 < 1 and l_FrameRounding_0 > 0 then
            v72.BorderSizePixel = 0;
            v1.UICorner(v72, l_FrameRounding_0);
            if not v73 then
                v1.UIPadding(v72, v2._config.FramePadding);
                return;
            end;
        elseif l_FrameRounding_0 < 1 then
            v72.BorderSizePixel = l_FrameBorderSize_0;
            v72.BorderColor3 = l_BorderColor_0;
            v72.BorderMode = Enum.BorderMode.Inset;
            if not v73 then
                v1.UIPadding(v72, l_FramePadding_0 - Vector2.new(l_FrameBorderSize_0, l_FrameBorderSize_0));
                return;
            elseif not v74 then
                v1.UIPadding(v72, -Vector2.new(l_FrameBorderSize_0, l_FrameBorderSize_0));
            end;
        end;
    end;
    v1.discardState = function(v81) --[[ Line: 350 ]] --[[ Name: discardState ]]
        for _, v83 in v81.state do
            v83.ConnectedWidgets[v81.ID] = nil;
        end;
    end;
    v1.EVENTS = {
        hover = function(v84) --[[ Line: 357 ]] --[[ Name: hover ]]
            return {
                Init = function(v85) --[[ Line: 359 ]]
                    -- upvalues: v84 (copy)
                    local v86 = v84(v85);
                    v86.MouseEnter:Connect(function() --[[ Line: 361 ]]
                        -- upvalues: v85 (copy)
                        v85.isHoveredEvent = true;
                    end);
                    v86.MouseLeave:Connect(function() --[[ Line: 364 ]]
                        -- upvalues: v85 (copy)
                        v85.isHoveredEvent = false;
                    end);
                    v85.isHoveredEvent = false;
                end, 
                Get = function(v87) --[[ Line: 369 ]]
                    return v87.isHoveredEvent;
                end
            };
        end, 
        click = function(v88) --[[ Line: 375 ]] --[[ Name: click ]]
            -- upvalues: v2 (copy)
            return {
                Init = function(v89) --[[ Line: 377 ]]
                    -- upvalues: v88 (copy), v2 (ref)
                    local v90 = v88(v89);
                    v89.lastClickedTick = -1;
                    v90.MouseButton1Click:Connect(function() --[[ Line: 381 ]]
                        -- upvalues: v89 (copy), v2 (ref)
                        v89.lastClickedTick = v2._cycleTick + 1;
                    end);
                end, 
                Get = function(v91) --[[ Line: 385 ]]
                    -- upvalues: v2 (ref)
                    return v91.lastClickedTick == v2._cycleTick;
                end
            };
        end, 
        rightClick = function(v92) --[[ Line: 391 ]] --[[ Name: rightClick ]]
            -- upvalues: v2 (copy)
            return {
                Init = function(v93) --[[ Line: 393 ]]
                    -- upvalues: v92 (copy), v2 (ref)
                    local v94 = v92(v93);
                    v93.lastRightClickedTick = -1;
                    v94.MouseButton2Click:Connect(function() --[[ Line: 397 ]]
                        -- upvalues: v93 (copy), v2 (ref)
                        v93.lastRightClickedTick = v2._cycleTick + 1;
                    end);
                end, 
                Get = function(v95) --[[ Line: 401 ]]
                    -- upvalues: v2 (ref)
                    return v95.lastRightClickedTick == v2._cycleTick;
                end
            };
        end, 
        doubleClick = function(v96) --[[ Line: 407 ]] --[[ Name: doubleClick ]]
            -- upvalues: v1 (ref), v2 (copy)
            return {
                Init = function(v97) --[[ Line: 409 ]]
                    -- upvalues: v96 (copy), v1 (ref), v2 (ref)
                    local v98 = v96(v97);
                    v97.lastClickedTime = -1;
                    v97.lastClickedPosition = Vector2.zero;
                    v97.lastDoubleClickedTick = -1;
                    v98.MouseButton1Down:Connect(function(v99, v100) --[[ Line: 415 ]]
                        -- upvalues: v1 (ref), v97 (copy), v2 (ref)
                        local v101 = v1.getTime();
                        if v101 - v97.lastClickedTime < v2._config.MouseDoubleClickTime and (Vector2.new(v99, v100) - v97.lastClickedPosition).Magnitude < v2._config.MouseDoubleClickMaxDist then
                            v97.lastDoubleClickedTick = v2._cycleTick + 1;
                            return;
                        else
                            v97.lastClickedTime = v101;
                            v97.lastClickedPosition = Vector2.new(v99, v100);
                            return;
                        end;
                    end);
                end, 
                Get = function(v102) --[[ Line: 426 ]]
                    -- upvalues: v2 (ref)
                    return v102.lastDoubleClickedTick == v2._cycleTick;
                end
            };
        end, 
        ctrlClick = function(v103) --[[ Line: 432 ]] --[[ Name: ctrlClick ]]
            -- upvalues: v1 (ref), v2 (copy)
            return {
                Init = function(v104) --[[ Line: 434 ]]
                    -- upvalues: v103 (copy), v1 (ref), v2 (ref)
                    local v105 = v103(v104);
                    v104.lastCtrlClickedTick = -1;
                    v105.MouseButton1Click:Connect(function() --[[ Line: 438 ]]
                        -- upvalues: v1 (ref), v104 (copy), v2 (ref)
                        if v1.UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) or v1.UserInputService:IsKeyDown(Enum.KeyCode.RightControl) then
                            v104.lastCtrlClickedTick = v2._cycleTick + 1;
                        end;
                    end);
                end, 
                Get = function(v106) --[[ Line: 444 ]]
                    -- upvalues: v2 (ref)
                    return v106.lastCtrlClickedTick == v2._cycleTick;
                end
            };
        end, 
        shortcut = function(v107) --[[ Line: 450 ]] --[[ Name: shortcut ]]
            -- upvalues: v1 (ref), v2 (copy)
            return {
                Init = function(v108) --[[ Line: 452 ]]
                    -- upvalues: v107 (copy), v1 (ref), v2 (ref)
                    local v109, v110 = v107(v108);
                    v108.lastShortcutTick = -1;
                    v1.ContextActionService:BindAction(v108.ID, function(_, v112, v113) --[[ Line: 456 ]]
                        -- upvalues: v110 (copy), v108 (copy), v2 (ref)
                        if v112 == Enum.UserInputState.Begin and v113:IsModifierKeyDown(v110) then
                            v108.lastShortcutTick = v2._cycleTick + 1;
                        end;
                    end, false, v109);
                end, 
                Get = function(v114) --[[ Line: 464 ]]
                    -- upvalues: v2 (ref)
                    return v114.lastShortcutTick == v2._cycleTick;
                end
            };
        end
    };
    require(script.Root)(v2, v1);
    require(script.Window)(v2, v1);
    require(script.Menu)(v2, v1);
    require(script.Format)(v2, v1);
    require(script.Text)(v2, v1);
    require(script.Button)(v2, v1);
    require(script.Checkbox)(v2, v1);
    require(script.RadioButton)(v2, v1);
    require(script.Tree)(v2, v1);
    require(script.Input)(v2, v1);
    require(script.Combo)(v2, v1);
    require(script.Table)(v2, v1);
end;