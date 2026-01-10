local v0 = nil;
local v1 = nil;
client = v0;
service = v1;
return function(_, v3) --[[ Line: 3 ]]
    if v3 then
        setfenv(1, v3);
    end;
    local _ = service.Players.LocalPlayer:GetMouse();
    local v5 = false;
    local v6 = client.UI.Make("Window", {
        Name = "Paint", 
        Title = "Paint", 
        Icon = client.MatIcons.Palette
    });
    local v7 = v6:Add("Frame", {
        Size = UDim2.new(1, 0, 0, 28), 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundTransparency = 1
    });
    local v8 = v7:Add("TextLabel", {
        Size = UDim2.new(0, 100, 1, -8), 
        Position = UDim2.new(1, -180, 0, 4), 
        Text = "Pixels: 0", 
        TextXAlignment = "Right", 
        BackgroundTransparency = 1
    });
    local v9 = v6:Add("ScrollingFrame", {
        Position = UDim2.new(0, 0, 0, 30), 
        Size = UDim2.new(1, 0, 1, -30), 
        BackgroundColor3 = Color3.new(1, 1, 1), 
        ClipsDescendants = true
    });
    local v10 = v9:Add("Frame", {
        Position = UDim2.new(0, 0, 0, 0), 
        Size = UDim2.new(0, 4, 0, 4), 
        BackgroundColor3 = Color3.new(0, 0, 0), 
        BackgroundTransparency = 0, 
        Visible = false
    });
    v9.MouseEnter:Connect(function() --[[ Line: 46 ]]
        -- upvalues: v10 (copy)
        v10.Visible = true;
    end);
    v9.MouseLeave:Connect(function() --[[ Line: 50 ]]
        -- upvalues: v10 (copy)
        v10.Visible = false;
    end);
    v9.MouseMoved:Connect(function(v11, v12) --[[ Line: 54 ]]
        -- upvalues: v9 (copy), v10 (copy), v5 (ref), v8 (copy)
        local v13 = Vector2.new(math.abs(v11 - v9.AbsolutePosition.X), (math.abs(v12 - v9.AbsolutePosition.Y - 36)));
        v10.Position = UDim2.new(0, v13.X, 0, v13.Y);
        if v5 == false then
            return;
        else
            local v14 = v10:Clone();
            v14.Name = "Pixel";
            v14.Parent = v9;
            v8.Text = ("Pixels: %*"):format(v8.Text:sub(9) + 1);
            return;
        end;
    end);
    local _ = v7:Add("TextButton", {
        Size = UDim2.new(0, 70, 1, -8), 
        Position = UDim2.new(1, -75, 0, 4), 
        Text = "Clear", 
        TextXAlignment = "Center", 
        OnClick = function() --[[ Line: 71 ]] --[[ Name: OnClick ]]
            -- upvalues: v9 (copy), v8 (copy)
            local l_v9_Children_0 = v9:GetChildren();
            for _, v17 in pairs(l_v9_Children_0) do
                if v17.Name == "Pixel" then
                    v17:Destroy();
                end;
            end;
            v8.Text = "Pixels: 0";
        end
    });
    v7:Add("TextLabel", {
        Text = " Color: ", 
        Size = UDim2.new(0, 90, 1, -8), 
        Position = UDim2.new(0, 5, 0, 4), 
        BackgroundTransparency = 0.25, 
        TextXAlignment = "Left", 
        Children = {
            {
                Class = "TextButton", 
                Text = "", 
                Size = UDim2.new(0, 40, 1, -6), 
                Position = UDim2.new(1, -45, 0, 3), 
                BackgroundColor3 = Color3.new(0, 0, 0), 
                TextTransparency = 0, 
                BackgroundTransparency = 0, 
                BorderPixelSize = 1, 
                BorderColor3 = Color3.fromRGB(100, 100, 100), 
                OnClick = function(v19) --[[ Line: 99 ]] --[[ Name: OnClick ]]
                    -- upvalues: v10 (copy)
                    local v20 = client.UI.Make("ColorPicker", {
                        Color = Color3.new(0, 0, 0)
                    });
                    v19.BackgroundColor3 = v20;
                    v10.BackgroundColor3 = v20;
                end
            }
        }
    });
    local _ = v7:Add("TextLabel", {
        Text = "  Size: ", 
        BackgroundTransparency = 0, 
        Size = UDim2.new(0, 70, 1, -8), 
        Position = UDim2.new(0, 100, 0, 4), 
        TextXAlignment = "Left", 
        Children = {
            TextBox = {
                Text = "", 
                PlaceholderText = "4", 
                Size = UDim2.new(0, 26, 1, 0), 
                Position = UDim2.new(1, -31, 0, 0), 
                BackgroundTransparency = 1, 
                TextXAlignment = "Right", 
                ClipsDescendants = true, 
                TextChanged = function(v21, _, _) --[[ Line: 126 ]] --[[ Name: TextChanged ]]
                    -- upvalues: v10 (copy)
                    if tonumber(v21) then
                        if tonumber(v21) < 100 then
                            v10.Size = UDim2.new(0, v21, 0, v21);
                            return;
                        else
                            v10.Size = UDim2.new(0, 99, 0, 99);
                        end;
                    end;
                end
            }
        }
    });
    v6:Ready();
    service.UserInputService.InputBegan:Connect(function(v25) --[[ Line: 141 ]]
        -- upvalues: v5 (ref)
        if v25.UserInputType == Enum.UserInputType.MouseButton1 or v25.UserInputType == Enum.UserInputType.Touch then
            v5 = true;
        end;
    end);
    service.UserInputService.InputEnded:Connect(function(v26) --[[ Line: 146 ]]
        -- upvalues: v5 (ref)
        if v26.UserInputType == Enum.UserInputType.MouseButton1 or v26.UserInputType == Enum.UserInputType.Touch then
            v5 = false;
        end;
    end);
end;