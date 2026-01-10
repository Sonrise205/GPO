local v0 = nil;
local v1 = nil;
client = v0;
service = v1;
return function(v2, v3) --[[ Line: 2 ]]
    if v3 then
        setfenv(1, v3);
    end;
    local v4 = nil;
    local v5 = nil;
    local v6 = client.UI.Make("Window", {
        Title = ("Editing - %*"):format(v2.Name), 
        Name = "CommandBox", 
        Icon = client.MatIcons.Code, 
        Size = {
            500, 
            300
        }, 
        MinSize = {
            300, 
            250
        }, 
        OnClose = function() --[[ Line: 16 ]] --[[ Name: OnClose ]]
            -- upvalues: v4 (ref)
            v4();
        end
    });
    local v7 = v6:Add("ScrollingFrame", {
        Name = "Editor", 
        Size = UDim2.new(1, -10, 1, -10), 
        BackgroundTransparency = 1
    });
    local v8 = v7:Add("TextBox", {
        Name = "Script", 
        Size = UDim2.new(1, -10, 1, -10), 
        Position = UDim2.new(0, 5, 0, 5), 
        BackgroundTransparency = 1, 
        Text = v2.Script or "print(\"Hello World\")", 
        PlaceholderText = "", 
        TextYAlignment = "Top", 
        TextXAlignment = "Left", 
        MultiLine = true, 
        ClearTextOnFocus = false, 
        Font = Enum.Font.Code, 
        TextSize = 16
    });
    local v9 = v6:Add("TextButton", {
        Name = "Save", 
        Text = "Save", 
        Size = UDim2.new(0, 40, 0, 20), 
        Position = UDim2.new(1, 0, 1, -25), 
        AnchorPoint = Vector2.new(1, 1)
    });
    local v10 = v6:Add("TextButton", {
        Name = "Run", 
        Text = "Run", 
        Size = UDim2.new(0, 40, 0, 20), 
        Position = UDim2.new(1, 0, 1, 0), 
        AnchorPoint = Vector2.new(1, 1)
    });
    v8:GetPropertyChangedSignal("TextBounds"):Connect(function() --[[ Line: 58 ]]
        -- upvalues: v7 (copy)
        v7:ResizeCanvas(true, true);
    end);
    v4 = function() --[[ Line: 62 ]]
        -- upvalues: v2 (copy), v8 (copy)
        client.Remote.Send("SaveScript", {
            Name = v2.Name, 
            Text = v8.Text
        });
    end;
    v5 = function() --[[ Line: 69 ]]
        -- upvalues: v2 (copy), v8 (copy)
        client.Remote.Send("SaveScript", {
            Name = v2.Name, 
            Text = v8.Text
        });
        client.Remote.Send("RunScript", {
            v2.Name
        });
    end;
    v9.MouseButton1Click:Connect(function() --[[ Line: 77 ]]
        -- upvalues: v4 (ref)
        v4();
    end);
    v10.MouseButton1Click:Connect(function() --[[ Line: 81 ]]
        -- upvalues: v5 (ref)
        v5();
    end);
    v6:Ready();
end;