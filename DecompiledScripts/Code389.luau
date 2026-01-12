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
    local l_Title_1 = v0.Title;
    local l_Color_0 = v0.Color;
    local v10 = client.UI.Get("Output");
    if v10 then
        for _, v12 in pairs(v10) do
            local l_Object_0 = v12.Object;
            if l_Object_0 and l_Object_0.Parent then
                l_Object_0.Main.Position = UDim2.new(0, 0, 0.35, l_Object_0.Main.Position.Y.Offset + 50);
            end;
        end;
    end;
    local l_l_Message_1_0 = l_Message_1;
    if l_Title_1 and l_Title_1 ~= "" then
        l_l_Message_1_0 = ("<b>%*</b>: %*"):format(l_Title_1, l_Message_1);
    end;
    l_Message_0.Text = l_l_Message_1_0;
    l_Message_0.Font = "Arial";
    if l_Color_0 then
        l_Message_0.TextColor3 = l_Color_0;
    end;
    gTable.Ready();
    task.wait(5);
    gTable.Destroy();
end;