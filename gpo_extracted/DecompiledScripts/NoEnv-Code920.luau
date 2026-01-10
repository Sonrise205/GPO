client = nil;
Pcall = nil;
Routine = nil;
service = nil;
return function(v0, v1) --[[ Line: 6 ]]
    if v1 then
        setfenv(1, v1);
    end;
    local l_gTable_0 = v0.gTable;
    local l_Object_0 = l_gTable_0.Object;
    local _ = service.PlayerGui;
    local l_Message_0 = v0.Message;
    local l_msg_0 = l_Object_0.HintFrame.Frame.msg;
    client.Core.RemoveGui("Hint", l_Object_0);
    l_msg_0.Text = l_Message_0;
    l_gTable_0:Ready();
    wait(v0.Time or 5);
    l_Object_0:Destroy();
end;