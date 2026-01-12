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
    local v9 = v0.Color or Color3.fromRGB(255, 78, 78);
    local v10 = TweenInfo.new(0.2);
    local v11 = service.TweenService:Create(l_Main_0, v10, {
        Position = UDim2.new(0.11, 0, 0.35, 0)
    });
    local v12 = service.TweenService:Create(l_Main_0, v10, {
        Position = UDim2.new(0.11, 0, 0, -200)
    });
    local v13 = client.UI.Get("Output");
    if v13 then
        for _, v15 in pairs(v13) do
            local l_Object_0 = v15.Object;
            if l_Object_0 and l_Object_0.Parent then
                service.TweenService:Create(l_Object_0.Main, v10, {
                    Position = UDim2.new(0.11, 0, 0.35, l_Object_0.Main.Position.Y.Offset + 55)
                }):Play();
            end;
        end;
    end;
    l_Message_0.TextColor3 = v9;
    l_Main_0.BackgroundColor3 = v9;
    local l_l_Message_1_0 = l_Message_1;
    if l_Title_1 and l_Title_1 ~= "" then
        l_l_Message_1_0 = ("<b>%*</b>: %*"):format(l_Title_1, l_Message_1);
    end;
    l_Message_0.Text = l_l_Message_1_0;
    l_Message_0.Font = "Gotham";
    v11:Play();
    gTable.Ready();
    task.wait(5);
    v12:Play();
    task.wait(2);
    gTable.Destroy();
end;