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
    local v13 = client.Remote.Get("Setting", {
        "SplitKey", 
        "ConsoleKeyCode", 
        "BatchKey", 
        "Prefix"
    });
    local l_SplitKey_0 = v13.SplitKey;
    local l_ConsoleKeyCode_0 = v13.ConsoleKeyCode;
    local l_BatchKey_0 = v13.BatchKey;
    local l_Prefix_0 = v13.Prefix;
    local v18 = client.Remote.Get("FormattedCommands") or {};
    local v19 = TweenInfo.new(0.2);
    local v20 = service.TweenService:Create(l_Frame_0, v19, {
        Size = UDim2.new(1, 0, 0, 140)
    });
    local v21 = service.TweenService:Create(l_Frame_0, v19, {
        Size = UDim2.new(1, 0, 0, 40)
    });
    local v22 = service.TweenService:Create(l_Frame_0, v19, {
        Position = UDim2.new(0, 0, 0.02, 0)
    });
    local v23 = service.TweenService:Create(l_Frame_0, v19, {
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
        local v24 = client.UI.Get("Chat", nil, true);
        if v24 then
            v24.Object.Drag.Visible = true;
        end;
        local v25 = client.UI.Get("PlayerList", nil, true);
        if v25 then
            v25.Object.Drag.Visible = true;
        end;
        local v26 = client.UI.Get("HintHolder", nil, true);
        if v26 then
            v26.Object.Frame.Visible = true;
        end;
    end;
    client.Variables.ChatEnabled = service.StarterGui:GetCoreGuiEnabled("Chat");
    client.Variables.PlayerListEnabled = service.StarterGui:GetCoreGuiEnabled("PlayerList");
    local function v30() --[[ Line: 81 ]] --[[ Name: close ]]
        -- upvalues: l_Parent_0 (copy), v12 (ref), l_ScrollingFrame_0 (copy), l_Frame_0 (copy), l_PlayerList_0 (copy), v23 (copy), v11 (ref)
        if l_Parent_0:IsDescendantOf(game) and not v12 then
            v12 = true;
            l_ScrollingFrame_0:ClearAllChildren();
            l_ScrollingFrame_0.CanvasSize = UDim2.new(0, 0, 0, 0);
            l_ScrollingFrame_0.ScrollingEnabled = false;
            l_Frame_0.Size = UDim2.new(1, 0, 0, 40);
            l_ScrollingFrame_0.Visible = false;
            l_PlayerList_0.Visible = false;
            scrollOpen = false;
            if client.Variables.ChatEnabled then
                service.StarterGui:SetCoreGuiEnabled("Chat", true);
            end;
            if client.Variables.PlayerListEnabled then
                service.StarterGui:SetCoreGuiEnabled("PlayerList", true);
            end;
            if client.UI.Get("Notif") then
                client.UI.Get("Notif", nil, true).Object.LABEL.Visible = true;
            end;
            local v27 = client.UI.Get("Chat", nil, true);
            if v27 then
                v27.Object.Drag.Visible = true;
            end;
            local v28 = client.UI.Get("PlayerList", nil, true);
            if v28 then
                v28.Object.Drag.Visible = true;
            end;
            local v29 = client.UI.Get("HintHolder", nil, true);
            if v29 then
                v29.Object.Frame.Visible = true;
            end;
            v23:Play();
            v12 = false;
            v11 = false;
        end;
    end;
    local function v34() --[[ Line: 121 ]] --[[ Name: open ]]
        -- upvalues: l_Parent_0 (copy), v12 (ref), l_ScrollingFrame_0 (copy), l_PlayerList_0 (copy), v22 (copy), l_Frame_0 (copy), l_TextBox_0 (copy), v11 (ref)
        if l_Parent_0:IsDescendantOf(game) and not v12 then
            v12 = true;
            client.Variables.ChatEnabled = service.StarterGui:GetCoreGuiEnabled("Chat");
            client.Variables.PlayerListEnabled = service.StarterGui:GetCoreGuiEnabled("PlayerList");
            service.StarterGui:SetCoreGuiEnabled("Chat", false);
            service.StarterGui:SetCoreGuiEnabled("PlayerList", false);
            l_ScrollingFrame_0.ScrollingEnabled = true;
            l_PlayerList_0.ScrollingEnabled = true;
            if client.UI.Get("Notif") then
                client.UI.Get("Notif", nil, true).Object.LABEL.Visible = false;
            end;
            local v31 = client.UI.Get("Chat", nil, true);
            if v31 then
                v31.Object.Drag.Visible = false;
            end;
            local v32 = client.UI.Get("PlayerList", nil, true);
            if v32 then
                v32.Object.Drag.Visible = false;
            end;
            local v33 = client.UI.Get("HintHolder", nil, true);
            if v33 then
                v33.Object.Frame.Visible = false;
            end;
            v22:Play();
            l_Frame_0.Size = UDim2.new(1, 0, 0, 40);
            l_ScrollingFrame_0.Visible = false;
            l_PlayerList_0.Visible = false;
            scrollOpen = false;
            l_TextBox_0.Text = "";
            l_Frame_0.Visible = true;
            l_Frame_0.Position = UDim2.new(0, 0, 0, 0);
            l_TextBox_0:CaptureFocus();
            l_TextBox_0.Text = "";
            wait();
            l_TextBox_0.Text = "";
            v12 = false;
            v11 = true;
        end;
    end;
    local function v38(v35) --[[ Line: 164 ]] --[[ Name: isInConsoleBounds ]]
        -- upvalues: l_PlayerGui_0 (copy), l_Parent_0 (copy)
        for _, v37 in ipairs(l_PlayerGui_0:GetGuiObjectsAtPosition(v35.X, v35.Y)) do
            if v37 == l_Parent_0 or v37 == l_Parent_0.Frame then
                return true;
            end;
        end;
        return false;
    end;
    l_TextBox_0.FocusLost:Connect(function(v39) --[[ Line: 171 ]]
        -- upvalues: l_TextBox_0 (copy), v30 (copy), v38 (copy), l_LocalPlayer_0 (copy)
        if v39 then
            if l_TextBox_0.Text ~= "" and string.len(l_TextBox_0.Text) > 1 then
                client.Remote.Send("ProcessCommand", l_TextBox_0.Text);
            end;
            v30();
            return;
        else
            if not v38(l_LocalPlayer_0:GetMouse()) then
                v30();
            end;
            return;
        end;
    end);
    l_TextBox_0.Changed:Connect(function(v40) --[[ Line: 182 ]]
        -- upvalues: l_TextBox_0 (copy), v34 (copy), l_PlayerList_0 (copy), l_ScrollingFrame_0 (copy), l_Prefix_0 (copy), l_BatchKey_0 (copy), l_SplitKey_0 (copy), l_Entry_0 (copy), v18 (copy), v20 (copy), l_Frame_0 (copy), v19 (copy), v11 (ref), v21 (copy)
        if v40 == "Text" and l_TextBox_0.Text ~= "" and v34 then
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
            local v42 = 0;
            local v43 = string.match(l_Text_0, ((".+%*(.*)$"):format(l_SplitKey_0)));
            for _, v45 in next, service.Players:GetPlayers() do
                if v43 and string.sub(string.lower((tostring(v45))), 1, #v43) == string.lower(v43) or string.match(l_Text_0, (("%*$"):format(l_SplitKey_0))) then
                    local v46 = l_Entry_0:Clone();
                    v46.Text = tostring(v45);
                    v46.Name = ("Entry %*"):format(v42);
                    v46.TextXAlignment = "Right";
                    v46.Visible = true;
                    v46.Parent = l_PlayerList_0;
                    v46.Position = UDim2.new(0, 0, 0, v42 * 20);
                    v46.Activated:Connect(function() --[[ Line: 215 ]]
                        -- upvalues: l_TextBox_0 (ref), v45 (copy)
                        l_TextBox_0.Text = l_TextBox_0.Text .. tostring(v45);
                        l_TextBox_0:CaptureFocus();
                    end);
                    v42 = v42 + 1;
                end;
            end;
            l_PlayerList_0.CanvasSize = UDim2.new(0, 0, 0, v42 * 20);
            local v47 = 0;
            for _, v49 in next, v18 do
                if string.sub(string.lower(v49), 1, #l_Text_0) == string.lower(l_Text_0) or string.find(string.lower(v49), string.match(string.lower(l_Text_0), (("^(.-)%*"):format(l_SplitKey_0))) or string.lower(l_Text_0), 1, true) then
                    if not scrollOpen then
                        v20:Play();
                        l_ScrollingFrame_0.Visible = true;
                        l_PlayerList_0.Visible = true;
                        scrollOpen = true;
                    end;
                    local v50 = l_Entry_0:Clone();
                    v50.Visible = true;
                    v50.Parent = l_ScrollingFrame_0;
                    v50.Text = v49;
                    v50.Name = ("Entry %*"):format(v47);
                    v50.Position = UDim2.new(0, 0, 0, v47 * 20);
                    v50.Activated:Connect(function() --[[ Line: 241 ]]
                        -- upvalues: l_TextBox_0 (ref), v50 (copy)
                        l_TextBox_0.Text = v50.Text:gsub("<.->", "");
                        l_TextBox_0:CaptureFocus();
                    end);
                    v47 = v47 + 1;
                end;
            end;
            local v51 = service.TweenService:Create(l_Frame_0, v19, {
                Size = UDim2.new(1, 0, 0, (math.clamp(v47 * 20 + 40, 40, 140)))
            });
            local v52 = service.TweenService:Create(l_ScrollingFrame_0, v19, {
                CanvasSize = UDim2.new(0, 0, 0, v47 * 20)
            });
            v51:Play();
            v52:Play();
            return;
        else
            if v40 == "Text" and l_TextBox_0.Text == "" and v11 then
                v21:Play();
                l_ScrollingFrame_0.Visible = false;
                l_PlayerList_0.Visible = false;
                scrollOpen = false;
                l_ScrollingFrame_0:ClearAllChildren();
                l_ScrollingFrame_0.CanvasSize = UDim2.new(0, 0, 0, 0);
            end;
            return;
        end;
    end);
    l_BindEvent_0(service.UserInputService.InputBegan, function(v53) --[[ Line: 269 ]]
        -- upvalues: l_ConsoleKeyCode_0 (copy), v11 (ref), v30 (copy), v34 (copy)
        if not service.UserInputService:GetFocusedTextBox() and rawequal(v53.UserInputType, Enum.UserInputType.Keyboard) and v53.KeyCode.Name == (client.Variables.CustomConsoleKey or l_ConsoleKeyCode_0) then
            if v11 then
                v30();
            else
                v34();
            end;
            client.Variables.ConsoleOpen = v11;
        end;
    end);
    gTable:Ready();
end;