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
        Name = "BlockedUsers", 
        Title = "Blocked Users", 
        Icon = client.MatIcons.Dangerous, 
        Size = {
            300, 
            200
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
    local v6 = v5:Add("ScrollingFrame", {
        List = {}, 
        ScrollBarThickness = 3, 
        BackgroundTransparency = 1, 
        Position = UDim2.new(0, 0, 0, 35), 
        Size = UDim2.new(1, 0, 1, -40)
    });
    local v7 = v5:Add("TextBox", {
        Position = UDim2.new(0, 5, 0, 5), 
        Size = UDim2.new(1, -10, 0, 25), 
        BackgroundTransparency = 0.25, 
        BorderSizePixel = 0, 
        TextColor3 = Color3.new(1, 1, 1), 
        Text = "", 
        PlaceholderText = "Search", 
        TextStrokeTransparency = 0.8
    });
    v7:Add("ImageLabel", {
        Image = client.MatIcons.Search, 
        Position = UDim2.new(1, -21, 0, 3), 
        Size = UDim2.new(0, 18, 0, 18), 
        ImageTransparency = 0.2, 
        BackgroundTransparency = 1
    });
    local v8 = {};
    local function v17() --[[ Line: 50 ]] --[[ Name: generate ]]
        -- upvalues: v7 (copy), v6 (copy), v8 (ref), v5 (copy)
        local l_Text_0 = v7.Text;
        v6:ClearAllChildren();
        local v10 = 0;
        for v11, v12 in ipairs(v8) do
            v10 = v10 + 1;
            local v13 = if type(v12) == "number" then service.Players:GetNameFromUserIdAsync(v12) else if v12.DisplayName == v12.Username then v12.Username else string.format("%s (@%s)", v12.DisplayName, v12.Username);
            local v14 = if type(v12) == "number" then v12 else v12.Id;
            local l_PlayerByUserId_0 = service.Players:GetPlayerByUserId(v14);
            if l_Text_0 == "" or string.find(v13:lower(), l_Text_0:lower()) then
                local v16 = v6:Add("TextLabel", {
                    Text = ("         %*"):format(v13), 
                    ToolTip = ("ID: %*"):format(v14), 
                    BackgroundTransparency = v11 % 2 == 0 and 0 or 0.2, 
                    Size = UDim2.new(1, -10, 0, 30), 
                    Position = UDim2.new(0, 5, 0, (v11 - 1) * 30), 
                    TextXAlignment = "Left"
                });
                if l_PlayerByUserId_0 then
                    v16:Add("TextLabel", {
                        Text = "Unblock", 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(0, 100, 0.9, 0), 
                        Position = UDim2.new(1, -100, 0.05, 0), 
                        OnClick = function() --[[ Line: 75 ]] --[[ Name: OnClick ]]
                            -- upvalues: l_PlayerByUserId_0 (copy)
                            service.StarterGui:SetCore("PromptUnblockPlayer", l_PlayerByUserId_0);
                        end
                    });
                end;
                spawn(function() --[[ Line: 80 ]]
                    -- upvalues: v16 (copy), v14 (copy)
                    v16:Add("ImageLabel", {
                        Image = service.Players:GetUserThumbnailAsync(v14, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420), 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(0, 30, 0, 30), 
                        Position = UDim2.new(0, 0, 0, 0)
                    });
                end);
            end;
        end;
        v6:ResizeCanvas(false, true, false, false, 5, 5);
        v5:SetTitle((("Blocked Users (%*)"):format(v10)));
    end;
    v4 = function() --[[ Line: 94 ]] --[[ Name: getData ]]
        -- upvalues: v8 (ref), v17 (copy)
        v8 = service.StarterGui:GetCore("GetBlockedUserIds");
        v8 = select(2, xpcall(function() --[[ Line: 96 ]]
            -- upvalues: v8 (ref)
            return service.UserService:GetUserInfosByUserIdsAsync(v8);
        end, function() --[[ Line: 98 ]]
            -- upvalues: v8 (ref)
            return v8;
        end));
        v17();
    end;
    v7:GetPropertyChangedSignal("Text"):Connect(v17);
    service.StarterGui:GetCore("PlayerBlockedEvent").Event:Connect(v4);
    service.StarterGui:GetCore("PlayerUnblockedEvent").Event:Connect(v4);
    v4();
    v5:Ready();
end;