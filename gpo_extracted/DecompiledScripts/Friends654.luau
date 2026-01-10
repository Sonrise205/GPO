client = nil;
service = nil;
return function(_, v1) --[[ Line: 4 ]]
    if v1 then
        setfenv(1, v1);
    end;
    local v2 = nil;
    local v3 = client.UI.Make("Window", {
        Name = "OnlineFriends", 
        Title = "Online Friends", 
        Icon = "rbxassetid://7467298076", 
        Size = {
            390, 
            320
        }, 
        MinSize = {
            180, 
            120
        }, 
        AllowMultiple = false, 
        OnRefresh = function() --[[ Line: 17 ]] --[[ Name: OnRefresh ]]
            -- upvalues: v2 (ref)
            v2();
        end
    });
    local function v5(v4) --[[ Line: 23 ]] --[[ Name: locationTypeToStr ]]
        return ({
            [0] = "Mobile Website", 
            [1] = "Mobile InGame", 
            [2] = "Website", 
            [3] = "Studio", 
            [4] = "InGame", 
            [5] = "Xbox", 
            [6] = "Team Create"
        })[v4];
    end;
    local v6 = v3:Add("ScrollingFrame", {
        List = {}, 
        ScrollBarThickness = 3, 
        BackgroundTransparency = 1, 
        Position = UDim2.new(0, 0, 0, 32), 
        Size = UDim2.new(1, 0, 1, -37)
    });
    local v7 = v3:Add("TextBox", {
        Position = UDim2.new(0, 5, 0, 5), 
        Size = UDim2.new(1, -10, 0, 25), 
        BackgroundTransparency = 0.25, 
        BorderSizePixel = 0, 
        TextColor3 = Color3.new(1, 1, 1), 
        Text = "", 
        PlaceholderText = "Search", 
        TextStrokeTransparency = 0.8
    });
    v2 = function() --[[ Line: 54 ]] --[[ Name: generate ]]
        -- upvalues: v7 (copy), v6 (copy), v5 (copy), v3 (copy)
        local l_FriendsOnline_0 = game:GetService("Players").LocalPlayer:GetFriendsOnline();
        local v9 = {};
        local v10 = {};
        for _, v12 in pairs(l_FriendsOnline_0) do
            table.insert(v9, v12.UserName);
            v10[v12.UserName] = {
                id = v12.VisitorId, 
                displayName = v12.DisplayName, 
                lastLocation = v12.LastLocation, 
                locationType = v12.LocationType
            };
        end;
        table.sort(v9);
        local l_Text_0 = v7.Text;
        v6:ClearAllChildren();
        local v14 = 1;
        local v15 = 0;
        for _, v17 in ipairs(v9) do
            v15 = v15 + 1;
            if v17:sub(1, #l_Text_0):lower() == l_Text_0:lower() or v10[v17].displayName:sub(1, #l_Text_0):lower() == l_Text_0:lower() then
                local v18 = "";
                v18 = if v17 == v10[v17].displayName then v17 else ("%* (@%*)"):format(v10[v17].displayName, v17);
                local v19 = v6:Add("TextLabel", {
                    Text = ("             %*"):format(v18), 
                    ToolTip = ("Location: %*"):format(v10[v17].lastLocation), 
                    BackgroundTransparency = v14 % 2 == 0 and 0 or 0.2, 
                    Size = UDim2.new(1, -10, 0, 30), 
                    Position = UDim2.new(0, 5, 0, (v14 - 1) * 30), 
                    TextXAlignment = "Left"
                });
                v19:Add("TextLabel", {
                    Text = (" %*  "):format((v5(v10[v17].locationType))), 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, 120, 1, 0), 
                    Position = UDim2.new(1, -120, 0, 0), 
                    TextXAlignment = "Right"
                });
                task.spawn(function() --[[ Line: 94 ]]
                    -- upvalues: v19 (copy), v10 (copy), v17 (copy)
                    v19:Add("ImageLabel", {
                        Image = game:GetService("Players"):GetUserThumbnailAsync(v10[v17].id, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420), 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(0, 30, 0, 30), 
                        Position = UDim2.new(0, 0, 0, 0)
                    });
                end);
                v14 = v14 + 1;
            end;
        end;
        v6:ResizeCanvas(false, true, false, false, 5, 5);
        v3:SetTitle((("Online Friends (%*)"):format(v15)));
    end;
    v7.FocusLost:Connect(v2);
    v2();
    v3:Ready();
    v3:AddTitleButton({
        Text = "", 
        OnClick = function() --[[ Line: 117 ]] --[[ Name: OnClick ]]
            service.SocialService:PromptGameInvite(service.Players.LocalPlayer);
        end
    }):Add("ImageLabel", {
        Size = UDim2.new(0, 20, 0, 20), 
        Position = UDim2.new(0, 5, 0, 0), 
        Image = "rbxassetid://7467305706", 
        BackgroundTransparency = 1
    });
end;