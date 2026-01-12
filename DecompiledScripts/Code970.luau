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
    local _ = l_Main_0.Title;
    local l_Message_0 = l_Main_0.Message;
    local l_Message_1 = v0.Message;
    local v8 = v0.Title or "";
    local _ = v0.Color;
    local v10 = nil;
    v10 = if v8 and v8 ~= "" then ("<b>%*</b>: %*"):format(v8, l_Message_1) else l_Message_1;
    local v11 = client.UI.Get("Output");
    if v11 then
        for _, v13 in pairs(v11) do
            local l_Object_0 = v13.Object;
            if l_Object_0 and l_Object_0.Parent then
                l_Object_0.Main.Position = UDim2.new(0, 0, 0.35, l_Object_0.Main.Position.Y.Offset + 50);
            end;
        end;
    end;
    l_Message_0.Text = v10;
    l_Message_0.Font = Enum.Font.SourceSans;
    if v0.Color then
        l_Message_0.TextColor3 = v0.Color;
    end;
    gTable.Ready();
    task.wait(5);
    gTable.Destroy();
end;