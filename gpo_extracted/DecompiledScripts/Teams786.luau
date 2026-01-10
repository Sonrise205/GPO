local v0 = nil;
local v1 = nil;
client = v0;
service = v1;
return function(v2, v3) --[[ Line: 3 ]]
    if v3 then
        setfenv(1, v3);
    end;
    local v4 = client.UI.Make("Window", {
        Name = "Teams", 
        Title = "Teams", 
        Icon = client.MatIcons.People, 
        Size = {
            300, 
            280
        }, 
        AllowMultiple = false
    });
    local v5 = v4:Add("ScrollingFrame", {
        List = {}, 
        ScrollBarThickness = 3, 
        Position = UDim2.new(0, 5, 0, 5), 
        Size = UDim2.new(1, -10, 1, -70), 
        BackgroundTransparency = 1
    });
    local v6 = v4:Add("Frame", {
        AnchorPoint = Vector2.new(0, 1), 
        Position = UDim2.new(0, 5, 1, -5), 
        Size = UDim2.new(1, -10, 0, 65), 
        Children = {
            {
                Class = "TextLabel", 
                Size = UDim2.new(0, 50, 0, 25), 
                Position = UDim2.new(0, 5, 0, 5), 
                TextXAlignment = "Left", 
                Text = "Name:", 
                BackgroundTransparency = 1
            }, 
            {
                Class = "TextLabel", 
                Size = UDim2.new(0, 50, 0, 25), 
                Position = UDim2.new(0, 5, 0, 35), 
                TextXAlignment = "Left", 
                Text = "Color:", 
                BackgroundTransparency = 1
            }
        }
    });
    local v7 = v6:Add("TextBox", {
        Size = UDim2.new(0, 150, 0, 25), 
        Position = UDim2.new(0, 50, 0, 5), 
        BackgroundColor3 = Color3.fromRGB(70, 70, 70), 
        TextXAlignment = "Left", 
        Text = ""
    });
    v7:Add("UIPadding", {
        PaddingLeft = UDim.new(0, 4)
    });
    local v8 = v6:Add("TextBox", {
        Size = UDim2.new(0, 150, 0, 25), 
        Position = UDim2.new(0, 50, 0, 35), 
        BackgroundColor3 = Color3.fromRGB(70, 70, 70), 
        TextXAlignment = "Left", 
        PlaceholderText = "BrickColor", 
        Text = ""
    });
    v8:Add("UIPadding", {
        PaddingLeft = UDim.new(0, 4)
    });
    v8:Add("ImageButton", {
        Size = UDim2.new(0, 21, 0, 21), 
        Position = UDim2.new(1, -23, 0, 2), 
        BackgroundTransparency = 0.8, 
        Image = client.MatIcons.Palette, 
        ImageTransparency = 0.2
    }).MouseButton1Down:Connect(function() --[[ Line: 72 ]]
        -- upvalues: v2 (copy)
        client.Remote.Send("ProcessCommand", (("%*brickcolors"):format(v2.CmdPlayerPrefix)));
    end);
    local _ = v6:Add("TextButton", {
        Class = "TextButton", 
        AnchorPoint = Vector2.new(1, 1), 
        BackgroundColor3 = Color3.fromRGB(45, 45, 45), 
        Size = UDim2.new(0, 65, 0, 28), 
        Position = UDim2.new(1, -5, 1, -5), 
        Text = "Create", 
        OnClick = function(v9) --[[ Line: 83 ]] --[[ Name: OnClick ]]
            -- upvalues: v7 (copy), v8 (copy), v2 (copy)
            if v7.Text ~= "" and v8.Text ~= "" then
                v9.Active = false;
                v9.AutoButtonColor = false;
                v9.Text = "...";
                client.Remote.Send("ProcessCommand", string.format("%snewteam%s%s%s%s", v2.CmdPrefix, v2.CmdSplitKey, v7.Text, v2.CmdSplitKey, v8.Text));
                v7.Text = "";
                v8.Text = "";
                wait(1.2);
                if v9 then
                    v9.Active = true;
                    v9.AutoButtonColor = true;
                    v9.Text = "Create";
                end;
            end;
        end
    });
    v7:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 101 ]]
        -- upvalues: v7 (copy), v2 (copy)
        v7.Text = string.gsub(v7.Text, v2.CmdSplitKey, "");
    end);
    v8:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 104 ]]
        -- upvalues: v8 (copy)
        v8.TextColor3 = BrickColor.new(v8.Text).Color;
    end);
    local function v16() --[[ Line: 109 ]] --[[ Name: generate ]]
        -- upvalues: v5 (copy), v2 (copy), v4 (copy)
        local v11 = 0;
        v5:ClearAllChildren();
        v5:Add("UIListLayout", {
            Padding = UDim.new(0, 4), 
            SortOrder = Enum.SortOrder.Name, 
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center
        });
        for _, v13 in ipairs(service.Teams:GetTeams()) do
            v11 = v11 + 1;
            v5:Add("TextLabel", {
                Name = v13.Name, 
                Size = UDim2.new(1, -10, 0, 30), 
                BackgroundTransparency = 0.5, 
                TextXAlignment = "Left", 
                Text = "", 
                ZIndex = 11, 
                Children = {
                    {
                        Class = "Frame", 
                        AnchorPoint = Vector2.new(0, 0.5), 
                        BackgroundColor3 = v13.TeamColor.Color, 
                        Size = UDim2.new(0, 35, 1, -4), 
                        Position = UDim2.new(0, 2, 0.5, 0), 
                        ToolTip = v13.TeamColor.Name, 
                        ZIndex = 13
                    }, 
                    {
                        Class = "TextLabel", 
                        Size = UDim2.new(1, -144, 1, 0), 
                        Position = UDim2.new(0, 42, 0, 0), 
                        BackgroundTransparency = 1, 
                        TextXAlignment = "Left", 
                        TextYAlignment = "Center", 
                        Text = v13.Name, 
                        ToolTip = ("[Auto-Assignable]: %*"):format(v13.AutoAssignable), 
                        ZIndex = 13
                    }, 
                    {
                        Class = "TextButton", 
                        AnchorPoint = Vector2.new(1, 0.5), 
                        Size = UDim2.new(0, 60, 0, 26), 
                        Position = UDim2.new(1, -30, 0.5, 0), 
                        Text = "Join", 
                        ZIndex = 13, 
                        OnClick = function(v14) --[[ Line: 155 ]] --[[ Name: OnClick ]]
                            -- upvalues: v2 (ref), v13 (copy)
                            v14.Active = false;
                            v14.AutoButtonColor = false;
                            v14.Text = "...";
                            client.Remote.Send("ProcessCommand", string.format("%steam%s%sme%s%s", v2.CmdPrefix, v2.CmdSplitKey, v2.CmdSpecialPrefix, v2.CmdSplitKey, v13.Name));
                            wait(1.2);
                            if v14 then
                                v14.Active = true;
                                v14.AutoButtonColor = true;
                                v14.Text = "Join";
                            end;
                        end
                    }, 
                    {
                        Class = "ImageButton", 
                        AnchorPoint = Vector2.new(1, 0.5), 
                        Size = UDim2.new(0, 26, 0, 26), 
                        Position = UDim2.new(1, -2, 0.5, 0), 
                        Image = client.MatIcons.Clear, 
                        ZIndex = 13, 
                        OnClick = function(v15) --[[ Line: 175 ]] --[[ Name: OnClick ]]
                            -- upvalues: v2 (ref), v13 (copy)
                            v15.Visible = false;
                            client.Remote.Send("ProcessCommand", string.format("%sremoveteam%s%s", v2.CmdPrefix, v2.CmdSplitKey, v13.Name));
                            wait(1.2);
                            if v15 then
                                v15.Visible = true;
                            end;
                        end
                    }
                }
            });
        end;
        v5:ResizeCanvas(false, true, false, false, 5, 0);
        v4:SetTitle((("Teams (%*)"):format(v11)));
    end;
    service.Teams.ChildAdded:Connect(v16);
    service.Teams.ChildRemoved:Connect(v16);
    v16();
    v4:Ready();
end;