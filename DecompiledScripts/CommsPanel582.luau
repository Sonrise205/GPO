local v0 = nil;
local v1 = nil;
client = v0;
service = v1;
return function(_, v3) --[[ Line: 3 ]]
    if v3 then
        setfenv(1, v3);
    end;
    local v4 = nil;
    local v5 = nil;
    local v6 = nil;
    local v7 = nil;
    local v8 = {};
    local function v16(v9, v10, v11, v12, v13, v14) --[[ Line: 11 ]] --[[ Name: newMessage ]]
        -- upvalues: v6 (ref), v8 (copy)
        print(v12);
        local v15 = v6:Add("Frame", {
            Size = UDim2.new(1, 0, 0, 50), 
            BackgroundTransparency = 1, 
            AutomaticSize = "Y", 
            Children = {
                {
                    ClassName = "Frame", 
                    Name = "LoggedItem", 
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
                            Image = v12, 
                            OnClick = v14, 
                            BackgroundTransparency = 1
                        }, 
                        {
                            ClassName = "TextButton", 
                            Name = "Title", 
                            Size = UDim2.new(1, -55, 0, 15), 
                            Position = UDim2.new(0, 55, 0, 0), 
                            Text = v10, 
                            TextSize = "14", 
                            TextXAlignment = "Left", 
                            BackgroundTransparency = 1, 
                            OnClick = v14
                        }, 
                        {
                            ClassName = "TextButton", 
                            Name = "Type", 
                            Size = UDim2.new(1, -55, 0, 15), 
                            Position = UDim2.new(0, 55, 0, 0), 
                            Text = v9, 
                            TextSize = "14", 
                            TextXAlignment = "Right", 
                            BackgroundTransparency = 1, 
                            OnClick = v14
                        }, 
                        {
                            ClassName = "TextButton", 
                            Name = "Time", 
                            Size = UDim2.new(1, -55, 0, 15), 
                            Position = UDim2.new(0, 55, 0, 15), 
                            Text = v13, 
                            TextSize = "14", 
                            TextXAlignment = "Right", 
                            BackgroundTransparency = 1, 
                            OnClick = v14
                        }, 
                        {
                            ClassName = "TextButton", 
                            Name = "Function", 
                            Size = UDim2.new(1, -55, 0, 15), 
                            Position = UDim2.new(0, 55, 0, 30), 
                            Text = v14 and "Clickable" or "Not clickable", 
                            TextSize = "14", 
                            TextXAlignment = "Right", 
                            BackgroundTransparency = 1, 
                            OnClick = v14
                        }, 
                        {
                            ClassName = "TextButton", 
                            Name = "Message", 
                            Size = UDim2.new(1, -55, 0, 10), 
                            Position = UDim2.new(0, 55, 0, 15), 
                            Text = v11, 
                            TextXAlignment = "Left", 
                            TextYAlignment = "Top", 
                            AutomaticSize = "Y", 
                            TextWrapped = true, 
                            TextScaled = false, 
                            RichText = true, 
                            BackgroundTransparency = 1, 
                            OnClick = v14
                        }
                    }
                }
            }
        });
        table.insert(v8, v15);
        if #v8 > 200 then
            v8[1]:Destroy();
            table.remove(v8, 1);
        end;
    end;
    v5 = client.UI.Make("Window", {
        Name = "CommunicationsPanel", 
        Title = "Communications Panel", 
        Icon = client.MatIcons.Forum, 
        Size = {
            500, 
            300
        }, 
        OnClose = function() --[[ Line: 111 ]] --[[ Name: OnClose ]]
            client.Variables.CommsPanelBindableEvent = nil;
        end
    });
    v6 = v5:Add("ScrollingFrame", {
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        CanvasSize = UDim2.new(0, 0, 0, 0), 
        BackgroundTransparency = 0.9
    });
    v7 = service.New("UIListLayout", {
        Parent = v6, 
        FillDirection = "Vertical", 
        HorizontalAlignment = "Left", 
        VerticalAlignment = "Bottom", 
        SortOrder = "LayoutOrder"
    });
    v7:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() --[[ Line: 131 ]]
        -- upvalues: v6 (ref), v7 (ref)
        v6.CanvasSize = UDim2.new(0, 0, 0, v7.AbsoluteContentSize.Y);
        v6.CanvasPosition = Vector2.new(0, v7.AbsoluteContentSize.Y);
    end);
    if client.Variables.CommunicationsHistory then
        for _, v18 in ipairs(client.Variables.CommunicationsHistory) do
            v16(v18.Type, v18.Title, v18.Message, v18.Icon, v18.Time, v18.Function);
        end;
    end;
    service.HookEvent("CommsPanel", function(v19) --[[ Line: 142 ]]
        -- upvalues: v16 (copy)
        v16(v19.Type, v19.Title, v19.Message, v19.Icon, v19.Time, v19.Function);
    end);
    v4 = v5.gTable;
    v5:Ready();
end;