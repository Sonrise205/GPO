local v0 = nil;
local v1 = nil;
client = v0;
service = v1;
return function(v2, v3) --[[ Line: 3 ]]
    if v3 then
        setfenv(1, v3);
    end;
    local l_UI_0 = client.UI;
    local l_Remote_0 = client.Remote;
    local l_replyTicket_0 = v2.replyTicket;
    local l_Player_0 = v2.Player;
    local v8 = nil;
    local v9 = false;
    local v10 = l_UI_0.Make("Window", {
        Name = "PrivateMessage", 
        Title = tostring(l_Player_0), 
        Size = {
            300, 
            150
        }
    });
    local _ = v10:Add("TextLabel", {
        Text = v2.Message, 
        Size = UDim2.new(1, -10, 1, -40), 
        BackgroundTransparency = 1, 
        TextScaled = true, 
        TextWrapped = true
    });
    local v12 = v10:Add("TextBox", {
        Text = "", 
        PlaceholderText = "Enter reply", 
        Size = UDim2.new(1, -65, 0, 30), 
        Position = UDim2.new(0, 5, 1, -35), 
        ClearTextOnFocus = false, 
        TextScaled = true
    });
    local function v14(v13) --[[ Line: 40 ]] --[[ Name: sendIt ]]
        -- upvalues: v9 (ref), v12 (copy), l_UI_0 (copy), v10 (copy), l_Remote_0 (copy), l_replyTicket_0 (copy), l_Player_0 (copy)
        if not v9 then
            v9 = true;
            if v13 then
                if v12:IsFocused() then
                    v12:ReleaseFocus();
                end;
                if service.Trim(v12.Text) == "" then
                    v9 = false;
                    l_UI_0.Make("Hint", {
                        Message = "Cannot send empty message!"
                    });
                    return;
                else
                    v10:Close();
                    l_Remote_0.Send("PrivateMessage", l_replyTicket_0, l_Player_0, v12.Text);
                    l_UI_0.Make("Hint", {
                        Message = "Reply sent"
                    });
                end;
            end;
            v9 = false;
        end;
    end;
    local v15 = v10:Add("TextButton", {
        Text = "Send", 
        Size = UDim2.new(0, 60, 0, 30), 
        Position = UDim2.new(1, -65, 1, -35), 
        OnClick = function() --[[ Line: 70 ]] --[[ Name: OnClick ]]
            -- upvalues: v14 (copy)
            v14(true);
        end
    });
    v15.BackgroundColor3 = v15.BackgroundColor3:lerp(Color3.new(0, 0, 0), 0.1);
    v12.FocusLost:Connect(v14);
    v8 = v10.gTable;
    l_UI_0.Make("Notification", {
        Title = "New Message", 
        Message = string.format("Message from %s (@%s)", l_Player_0.DisplayName, l_Player_0.Name), 
        Icon = "rbxassetid://7501175708", 
        Time = false, 
        OnClick = function() --[[ Line: 84 ]] --[[ Name: OnClick ]]
            -- upvalues: v10 (copy)
            v10:Ready();
        end, 
        OnClose = function() --[[ Line: 85 ]] --[[ Name: OnClose ]]
            -- upvalues: v10 (copy)
            v10:Destroy();
        end, 
        OnIgnore = function() --[[ Line: 86 ]] --[[ Name: OnIgnore ]]
            -- upvalues: v10 (copy)
            v10:Destroy();
        end
    });
end;