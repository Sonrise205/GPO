local v0 = nil;
local v1 = nil;
client = v0;
service = v1;
v0 = function(v2) --[[ Line: 3 ]] --[[ Name: boolToStr ]]
    if v2 then
        return "Yes";
    else
        return "No";
    end;
end;
return function(v3, v4) --[[ Line: 11 ]]
    -- upvalues: v0 (copy)
    if v4 then
        setfenv(1, v4);
    end;
    local v5 = nil;
    local v6 = nil;
    local v8 = client.UI.Make("Window", {
        Name = "ServerDetails", 
        Title = "Server Details", 
        Icon = client.MatIcons.Topic, 
        Size = {
            420, 
            360
        }, 
        MinSize = {
            374, 
            155
        }, 
        AllowMultiple = false, 
        OnRefresh = function() --[[ Line: 25 ]] --[[ Name: OnRefresh ]]
            -- upvalues: v3 (copy), v5 (ref), v6 (ref)
            local v7 = client.Remote.Get("UpdateList", "ServerDetails");
            if v7 then
                v3.Refreshables = v7;
                v5();
                v6();
                return;
            else
                client.UI.Make("Output", {
                    Message = "Error fetching data; try again later"
                });
                return;
            end;
        end
    });
    local v9 = v8:Add("TabFrame", {
        Size = UDim2.new(1, -10, 1, -10), 
        Position = UDim2.new(0, 5, 0, 5)
    });
    local v10 = v9:NewTab("Overview", {
        Text = "Overview"
    });
    local v11 = v9:NewTab("Location", {
        Text = "Location"
    });
    local v12 = v9:NewTab("Players", {
        Text = "Players"
    });
    local v13 = v9:NewTab("Workspace", {
        Text = "Workspace"
    });
    if v3.Refreshables.WorkspaceInfo then
        v8:AddTitleButton({
            Text = "", 
            ToolTip = "Advanced stats", 
            OnClick = function() --[[ Line: 62 ]] --[[ Name: OnClick ]]
                -- upvalues: v3 (copy)
                client.Remote.Send("ProcessCommand", (("%*perfstats"):format(v3.CmdPrefix)));
            end
        }):Add("ImageLabel", {
            Size = UDim2.new(0, 18, 0, 18), 
            Position = UDim2.new(0, 6, 0, 1), 
            Image = client.MatIcons.Leaderboard, 
            BackgroundTransparency = 1
        });
        v8:AddTitleButton({
            Text = "", 
            ToolTip = "Game explorer", 
            OnClick = function() --[[ Line: 74 ]] --[[ Name: OnClick ]]
                -- upvalues: v3 (copy)
                client.Remote.Send("ProcessCommand", (("%*explorer"):format(v3.CmdPrefix)));
            end
        }):Add("ImageLabel", {
            Size = UDim2.new(0, 18, 0, 18), 
            Position = UDim2.new(0, 6, 0, 1), 
            Image = client.MatIcons.Folder, 
            BackgroundTransparency = 1
        });
    end;
    local v14 = "[Error]";
    v14 = service.RunService:IsStudio() and "Studio" or if v3.PrivateServerId ~= "" then v3.PrivateServerOwnerId ~= 0 and "Private" or "Reserved" else "Standard";
    local v15 = {
        {
            "Game ID", 
            game.GameId
        }, 
        {
            "Game Creator", 
            (("%* (#%*)"):format(service.MarketPlace:GetProductInfo(game.PlaceId).Creator.Name, v3.CreatorId))
        }, 
        {
            "Creator Type", 
            game.CreatorType.Name
        }, 
        {
            "Place ID", 
            game.PlaceId
        }, 
        {
            "Place Name", 
            service.MarketPlace:GetProductInfo(game.PlaceId).Name or "[Error]"
        }, 
        {
            "Place Version", 
            game.PlaceVersion
        }, 
        "", 
        {
            "Server Job ID", 
            game.JobId or "[Error]"
        }, 
        {
            "Server Type", 
            v14
        }, 
        "", 
        {
            "Server Speed", 
            "Loading..."
        }, 
        {
            "Server Age", 
            "Loading..."
        }, 
        {
            "Server Start Time", 
            service.FormatTime(v3.ServerStartTime, true)
        }
    };
    if v14 == "Reserved" then
        table.insert(v15, 10, {
            "Private Server ID", 
            v3.PrivateServerId
        });
    elseif v14 == "Private" then
        table.insert(v15, 10, {
            "Private Server ID", 
            v3.PrivateServerId
        });
        table.insert(v15, 11, {
            "Private Server Owner", 
            (("%* (%*)"):format(service.Players:GetNameFromUserIdAsync(v3.PrivateServerOwnerId) or "[Unknown Username]", v3.PrivateServerOwnerId))
        });
    end;
    local v16 = 0;
    local v17 = 0;
    local v18 = {};
    for _, v20 in ipairs(v15) do
        if type(v20) == "table" then
            v16 = v16 + 1;
            v18[v20[1]] = v10:Add("TextLabel", {
                Text = ("  %*:"):format(v20[1]), 
                ToolTip = v20[3], 
                BackgroundTransparency = v16 % 2 == 0 and 0 or 0.2, 
                Size = UDim2.new(1, -10, 0, 30), 
                Position = UDim2.new(0, 5, 0, v17 + 5), 
                TextXAlignment = "Left"
            }):Add("TextLabel", {
                Text = v20[2], 
                BackgroundTransparency = 1, 
                AnchorPoint = Vector2.new(1, 0), 
                Size = UDim2.new(1, -150, 1, 0), 
                Position = UDim2.new(1, -5, 0, 0), 
                TextXAlignment = "Right", 
                TextEditable = false, 
                ClearTextOnFocus = false
            });
            v17 = v17 + 30;
        else
            v17 = v17 + 10;
        end;
    end;
    v10:ResizeCanvas(false, true, false, false, 5, 5);
    local l_v18_0 = v18 --[[ copy: 14 -> 20 ]];
    spawn(function() --[[ Line: 156 ]]
        -- upvalues: l_v18_0 (copy), v3 (copy)
        while wait(0.5) do
            local v22 = os.time();
            if l_v18_0["Server Speed"] and l_v18_0["Server Age"] then
                l_v18_0["Server Speed"].Text = math.round((service.Workspace:GetRealPhysicsFPS()));
                l_v18_0["Server Age"].Text = string.format("%ds (%d min)", string.format(v22 - v3.ServerStartTime, "%.1f"), (math.round((v22 - v3.ServerStartTime) / 60)));
            else
                break;
            end;
        end;
    end);
    v14, v15 = xpcall(function() --[[ Line: 167 ]]
        return service.LocalizationService:GetCountryRegionForPlayerAsync(service.Players.LocalPlayer) == "US";
    end, function() --[[ Line: 169 ]]
        return false;
    end);
    v16 = function() --[[ Line: 173 ]] --[[ Name: show ]]
        -- upvalues: v3 (copy), v15 (copy), v11 (copy)
        local v23 = {};
        if v3.ServerInternetInfo then
            local l_ServerInternetInfo_0 = v3.ServerInternetInfo;
            for _, v26 in ipairs({
                {
                    "Timezone", 
                    l_ServerInternetInfo_0.timezone or "[Error]"
                }, 
                {
                    "Country", 
                    l_ServerInternetInfo_0.country or "[Error]"
                }, 
                {
                    "Region", 
                    l_ServerInternetInfo_0.region or "[Error]"
                }, 
                {
                    "City", 
                    l_ServerInternetInfo_0.city or "[Error]"
                }, 
                {
                    v15 and "Zipcode" or "Postcode", 
                    l_ServerInternetInfo_0.zipcode or "[Error]"
                }, 
                {
                    "IP Address", 
                    l_ServerInternetInfo_0.ip or "[Error]"
                }, 
                {
                    "Coordinates", 
                    l_ServerInternetInfo_0.coords or "[Error]"
                }
            }) do
                table.insert(v23, v26);
            end;
        else
            table.insert(v23, {
                "Error: Unable to retrieve server location info", 
                "HTTP requests may be disabled for this game."
            });
        end;
        local v27 = 1;
        for _, v29 in ipairs(v23) do
            v11:Add("TextLabel", {
                Text = ("  %*:"):format(v29[1]), 
                BackgroundTransparency = v27 % 2 == 0 and 0 or 0.2, 
                Size = UDim2.new(1, -10, 0, 30), 
                Position = UDim2.new(0, 5, 0, (v27 - 1) * 30 + 5), 
                TextXAlignment = "Left"
            }):Add("TextLabel", {
                Text = v29[2], 
                BackgroundTransparency = 1, 
                AnchorPoint = Vector2.new(1, 0), 
                Size = UDim2.new(1, -150, 1, 0), 
                Position = UDim2.new(1, -5, 0, 0), 
                TextXAlignment = "Right"
            });
            v27 = v27 + 1;
        end;
        v11:Add("TextLabel", {
            Text = "Server IP and coordinates are only shown to admins.", 
            TextWrapped = true, 
            TextYAlignment = "Top", 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, -10, 0, 40), 
            Position = UDim2.new(0, 5, 0, v27 * 30)
        });
        v11:ResizeCanvas(false, true, false, false, 5, 5);
    end;
    if service.RunService:IsStudio() then
        v17 = v11:Add("TextLabel", {
            Text = "Server location info has been hidden in a Studio environment for your privacy, since it may be based on your device's location.", 
            BackgroundTransparency = 0.4, 
            Size = UDim2.new(1, -10, 0, 80), 
            Position = UDim2.new(0, 5, 0, 5), 
            TextXAlignment = "Left", 
            TextYAlignment = "Top", 
            TextWrapped = true
        });
        v17:Add("UIPadding", {
            PaddingLeft = UDim.new(0, 5), 
            PaddingRight = UDim.new(0, 5), 
            PaddingTop = UDim.new(0, 5), 
            PaddingBottom = UDim.new(0, 5)
        });
        v17:Add("ImageLabel", {
            Image = client.MatIcons["Privacy tip"], 
            ImageTransparency = 0.2, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 24, 0, 24), 
            Position = UDim2.new(1, -140, 1, -28)
        });
        local l_v16_0 = v16 --[[ copy: 12 -> 21 ]];
        local l_v17_0 = v17 --[[ copy: 13 -> 22 ]];
        v17:Add("TextButton", {
            Text = "Show Anyway", 
            Size = UDim2.new(0, 110, 0, 30), 
            Position = UDim2.new(1, -110, 1, -30), 
            TextXAlignment = "Center", 
            OnClick = function() --[[ Line: 246 ]] --[[ Name: OnClick ]]
                -- upvalues: l_v16_0 (copy), l_v17_0 (copy)
                l_v16_0();
                l_v17_0:Destroy();
            end
        });
    else
        v16();
    end;
    v16 = v12:Add("TextBox", {
        Size = UDim2.new(1, -10, 0, 25), 
        Position = UDim2.new(0, 5, 0, 5), 
        BackgroundTransparency = 0.5, 
        BorderSizePixel = 0, 
        TextColor3 = Color3.new(1, 1, 1), 
        Text = "", 
        TextStrokeTransparency = 0.8
    });
    v16:Add("ImageLabel", {
        Image = client.MatIcons.Search, 
        Position = UDim2.new(1, -21, 0, 3), 
        Size = UDim2.new(0, 18, 0, 18), 
        ImageTransparency = 0.2, 
        BackgroundTransparency = 1
    });
    v17 = v12:Add("ScrollingFrame", {
        List = {}, 
        ScrollBarThickness = 2, 
        BackgroundTransparency = 1, 
        Position = UDim2.new(0, 5, 0, 32), 
        Size = UDim2.new(1, -10, 1, -37)
    });
    v18 = 0;
    local v32 = 0;
    do
        local l_v18_1, l_v32_0 = v18, v32;
        v5 = function() --[[ Line: 284 ]] --[[ Name: genPlayerList ]]
            -- upvalues: v16 (copy), l_v18_1 (ref), l_v32_0 (ref), v17 (copy), v3 (copy), v8 (copy)
            local l_Text_0 = v16.Text;
            local v36 = 0;
            local v37 = 0;
            l_v18_1 = v36;
            l_v32_0 = v37;
            v36 = {};
            for _, v39 in ipairs(service.Players:GetPlayers()) do
                table.insert(v36, v39.Name);
            end;
            table.sort(v36);
            v37 = 1;
            v17:ClearAllChildren();
            for _, v41 in ipairs(v36) do
                local l_FirstChild_0 = service.Players:FindFirstChild(v41);
                if l_FirstChild_0 and (v41:sub(1, #l_Text_0):lower() == l_Text_0:lower() or l_FirstChild_0.DisplayName:sub(1, #l_Text_0):lower() == l_Text_0:lower()) then
                    local v43 = v17:Add("TextButton", {
                        Text = ("           %*"):format((service.FormatPlayer(l_FirstChild_0))), 
                        ToolTip = ("User ID: %* [Click to open profile]"):format(service.Players[v41].UserId), 
                        BackgroundTransparency = v37 % 2 == 0 and 0 or 0.2, 
                        Size = UDim2.new(1, 0, 0, 30), 
                        Position = UDim2.new(0, 0, 0, (v37 - 1) * 30 + 5), 
                        TextXAlignment = "Left", 
                        OnClicked = function() --[[ Line: 307 ]] --[[ Name: OnClicked ]]
                            -- upvalues: v3 (ref), v41 (copy), v8 (ref)
                            client.Remote.Send("ProcessCommand", (("%*profile%*%*"):format(v3.CmdPlayerPrefix, v3.SplitKey, v41)));
                            v8:Close();
                        end
                    });
                    local v44 = v3.Refreshables.Admins and v3.Refreshables.Admins[v41];
                    if v44 and v44 ~= "Player" then
                        l_v32_0 = l_v32_0 + 1;
                        if table.find(v3.Refreshables.Donors, v41) then
                            v44 = v44 .. " | Donor";
                        end;
                        v43:Add("TextLabel", {
                            Text = (" %*  "):format(v44), 
                            BackgroundTransparency = 1, 
                            Size = UDim2.new(0, 120, 1, 0), 
                            Position = UDim2.new(1, -120, 0, 0), 
                            TextXAlignment = "Right"
                        });
                    elseif table.find(v3.Refreshables.Donors, v41) then
                        l_v18_1 = l_v18_1 + 1;
                        v43:Add("TextLabel", {
                            Text = " Donor  ", 
                            BackgroundTransparency = 1, 
                            Size = UDim2.new(0, 120, 1, 0), 
                            Position = UDim2.new(1, -120, 0, 0), 
                            TextXAlignment = "Right"
                        });
                    else
                        l_v18_1 = l_v18_1 + 1;
                    end;
                    spawn(function() --[[ Line: 341 ]]
                        -- upvalues: v43 (copy), v41 (copy)
                        v43:Add("ImageLabel", {
                            Image = service.Players:GetUserThumbnailAsync(service.Players[v41].UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48), 
                            BackgroundTransparency = 1, 
                            Size = UDim2.new(0, 30, 0, 30), 
                            Position = UDim2.new(0, 0, 0, 0)
                        });
                    end);
                    v37 = v37 + 1;
                end;
            end;
            if v3.Refreshables.Admins then
                v17:Add("TextLabel", {
                    Text = "Note: Only admins can see other admins' permission level.", 
                    TextWrapped = true, 
                    TextYAlignment = "Top", 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, -10, 0, 40), 
                    Position = UDim2.new(0, 5, 0, v37 * 30)
                });
            end;
            v17:ResizeCanvas(false, true, false, false, 5, 5);
            v16.PlaceholderText = ("Players: %*%* | Donors: %*"):format(l_v18_1, v3.Refreshables.Admins and (" | Admins: %*"):format(l_v32_0) or "", #v3.Refreshables.Donors);
        end;
        v16:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 365 ]]
            -- upvalues: v5 (ref)
            v5();
        end);
        v5();
    end;
    v6 = function() --[[ Line: 372 ]] --[[ Name: genWorkspaceInfo ]]
        -- upvalues: v13 (copy), v3 (copy), v0 (ref)
        v13:ClearAllChildren();
        local l_WorkspaceInfo_0 = v3.Refreshables.WorkspaceInfo;
        if l_WorkspaceInfo_0 then
            local v46 = 0;
            local v47 = 0;
            for _, v49 in ipairs({
                {
                    "Streaming Enabled", 
                    v0(service.Workspace.StreamingEnabled)
                }, 
                {
                    "Interpolation Throttling", 
                    service.Workspace.InterpolationThrottling.Name
                }, 
                {
                    "Gravity", 
                    service.Workspace.Gravity
                }, 
                {
                    "Fallen Parts Destroy Height", 
                    service.Workspace.FallenPartsDestroyHeight
                }, 
                {
                    "Adonis Objects", 
                    l_WorkspaceInfo_0.ObjectCount
                }, 
                {
                    "Adonis Cameras", 
                    l_WorkspaceInfo_0.CameraCount
                }, 
                {
                    "Nil Players", 
                    l_WorkspaceInfo_0.NilPlayerCount
                }, 
                "", 
                {
                    "HTTP Service Enabled", 
                    v0(l_WorkspaceInfo_0.HttpEnabled)
                }, 
                {
                    "Loadstring Enabled", 
                    v0(l_WorkspaceInfo_0.LoadstringEnabled)
                }, 
                ""
            }) do
                if type(v49) == "table" then
                    v46 = v46 + 1;
                    v13:Add("TextLabel", {
                        Text = ("  %*:"):format(v49[1]), 
                        ToolTip = v49[3], 
                        BackgroundTransparency = v46 % 2 == 0 and 0 or 0.2, 
                        Size = UDim2.new(1, -10, 0, 25), 
                        Position = UDim2.new(0, 5, 0, v47 + 5), 
                        TextXAlignment = "Left"
                    }):Add("TextLabel", {
                        Text = v49[2], 
                        BackgroundTransparency = 1, 
                        AnchorPoint = Vector2.new(1, 0), 
                        Size = UDim2.new(1, -150, 1, 0), 
                        Position = UDim2.new(1, -5, 0, 0), 
                        TextXAlignment = "Right"
                    });
                    v47 = v47 + 25;
                else
                    v47 = v47 + 10;
                end;
            end;
            v13:Add("TextLabel", {
                Text = "Click on the title bar buttons to view technical performance statistics or to open the game hierarchy explorer. (Permission-locked)", 
                TextWrapped = true, 
                TextYAlignment = "Top", 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, -10, 0, 40), 
                Position = UDim2.new(0, 5, 0, v47 + 10)
            });
            v13:ResizeCanvas(false, true, false, false, 5, 5);
            return;
        else
            v13:Disable();
            return;
        end;
    end;
    v6();
    v8:Ready();
end;