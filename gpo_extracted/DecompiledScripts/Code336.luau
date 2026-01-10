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
    local _ = service.Players.LocalPlayer;
    local l_Main_0 = client.UI.Prepare(script.Parent.Parent).Main;
    local l_Title_0 = l_Main_0.Title;
    local l_Message_0 = l_Main_0.Message;
    local l_Message_1 = v0.Message;
    local l_Title_1 = v0.Title;
    local l_Color_0 = v0.Color;
    if l_Title_1 and l_Title_1 ~= "" then
        l_Title_0.Text = l_Title_1;
    end;
    l_Message_0.Text = l_Message_1;
    l_Message_0.Font = "SourceSans";
    if l_Color_0 then
        l_Message_0.TextColor3 = l_Color_0;
    end;
    gTable.Ready();
    wait(5);
    gTable.Destroy();
end;