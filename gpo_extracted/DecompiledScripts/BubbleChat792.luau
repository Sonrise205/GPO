local v0 = nil;
local v1 = nil;
client = v0;
service = v1;
return function(v2, v3) --[[ Line: 3 ]]
    if v3 then
        setfenv(1, v3);
    end;
    local v4 = nil;
    local l_Color_0 = v2.Color;
    if l_Color_0 == "off" then
        client.UI.Remove("BubbleChat");
        return;
    else
        local v6 = client.UI.Make("Window", {
            Name = "BubbleChat", 
            Title = "Bubble Chat", 
            Icon = client.MatIcons.Chat, 
            Size = {
                260, 
                57
            }, 
            Position = UDim2.new(0, 10, 1, -80), 
            AllowMultiple = false
        });
        if v6 then
            local v7 = v6:Add("TextBox", {
                Text = "Click here or press \";\" to chat", 
                PlaceholderText = "Click here or press \";\" to chat", 
                BackgroundTransparency = 1, 
                TextScaled = true, 
                TextSize = 20
            });
            v7.FocusLost:Connect(function(v8) --[[ Line: 32 ]]
                -- upvalues: l_Color_0 (copy), v7 (copy)
                if v8 and service.Player.Character:FindFirstChild("Head") and l_Color_0 and v7.Text ~= "Click here or press \";\" to chat" then
                    if #v7.Text > 0 then
                        service.ChatService:Chat(service.Player.Character.Head, service.LaxFilter(v7.Text), l_Color_0);
                    end;
                    v7.Text = "Click here or press \";\" to chat";
                end;
            end);
            v6:BindEvent(service.UserInputService.InputBegan, function(v9, v10) --[[ Line: 41 ]]
                -- upvalues: v7 (copy)
                if not v10 and v9.UserInputType == Enum.UserInputType.Keyboard and v9.KeyCode == Enum.KeyCode.Semicolon then
                    service.RunService.RenderStepped:Wait();
                    v7:CaptureFocus();
                end;
            end);
            v4 = v6.gTable;
            v6:Ready();
        end;
        return;
    end;
end;