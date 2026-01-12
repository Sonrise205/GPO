local v0 = nil;
local v1 = nil;
client = v0;
service = v1;
return function(v2, v3) --[[ Line: 3 ]]
    if v3 then
        setfenv(1, v3);
    end;
    local _ = v2.AdminLevel;
    local l_CanBan_0 = v2.CanBan;
    local l_CanTimeBan_0 = v2.CanTimeBan;
    local l_CanPermBan_0 = v2.CanPermBan;
    local v8 = nil;
    local v9 = client.UI.Make("Window", {
        Name = "Ban Menu", 
        Title = "Ban Menu", 
        Size = {
            267, 
            250
        }, 
        Position = UDim2.new(0.5, -125, 0.5, -125), 
        Icon = client.MatIcons.Gavel, 
        MinSize = {
            267, 
            250
        }, 
        AllowMultiple = false, 
        Walls = true, 
        NoHide = true, 
        NoClose = false, 
        CanKeepAlive = true, 
        SizeLocked = false, 
        NoDrag = false
    });
    if v9 then
        local v10 = v9:Add("TabFrame", {
            Size = UDim2.new(1, -10, 1, -10), 
            Position = UDim2.new(0, 5, 0, 5)
        });
        if l_CanBan_0 then
            local v11, v12 = v10:NewTab("Server Ban", {
                Text = "Server Ban"
            });
            local v13 = v11:Add("TextBox", {
                Size = UDim2.new(1, -10, 0, 20), 
                Position = UDim2.new(0, 5, 0, 5), 
                BackgroundTransparency = 0, 
                BorderSizePixel = 0, 
                BorderColor3 = Color3.new(0, 0, 0), 
                TextColor3 = Color3.new(1, 1, 1), 
                Text = "", 
                PlaceholderText = "Search player", 
                TextStrokeTransparency = 0.8, 
                ClearTextOnFocus = false
            });
            local v14 = v11:Add("ScrollingFrame", {
                Size = UDim2.new(1, -10, 0, 85), 
                Position = UDim2.new(0, 5, 0, 27), 
                BackgroundColor3 = Color3.new(0.0784313725490196, 0.0784313725490196, 0.0784313725490196), 
                BackgroundTransparency = 0, 
                BorderSizePixel = 0, 
                BorderColor3 = Color3.new(0, 0, 0), 
                ZIndex = 5
            });
            local v15 = v11:Add("Frame", {
                Size = UDim2.new(1, -10, 1, -65), 
                Position = UDim2.new(0, 5, 0, 30), 
                BackgroundColor3 = Color3.new(0.0784313725490196, 0.0784313725490196, 0.0784313725490196), 
                BackgroundTransparency = 0, 
                BorderSizePixel = 0
            }):Add("TextBox", {
                Size = UDim2.new(1, -10, 1, -10), 
                Position = UDim2.new(0, 5, 0, 5), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                TextColor3 = Color3.new(1, 1, 1), 
                Text = "", 
                PlaceholderText = "Reason", 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                TextWrapped = true
            });
            local l_v13_0 = v13 --[[ copy: 11 -> 22 ]];
            local _ = v11:Add("TextButton", {
                Size = UDim2.new(0.5, -10, 0, 25), 
                Position = UDim2.new(0, 5, 1, -30), 
                Text = "Unban", 
                OnClick = function() --[[ Line: 92 ]] --[[ Name: OnClick ]]
                    -- upvalues: v2 (copy), l_v13_0 (copy)
                    client.Remote.Send("ProcessCommand", (("%*unban %*"):format(v2.Prefix, l_v13_0.Text)));
                end
            });
            local l_v15_0 = v15 --[[ copy: 14 -> 23 ]];
            local _ = v11:Add("TextButton", {
                Size = UDim2.new(0.5, -10, 0, 25), 
                Position = UDim2.new(1, -5, 1, -30), 
                Text = "Ban", 
                AnchorPoint = Vector2.new(1, 0), 
                OnClick = function() --[[ Line: 102 ]] --[[ Name: OnClick ]]
                    -- upvalues: v2 (copy), l_v13_0 (copy), l_v15_0 (copy)
                    client.Remote.Send("ProcessCommand", (("%*ban %* %*"):format(v2.Prefix, l_v13_0.Text, l_v15_0.Text)));
                end
            });
            local l_v14_0 = v14 --[[ copy: 12 -> 24 ]];
            local function v24() --[[ Line: 107 ]] --[[ Name: getPlayers ]]
                -- upvalues: l_v14_0 (copy), l_v13_0 (copy)
                l_v14_0:ClearAllChildren();
                local v21 = 0;
                for _, v23 in pairs(game.Players:GetPlayers()) do
                    l_v14_0:Add("TextButton", {
                        Text = ("%* (@%*)"):format(v23.DisplayName, v23.Name), 
                        Size = UDim2.new(1, 0, 0, 25), 
                        Position = UDim2.new(0, 0, 0, v21 * 25), 
                        ZIndex = 5
                    }).MouseButton1Down:Connect(function() --[[ Line: 118 ]]
                        -- upvalues: l_v13_0 (ref), v23 (copy)
                        l_v13_0.Text = v23.Name;
                        l_v13_0:ReleaseFocus();
                    end);
                    v21 = v21 + 1;
                end;
                l_v14_0:ResizeCanvas(false, true);
            end;
            v14.Visible = false;
            v13.Focused:Connect(function() --[[ Line: 130 ]]
                -- upvalues: l_v14_0 (copy), l_v13_0 (copy)
                l_v14_0.Visible = true;
                l_v13_0.BorderSizePixel = 2;
                l_v14_0.BorderSizePixel = 2;
            end);
            v13.FocusLost:Connect(function() --[[ Line: 131 ]]
                -- upvalues: l_v14_0 (copy), l_v13_0 (copy)
                task.wait();
                l_v14_0.Visible = false;
                l_v13_0.BorderSizePixel = 0;
                l_v14_0.BorderSizePixel = 0;
            end);
            local l_v24_0 = v24 --[[ copy: 17 -> 25 ]];
            v13:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 133 ]]
                -- upvalues: l_v13_0 (copy), l_v14_0 (copy), l_v24_0 (copy)
                if l_v13_0.Text ~= "" then
                    local v26 = 0;
                    for _, v28 in pairs(l_v14_0:GetChildren()) do
                        if v28.Text:find(l_v13_0.Text) ~= nil then
                            v28.Visible = true;
                            v28.Position = UDim2.new(0, 0, 0, v26 * 25);
                            v26 = v26 + 1;
                        else
                            v28.Visible = false;
                        end;
                    end;
                    l_v14_0:ResizeCanvas(false, true);
                    return;
                else
                    l_v24_0();
                    return;
                end;
            end);
            v12.MouseButton1Click:Connect(function() --[[ Line: 151 ]]
                -- upvalues: l_v24_0 (copy)
                l_v24_0();
            end);
            v24();
        end;
        if l_CanPermBan_0 then
            local v29, v30 = v10:NewTab("Perm Ban", {
                Text = "Perm Ban"
            });
            local v31 = v29:Add("TextBox", {
                Size = UDim2.new(1, -10, 0, 20), 
                Position = UDim2.new(0, 5, 0, 5), 
                BackgroundTransparency = 0, 
                BorderSizePixel = 0, 
                BorderColor3 = Color3.new(0, 0, 0), 
                TextColor3 = Color3.new(1, 1, 1), 
                Text = "", 
                PlaceholderText = "Search player", 
                TextStrokeTransparency = 0.8, 
                ClearTextOnFocus = false
            });
            local v32 = v29:Add("ScrollingFrame", {
                Size = UDim2.new(1, -10, 0, 85), 
                Position = UDim2.new(0, 5, 0, 27), 
                BackgroundColor3 = Color3.new(0.0784313725490196, 0.0784313725490196, 0.0784313725490196), 
                BackgroundTransparency = 0, 
                BorderSizePixel = 0, 
                BorderColor3 = Color3.new(0, 0, 0), 
                ZIndex = 5
            });
            local v33 = v29:Add("Frame", {
                Size = UDim2.new(1, -10, 1, -65), 
                Position = UDim2.new(0, 5, 0, 30), 
                BackgroundColor3 = Color3.new(0.0784313725490196, 0.0784313725490196, 0.0784313725490196), 
                BackgroundTransparency = 0, 
                BorderSizePixel = 0
            }):Add("TextBox", {
                Size = UDim2.new(1, -10, 1, -10), 
                Position = UDim2.new(0, 5, 0, 5), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                TextColor3 = Color3.new(1, 1, 1), 
                Text = "", 
                PlaceholderText = "Reason", 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                TextWrapped = true
            });
            local l_v31_0 = v31 --[[ copy: 11 -> 19 ]];
            local _ = v29:Add("TextButton", {
                Size = UDim2.new(0.5, -10, 0, 25), 
                Position = UDim2.new(0, 5, 1, -30), 
                Text = "Unban", 
                OnClick = function() --[[ Line: 214 ]] --[[ Name: OnClick ]]
                    -- upvalues: v2 (copy), l_v31_0 (copy)
                    client.Remote.Send("ProcessCommand", (("%*unpermban %*"):format(v2.Prefix, l_v31_0.Text)));
                end
            });
            local _ = v29:Add("TextButton", {
                Size = UDim2.new(0.5, -10, 0, 25), 
                Position = UDim2.new(1, -5, 1, -30), 
                Text = "Ban", 
                AnchorPoint = Vector2.new(1, 0), 
                OnClick = function() --[[ Line: 224 ]] --[[ Name: OnClick ]]
                    -- upvalues: v2 (copy), l_v31_0 (copy), v33 (copy)
                    client.Remote.Send("ProcessCommand", (("%*permban %* %*"):format(v2.Prefix, l_v31_0.Text, v33.Text)));
                end
            });
            local l_v32_0 = v32 --[[ copy: 12 -> 20 ]];
            local function v41() --[[ Line: 229 ]] --[[ Name: getPlayers ]]
                -- upvalues: l_v32_0 (copy), l_v31_0 (copy)
                l_v32_0:ClearAllChildren();
                local v38 = 0;
                for _, v40 in pairs(game.Players:GetPlayers()) do
                    l_v32_0:Add("TextButton", {
                        Text = ("%* (@%*)"):format(v40.DisplayName, v40.Name), 
                        Size = UDim2.new(1, 0, 0, 25), 
                        Position = UDim2.new(0, 0, 0, v38 * 25), 
                        ZIndex = 5
                    }).MouseButton1Down:Connect(function() --[[ Line: 240 ]]
                        -- upvalues: l_v31_0 (ref), v40 (copy)
                        l_v31_0.Text = v40.Name;
                        l_v31_0:ReleaseFocus();
                    end);
                    v38 = v38 + 1;
                end;
                l_v32_0:ResizeCanvas(false, true);
            end;
            v32.Visible = false;
            v31.Focused:Connect(function() --[[ Line: 252 ]]
                -- upvalues: l_v32_0 (copy), l_v31_0 (copy)
                l_v32_0.Visible = true;
                l_v31_0.BorderSizePixel = 2;
                l_v32_0.BorderSizePixel = 2;
            end);
            v31.FocusLost:Connect(function() --[[ Line: 253 ]]
                -- upvalues: l_v32_0 (copy), l_v31_0 (copy)
                task.wait();
                l_v32_0.Visible = false;
                l_v31_0.BorderSizePixel = 0;
                l_v32_0.BorderSizePixel = 0;
            end);
            local l_v41_0 = v41 --[[ copy: 17 -> 21 ]];
            v31:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 255 ]]
                -- upvalues: l_v31_0 (copy), l_v32_0 (copy), l_v41_0 (copy)
                if l_v31_0.Text ~= "" then
                    local v43 = 0;
                    for _, v45 in pairs(l_v32_0:GetChildren()) do
                        if v45.Text:find(l_v31_0.Text) ~= nil then
                            v45.Visible = true;
                            v45.Position = UDim2.new(0, 0, 0, v43 * 25);
                            v43 = v43 + 1;
                        else
                            v45.Visible = false;
                        end;
                    end;
                    l_v32_0:ResizeCanvas(false, true);
                    return;
                else
                    l_v41_0();
                    return;
                end;
            end);
            v30.MouseButton1Click:Connect(function() --[[ Line: 273 ]]
                -- upvalues: l_v41_0 (copy)
                l_v41_0();
            end);
            v41();
        end;
        if l_CanTimeBan_0 then
            local v46, v47 = v10:NewTab("Time Ban", {
                Text = "Time Ban"
            });
            v47:GetPropertyChangedSignal("BackgroundTransparency"):Connect(function() --[[ Line: 288 ]]
                -- upvalues: v9 (copy), v47 (copy)
                local l_v9_Position_0 = v9:GetPosition();
                local l_v9_Size_0 = v9:GetSize();
                if v47.BackgroundTransparency == 0 then
                    v9:SetPosition(UDim2.new(0, l_v9_Position_0.X, 0, l_v9_Position_0.Y - 7.5));
                    v9:SetSize({
                        l_v9_Size_0.X, 
                        l_v9_Size_0.Y + 15
                    });
                    v9:SetMinSize({
                        267, 
                        265
                    });
                    return;
                else
                    v9:SetPosition(UDim2.new(0, l_v9_Position_0.X, 0, l_v9_Position_0.Y + 7.5));
                    v9:SetSize({
                        l_v9_Size_0.X, 
                        l_v9_Size_0.Y - 15
                    });
                    v9:SetMinSize({
                        267, 
                        250
                    });
                    return;
                end;
            end);
            local v50 = v46:Add("TextBox", {
                Size = UDim2.new(1, -10, 0, 20), 
                Position = UDim2.new(0, 5, 0, 5), 
                BackgroundTransparency = 0, 
                BorderSizePixel = 0, 
                BorderColor3 = Color3.new(0, 0, 0), 
                TextColor3 = Color3.new(1, 1, 1), 
                Text = "", 
                PlaceholderText = "Search player", 
                TextStrokeTransparency = 0.8, 
                ClearTextOnFocus = false
            });
            local v51 = v46:Add("ScrollingFrame", {
                Size = UDim2.new(1, -10, 0, 85), 
                Position = UDim2.new(0, 5, 0, 27), 
                BackgroundColor3 = Color3.new(0.0784313725490196, 0.0784313725490196, 0.0784313725490196), 
                BackgroundTransparency = 0, 
                BorderSizePixel = 0, 
                BorderColor3 = Color3.new(0, 0, 0), 
                ZIndex = 5
            });
            local v52 = v46:Add("TextBox", {
                Size = UDim2.new(1, -10, 0, 20), 
                Position = UDim2.new(0, 5, 0, 30), 
                BackgroundTransparency = 0, 
                BorderSizePixel = 0, 
                TextColor3 = Color3.new(1, 1, 1), 
                Text = "", 
                PlaceholderText = "Duration (example: 1h)"
            });
            local v53 = v46:Add("Frame", {
                Size = UDim2.new(1, -10, 1, -90), 
                Position = UDim2.new(0, 5, 0, 55), 
                BackgroundColor3 = Color3.new(0.0784313725490196, 0.0784313725490196, 0.0784313725490196), 
                BackgroundTransparency = 0, 
                BorderSizePixel = 0
            }):Add("TextBox", {
                Size = UDim2.new(1, -10, 1, -10), 
                Position = UDim2.new(0, 5, 0, 5), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                TextColor3 = Color3.new(1, 1, 1), 
                Text = "", 
                PlaceholderText = "Reason", 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                TextWrapped = true
            });
            local _ = v46:Add("TextButton", {
                Size = UDim2.new(0.5, -10, 0, 25), 
                Position = UDim2.new(0, 5, 1, -30), 
                Text = "Unban", 
                OnClick = function() --[[ Line: 360 ]] --[[ Name: OnClick ]]
                    -- upvalues: v2 (copy), v50 (copy)
                    client.Remote.Send("ProcessCommand", (("%*untimeban %*"):format(v2.Prefix, v50.Text)));
                end
            });
            local _ = v46:Add("TextButton", {
                Size = UDim2.new(0.5, -10, 0, 25), 
                Position = UDim2.new(1, -5, 1, -30), 
                Text = "Ban", 
                AnchorPoint = Vector2.new(1, 0), 
                OnClick = function() --[[ Line: 370 ]] --[[ Name: OnClick ]]
                    -- upvalues: v2 (copy), v50 (copy), v52 (copy), v53 (copy)
                    client.Remote.Send("ProcessCommand", (("%*timeban %* %* %*"):format(v2.Prefix, v50.Text, v52.Text or "1h", v53.Text)));
                end
            });
            local function v59() --[[ Line: 375 ]] --[[ Name: getPlayers ]]
                -- upvalues: v51 (copy), v50 (copy)
                v51:ClearAllChildren();
                local v56 = 0;
                for _, v58 in pairs(game.Players:GetPlayers()) do
                    v51:Add("TextButton", {
                        Text = ("%* (@%*)"):format(v58.DisplayName, v58.Name), 
                        Size = UDim2.new(1, 0, 0, 25), 
                        Position = UDim2.new(0, 0, 0, v56 * 25), 
                        ZIndex = 5
                    }).MouseButton1Down:Connect(function() --[[ Line: 386 ]]
                        -- upvalues: v50 (ref), v58 (copy)
                        v50.Text = v58.Name;
                        v50:ReleaseFocus();
                    end);
                    v56 = v56 + 1;
                end;
                v51:ResizeCanvas(false, true);
            end;
            v51.Visible = false;
            v50.Focused:Connect(function() --[[ Line: 398 ]]
                -- upvalues: v51 (copy), v50 (copy)
                v51.Visible = true;
                v50.BorderSizePixel = 2;
                v51.BorderSizePixel = 2;
            end);
            v50.FocusLost:Connect(function() --[[ Line: 399 ]]
                -- upvalues: v51 (copy), v50 (copy)
                task.wait();
                v51.Visible = false;
                v50.BorderSizePixel = 0;
                v51.BorderSizePixel = 0;
            end);
            v50:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 401 ]]
                -- upvalues: v50 (copy), v51 (copy), v59 (copy)
                if v50.Text ~= "" then
                    local v60 = 0;
                    for _, v62 in pairs(v51:GetChildren()) do
                        if v62.Text:find(v50.Text) ~= nil then
                            v62.Visible = true;
                            v62.Position = UDim2.new(0, 0, 0, v60 * 25);
                            v60 = v60 + 1;
                        else
                            v62.Visible = false;
                        end;
                    end;
                    v51:ResizeCanvas(false, true);
                    return;
                else
                    v59();
                    return;
                end;
            end);
            v47.MouseButton1Click:Connect(function() --[[ Line: 419 ]]
                -- upvalues: v59 (copy)
                v59();
            end);
            v59();
        end;
    end;
    v8 = v9.gTable;
    v9:Ready();
end;