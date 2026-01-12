local v0 = nil;
local v1 = nil;
client = v0;
service = v1;
return function(_, v3) --[[ Line: 3 ]]
    if v3 then
        setfenv(1, v3);
    end;
    local v4 = nil;
    local v5 = client.UI.Make("Window", {
        Name = "OnlineFriends", 
        Title = "Online Friends", 
        Icon = client.MatIcons.People, 
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
            -- upvalues: v4 (ref)
            v4();
        end
    });
    local function v7(v6) --[[ Line: 22 ]] --[[ Name: locationTypeToStr ]]
        return ({
            [0] = "Mobile Website", 
            [1] = "Mobile InGame", 
            [2] = "Website", 
            [3] = "Studio", 
            [4] = "InGame", 
            [5] = "Xbox", 
            [6] = "Team Create"
        })[v6];
    end;
    local v8 = v5:Add("ScrollingFrame", {
        List = {}, 
        ScrollBarThickness = 3, 
        BackgroundTransparency = 1, 
        Position = UDim2.new(0, 5, 0, 35), 
        Size = UDim2.new(1, -10, 1, -40)
    });
    v8:Add("UIListLayout", {
        SortOrder = "LayoutOrder", 
        FillDirection = "Vertical", 
        VerticalAlignment = "Top"
    });
    local v9 = v5:Add("TextBox", {
        Position = UDim2.new(0, 5, 0, 5), 
        Size = UDim2.new(1, -10, 0, 25), 
        BackgroundTransparency = 0.25, 
        BorderSizePixel = 0, 
        TextColor3 = Color3.new(1, 1, 1), 
        Text = "", 
        PlaceholderText = "Search", 
        TextStrokeTransparency = 0.8
    });
    v9:Add("ImageLabel", {
        Image = client.MatIcons.Search, 
        Position = UDim2.new(1, -21, 0, 3), 
        Size = UDim2.new(0, 18, 0, 18), 
        ImageTransparency = 0.2, 
        BackgroundTransparency = 1
    });
    v4 = function() --[[ Line: 59 ]] --[[ Name: generate ]]
        -- upvalues: v9 (copy), v8 (copy), v7 (copy), v5 (copy)
        local l_FriendsOnline_0 = service.Players.LocalPlayer:GetFriendsOnline();
        table.sort(l_FriendsOnline_0, function(v11, v12) --[[ Line: 61 ]]
            return v11.UserName < v12.UserName;
        end);
        local l_Text_0 = v9.Text;
        for _, v15 in ipairs(v8:GetChildren()) do
            if not v15:IsA("UIListLayout") then
                v15:Destroy();
            end;
        end;
        for v16, v17 in ipairs(l_FriendsOnline_0) do
            if v17.UserName:sub(1, #l_Text_0):lower() == l_Text_0:lower() or v17.DisplayName:sub(1, #l_Text_0):lower() == l_Text_0:lower() then
                local v18 = v8:Add("TextLabel", {
                    Text = ("             %*"):format(if v17.UserName == v17.DisplayName then v17.UserName else ("%* (@%*)"):format(v17.DisplayName, v17.UserName)), 
                    ToolTip = ("Location: %*"):format(v17.LastLocation), 
                    BackgroundTransparency = v16 % 2 == 0 and 0 or 0.2, 
                    Size = UDim2.new(1, 0, 0, 30), 
                    LayoutOrder = v16, 
                    TextXAlignment = "Left"
                });
                v18:Add("TextLabel", {
                    Text = (" %*  "):format((v7(v17.LocationType))), 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, 120, 1, 0), 
                    Position = UDim2.new(1, -120, 0, 0), 
                    TextXAlignment = "Right"
                });
                spawn(function() --[[ Line: 90 ]]
                    -- upvalues: v18 (copy), v17 (copy)
                    v18:Add("ImageLabel", {
                        Image = service.Players:GetUserThumbnailAsync(v17.VisitorId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420), 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(0, 30, 0, 30), 
                        Position = UDim2.new(0, 0, 0, 0)
                    });
                end);
            end;
        end;
        v8:ResizeCanvas(false, true, false, false, 5, 5);
        v5:SetTitle((("Online Friends (%*)"):format(#l_FriendsOnline_0)));
    end;
    v9:GetPropertyChangedSignal("Text"):Connect(v4);
    v4();
    v5:Ready();
    v5:AddTitleButton({
        Text = "", 
        ToolTip = "Invite", 
        OnClick = function() --[[ Line: 113 ]] --[[ Name: OnClick ]]
            service.SocialService:PromptGameInvite(service.Players.LocalPlayer);
        end
    }):Add("ImageLabel", {
        Size = UDim2.new(0, 16, 0, 16), 
        Position = UDim2.new(0, 8, 0, 2), 
        Image = client.MatIcons.Send, 
        BackgroundTransparency = 1
    });
end;