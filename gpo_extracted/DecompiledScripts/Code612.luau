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
    local v20 = UDim2.new(0.36, 0, 0, 200);
    local v21 = UDim2.new(0.36, 0, 0, 47);
    local v22 = UDim2.new(0.32, 0, 0.353, 0);
    local v23 = UDim2.new(0.32, 0, 0, -200);
    local v24 = TweenInfo.new(0.15);
    local v25 = service.TweenService:Create(l_Frame_0, v24, {
        Size = v20
    });
    local v26 = service.TweenService:Create(l_Frame_0, v24, {
        Size = v21
    });
    local v27 = service.TweenService:Create(l_Frame_0, v24, {
        Position = v22
    });
    local v28 = service.TweenService:Create(l_Frame_0, v24, {
        Position = v23
    });
    l_Frame_0.Position = v23;
    l_Frame_0.Visible = false;
    l_Frame_0.Size = v21;
    l_ScrollingFrame_0.Visible = false;
    client.Variables.ChatEnabled = service.StarterGui:GetCoreGuiEnabled("Chat");
    client.Variables.PlayerListEnabled = service.StarterGui:GetCoreGuiEnabled("PlayerList");
    local function v29() --[[ Line: 67 ]] --[[ Name: close ]]
        -- upvalues: l_Parent_0 (copy), v13 (ref), l_ScrollingFrame_0 (copy), l_Frame_0 (copy), v21 (copy), l_PlayerList_0 (copy), v12 (ref), v28 (copy), v11 (ref)
        if l_Parent_0:IsDescendantOf(game) and not v13 then
            v13 = true;
            l_ScrollingFrame_0:ClearAllChildren();
            l_ScrollingFrame_0.CanvasSize = UDim2.new(0, 0, 0, 0);
            l_ScrollingFrame_0.ScrollingEnabled = false;
            l_Frame_0.Size = v21;
            l_ScrollingFrame_0.Visible = false;
            l_PlayerList_0.Visible = false;
            v12 = false;
            v28:Play();
            v13 = false;
            v11 = false;
        end;
    end;
    local function v30() --[[ Line: 85 ]] --[[ Name: open ]]
        -- upvalues: l_Parent_0 (copy), v13 (ref), l_ScrollingFrame_0 (copy), l_PlayerList_0 (copy), v27 (copy), l_Frame_0 (copy), v21 (copy), v12 (ref), l_TextBox_0 (copy), v22 (copy), v11 (ref)
        if l_Parent_0:IsDescendantOf(game) and not v13 then
            v13 = true;
            l_ScrollingFrame_0.ScrollingEnabled = true;
            l_PlayerList_0.ScrollingEnabled = true;
            v27:Play();
            l_Frame_0.Size = v21;
            l_ScrollingFrame_0.Visible = false;
            l_PlayerList_0.Visible = false;
            v12 = false;
            l_TextBox_0.Text = "";
            l_Frame_0.Visible = true;
            l_Frame_0.Position = v22;
            l_TextBox_0:CaptureFocus();
            l_TextBox_0.Text = "";
            wait();
            l_TextBox_0.Text = "";
            v13 = false;
            v11 = true;
        end;
    end;
    local function v34(v31) --[[ Line: 110 ]] --[[ Name: isInConsoleBounds ]]
        -- upvalues: l_PlayerGui_0 (copy), l_Parent_0 (copy)
        for _, v33 in ipairs(l_PlayerGui_0:GetGuiObjectsAtPosition(v31.X, v31.Y)) do
            if v33 == l_Parent_0 or v33 == l_Parent_0.Frame then
                return true;
            end;
        end;
        return false;
    end;
    l_TextBox_0.FocusLost:Connect(function(v35) --[[ Line: 117 ]]
        -- upvalues: l_TextBox_0 (copy), v29 (copy), v34 (copy), l_LocalPlayer_0 (copy)
        if v35 then
            if l_TextBox_0.Text ~= "" and string.len(l_TextBox_0.Text) > 1 then
                client.Remote.Send("ProcessCommand", l_TextBox_0.Text);
            end;
            v29();
            return;
        else
            if not v34(l_LocalPlayer_0:GetMouse()) then
                v29();
            end;
            return;
        end;
    end);
    l_TextBox_0.Changed:Connect(function(v36) --[[ Line: 128 ]]
        -- upvalues: l_TextBox_0 (copy), v30 (copy), l_PlayerList_0 (copy), l_ScrollingFrame_0 (copy), l_Prefix_0 (copy), l_BatchKey_0 (copy), l_SplitKey_0 (copy), l_Entry_0 (copy), v19 (copy), v12 (ref), v25 (copy), l_Frame_0 (copy), v21 (copy), v11 (ref), v26 (copy)
        if v36 == "Text" and l_TextBox_0.Text ~= "" and v30 then
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
            local v38 = 0;
            local v39 = string.match(l_Text_0, ((".+%*(.*)$"):format(l_SplitKey_0)));
            for _, v41 in next, service.Players:GetPlayers() do
                if v39 and string.sub(string.lower((tostring(v41))), 1, #v39) == string.lower(v39) or string.match(l_Text_0, (("%*$"):format(l_SplitKey_0))) then
                    local v42 = l_Entry_0:Clone();
                    v42.Text = tostring(v41);
                    v42.Name = ("Entry %*"):format(v38);
                    v42.TextXAlignment = "Right";
                    v42.Visible = true;
                    v42.Parent = l_PlayerList_0;
                    v42.Position = UDim2.new(0, 0, 0, v38 * 20);
                    v42.MouseButton1Down:Connect(function() --[[ Line: 161 ]]
                        -- upvalues: l_TextBox_0 (ref), v41 (copy)
                        l_TextBox_0.Text = l_TextBox_0.Text .. tostring(v41);
                        l_TextBox_0:CaptureFocus();
                    end);
                    v38 = v38 + 1;
                end;
            end;
            l_PlayerList_0.CanvasSize = UDim2.new(0, 0, 0, v38 * 20);
            local v43 = 0;
            for _, v45 in next, v19 do
                if string.sub(string.lower(v45), 1, #l_Text_0) == string.lower(l_Text_0) or string.find(string.lower(v45), string.match(string.lower(l_Text_0), (("^(.-)%*"):format(l_SplitKey_0))) or string.lower(l_Text_0), 1, true) then
                    if not v12 then
                        v25:Play();
                        l_ScrollingFrame_0.Visible = true;
                        l_PlayerList_0.Visible = true;
                        v12 = true;
                    end;
                    local v46 = l_Entry_0:Clone();
                    v46.Visible = true;
                    v46.Parent = l_ScrollingFrame_0;
                    v46.Text = v45;
                    v46.Name = ("Entry %*"):format(v43);
                    v46.Position = UDim2.new(0, 0, 0, v43 * 20);
                    v46.MouseButton1Down:Connect(function() --[[ Line: 187 ]]
                        -- upvalues: l_TextBox_0 (ref), v46 (copy)
                        l_TextBox_0.Text = v46.Text;
                        l_TextBox_0:CaptureFocus();
                    end);
                    v43 = v43 + 1;
                end;
            end;
            if v43 > 0 then
                l_Frame_0.Size = UDim2.new(0.36, 0, 0, (math.clamp(math.max(v43, v38) * 20 + 53, 47, 200)));
            else
                l_PlayerList_0.Visible = false;
                l_Frame_0.Size = v21;
            end;
            l_ScrollingFrame_0.CanvasSize = UDim2.new(0, 0, 0, v43 * 20);
            return;
        else
            if v36 == "Text" and l_TextBox_0.Text == "" and v11 then
                v26:Play();
                l_ScrollingFrame_0.Visible = false;
                l_PlayerList_0.Visible = false;
                v12 = false;
                l_ScrollingFrame_0:ClearAllChildren();
                l_ScrollingFrame_0.CanvasSize = UDim2.new(0, 0, 0, 0);
            end;
            return;
        end;
    end);
    l_BindEvent_0(service.UserInputService.InputBegan, function(v47) --[[ Line: 213 ]]
        -- upvalues: l_ConsoleKeyCode_0 (copy), v11 (ref), v29 (copy), v30 (copy)
        if not service.UserInputService:GetFocusedTextBox() and rawequal(v47.UserInputType, Enum.UserInputType.Keyboard) and v47.KeyCode.Name == (client.Variables.CustomConsoleKey or l_ConsoleKeyCode_0) then
            if v11 then
                v29();
            else
                v30();
            end;
            client.Variables.ConsoleOpen = v11;
        end;
    end);
    gTable:Ready();
end;