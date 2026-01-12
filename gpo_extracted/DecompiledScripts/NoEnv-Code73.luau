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
    local v6 = client.UI.Get("HintHolder", nil, true);
    if not v6 then
        local v7 = service.New("ScreenGui");
        local v8 = client.UI.Register(v7);
        local v9 = service.New("ScrollingFrame", v7);
        client.UI.Prepare(v7);
        v8.Name = "HintHolder";
        v9.Name = "Frame";
        v9.BackgroundTransparency = 1;
        v9.Size = UDim2.new(1, 0, 0, 150);
        v9.CanvasSize = UDim2.new(0, 0, 0, 0);
        local l_v9_0 = v9 --[[ copy: 9 -> 14 ]];
        v9.ChildAdded:Connect(function(_) --[[ Line: 32 ]]
            -- upvalues: l_v9_0 (copy)
            if #l_v9_0:GetChildren() == 0 then
                l_v9_0.Visible = false;
                return;
            else
                l_v9_0.Visible = true;
                return;
            end;
        end);
        v9.ChildRemoved:Connect(function(_) --[[ Line: 40 ]]
            -- upvalues: l_v9_0 (copy)
            if #l_v9_0:GetChildren() == 0 then
                l_v9_0.Visible = false;
                return;
            else
                l_v9_0.Visible = true;
                return;
            end;
        end);
        v6 = v8;
        v8:Ready();
    end;
    v6 = v6.Object.Frame;
    local v13 = client.UI.Get("Notif");
    local v14 = client.UI.Get("TopBar");
    v6.Position = UDim2.new(0, 0, 0, (v13 and 30 or 0) + (v14 and 40 or 0) - 35);
    local _ = v6:children();
    l_Parent_0.Position = UDim2.new(0, 0, 0, -100);
    l_Parent_0.Frame.msg.Text = l_Message_0;
    local _ = l_Parent_0.Frame.msg.TextBounds.X;
    spawn(function() --[[ Line: 65 ]]
        local v17 = Instance.new("Sound", service.LocalContainer());
        v17.SoundId = "rbxassetid://489390072";
        wait(0.1);
        v17:Play();
        wait(0.8);
        v17:Destroy();
    end);
    local function v24(v18, v19) --[[ Line: 74 ]] --[[ Name: moveGuis ]]
        -- upvalues: v6 (ref)
        v18 = v18 or 0;
        local v20 = #v6:children();
        for v21, v22 in pairs(v6:children()) do
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
    l_Parent_0.Parent = v6;
    if #v6:children() > 5 then
        v25 = -2;
    end;
    UDim2.new(0, 0, 0, (#v6:children() + v25) * 28);
    v24(-1);
    if #v6:children() > 5 then
        local v26 = v6:children()[1];
        v24(-2, v26);
        v26:Destroy();
    end;
    wait(v0.Time or 5);
    if l_Parent_0 and l_Parent_0.Parent then
        v24(-2, l_Parent_0);
        l_Parent_0:Destroy();
    end;
end;