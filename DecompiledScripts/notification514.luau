client = nil;
Pcall = nil;
Routine = nil;
service = nil;
GetEnv = nil;
gTable = nil;
return function(v0, v1) --[[ Line: 10 ]]
    if v1 then
        setfenv(1, v1);
    end;
    local _ = service.PlayerGui;
    local _ = service.Players.LocalPlayer;
    local l_Parent_0 = script.Parent.Parent;
    local l_Frame_0 = l_Parent_0:WaitForChild("Frame");
    local l_Icon_0 = l_Frame_0:WaitForChild("Icon");
    local l_Main_0 = l_Frame_0:WaitForChild("Main");
    local l_Close_0 = l_Frame_0:WaitForChild("Close");
    local l_Title_0 = l_Frame_0:WaitForChild("Title");
    local l_Timer_0 = l_Frame_0:WaitForChild("Timer");
    local l_gTable_0 = v0.gTable;
    local l_OnClick_0 = v0.OnClick;
    local l_OnClose_0 = v0.OnClose;
    local l_OnIgnore_0 = v0.OnIgnore;
    local l_Title_1 = v0.Title;
    local v16 = v0.Message or v0.Text or "";
    local l_Time_0 = v0.Time;
    local v18 = v0.Icon or client.MatIcons.Info;
    if l_OnClick_0 and type(l_OnClick_0) == "string" then
        l_OnClick_0 = client.Core.LoadCode(l_OnClick_0, GetEnv());
    end;
    if l_OnClose_0 and type(l_OnClose_0) == "string" then
        l_OnClose_0 = client.Core.LoadCode(l_OnClose_0, GetEnv());
    end;
    if l_OnIgnore_0 and type(l_OnIgnore_0) == "string" then
        l_OnIgnore_0 = client.Core.LoadCode(l_OnIgnore_0, GetEnv());
    end;
    local v19 = client.UI.Get("NotificationHolder", nil, true);
    if not v19 then
        client.UI.Make("NotificationHolder");
        v19 = client.UI.Get("NotificationHolder", nil, true);
        v19.Object.ScrollingFrame.Active = false;
    end;
    v19 = v19.Object.ScrollingFrame;
    l_Title_0.Text = l_Title_1;
    l_Main_0.Text = v16;
    l_Icon_0.Image = v18;
    local v20 = {
        Type = "Notification", 
        Title = l_Title_1, 
        Message = v16, 
        Icon = v18 or 0, 
        Time = os.date("%X"), 
        Function = l_OnClick_0
    };
    table.insert(client.Variables.CommunicationsHistory, v20);
    service.Events.CommsPanel:Fire(v20);
    l_Main_0.MouseButton1Click:Connect(function() --[[ Line: 72 ]]
        -- upvalues: l_Parent_0 (copy), l_OnClick_0 (ref)
        if l_Parent_0 and l_Parent_0.Parent then
            if l_OnClick_0 then
                l_OnClick_0();
            end;
            l_Parent_0:Destroy();
        end;
    end);
    l_Close_0.MouseButton1Click:Connect(function() --[[ Line: 81 ]]
        -- upvalues: l_Parent_0 (copy), l_OnClose_0 (ref), l_gTable_0 (copy)
        if l_Parent_0 and l_Parent_0.Parent then
            if l_OnClose_0 then
                l_OnClose_0();
            end;
            l_gTable_0:Destroy();
        end;
    end);
    l_Parent_0.Parent = v19;
    task.spawn(function() --[[ Line: 92 ]]
        local v21 = Instance.new("Sound", service.LocalContainer());
        v21.SoundId = "rbxassetid://203785584";
        v21.Volume = 0.2;
        v21:Play();
        wait(0.5);
        v21:Destroy();
    end);
    if l_Time_0 then
        l_Timer_0.Visible = true;
        repeat
            l_Timer_0.Text = math.floor(l_Time_0 * 100) / 100;
            wait(1);
            l_Time_0 = l_Time_0 - 1;
        until l_Time_0 <= 0 or not l_Parent_0 or not l_Parent_0.Parent;
        if l_Parent_0 and l_Parent_0.Parent then
            if l_Parent_0 then
                l_Parent_0:Destroy();
            end;
            if l_OnIgnore_0 then
                l_OnIgnore_0();
            end;
        end;
    end;
    return nil;
end;