local v0 = nil;
local v1 = nil;
client = v0;
service = v1;
return function(_, v3) --[[ Line: 3 ]]
    if v3 then
        setfenv(1, v3);
    end;
    local v4 = client.UI.Make("Window", {
        Title = "Command Box", 
        Name = "CommandBox", 
        Icon = client.MatIcons.Code, 
        Size = {
            300, 
            250
        }
    });
    local v5 = v4:Add("ScrollingFrame", {
        Name = "ComFrame", 
        Size = UDim2.new(1, -10, 1, -45), 
        BackgroundTransparency = 1, 
        AutomaticCanvasSize = Enum.AutomaticSize.Y
    }):Add("TextBox", {
        Name = "ComText", 
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundTransparency = 1, 
        Text = "", 
        PlaceholderText = "Enter commands here", 
        TextYAlignment = "Top", 
        TextWrapped = true, 
        TextScaled = false, 
        MultiLine = true, 
        ClearTextOnFocus = false
    });
    local _ = v4:Add("TextButton", {
        Name = "Execute", 
        Size = UDim2.new(1, -10, 0, 35), 
        Position = UDim2.new(0, 5, 1, -40), 
        Text = "Execute", 
        OnClick = function() --[[ Line: 43 ]] --[[ Name: OnClick ]]
            -- upvalues: v5 (copy)
            client.Remote.Send("ProcessCommand", v5.Text);
        end
    });
    v5:GetPropertyChangedSignal("TextBounds"):Connect(function() --[[ Line: 48 ]]
        -- upvalues: v5 (copy)
        if v5.Text ~= "" then
            v5.Size = UDim2.new(v5.Size.X.Scale, v5.Size.X.Offset, v5.Size.Y.Scale, v5.TextBounds.Y + 16);
            return;
        else
            v5.Size = UDim2.new(1, 0, 1, 0);
            return;
        end;
    end);
    v4:Ready();
end;