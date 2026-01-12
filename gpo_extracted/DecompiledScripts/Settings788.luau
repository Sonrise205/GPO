local v0 = nil;
local v1 = nil;
client = v0;
service = v1;
return function(_, v3) --[[ Line: 3 ]]
    local v4 = nil;
    if v3 then
        setfenv(1, v3);
    end;
    local l_client_0 = v3.client;
    local l_service_0 = v3.service;
    local l_gui_0 = v3.gui;
    local l_UI_0 = l_client_0.UI;
    local l_Remote_0 = l_client_0.Remote;
    local l_Variables_0 = l_client_0.Variables;
    local l_Functions_0 = l_client_0.Functions;
    local l_Deps_0 = l_client_0.Deps;
    local v13 = l_UI_0.Make("Window", {
        Name = "Settings", 
        Title = "Settings", 
        Size = {
            225, 
            200
        }, 
        AllowMultiple = false
    });
    local v50 = {
        {
            Text = "Keybinds: ", 
            Desc = "- Enables/Disables Keybinds", 
            Entry = "Boolean", 
            Value = l_Variables_0.KeybindsEnabled, 
            Function = function(v14, v15) --[[ Line: 33 ]] --[[ Name: Function ]]
                -- upvalues: l_Variables_0 (copy), l_Remote_0 (copy)
                l_Variables_0.KeybindsEnabled = v14;
                local l_Text_0 = v15.Text;
                v15.Text = "Saving..";
                l_Remote_0.Get("UpdateClient", "KeybindsEnabled", v14);
                v15.Text = l_Text_0;
            end
        }, 
        {
            Text = "UI Keep Alive: ", 
            Desc = "- Prevents Adonis UI deletion on death", 
            Entry = "Boolean", 
            Value = l_Variables_0.UIKeepAlive, 
            Function = function(v17, v18) --[[ Line: 46 ]] --[[ Name: Function ]]
                -- upvalues: l_Variables_0 (copy), l_Remote_0 (copy)
                l_Variables_0.UIKeepAlive = v17;
                local l_Text_1 = v18.Text;
                v18.Text = "Saving..";
                l_Remote_0.Get("UpdateClient", "UIKeepAlive", v17);
                v18.Text = l_Text_1;
            end
        }, 
        {
            Text = "Particle Effects: ", 
            Desc = "- Enables/Disables certain Adonis made effects like sparkles", 
            Entry = "Boolean", 
            Value = l_Variables_0.ParticlesEnabled, 
            Function = function(v20, v21) --[[ Line: 59 ]] --[[ Name: Function ]]
                -- upvalues: l_Variables_0 (copy), l_Remote_0 (copy)
                l_Variables_0.ParticlesEnabled = v20;
                local l_Text_2 = v21.Text;
                v21.Text = "Saving..";
                l_Remote_0.Get("UpdateClient", "ParticlesEnabled", v20);
                v21.Text = l_Text_2;
            end
        }, 
        {
            Text = "Capes: ", 
            Desc = "- Allows you to disable all player capes locally", 
            Entry = "Boolean", 
            Value = l_Variables_0.CapesEnabled, 
            Function = function(v23, v24) --[[ Line: 72 ]] --[[ Name: Function ]]
                -- upvalues: l_Variables_0 (copy), l_Remote_0 (copy)
                l_Variables_0.CapesEnabled = v23;
                local l_Text_3 = v24.Text;
                v24.Text = "Saving..";
                l_Remote_0.Get("UpdateClient", "CapesEnabled", v23);
                v24.Text = l_Text_3;
            end
        }, 
        {
            Text = "Hide Chat Commands: ", 
            Desc = "- Hide commands ran from the chat", 
            Entry = "Boolean", 
            Setting = "HideChatCommands", 
            Value = l_Variables_0.HideChatCommands or false, 
            Function = function(v26, v27) --[[ Line: 86 ]] --[[ Name: Function ]]
                -- upvalues: l_Variables_0 (copy), l_Remote_0 (copy)
                l_Variables_0.HideChatCommands = v26;
                local l_Text_4 = v27.Text;
                v27.Text = "Saving..";
                l_Remote_0.Get("UpdateClient", "HideChatCommands", v26);
                v27.Text = l_Text_4;
            end
        }, 
        {
            Text = "Console Key: ", 
            Desc = "Key used to open the console", 
            Entry = "Button", 
            Value = l_Functions_0.KeyCodeToName(Enum.KeyCode[l_Variables_0.CustomConsoleKey or l_Remote_0.Get("Setting", "ConsoleKeyCode") or "Unknown"].Value), 
            Function = function(v29) --[[ Line: 100 ]] --[[ Name: Function ]]
                -- upvalues: l_service_0 (copy), l_Functions_0 (copy), l_Variables_0 (copy), l_Remote_0 (copy)
                local v30 = nil;
                local v31 = nil;
                v29.Text = "Waiting...";
                local v35 = l_service_0.UserInputService.InputBegan:Connect(function(v32) --[[ Line: 103 ]]
                    -- upvalues: l_service_0 (ref), v30 (ref), v31 (ref), l_Functions_0 (ref)
                    if not l_service_0.UserInputService:GetFocusedTextBox() and rawequal(v32.UserInputType, Enum.UserInputType.Keyboard) then
                        local l_Name_0 = v32.KeyCode.Name;
                        local v34 = l_Functions_0.KeyCodeToName(v32.KeyCode.Value);
                        v30 = l_Name_0;
                        v31 = v34;
                    end;
                end);
                repeat
                    wait();
                until v30;
                l_Variables_0.CustomConsoleKey = v30;
                v35:Disconnect();
                v29.Text = "Saving..";
                l_Remote_0.Get("UpdateClient", "CustomConsoleKey", l_Variables_0.CustomConsoleKey);
                v29.Text = v31;
            end
        }, 
        {
            Text = "Theme: ", 
            Desc = "- Allows you to set the Adonis UI theme", 
            Entry = "DropDown", 
            Setting = "CustomTheme", 
            Function = function(v36) --[[ Line: 124 ]] --[[ Name: Function ]]
                -- upvalues: l_gui_0 (copy), l_Deps_0 (copy), l_service_0 (copy), l_Variables_0 (copy), l_Remote_0 (copy)
                local l_TextButton_0 = v36.TextButton;
                local l_ThemePicker_0 = l_gui_0.ThemePicker;
                local l_Frame_0 = l_ThemePicker_0.Frame;
                local l_Entry_0 = l_ThemePicker_0.Entry;
                local function v49() --[[ Line: 129 ]] --[[ Name: showThemes ]]
                    -- upvalues: l_Frame_0 (copy), l_Deps_0 (ref), l_Entry_0 (copy), l_service_0 (ref), l_ThemePicker_0 (copy), l_TextButton_0 (copy), l_Variables_0 (ref), l_Remote_0 (ref)
                    l_Frame_0:ClearAllChildren();
                    local l_fromOffset_0 = UDim2.fromOffset;
                    local v42 = {
                        "Default"
                    };
                    for _, v44 in ipairs(l_Deps_0.UI:GetChildren()) do
                        table.insert(v42, v44.Name);
                    end;
                    local v45 = 0;
                    for _, v47 in pairs(v42) do
                        local v48 = l_Entry_0:Clone();
                        v48.Text = v47;
                        v48.Position = l_fromOffset_0(0, v45 * 20);
                        v48.Visible = true;
                        v48.MouseButton1Click:Connect(function() --[[ Line: 145 ]]
                            -- upvalues: l_service_0 (ref), l_ThemePicker_0 (ref), l_TextButton_0 (ref), v47 (copy), l_Variables_0 (ref), l_Remote_0 (ref)
                            l_service_0.Debounce("ClientSelectingTheme", function() --[[ Line: 146 ]]
                                -- upvalues: l_ThemePicker_0 (ref), l_TextButton_0 (ref), v47 (ref), l_Variables_0 (ref), l_Remote_0 (ref)
                                l_ThemePicker_0.Visible = false;
                                l_TextButton_0.Text = v47;
                                l_Variables_0.CustomTheme = v47;
                                if v47 == "Default" then
                                    l_Remote_0.Get("UpdateClient", "CustomTheme", nil);
                                    return;
                                else
                                    l_Remote_0.Get("UpdateClient", "CustomTheme", v47);
                                    return;
                                end;
                            end);
                        end);
                        v48.Parent = l_Frame_0;
                        v45 = v45 + 1;
                    end;
                    l_ThemePicker_0.Position = l_fromOffset_0(l_TextButton_0.AbsolutePosition.X + 15, l_TextButton_0.AbsolutePosition.Y);
                    l_ThemePicker_0.Visible = true;
                end;
                l_TextButton_0.MouseButton1Click:Connect(function() --[[ Line: 165 ]]
                    -- upvalues: l_service_0 (ref), l_ThemePicker_0 (copy), v49 (copy)
                    l_service_0.Debounce("ClientDisplayThemes", function() --[[ Line: 166 ]]
                        -- upvalues: l_ThemePicker_0 (ref), v49 (ref)
                        if l_ThemePicker_0.Visible then
                            l_ThemePicker_0.Visible = false;
                            return;
                        else
                            v49();
                            return;
                        end;
                    end);
                end);
                if l_Variables_0.CustomTheme then
                    l_TextButton_0.Text = l_Variables_0.CustomTheme;
                    return;
                else
                    l_TextButton_0.Text = "Default";
                    return;
                end;
            end
        }
    };
    if v13 then
        local v51 = v13:Add("TabFrame", {
            Size = UDim2.new(1, -10, 1, -10), 
            Position = UDim2.new(0, 5, 0, 5)
        });
        local v52 = v51:NewTab("Client", {
            Text = "Client"
        });
        local _ = v51:NewTab("Game", {
            Text = "Game"
        });
        for v54, v55 in next, v50 do
            if v55.Entry == "Boolean" then
                v52:Add("TextLabel", {
                    Size = UDim2.new(1, -10, 0, 25), 
                    Position = UDim2.new(0, 5, 0, 25 * (v54 - 1)), 
                    TextXAlignment = "Left", 
                    Enabled = v55.Value, 
                    Text = v55.Text, 
                    ToolTip = v55.Desc
                }):Add("Boolean", {
                    Size = UDim2.new(0, 100, 0, 20), 
                    Position = UDim2.new(1, -100, 0, 0), 
                    Enabled = v55.Value, 
                    OnToggle = function(_, _) --[[ Line: 221 ]] --[[ Name: OnToggle ]]
                        print("Toggled thinger");
                    end
                });
            end;
        end;
        v52:ResizeCanvas(false, true);
        v4 = v13.gTable;
        v13:Ready();
    end;
end;