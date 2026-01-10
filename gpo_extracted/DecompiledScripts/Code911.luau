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
    local l_UI_0 = client.UI;
    local l_Remote_0 = client.Remote;
    local l_Variables_0 = client.Variables;
    local l_Parent_0 = script.Parent.Parent;
    gTable.Name = "Console";
    gTable.CanKeepAlive = true;
    local l_Frame_0 = l_Parent_0.Frame;
    local l_TextBox_0 = l_Frame_0.TextBox;
    local l_ScrollingFrame_0 = l_Frame_0.ScrollingFrame;
    local l_PlayerList_0 = l_Frame_0.PlayerList;
    local l_Entry_0 = l_Parent_0.Entry;
    local v13 = l_Remote_0.Get("Setting", {
        "SplitKey", 
        "ConsoleKeyCode", 
        "BatchKey", 
        "Prefix"
    });
    local l_SplitKey_0 = v13.SplitKey;
    local l_ConsoleKeyCode_0 = v13.ConsoleKeyCode;
    local l_BatchKey_0 = v13.BatchKey;
    local l_Prefix_0 = v13.Prefix;
    local v18 = l_Remote_0.Get("FormattedCommands") or {};
    local v19 = false;
    local v20 = false;
    local v21 = false;
    local v22 = TweenInfo.new(0.15);
    local v23 = service.TweenService:Create(l_Frame_0, v22, {
        Size = UDim2.new(1, 0, 0, 140)
    });
    local v24 = service.TweenService:Create(l_Frame_0, v22, {
        Size = UDim2.new(1, 0, 0, 40)
    });
    local v25 = service.TweenService:Create(l_Frame_0, v22, {
        Position = UDim2.new(0, 0, 0, 0)
    });
    local v26 = service.TweenService:Create(l_Frame_0, v22, {
        Position = UDim2.new(0, 0, 0, -200)
    });
    local function v28() --[[ Line: 58 ]] --[[ Name: showGuis ]]
        -- upvalues: l_UI_0 (copy)
        if l_UI_0.Get("Notif") then
            l_UI_0.Get("Notif", nil, true).Object.LABEL.Visible = true;
        end;
        local v27 = l_UI_0.Get("Chat", nil, true);
        if v27 then
            v27.Object.Drag.Visible = true;
        end;
        v27 = l_UI_0.Get("PlayerList", nil, true);
        if v27 then
            v27.Object.Drag.Visible = true;
        end;
        v27 = l_UI_0.Get("HintHolder", nil, true);
        if v27 then
            v27.Object.Frame.Visible = true;
        end;
    end;
    local function v30() --[[ Line: 76 ]] --[[ Name: hideGuis ]]
        -- upvalues: l_UI_0 (copy)
        if l_UI_0.Get("Notif") then
            l_UI_0.Get("Notif", nil, true).Object.LABEL.Visible = false;
        end;
        local v29 = l_UI_0.Get("Chat", nil, true);
        if v29 then
            v29.Object.Drag.Visible = false;
        end;
        v29 = l_UI_0.Get("PlayerList", nil, true);
        if v29 then
            v29.Object.Drag.Visible = false;
        end;
        v29 = l_UI_0.Get("HintHolder", nil, true);
        if v29 then
            v29.Object.Frame.Visible = false;
        end;
    end;
    l_Frame_0.Position = UDim2.fromOffset(0, -200);
    l_Frame_0.Visible = false;
    l_Frame_0.Size = UDim2.new(1, 0, 0, 40);
    l_ScrollingFrame_0.Visible = false;
    if l_Variables_0.ConsoleOpen then
        if l_Variables_0.ChatEnabled then
            service.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true);
        end;
        if l_Variables_0.PlayerListEnabled then
            service.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true);
        end;
        v28();
    end;
    l_Variables_0.ChatEnabled = service.StarterGui:GetCoreGuiEnabled("Chat");
    l_Variables_0.PlayerListEnabled = service.StarterGui:GetCoreGuiEnabled("PlayerList");
    local function v31() --[[ Line: 114 ]] --[[ Name: closeConsole ]]
        -- upvalues: l_Parent_0 (copy), v21 (ref), l_ScrollingFrame_0 (copy), l_Frame_0 (copy), l_PlayerList_0 (copy), v20 (ref), l_Variables_0 (copy), v28 (copy), v26 (copy), v19 (ref)
        if l_Parent_0:IsDescendantOf(game) and not v21 then
            v21 = true;
            l_ScrollingFrame_0:ClearAllChildren();
            l_ScrollingFrame_0.CanvasSize = UDim2.new(0, 0, 0, 0);
            l_ScrollingFrame_0.ScrollingEnabled = false;
            l_Frame_0.Size = UDim2.new(1, 0, 0, 40);
            l_ScrollingFrame_0.Visible = false;
            l_PlayerList_0.Visible = false;
            v20 = false;
            if l_Variables_0.ChatEnabled then
                service.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true);
            end;
            if l_Variables_0.PlayerListEnabled then
                service.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true);
            end;
            v28();
            v26:Play();
            v21 = false;
            v19 = false;
        end;
    end;
    local function v32() --[[ Line: 143 ]] --[[ Name: openConsole ]]
        -- upvalues: l_Parent_0 (copy), v21 (ref), l_Variables_0 (copy), l_ScrollingFrame_0 (copy), l_PlayerList_0 (copy), v30 (copy), v25 (copy), l_Frame_0 (copy), v20 (ref), l_TextBox_0 (copy), v19 (ref)
        if not l_Parent_0:IsDescendantOf(game) or v21 then
            return;
        else
            v21 = true;
            l_Variables_0.ChatEnabled = service.StarterGui:GetCoreGuiEnabled("Chat");
            l_Variables_0.PlayerListEnabled = service.StarterGui:GetCoreGuiEnabled("PlayerList");
            service.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false);
            service.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false);
            l_ScrollingFrame_0.ScrollingEnabled = true;
            l_PlayerList_0.ScrollingEnabled = true;
            v30();
            v25:Play();
            l_Frame_0.Size = UDim2.new(1, 0, 0, 40);
            l_ScrollingFrame_0.Visible = false;
            l_PlayerList_0.Visible = false;
            v20 = false;
            l_TextBox_0.Text = "";
            l_Frame_0.Visible = true;
            l_Frame_0.Position = UDim2.new();
            l_TextBox_0:CaptureFocus();
            l_TextBox_0.Text = "";
            wait();
            l_TextBox_0.Text = "";
            v21 = false;
            v19 = true;
            return;
        end;
    end;
    local function v36(v33) --[[ Line: 176 ]] --[[ Name: isInConsoleBounds ]]
        -- upvalues: l_PlayerGui_0 (copy), l_Parent_0 (copy)
        for _, v35 in ipairs(l_PlayerGui_0:GetGuiObjectsAtPosition(v33.X, v33.Y)) do
            if v35 == l_Parent_0 or v35 == l_Parent_0.Frame then
                return true;
            end;
        end;
        return false;
    end;
    l_TextBox_0.FocusLost:Connect(function(v37) --[[ Line: 183 ]]
        -- upvalues: l_TextBox_0 (copy), l_Remote_0 (copy), v31 (copy), v36 (copy), l_LocalPlayer_0 (copy)
        if v37 then
            if l_TextBox_0.Text ~= "" and string.len(l_TextBox_0.Text) > 1 then
                l_Remote_0.Send("ProcessCommand", l_TextBox_0.Text);
            end;
            v31();
            return;
        else
            if not v36(l_LocalPlayer_0:GetMouse()) then
                v31();
            end;
            return;
        end;
    end);
    l_TextBox_0:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 194 ]]
        -- upvalues: l_TextBox_0 (copy), v32 (copy), l_PlayerList_0 (copy), l_ScrollingFrame_0 (copy), l_Prefix_0 (copy), l_BatchKey_0 (copy), l_SplitKey_0 (copy), l_Entry_0 (copy), v18 (copy), v20 (ref), v23 (copy), l_Frame_0 (copy), v19 (ref), v24 (copy)
        if l_TextBox_0.Text ~= "" and v32 then
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
            local v39 = 0;
            local v40 = string.match(l_Text_0, ((".+%*(.*)$"):format(l_SplitKey_0)));
            for _, v42 in service.Players:GetPlayers() do
                if v40 and string.sub(string.lower((tostring(v42))), 1, #v40) == string.lower(v40) or string.match(l_Text_0, (("%*$"):format(l_SplitKey_0))) then
                    local v43 = l_Entry_0:Clone();
                    v43.Text = tostring(v42);
                    v43.Name = ("Entry %*"):format(v39);
                    v43.TextXAlignment = "Right";
                    v43.Visible = true;
                    v43.Parent = l_PlayerList_0;
                    v43.Position = UDim2.new(0, 0, 0, v39 * 20);
                    v43.MouseButton1Down:Connect(function() --[[ Line: 227 ]]
                        -- upvalues: l_TextBox_0 (ref), v42 (copy)
                        l_TextBox_0.Text = l_TextBox_0.Text .. tostring(v42);
                        l_TextBox_0:CaptureFocus();
                    end);
                    v39 = v39 + 1;
                end;
            end;
            l_PlayerList_0.CanvasSize = UDim2.new(0, 0, 0, v39 * 20);
            local v44 = 0;
            for _, v46 in v18 do
                if string.sub(string.lower(v46), 1, #l_Text_0) == string.lower(l_Text_0) or string.find(string.lower(v46), string.match(string.lower(l_Text_0), (("^(.-)%*"):format(l_SplitKey_0))) or string.lower(l_Text_0), 1, true) then
                    if not v20 then
                        v23:Play();
                        l_ScrollingFrame_0.Visible = true;
                        l_PlayerList_0.Visible = true;
                        v20 = true;
                    end;
                    local v47 = l_Entry_0:Clone();
                    v47.Visible = true;
                    v47.Parent = l_ScrollingFrame_0;
                    v47.Text = v46;
                    v47.Name = ("Entry %*"):format(v44);
                    v47.Position = UDim2.fromOffset(0, v44 * 20);
                    v47.MouseButton1Down:Connect(function() --[[ Line: 253 ]]
                        -- upvalues: l_TextBox_0 (ref), v47 (copy)
                        l_TextBox_0.Text = v47.Text;
                        l_TextBox_0:CaptureFocus();
                    end);
                    v44 = v44 + 1;
                end;
            end;
            l_Frame_0.Size = UDim2.new(1, 0, 0, (math.clamp(v44 * 20 + 40, 40, 140)));
            l_ScrollingFrame_0.CanvasSize = UDim2.fromOffset(0, v44 * 20);
            return;
        else
            if l_TextBox_0.Text == "" and v19 then
                v24:Play();
                l_ScrollingFrame_0.Visible = false;
                l_PlayerList_0.Visible = false;
                v20 = false;
                l_ScrollingFrame_0:ClearAllChildren();
                l_ScrollingFrame_0.CanvasSize = UDim2.new();
            end;
            return;
        end;
    end);
    service.HookEvent("ToggleConsole", function() --[[ Line: 273 ]]
        -- upvalues: v19 (ref), v31 (copy), v32 (copy), l_Variables_0 (copy)
        if v19 then
            v31();
        else
            v32();
        end;
        l_Variables_0.ConsoleOpen = v19;
    end);
    gTable.BindEvent(service.UserInputService.InputBegan, function(v48) --[[ Line: 282 ]]
        -- upvalues: l_Variables_0 (copy), l_ConsoleKeyCode_0 (copy)
        if not service.UserInputService:GetFocusedTextBox() and rawequal(v48.UserInputType, Enum.UserInputType.Keyboard) and v48.KeyCode.Name == (l_Variables_0.CustomConsoleKey or l_ConsoleKeyCode_0) then
            service.Events.ToggleConsole:Fire();
        end;
    end);
    gTable:Ready();
end;