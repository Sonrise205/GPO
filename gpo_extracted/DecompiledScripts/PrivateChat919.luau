local v0 = nil;
local v1 = nil;
client = v0;
service = v1;
return function(v2, v3) --[[ Line: 3 ]]
    if v3 then
        setfenv(1, v3);
    end;
    local _ = v2.FromPlayer;
    local l_SessionKey_0 = v2.SessionKey;
    local l_SessionName_0 = v2.SessionName;
    local l_CanManageUsers_0 = v2.CanManageUsers;
    local v8 = nil;
    local v9 = nil;
    local v10 = nil;
    local v11 = nil;
    local v12 = nil;
    local v13 = nil;
    local v14 = nil;
    local v15 = nil;
    local v16 = nil;
    local v17 = {};
    local v18 = {};
    local v19 = nil;
    local function v21() --[[ Line: 23 ]] --[[ Name: sendIt ]]
        -- upvalues: v12 (ref), l_SessionKey_0 (copy)
        local v20 = service.Trim(v12.Text);
        if v20 ~= "" then
            client.Remote.Send("Session", l_SessionKey_0, "SendMessage", v20);
        end;
    end;
    local function v29() --[[ Line: 31 ]] --[[ Name: promptAddUser ]]
        -- upvalues: v17 (ref), l_SessionKey_0 (copy)
        local v22 = {};
        for _, v24 in service.Players:GetPlayers() do
            local v25 = true;
            for _, v27 in v17 do
                if v27.UserId == v24.UserId then
                    v25 = false;
                    break;
                end;
            end;
            if v25 then
                table.insert(v22, {
                    Text = service.FormatPlayer(v24), 
                    Data = service.UnWrap(v24)
                });
            end;
        end;
        local v28 = client.UI.Make("SelectionPrompt", {
            Name = "Add User", 
            Options = v22
        });
        if v28 then
            client.Remote.Send("Session", l_SessionKey_0, "AddPlayerToSession", v28);
        end;
    end;
    local function v38(v30) --[[ Line: 60 ]] --[[ Name: updatePeerList ]]
        -- upvalues: v13 (ref), v17 (ref), l_CanManageUsers_0 (copy), v19 (ref)
        v13:ClearAllChildren();
        v17 = v30;
        local v31 = service.New("UIListLayout", {
            Parent = v13, 
            FillDirection = "Vertical", 
            HorizontalAlignment = "Center", 
            VerticalAlignment = "Top", 
            SortOrder = "LayoutOrder"
        });
        for _, v33 in v30 do
            local v34 = v13:Add("TextButton", {
                Text = service.FormatPlayer(v33), 
                Size = UDim2.new(1, 0, 0, 25), 
                TextScaled = true, 
                TextWarped = true, 
                BackgroundTransparency = 1
            });
            if l_CanManageUsers_0 then
                local v35 = v34.BackgroundColor3:Lerp(Color3.fromRGB(9, 67, 255), 0.1);
                if v33.UserId and v33.UserId ~= service.Players.LocalPlayer.UserId then
                    v34.MouseButton1Down:Connect(function() --[[ Line: 86 ]]
                        -- upvalues: v13 (ref), v19 (ref), v33 (copy), v34 (copy), v35 (copy)
                        for _, v37 in ipairs(v13:GetChildren()) do
                            if v37:IsA("TextButton") or v37:IsA("Frame") then
                                v37.BackgroundTransparency = 1;
                            end;
                        end;
                        v19 = v33;
                        v34.BackgroundTransparency = 0;
                        v34.BackgroundColor3 = v35;
                    end);
                end;
            end;
        end;
        v13.CanvasSize = UDim2.new(0, 0, 0, v31.AbsoluteContentSize.Y);
    end;
    v9 = function(v39) --[[ Line: 104 ]] --[[ Name: newMessage ]]
        -- upvalues: v11 (ref), v18 (copy)
        local l_PlayerName_0 = v39.PlayerName;
        local v41 = false;
        if l_PlayerName_0 ~= "*SYSTEM*" then
            v41 = v39.PlayerDisplayName;
        end;
        local l_Message_0 = v39.Message;
        local v43 = v39.Icon or 0;
        local v44 = nil;
        if l_PlayerName_0 == "* SYSTEM *" then
            v44 = v11:Add("Frame", {
                Size = UDim2.new(1, 0, 0, 25), 
                BackgroundTransparency = 1, 
                AutomaticSize = "Y", 
                Children = {
                    {
                        ClassName = "Frame", 
                        Name = "CHATFRAME", 
                        Size = UDim2.new(1, -10, 1, -10), 
                        Position = UDim2.new(0, 5, 0, 5), 
                        BackgroundTransparency = 0.5, 
                        AutomaticSize = "Y", 
                        Children = {
                            {
                                ClassName = "TextLabel", 
                                Name = "PlayerName", 
                                Size = UDim2.new(0, 0, 0, 14), 
                                Position = UDim2.new(0, 1, 0, 1), 
                                Text = ("   %*"):format(l_PlayerName_0), 
                                TextSize = "14", 
                                TextXAlignment = "Left", 
                                BackgroundTransparency = 1
                            }, 
                            {
                                ClassName = "TextLabel", 
                                Name = "Message", 
                                Size = UDim2.new(1, 0, 0, 10), 
                                Position = UDim2.new(0, 0, 0, 14), 
                                Text = ("   %*"):format(l_Message_0 or "<font color='rgb(230,0,0)'>An error has occured</font>"), 
                                TextXAlignment = "Left", 
                                TextYAlignment = "Top", 
                                AutomaticSize = "Y", 
                                TextWrapped = true, 
                                TextScaled = false, 
                                RichText = true, 
                                BackgroundTransparency = 1
                            }
                        }
                    }
                }
            });
        else
            v11:Add("Frame", {
                Size = UDim2.new(1, 0, 0, 50), 
                BackgroundTransparency = 1, 
                AutomaticSize = "Y", 
                Children = {
                    {
                        ClassName = "Frame", 
                        Name = "CHATFRAME", 
                        Size = UDim2.new(1, -10, 1, -10), 
                        Position = UDim2.new(0, 5, 0, 5), 
                        BackgroundTransparency = 0.5, 
                        AutomaticSize = "Y", 
                        Children = {
                            {
                                ClassName = "ImageButton", 
                                Name = "Icon", 
                                Size = UDim2.new(0, 48, 0, 48), 
                                Position = UDim2.new(0, 1, 0, 1), 
                                Image = v43
                            }, 
                            {
                                ClassName = "TextLabel", 
                                Name = "PlayerName", 
                                Size = UDim2.new(1, -55, 0, 15), 
                                Position = UDim2.new(0, 55, 0, 0), 
                                Text = if v41 then v41 == l_PlayerName_0 and ("@%*"):format(l_PlayerName_0) or string.format("%s (@%s)", v41, l_PlayerName_0) else l_PlayerName_0, 
                                TextSize = "14", 
                                TextXAlignment = "Left", 
                                BackgroundTransparency = 1
                            }, 
                            {
                                ClassName = "TextLabel", 
                                Name = "Message", 
                                Size = UDim2.new(1, -55, 0, 10), 
                                Position = UDim2.new(0, 55, 0, 15), 
                                Text = l_Message_0, 
                                TextXAlignment = "Left", 
                                TextYAlignment = "Top", 
                                AutomaticSize = "Y", 
                                TextWrapped = true, 
                                TextScaled = false, 
                                RichText = true, 
                                BackgroundTransparency = 1
                            }
                        }
                    }
                }
            });
        end;
        table.insert(v18, v44);
        if #v18 > 200 then
            v18[1]:Destroy();
            table.remove(v18, 1);
        end;
    end;
    local function v46(v45) --[[ Line: 210 ]] --[[ Name: systemMessage ]]
        -- upvalues: v9 (ref)
        v9({
            PlayerName = "* SYSTEM *", 
            Message = v45, 
            Icon = 0
        });
    end;
    if client.UI.Get((("PrivateChat%*"):format(l_SessionName_0))) then
        return;
    else
        v10 = client.UI.Make("Window", {
            Name = ("\"PrivateChat%*"):format(l_SessionName_0), 
            Title = "Private Chat", 
            Icon = client.MatIcons.Forum, 
            Size = {
                500, 
                300
            }, 
            OnClose = function() --[[ Line: 227 ]] --[[ Name: OnClose ]]
                -- upvalues: v16 (ref), l_SessionKey_0 (copy)
                if v16 then
                    v16:Disconnect();
                end;
                client.Remote.Send("Session", l_SessionKey_0, "LeaveSession");
            end
        });
        v11 = v10:Add("ScrollingFrame", {
            Size = UDim2.new(1, -105, 1, -45), 
            CanvasSize = UDim2.new(0, 0, 0, 0), 
            BackgroundTransparency = 0.9
        });
        v12 = v10:Add("TextBox", {
            Text = "", 
            PlaceholderText = "", 
            Size = UDim2.new(1, -70, 0, 30), 
            Position = UDim2.new(0, 5, 1, -35), 
            ClearTextOnFocus = false, 
            TextScaled = true
        });
        v13 = v10:Add("ScrollingFrame", {
            Size = UDim2.new(0, 100, 1, -75), 
            Position = UDim2.new(1, -100, 0, 0), 
            BackgroundTransparency = 0.5, 
            AutomaticCanvasSize = "Y"
        });
        local _ = v10:Add("TextButton", {
            Text = "+", 
            Size = UDim2.new(0, 30, 0, 30), 
            Position = UDim2.new(1, -100, 1, -70), 
            OnClick = function() --[[ Line: 263 ]] --[[ Name: OnClick ]]
                -- upvalues: l_CanManageUsers_0 (copy), v29 (copy), v46 (copy)
                if l_CanManageUsers_0 then
                    v29();
                    return;
                else
                    v46("<i>You are not allowed to manage users</i>");
                    return;
                end;
            end
        });
        local _ = v10:Add("TextButton", {
            Text = "-", 
            Size = UDim2.new(0, 30, 0, 30), 
            Position = UDim2.new(1, -35, 1, -70), 
            OnClick = function() --[[ Line: 276 ]] --[[ Name: OnClick ]]
                -- upvalues: l_CanManageUsers_0 (copy), v19 (ref), l_SessionKey_0 (copy), v46 (copy)
                if l_CanManageUsers_0 then
                    if v19 then
                        client.Remote.Send("Session", l_SessionKey_0, "RemovePlayerFromSession", v19);
                        v19 = nil;
                        return;
                    end;
                else
                    v46("<i>You are not allowed to manage users</i>");
                end;
            end
        });
        v14 = v10:Add("TextButton", {
            Text = "Send", 
            Size = UDim2.new(0, 60, 0, 30), 
            Position = UDim2.new(1, -65, 1, -35), 
            OnClick = function() --[[ Line: 292 ]] --[[ Name: OnClick ]]
                -- upvalues: v21 (copy), v12 (ref)
                v21();
                v12.Text = "";
            end
        });
        v15 = service.New("UIListLayout", {
            Parent = v11, 
            FillDirection = "Vertical", 
            HorizontalAlignment = "Left", 
            VerticalAlignment = "Bottom", 
            SortOrder = "LayoutOrder"
        });
        v14.BackgroundColor3 = v14.BackgroundColor3:lerp(Color3.new(0, 0, 0), 0.1);
        v12.FocusLost:Connect(function(v49) --[[ Line: 307 ]]
            -- upvalues: v21 (copy), v12 (ref)
            if v49 then
                v21();
                v12.Text = "";
                v12:CaptureFocus();
            end;
        end);
        v15:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() --[[ Line: 315 ]]
            -- upvalues: v11 (ref), v15 (ref)
            v11.CanvasSize = UDim2.new(0, 0, 0, v15.AbsoluteContentSize.Y);
            v11.CanvasPosition = Vector2.new(0, v15.AbsoluteContentSize.Y);
        end);
        if v2.History then
            for _, v51 in ipairs(v2.History) do
                local l_Sender_0 = v51.Sender;
                v9({
                    PlayerName = l_Sender_0.Name, 
                    PlayerDisplayName = l_Sender_0.DisplayName, 
                    Message = v51.Message, 
                    Icon = l_Sender_0.Icon or 0
                });
            end;
        end;
        v16 = service.Events.SessionData:Connect(function(v53, v54, ...) --[[ Line: 332 ]]
            -- upvalues: l_SessionKey_0 (copy), v9 (ref), v38 (copy), v46 (copy)
            local v55 = {
                ...
            };
            if l_SessionKey_0 == v53 then
                if v54 == "PlayerSentMessage" then
                    local v56 = v55[1];
                    local v57 = v55[2];
                    if v9 then
                        v9({
                            PlayerName = v56.Name, 
                            PlayerDisplayName = v56.DisplayName, 
                            Message = v57, 
                            Icon = v56.Icon or 0
                        });
                        return;
                    end;
                elseif v54 == "UpdatePeerList" then
                    v38(v55[1]);
                    return;
                elseif v54 == "RemovedFromSession" then
                    v46("<i>You have been removed from this chat session</i>");
                    return;
                elseif v54 == "AddedToSession" then
                    v46("<i>You have been added to this chat session</i>");
                end;
            end;
        end);
        client.Remote.Send("Session", l_SessionKey_0, "GetPeerList");
        v8 = v10.gTable;
        v10:Ready();
        return;
    end;
end;