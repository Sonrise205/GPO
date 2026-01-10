client = nil;
Pcall = nil;
Routine = nil;
service = nil;
gTable = nil;
return function(v0, v1) --[[ Line: 9 ]]
    if v1 then
        setfenv(1, v1);
    end;
    local _ = service.PlayerGui;
    local v3 = client.UI.Prepare(script.Parent.Parent);
    local l_LABEL_0 = v3.LABEL;
    local l_Message_0 = v0.Message;
    local v6 = client.UI.Get("TopBar");
    client.UI.Remove("Notif", script.Parent.Parent);
    local v7 = {
        Type = "Notif", 
        Title = "Notif", 
        Message = l_Message_0, 
        Icon = "rbxassetid://7501175708", 
        Time = os.date("%X"), 
        Function = nil
    };
    table.insert(client.Variables.CommunicationsHistory, v7);
    service.Events.CommsPanel:Fire(v7);
    if l_Message_0 and type(l_Message_0) == "string" then
        l_LABEL_0.Text = l_Message_0;
        l_LABEL_0.Position = UDim2.new(0, 0, 0, (v6 and 40 or 0) - 35);
        gTable:Ready();
        return;
    else
        v3:Destroy();
        return;
    end;
end;