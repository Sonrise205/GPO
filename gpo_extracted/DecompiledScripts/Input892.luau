local _ = require(script.Parent.Parent.Types);
return function(v1, v2) --[[ Line: 3 ]]
    local v5 = {
        Init = function(_) --[[ Line: 5 ]]

        end, 
        Get = function(v4) --[[ Line: 6 ]]
            -- upvalues: v1 (copy)
            return v4.lastNumberChangedTick == v1._cycleTick;
        end
    };
    local function v10(v6, v7, v8) --[[ Line: 11 ]] --[[ Name: getValueByIndex ]]
        if typeof(v6) == "number" then
            return v6;
        else
            if typeof(v6) == "Vector2" then
                if v7 == 1 then
                    return v6.X;
                elseif v7 == 2 then
                    return v6.Y;
                end;
            elseif typeof(v6) == "Vector3" then
                if v7 == 1 then
                    return v6.X;
                elseif v7 == 2 then
                    return v6.Y;
                elseif v7 == 3 then
                    return v6.Z;
                end;
            elseif typeof(v6) == "UDim" then
                if v7 == 1 then
                    return v6.Scale;
                elseif v7 == 2 then
                    return v6.Offset;
                end;
            elseif typeof(v6) == "UDim2" then
                if v7 == 1 then
                    return v6.X.Scale;
                elseif v7 == 2 then
                    return v6.X.Offset;
                elseif v7 == 3 then
                    return v6.Y.Scale;
                elseif v7 == 4 then
                    return v6.Y.Offset;
                end;
            elseif typeof(v6) == "Color3" then
                local v9 = v8.UseHSV and {
                    v6:ToHSV()
                } or {
                    v6.R, 
                    v6.G, 
                    v6.B
                };
                if v7 == 1 then
                    return v9[1];
                elseif v7 == 2 then
                    return v9[2];
                elseif v7 == 3 then
                    return v9[3];
                end;
            elseif typeof(v6) == "Rect" then
                if v7 == 1 then
                    return v6.Min.X;
                elseif v7 == 2 then
                    return v6.Min.Y;
                elseif v7 == 3 then
                    return v6.Max.X;
                elseif v7 == 4 then
                    return v6.Max.Y;
                end;
            elseif typeof(v6) == "table" then
                return v6[v7];
            end;
            error((("Incorrect datatype or value: %* %* %*"):format(v6, typeof(v6), v7)));
            return;
        end;
    end;
    local function v18(v11, v12, v13, v14) --[[ Line: 70 ]] --[[ Name: updateValueByIndex ]]
        if typeof(v11) == "number" then
            return v13;
        else
            if typeof(v11) == "Vector2" then
                if v12 == 1 then
                    return Vector2.new(v13, v11.Y);
                elseif v12 == 2 then
                    return Vector2.new(v11.X, v13);
                end;
            elseif typeof(v11) == "Vector3" then
                if v12 == 1 then
                    return (Vector3.new(v13, v11.Y, v11.Z));
                elseif v12 == 2 then
                    return (Vector3.new(v11.X, v13, v11.Z));
                elseif v12 == 3 then
                    return (Vector3.new(v11.X, v11.Y, v13));
                end;
            elseif typeof(v11) == "UDim" then
                if v12 == 1 then
                    return UDim.new(v13, v11.Offset);
                elseif v12 == 2 then
                    return UDim.new(v11.Scale, v13);
                end;
            elseif typeof(v11) == "UDim2" then
                if v12 == 1 then
                    return UDim2.new(UDim.new(v13, v11.X.Offset), v11.Y);
                elseif v12 == 2 then
                    return UDim2.new(UDim.new(v11.X.Scale, v13), v11.Y);
                elseif v12 == 3 then
                    return UDim2.new(v11.X, UDim.new(v13, v11.Y.Offset));
                elseif v12 == 4 then
                    return UDim2.new(v11.X, UDim.new(v11.Y.Scale, v13));
                end;
            elseif typeof(v11) == "Rect" then
                if v12 == 1 then
                    return Rect.new(Vector2.new(v13, v11.Min.Y), v11.Max);
                elseif v12 == 2 then
                    return Rect.new(Vector2.new(v11.Min.X, v13), v11.Max);
                elseif v12 == 3 then
                    return Rect.new(v11.Min, Vector2.new(v13, v11.Max.Y));
                elseif v12 == 4 then
                    return Rect.new(v11.Min, Vector2.new(v11.Max.X, v13));
                end;
            elseif typeof(v11) == "Color3" then
                if v14.UseHSV then
                    local v15, v16, v17 = v11:ToHSV();
                    if v12 == 1 then
                        return Color3.fromHSV(v13, v16, v17);
                    elseif v12 == 2 then
                        return Color3.fromHSV(v15, v13, v17);
                    elseif v12 == 3 then
                        return Color3.fromHSV(v15, v16, v13);
                    end;
                end;
                if v12 == 1 then
                    return Color3.new(v13, v11.G, v11.B);
                elseif v12 == 2 then
                    return Color3.new(v11.R, v13, v11.B);
                elseif v12 == 3 then
                    return Color3.new(v11.R, v11.G, v13);
                end;
            end;
            error((("Incorrect datatype or value %* %* %*"):format(v11, typeof(v11), v12)));
            return;
        end;
    end;
    local v19 = {
        Num = {
            1
        }, 
        Vector2 = {
            1, 
            1
        }, 
        Vector3 = {
            1, 
            1, 
            1
        }, 
        UDim = {
            0.01, 
            1
        }, 
        UDim2 = {
            0.01, 
            1, 
            0.01, 
            1
        }, 
        Color3 = {
            1, 
            1, 
            1
        }, 
        Color4 = {
            1, 
            1, 
            1, 
            1
        }, 
        Rect = {
            1, 
            1, 
            1, 
            1
        }
    };
    local v20 = {
        Num = {
            0
        }, 
        Vector2 = {
            0, 
            0
        }, 
        Vector3 = {
            0, 
            0, 
            0
        }, 
        UDim = {
            0, 
            0
        }, 
        UDim2 = {
            0, 
            0, 
            0, 
            0
        }, 
        Rect = {
            0, 
            0, 
            0, 
            0
        }
    };
    local v21 = {
        Num = {
            100
        }, 
        Vector2 = {
            100, 
            100
        }, 
        Vector3 = {
            100, 
            100, 
            100
        }, 
        UDim = {
            1, 
            960
        }, 
        UDim2 = {
            1, 
            960, 
            1, 
            960
        }, 
        Rect = {
            960, 
            960, 
            960, 
            960
        }
    };
    local v22 = {
        Num = {
            ""
        }, 
        Vector2 = {
            "X: ", 
            "Y: "
        }, 
        Vector3 = {
            "X: ", 
            "Y: ", 
            "Z: "
        }, 
        UDim = {
            "", 
            ""
        }, 
        UDim2 = {
            "", 
            "", 
            "", 
            ""
        }, 
        Color3_RGB = {
            "R: ", 
            "G: ", 
            "B: "
        }, 
        Color3_HSV = {
            "H: ", 
            "S: ", 
            "V: "
        }, 
        Color4_RGB = {
            "R: ", 
            "G: ", 
            "B: ", 
            "T: "
        }, 
        Color4_HSV = {
            "H: ", 
            "S: ", 
            "V: ", 
            "T: "
        }, 
        Rect = {
            "X: ", 
            "Y: ", 
            "X: ", 
            "Y: "
        }
    };
    local v23 = {
        Num = {
            0
        }, 
        Vector2 = {
            0, 
            0
        }, 
        Vector3 = {
            0, 
            0, 
            0
        }, 
        UDim = {
            3, 
            0
        }, 
        UDim2 = {
            3, 
            0, 
            3, 
            0
        }, 
        Color3 = {
            0, 
            0, 
            0
        }, 
        Color4 = {
            0, 
            0, 
            0, 
            0
        }, 
        Rect = {
            0, 
            0, 
            0, 
            0
        }
    };
    local v24 = nil;
    local function v37(v25, v26, v27, v28) --[[ Line: 194 ]] --[[ Name: generateButtons ]]
        -- upvalues: v1 (copy), v2 (copy), v10 (copy)
        v27 = v27 + (2 * v1._config.ItemInnerSpacing.X + v28 * 2);
        local v29 = v2.abstractButton.Generate(v25);
        v29.Name = "SubButton";
        v29.ZIndex = v25.ZIndex + 5;
        v29.LayoutOrder = v25.ZIndex + 5;
        v29.TextXAlignment = Enum.TextXAlignment.Center;
        v29.Text = "-";
        v29.Size = UDim2.fromOffset(v1._config.TextSize + 2 * v1._config.FramePadding.Y, v1._config.TextSize);
        v29.Parent = v26;
        v29.MouseButton1Click:Connect(function() --[[ Line: 206 ]]
            -- upvalues: v2 (ref), v25 (copy), v10 (ref), v1 (ref)
            local v30 = v2.UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) or v2.UserInputService:IsKeyDown(Enum.KeyCode.RightControl);
            local v31 = (v25.arguments.Increment and v10(v25.arguments.Increment, 1, v25.arguments) or 1) * (v30 and 100 or 1);
            local v32 = v25.state.number.value - v31;
            if v25.arguments.Min ~= nil then
                v32 = math.max(v32, v10(v25.arguments.Min, 1, v25.arguments));
            end;
            if v25.arguments.Max ~= nil then
                v32 = math.min(v32, v10(v25.arguments.Max, 1, v25.arguments));
            end;
            v25.state.number:set(v32);
            v25.lastNumberChangedTick = v1._cycleTick + 1;
        end);
        local v33 = v2.abstractButton.Generate(v25);
        v33.Name = "AddButton";
        v33.ZIndex = v25.ZIndex + 6;
        v33.LayoutOrder = v25.ZIndex + 6;
        v33.TextXAlignment = Enum.TextXAlignment.Center;
        v33.Text = "+";
        v33.Size = UDim2.fromOffset(v1._config.TextSize + 2 * v1._config.FramePadding.Y, v1._config.TextSize);
        v33.Parent = v26;
        v33.MouseButton1Click:Connect(function() --[[ Line: 232 ]]
            -- upvalues: v2 (ref), v25 (copy), v10 (ref), v1 (ref)
            local v34 = v2.UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) or v2.UserInputService:IsKeyDown(Enum.KeyCode.RightControl);
            local v35 = (v25.arguments.Increment and v10(v25.arguments.Increment, 1, v25.arguments) or 1) * (v34 and 100 or 1);
            local v36 = v25.state.number.value + v35;
            if v25.arguments.Min ~= nil then
                v36 = math.max(v36, v10(v25.arguments.Min, 1, v25.arguments));
            end;
            if v25.arguments.Max ~= nil then
                v36 = math.min(v36, v10(v25.arguments.Max, 1, v25.arguments));
            end;
            v25.state.number:set(v36);
            v25.lastNumberChangedTick = v1._cycleTick + 1;
        end);
        return v27;
    end;
    local l_v37_0 = v37 --[[ copy: 11 -> 21 ]];
    v24 = function(v39, v40, v41) --[[ Line: 252 ]] --[[ Name: generateInputScalar ]]
        -- upvalues: v5 (copy), v2 (copy), v1 (copy), l_v37_0 (copy), v10 (copy), v18 (copy), v23 (copy), v22 (copy)
        return {
            hasState = true, 
            hasChildren = false, 
            Args = {
                Text = 1, 
                Increment = 2, 
                Min = 3, 
                Max = 4, 
                Format = 5
            }, 
            Events = {
                numberChanged = v5, 
                hovered = v2.EVENTS.hover(function(v42) --[[ Line: 265 ]]
                    return v42.Instance;
                end)
            }, 
            Generate = function(v43) --[[ Line: 269 ]] --[[ Name: Generate ]]
                -- upvalues: v39 (copy), v2 (ref), v1 (ref), v40 (copy), l_v37_0 (ref), v10 (ref), v18 (ref)
                local l_Frame_0 = Instance.new("Frame");
                l_Frame_0.Name = "Iris_Input" .. v39;
                l_Frame_0.Size = UDim2.fromScale(1, 0);
                l_Frame_0.BackgroundTransparency = 1;
                l_Frame_0.BorderSizePixel = 0;
                l_Frame_0.ZIndex = v43.ZIndex;
                l_Frame_0.LayoutOrder = v43.ZIndex;
                l_Frame_0.AutomaticSize = Enum.AutomaticSize.Y;
                v2.UIListLayout(l_Frame_0, Enum.FillDirection.Horizontal, UDim.new(0, v1._config.ItemInnerSpacing.X));
                local v45 = 0;
                local v46 = v1._config.TextSize + 2 * v1._config.FramePadding.Y;
                if v40 == 1 then
                    v45 = l_v37_0(v43, l_Frame_0, v45, v46);
                end;
                local v47 = UDim.new(v1._config.ContentWidth.Scale / v40, (v1._config.ContentWidth.Offset - v1._config.ItemInnerSpacing.X * (v40 - 1) - v45) / v40);
                local v48 = UDim.new(v47.Scale * (v40 - 1), v47.Offset * (v40 - 1) + v1._config.ItemInnerSpacing.X * (v40 - 1) + v45);
                local v49 = v1._config.ContentWidth - v48;
                for v50 = 1, v40 do
                    local l_TextBox_0 = Instance.new("TextBox");
                    l_TextBox_0.Name = "InputField" .. tostring(v50);
                    l_TextBox_0.ZIndex = v43.ZIndex + v50;
                    l_TextBox_0.LayoutOrder = v43.ZIndex + v50;
                    if v50 == v40 then
                        l_TextBox_0.Size = UDim2.new(v49, UDim.new());
                    else
                        l_TextBox_0.Size = UDim2.new(v47, UDim.new());
                    end;
                    l_TextBox_0.AutomaticSize = Enum.AutomaticSize.Y;
                    l_TextBox_0.BackgroundColor3 = v1._config.FrameBgColor;
                    l_TextBox_0.BackgroundTransparency = v1._config.FrameBgTransparency;
                    l_TextBox_0.ClearTextOnFocus = false;
                    l_TextBox_0.TextTruncate = Enum.TextTruncate.AtEnd;
                    l_TextBox_0.ClipsDescendants = true;
                    v2.applyFrameStyle(l_TextBox_0);
                    v2.applyTextStyle(l_TextBox_0);
                    v2.UISizeConstraint(l_TextBox_0, Vector2.new(1, 0));
                    l_TextBox_0.Parent = l_Frame_0;
                    l_TextBox_0.FocusLost:Connect(function() --[[ Line: 325 ]]
                        -- upvalues: l_TextBox_0 (copy), v43 (copy), v10 (ref), v50 (copy), v18 (ref), v1 (ref)
                        local v52 = tonumber(l_TextBox_0.Text:match("-?%d*%.?%d*"));
                        if v52 ~= nil then
                            if v43.arguments.Min ~= nil then
                                v52 = math.max(v52, v10(v43.arguments.Min, v50, v43.arguments));
                            end;
                            if v43.arguments.Max ~= nil then
                                v52 = math.min(v52, v10(v43.arguments.Max, v50, v43.arguments));
                            end;
                            if v43.arguments.Increment then
                                v52 = math.round(v52 / v10(v43.arguments.Increment, v50, v43.arguments)) * v10(v43.arguments.Increment, v50, v43.arguments);
                            end;
                            v43.state.number:set(v18(v43.state.number.value, v50, v52, v43.arguments));
                            v43.lastNumberChangedTick = v1._cycleTick + 1;
                        end;
                        local v53 = v43.arguments.Format[v50] or v43.arguments.Format[1];
                        if v43.arguments.Prefix then
                            v53 = v43.arguments.Prefix[v50] .. v53;
                        end;
                        l_TextBox_0.Text = string.format(v53, v10(v43.state.number.value, v50, v43.arguments));
                        v43.state.editingText:set(0);
                    end);
                    l_TextBox_0.Focused:Connect(function() --[[ Line: 352 ]]
                        -- upvalues: l_TextBox_0 (copy), v43 (copy), v50 (copy)
                        l_TextBox_0.CursorPosition = #l_TextBox_0.Text + 1;
                        l_TextBox_0.SelectionStart = 1;
                        v43.state.editingText:set(v50);
                    end);
                end;
                local l_TextLabel_0 = Instance.new("TextLabel");
                l_TextLabel_0.Name = "TextLabel";
                l_TextLabel_0.Size = UDim2.fromOffset(0, v46);
                l_TextLabel_0.BackgroundTransparency = 1;
                l_TextLabel_0.BorderSizePixel = 0;
                l_TextLabel_0.ZIndex = v43.ZIndex + 7;
                l_TextLabel_0.LayoutOrder = v43.ZIndex + 7;
                l_TextLabel_0.AutomaticSize = Enum.AutomaticSize.X;
                v2.applyTextStyle(l_TextLabel_0);
                l_TextLabel_0.Parent = l_Frame_0;
                return l_Frame_0;
            end, 
            Update = function(v55) --[[ Line: 376 ]] --[[ Name: Update ]]
                -- upvalues: v39 (copy), v40 (copy), v23 (ref), v10 (ref), v22 (ref)
                local l_Instance_0 = v55.Instance;
                l_Instance_0.TextLabel.Text = v55.arguments.Text or ("Input %*"):format(v39);
                if v40 == 1 then
                    l_Instance_0.SubButton.Visible = not v55.arguments.NoButtons;
                    l_Instance_0.AddButton.Visible = not v55.arguments.NoButtons;
                end;
                if v55.arguments.Format and typeof(v55.arguments.Format) ~= "table" then
                    v55.arguments.Format = {
                        v55.arguments.Format
                    };
                    return;
                else
                    local v57 = {};
                    for v58 = 1, v40 do
                        local v59 = v23[v39][v58];
                        if v55.arguments.Increment then
                            local v60 = v10(v55.arguments.Increment, v58, v55.arguments);
                            v59 = math.max(v59, math.ceil(-math.log10(v60 == 0 and 1 or v60)), v59);
                        end;
                        if v55.arguments.Max then
                            local v61 = v10(v55.arguments.Max, v58, v55.arguments);
                            v59 = math.max(v59, math.ceil(-math.log10(v61 == 0 and 1 or v61)), v59);
                        end;
                        if v55.arguments.Min then
                            local v62 = v10(v55.arguments.Min, v58, v55.arguments);
                            v59 = math.max(v59, math.ceil(-math.log10(v62 == 0 and 1 or v62)), v59);
                        end;
                        if v59 > 0 then
                            v57[v58] = ("%%.%*f"):format(v59);
                        else
                            v57[v58] = "%d";
                        end;
                    end;
                    v55.arguments.Format = v57;
                    v55.arguments.Prefix = v22[v39];
                    return;
                end;
            end, 
            Discard = function(v63) --[[ Line: 421 ]] --[[ Name: Discard ]]
                -- upvalues: v2 (ref)
                v63.Instance:Destroy();
                v2.discardState(v63);
            end, 
            GenerateState = function(v64) --[[ Line: 425 ]] --[[ Name: GenerateState ]]
                -- upvalues: v1 (ref), v41 (copy)
                if v64.state.number == nil then
                    v64.state.number = v1._widgetState(v64, "number", v41);
                end;
                if v64.state.editingText == nil then
                    v64.state.editingText = v1._widgetState(v64, "editingText", 0);
                end;
            end, 
            UpdateState = function(v65) --[[ Line: 433 ]] --[[ Name: UpdateState ]]
                -- upvalues: v40 (copy), v10 (ref)
                local l_Instance_1 = v65.Instance;
                for v67 = 1, v40 do
                    local l_l_Instance_1_FirstChild_0 = l_Instance_1:FindFirstChild("InputField" .. tostring(v67));
                    local v69 = v65.arguments.Format[v67] or v65.arguments.Format[1];
                    if v65.arguments.Prefix then
                        v69 = v65.arguments.Prefix[v67] .. v69;
                    end;
                    l_l_Instance_1_FirstChild_0.Text = string.format(v69, v10(v65.state.number.value, v67, v65.arguments));
                end;
            end
        };
    end;
    v37 = nil;
    local v70 = nil;
    local v71 = 0;
    local v72 = false;
    local v73 = nil;
    local v74 = 0;
    local v75 = "";
    do
        local l_v71_0, l_v72_0, l_v73_0, l_v74_0, l_v75_0 = v71, v72, v73, v74, v75;
        local function v86() --[[ Line: 461 ]] --[[ Name: updateActiveDrag ]]
            -- upvalues: v2 (copy), l_v71_0 (ref), l_v72_0 (ref), l_v73_0 (ref), l_v75_0 (ref), l_v74_0 (ref), v10 (copy), v19 (copy), v18 (copy), v1 (copy)
            local l_X_0 = v2.getMouseLocation().X;
            local v82 = l_X_0 - l_v71_0;
            l_v71_0 = l_X_0;
            if l_v72_0 == false then
                return;
            elseif l_v73_0 == nil then
                return;
            else
                local l_number_0 = l_v73_0.state.number;
                if l_v75_0 == "Color3" or l_v75_0 == "Color4" then
                    l_number_0 = l_v73_0.state.color;
                    if l_v74_0 == 4 then
                        l_number_0 = l_v73_0.state.transparency;
                    end;
                end;
                local v84 = (l_v73_0.arguments.Increment and v10(l_v73_0.arguments.Increment, l_v74_0, l_v73_0.arguments) or v19[l_v75_0][l_v74_0]) * ((not not v2.UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) or v2.UserInputService:IsKeyDown(Enum.KeyCode.RightShift)) and 10 or 1) * ((not not v2.UserInputService:IsKeyDown(Enum.KeyCode.LeftAlt) or v2.UserInputService:IsKeyDown(Enum.KeyCode.RightAlt)) and 0.1 or 1) * ((not (l_v75_0 ~= "Color3") or l_v75_0 == "Color4") and 5 or 1);
                local v85 = v10(l_number_0.value, l_v74_0, l_v73_0.arguments) + v82 * v84;
                if l_v73_0.arguments.Min ~= nil then
                    v85 = math.max(v85, v10(l_v73_0.arguments.Min, l_v74_0, l_v73_0.arguments));
                end;
                if l_v73_0.arguments.Max ~= nil then
                    v85 = math.min(v85, v10(l_v73_0.arguments.Max, l_v74_0, l_v73_0.arguments));
                end;
                l_number_0:set(v18(l_number_0.value, l_v74_0, v85, l_v73_0.arguments));
                l_v73_0.lastNumberChangedTick = v1._cycleTick + 1;
                return;
            end;
        end;
        local l_v86_0 = v86 --[[ copy: 18 -> 22 ]];
        local function v96(v88, v89, v90, v91, v92) --[[ Line: 502 ]] --[[ Name: DragMouseDown ]]
            -- upvalues: v2 (copy), v1 (copy), l_v72_0 (ref), l_v73_0 (ref), l_v74_0 (ref), l_v75_0 (ref), l_v86_0 (copy)
            local v93 = v2.getTime();
            local v94 = v93 - v88.lastClickedTime < v1._config.MouseDoubleClickTime;
            local v95 = v2.UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) or v2.UserInputService:IsKeyDown(Enum.KeyCode.RightControl);
            if v94 and (Vector2.new(v91, v92) - v88.lastClickedPosition).Magnitude < v1._config.MouseDoubleClickMaxDist or v95 then
                v88.state.editingText:set(v90);
                return;
            else
                v88.lastClickedTime = v93;
                v88.lastClickedPosition = Vector2.new(v91, v92);
                l_v72_0 = true;
                l_v73_0 = v88;
                l_v74_0 = v90;
                l_v75_0 = v89;
                l_v86_0();
                return;
            end;
        end;
        v2.UserInputService.InputChanged:Connect(v86);
        v2.UserInputService.InputEnded:Connect(function(v97) --[[ Line: 525 ]]
            -- upvalues: l_v72_0 (ref), l_v73_0 (ref), l_v74_0 (ref)
            if v97.UserInputType == Enum.UserInputType.MouseButton1 and l_v72_0 then
                l_v72_0 = false;
                l_v73_0 = nil;
                l_v74_0 = 0;
            end;
        end);
        local l_v96_0 = v96 --[[ copy: 19 -> 23 ]];
        v37 = function(v99, v100, v101) --[[ Line: 533 ]] --[[ Name: generateDragScalar ]]
            -- upvalues: v5 (copy), v2 (copy), v1 (copy), v10 (copy), v18 (copy), l_v96_0 (copy), v23 (copy), v22 (copy)
            return {
                hasState = true, 
                hasChildren = false, 
                Args = {
                    Text = 1, 
                    Increment = 2, 
                    Min = 3, 
                    Max = 4, 
                    Format = 5
                }, 
                Events = {
                    numberChanged = v5, 
                    hovered = v2.EVENTS.hover(function(v102) --[[ Line: 546 ]]
                        return v102.Instance;
                    end)
                }, 
                Generate = function(v103) --[[ Line: 550 ]] --[[ Name: Generate ]]
                    -- upvalues: v99 (copy), v2 (ref), v1 (ref), v100 (copy), v10 (ref), v18 (ref), l_v96_0 (ref)
                    v103.lastClickedTime = -1;
                    v103.lastClickedPosition = Vector2.zero;
                    local l_Frame_1 = Instance.new("Frame");
                    l_Frame_1.Name = "Iris_Drag" .. v99;
                    l_Frame_1.Size = UDim2.fromScale(1, 0);
                    l_Frame_1.BackgroundTransparency = 1;
                    l_Frame_1.BorderSizePixel = 0;
                    l_Frame_1.ZIndex = v103.ZIndex;
                    l_Frame_1.LayoutOrder = v103.ZIndex;
                    l_Frame_1.AutomaticSize = Enum.AutomaticSize.Y;
                    v2.UIListLayout(l_Frame_1, Enum.FillDirection.Horizontal, UDim.new(0, v1._config.ItemInnerSpacing.X));
                    local v105 = 0;
                    local v106 = v1._config.TextSize + 2 * v1._config.FramePadding.Y;
                    if v99 == "Color3" or v99 == "Color4" then
                        v105 = v105 + (v1._config.ItemInnerSpacing.X + v106);
                        local l_ImageLabel_0 = Instance.new("ImageLabel");
                        l_ImageLabel_0.Name = "ColorBox";
                        l_ImageLabel_0.BorderSizePixel = 0;
                        l_ImageLabel_0.Size = UDim2.fromOffset(v106, v106);
                        l_ImageLabel_0.ZIndex = v103.ZIndex + 5;
                        l_ImageLabel_0.LayoutOrder = v103.ZIndex + 5;
                        l_ImageLabel_0.Image = v2.ICONS.ALPHA_BACKGROUND_TEXTURE;
                        l_ImageLabel_0.ImageTransparency = 1;
                        v2.applyFrameStyle(l_ImageLabel_0, true, true);
                        l_ImageLabel_0.Parent = l_Frame_1;
                    end;
                    local v108 = UDim.new(v1._config.ContentWidth.Scale / v100, (v1._config.ContentWidth.Offset - v1._config.ItemInnerSpacing.X * (v100 - 1) - v105) / v100);
                    local v109 = UDim.new(v108.Scale * (v100 - 1), v108.Offset * (v100 - 1) + v1._config.ItemInnerSpacing.X * (v100 - 1) + v105);
                    local v110 = v1._config.ContentWidth - v109;
                    for v111 = 1, v100 do
                        local l_TextButton_0 = Instance.new("TextButton");
                        l_TextButton_0.Name = "DragField" .. tostring(v111);
                        l_TextButton_0.ZIndex = v103.ZIndex + v111;
                        l_TextButton_0.LayoutOrder = v103.ZIndex + v111;
                        if v111 == v100 then
                            l_TextButton_0.Size = UDim2.new(v110, UDim.new());
                        else
                            l_TextButton_0.Size = UDim2.new(v108, UDim.new());
                        end;
                        l_TextButton_0.AutomaticSize = Enum.AutomaticSize.Y;
                        l_TextButton_0.BackgroundColor3 = v1._config.FrameBgColor;
                        l_TextButton_0.BackgroundTransparency = v1._config.FrameBgTransparency;
                        l_TextButton_0.AutoButtonColor = false;
                        l_TextButton_0.Text = "";
                        l_TextButton_0.ClipsDescendants = true;
                        v2.applyFrameStyle(l_TextButton_0);
                        v2.applyTextStyle(l_TextButton_0);
                        v2.UISizeConstraint(l_TextButton_0, Vector2.new(1, 0));
                        l_TextButton_0.TextXAlignment = Enum.TextXAlignment.Center;
                        l_TextButton_0.Parent = l_Frame_1;
                        v2.applyInteractionHighlights(l_TextButton_0, l_TextButton_0, {
                            ButtonColor = v1._config.FrameBgColor, 
                            ButtonTransparency = v1._config.FrameBgTransparency, 
                            ButtonHoveredColor = v1._config.FrameBgHoveredColor, 
                            ButtonHoveredTransparency = v1._config.FrameBgHoveredTransparency, 
                            ButtonActiveColor = v1._config.FrameBgActiveColor, 
                            ButtonActiveTransparency = v1._config.FrameBgActiveTransparency
                        });
                        local l_TextBox_1 = Instance.new("TextBox");
                        l_TextBox_1.Name = "InputField";
                        l_TextBox_1.ZIndex = v103.ZIndex + 5;
                        l_TextBox_1.LayoutOrder = v103.ZIndex + 2;
                        l_TextBox_1.Size = UDim2.new(1, 0, 1, 0);
                        l_TextBox_1.BackgroundTransparency = 1;
                        l_TextBox_1.ClearTextOnFocus = false;
                        l_TextBox_1.TextTruncate = Enum.TextTruncate.AtEnd;
                        l_TextBox_1.ClipsDescendants = true;
                        l_TextBox_1.Visible = false;
                        v2.applyFrameStyle(l_TextBox_1, true);
                        v2.applyTextStyle(l_TextBox_1);
                        l_TextBox_1.Parent = l_TextButton_0;
                        l_TextBox_1.FocusLost:Connect(function() --[[ Line: 648 ]]
                            -- upvalues: l_TextBox_1 (copy), v103 (copy), v99 (ref), v111 (copy), v10 (ref), v18 (ref), v1 (ref)
                            local v114 = tonumber(l_TextBox_1.Text:match("-?%d*%.?%d*"));
                            local l_number_1 = v103.state.number;
                            if v99 == "Color4" and v111 == 4 then
                                l_number_1 = v103.state.transparency;
                            elseif v99 == "Color3" or v99 == "Color4" then
                                l_number_1 = v103.state.color;
                            end;
                            if v114 ~= nil then
                                if v99 == "Color3" or v99 == "Color4" and not v103.arguments.UseFloats then
                                    v114 = v114 / 255;
                                end;
                                if v103.arguments.Min ~= nil then
                                    v114 = math.max(v114, v10(v103.arguments.Min, v111, v103.arguments));
                                end;
                                if v103.arguments.Max ~= nil then
                                    v114 = math.min(v114, v10(v103.arguments.Max, v111, v103.arguments));
                                end;
                                if v103.arguments.Increment then
                                    v114 = math.round(v114 / v10(v103.arguments.Increment, v111, v103.arguments)) * v10(v103.arguments.Increment, v111, v103.arguments);
                                end;
                                l_number_1:set(v18(l_number_1.value, v111, v114, v103.arguments));
                                v103.lastNumberChangedTick = v1._cycleTick + 1;
                            end;
                            local v116 = v10(l_number_1.value, v111, v103.arguments);
                            if v99 == "Color3" or v99 == "Color4" and not v103.arguments.UseFloats then
                                v116 = math.round(v116 * 255);
                            end;
                            local v117 = v103.arguments.Format[v111] or v103.arguments.Format[1];
                            if v103.arguments.Prefix then
                                v117 = v103.arguments.Prefix[v111] .. v117;
                            end;
                            l_TextBox_1.Text = string.format(v117, v116);
                            v103.state.editingText:set(0);
                            l_TextBox_1:ReleaseFocus(true);
                        end);
                        l_TextBox_1.Focused:Connect(function() --[[ Line: 691 ]]
                            -- upvalues: l_TextBox_1 (copy), v103 (copy), v111 (copy)
                            l_TextBox_1.CursorPosition = #l_TextBox_1.Text + 1;
                            l_TextBox_1.SelectionStart = 1;
                            v103.state.editingText:set(v111);
                        end);
                        l_TextButton_0.MouseButton1Down:Connect(function(v118, v119) --[[ Line: 699 ]]
                            -- upvalues: l_v96_0 (ref), v103 (copy), v99 (ref), v111 (copy)
                            l_v96_0(v103, v99, v111, v118, v119);
                        end);
                    end;
                    local l_TextLabel_1 = Instance.new("TextLabel");
                    l_TextLabel_1.Name = "TextLabel";
                    l_TextLabel_1.Size = UDim2.fromOffset(0, v106);
                    l_TextLabel_1.BackgroundTransparency = 1;
                    l_TextLabel_1.BorderSizePixel = 0;
                    l_TextLabel_1.ZIndex = v103.ZIndex + 5;
                    l_TextLabel_1.LayoutOrder = v103.ZIndex + 5;
                    l_TextLabel_1.AutomaticSize = Enum.AutomaticSize.X;
                    v2.applyTextStyle(l_TextLabel_1);
                    l_TextLabel_1.Parent = l_Frame_1;
                    return l_Frame_1;
                end, 
                Update = function(v121) --[[ Line: 719 ]] --[[ Name: Update ]]
                    -- upvalues: v99 (copy), v100 (copy), v23 (ref), v10 (ref), v22 (ref)
                    v121.Instance.TextLabel.Text = v121.arguments.Text or ("Drag %*"):format(v99);
                    if v121.arguments.Format and typeof(v121.arguments.Format) ~= "table" then
                        v121.arguments.Format = {
                            v121.arguments.Format
                        };
                        return;
                    else
                        if not v121.arguments.Format then
                            local v122 = {};
                            for v123 = 1, v100 do
                                local v124 = v23[v99][v123];
                                if v121.arguments.Increment then
                                    local v125 = v10(v121.arguments.Increment, v123, v121.arguments);
                                    v124 = math.max(v124, math.ceil(-math.log10(v125 == 0 and 1 or v125)), v124);
                                end;
                                if v121.arguments.Max then
                                    local v126 = v10(v121.arguments.Max, v123, v121.arguments);
                                    v124 = math.max(v124, math.ceil(-math.log10(v126 == 0 and 1 or v126)), v124);
                                end;
                                if v121.arguments.Min then
                                    local v127 = v10(v121.arguments.Min, v123, v121.arguments);
                                    v124 = math.max(v124, math.ceil(-math.log10(v127 == 0 and 1 or v127)), v124);
                                end;
                                if v124 > 0 then
                                    v122[v123] = ("%%.%*f"):format(v124);
                                else
                                    v122[v123] = "%d";
                                end;
                            end;
                            v121.arguments.Format = v122;
                            v121.arguments.Prefix = v22[v99];
                        end;
                        return;
                    end;
                end, 
                Discard = function(v128) --[[ Line: 759 ]] --[[ Name: Discard ]]
                    -- upvalues: v2 (ref)
                    v128.Instance:Destroy();
                    v2.discardState(v128);
                end, 
                GenerateState = function(v129) --[[ Line: 763 ]] --[[ Name: GenerateState ]]
                    -- upvalues: v1 (ref), v101 (copy)
                    if v129.state.number == nil then
                        v129.state.number = v1._widgetState(v129, "number", v101);
                    end;
                    if v129.state.editingText == nil then
                        v129.state.editingText = v1._widgetState(v129, "editingText", false);
                    end;
                end, 
                UpdateState = function(v130) --[[ Line: 771 ]] --[[ Name: UpdateState ]]
                    -- upvalues: v100 (copy), v99 (copy), v10 (ref), v1 (ref)
                    local l_Instance_2 = v130.Instance;
                    for v132 = 1, v100 do
                        local l_number_2 = v130.state.number;
                        if v99 == "Color3" or v99 == "Color4" then
                            l_number_2 = v130.state.color;
                            if v132 == 4 then
                                l_number_2 = v130.state.transparency;
                            end;
                        end;
                        local l_l_Instance_2_FirstChild_0 = l_Instance_2:FindFirstChild("DragField" .. tostring(v132));
                        local l_InputField_0 = l_l_Instance_2_FirstChild_0.InputField;
                        local v136 = v10(l_number_2.value, v132, v130.arguments);
                        if (v99 == "Color3" or v99 == "Color4") and not v130.arguments.UseFloats then
                            v136 = math.round(v136 * 255);
                        end;
                        local v137 = v130.arguments.Format[v132] or v130.arguments.Format[1];
                        if v130.arguments.Prefix then
                            v137 = v130.arguments.Prefix[v132] .. v137;
                        end;
                        l_l_Instance_2_FirstChild_0.Text = string.format(v137, v136);
                        l_InputField_0.Text = tostring(v136);
                        if v130.state.editingText.value == v132 then
                            l_InputField_0.Visible = true;
                            l_InputField_0:CaptureFocus();
                            l_l_Instance_2_FirstChild_0.TextTransparency = 1;
                        else
                            l_InputField_0.Visible = false;
                            l_l_Instance_2_FirstChild_0.TextTransparency = v1._config.TextTransparency;
                        end;
                    end;
                    if v99 == "Color3" or v99 == "Color4" then
                        local l_ColorBox_0 = l_Instance_2.ColorBox;
                        l_ColorBox_0.BackgroundColor3 = v130.state.color.value;
                        if v99 == "Color4" then
                            l_ColorBox_0.ImageTransparency = 1 - v130.state.transparency.value;
                        end;
                    end;
                end
            };
        end;
        v70 = function(v139, ...) --[[ Line: 819 ]] --[[ Name: generateColorDragScalar ]]
            -- upvalues: v37 (ref), v2 (copy), v22 (copy), v1 (copy)
            local v140 = {
                ...
            };
            local v141 = v37(v139, v139 == "Color4" and 4 or 3, v140[1]);
            return v2.extend(v141, {
                Args = {
                    Text = 1, 
                    UseFloats = 2, 
                    UseHSV = 3, 
                    Format = 4
                }, 
                Update = function(v142) --[[ Line: 830 ]] --[[ Name: Update ]]
                    -- upvalues: v139 (copy), v22 (ref), v1 (ref)
                    v142.Instance.TextLabel.Text = v142.arguments.Text or ("Drag %*"):format(v139);
                    if v142.arguments.Format and typeof(v142.arguments.Format) ~= "table" then
                        v142.arguments.Format = {
                            v142.arguments.Format
                        };
                    else
                        if v142.arguments.UseFloats then
                            v142.arguments.Format = {
                                "%.3f"
                            };
                        else
                            v142.arguments.Format = {
                                "%d"
                            };
                        end;
                        v142.arguments.Prefix = v22[v139 .. (v142.arguments.UseHSV and "_HSV" or "_RGB")];
                    end;
                    v142.arguments.Min = {
                        0, 
                        0, 
                        0, 
                        0
                    };
                    v142.arguments.Max = {
                        1, 
                        1, 
                        1, 
                        1
                    };
                    v142.arguments.Increment = {
                        0.001, 
                        0.001, 
                        0.001, 
                        0.001
                    };
                    if v142.state then
                        v1._widgets[v142.type].UpdateState(v142);
                    end;
                end, 
                GenerateState = function(v143) --[[ Line: 857 ]] --[[ Name: GenerateState ]]
                    -- upvalues: v1 (ref), v140 (copy), v139 (copy)
                    if v143.state.color == nil then
                        v143.state.color = v1._widgetState(v143, "color", v140[1]);
                    end;
                    if v139 == "Color4" and v143.state.transparency == nil then
                        v143.state.transparency = v1._widgetState(v143, "transparency", v140[2]);
                    end;
                    if v143.state.editingText == nil then
                        v143.state.editingText = v1._widgetState(v143, "editingText", false);
                    end;
                end
            });
        end;
    end;
    v71 = nil;
    v72 = nil;
    v73 = false;
    v74 = nil;
    v75 = 0;
    local v144 = "";
    do
        local l_v73_1, l_v74_1, l_v75_1, l_v144_0 = v73, v74, v75, v144;
        local function v156() --[[ Line: 885 ]] --[[ Name: updateActiveSlider ]]
            -- upvalues: l_v73_1 (ref), l_v74_1 (ref), l_v75_1 (ref), v10 (copy), v19 (copy), l_v144_0 (ref), v20 (copy), v21 (copy), v1 (copy), v2 (copy), v18 (copy)
            if l_v73_1 == false then
                return;
            elseif l_v74_1 == nil then
                return;
            else
                local l_FirstChild_0 = l_v74_1.Instance:FindFirstChild("SliderField" .. tostring(l_v75_1));
                local v150 = l_v74_1.arguments.Increment and v10(l_v74_1.arguments.Increment, l_v75_1, l_v74_1.arguments) or v19[l_v144_0][l_v75_1];
                local v151 = l_v74_1.arguments.Min and v10(l_v74_1.arguments.Min, l_v75_1, l_v74_1.arguments) or v20[l_v144_0][l_v75_1];
                local v152 = l_v74_1.arguments.Max and v10(l_v74_1.arguments.Max, l_v75_1, l_v74_1.arguments) or v21[l_v144_0][l_v75_1];
                local l_X_1 = v1._config.FramePadding.X;
                local v154 = math.floor(((v150 < 1 and 0 or 1) + v152 - v151) / v150);
                local v155 = math.clamp(math.floor((v2.getMouseLocation().X - (l_FirstChild_0.AbsolutePosition.X + l_X_1)) / (l_FirstChild_0.AbsoluteSize.X - l_X_1 * 2) * v154) * v150 + v151, v151, v152);
                l_v74_1.state.number:set(v18(l_v74_1.state.number.value, l_v75_1, v155, l_v74_1.arguments));
                l_v74_1.lastNumberChangedTick = v1._cycleTick + 1;
                return;
            end;
        end;
        local function v160(v157, v158, v159) --[[ Line: 915 ]] --[[ Name: SliderMouseDown ]]
            -- upvalues: v2 (copy), l_v73_1 (ref), l_v74_1 (ref), l_v75_1 (ref), l_v144_0 (ref), v156 (copy)
            if v2.UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) or v2.UserInputService:IsKeyDown(Enum.KeyCode.RightControl) then
                v157.state.editingText:set(v159);
                return;
            else
                l_v73_1 = true;
                l_v74_1 = v157;
                l_v75_1 = v159;
                l_v144_0 = v158;
                v156();
                return;
            end;
        end;
        v2.UserInputService.InputChanged:Connect(v156);
        v2.UserInputService.InputEnded:Connect(function(v161) --[[ Line: 931 ]]
            -- upvalues: l_v73_1 (ref), l_v74_1 (ref), l_v75_1 (ref), l_v144_0 (ref)
            if v161.UserInputType == Enum.UserInputType.MouseButton1 and l_v73_1 then
                l_v73_1 = false;
                l_v74_1 = nil;
                l_v75_1 = 0;
                l_v144_0 = "";
            end;
        end);
        v71 = function(v162, v163, v164, ...) --[[ Line: 940 ]] --[[ Name: generateSliderScalar ]]
            -- upvalues: v5 (copy), v2 (copy), v1 (copy), v10 (copy), v18 (copy), v160 (copy), v23 (copy), v22 (copy), v19 (copy), v20 (copy), v21 (copy)
            return {
                hasState = true, 
                hasChildren = false, 
                Args = {
                    Text = 1, 
                    Increment = 2, 
                    Min = 3, 
                    Max = 4, 
                    Format = 5
                }, 
                Events = {
                    numberChanged = v5, 
                    hovered = v2.EVENTS.hover(function(v165) --[[ Line: 953 ]]
                        return v165.Instance;
                    end)
                }, 
                Generate = function(v166) --[[ Line: 957 ]] --[[ Name: Generate ]]
                    -- upvalues: v162 (copy), v2 (ref), v1 (ref), v163 (copy), v10 (ref), v18 (ref), v160 (ref)
                    local l_Frame_2 = Instance.new("Frame");
                    l_Frame_2.Name = "Iris_Slider" .. v162;
                    l_Frame_2.Size = UDim2.fromScale(1, 0);
                    l_Frame_2.BackgroundTransparency = 1;
                    l_Frame_2.BorderSizePixel = 0;
                    l_Frame_2.ZIndex = v166.ZIndex;
                    l_Frame_2.LayoutOrder = v166.ZIndex;
                    l_Frame_2.AutomaticSize = Enum.AutomaticSize.Y;
                    v2.UIListLayout(l_Frame_2, Enum.FillDirection.Horizontal, UDim.new(0, v1._config.ItemInnerSpacing.X));
                    local v168 = v1._config.TextSize + 2 * v1._config.FramePadding.Y;
                    local v169 = UDim.new(v1._config.ContentWidth.Scale / v163, (v1._config.ContentWidth.Offset - v1._config.ItemInnerSpacing.X * (v163 - 1)) / v163);
                    local v170 = UDim.new(v169.Scale * (v163 - 1), v169.Offset * (v163 - 1) + v1._config.ItemInnerSpacing.X * (v163 - 1));
                    local v171 = v1._config.ContentWidth - v170;
                    for v172 = 1, v163 do
                        local l_TextButton_1 = Instance.new("TextButton");
                        l_TextButton_1.Name = "SliderField" .. tostring(v172);
                        l_TextButton_1.ZIndex = v166.ZIndex + v172;
                        l_TextButton_1.LayoutOrder = v166.ZIndex + v172;
                        if v172 == v163 then
                            l_TextButton_1.Size = UDim2.new(v171, UDim.new());
                        else
                            l_TextButton_1.Size = UDim2.new(v169, UDim.new());
                        end;
                        l_TextButton_1.AutomaticSize = Enum.AutomaticSize.Y;
                        l_TextButton_1.BackgroundColor3 = v1._config.FrameBgColor;
                        l_TextButton_1.BackgroundTransparency = v1._config.FrameBgTransparency;
                        l_TextButton_1.AutoButtonColor = false;
                        l_TextButton_1.Text = "";
                        l_TextButton_1.ClipsDescendants = true;
                        v2.applyFrameStyle(l_TextButton_1);
                        v2.applyTextStyle(l_TextButton_1);
                        v2.UISizeConstraint(l_TextButton_1, Vector2.new(1, 0));
                        l_TextButton_1.Parent = l_Frame_2;
                        local l_TextLabel_2 = Instance.new("TextLabel");
                        l_TextLabel_2.Name = "OverlayText";
                        l_TextLabel_2.Size = UDim2.fromScale(1, 1);
                        l_TextLabel_2.BackgroundTransparency = 1;
                        l_TextLabel_2.BorderSizePixel = 0;
                        l_TextLabel_2.ZIndex = v166.ZIndex + 10;
                        l_TextLabel_2.ClipsDescendants = true;
                        v2.applyTextStyle(l_TextLabel_2);
                        l_TextLabel_2.TextXAlignment = Enum.TextXAlignment.Center;
                        l_TextLabel_2.Parent = l_TextButton_1;
                        v2.applyInteractionHighlights(l_TextButton_1, l_TextButton_1, {
                            ButtonColor = v1._config.FrameBgColor, 
                            ButtonTransparency = v1._config.FrameBgTransparency, 
                            ButtonHoveredColor = v1._config.FrameBgHoveredColor, 
                            ButtonHoveredTransparency = v1._config.FrameBgHoveredTransparency, 
                            ButtonActiveColor = v1._config.FrameBgActiveColor, 
                            ButtonActiveTransparency = v1._config.FrameBgActiveTransparency
                        });
                        local l_TextBox_2 = Instance.new("TextBox");
                        l_TextBox_2.Name = "InputField";
                        l_TextBox_2.ZIndex = v166.ZIndex + 5;
                        l_TextBox_2.LayoutOrder = v166.ZIndex + 2;
                        l_TextBox_2.Size = UDim2.new(1, 0, 1, 0);
                        l_TextBox_2.BackgroundTransparency = 1;
                        l_TextBox_2.ClearTextOnFocus = false;
                        l_TextBox_2.TextTruncate = Enum.TextTruncate.AtEnd;
                        l_TextBox_2.ClipsDescendants = true;
                        l_TextBox_2.Visible = false;
                        v2.applyFrameStyle(l_TextBox_2, true);
                        v2.applyTextStyle(l_TextBox_2);
                        l_TextBox_2.Parent = l_TextButton_1;
                        l_TextBox_2.FocusLost:Connect(function() --[[ Line: 1045 ]]
                            -- upvalues: l_TextBox_2 (copy), v166 (copy), v10 (ref), v172 (copy), v18 (ref), v1 (ref)
                            local v176 = tonumber(l_TextBox_2.Text:match("-?%d*%.?%d*"));
                            if v176 ~= nil then
                                if v166.arguments.Min ~= nil then
                                    v176 = math.max(v176, v10(v166.arguments.Min, v172, v166.arguments));
                                end;
                                if v166.arguments.Max ~= nil then
                                    v176 = math.min(v176, v10(v166.arguments.Max, v172, v166.arguments));
                                end;
                                if v166.arguments.Increment then
                                    v176 = math.round(v176 / v10(v166.arguments.Increment, v172, v166.arguments)) * v10(v166.arguments.Increment, v172, v166.arguments);
                                end;
                                v166.state.number:set(v18(v166.state.number.value, v172, v176, v166.arguments));
                                v166.lastNumberChangedTick = v1._cycleTick + 1;
                            end;
                            local v177 = v166.arguments.Format[v172] or v166.arguments.Format[1];
                            if v166.arguments.Prefix then
                                v177 = v166.arguments.Prefix[v172] .. v177;
                            end;
                            l_TextBox_2.Text = string.format(v177, v10(v166.state.number.value, v172, v166.arguments));
                            v166.state.editingText:set(0);
                            l_TextBox_2:ReleaseFocus(true);
                        end);
                        l_TextBox_2.Focused:Connect(function() --[[ Line: 1075 ]]
                            -- upvalues: l_TextBox_2 (copy), v166 (copy), v172 (copy)
                            l_TextBox_2.CursorPosition = #l_TextBox_2.Text + 1;
                            l_TextBox_2.SelectionStart = 1;
                            v166.state.editingText:set(v172);
                        end);
                        l_TextButton_1.MouseButton1Down:Connect(function() --[[ Line: 1083 ]]
                            -- upvalues: v160 (ref), v166 (copy), v162 (ref), v172 (copy)
                            v160(v166, v162, v172);
                        end);
                        local l_Frame_3 = Instance.new("Frame");
                        l_Frame_3.Name = "GrabBar";
                        l_Frame_3.ZIndex = v166.ZIndex + 5;
                        l_Frame_3.LayoutOrder = v166.ZIndex + 5;
                        l_Frame_3.AnchorPoint = Vector2.new(0, 0.5);
                        l_Frame_3.Position = UDim2.new(0, 0, 0.5, 0);
                        l_Frame_3.BorderSizePixel = 0;
                        l_Frame_3.BackgroundColor3 = v1._config.SliderGrabColor;
                        l_Frame_3.Transparency = v1._config.SliderGrabTransparency;
                        if v1._config.GrabRounding > 0 then
                            v2.UICorner(l_Frame_3, v1._config.GrabRounding);
                        end;
                        l_Frame_3.Parent = l_TextButton_1;
                    end;
                    local l_TextLabel_3 = Instance.new("TextLabel");
                    l_TextLabel_3.Name = "TextLabel";
                    l_TextLabel_3.Size = UDim2.fromOffset(0, v168);
                    l_TextLabel_3.BackgroundTransparency = 1;
                    l_TextLabel_3.BorderSizePixel = 0;
                    l_TextLabel_3.ZIndex = v166.ZIndex + 5;
                    l_TextLabel_3.LayoutOrder = v166.ZIndex + 5;
                    l_TextLabel_3.AutomaticSize = Enum.AutomaticSize.X;
                    v2.applyTextStyle(l_TextLabel_3);
                    l_TextLabel_3.Parent = l_Frame_2;
                    return l_Frame_2;
                end, 
                Update = function(v180) --[[ Line: 1118 ]] --[[ Name: Update ]]
                    -- upvalues: v162 (copy), v163 (copy), v23 (ref), v10 (ref), v22 (ref), v19 (ref), v20 (ref), v21 (ref), v1 (ref)
                    local l_Instance_3 = v180.Instance;
                    l_Instance_3.TextLabel.Text = v180.arguments.Text or ("Slider %*"):format(v162);
                    if v180.arguments.Format and typeof(v180.arguments.Format) ~= "table" then
                        v180.arguments.Format = {
                            v180.arguments.Format
                        };
                    else
                        local v182 = {};
                        for v183 = 1, v163 do
                            local v184 = v23[v162][v183];
                            if v180.arguments.Increment then
                                local v185 = v10(v180.arguments.Increment, v183, v180.arguments);
                                v184 = math.max(v184, math.ceil(-math.log10(v185 == 0 and 1 or v185)), v184);
                            end;
                            if v180.arguments.Max then
                                local v186 = v10(v180.arguments.Max, v183, v180.arguments);
                                v184 = math.max(v184, math.ceil(-math.log10(v186 == 0 and 1 or v186)), v184);
                            end;
                            if v180.arguments.Min then
                                local v187 = v10(v180.arguments.Min, v183, v180.arguments);
                                v184 = math.max(v184, math.ceil(-math.log10(v187 == 0 and 1 or v187)), v184);
                            end;
                            if v184 > 0 then
                                v182[v183] = ("%%.%*f"):format(v184);
                            else
                                v182[v183] = "%d";
                            end;
                        end;
                        v180.arguments.Format = v182;
                        v180.arguments.Prefix = v22[v162];
                    end;
                    for v188 = 1, v163 do
                        local l_l_Instance_3_FirstChild_0 = l_Instance_3:FindFirstChild("SliderField" .. tostring(v188));
                        local l_GrabBar_0 = l_l_Instance_3_FirstChild_0.GrabBar;
                        local v191 = v180.arguments.Increment and v10(v180.arguments.Increment, v188, v180.arguments) or v19[v162][v188];
                        local v192 = v180.arguments.Min and v10(v180.arguments.Min, v188, v180.arguments) or v20[v162][v188];
                        local v193 = math.max(1 / math.floor(((v180.arguments.Max and v10(v180.arguments.Max, v188, v180.arguments) or v21[v162][v188]) + 1 - v192) / v191), v1._config.GrabMinSize / l_l_Instance_3_FirstChild_0.AbsoluteSize.X);
                        l_GrabBar_0.Size = UDim2.new(v193, 0, 1, 0);
                    end;
                end, 
                Discard = function(v194) --[[ Line: 1176 ]] --[[ Name: Discard ]]
                    -- upvalues: v2 (ref)
                    v194.Instance:Destroy();
                    v2.discardState(v194);
                end, 
                GenerateState = function(v195) --[[ Line: 1180 ]] --[[ Name: GenerateState ]]
                    -- upvalues: v1 (ref), v164 (copy)
                    if v195.state.number == nil then
                        v195.state.number = v1._widgetState(v195, "number", v164);
                    end;
                    if v195.state.editingText == nil then
                        v195.state.editingText = v1._widgetState(v195, "editingText", false);
                    end;
                end, 
                UpdateState = function(v196) --[[ Line: 1188 ]] --[[ Name: UpdateState ]]
                    -- upvalues: v163 (copy), v10 (ref), v19 (ref), v162 (copy), v20 (ref), v21 (ref), v1 (ref)
                    local l_Instance_4 = v196.Instance;
                    for v198 = 1, v163 do
                        local l_l_Instance_4_FirstChild_0 = l_Instance_4:FindFirstChild("SliderField" .. tostring(v198));
                        local l_InputField_1 = l_l_Instance_4_FirstChild_0.InputField;
                        local l_OverlayText_0 = l_l_Instance_4_FirstChild_0.OverlayText;
                        local l_GrabBar_1 = l_l_Instance_4_FirstChild_0.GrabBar;
                        local v203 = v10(v196.state.number.value, v198, v196.arguments);
                        local v204 = v196.arguments.Format[v198] or v196.arguments.Format[1];
                        if v196.arguments.Prefix then
                            v204 = v196.arguments.Prefix[v198] .. v204;
                        end;
                        l_OverlayText_0.Text = string.format(v204, v203);
                        l_InputField_1.Text = tostring(v203);
                        local v205 = v196.arguments.Increment and v10(v196.arguments.Increment, v198, v196.arguments) or v19[v162][v198];
                        local v206 = v196.arguments.Min and v10(v196.arguments.Min, v198, v196.arguments) or v20[v162][v198];
                        local v207 = v196.arguments.Max and v10(v196.arguments.Max, v198, v196.arguments) or v21[v162][v198];
                        local l_X_2 = v1._config.FramePadding.X;
                        local v209 = math.floor(((v205 < 1 and 0 or 1) + v207 - v206) / v205);
                        local v210 = (v203 - v206) / (v207 - v206);
                        local v211 = 1 - l_GrabBar_1.AbsoluteSize.X / (l_l_Instance_4_FirstChild_0.AbsoluteSize.X - l_X_2 * 2);
                        local v212 = math.clamp(math.floor(v210 * v209) / v209, 0, v211);
                        l_GrabBar_1.Position = UDim2.new(v212, 0, 0.5, 0);
                        if v196.state.editingText.value == v198 then
                            l_InputField_1.Visible = true;
                            l_OverlayText_0.Visible = false;
                            l_GrabBar_1.Visible = false;
                            l_InputField_1:CaptureFocus();
                        else
                            l_InputField_1.Visible = false;
                            l_OverlayText_0.Visible = true;
                            l_GrabBar_1.Visible = true;
                        end;
                    end;
                end
            };
        end;
        v72 = function(v213, v214) --[[ Line: 1238 ]] --[[ Name: generateEnumSliderScalar ]]
            -- upvalues: v71 (ref), v2 (copy), v1 (copy)
            local v215 = v71("Enum", 1, v214.Value);
            local v216 = {
                string
            };
            for _, v218 in v213:GetEnumItems() do
                v216[v218.Value] = v218.Name;
            end;
            return v2.extend(v215, {
                Args = {
                    Text = 1
                }, 
                Update = function(v219) --[[ Line: 1250 ]] --[[ Name: Update ]]
                    -- upvalues: v213 (copy), v1 (ref)
                    local l_Instance_5 = v219.Instance;
                    l_Instance_5.TextLabel.Text = v219.arguments.Text or "Input Enum";
                    v219.arguments.Increment = 1;
                    v219.arguments.Min = 0;
                    v219.arguments.Max = #v213:GetEnumItems() - 1;
                    local l_SliderField1_0 = l_Instance_5:FindFirstChild("SliderField1");
                    local l_GrabBar_2 = l_SliderField1_0.GrabBar;
                    local v223 = math.max(1 / math.floor(#v213:GetEnumItems()), v1._config.GrabMinSize / l_SliderField1_0.AbsoluteSize.X);
                    l_GrabBar_2.Size = UDim2.new(v223, 0, 1, 0);
                end, 
                GenerateState = function(v224) --[[ Line: 1266 ]] --[[ Name: GenerateState ]]
                    -- upvalues: v1 (ref), v214 (copy)
                    if v224.state.number == nil then
                        v224.state.number = v1._widgetState(v224, "number", v214.Value);
                    end;
                    if v224.state.enumItem == nil then
                        v224.state.enumItem = v1._widgetState(v224, "enumItem", v214);
                    end;
                    if v224.state.editingText == nil then
                        v224.state.editingText = v1._widgetState(v224, "editingText", false);
                    end;
                end
            });
        end;
    end;
    v73 = v24("Num", 1, 0);
    v73.Args.NoButtons = 6;
    v1.WidgetConstructor("InputNum", v73);
    v1.WidgetConstructor("InputVector2", v24("Vector2", 2, Vector2.zero));
    v1.WidgetConstructor("InputVector3", v24("Vector3", 3, (Vector3.new(0, 0, 0, 0))));
    v1.WidgetConstructor("InputUDim", v24("UDim", 2, UDim.new()));
    v1.WidgetConstructor("InputUDim2", v24("UDim2", 4, UDim2.new()));
    v1.WidgetConstructor("InputRect", v24("Rect", 4, Rect.new(0, 0, 0, 0)));
    v1.WidgetConstructor("DragNum", v37("Num", 1, 0));
    v1.WidgetConstructor("DragVector2", v37("Vector2", 2, Vector2.zero));
    v1.WidgetConstructor("DragVector3", v37("Vector3", 3, (Vector3.new(0, 0, 0, 0))));
    v1.WidgetConstructor("DragUDim", v37("UDim", 2, UDim.new()));
    v1.WidgetConstructor("DragUDim2", v37("UDim2", 4, UDim2.new()));
    v1.WidgetConstructor("DragRect", v37("Rect", 4, Rect.new(0, 0, 0, 0)));
    v1.WidgetConstructor("InputColor3", v70("Color3", Color3.fromRGB(0, 0, 0)));
    v1.WidgetConstructor("InputColor4", v70("Color4", Color3.fromRGB(0, 0, 0), 0));
    v1.WidgetConstructor("SliderNum", v71("Num", 1, 0));
    v1.WidgetConstructor("SliderVector2", v71("Vector2", 2, Vector2.zero));
    v1.WidgetConstructor("SliderVector3", v71("Vector3", 3, (Vector3.new(0, 0, 0, 0))));
    v1.WidgetConstructor("SliderUDim", v71("UDim", 2, UDim.new()));
    v1.WidgetConstructor("SliderUDim2", v71("UDim2", 4, UDim2.new()));
    v1.WidgetConstructor("SliderRect", v71("Rect", 4, Rect.new(0, 0, 0, 0)));
    v1.WidgetConstructor("InputText", {
        hasState = true, 
        hasChildren = false, 
        Args = {
            Text = 1, 
            TextHint = 2
        }, 
        Events = {
            textChanged = {
                Init = function(v225) --[[ Line: 1319 ]]
                    v225.lastTextchangeTick = 0;
                end, 
                Get = function(v226) --[[ Line: 1322 ]]
                    -- upvalues: v1 (copy)
                    return v226.lastTextchangeTick == v1._cycleTick;
                end
            }, 
            hovered = v2.EVENTS.hover(function(v227) --[[ Line: 1326 ]]
                return v227.Instance;
            end)
        }, 
        Generate = function(v228) --[[ Line: 1330 ]] --[[ Name: Generate ]]
            -- upvalues: v1 (copy), v2 (copy)
            local l_Frame_4 = Instance.new("Frame");
            l_Frame_4.Name = "Iris_InputText";
            l_Frame_4.Size = UDim2.new(v1._config.ContentWidth, UDim.new(0, 0));
            l_Frame_4.BackgroundTransparency = 1;
            l_Frame_4.BorderSizePixel = 0;
            l_Frame_4.ZIndex = v228.ZIndex;
            l_Frame_4.LayoutOrder = v228.ZIndex;
            l_Frame_4.AutomaticSize = Enum.AutomaticSize.Y;
            v2.UIListLayout(l_Frame_4, Enum.FillDirection.Horizontal, UDim.new(0, v1._config.ItemInnerSpacing.X));
            local l_TextBox_3 = Instance.new("TextBox");
            l_TextBox_3.Name = "InputField";
            l_TextBox_3.Size = UDim2.new(1, 0, 0, 0);
            l_TextBox_3.AutomaticSize = Enum.AutomaticSize.Y;
            l_TextBox_3.BackgroundColor3 = v1._config.FrameBgColor;
            l_TextBox_3.BackgroundTransparency = v1._config.FrameBgTransparency;
            l_TextBox_3.Text = "";
            l_TextBox_3.PlaceholderColor3 = v1._config.TextDisabledColor;
            l_TextBox_3.TextTruncate = Enum.TextTruncate.AtEnd;
            l_TextBox_3.ClearTextOnFocus = false;
            l_TextBox_3.ZIndex = v228.ZIndex + 1;
            l_TextBox_3.LayoutOrder = v228.ZIndex + 1;
            l_TextBox_3.ClipsDescendants = true;
            v2.applyFrameStyle(l_TextBox_3);
            v2.applyTextStyle(l_TextBox_3);
            v2.UISizeConstraint(l_TextBox_3, Vector2.new(1, 0));
            l_TextBox_3.Parent = l_Frame_4;
            l_TextBox_3.FocusLost:Connect(function() --[[ Line: 1362 ]]
                -- upvalues: v228 (copy), l_TextBox_3 (copy), v1 (ref)
                v228.state.text:set(l_TextBox_3.Text);
                v228.lastTextchangeTick = v1._cycleTick + 1;
            end);
            local v231 = v1._config.TextSize + v1._config.FramePadding.Y * 2;
            local l_TextLabel_4 = Instance.new("TextLabel");
            l_TextLabel_4.Name = "TextLabel";
            l_TextLabel_4.Size = UDim2.fromOffset(0, v231);
            l_TextLabel_4.AutomaticSize = Enum.AutomaticSize.X;
            l_TextLabel_4.BackgroundTransparency = 1;
            l_TextLabel_4.BorderSizePixel = 0;
            l_TextLabel_4.ZIndex = v228.ZIndex + 4;
            l_TextLabel_4.LayoutOrder = v228.ZIndex + 4;
            v2.applyTextStyle(l_TextLabel_4);
            l_TextLabel_4.Parent = l_Frame_4;
            return l_Frame_4;
        end, 
        Update = function(v233) --[[ Line: 1384 ]] --[[ Name: Update ]]
            local l_Instance_6 = v233.Instance;
            local l_TextLabel_5 = l_Instance_6.TextLabel;
            local l_InputField_2 = l_Instance_6.InputField;
            l_TextLabel_5.Text = v233.arguments.Text or "Input Text";
            l_InputField_2.PlaceholderText = v233.arguments.TextHint or "";
        end, 
        Discard = function(v237) --[[ Line: 1392 ]] --[[ Name: Discard ]]
            -- upvalues: v2 (copy)
            v237.Instance:Destroy();
            v2.discardState(v237);
        end, 
        GenerateState = function(v238) --[[ Line: 1396 ]] --[[ Name: GenerateState ]]
            -- upvalues: v1 (copy)
            if v238.state.text == nil then
                v238.state.text = v1._widgetState(v238, "text", "");
            end;
        end, 
        UpdateState = function(v239) --[[ Line: 1401 ]] --[[ Name: UpdateState ]]
            v239.Instance.InputField.Text = v239.state.text.value;
        end
    });
end;