local v0 = nil;
local v1 = nil;
client = v0;
service = v1;
return function(v2, v3) --[[ Line: 3 ]]
    if v3 then
        setfenv(1, v3);
    end;
    local v4 = client.UI.Make("Window", {
        Name = "Notepad", 
        Title = "Notepad", 
        Icon = client.MatIcons.Description
    });
    local v5 = v4:Add("ScrollingFrame", {
        Position = UDim2.new(0, 0, 0, 30), 
        Size = UDim2.new(1, 0, 1, -30), 
        CanvasSize = UDim2.new(0, 0, 0, 0), 
        BackgroundTransparency = 1, 
        AutomaticCanvasSize = Enum.AutomaticSize.Y
    });
    local v6 = v5:Add("TextBox", {
        Size = UDim2.new(1, -4, 1, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundColor3 = Color3.new(0, 0, 0), 
        TextColor3 = Color3.new(1, 1, 1), 
        Font = "Code", 
        TextSize = 18, 
        TextXAlignment = "Left", 
        TextYAlignment = "Top", 
        TextWrapped = true, 
        TextScaled = false, 
        ClearTextOnFocus = false, 
        MultiLine = true, 
        Text = v2.Text or ""
    });
    v6:GetPropertyChangedSignal("TextBounds"):Connect(function() --[[ Line: 39 ]]
        -- upvalues: v6 (copy)
        v6.Size = UDim2.new(v6.Size.X.Scale, v6.Size.X.Offset, v6.Size.Y.Scale, v6.TextBounds.Y);
    end);
    if v2.ReadOnly then
        v6.TextEditable = false;
        v5.Position = UDim2.new(0, 0, 0, 0);
        v5.Size = UDim2.new(1, 0, 1, 0);
        if v2.AutoSelectAll then
            local function v7() --[[ Line: 48 ]]
                -- upvalues: v6 (copy)
                if v6:IsFocused() then
                    v6.SelectionStart = 1;
                    v6.CursorPosition = #v6.Text;
                end;
            end;
            v6.Focused:Connect(v7);
            v6:GetPropertyChangedSignal("CursorPosition"):Connect(v7);
            v6.FocusLost:Connect(function() --[[ Line: 56 ]]
                -- upvalues: v6 (copy)
                v6.SelectionStart = -1;
                v6.CursorPosition = 0;
            end);
        end;
    else
        local v8 = v4:Add("Frame", {
            Size = UDim2.new(1, 0, 0, 28), 
            Position = UDim2.new(0, 0, 0, 0), 
            BackgroundTransparency = 1
        });
        local v9 = v8:Add("TextLabel", {
            Size = UDim2.new(0, 100, 1, -8), 
            Position = UDim2.new(1, -105, 0, 4), 
            Text = "0 characters", 
            TextXAlignment = "Right", 
            BackgroundTransparency = 1
        });
        local v10 = {};
        for _, v12 in ipairs(Enum.Font:GetEnumItems()) do
            table.insert(v10, v12.Name);
        end;
        local _ = v8:Add("Dropdown", {
            Size = UDim2.new(0, 140, 1, -8), 
            Position = UDim2.new(0, 5, 0, 4), 
            Text = "Font", 
            BackgroundTransparency = 0, 
            Options = v10, 
            Selected = "Code", 
            OnSelect = function(v13) --[[ Line: 87 ]] --[[ Name: OnSelect ]]
                -- upvalues: v6 (copy)
                v6.Font = v13;
            end
        });
        local _ = v8:Add("TextLabel", {
            Text = "  Size: ", 
            BackgroundTransparency = 0, 
            Size = UDim2.new(0, 80, 1, -8), 
            Position = UDim2.new(0, 155, 0, 4), 
            TextXAlignment = "Left", 
            Children = {
                TextBox = {
                    Text = "", 
                    PlaceholderText = "18", 
                    Size = UDim2.new(0, 26, 1, 0), 
                    Position = UDim2.new(1, -31, 0, 0), 
                    BackgroundTransparency = 1, 
                    TextXAlignment = "Right", 
                    ClipsDescendants = true, 
                    TextChanged = function(v15, _, _) --[[ Line: 107 ]] --[[ Name: TextChanged ]]
                        -- upvalues: v6 (copy)
                        if tonumber(v15) then
                            if tonumber(v15) < 100 then
                                v6.TextSize = v15;
                                return;
                            else
                                v6.TextSize = 99;
                            end;
                        end;
                    end
                }
            }
        });
        v6:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 119 ]]
            -- upvalues: v9 (copy), v6 (copy)
            v9.Text = ("%* characters"):format(#v6.Text);
        end);
    end;
    v4:Ready();
end;