local _ = require(script.Parent.Types);
return function(v1) --[[ Line: 3 ]]
    local v2 = v1.State(true);
    local v3 = v1.State(false);
    local v4 = v1.State(false);
    local v5 = v1.State(false);
    local v6 = v1.State(false);
    local v7 = v1.State(false);
    local function v10(v8) --[[ Line: 12 ]] --[[ Name: helpMarker ]]
        -- upvalues: v1 (copy)
        v1.PushConfig({
            TextColor = v1._config.TextDisabledColor
        });
        local v9 = v1.Text({
            "(?)"
        });
        v1.PopConfig();
        v1.PushConfig({
            ContentWidth = UDim.new(0, 350)
        });
        if v9.hovered() then
            v1.Tooltip({
                v8
            });
        end;
        v1.PopConfig();
    end;
    local v42 = {
        Basic = function() --[[ Line: 26 ]] --[[ Name: Basic ]]
            -- upvalues: v1 (copy)
            v1.Tree({
                "Basic"
            });
            v1.SeparatorText({
                "Basic"
            });
            local v11 = v1.State(1);
            v1.Button({
                "Button"
            });
            v1.SmallButton({
                "SmallButton"
            });
            v1.Text({
                "Text"
            });
            v1.TextWrapped({
                string.rep("Text Wrapped ", 5)
            });
            v1.TextColored({
                "Colored Text", 
                Color3.fromRGB(255, 128, 0)
            });
            v1.Text({
                "Rich Text: <b>bold text</b> <i>italic text</i> <u>underline text</u> <s>strikethrough text</s> <font color= \"rgb(240, 40, 10)\">red text</font> <font size=\"32\">bigger text</font>", 
                true, 
                nil, 
                true
            });
            v1.SameLine();
            v1.RadioButton({
                "Index '1'", 
                1
            }, {
                index = v11
            });
            v1.RadioButton({
                "Index 'two'", 
                "two"
            }, {
                index = v11
            });
            if v1.RadioButton({
                "Index 'false'", 
                false
            }, {
                index = v11
            }).active() == false and v1.SmallButton({
                "Select last"
            }).clicked() then
                v11:set(false);
            end;
            v1.End();
            v1.Text({
                "The Index is: " .. tostring(v11.value)
            });
            v1.SeparatorText({
                "Inputs"
            });
            v1.InputNum({});
            v1.DragNum({});
            v1.SliderNum({});
            v1.End();
        end, 
        Tree = function() --[[ Line: 57 ]] --[[ Name: Tree ]]
            -- upvalues: v1 (copy), v10 (copy)
            v1.Tree({
                "Trees"
            });
            v1.Tree({
                "Tree using SpanAvailWidth"; 
                [v1.Args.Tree.SpanAvailWidth] = true
            });
            v10("SpanAvailWidth determines if the Tree is selectable from its entire with, or only the text area");
            v1.End();
            local v12 = v1.Tree({
                "Tree with Children"
            });
            v1.Text({
                "Im inside the first tree!"
            });
            v1.Button({
                "Im a button inside the first tree!"
            });
            v1.Tree({
                "Im a tree inside the first tree!"
            });
            v1.Text({
                "I am the innermost text!"
            });
            v1.End();
            v1.End();
            v1.Checkbox({
                "Toggle above tree"
            }, {
                isChecked = v12.state.isUncollapsed
            });
            v1.End();
        end, 
        CollapsingHeader = function() --[[ Line: 76 ]] --[[ Name: CollapsingHeader ]]
            -- upvalues: v1 (copy)
            v1.Tree({
                "Collapsing Headers"
            });
            v1.CollapsingHeader({
                "A header"
            });
            v1.Text({
                "This is under the first header!"
            });
            v1.End();
            local v13 = v1.State(true);
            v1.CollapsingHeader({
                "Another header"
            }, {
                isUncollapsed = v13
            });
            if v1.Button({
                "Shhh... secret button!"
            }).clicked() then
                v13:set(true);
            end;
            v1.End();
            v1.End();
        end, 
        Group = function() --[[ Line: 91 ]] --[[ Name: Group ]]
            -- upvalues: v1 (copy)
            v1.Tree({
                "Groups"
            });
            v1.SameLine();
            v1.Group();
            v1.Text({
                "I am in group A"
            });
            v1.Button({
                "Im also in A"
            });
            v1.End();
            v1.Separator();
            v1.Group();
            v1.Text({
                "I am in group B"
            });
            v1.Button({
                "Im also in B"
            });
            v1.Button({
                "Also group B"
            });
            v1.End();
            v1.End();
            v1.End();
        end, 
        Indent = function() --[[ Line: 110 ]] --[[ Name: Indent ]]
            -- upvalues: v1 (copy)
            v1.Tree({
                "Indents"
            });
            v1.Text({
                "Not Indented"
            });
            v1.Indent();
            v1.Text({
                "Indented"
            });
            v1.Indent({
                7
            });
            v1.Text({
                "Indented by 7 more pixels"
            });
            v1.End();
            v1.Indent({
                -7
            });
            v1.Text({
                "Indented by 7 less pixels"
            });
            v1.End();
            v1.End();
            v1.End();
        end, 
        Input = function() --[[ Line: 126 ]] --[[ Name: Input ]]
            -- upvalues: v1 (copy), v10 (copy)
            v1.Tree({
                "Input"
            });
            local v14 = v1.State(false);
            local v15 = v1.State(false);
            local v16 = v1.State(0);
            local v17 = v1.State(100);
            local v18 = v1.State(1);
            local v19 = v1.State("%d");
            v1.PushConfig({
                ContentWidth = UDim.new(1, -120)
            });
            local v20 = v1.InputNum({
                "Input Number"; 
                [v1.Args.InputNum.NoButtons] = v15.value, 
                [v1.Args.InputNum.Min] = v16.value, 
                [v1.Args.InputNum.Max] = v17.value, 
                [v1.Args.InputNum.Increment] = v18.value, 
                [v1.Args.InputNum.Format] = {
                    v19.value
                }
            });
            v1.PopConfig();
            v1.Text({
                "The Value is: " .. v20.number.value
            });
            if v1.Button({
                "Randomize Number"
            }).clicked() then
                v20.number:set(math.random(1, 99));
            end;
            local v21 = v1.Checkbox({
                "NoField"
            }, {
                isChecked = v14
            });
            local v22 = v1.Checkbox({
                "NoButtons"
            }, {
                isChecked = v15
            });
            if v21.checked() and v22.isChecked.value == true then
                v22.isChecked:set(false);
            end;
            if v22.checked() and v21.isChecked.value == true then
                v21.isChecked:set(false);
            end;
            v1.PushConfig({
                ContentWidth = UDim.new(1, -120)
            });
            v1.InputVector2({
                "InputVector2"
            });
            v1.InputVector3({
                "InputVector3"
            });
            v1.InputUDim({
                "InputUDim"
            });
            v1.InputUDim2({
                "InputUDim2"
            });
            local v23 = v1.State(false);
            local v24 = v1.State(false);
            local v25 = v1.State(Color3.new());
            local v26 = v1.State(0);
            v1.SliderNum({
                "Transparency", 
                0.01, 
                0, 
                1
            }, {
                number = v26
            });
            v1.InputColor3({
                "InputColor3", 
                v23:get(), 
                v24:get()
            }, {
                color = v25
            });
            v1.InputColor4({
                "InputColor4", 
                v23:get(), 
                v24:get()
            }, {
                color = v25, 
                transparency = v26
            });
            v1.SameLine();
            v1.Text({
                v25:get():ToHex()
            });
            v1.Checkbox({
                "Use Floats"
            }, {
                isChecked = v23
            });
            v1.Checkbox({
                "Use HSV"
            }, {
                isChecked = v24
            });
            v1.End();
            v1.PopConfig();
            v1.Separator();
            v1.SameLine();
            v1.Text({
                "Slider Numbers"
            });
            v10("ctrl + click slider number widgets to input a number");
            v1.End();
            v1.PushConfig({
                ContentWidth = UDim.new(1, -120)
            });
            v1.SliderNum({
                "Slide Int", 
                1, 
                1, 
                8
            });
            v1.SliderNum({
                "Slide Float", 
                0.01, 
                0, 
                100
            });
            v1.SliderNum({
                "Small Numbers", 
                0.001, 
                -2, 
                1, 
                "%f radians"
            });
            v1.SliderNum({
                "Odd Ranges", 
                0.001, 
                -3.141592653589793, 
                3.141592653589793, 
                "%f radians"
            });
            v1.SliderNum({
                "Big Numbers", 
                10000, 
                100000, 
                10000000
            });
            v1.SliderNum({
                "Few Numbers", 
                1, 
                0, 
                3
            });
            v1.PopConfig();
            v1.Separator();
            v1.SameLine();
            v1.Text({
                "Drag Numbers"
            });
            v10("ctrl + click or double click drag number widgets to input a number, hold shift/alt while dragging to increase/decrease speed");
            v1.End();
            v1.PushConfig({
                ContentWidth = UDim.new(1, -120)
            });
            v1.DragNum({
                "Drag Int"
            });
            v1.DragNum({
                "Slide Float", 
                0.001, 
                -10, 
                10
            });
            v1.DragNum({
                "Percentage", 
                1, 
                0, 
                100, 
                "%d %%"
            });
            v1.PopConfig();
            v1.End();
        end, 
        InputText = function() --[[ Line: 203 ]] --[[ Name: InputText ]]
            -- upvalues: v1 (copy)
            v1.Tree({
                "Input Text"
            });
            v1.PushConfig({
                ContentWidth = UDim.new(0, 250)
            });
            local v27 = v1.InputText({
                "Input Text Test"; 
                [v1.Args.InputText.TextHint] = "Input Text here"
            });
            v1.PopConfig();
            v1.Text({
                "The text is: " .. v27.text.value
            });
            v1.End();
        end, 
        MultiInput = function() --[[ Line: 212 ]] --[[ Name: MultiInput ]]
            -- upvalues: v1 (copy)
            v1.Tree({
                "Multi-Component Input"
            });
            local v28 = v1.State(Vector2.new());
            local v29 = v1.State((Vector3.new()));
            local v30 = v1.State(UDim.new());
            local v31 = v1.State(UDim2.new());
            local v32 = v1.State(Color3.new());
            local v33 = v1.State(Rect.new(0, 0));
            v1.SeparatorText({
                "Input"
            });
            v1.InputVector2({}, {
                number = v28
            });
            v1.InputVector3({}, {
                number = v29
            });
            v1.InputUDim({}, {
                number = v30
            });
            v1.InputUDim2({}, {
                number = v31
            });
            v1.InputRect({}, {
                number = v33
            });
            v1.SeparatorText({
                "Drag"
            });
            v1.DragVector2({}, {
                number = v28
            });
            v1.DragVector3({}, {
                number = v29
            });
            v1.DragUDim({}, {
                number = v30
            });
            v1.DragUDim2({}, {
                number = v31
            });
            v1.DragRect({}, {
                number = v33
            });
            v1.SeparatorText({
                "Slider"
            });
            v1.SliderVector2({}, {
                number = v28
            });
            v1.SliderVector3({}, {
                number = v29
            });
            v1.SliderUDim({}, {
                number = v30
            });
            v1.SliderUDim2({}, {
                number = v31
            });
            v1.SliderRect({}, {
                number = v33
            });
            v1.SeparatorText({
                "Color"
            });
            v1.InputColor3({}, {
                color = v32
            });
            v1.InputColor4({}, {
                color = v32
            });
            v1.End();
        end, 
        Tooltip = function() --[[ Line: 254 ]] --[[ Name: Tooltip ]]
            -- upvalues: v1 (copy)
            v1.PushConfig({
                ContentWidth = UDim.new(0, 250)
            });
            v1.Tree({
                "Tooltip"
            });
            if v1.Text({
                "Hover over me to reveal a tooltip"
            }).hovered() then
                v1.Tooltip({
                    "I am some helpful tooltip text"
                });
            end;
            local v34 = v1.State("Hello ");
            local v35 = v1.State(1);
            if v1.InputNum({
                "# of repeat", 
                1, 
                1, 
                50
            }, {
                number = v35
            }).numberChanged() then
                v34:set(string.rep("Hello ", v35:get()));
            end;
            if v1.Checkbox({
                "Show dynamic text tooltip"
            }).isChecked.value then
                v1.Tooltip({
                    v34:get()
                });
            end;
            v1.End();
            v1.PopConfig();
        end, 
        Selectable = function() --[[ Line: 272 ]] --[[ Name: Selectable ]]
            -- upvalues: v1 (copy)
            v1.Tree({
                "Selectable"
            });
            local v36 = v1.State(2);
            v1.Selectable({
                "Selectable #1", 
                1
            }, {
                index = v36
            });
            v1.Selectable({
                "Selectable #2", 
                2
            }, {
                index = v36
            });
            if v1.Selectable({
                "Double click Selectable", 
                3, 
                true
            }, {
                index = v36
            }).doubleClicked() then
                v36:set(3);
            end;
            v1.Selectable({
                "Impossible to select", 
                4, 
                true
            }, {
                index = v36
            });
            if v1.Button({
                "Select last"
            }).clicked() then
                v36:set(4);
            end;
            v1.Selectable({
                "Independent Selectable"
            });
            v1.End();
        end, 
        Combo = function() --[[ Line: 288 ]] --[[ Name: Combo ]]
            -- upvalues: v1 (copy)
            v1.Tree({
                "Combo"
            });
            v1.PushConfig({
                ContentWidth = UDim.new(1, -120)
            });
            local v37 = v1.State("No Selection");
            v1.SameLine();
            local v38 = v1.Checkbox({
                "No Preview"
            });
            local v39 = v1.Checkbox({
                "No Button"
            });
            if v38.checked() and v39.isChecked.value == true then
                v39.isChecked:set(false);
            end;
            if v39.checked() and v38.isChecked.value == true then
                v38.isChecked:set(false);
            end;
            v1.End();
            v1.Combo({
                "Basic Usage", 
                v39.isChecked:get(), 
                v38.isChecked:get()
            }, {
                index = v37
            });
            v1.Selectable({
                "Select 1", 
                "One"
            }, {
                index = v37
            });
            v1.Selectable({
                "Select 2", 
                "Two"
            }, {
                index = v37
            });
            v1.Selectable({
                "Select 3", 
                "Three"
            }, {
                index = v37
            });
            v1.End();
            v1.ComboArray({
                "Using ComboArray"
            }, {
                index = "No Selection"
            }, {
                "Red", 
                "Green", 
                "Blue"
            });
            local v40 = v1.State("7 AM");
            v1.Combo({
                "Combo with Inner widgets"
            }, {
                index = v40
            });
            v1.Tree({
                "Morning Shifts"
            });
            v1.Selectable({
                "Shift at 7 AM", 
                "7 AM"
            }, {
                index = v40
            });
            v1.Selectable({
                "Shift at 11 AM", 
                "11 AM"
            }, {
                index = v40
            });
            v1.Selectable({
                "Shist at 3 PM", 
                "3 PM"
            }, {
                index = v40
            });
            v1.End();
            v1.Tree({
                "Night Shifts"
            });
            v1.Selectable({
                "Shift at 6 PM", 
                "6 PM"
            }, {
                index = v40
            });
            v1.Selectable({
                "Shift at 9 PM", 
                "9 PM"
            }, {
                index = v40
            });
            v1.End();
            v1.End();
            local v41 = v1.ComboEnum({
                "Using ComboEnum"
            }, {
                index = Enum.UserInputState.Begin
            }, Enum.UserInputState);
            v1.Text({
                "Selected: " .. v41.index:get().Name
            });
            v1.PopConfig();
            v1.End();
        end
    };
    local v43 = {
        "Basic", 
        "Tree", 
        "CollapsingHeader", 
        "Group", 
        "Indent", 
        "Input", 
        "MultiInput", 
        "InputText", 
        "Tooltip", 
        "Selectable", 
        "Combo"
    };
    local function v44() --[[ Line: 331 ]] --[[ Name: recursiveTree ]]
        -- upvalues: v1 (copy), v44 (copy)
        if v1.Tree({
            "Recursive Tree"
        }).state.isUncollapsed.value then
            v44();
        end;
        v1.End();
    end;
    local function v45(v46) --[[ Line: 339 ]] --[[ Name: recursiveWindow ]]
        -- upvalues: v1 (copy), v45 (copy)
        v1.Window({
            "Recursive Window"
        }, {
            size = v1.State(Vector2.new(175, 100)), 
            isOpened = v46
        });
        local v47 = v1.Checkbox({
            "Recurse Again"
        });
        v1.End();
        if v47.isChecked.value then
            v45(v47.isChecked);
        end;
    end;
    local function v73() --[[ Line: 349 ]] --[[ Name: runtimeInfo ]]
        -- upvalues: v1 (copy), v4 (copy), v10 (copy)
        local v48 = v1.Window({
            "Runtime Info"
        }, {
            isOpened = v4
        });
        local l__lastVDOM_0 = v1.Internal._lastVDOM;
        local l__states_0 = v1.Internal._states;
        local v51 = v1.State(3);
        local v52 = v1.State(0);
        local v53 = v1.State(os.clock());
        v1.SameLine();
        v1.InputNum({
            ""; 
            [v1.Args.InputNum.Format] = "%d Seconds", 
            [v1.Args.InputNum.Max] = 10
        }, {
            number = v51
        });
        if v1.Button({
            "Disable"
        }).clicked() then
            v1.Disabled = true;
            task.delay(v51:get(), function() --[[ Line: 362 ]]
                -- upvalues: v1 (ref)
                v1.Disabled = false;
            end);
        end;
        v1.End();
        local v54 = os.clock();
        local v55 = v54 - v53.value;
        v52.value = v52.value + (v55 - v52.value) * 0.2;
        v53.value = v54;
        v1.Text({
            string.format("Average %.3f ms/frame (%.1f FPS)", v52.value * 1000, 1 / v52.value)
        });
        v1.Text({
            string.format("Window Position: (%d, %d), Window Size: (%d, %d)", v48.position.value.X, v48.position.value.Y, v48.size.value.X, v48.size.value.Y)
        });
        v1.SameLine();
        v1.Text({
            "Enter an ID to learn more about it."
        });
        v10("every widget and state has an ID which Iris tracks to remember which widget is which. below lists all widgets and states, with their respective IDs");
        v1.End();
        v1.PushConfig({
            ItemWidth = UDim.new(1, -150)
        });
        local l_value_0 = v1.InputText({
            "ID field"
        }, {
            text = v1.State(v48.ID)
        }).text.value;
        v1.PopConfig();
        v1.Indent();
        local v57 = l__lastVDOM_0[l_value_0];
        local v58 = l__states_0[l_value_0];
        if v57 then
            v1.Table({
                1; 
                [v1.Args.Table.RowBg] = false
            });
            v1.Text({
                string.format("The ID, \"%s\", is a widget", l_value_0)
            });
            v1.NextRow();
            v1.Text({
                string.format("Widget is type: %s", v57.type)
            });
            v1.NextRow();
            v1.Tree({
                "Widget has Args:"
            }, {
                isUncollapsed = v1.State(true)
            });
            for v59, v60 in v57.arguments do
                v1.Text({
                    v59 .. " - " .. tostring(v60)
                });
            end;
            v1.End();
            v1.NextRow();
            if v57.state then
                v1.Tree({
                    "Widget has State:"
                }, {
                    isUncollapsed = v1.State(true)
                });
                for v61, v62 in v57.state do
                    v1.Text({
                        v61 .. " - " .. tostring(v62.value)
                    });
                end;
                v1.End();
            end;
            v1.End();
        elseif v58 then
            v1.Table({
                1; 
                [v1.Args.Table.RowBg] = false
            });
            v1.Text({
                string.format("The ID, \"%s\", is a state", l_value_0)
            });
            v1.NextRow();
            v1.Text({
                string.format("Value is type: %s, Value = %s", typeof(v58.value), (tostring(v58.value)))
            });
            v1.NextRow();
            v1.Tree({
                "state has connected widgets:"
            }, {
                isUncollapsed = v1.State(true)
            });
            for v63, v64 in v58.ConnectedWidgets do
                v1.Text({
                    v63 .. " - " .. v64.type
                });
            end;
            v1.End();
            v1.NextRow();
            v1.Text({
                string.format("state has: %d connected functions", #v58.ConnectedFunctions)
            });
            v1.End();
        else
            v1.Text({
                string.format("The ID, \"%s\", is not a state or widget", l_value_0)
            });
        end;
        v1.End();
        if v1.Tree({
            "Widgets"
        }).isUncollapsed.value then
            local v65 = 0;
            local v66 = "";
            for _, v68 in l__lastVDOM_0 do
                v65 = v65 + 1;
                v66 = v66 .. "\n" .. v68.ID .. " - " .. v68.type;
            end;
            v1.Text({
                "Number of Widgets: " .. v65
            });
            v1.Text({
                v66
            });
        end;
        v1.End();
        if v1.Tree({
            "States"
        }).isUncollapsed.value then
            local v69 = 0;
            local v70 = "";
            for v71, v72 in l__states_0 do
                v69 = v69 + 1;
                v70 = v70 .. "\n" .. v71 .. " - " .. tostring(v72.value);
            end;
            v1.Text({
                "Number of States: " .. v69
            });
            v1.Text({
                v70
            });
        end;
        v1.End();
        v1.End();
    end;
    local function v74() --[[ Line: 464 ]] --[[ Name: recursiveMenu ]]
        -- upvalues: v1 (copy), v74 (copy)
        if v1.Menu({
            "Recursive"
        }).state.isOpened.value then
            v1.MenuItem({
                "New", 
                Enum.KeyCode.N, 
                Enum.ModifierKey.Ctrl
            });
            v1.MenuItem({
                "Open", 
                Enum.KeyCode.O, 
                Enum.ModifierKey.Ctrl
            });
            v1.MenuItem({
                "Save", 
                Enum.KeyCode.S, 
                Enum.ModifierKey.Ctrl
            });
            v1.Separator();
            v1.MenuToggle({
                "Autosave"
            });
            v1.MenuToggle({
                "Checked"
            });
            v1.Separator();
            v1.Menu({
                "Options"
            });
            v1.MenuItem({
                "Red"
            });
            v1.MenuItem({
                "Yellow"
            });
            v1.MenuItem({
                "Green"
            });
            v1.MenuItem({
                "Blue"
            });
            v1.Separator();
            v74();
            v1.End();
        end;
        v1.End();
    end;
    local function v75() --[[ Line: 488 ]] --[[ Name: mainMenuBar ]]
        -- upvalues: v1 (copy), v74 (copy), v3 (copy), v6 (copy), v7 (copy), v4 (copy), v5 (copy)
        v1.MenuBar();
        v1.Menu({
            "File"
        });
        v1.MenuItem({
            "New", 
            Enum.KeyCode.N, 
            Enum.ModifierKey.Ctrl
        });
        v1.MenuItem({
            "Open", 
            Enum.KeyCode.O, 
            Enum.ModifierKey.Ctrl
        });
        v1.MenuItem({
            "Save", 
            Enum.KeyCode.S, 
            Enum.ModifierKey.Ctrl
        });
        v74();
        v1.MenuItem({
            "Quit", 
            Enum.KeyCode.Q, 
            Enum.ModifierKey.Alt
        });
        v1.End();
        v1.Menu({
            "Examples"
        });
        v1.MenuToggle({
            "Recursive Window"
        }, {
            isChecked = v3
        });
        v1.MenuToggle({
            "Windowless"
        }, {
            isChecked = v6
        });
        v1.MenuToggle({
            "Main Menu Bar"
        }, {
            isChecked = v7
        });
        v1.End();
        v1.Menu({
            "Tools"
        });
        v1.MenuToggle({
            "Runtime Info"
        }, {
            isChecked = v4
        });
        v1.MenuToggle({
            "Style Editor"
        }, {
            isChecked = v5
        });
        v1.End();
        v1.End();
    end;
    local _ = function() --[[ Line: 511 ]] --[[ Name: mainMenuBarExample ]]
        -- upvalues: v1 (copy), v75 (copy)
        local _ = v1.Internal._rootWidget.Instance.PseudoWindowScreenGui.AbsoluteSize;
        v75();
    end;
    local v78 = nil;
    v78 = function() --[[ Line: 526 ]]
        -- upvalues: v1 (copy), v5 (copy)
        local v79 = v1.State(1);
        local v100 = {
            {
                "Sizing", 
                function() --[[ Line: 532 ]]
                    -- upvalues: v1 (ref)
                    local v80 = v1.State({});
                    if v1.Button({
                        "Update Config"
                    }).clicked() then
                        v1.UpdateGlobalConfig(v80:get());
                        v80:set({});
                    end;
                    for _, v82 in {
                        {
                            "ItemWidth", 
                            nil, 
                            UDim.new(), 
                            UDim.new(1, 200)
                        }, 
                        {
                            "ContentWidth", 
                            nil, 
                            UDim.new(), 
                            UDim.new(1, 200)
                        }
                    } do
                        local v83 = v1.SliderUDim({
                            table.unpack(v82)
                        }, {
                            number = v1.WeakState(v1._config[v82[1]])
                        });
                        if v83.numberChanged() then
                            v80:get()[v82[1]] = v83.number:get();
                        end;
                    end;
                    for _, v85 in {
                        {
                            "WindowPadding", 
                            nil, 
                            Vector2.zero, 
                            Vector2.one * 20
                        }, 
                        {
                            "WindowResizePadding", 
                            nil, 
                            Vector2.zero, 
                            Vector2.one * 20
                        }, 
                        {
                            "FramePadding", 
                            nil, 
                            Vector2.zero, 
                            Vector2.one * 20
                        }, 
                        {
                            "ItemSpacing", 
                            nil, 
                            Vector2.zero, 
                            Vector2.one * 20
                        }, 
                        {
                            "ItemInnerSpacing", 
                            nil, 
                            Vector2.zero, 
                            Vector2.one * 20
                        }, 
                        {
                            "CellPadding", 
                            nil, 
                            Vector2.zero, 
                            Vector2.one * 20
                        }, 
                        {
                            "DisplaySafeAreaPadding", 
                            nil, 
                            Vector2.zero, 
                            Vector2.one * 20
                        }
                    } do
                        local v86 = v1.SliderVector2({
                            table.unpack(v85)
                        }, {
                            number = v1.WeakState(v1._config[v85[1]])
                        });
                        if v86.numberChanged() then
                            v80:get()[v85[1]] = v86.number:get();
                        end;
                    end;
                    for _, v88 in {
                        {
                            "TextSize", 
                            1, 
                            4, 
                            20
                        }, 
                        {
                            "FrameBorderSize", 
                            0.1, 
                            0, 
                            1
                        }, 
                        {
                            "FrameRounding", 
                            1, 
                            0, 
                            12
                        }, 
                        {
                            "GrabRounding", 
                            1, 
                            0, 
                            12
                        }, 
                        {
                            "WindowBorderSize", 
                            0.1, 
                            0, 
                            1
                        }, 
                        {
                            "PopupBorderSize", 
                            0.1, 
                            0, 
                            1
                        }, 
                        {
                            "PopupRounding", 
                            1, 
                            0, 
                            12
                        }, 
                        {
                            "ScrollbarSize", 
                            1, 
                            0, 
                            20
                        }, 
                        {
                            "GrabMinSize", 
                            1, 
                            0, 
                            20
                        }
                    } do
                        local v89 = v1.SliderNum({
                            table.unpack(v88)
                        }, {
                            number = v1.WeakState(v1._config[v88[1]])
                        });
                        if v89.numberChanged() then
                            v80:get()[v88[1]] = v89.number:get();
                        end;
                    end;
                    for _, v91 in {
                        "WindowTitleAlign"
                    } do
                        local v92 = v1.ComboEnum({
                            v91
                        }, {
                            index = v1.WeakState(v1._config[v91])
                        }, v1._config[v91].EnumType);
                        if v92.closed() then
                            v1.UpdateGlobalConfig({
                                [v91] = v92.index:get()
                            });
                        end;
                    end;
                end
            }, 
            {
                "Colors", 
                function() --[[ Line: 599 ]]
                    -- upvalues: v1 (ref)
                    local v93 = v1.State({});
                    if v1.Button({
                        "Update Config"
                    }).clicked() then
                        v1.UpdateGlobalConfig(v93:get());
                        v93:set({});
                    end;
                    for _, v95 in {
                        "BorderColor", 
                        "BorderActiveColor"
                    } do
                        local v96 = v1.InputColor3({
                            v95
                        }, {
                            color = v1.WeakState(v1._config[v95])
                        });
                        if v96.numberChanged() then
                            v1.UpdateGlobalConfig({
                                [v95] = v96.color:get()
                            });
                        end;
                    end;
                    for _, v98 in {
                        "Text", 
                        "TextDisabled", 
                        "WindowBg", 
                        "ScrollbarGrab", 
                        "TitleBg", 
                        "TitleBgActive", 
                        "TitleBgCollapsed", 
                        "MenubarBg", 
                        "FrameBg", 
                        "FrameBgHovered", 
                        "FrameBgActive", 
                        "Button", 
                        "ButtonHovered", 
                        "ButtonActive", 
                        "SliderGrab", 
                        "SliderGrabActive", 
                        "Header", 
                        "HeaderHovered", 
                        "HeaderActive", 
                        "SelectionImageObject", 
                        "SelectionImageObjectBorder", 
                        "TableBorderStrong", 
                        "TableBorderLight", 
                        "TableRowBg", 
                        "TableRowBgAlt", 
                        "NavWindowingHighlight", 
                        "NavWindowingDimBg", 
                        "Separator", 
                        "CheckMark"
                    } do
                        local v99 = v1.InputColor4({
                            v98
                        }, {
                            color = v1.WeakState(v1._config[v98 .. "Color"]), 
                            transparency = v1.WeakState(v1._config[v98 .. "Transparency"])
                        });
                        if v99.numberChanged() then
                            v93:get()[v98 .. "Color"] = v99.color:get();
                            v93:get()[v98 .. "Transparency"] = v99.transparency:get();
                        end;
                    end;
                end
            }
        };
        v1.Window({
            "Style Editor"
        }, {
            isOpened = v5
        });
        v1.Text({
            "Customize the look of Iris in realtime."
        });
        v1.SameLine();
        if v1.SmallButton({
            "Light Theme"
        }).clicked() then
            v1.UpdateGlobalConfig(v1.TemplateConfig.colorLight);
        end;
        if v1.SmallButton({
            "Dark Theme"
        }).clicked() then
            v1.UpdateGlobalConfig(v1.TemplateConfig.colorDark);
        end;
        v1.End();
        v1.SameLine();
        if v1.SmallButton({
            "Classic Size"
        }).clicked() then
            v1.UpdateGlobalConfig(v1.TemplateConfig.sizeDefault);
        end;
        if v1.SmallButton({
            "Larger Size"
        }).clicked() then
            v1.UpdateGlobalConfig(v1.TemplateConfig.sizeClear);
        end;
        v1.End();
        if v1.SmallButton({
            "Reset Everything"
        }).clicked() then
            v1.UpdateGlobalConfig(v1.TemplateConfig.colorDark);
            v1.UpdateGlobalConfig(v1.TemplateConfig.sizeDefault);
        end;
        v1.Separator();
        v1.SameLine();
        for v101, v102 in ipairs(v100) do
            v1.RadioButton({
                v102[1], 
                v101
            }, {
                index = v79
            });
        end;
        v1.End();
        v100[v79:get()][2]();
        v1.End();
    end;
    local function v108() --[[ Line: 699 ]] --[[ Name: widgetEventInteractivity ]]
        -- upvalues: v1 (copy)
        v1.CollapsingHeader({
            "Widget Event Interactivity"
        });
        local v103 = v1.State(0);
        if v1.Button({
            "Click to increase Number"
        }).clicked() then
            v103:set(v103:get() + 1);
        end;
        v1.Text({
            "The Number is: " .. v103:get()
        });
        v1.Separator();
        local v104 = v1.State(false);
        local v105 = v1.State("clicked");
        v1.SameLine();
        v1.RadioButton({
            "clicked", 
            "clicked"
        }, {
            index = v105
        });
        v1.RadioButton({
            "rightClicked", 
            "rightClicked"
        }, {
            index = v105
        });
        v1.RadioButton({
            "doubleClicked", 
            "doubleClicked"
        }, {
            index = v105
        });
        v1.RadioButton({
            "ctrlClicked", 
            "ctrlClicked"
        }, {
            index = v105
        });
        v1.End();
        v1.SameLine();
        if v1.Button({
            v105:get() .. " to reveal text"
        })[v105:get()]() then
            v104:set(not v104:get());
        end;
        if v104:get() then
            v1.Text({
                "Here i am!"
            });
        end;
        v1.End();
        v1.Separator();
        local v106 = v1.State(0);
        v1.SameLine();
        if v1.Button({
            "Click to show text for 20 frames"
        }).clicked() then
            v106:set(20);
        end;
        if v106:get() > 0 then
            v1.Text({
                "Here i am!"
            });
        end;
        v1.End();
        v106:set((math.max(0, v106:get() - 1)));
        v1.Text({
            "Text Timer: " .. v106:get()
        });
        local v107 = v1.Checkbox({
            "Event-tracked checkbox"
        });
        v1.Indent();
        v1.Text({
            "unchecked: " .. tostring(v107.unchecked())
        });
        v1.Text({
            "checked: " .. tostring(v107.checked())
        });
        v1.End();
        v1.SameLine();
        if v1.Button({
            "Hover over me"
        }).hovered() then
            v1.Text({
                "The button is hovered"
            });
        end;
        v1.End();
        v1.End();
    end;
    local function v121() --[[ Line: 755 ]] --[[ Name: widgetStateInteractivity ]]
        -- upvalues: v1 (copy)
        v1.CollapsingHeader({
            "Widget State Interactivity"
        });
        local v109 = v1.Checkbox({
            "Widget-Generated State"
        });
        v1.Text({
            (("isChecked: %*\n"):format(v109.state.isChecked.value))
        });
        local v110 = v1.State(false);
        local v111 = v1.Checkbox({
            "User-Generated State"
        }, {
            isChecked = v110
        });
        v1.Text({
            (("isChecked: %*\n"):format(v111.state.isChecked.value))
        });
        local v112 = v1.Checkbox({
            "Widget Coupled State"
        });
        local v113 = v1.Checkbox({
            "Coupled to above Checkbox"
        }, {
            isChecked = v112.state.isChecked
        });
        v1.Text({
            (("isChecked: %*\n"):format(v113.state.isChecked.value))
        });
        local v114 = v1.State(false);
        local _ = v1.Checkbox({
            "Widget and Code Coupled State"
        }, {
            isChecked = v114
        });
        if v1.Button({
            "Click to toggle above checkbox"
        }).clicked() then
            v114:set(not v114:get());
        end;
        v1.Text({
            (("isChecked: %*\n"):format(v114.value))
        });
        local v116 = v1.State(true);
        local v118 = v1.ComputedState(v116, function(v117) --[[ Line: 777 ]]
            return not v117;
        end);
        local _ = v1.Checkbox({
            "ComputedState (dynamic coupling)"
        }, {
            isChecked = v116
        });
        local _ = v1.Checkbox({
            "Inverted of above checkbox"
        }, {
            isChecked = v118
        });
        v1.Text({
            (("isChecked: %*\n"):format(v118.value))
        });
        v1.End();
    end;
    local function v123() --[[ Line: 787 ]] --[[ Name: dynamicStyle ]]
        -- upvalues: v1 (copy), v10 (copy)
        v1.CollapsingHeader({
            "Dynamic Styles"
        });
        local v122 = v1.State(0);
        v1.SameLine();
        if v1.Button({
            "Change Color"
        }).clicked() then
            v122:set(math.random());
        end;
        v1.Text({
            "Hue: " .. math.floor(v122:get() * 255)
        });
        v10("Using PushConfig with a changing value, this can be done with any config field");
        v1.End();
        v1.PushConfig({
            TextColor = Color3.fromHSV(v122:get(), 1, 1)
        });
        v1.Text({
            "Text with a unique and changable color"
        });
        v1.PopConfig();
        v1.End();
    end;
    local function v136() --[[ Line: 803 ]] --[[ Name: tablesDemo ]]
        -- upvalues: v1 (copy), v10 (copy)
        local v124 = v1.State(false);
        v1.CollapsingHeader({
            "Tables & Columns"
        }, {
            isUncollapsed = v124
        });
        if v124.value == false then
            v1.End();
            return;
        else
            v1.SameLine();
            v1.Text({
                "Table using NextRow and NextColumn syntax:"
            });
            v10("calling Iris.NextRow() in the outer loop, and Iris.NextColumn()in the inner loop");
            v1.End();
            v1.Table({
                3
            });
            for v125 = 1, 4 do
                v1.NextRow();
                for v126 = 1, 3 do
                    v1.NextColumn();
                    v1.Text({
                        (("Row: %*, Column: %*"):format(v125, v126))
                    });
                end;
            end;
            v1.End();
            v1.Text({
                ""
            });
            v1.SameLine();
            v1.Text({
                "Table using NextColumn only syntax:"
            });
            v10("only calling Iris.NextColumn() in the inner loop, the result is identical");
            v1.End();
            v1.Table({
                2
            });
            for v127 = 1, 4 do
                for v128 = 1, 2 do
                    v1.NextColumn();
                    v1.Text({
                        (("Row: %*, Column: %*"):format(v127, v128))
                    });
                end;
            end;
            v1.End();
            v1.Separator();
            local v129 = v1.State(false);
            local v130 = v1.State(false);
            local v131 = v1.State(true);
            local v132 = v1.State(true);
            local v133 = v1.State(3);
            v1.Text({
                "Table with Customizable Arguments"
            });
            v1.Table({
                4; 
                [v1.Args.Table.RowBg] = v129.value, 
                [v1.Args.Table.BordersOuter] = v130.value, 
                [v1.Args.Table.BordersInner] = v131.value
            });
            for v134 = 1, v133:get() do
                for v135 = 1, 4 do
                    v1.NextColumn();
                    if v132.value then
                        v1.Button({
                            (("Month: %*, Week: %*"):format(v134, v135))
                        });
                    else
                        v1.Text({
                            (("Month: %*, Week: %*"):format(v134, v135))
                        });
                    end;
                end;
            end;
            v1.End();
            v1.Checkbox({
                "RowBg"
            }, {
                isChecked = v129
            });
            v1.Checkbox({
                "BordersOuter"
            }, {
                isChecked = v130
            });
            v1.Checkbox({
                "BordersInner"
            }, {
                isChecked = v131
            });
            v1.SameLine();
            v1.RadioButton({
                "Buttons", 
                true
            }, {
                index = v132
            });
            v1.RadioButton({
                "Text", 
                false
            }, {
                index = v132
            });
            v1.End();
            v1.InputNum({
                "Number of rows"; 
                [v1.Args.InputNum.Min] = 0, 
                [v1.Args.InputNum.Max] = 100, 
                [v1.Args.InputNum.Format] = "%d"
            }, {
                number = v133
            });
            v1.End();
            return;
        end;
    end;
    local function v139() --[[ Line: 888 ]] --[[ Name: layoutDemo ]]
        -- upvalues: v1 (copy), v10 (copy)
        v1.CollapsingHeader({
            "Widget Layout"
        });
        v1.Tree({
            "Content Width"
        });
        local v137 = v1.State(50);
        local v138 = v1.State(Enum.Axis.X);
        v1.Text({
            "The Content Width is a size property which determines the width of input fields."
        });
        v1.SameLine();
        v1.Text({
            "By default the value is UDim.new(0.65, 0)"
        });
        v10("This is the default value from Dear ImGui.\nIt is 65% of the window width.");
        v1.End();
        v1.Text({
            "This works well, but sometimes we know how wide elements are going to be and want to maximise the space."
        });
        v1.Text({
            "Therefore, we can use Iris.PushConfig() to change the width"
        });
        v1.Separator();
        v1.SameLine();
        v1.Text({
            "Content Width = 150 pixels"
        });
        v10("UDim.new(0, 150)");
        v1.End();
        v1.PushConfig({
            ContentWidth = UDim.new(0, 150)
        });
        v1.DragNum({
            "number", 
            1, 
            0, 
            100
        }, {
            number = v137
        });
        v1.ComboEnum({
            "axis"
        }, {
            index = v138
        }, Enum.Axis);
        v1.PopConfig();
        v1.SameLine();
        v1.Text({
            "Content Width = 50% window width"
        });
        v10("UDim.new(0.5, 0)");
        v1.End();
        v1.PushConfig({
            ContentWidth = UDim.new(0.5, 0)
        });
        v1.DragNum({
            "number", 
            1, 
            0, 
            100
        }, {
            number = v137
        });
        v1.ComboEnum({
            "axis"
        }, {
            index = v138
        }, Enum.Axis);
        v1.PopConfig();
        v1.SameLine();
        v1.Text({
            "Content Width = -150 pixels from the right side"
        });
        v10("UDim.new(1, -150)");
        v1.End();
        v1.PushConfig({
            ContentWidth = UDim.new(1, -150)
        });
        v1.DragNum({
            "number", 
            1, 
            0, 
            100
        }, {
            number = v137
        });
        v1.InputEnum({
            "axis"
        }, {
            index = v138
        }, Enum.Axis);
        v1.PopConfig();
        v1.End();
        v1.End();
    end;
    local function v140() --[[ Line: 935 ]] --[[ Name: windowlessDemo ]]
        -- upvalues: v1 (copy), v10 (copy)
        v1.PushConfig({
            ItemWidth = UDim.new(0, 150)
        });
        v1.SameLine();
        v1.TextWrapped({
            "Windowless widgets"
        });
        v10("Widgets which are placed outside of a window will appear on the top left side of the screen.");
        v1.End();
        v1.Button({});
        v1.Tree({});
        v1.InputText({});
        v1.End();
        v1.PopConfig();
    end;
    return function() --[[ Line: 949 ]]
        -- upvalues: v1 (copy), v2 (copy), v75 (copy), v108 (copy), v121 (copy), v44 (copy), v123 (copy), v43 (copy), v42 (copy), v136 (copy), v139 (copy), v3 (copy), v45 (copy), v4 (copy), v73 (copy), v5 (copy), v78 (ref), v6 (copy), v140 (copy), v7 (copy)
        local v141 = v1.State(false);
        local v142 = v1.State(false);
        local v143 = v1.State(false);
        local v144 = v1.State(true);
        local v145 = v1.State(false);
        local v146 = v1.State(false);
        local v147 = v1.State(false);
        local v148 = v1.State(false);
        local v149 = v1.State(false);
        if v2.value == false then
            v1.Checkbox({
                "Open main window"
            }, {
                isChecked = v2
            });
            return;
        else
            v1.Window({
                "Iris Demo Window"; 
                [v1.Args.Window.NoTitleBar] = v141.value, 
                [v1.Args.Window.NoBackground] = v142.value, 
                [v1.Args.Window.NoCollapse] = v143.value, 
                [v1.Args.Window.NoClose] = v144.value, 
                [v1.Args.Window.NoMove] = v145.value, 
                [v1.Args.Window.NoScrollbar] = v146.value, 
                [v1.Args.Window.NoResize] = v147.value, 
                [v1.Args.Window.NoNav] = v148.value, 
                [v1.Args.Window.NoMenu] = v149.value
            }, {
                size = v1.State(Vector2.new(600, 550)), 
                position = v1.State(Vector2.new(100, 25)), 
                isOpened = v2
            });
            v75();
            v1.Text({
                "Iris says hello. (2.1.1)"
            });
            v1.CollapsingHeader({
                "Window Options"
            });
            v1.Table({
                3, 
                false, 
                false, 
                false
            });
            v1.NextColumn();
            v1.Checkbox({
                "NoTitleBar"
            }, {
                isChecked = v141
            });
            v1.NextColumn();
            v1.Checkbox({
                "NoBackground"
            }, {
                isChecked = v142
            });
            v1.NextColumn();
            v1.Checkbox({
                "NoCollapse"
            }, {
                isChecked = v143
            });
            v1.NextColumn();
            v1.Checkbox({
                "NoClose"
            }, {
                isChecked = v144
            });
            v1.NextColumn();
            v1.Checkbox({
                "NoMove"
            }, {
                isChecked = v145
            });
            v1.NextColumn();
            v1.Checkbox({
                "NoScrollbar"
            }, {
                isChecked = v146
            });
            v1.NextColumn();
            v1.Checkbox({
                "NoResize"
            }, {
                isChecked = v147
            });
            v1.NextColumn();
            v1.Checkbox({
                "NoNav"
            }, {
                isChecked = v148
            });
            v1.NextColumn();
            v1.Checkbox({
                "NoMenu"
            }, {
                isChecked = v149
            });
            v1.End();
            v1.End();
            v108();
            v121();
            v1.CollapsingHeader({
                "Recursive Tree"
            });
            if v1.Tree({
                "Recursive Tree"
            }).state.isUncollapsed.value then
                v44();
            end;
            v1.End();
            v1.End();
            v123();
            v1.Separator();
            v1.CollapsingHeader({
                "Widgets"
            });
            for _, v151 in v43 do
                v42[v151]();
            end;
            v1.End();
            v136();
            v139();
            v1.End();
            if v3.value then
                v45(v3);
            end;
            if v4.value then
                v73();
            end;
            if v5.value then
                v78();
            end;
            if v6.value then
                v140();
            end;
            if v7.value then
                local _ = v1.Internal._rootWidget.Instance.PseudoWindowScreenGui.AbsoluteSize;
                v75();
            end;
            return;
        end;
    end;
end;