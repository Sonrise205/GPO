client = nil;
Pcall = nil;
Routine = nil;
service = nil;
gTable = nil;
return function(_, v1) --[[ Line: 10 ]]
    if v1 then
        setfenv(1, v1);
    end;
    local l_LocalPlayer_0 = service.Players.LocalPlayer;
    local l_PlayerGui_0 = l_LocalPlayer_0.PlayerGui;
    local l_Parent_0 = script.Parent.Parent;
    local l_Frame_0 = l_Parent_0.Frame;
    local l_TextBox_0 = l_Parent_0.Frame.TextBox;
    local l_ScrollingFrame_0 = l_Parent_0.Frame.ScrollingFrame;
    local l_PlayerList_0 = l_Parent_0.Frame.PlayerList;
    local l_Entry_0 = l_Parent_0.Entry;
    local l_BindEvent_0 = gTable.BindEvent;
    local v11 = false;
    local v12 = false;
    local v13 = false;
    local v14 = client.Remote.Get("Setting", {
        "SplitKey", 
        "ConsoleKeyCode", 
        "BatchKey", 
        "Prefix"
    });
    local l_SplitKey_0 = v14.SplitKey;
    local l_ConsoleKeyCode_0 = v14.ConsoleKeyCode;
    local l_BatchKey_0 = v14.BatchKey;
    local l_Prefix_0 = v14.Prefix;
    local v19 = client.Remote.Get("FormattedCommands") or {};
    local v20 = TweenInfo.new(0.15);
    local v21 = service.TweenService:Create(l_Frame_0, v20, {
        Size = UDim2.new(1, 0, 0, 140)
    });
    local v22 = service.TweenService:Create(l_Frame_0, v20, {
        Size = UDim2.new(1, 0, 0, 40)
    });
    local v23 = service.TweenService:Create(l_Frame_0, v20, {
        Position = UDim2.new(0, 0, 0, 0)
    });
    local v24 = service.TweenService:Create(l_Frame_0, v20, {
        Position = UDim2.new(0, 0, 0, -200)
    });
    l_Frame_0.Position = UDim2.new(0, 0, 0, -200);
    l_Frame_0.Visible = false;
    l_Frame_0.Size = UDim2.new(1, 0, 0, 40);
    l_ScrollingFrame_0.Visible = false;
    if client.Variables.ConsoleOpen then
        if client.Variables.ChatEnabled then
            service.StarterGui:SetCoreGuiEnabled("Chat", true);
        end;
        if client.Variables.PlayerListEnabled then
            service.StarterGui:SetCoreGuiEnabled("PlayerList", true);
        end;
        if client.UI.Get("Notif") then
            client.UI.Get("Notif", nil, true).Object.LABEL.Visible = true;
        end;
        local v25 = client.UI.Get("Chat", nil, true);
        if v25 then
            v25.Object.Drag.Visible = true;
        end;
        local v26 = client.UI.Get("PlayerList", nil, true);
        if v26 then
            v26.Object.Drag.Visible = true;
        end;
        local v27 = client.UI.Get("HintHolder", nil, true);
        if v27 then
            v27.Object.Frame.Visible = true;
        end;
    end;
    client.Variables.ChatEnabled = service.StarterGui:GetCoreGuiEnabled("Chat");
    client.Variables.PlayerListEnabled = service.StarterGui:GetCoreGuiEnabled("PlayerList");
    local function v31() --[[ Line: 83 ]] --[[ Name: close ]]
        -- upvalues: l_Parent_0 (copy), v13 (ref), l_ScrollingFrame_0 (copy), l_Frame_0 (copy), l_PlayerList_0 (copy), v12 (ref), v24 (copy), v11 (ref)
        if l_Parent_0:IsDescendantOf(game) and not v13 then
            v13 = true;
            l_ScrollingFrame_0:ClearAllChildren();
            l_ScrollingFrame_0.CanvasSize = UDim2.new(0, 0, 0, 0);
            l_ScrollingFrame_0.ScrollingEnabled = false;
            l_Frame_0.Size = UDim2.new(1, 0, 0, 40);
            l_ScrollingFrame_0.Visible = false;
            l_PlayerList_0.Visible = false;
            v12 = false;
            if client.Variables.ChatEnabled then
                service.StarterGui:SetCoreGuiEnabled("Chat", true);
            end;
            if client.Variables.PlayerListEnabled then
                service.StarterGui:SetCoreGuiEnabled("PlayerList", true);
            end;
            if client.UI.Get("Notif") then
                client.UI.Get("Notif", nil, true).Object.LABEL.Visible = true;
            end;
            local v28 = client.UI.Get("Chat", nil, true);
            if v28 then
                v28.Object.Drag.Visible = true;
            end;
            local v29 = client.UI.Get("PlayerList", nil, true);
            if v29 then
                v29.Object.Drag.Visible = true;
            end;
            local v30 = client.UI.Get("HintHolder", nil, true);
            if v30 then
                v30.Object.Frame.Visible = true;
            end;
            v24:Play();
            v13 = false;
            v11 = false;
        end;
    end;
    local function v35() --[[ Line: 123 ]] --[[ Name: open ]]
        -- upvalues: l_Parent_0 (copy), v13 (ref), l_ScrollingFrame_0 (copy), l_PlayerList_0 (copy), v23 (copy), l_Frame_0 (copy), v12 (ref), l_TextBox_0 (copy), v11 (ref)
        if l_Parent_0:IsDescendantOf(game) and not v13 then
            v13 = true;
            client.Variables.ChatEnabled = service.StarterGui:GetCoreGuiEnabled("Chat");
            client.Variables.PlayerListEnabled = service.StarterGui:GetCoreGuiEnabled("PlayerList");
            service.StarterGui:SetCoreGuiEnabled("Chat", false);
            service.StarterGui:SetCoreGuiEnabled("PlayerList", false);
            l_ScrollingFrame_0.ScrollingEnabled = true;
            l_PlayerList_0.ScrollingEnabled = true;
            if client.UI.Get("Notif") then
                client.UI.Get("Notif", nil, true).Object.LABEL.Visible = false;
            end;
            local v32 = client.UI.Get("Chat", nil, true);
            if v32 then
                v32.Object.Drag.Visible = false;
            end;
            local v33 = client.UI.Get("PlayerList", nil, true);
            if v33 then
                v33.Object.Drag.Visible = false;
            end;
            local v34 = client.UI.Get("HintHolder", nil, true);
            if v34 then
                v34.Object.Frame.Visible = false;
            end;
            v23:Play();
            l_Frame_0.Size = UDim2.new(1, 0, 0, 40);
            l_ScrollingFrame_0.Visible = false;
            l_PlayerList_0.Visible = false;
            v12 = false;
            l_TextBox_0.Text = "";
            l_Frame_0.Visible = true;
            l_Frame_0.Position = UDim2.new(0, 0, 0, 0);
            l_TextBox_0:CaptureFocus();
            l_TextBox_0.Text = "";
            task.wait();
            l_TextBox_0.Text = "";
            v13 = false;
            v11 = true;
        end;
    end;
    local function v39(v36) --[[ Line: 166 ]] --[[ Name: isInConsoleBounds ]]
        -- upvalues: l_PlayerGui_0 (copy), l_Parent_0 (copy)
        for _, v38 in ipairs(l_PlayerGui_0:GetGuiObjectsAtPosition(v36.X, v36.Y)) do
            if v38 == l_Parent_0 or v38 == l_Parent_0.Frame then
                return true;
            end;
        end;
        return false;
    end;
    l_TextBox_0.FocusLost:Connect(function(v40) --[[ Line: 173 ]]
        -- upvalues: l_TextBox_0 (copy), v31 (copy), v39 (copy), l_LocalPlayer_0 (copy)
        if v40 then
            if l_TextBox_0.Text ~= "" and string.len(l_TextBox_0.Text) > 1 then
                task.spawn(function() --[[ Line: 176 ]]
                    local v41 = Instance.new("Sound", service.LocalContainer());
                    v41.SoundId = "rbxassetid://669596713";
                    v41.Volume = 0.2;
                    v41:Play();
                    task.wait(0.5);
                    v41:Destroy();
                end);
                client.Remote.Send("ProcessCommand", ":" .. l_TextBox_0.Text);
            end;
            v31();
            return;
        else
            if not v39(l_LocalPlayer_0:GetMouse()) then
                v31();
            end;
            return;
        end;
    end);
    l_TextBox_0.Changed:Connect(function(v42) --[[ Line: 192 ]]
        -- upvalues: l_TextBox_0 (copy), v35 (copy), l_PlayerList_0 (copy), l_ScrollingFrame_0 (copy), l_Prefix_0 (copy), l_BatchKey_0 (copy), l_SplitKey_0 (copy), l_Entry_0 (copy), v19 (copy), v12 (ref), v21 (copy), l_Frame_0 (copy), v11 (ref), v22 (copy)
        if v42 == "Text" and l_TextBox_0.Text ~= "" and v35 then
            if string.sub(l_TextBox_0.Text, (string.len(l_TextBox_0.Text))) == "\t" then
                if l_PlayerList_0:FindFirstChild("Entry 0") then
                    l_TextBox_0.Text = ("%*%* "):format(string.sub(l_TextBox_0.Text, 1, string.len(l_TextBox_0.Text) - 1), l_PlayerList_0["Entry 0"].Text);
                elseif l_ScrollingFrame_0:FindFirstChild("Entry 0") then
                    l_TextBox_0.Text = string.split(l_ScrollingFrame_0["Entry 0"].Text, "<")[1];
                else
                    l_TextBox_0.Text = l_TextBox_0.Text .. l_Prefix_0;
                end;
                l_TextBox_0.CursorPosition = string.len(l_TextBox_0.Text) + 1;
                l_TextBox_0.Text = string.gsub(l_TextBox_0.Text, "\t", "");
            end;
            l_ScrollingFrame_0:ClearAllChildren();
            l_PlayerList_0:ClearAllChildren();
            local l_Text_0 = l_TextBox_0.Text;
            if string.match(l_Text_0, ((".*%*([^']+)"):format(l_BatchKey_0))) then
                l_Text_0 = string.match(l_Text_0, ((".*%*([^']+)"):format(l_BatchKey_0)));
                l_Text_0 = string.match(l_Text_0, "^%s*(.-)%s*$");
            end;
            local v44 = 0;
            local v45 = string.match(l_Text_0, ((".+%*(.*)$"):format(l_SplitKey_0)));
            for _, v47 in service.Players:GetPlayers() do
                if v45 and string.sub(string.lower((tostring(v47))), 1, #v45) == string.lower(v45) or string.match(l_Text_0, (("%*$"):format(l_SplitKey_0))) then
                    local v48 = l_Entry_0:Clone();
                    v48.Text = tostring(v47);
                    v48.Name = ("Entry %*"):format(v44);
                    v48.TextXAlignment = "Right";
                    v48.Visible = true;
                    v48.Parent = l_PlayerList_0;
                    v48.Position = UDim2.new(0, 0, 0, v44 * 20);
                    v48.MouseButton1Down:Connect(function() --[[ Line: 225 ]]
                        -- upvalues: l_TextBox_0 (ref), v47 (copy)
                        l_TextBox_0.Text = l_TextBox_0.Text .. tostring(v47);
                        l_TextBox_0:CaptureFocus();
                    end);
                    v44 = v44 + 1;
                end;
            end;
            l_PlayerList_0.CanvasSize = UDim2.new(0, 0, 0, v44 * 20);
            local v49 = 0;
            for _, v51 in v19 do
                if string.sub(string.lower(v51), 1, #l_Text_0) == string.lower(l_Text_0) or string.find(string.lower(v51), string.match(string.lower(l_Text_0), (("^(.-)%*"):format(l_SplitKey_0))) or string.lower(l_Text_0), 1, true) then
                    if not v12 then
                        v21:Play();
                        l_ScrollingFrame_0.Visible = true;
                        l_PlayerList_0.Visible = true;
                        v12 = true;
                    end;
                    local v52 = l_Entry_0:Clone();
                    v52.Visible = true;
                    v52.Parent = l_ScrollingFrame_0;
                    v52.Text = v51;
                    v52.Name = ("Entry %*"):format(v49);
                    v52.Position = UDim2.new(0, 0, 0, v49 * 20);
                    v52.MouseButton1Down:Connect(function() --[[ Line: 251 ]]
                        -- upvalues: l_TextBox_0 (ref), v52 (copy)
                        l_TextBox_0.Text = v52.Text;
                        l_TextBox_0:CaptureFocus();
                    end);
                    v49 = v49 + 1;
                end;
            end;
            l_Frame_0.Size = UDim2.new(1, 0, 0, (math.clamp(v49 * 20 + 40, 40, 140)));
            l_ScrollingFrame_0.CanvasSize = UDim2.new(0, 0, 0, v49 * 20);
            return;
        else
            if v42 == "Text" and l_TextBox_0.Text == "" and v11 then
                v22:Play();
                l_ScrollingFrame_0.Visible = false;
                l_PlayerList_0.Visible = false;
                v12 = false;
                l_ScrollingFrame_0:ClearAllChildren();
                l_ScrollingFrame_0.CanvasSize = UDim2.new(0, 0, 0, 0);
            end;
            return;
        end;
    end);
    l_BindEvent_0(service.UserInputService.InputBegan, function(v53) --[[ Line: 271 ]]
        -- upvalues: l_ConsoleKeyCode_0 (copy), v11 (ref), v31 (copy), v35 (copy)
        if not service.UserInputService:GetFocusedTextBox() and rawequal(v53.UserInputType, Enum.UserInputType.Keyboard) and v53.KeyCode.Name == (client.Variables.CustomConsoleKey or l_ConsoleKeyCode_0) then
            if v11 then
                v31();
            else
                v35();
            end;
            client.Variables.ConsoleOpen = v11;
        end;
    end);
    gTable:Ready();
end;