client = nil;
service = nil;
return function(v0, v1) --[[ Line: 4 ]]
    if v1 then
        setfenv(1, v1);
    end;
    local _ = nil;
    local _ = v0.Time;
    local v4 = nil;
    local v5 = nil;
    local v6 = false;
    local v7 = nil;
    local v8 = {};
    local v9 = nil;
    local v10 = false;
    local v11 = nil;
    local v12 = service.New("Sound");
    v12.Volume = 0.25;
    v12.Looped = false;
    local l_Visualizer_0 = require(script:FindFirstChild("Visualizer"));
    local function v14() --[[ Line: 36 ]] --[[ Name: doOnClose ]]
        -- upvalues: v5 (ref), l_Visualizer_0 (ref), v12 (copy)
        if v5 then
            v5:UnlinkFromSound();
            v5:Destroy();
            v5 = nil;
        end;
        if l_Visualizer_0 then
            l_Visualizer_0 = nil;
        end;
        if v12 then
            v12:Stop();
            v12:Destroy();
        end;
    end;
    local v15 = client.UI.Make("Window", {
        Name = "Audio Player", 
        Title = "Audio Player", 
        Size = {
            410, 
            400
        }, 
        MinSize = {
            410, 
            245
        }, 
        icon = "http://www.roblox.com/asset/?id=7032721624", 
        Position = UDim2.new(0, 10, 1, -410), 
        OnClose = function() --[[ Line: 60 ]] --[[ Name: OnClose ]]
            -- upvalues: v14 (copy)
            v14();
        end
    });
    v15.gTable:Ready();
    v4 = v15:AddTitleButton({
        Text = "", 
        OnClick = function() --[[ Line: 74 ]] --[[ Name: OnClick ]]
            -- upvalues: v6 (ref), v12 (copy), v4 (ref)
            if v6 then
                v12.Volume = 0.25;
                v4.Image = "rbxassetid://7463478056";
                v6 = false;
                return;
            else
                v12.Volume = 0;
                v4.Image = "rbxassetid://7463462018";
                v6 = true;
                return;
            end;
        end
    }):Add("ImageLabel", {
        Size = UDim2.new(1, 0, 0.85, 0), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.new(0.5, 0, 0.536, 0), 
        ScaleType = Enum.ScaleType.Fit, 
        Image = "rbxassetid://7463478056", 
        BackgroundTransparency = 1
    });
    local v16 = v15:Add("TextLabel", {
        Text = "Audio Player", 
        Size = UDim2.new(1, 0, 0, 20), 
        BackgroundTransparency = 1, 
        TextScaled = true, 
        ToolTip = "Audio Player"
    });
    local v17 = v15:Add("Frame", {
        Size = UDim2.new(1, 0, 0, 50), 
        Position = UDim2.new(0, 0, 0, 30), 
        BackgroundTransparency = 1, 
        TextScaled = true
    });
    local function v37(v18, v19) --[[ Line: 115 ]] --[[ Name: getSongs ]]
        -- upvalues: v9 (ref), v8 (copy), v11 (ref), v12 (copy), v16 (copy), v7 (ref), v10 (ref)
        local v20 = 0;
        v9 = nil;
        if v8 and v8[v18.Name] then
            v8[v18.Name] = nil;
        end;
        if v11 then
            v11:Disconnect();
        end;
        v18:ClearAllChildren();
        local v21 = v18:Add("ScrollingFrame", {
            Size = UDim2.new(1, 0, 1, 1), 
            Position = UDim2.new(0, 0, 0, 0), 
            BackgroundColor3 = Color3.new(0.235294, 0.235294, 0.235294), 
            BackgroundTransparency = 1
        });
        local v22 = v21:Add("TextLabel", {
            Text = "Loading nothing yet!", 
            ToolTip = "Never gonna give you up, Never gonna let you down...", 
            BackgroundTransparency = 0, 
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            ZIndex = 69420
        });
        v8[v18.Name] = {};
        local l_next_0 = next;
        local v24 = v19 or {};
        for v25, v26 in l_next_0, v24 do
            if type(v26) == "table" then
                v22.Text = ("Loading tracks (%*/%*)"):format(v25, #v19);
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 145 ]]
                    -- upvalues: v26 (copy)
                    return service.MarketplaceService:GetProductInfo(v26.ID, Enum.InfoType.Asset);
                end);
                if l_result_0.AssetTypeId == 3 then
                    table.insert(v8[v18.Name], v26);
                    v21:Add("TextButton", {
                        Text = ("  %*) %*"):format(v20 + 1, l_status_0 and l_result_0.Name or ("[ERROR] %*"):format(v26.Name)), 
                        ToolTip = ("Name: %* | ID: %*"):format(v26.Name, v26.ID), 
                        Size = UDim2.new(1, 0, 0, 25), 
                        Position = UDim2.new(0, 0, 0, v20 * 25), 
                        BackgroundTransparency = v20 % 2 == 0 and 0 or 0.2, 
                        TextXAlignment = "Left", 
                        OnClicked = function(v29) --[[ Line: 157 ]] --[[ Name: OnClicked ]]
                            -- upvalues: v9 (ref), v12 (ref), v26 (copy), v16 (ref), l_status_0 (copy), l_result_0 (copy), v25 (copy)
                            if v9 and v9.Button then
                                v9.Button.BackgroundTransparency = 0;
                            end;
                            v29.BackgroundTransparency = 0.5;
                            v12:Stop();
                            v12.SoundId = ("http://www.roblox.com/asset/?id=%*"):format(v26.ID);
                            v12:Play();
                            v16.Text = l_status_0 and l_result_0.Name or v26.Name;
                            v9 = {
                                ID = v26.ID, 
                                Name = v26.Name, 
                                Button = v29, 
                                Index = v25
                            };
                        end
                    });
                end;
            end;
            v20 = v20 + 1;
        end;
        v11 = v12.Ended:Connect(function() --[[ Line: 180 ]]
            -- upvalues: v7 (ref), v9 (ref), v10 (ref), v12 (ref), v16 (ref)
            if v7 and v9 then
                if v10 then
                    local v30 = nil;
                    repeat
                        v30 = math.random(#v7);
                    until v30 ~= v9.Index or #v7 <= 1;
                    local v31 = v7[v30];
                    if v31 then
                        v12:Stop();
                        v12.SoundId = ("http://www.roblox.com/asset/?id=%*"):format(v31.ID);
                        v12:Play();
                        local l_status_1, l_result_1 = pcall(function() --[[ Line: 190 ]]
                            -- upvalues: v31 (copy)
                            return service.MarketplaceService:GetProductInfo(v31.ID, Enum.InfoType.Asset);
                        end);
                        v16.Text = l_status_1 and l_result_1.Name or ("[ERROR] %*"):format(v31.Name);
                        v9 = {
                            ID = v31.ID, 
                            Name = v31.Name, 
                            Button = nil, 
                            Index = v30
                        };
                        return;
                    end;
                else
                    local v34 = v7[v9.Index + 1];
                    if v34 then
                        v12:Stop();
                        v12.SoundId = ("http://www.roblox.com/asset/?id=%*"):format(v34.ID);
                        v12:Play();
                        local l_status_2, l_result_2 = pcall(function() --[[ Line: 207 ]]
                            -- upvalues: v34 (copy)
                            return service.MarketplaceService:GetProductInfo(v34.ID, Enum.InfoType.Asset);
                        end);
                        v16.Text = l_status_2 and l_result_2.Name or ("[ERROR] %*"):format(v34.Name);
                        v9 = {
                            ID = v34.ID, 
                            Name = v34.Name, 
                            Button = nil, 
                            Index = v9.Index + 1
                        };
                    end;
                end;
            end;
        end);
        v22:Destroy();
        v21:ResizeCanvas(false, true);
    end;
    local v38 = v15:Add("TabFrame", {
        Size = UDim2.new(1, 0, 1, -165), 
        Position = UDim2.new(0, 0, 0, 90)
    });
    local v39 = v38:NewTab("Personal", {
        Text = "Personal", 
        OnFocus = function() --[[ Line: 234 ]] --[[ Name: OnFocus ]]
            -- upvalues: v7 (ref), v8 (copy)
            v7 = v8.Personal or {};
        end
    });
    local v40 = v38:NewTab("Game", {
        Text = "Game", 
        OnFocus = function() --[[ Line: 240 ]] --[[ Name: OnFocus ]]
            -- upvalues: v7 (ref), v8 (copy)
            v7 = v8.Game or {};
        end
    });
    local v41 = v38:NewTab("Adonis", {
        Text = "Adonis", 
        OnFocus = function() --[[ Line: 246 ]] --[[ Name: OnFocus ]]
            -- upvalues: v7 (ref), v8 (copy)
            v7 = v8.Adonis or {};
        end
    });
    local v42 = v38:NewTab("Custom", {
        Text = "Custom", 
        OnFocus = function() --[[ Line: 252 ]] --[[ Name: OnFocus ]]
            -- upvalues: v7 (ref), v8 (copy)
            v7 = v8.Custom or {};
        end
    });
    local v43 = nil;
    v43 = v38:Add("Frame", {
        Visible = false, 
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundTransparency = 0, 
        ZIndex = 10000, 
        Children = {
            {
                Class = "TextLabel", 
                Text = "New Custom Playlist string:", 
                Position = UDim2.new(0, 5, 0, 5), 
                Size = UDim2.new(1, -10, 0, 30), 
                BackgroundTransparency = 0, 
                ZIndex = 10001
            }, 
            {
                Class = "TextButton", 
                Text = "Add", 
                Position = UDim2.new(0.5, 5, 1, -35), 
                Size = UDim2.new(0.5, -10, 0, 30), 
                BackgroundTransparency = 0, 
                ZIndex = 10002, 
                OnClicked = function() --[[ Line: 282 ]] --[[ Name: OnClicked ]]

                end
            }, 
            {
                Class = "TextButton", 
                Text = "Cancel", 
                Position = UDim2.new(0, 5, 1, -35), 
                Size = UDim2.new(0.5, -5, 0, 30), 
                BackgroundTransparency = 0, 
                ZIndex = 10003, 
                OnClicked = function() --[[ Line: 292 ]] --[[ Name: OnClicked ]]
                    -- upvalues: v43 (ref)
                    v43.Visible = false;
                end
            }
        }
    });
    local v44 = "TextBox";
    local v52 = {
        Position = UDim2.new(0, 5, 0, 40), 
        Size = UDim2.new(1, -10, 1, -80), 
        TextWrapped = true, 
        ClearTextOnFocus = false, 
        PlaceholderText = "NAME:ID, SECOND:12398801, HeavyIsDead:4881542521", 
        ZIndex = 10004, 
        TextChanged = function(v45, _, _) --[[ Line: 308 ]] --[[ Name: TextChanged ]]
            -- upvalues: v43 (ref), v37 (copy), v42 (copy), v7 (ref), v8 (copy)
            client.Variables.Playlist = {
                Playlist = {}
            };
            for v48 in pairs(client.Variables.Playlist.Playlist) do
                client.Variables.Playlist.Playlist[v48] = nil;
            end;
            for _, v50 in next, (string.split(string.gsub(v45, " ", ""), ",")) do
                local v51 = string.split(v50, ":");
                table.insert(client.Variables.Playlist.Playlist, #client.Variables.Playlist.Playlist + 1, {
                    Name = tostring(v51[1]), 
                    ID = tonumber(v51[2])
                });
            end;
            v43.Visible = false;
            v37(v42, client.Variables.Playlist.Playlist or {});
            v7 = v8.Custom or {};
        end
    };
    local v53 = v43:Add(v44, v52);
    v53.BackgroundColor3 = v53.BackgroundColor3:lerp(Color3.new(1, 1, 1), 0.1);
    v43.BackgroundColor3 = v43.BackgroundColor3:lerp(Color3.new(1, 1, 1), 0.05);
    local v54 = v15:Add("Frame", {
        Size = UDim2.new(1, 0, 0, 75), 
        Position = UDim2.new(0, 0, 1, -75), 
        BackgroundColor3 = Color3.new(0.235294, 0.235294, 0.235294), 
        BackgroundTransparency = 0
    });
    v44 = v54:Add("TextButton", {
        Text = "Load playlist", 
        ToolTip = "Create a new custom playlist from a string.", 
        BackgroundTransparency = 0, 
        Size = UDim2.new(0, 100, 0, 30), 
        Position = UDim2.new(0, 5, 1, -70), 
        OnClicked = function() --[[ Line: 351 ]] --[[ Name: OnClicked ]]
            -- upvalues: v53 (copy), v43 (ref), v42 (copy), v7 (ref), v8 (copy)
            v53.Text = "";
            v43.Visible = true;
            v42:FocusTab();
            v7 = v8.Custom or {};
        end
    });
    v52 = v54:Add("TextButton", {
        Text = "Save playlist", 
        ToolTip = "Save your custom playlist to the games datastore.", 
        BackgroundTransparency = 0, 
        Size = UDim2.new(0, 100, 0, 30), 
        Position = UDim2.new(1, -105, 1, -70), 
        OnClicked = function() --[[ Line: 368 ]] --[[ Name: OnClicked ]]
            -- upvalues: v39 (copy), v37 (copy), v7 (ref), v8 (copy)
            v39:FocusTab();
            if client.Variables.Playlist.Playlist ~= nil and client.Variables.Playlist.Playlist ~= {} then
                client.Functions.UpdatePlaylist(client.Variables.Playlist);
                v37(v39, client.Functions.Playlist().Playlist or {});
            else
                print("[ERROR] Cannot update empty Playlist");
            end;
            v7 = v8.Personal or {};
        end
    });
    local _ = v54:Add("TextLabel", {
        Text = "  ID: ", 
        ToolTip = "ID: The Sound ID from the roblox catalogue.", 
        BackgroundTransparency = 0, 
        Size = UDim2.new(0, 120, 0, 30), 
        Position = UDim2.new(0, 5, 1, -35), 
        TextXAlignment = "Left", 
        Children = {
            TextBox = {
                Text = "", 
                PlaceholderText = "4881542521", 
                Size = UDim2.new(0, 80, 1, 0), 
                Position = UDim2.new(1, -90, 0, 0), 
                BackgroundTransparency = 1, 
                TextXAlignment = "Right", 
                TextChanged = function(v55, v56, _) --[[ Line: 402 ]] --[[ Name: TextChanged ]]
                    -- upvalues: v12 (copy)
                    if v56 then
                        v12:Stop();
                        v12.SoundId = ("http://www.roblox.com/asset/?id=%*"):format(v55);
                        v12:Play();
                    end;
                end
            }
        }
    });
    local _ = v54:Add("TextLabel", {
        Text = "  Vol: ", 
        ToolTip = "Volume: How loud the audio will play (0 to 10).", 
        BackgroundTransparency = 0, 
        Size = UDim2.new(0, 60, 0, 30), 
        Position = UDim2.new(0, 130, 1, -35), 
        TextXAlignment = "Left", 
        Children = {
            TextBox = {
                Text = "", 
                PlaceholderText = "1", 
                Size = UDim2.new(0, 40, 1, 0), 
                Position = UDim2.new(1, -50, 0, 0), 
                BackgroundTransparency = 1, 
                TextXAlignment = "Right", 
                TextChanged = function(v59, v60, _) --[[ Line: 429 ]] --[[ Name: TextChanged ]]
                    -- upvalues: v12 (copy)
                    if v60 then
                        v12.Volume = v59;
                    end;
                end
            }
        }
    });
    local _ = v54:Add("TextLabel", {
        Text = "  Pos: ", 
        ToolTip = "Position: Set the audio's position (In seconds).", 
        BackgroundTransparency = 0, 
        Size = UDim2.new(0, 60, 0, 30), 
        Position = UDim2.new(1, -205, 1, -35), 
        TextXAlignment = "Left", 
        Children = {
            TextBox = {
                Text = "", 
                PlaceholderText = "0", 
                Size = UDim2.new(0, 40, 1, 0), 
                Position = UDim2.new(1, -50, 0, 0), 
                BackgroundTransparency = 1, 
                TextXAlignment = "Right", 
                TextChanged = function(v63, v64, _) --[[ Line: 454 ]] --[[ Name: TextChanged ]]
                    -- upvalues: v12 (copy)
                    if v64 then
                        v12:Stop();
                        v12.TimePosition = v63;
                        v12:Play();
                    end;
                end
            }
        }
    });
    local _ = v54:Add("TextButton", {
        Text = "\226\151\128\239\184\143", 
        TextSize = 15, 
        ToolTip = "Back: Go back to the last played track.", 
        BackgroundTransparency = 0, 
        Size = UDim2.new(0, 30, 0, 30), 
        Position = UDim2.new(1, -140, 1, -35), 
        TextXAlignment = "Center", 
        OnClick = function() --[[ Line: 474 ]] --[[ Name: OnClick ]]
            -- upvalues: v7 (ref), v9 (ref), v10 (ref), v12 (copy), v16 (copy)
            if v7 and v9 then
                if v10 then
                    local v67 = nil;
                    repeat
                        v67 = math.random(#v7);
                    until v67 ~= v9.Index or #v7 <= 1;
                    local v68 = v7[v67];
                    if v68 then
                        v12:Stop();
                        v12.SoundId = ("http://www.roblox.com/asset/?id=%*"):format(v68.ID);
                        v12:Play();
                        local l_status_3, l_result_3 = pcall(function() --[[ Line: 484 ]]
                            -- upvalues: v68 (copy)
                            return service.MarketplaceService:GetProductInfo(v68.ID, Enum.InfoType.Asset);
                        end);
                        v16.Text = l_status_3 and l_result_3.Name or ("[ERROR] %*"):format(v68.Name);
                        v9 = {
                            ID = v68.ID, 
                            Name = v68.Name, 
                            Button = nil, 
                            Index = v67
                        };
                        return;
                    end;
                else
                    local v71 = v7[v9.Index - 1];
                    if v71 then
                        v12:Stop();
                        v12.SoundId = ("http://www.roblox.com/asset/?id=%*"):format(v71.ID);
                        v12:Play();
                        local l_status_4, l_result_4 = pcall(function() --[[ Line: 501 ]]
                            -- upvalues: v71 (copy)
                            return service.MarketplaceService:GetProductInfo(v71.ID, Enum.InfoType.Asset);
                        end);
                        v16.Text = l_status_4 and l_result_4.Name or ("[ERROR] %*"):format(v71.Name);
                        v9 = {
                            ID = v71.ID, 
                            Name = v71.Name, 
                            Button = nil, 
                            Index = v9.Index - 1
                        };
                    end;
                end;
            end;
        end
    });
    local _ = v54:Add("TextButton", {
        Text = "\226\143\175\239\184\143", 
        TextSize = 15, 
        ToolTip = "Pause/Play: Control the tracks playing state.", 
        BackgroundTransparency = 0, 
        Size = UDim2.new(0, 30, 0, 30), 
        Position = UDim2.new(1, -105, 1, -35), 
        TextXAlignment = "Center", 
        OnClick = function() --[[ Line: 526 ]] --[[ Name: OnClick ]]
            -- upvalues: v12 (copy)
            if v12.Playing then
                v12:Pause();
                return;
            else
                v12:Resume();
                return;
            end;
        end
    });
    local _ = v54:Add("TextButton", {
        Text = "\226\150\182\239\184\143", 
        TextSize = 15, 
        ToolTip = "Forward: Skip to the next track.", 
        BackgroundTransparency = 0, 
        Size = UDim2.new(0, 30, 0, 30), 
        Position = UDim2.new(1, -70, 1, -35), 
        TextXAlignment = "Center", 
        OnClick = function() --[[ Line: 544 ]] --[[ Name: OnClick ]]
            -- upvalues: v7 (ref), v9 (ref), v10 (ref), v12 (copy), v16 (copy)
            if v7 and v9 then
                if v10 then
                    local v76 = nil;
                    repeat
                        v76 = math.random(#v7);
                    until v76 ~= v9.Index or #v7 <= 1;
                    local v77 = v7[v76];
                    if v77 then
                        v12:Stop();
                        v12.SoundId = ("http://www.roblox.com/asset/?id=%*"):format(v77.ID);
                        v12:Play();
                        local l_status_5, l_result_5 = pcall(function() --[[ Line: 554 ]]
                            -- upvalues: v77 (copy)
                            return service.MarketplaceService:GetProductInfo(v77.ID, Enum.InfoType.Asset);
                        end);
                        v16.Text = l_status_5 and l_result_5.Name or ("[ERROR] %*"):format(v77.Name);
                        v9 = {
                            ID = v77.ID, 
                            Name = v77.Name, 
                            Button = nil, 
                            Index = v76
                        };
                        return;
                    end;
                else
                    local v80 = v7[v9.Index + 1];
                    if v80 then
                        v12:Stop();
                        v12.SoundId = ("http://www.roblox.com/asset/?id=%*"):format(v80.ID);
                        v12:Play();
                        local l_status_6, l_result_6 = pcall(function() --[[ Line: 571 ]]
                            -- upvalues: v80 (copy)
                            return service.MarketplaceService:GetProductInfo(v80.ID, Enum.InfoType.Asset);
                        end);
                        v16.Text = l_status_6 and l_result_6.Name or ("[ERROR] %*"):format(v80.Name);
                        v9 = {
                            ID = v80.ID, 
                            Name = v80.Name, 
                            Button = nil, 
                            Index = v9.Index + 1
                        };
                    end;
                end;
            end;
        end
    });
    local v84 = nil;
    local v85 = nil;
    local function v86() --[[ Line: 590 ]] --[[ Name: changeShuffleColor ]]
        -- upvalues: v10 (ref), v84 (ref), v85 (ref)
        if v10 then
            v84.BackgroundColor3 = Color3.new(0, 1, 0.6);
            return;
        else
            v84.BackgroundColor3 = v85;
            return;
        end;
    end;
    v84 = v54:Add("TextButton", {
        Text = "\240\159\148\128", 
        TextSize = 15, 
        ToolTip = "Shuffle: Randomly pick between.", 
        BackgroundTransparency = 0, 
        Size = UDim2.new(0, 30, 0, 30), 
        Position = UDim2.new(1, -35, 1, -35), 
        TextXAlignment = "Center", 
        OnClick = function() --[[ Line: 607 ]] --[[ Name: OnClick ]]
            -- upvalues: v10 (ref), v86 (copy)
            v10 = not v10;
            v86();
        end
    });
    v85 = v84.BackgroundColor3;
    v12.Parent = v17;
    l_Visualizer_0.new(v17, 400):LinkToSound(v12);
    local function v88(v87) --[[ Line: 627 ]]
        v87:Add("TextLabel", {
            Text = "Waiting in queue to load tracks...", 
            ToolTip = "Never gonna give you up, Never gonna let you down...", 
            BackgroundTransparency = 0, 
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            ZIndex = 69420
        });
    end;
    v88(v39);
    v88(v40);
    v88(v41);
    v37(v39, client.Functions.Playlist().Playlist or {});
    v37(v40, client.Remote.Get("Variable", "MusicList") or {});
    v37(v41, client.Remote.Get("Variable", "MusicList") or {});
    v7 = v8.Personal or {};
end;