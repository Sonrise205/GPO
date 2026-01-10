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
    local l_game_0 = game;
    local l_game_1 = game;
    local v9 = nil;
    local v10 = nil;
    local _ = nil;
    local v12 = nil;
    local v13 = client.UI.Make("Window", {
        Name = "Explorer", 
        Title = "Game Explorer", 
        Icon = client.MatIcons.Folder, 
        Size = {
            400, 
            300
        }, 
        MinSize = {
            300, 
            200
        }, 
        AllowMultiple = false, 
        OnRefresh = function() --[[ Line: 22 ]] --[[ Name: OnRefresh ]]
            -- upvalues: v5 (ref), l_game_1 (ref)
            v5(l_game_1);
        end
    });
    v6 = function(v14, v15, v16, v17, v18) --[[ Line: 27 ]] --[[ Name: newEntry ]]
        -- upvalues: v9 (ref), l_game_0 (ref), l_game_1 (ref), v5 (ref)
        local v19 = v9:Add("TextLabel", {
            Text = ("  %*"):format(v15), 
            ToolTip = ("Class: %s | Children%s"):format(v14.ClassName or "Unknown", if #v14:GetChildren() ~= 0 then ": " .. #v14:GetChildren() .. " | Descendants: " .. #v14:GetDescendants() else "/Descendants: 0"), 
            TextXAlignment = "Left", 
            Size = UDim2.new(1, 0, 0, 26)
        });
        if v18 then
            v19.TextColor3 = v18;
        end;
        v19:Add("UIListLayout", {
            FillDirection = "Horizontal", 
            HorizontalAlignment = "Right", 
            VerticalAlignment = "Center", 
            SortOrder = "LayoutOrder"
        });
        local v20 = false;
        if #v14:GetChildren() > 0 then
            v20 = v19:Add("TextButton", {
                Text = "Open", 
                Size = UDim2.new(0, 80, 1, 0), 
                LayoutOrder = 1, 
                OnClick = function() --[[ Line: 47 ]] --[[ Name: OnClick ]]
                    -- upvalues: l_game_0 (ref), l_game_1 (ref), v14 (copy), v5 (ref)
                    l_game_0 = l_game_1;
                    l_game_1 = v14;
                    v5(v14);
                end
            });
        end;
        if v20 then
            v19.LayoutOrder = v19.LayoutOrder - 10;
        end;
        if v17 then
            v19.LayoutOrder = v19.LayoutOrder - 10;
        end;
        if v14.Parent ~= game or v14.Name:sub(1, 1):upper() ~= v14.Name:sub(1, 1) then
            local _ = v19:Add("TextButton", {
                Text = "Delete", 
                Size = UDim2.new(0, 80, 1, 0), 
                Visible = not v16, 
                LayoutOrder = 0, 
                OnClick = function(v21) --[[ Line: 62 ]] --[[ Name: OnClick ]]
                    -- upvalues: l_game_1 (ref), v14 (copy), v19 (copy), v20 (copy)
                    l_game_1 = l_game_1.Parent or game;
                    client.Remote.Send("HandleExplore", v14, "Delete");
                    if pcall(function() --[[ Line: 65 ]]
                        -- upvalues: v14 (ref)
                        v14:Destroy();
                    end) then
                        v19.TextColor3 = Color3.fromRGB(255, 60, 60);
                        local l_v19_0 = v19;
                        l_v19_0.Text = l_v19_0.Text .. " [Deleted]";
                        if v20 then
                            v20:Destroy();
                        end;
                        v21:Destroy();
                    end;
                end
            });
        end;
    end;
    v5 = function(v24) --[[ Line: 78 ]] --[[ Name: getList ]]
        -- upvalues: v10 (ref), v9 (ref), v12 (ref), v6 (ref), l_game_0 (ref)
        local l_Text_0 = v10.Text;
        for _, v27 in ipairs(v9:GetChildren()) do
            if not v27:IsA("UIListLayout") then
                v27:Destroy();
            end;
        end;
        if v24 == game then
            v12.Text = game.Name;
        else
            v12.Text = ("%*.%*"):format(game.Name, (v24:GetFullName()));
            v6(v24.Parent or l_game_0 or game, "Previous Parent (Go Up..)", true, true, Color3.new(0.666667, 1, 1));
        end;
        for _, v29 in ipairs(v24:GetChildren()) do
            pcall(function() --[[ Line: 95 ]]
                -- upvalues: v29 (copy), l_Text_0 (copy), v6 (ref)
                if string.find(v29.Name:lower(), l_Text_0:lower()) or string.find(v29.ClassName:lower(), l_Text_0:lower()) then
                    v6(v29, v29.Name);
                end;
            end);
        end;
        v9:ResizeCanvas(false, true, false, false, 5, 5);
    end;
    if v13 then
        v12 = v13:Add("ScrollingFrame", {
            ScrollBarThickness = 0, 
            ScrollingDirection = "X", 
            Size = UDim2.new(1, 0, 0, 30), 
            Position = UDim2.new(0, 0, 0, 0), 
            CanvasSize = UDim2.new(0, 0, 0, 20), 
            AutomaticCanvasSize = Enum.AutomaticSize.X
        }):Add("TextLabel", {
            TextXAlignment = "Left", 
            Text = game.Name, 
            Size = UDim2.new(0, 0, 0, 20), 
            AutomaticSize = Enum.AutomaticSize.X
        });
        local v30 = "UIPadding";
        local v31 = {
            PaddingLeft = UDim.new(0, 5), 
            PaddingRight = UDim.new(0, 5)
        };
        v12:Add(v30, v31);
        v9 = v13:Add("ScrollingFrame", {
            List = {}, 
            ScrollBarThickness = 2, 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 5, 0, 55), 
            Size = UDim2.new(1, -10, 1, -60)
        });
        v30 = "UIListLayout";
        v31 = {
            SortOrder = "LayoutOrder", 
            FillDirection = "Vertical", 
            VerticalAlignment = "Top"
        };
        v9:Add(v30, v31);
        v10 = v13:Add("TextBox", {
            Size = UDim2.new(1, -10, 0, 20), 
            Position = UDim2.new(0, 5, 0, 30), 
            BackgroundTransparency = 0.5, 
            BorderSizePixel = 0, 
            TextColor3 = Color3.new(1, 1, 1), 
            Text = "", 
            PlaceholderText = "Search", 
            TextStrokeTransparency = 0.8
        });
        v30 = "ImageLabel";
        v31 = {
            Image = client.MatIcons.Search, 
            Position = UDim2.new(1, -21, 0, 3), 
            Size = UDim2.new(0, 18, 0, 18), 
            ImageTransparency = 0.2, 
            BackgroundTransparency = 1
        };
        v10:Add(v30, v31);
        v10:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 156 ]]
            -- upvalues: v5 (ref), l_game_1 (ref)
            v5(l_game_1);
        end);
        v5(game);
        v4 = v13.gTable;
        v13:Ready();
    end;
end;