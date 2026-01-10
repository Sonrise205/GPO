local v0 = nil;
local v1 = nil;
client = v0;
service = v1;
return function(v2, v3) --[[ Line: 3 ]]
    if v3 then
        setfenv(1, v3);
    end;
    local l_Variables_0 = client.Variables;
    local _ = client.Functions;
    local _ = nil;
    local l_Song_0 = v2.Song;
    local v8 = nil;
    local v9 = nil;
    local v10 = nil;
    local v11 = false;
    local v12 = false;
    local v13 = nil;
    local v14 = {};
    local v15 = nil;
    local v16 = false;
    local v17 = false;
    local v18 = nil;
    local v19 = 0.25;
    local v20 = nil;
    local v21 = 0.05;
    local l_GlobalPerms_0 = v2.GlobalPerms;
    local l_Visualizer_0 = require(script:FindFirstChild("Visualizer"));
    local l_Slider_0 = require(script:FindFirstChild("Slider"));
    local l_AudioLib_0 = client.Shared:FindFirstChild("AudioLib");
    l_AudioLib_0 = require(l_AudioLib_0).new(service.UnWrap(service.LocalContainer()));
    local function v28(v26, v27) --[[ Line: 43 ]]
        -- upvalues: l_AudioLib_0 (ref)
        return l_AudioLib_0[v26](l_AudioLib_0, v27);
    end;
    v20 = v28;
    local function v29() --[[ Line: 51 ]] --[[ Name: doOnClose ]]
        -- upvalues: v10 (ref), l_Visualizer_0 (ref), v20 (ref)
        if v10 then
            v10:UnlinkFromSound();
            v10:Destroy();
            v10 = nil;
        end;
        if l_Visualizer_0 then
            l_Visualizer_0 = nil;
        end;
        v20("UpdateSound", {
            Playing = false
        });
    end;
    local v30 = client.UI.Make("Window", {
        Name = "Audio Player", 
        Title = "Audio Player", 
        Size = {
            420, 
            400
        }, 
        MinSize = {
            420, 
            245
        }, 
        icon = "http://www.roblox.com/asset/?id=7032721624", 
        Position = UDim2.new(0, 10, 1, -410), 
        OnClose = function() --[[ Line: 74 ]] --[[ Name: OnClose ]]
            -- upvalues: v29 (copy)
            v29();
        end
    });
    local v31 = v30:Add("Frame", {
        Size = UDim2.new(1, 0, 0, 75), 
        Position = UDim2.new(0, 0, 1, -75), 
        BackgroundColor3 = Color3.new(0.235294, 0.235294, 0.235294), 
        BackgroundTransparency = 0
    });
    local v32 = v31:Add("TextLabel", {
        Text = "   ", 
        ToolTip = "Volume: How loud the audio will play (0 to 10).", 
        BackgroundTransparency = 0, 
        Size = UDim2.new(0, 120, 0, 30), 
        Position = UDim2.new(1, -125, 1, -35), 
        TextXAlignment = "Left"
    });
    v32:Add("ImageLabel", {
        Image = "rbxassetid://7541896266", 
        Size = UDim2.new(0, 20, 0, 20), 
        Position = UDim2.new(0, 5, 0, 5), 
        BackgroundTransparency = 1
    });
    local v33 = v32:Add("Frame", {
        Image = "rbxassetid://7541896266", 
        Size = UDim2.new(1, -45, 0, 2), 
        Position = UDim2.new(0, 30, 0, 14), 
        BackgroundColor3 = Color3.new(0.454902, 0.454902, 0.454902), 
        BackgroundTransparency = 0
    });
    local _ = v33:Add("ImageButton", {
        Name = "Slider", 
        Size = UDim2.new(0, 10, 0, 10), 
        Position = UDim2.new(0, 0, 0, -4), 
        BackgroundColor3 = Color3.new(1, 1, 1), 
        BackgroundTransparency = 0, 
        TextXAlignment = "Right", 
        Children = {
            UICorner = {
                CornerRadius = UDim.new(1, 0)
            }
        }
    });
    local v35 = l_Slider_0.new(service.UnWrap(v33), {
        Start = 0, 
        End = 1000, 
        Increment = 1, 
        DefaultValue = 0.5
    }, TweenInfo.new(0.1, Enum.EasingStyle.Quad), "X", 0);
    v35:Track();
    v35.Changed:Connect(function(v36) --[[ Line: 131 ]]
        -- upvalues: v20 (ref)
        v20("UpdateSound", {
            Volume = v36 / 100
        });
    end);
    local v37 = v31:Add("TextLabel", {
        Text = "   ", 
        ToolTip = "Position: Control where the song is playing from.", 
        BackgroundTransparency = 0, 
        Size = UDim2.new(1, -135, 0, 30), 
        Position = UDim2.new(0, 5, 1, -35), 
        TextXAlignment = "Left"
    }):Add("Frame", {
        Image = "rbxassetid://7541896266", 
        Size = UDim2.new(1, -30, 0, 2), 
        Position = UDim2.new(0, 14, 0, 14), 
        BackgroundColor3 = Color3.new(0.454902, 0.454902, 0.454902), 
        BackgroundTransparency = 0
    });
    local _ = v37:Add("ImageButton", {
        Name = "Slider", 
        Size = UDim2.new(0, 10, 0, 10), 
        Position = UDim2.new(0, 0, 0, -4), 
        BackgroundColor3 = Color3.new(1, 1, 1), 
        BackgroundTransparency = 0, 
        TextXAlignment = "Right", 
        Children = {
            UICorner = {
                CornerRadius = UDim.new(1, 0)
            }
        }
    });
    local v39 = l_Slider_0.new(service.UnWrap(v37), {
        Start = 0, 
        End = 10000, 
        Increment = 1, 
        DefaultValue = 0.5
    }, TweenInfo.new(0.1, Enum.EasingStyle.Quad), "X", 0);
    v39:Track();
    v39.Changed:Connect(function(v40) --[[ Line: 172 ]]
        -- upvalues: v20 (ref)
        local l_TimeLength_0 = v20("GetSound").TimeLength;
        v20("UpdateSound", {
            TimePosition = v40 / 10000 * l_TimeLength_0
        });
    end);
    v30.gTable:Ready();
    local function v44(v42) --[[ Line: 184 ]] --[[ Name: newTrackSelected ]]
        -- upvalues: v20 (ref)
        local _ = v20("UpdateSound", {
            SoundId = ("rbxassetid://%*"):format(v42.ID), 
            Playing = true, 
            TimePosition = 0
        });
    end;
    local v45 = v30:Add("TextLabel", {
        Text = "Music Player", 
        Size = UDim2.new(1, 0, 0, 20), 
        BackgroundTransparency = 1, 
        TextScaled = true, 
        ToolTip = "Music Player"
    });
    local v46 = v30:Add("Frame", {
        Size = UDim2.new(1, 0, 0, 50), 
        Position = UDim2.new(0, 0, 0, 30), 
        BackgroundTransparency = 1, 
        TextScaled = true
    });
    local v47 = l_Visualizer_0.new(v46, 400);
    v47:LinkToSound(v20("GetSound"));
    if l_Song_0 then
        v20("UpdateSound", {
            SoundId = ("rbxassetid://%*"):format(l_Song_0), 
            Playing = true, 
            TimePosition = 0
        });
    end;
    local v48 = v30:AddTitleButton({
        Text = "", 
        OnClick = function() --[[ Line: 223 ]] --[[ Name: OnClick ]]
            -- upvalues: v11 (ref), v20 (ref), v19 (ref), v8 (ref)
            if v11 then
                v20("UpdateSound", {
                    Volume = v19
                });
                v8.Image = "rbxassetid://1638551696";
                v11 = false;
                return;
            else
                v19 = v20("GetSound").Volume;
                v20("UpdateSound", {
                    Volume = 0
                });
                v8.Image = "rbxassetid://1638584675";
                v11 = true;
                return;
            end;
        end
    });
    local _ = nil;
    if l_GlobalPerms_0 then
        v9 = v30:AddTitleButton({
            Text = "", 
            OnClick = function() --[[ Line: 247 ]] --[[ Name: OnClick ]]
                -- upvalues: v20 (ref), v12 (ref), v9 (ref), v28 (copy), v47 (copy), v21 (ref)
                v20("UpdateSound", {
                    Playing = false, 
                    TimePosition = 0
                });
                if v12 then
                    v9.Image = "rbxassetid://8318256297";
                    v12 = false;
                    task.spawn(client.UI.Make, "Notification", {
                        Title = "Global Audio", 
                        Icon = "rbxassetid://7541916144", 
                        Message = "Only you can hear your music", 
                        Time = 3
                    });
                    v20 = v28;
                    v20("UpdateSound", {
                        Playing = false, 
                        TimePosition = 0
                    });
                    v47:LinkToSound(v20("GetSound"));
                    v21 = 0.05;
                    return;
                else
                    v9.Image = "rbxassetid://8318257291";
                    v12 = true;
                    task.spawn(client.UI.Make, "Notification", {
                        Title = "Global Audio", 
                        Icon = "rbxassetid://7541916144", 
                        Message = "Everyone can hear your music", 
                        Time = 3
                    });
                    v20 = function(v50, v51) --[[ Line: 280 ]]
                        return client.Remote.Get("AudioLib", {
                            v50, 
                            v51
                        });
                    end;
                    v20("UpdateSound", {
                        Playing = false, 
                        TimePosition = 0
                    });
                    v47:LinkToSound(v20("GetSound"));
                    v21 = 2;
                    return;
                end;
            end
        }):Add("ImageLabel", {
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            Image = "rbxassetid://8318256297", 
            BackgroundTransparency = 1
        });
    end;
    v8 = v48:Add("ImageLabel", {
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        Image = "rbxassetid://1638551696", 
        BackgroundTransparency = 1
    });
    local function v77(v52, v53) --[[ Line: 309 ]] --[[ Name: getSongs ]]
        -- upvalues: v15 (ref), v14 (copy), v18 (ref), v45 (copy), v44 (copy), l_Variables_0 (copy), v13 (ref), v16 (ref), v20 (ref)
        local v54 = 0;
        v15 = nil;
        if v14 and v14[v52.Name] then
            v14[v52.Name] = nil;
        end;
        if v18 then
            v18:Disconnect();
        end;
        v52:ClearAllChildren();
        local v55 = v52:Add("ScrollingFrame", {
            Size = UDim2.new(1, 0, 1, 1), 
            Position = UDim2.new(0, 0, 0, 0), 
            BackgroundColor3 = Color3.new(0.235294, 0.235294, 0.235294), 
            BackgroundTransparency = 1
        });
        local v56 = v55:Add("TextLabel", {
            Text = "Loading nothing yet!", 
            ToolTip = "Never gonna give you up, Never gonna let you down...", 
            BackgroundTransparency = 0, 
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            ZIndex = 69420
        });
        v14[v52.Name] = {};
        local function v62(v57, v58) --[[ Line: 336 ]] --[[ Name: loop ]]
            -- upvalues: v56 (copy), v53 (copy), v14 (ref), v52 (copy), v55 (copy), v54 (ref), v15 (ref), v45 (ref), v44 (ref)
            if type(v58) == "table" then
                v56.Text = ("Loading tracks (%*/%*)"):format(v57, #v53);
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 339 ]]
                    -- upvalues: v58 (copy)
                    return service.MarketplaceService:GetProductInfo(v58.ID, Enum.InfoType.Asset);
                end);
                if l_result_0.AssetTypeId == 3 then
                    table.insert(v14[v52.Name], v58);
                    v55:Add("TextButton", {
                        Text = ("  %*) %*"):format(v54 + 1, l_status_0 and l_result_0.Name or ("[ERROR] %*"):format(v58.Name)), 
                        ToolTip = ("Name: %* | ID: %*"):format(v58.Name, v58.ID), 
                        Size = UDim2.new(1, 0, 0, 25), 
                        Position = UDim2.new(0, 0, 0, v54 * 25), 
                        BackgroundTransparency = v54 % 2 == 0 and 0 or 0.2, 
                        TextXAlignment = "Left", 
                        OnClicked = function(v61) --[[ Line: 351 ]] --[[ Name: OnClicked ]]
                            -- upvalues: v15 (ref), v45 (ref), l_status_0 (copy), l_result_0 (copy), v58 (copy), v57 (copy), v44 (ref)
                            if v15 and v15.Button then
                                v15.Button.BackgroundTransparency = 0;
                            end;
                            v61.BackgroundTransparency = 0.5;
                            v45.Text = l_status_0 and l_result_0.Name or v58.Name;
                            v15 = {
                                ID = v58.ID, 
                                Name = v58.Name, 
                                Button = v61, 
                                Index = v57
                            };
                            v44(v58);
                        end
                    });
                    v55:ResizeCanvas(false, true);
                end;
            end;
            v54 = v54 + 1;
        end;
        local l_next_0 = next;
        local v64 = v53 or {};
        for v65, v66 in l_next_0, v64 do
            task.spawn(v62, v65, v66);
        end;
        l_next_0 = l_Variables_0.localSounds.AUDIO_PLAYER_SOUND;
        if l_next_0 then
            v18 = l_next_0.Ended:Connect(function() --[[ Line: 381 ]]
                -- upvalues: v13 (ref), v15 (ref), v16 (ref), v20 (ref), v45 (ref)
                if v13 and v15 then
                    if v16 then
                        local v67 = nil;
                        repeat
                            v67 = math.random(#v13);
                        until v67 ~= v15.Index or #v13 <= 1;
                        local v68 = v13[v67];
                        if v68 then
                            v20("UpdateSound", {
                                SoundId = ("rbxassetid://%*"):format(v68.ID), 
                                Playing = true, 
                                TimePosition = 0
                            });
                            local l_status_1, l_result_1 = pcall(function() --[[ Line: 393 ]]
                                -- upvalues: v68 (copy)
                                return service.MarketplaceService:GetProductInfo(v68.ID, Enum.InfoType.Asset);
                            end);
                            v45.Text = l_status_1 and l_result_1.Name or ("[ERROR] %*"):format(v68.Name);
                            v15 = {
                                ID = v68.ID, 
                                Name = v68.Name, 
                                Button = nil, 
                                Index = v67
                            };
                            return;
                        end;
                    else
                        local v71 = v13[v15.Index + 1];
                        if v71 then
                            v20("UpdateSound", {
                                SoundId = ("rbxassetid://%*"):format(v71.ID), 
                                Playing = true, 
                                TimePosition = 0
                            });
                            local v72 = nil;
                            local v73 = nil;
                            local v74 = 0;
                            while not v72 do
                                if v74 >= 1 then
                                    wait(1);
                                end;
                                local l_status_2, l_result_2 = pcall(service.MarketplaceService.GetProductInfo, service.MarketplaceService, v71.ID, Enum.InfoType.Asset);
                                v72 = l_status_2;
                                v73 = l_result_2;
                                v74 = v74 + 1;
                            end;
                            v45.Text = v72 and v73.Name or ("[ERROR] %*"):format(v71.Name);
                            v15 = {
                                ID = v71.ID, 
                                Name = v71.Name, 
                                Button = nil, 
                                Index = v15.Index + 1
                            };
                        end;
                    end;
                end;
            end);
        end;
        v56:Destroy();
    end;
    local v78 = v30:Add("TabFrame", {
        Size = UDim2.new(1, 0, 1, -165), 
        Position = UDim2.new(0, 0, 0, 90)
    });
    local v79 = v78:NewTab("Personal", {
        Text = "Personal", 
        OnFocus = function() --[[ Line: 453 ]] --[[ Name: OnFocus ]]
            -- upvalues: v13 (ref), v14 (copy)
            v13 = v14.Personal or {};
        end
    });
    local v80 = v78:NewTab("Game", {
        Text = "Game", 
        OnFocus = function() --[[ Line: 459 ]] --[[ Name: OnFocus ]]
            -- upvalues: v13 (ref), v14 (copy)
            v13 = v14.Game or {};
        end
    });
    local v81 = v78:NewTab("Adonis", {
        Text = "Adonis", 
        OnFocus = function() --[[ Line: 465 ]] --[[ Name: OnFocus ]]
            -- upvalues: v13 (ref), v14 (copy)
            v13 = v14.Adonis or {};
        end
    });
    local v82 = v78:NewTab("Custom", {
        Text = "Custom", 
        OnFocus = function() --[[ Line: 471 ]] --[[ Name: OnFocus ]]
            -- upvalues: v13 (ref), v14 (copy)
            v13 = v14.Custom or {};
        end
    });
    local v83 = nil;
    v83 = v78:Add("Frame", {
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
                OnClicked = function() --[[ Line: 501 ]] --[[ Name: OnClicked ]]

                end
            }, 
            {
                Class = "TextButton", 
                Text = "Cancel", 
                Position = UDim2.new(0, 5, 1, -35), 
                Size = UDim2.new(0.5, -5, 0, 30), 
                BackgroundTransparency = 0, 
                ZIndex = 10003, 
                OnClicked = function() --[[ Line: 511 ]] --[[ Name: OnClicked ]]
                    -- upvalues: v83 (ref)
                    v83.Visible = false;
                end
            }
        }
    });
    local v84 = "TextBox";
    local v92 = {
        Position = UDim2.new(0, 5, 0, 40), 
        Size = UDim2.new(1, -10, 1, -80), 
        TextWrapped = true, 
        ClearTextOnFocus = false, 
        PlaceholderText = "NAME:ID, SECOND:12398801, HeavyIsDead:4881542521", 
        ZIndex = 10004, 
        TextChanged = function(v85, _, _) --[[ Line: 527 ]] --[[ Name: TextChanged ]]
            -- upvalues: v83 (ref), v77 (copy), v82 (copy), v13 (ref), v14 (copy)
            client.Variables.Playlist = {
                Playlist = {}
            };
            for v88 in pairs(client.Variables.Playlist.Playlist) do
                client.Variables.Playlist.Playlist[v88] = nil;
            end;
            for _, v90 in next, (string.split(string.gsub(v85, " ", ""), ",")) do
                local v91 = string.split(v90, ":");
                table.insert(client.Variables.Playlist.Playlist, #client.Variables.Playlist.Playlist + 1, {
                    Name = tostring(v91[1]), 
                    ID = tonumber(v91[2])
                });
            end;
            v83.Visible = false;
            v77(v82, client.Variables.Playlist.Playlist or {});
            v13 = v14.Custom or {};
        end
    };
    local v93 = v83:Add(v84, v92);
    v93.BackgroundColor3 = v93.BackgroundColor3:lerp(Color3.new(1, 1, 1), 0.1);
    v83.BackgroundColor3 = v83.BackgroundColor3:lerp(Color3.new(1, 1, 1), 0.05);
    local _ = v31:Add("TextButton", {
        Text = "\226\143\171", 
        TextSize = 15, 
        ToolTip = "Create playlist: Create a new custom playlist from a string.", 
        BackgroundTransparency = 0, 
        Size = UDim2.new(0, 30, 0, 30), 
        Position = UDim2.new(0, 5, 0, 5), 
        TextXAlignment = "Center", 
        OnClicked = function() --[[ Line: 567 ]] --[[ Name: OnClicked ]]
            -- upvalues: v93 (copy), v83 (ref), v82 (copy), v13 (ref), v14 (copy)
            v93.Text = "";
            v83.Visible = true;
            v82:FocusTab();
            v13 = v14.Custom or {};
        end
    });
    v84 = v31:Add("TextButton", {
        Text = "\226\172\134\239\184\143", 
        TextSize = 15, 
        ToolTip = "Upload playlist: Saves your custom playlist to the games datastore.", 
        BackgroundTransparency = 0, 
        Size = UDim2.new(0, 30, 0, 30), 
        Position = UDim2.new(0, 40, 0, 5), 
        TextXAlignment = "Center", 
        OnClicked = function() --[[ Line: 585 ]] --[[ Name: OnClicked ]]
            -- upvalues: v79 (copy), v77 (copy), v13 (ref), v14 (copy)
            v79:FocusTab();
            local v95 = false;
            if type(client.Variables.Playlist) == "table" then
                v95 = client.Variables.Playlist.Playlist;
            end;
            if v95 and next(v95) then
                client.Functions.UpdatePlaylist(client.Variables.Playlist);
                v77(v79, client.Functions.Playlist().Playlist or {});
            else
                warn("[ERROR] Cannot update empty Playlist");
            end;
            v13 = v14.Personal or {};
        end
    });
    v92 = v31:Add("TextButton", {
        Text = "\226\143\185", 
        TextSize = 15, 
        ToolTip = "Stop: Pauses the track and sets the position to 0.", 
        BackgroundTransparency = 0, 
        Size = UDim2.new(0, 30, 0, 30), 
        Position = UDim2.new(0, 75, 0, 5), 
        TextXAlignment = "Center", 
        OnClick = function() --[[ Line: 608 ]] --[[ Name: OnClick ]]
            -- upvalues: v20 (ref)
            v20("UpdateSound", {
                Playing = false, 
                TimePosition = 0
            });
        end
    });
    local _ = v31:Add("TextButton", {
        Text = "\226\151\128\239\184\143", 
        TextSize = 15, 
        ToolTip = "Back: Go back to the last played track.", 
        BackgroundTransparency = 0, 
        Size = UDim2.new(0, 30, 0, 30), 
        Position = UDim2.new(0, 110, 0, 5), 
        TextXAlignment = "Center", 
        OnClick = function() --[[ Line: 625 ]] --[[ Name: OnClick ]]

        end
    });
    local _ = v31:Add("TextButton", {
        Text = "\226\143\175\239\184\143", 
        TextSize = 15, 
        ToolTip = "Pause/Play: Control the tracks playing state.", 
        BackgroundTransparency = 0, 
        Size = UDim2.new(0, 30, 0, 30), 
        Position = UDim2.new(0, 145, 0, 5), 
        TextXAlignment = "Center", 
        OnClick = function() --[[ Line: 639 ]] --[[ Name: OnClick ]]
            -- upvalues: v20 (ref)
            if v20("GetSound") then
                v20("UpdateSound", {
                    Playing = not v20("GetSound").Playing
                });
            end;
        end
    });
    local _ = v31:Add("TextButton", {
        Text = "\226\150\182\239\184\143", 
        TextSize = 15, 
        ToolTip = "Forward: Skip to the next track.", 
        BackgroundTransparency = 0, 
        Size = UDim2.new(0, 30, 0, 30), 
        Position = UDim2.new(0, 180, 0, 5), 
        TextXAlignment = "Center", 
        OnClick = function() --[[ Line: 657 ]] --[[ Name: OnClick ]]

        end
    });
    local v99 = nil;
    local v100 = nil;
    local function v101() --[[ Line: 666 ]] --[[ Name: changeShuffleColor ]]
        -- upvalues: v16 (ref), v99 (ref), v100 (ref)
        if v16 then
            v99.BackgroundColor3 = Color3.new(0, 1, 0.6);
            return;
        else
            v99.BackgroundColor3 = v100;
            return;
        end;
    end;
    v99 = v31:Add("TextButton", {
        Text = "\240\159\148\128", 
        TextSize = 15, 
        ToolTip = "Shuffle: Randomly pick between.", 
        BackgroundTransparency = 0, 
        Size = UDim2.new(0, 30, 0, 30), 
        Position = UDim2.new(0, 215, 0, 5), 
        TextXAlignment = "Center", 
        OnClick = function() --[[ Line: 681 ]] --[[ Name: OnClick ]]
            -- upvalues: v16 (ref), v101 (copy)
            v16 = not v16;
            v101();
        end
    });
    v100 = v99.BackgroundColor3;
    local v102 = nil;
    local v103 = nil;
    local function v104() --[[ Line: 693 ]] --[[ Name: changeLoopColor ]]
        -- upvalues: v17 (ref), v102 (ref), v103 (ref)
        if v17 then
            v102.BackgroundColor3 = Color3.new(0, 1, 0.6);
            return;
        else
            v102.BackgroundColor3 = v103;
            return;
        end;
    end;
    v102 = v31:Add("TextButton", {
        Text = "\240\159\148\129", 
        TextSize = 15, 
        ToolTip = "Loop: Loops the song continuously.", 
        BackgroundTransparency = 0, 
        Size = UDim2.new(0, 30, 0, 30), 
        Position = UDim2.new(0, 250, 0, 5), 
        TextXAlignment = "Center", 
        OnClick = function() --[[ Line: 708 ]] --[[ Name: OnClick ]]
            -- upvalues: v17 (ref), v104 (copy), v20 (ref)
            v17 = not v17;
            v104();
            v20("UpdateSound", {
                Looped = v17
            });
        end
    });
    v103 = v102.BackgroundColor3;
    local _ = v31:Add("TextLabel", {
        Text = "  ID: ", 
        ToolTip = "ID: The Sound ID from the roblox catalogue.", 
        BackgroundTransparency = 0, 
        Size = UDim2.new(0, 120, 0, 30), 
        Position = UDim2.new(1, -125, 0, 5), 
        TextXAlignment = "Left", 
        Children = {
            TextBox = {
                Text = "", 
                PlaceholderText = "4881542521", 
                Size = UDim2.new(0, 80, 1, 0), 
                Position = UDim2.new(1, -90, 0, 0), 
                BackgroundTransparency = 1, 
                TextXAlignment = "Right", 
                TextChanged = function(v105, v106, _) --[[ Line: 737 ]] --[[ Name: TextChanged ]]
                    -- upvalues: v20 (ref)
                    if v106 then
                        v20("UpdateSound", {
                            SoundId = ("rbxassetid://%*"):format(v105), 
                            Playing = true, 
                            TimePosition = 0
                        });
                    end;
                end
            }
        }
    });
    local v109 = v31:Add("TextLabel", {
        Text = "   ", 
        ToolTip = "Volume: How loud the audio will play (0 to 10).", 
        BackgroundTransparency = 0, 
        Size = UDim2.new(0, 120, 0, 30), 
        Position = UDim2.new(1, -125, 1, -35), 
        TextXAlignment = "Left"
    });
    v109:Add("ImageLabel", {
        Image = "rbxassetid://7541896266", 
        Size = UDim2.new(0, 20, 0, 20), 
        Position = UDim2.new(0, 5, 0, 5), 
        BackgroundTransparency = 1
    });
    local v110 = v109:Add("Frame", {
        Image = "rbxassetid://7541896266", 
        Size = UDim2.new(1, -45, 0, 2), 
        Position = UDim2.new(0, 30, 0, 14), 
        BackgroundColor3 = Color3.new(0.454902, 0.454902, 0.454902), 
        BackgroundTransparency = 0
    });
    local _ = v110:Add("ImageButton", {
        Name = "Slider", 
        Size = UDim2.new(0, 10, 0, 10), 
        Position = UDim2.new(0, 0, 0, -4), 
        BackgroundColor3 = Color3.new(1, 1, 1), 
        BackgroundTransparency = 0, 
        TextXAlignment = "Right", 
        Children = {
            UICorner = {
                CornerRadius = UDim.new(1, 0)
            }
        }
    });
    local v112 = l_Slider_0.new(service.UnWrap(v110), {
        Start = 0, 
        End = 1000, 
        Increment = 1, 
        DefaultValue = 0.5
    }, TweenInfo.new(0.1, Enum.EasingStyle.Quad), "X", 0);
    v112:Track();
    v112.Changed:Connect(function(v113) --[[ Line: 830 ]]
        -- upvalues: v20 (ref)
        v20("UpdateSound", {
            Volume = v113 / 100
        });
    end);
    local v114 = v31:Add("TextLabel", {
        Text = "   ", 
        ToolTip = "Position: Control where the song is playing from.", 
        BackgroundTransparency = 0, 
        Size = UDim2.new(1, -135, 0, 30), 
        Position = UDim2.new(0, 5, 1, -35), 
        TextXAlignment = "Left"
    }):Add("Frame", {
        Image = "rbxassetid://7541896266", 
        Size = UDim2.new(1, -30, 0, 2), 
        Position = UDim2.new(0, 14, 0, 14), 
        BackgroundColor3 = Color3.new(0.454902, 0.454902, 0.454902), 
        BackgroundTransparency = 0
    });
    local _ = v114:Add("ImageButton", {
        Name = "Slider", 
        Size = UDim2.new(0, 10, 0, 10), 
        Position = UDim2.new(0, 0, 0, -4), 
        BackgroundColor3 = Color3.new(1, 1, 1), 
        BackgroundTransparency = 0, 
        TextXAlignment = "Right", 
        Children = {
            UICorner = {
                CornerRadius = UDim.new(1, 0)
            }
        }
    });
    local v116 = l_Slider_0.new(service.UnWrap(v114), {
        Start = 0, 
        End = 10000, 
        Increment = 1, 
        DefaultValue = 0.5
    }, TweenInfo.new(0.1, Enum.EasingStyle.Quad), "X", 0);
    v116:Track();
    v116.Changed:Connect(function(v117) --[[ Line: 871 ]]
        -- upvalues: v20 (ref)
        local l_TimeLength_1 = v20("GetSound").TimeLength;
        v20("UpdateSound", {
            TimePosition = v117 / 10000 * l_TimeLength_1
        });
    end);
    local function v120(v119) --[[ Line: 884 ]]
        v119:Add("TextLabel", {
            Text = "Waiting in queue to load tracks...", 
            ToolTip = "Never gonna give you up, Never gonna let you down...", 
            BackgroundTransparency = 0, 
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            ZIndex = 69420
        });
    end;
    v120(v79);
    v120(v80);
    v120(v81);
    v77(v79, client.Functions.Playlist().Playlist or {});
    v77(v80, client.Remote.Get("Variable", "MusicList") or {});
    v77(v81, client.Remote.Get("Variable", "MusicList") or {});
    v13 = v14.Personal or {};
    task.spawn(function() --[[ Line: 904 ]]
        -- upvalues: v20 (ref), v21 (ref), v116 (copy)
        local v121 = v20("GetSound");
        while task.wait(v21) do
            v121 = v20("GetSound");
            if v121 and v121.TimeLength ~= 0 then
                v116:OverrideVisualValue(v121.TimePosition / v121.TimeLength * 10000);
            end;
        end;
    end);
end;