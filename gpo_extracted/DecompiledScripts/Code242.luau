client = nil;
Pcall = nil;
Routine = nil;
service = nil;
gTable = nil;
return function(v0) --[[ Line: 9 ]]
    local _ = service.PlayerGui;
    local _ = service.Players.LocalPlayer;
    local l_Parent_0 = script.Parent.Parent;
    local l_Frame_0 = l_Parent_0.Frame;
    local l_Close_0 = l_Parent_0.Frame.Close;
    local l_Reply_0 = l_Parent_0.Frame.Reply;
    local l_ReplyBox_0 = l_Parent_0.Frame.Frame.ReplyBox;
    local l_Message_0 = l_Parent_0.Frame.Frame.Message;
    local l_Title_0 = l_Parent_0.Frame.Title;
    local l_Remote_0 = client.Remote;
    local l_replyTicket_0 = v0.replyTicket;
    local l_Player_0 = v0.Player;
    local l_Message_1 = v0.Message;
    local l_Title_1 = v0.Title;
    local v15 = false;
    local function v16() --[[ Line: 27 ]] --[[ Name: send ]]
        -- upvalues: l_ReplyBox_0 (copy), l_Parent_0 (copy), l_Remote_0 (copy), l_replyTicket_0 (copy), l_Player_0 (copy)
        if l_ReplyBox_0.Text ~= "Enter text then hit enter or \"reply\"" and #l_ReplyBox_0.Text > 0 then
            l_Parent_0:Destroy();
            l_Remote_0.Send("PrivateMessage", l_replyTicket_0, l_Player_0, l_ReplyBox_0.Text);
            client.UI.Make("Hint", {
                Message = "Reply sent"
            });
            return;
        else
            l_ReplyBox_0.Text = "Enter text then hit enter or \"reply\"";
            return;
        end;
    end;
    l_Frame_0.Visible = false;
    l_ReplyBox_0.Visible = true;
    l_Reply_0.Visible = true;
    l_Message_0.Text = l_Message_1;
    l_Title_0.Text = l_Title_1;
    l_ReplyBox_0.FocusLost:connect(function(v17) --[[ Line: 46 ]]
        -- upvalues: v16 (copy)
        if v17 then
            v16();
        end;
    end);
    l_Close_0.MouseButton1Click:connect(function() --[[ Line: 52 ]]
        -- upvalues: l_Parent_0 (copy)
        l_Parent_0:Destroy();
    end);
    l_Reply_0.MouseButton1Click:connect(function() --[[ Line: 56 ]]
        -- upvalues: v15 (ref), l_Frame_0 (copy), l_ReplyBox_0 (copy), v16 (copy)
        if not v15 then
            v15 = true;
            l_Frame_0:TweenSize(UDim2.new(0, 300, 0, 280), nil, nil, 0.5);
            l_ReplyBox_0:CaptureFocus();
            return;
        else
            v16();
            return;
        end;
    end);
    client.UI.Make("Notification", {
        Title = "New Message", 
        Message = "New Message from " .. l_Player_0.Name .. ". Click to here to view.", 
        Time = false, 
        OnClick = function() --[[ Line: 70 ]] --[[ Name: OnClick ]]
            -- upvalues: l_Frame_0 (copy)
            gTable:Ready();
            l_Frame_0.Visible = true;
        end, 
        OnClose = function() --[[ Line: 71 ]] --[[ Name: OnClose ]]
            gTable:Destroy();
        end, 
        OnIgnore = function() --[[ Line: 72 ]] --[[ Name: OnIgnore ]]
            gTable:Destroy();
        end
    });
end;