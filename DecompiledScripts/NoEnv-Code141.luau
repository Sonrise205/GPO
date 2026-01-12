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
    local l_Close_0 = l_Parent_0.Frame.Close;
    local l_Main_0 = l_Parent_0.Frame.Main;
    local l_Title_0 = l_Parent_0.Frame.Title;
    local l_Timer_0 = l_Parent_0.Frame.Timer;
    local l_gTable_0 = v0.gTable;
    local l_OnClick_0 = v0.OnClick;
    local l_OnClose_0 = v0.OnClose;
    local l_OnIgnore_0 = v0.OnIgnore;
    local l_Title_1 = v0.Title;
    local v14 = v0.Message or v0.Text or "";
    local l_Time_0 = v0.Time;
    local v16 = nil;
    if l_OnClick_0 and type(l_OnClick_0) == "string" then
        l_OnClick_0 = client.Core.LoadCode(l_OnClick_0, GetEnv());
    end;
    if l_OnClose_0 and type(l_OnClose_0) == "string" then
        l_OnClose_0 = client.Core.LoadCode(l_OnClose_0, GetEnv());
    end;
    if l_OnIgnore_0 and type(l_OnIgnore_0) == "string" then
        l_OnIgnore_0 = client.Core.LoadCode(l_OnIgnore_0, GetEnv());
    end;
    local v17 = client.UI.Get("NotificationHolder", nil, true);
    if not v17 then
        local v18 = service.New("ScreenGui");
        local v19 = client.UI.Register(v18);
        local v20 = service.New("ScrollingFrame", v18);
        client.UI.Prepare(v18);
        v19.Name = "NotificationHolder";
        v20.Name = "Frame";
        v20.BackgroundTransparency = 1;
        v20.Size = UDim2.new(0, 200, 0.5, 0);
        v20.Position = UDim2.new(1, -210, 0.5, -10);
        v20.CanvasSize = UDim2.new(0, 0, 0, 0);
        v20.ChildAdded:Connect(function(_) --[[ Line: 58 ]]
            -- upvalues: v20 (copy)
            if #v20:GetChildren() == 0 then
                v20.Visible = false;
                return;
            else
                v20.Visible = true;
                return;
            end;
        end);
        v20.ChildRemoved:Connect(function(_) --[[ Line: 66 ]]
            -- upvalues: v20 (copy)
            if #v20:GetChildren() == 0 then
                v20.Visible = false;
                return;
            else
                v20.Visible = true;
                return;
            end;
        end);
        v17 = v19;
        v19:Ready();
    end;
    local function v31(v23, v24) --[[ Line: 78 ]] --[[ Name: moveGuis ]]
        local v25 = {};
        for _, v27 in pairs(v23:GetChildren()) do
            table.insert(v25, 1, v27);
        end;
        for v28, v29 in pairs(v25) do
            v29.Position = UDim2.new(0, 0, 1, -75 * (v28 + v24));
        end;
        v23.CanvasSize = UDim2.new(0, 0, 0, #v23:GetChildren() * 75);
        local v30 = #v23:GetChildren() * 75 - v23.AbsoluteWindowSize.Y;
        if v30 < 0 then
            v30 = 0;
        end;
        v23.CanvasPosition = Vector2.new(0, v30);
    end;
    v17 = v17.Object.Frame;
    l_Title_0.Text = l_Title_1;
    l_Parent_0.Name = l_Title_1;
    l_Main_0.Text = v14;
    local v32 = {
        Type = "Notification", 
        Title = l_Title_1, 
        Message = v14, 
        Icon = icon or 0, 
        Time = os.date("%X"), 
        Function = l_OnClick_0
    };
    table.insert(client.Variables.CommunicationsHistory, v32);
    service.Events.CommsPanel:Fire(v32);
    l_Main_0.MouseButton1Click:Connect(function() --[[ Line: 109 ]]
        -- upvalues: l_Parent_0 (copy), l_OnClick_0 (ref), v16 (ref), v31 (copy), v17 (ref)
        if l_Parent_0 and l_Parent_0.Parent then
            if l_OnClick_0 then
                v16 = l_OnClick_0();
            end;
            l_Parent_0:Destroy();
            v31(v17, 0);
        end;
    end);
    l_Close_0.MouseButton1Click:Connect(function() --[[ Line: 119 ]]
        -- upvalues: l_Parent_0 (copy), l_OnClose_0 (ref), v16 (ref), l_gTable_0 (copy), v31 (copy), v17 (ref)
        if l_Parent_0 and l_Parent_0.Parent then
            if l_OnClose_0 then
                v16 = l_OnClose_0();
            end;
            l_gTable_0:Destroy();
            v31(v17, 0);
        end;
    end);
    v31(v17, 1);
    l_Parent_0.Parent = v17;
    l_Parent_0:TweenPosition(UDim2.new(0, 0, 1, -75), "Out", "Linear", 0.2);
    spawn(function() --[[ Line: 133 ]]
        -- upvalues: v14 (copy), l_Title_1 (copy)
        local v33 = Instance.new("Sound", service.LocalContainer());
        if v14 == "Click here for commands." then
            v33.SoundId = "rbxassetid://987728667";
        elseif l_Title_1 == "Warning!" then
            v33.SoundId = "rbxassetid://428495297";
        else
            v33.SoundId = "rbxassetid://2275705078";
        end;
        wait(0.1);
        v33:Play();
        wait(1);
        v33:Destroy();
    end);
    if l_Time_0 then
        l_Timer_0.Visible = true;
        spawn(function() --[[ Line: 150 ]]
            -- upvalues: l_Timer_0 (copy), l_Time_0 (ref), l_Parent_0 (copy), l_OnIgnore_0 (ref), v16 (ref), v31 (copy), v17 (ref)
            repeat
                l_Timer_0.Text = math.floor(l_Time_0 * 100) / 100;
                wait(1);
                l_Time_0 = l_Time_0 - 1;
            until l_Time_0 <= 0 or not l_Parent_0 or not l_Parent_0.Parent;
            if l_Parent_0 and l_Parent_0.Parent then
                if l_OnIgnore_0 then
                    v16 = l_OnIgnore_0();
                end;
                l_Parent_0:Destroy();
                v31(v17, 0);
            end;
        end);
    end;
    repeat
        wait();
    until v16 ~= nil or not l_Parent_0 or not l_Parent_0.Parent;
    return v16;
end;