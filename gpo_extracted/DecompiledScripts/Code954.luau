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
    local l_Window_0 = client.UI.Prepare(script.Parent.Parent).Window;
    local l_ErrorText_0 = l_Window_0.Main.ScrollingFrame.ErrorText;
    local l_Title_0 = l_Window_0.Title;
    local l_Message_0 = v0.Message;
    local l_Title_1 = v0.Title;
    local l_Color_0 = v0.Color;
    local v10 = client.UI.Get("Output");
    if v10 then
        for _, v12 in v10 do
            local l_Object_0 = v12.Object;
            if l_Object_0 and l_Object_0.Parent then
                l_Object_0.Window.Position = UDim2.new(0.5, 0, 0.5, l_Object_0.Window.Position.Y.Offset + 160);
            end;
        end;
    end;
    if l_Title_1 and l_Title_1 ~= "" then
        l_Title_0.Text = l_Title_1;
    else
        l_Title_0.Text = "Error";
    end;
    l_ErrorText_0.Text = l_Message_0;
    if l_Color_0 then
        l_ErrorText_0.TextColor3 = l_Color_0;
    end;
    l_Window_0.Close.MouseButton1Down:Connect(function() --[[ Line: 41 ]]
        gTable.Destroy();
    end);
    spawn(function() --[[ Line: 45 ]]
        local v14 = Instance.new("Sound", service.LocalContainer());
        v14.SoundId = "rbxassetid://160715357";
        v14.Volume = 2;
        v14:Play();
        task.wait(0.8);
        v14:Destroy();
    end);
    gTable.Ready();
    task.wait(5);
    gTable.Destroy();
end;