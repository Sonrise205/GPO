client = nil;
Pcall = nil;
Routine = nil;
service = nil;
gTable = nil;
return function(v0, v1) --[[ Line: 10 ]]
    if v1 then
        setfenv(1, v1);
    end;
    local l_Parent_0 = script.Parent.Parent;
    local _ = service.PlayerGui;
    local l_Message_0 = v0.Message;
    local _ = v0.Time or 15;
    local v6 = {
        Type = "Hint", 
        Title = "Hint", 
        Message = l_Message_0, 
        Icon = "rbxassetid://7501175708", 
        Time = os.date("%X"), 
        Function = nil
    };
    table.insert(client.Variables.CommunicationsHistory, v6);
    service.Events.CommsPanel:Fire(v6);
    local v7 = client.UI.Get("HintHolder", nil, true);
    if not v7 then
        local v8 = service.New("ScreenGui");
        local v9 = client.UI.Register(v8);
        local v10 = service.New("ScrollingFrame", v8);
        client.UI.Prepare(v8);
        v9.Name = "HintHolder";
        v10.Name = "Frame";
        v10.BackgroundTransparency = 1;
        v10.Size = UDim2.new(1, 0, 0, 150);
        v10.CanvasSize = UDim2.new(0, 0, 0, 0);
        local l_v10_0 = v10 --[[ copy: 10 -> 15 ]];
        v10.ChildAdded:Connect(function(_) --[[ Line: 43 ]]
            -- upvalues: l_v10_0 (copy)
            if #l_v10_0:GetChildren() == 0 then
                l_v10_0.Visible = false;
                return;
            else
                l_v10_0.Visible = true;
                return;
            end;
        end);
        v10.ChildRemoved:Connect(function(_) --[[ Line: 51 ]]
            -- upvalues: l_v10_0 (copy)
            if #l_v10_0:GetChildren() == 0 then
                l_v10_0.Visible = false;
                return;
            else
                l_v10_0.Visible = true;
                return;
            end;
        end);
        v7 = v9;
        v9:Ready();
    end;
    v7 = v7.Object.Frame;
    local v14 = client.UI.Get("Notif");
    local v15 = client.UI.Get("TopBar");
    v7.Position = UDim2.new(0, 0, 0, (v14 and 30 or 0) + (v15 and 40 or 0) - 35);
    local _ = v7:GetChildren();
    l_Parent_0.Position = UDim2.new(0, 0, 0, -100);
    l_Parent_0.Frame.msg.Text = l_Message_0;
    local _ = l_Parent_0.Frame.msg.TextBounds.X;
    local function v24(v18, v19) --[[ Line: 76 ]] --[[ Name: moveGuis ]]
        -- upvalues: v7 (ref)
        v18 = v18 or 0;
        local v20 = #v7:GetChildren();
        for v21, v22 in pairs(v7:GetChildren()) do
            if v22 ~= v19 then
                local v23 = (v21 + v18) * 28;
                v22.Position = UDim2.new(0, 0, 0, v23);
                if v21 ~= v20 then
                    v22.Size = UDim2.new(1, 0, 0, 28);
                end;
            end;
        end;
    end;
    local v25 = -1;
    v24(-1);
    l_Parent_0.Parent = v7;
    if #v7:GetChildren() > 5 then
        v25 = -2;
    end;
    UDim2.new(0, 0, 0, (#v7:GetChildren() + v25) * 28);
    v24(-1);
    if #v7:GetChildren() > 5 then
        local v26 = v7:GetChildren()[1];
        v24(-2, v26);
        v26:Destroy();
    end;
    wait(v0.Time or 5);
    if l_Parent_0 and l_Parent_0.Parent then
        v24(-2, l_Parent_0);
        l_Parent_0:Destroy();
    end;
end;