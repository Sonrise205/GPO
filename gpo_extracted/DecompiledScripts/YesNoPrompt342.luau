local v0 = nil;
local v1 = nil;
client = v0;
service = v1;
return function(v2, v3) --[[ Line: 3 ]]
    if v3 then
        setfenv(1, v3);
    end;
    local v4 = nil;
    local v5 = nil;
    local v6 = os.clock();
    local v7 = client.UI.Make("Window", {
        Name = v2.Name or "Prompt", 
        Title = v2.Title or "Prompt", 
        Size = v2.Size or {
            225, 
            150
        }, 
        SizeLocked = true, 
        Icon = v2.Icon or client.MatIcons.Help, 
        OnClose = function() --[[ Line: 18 ]] --[[ Name: OnClose ]]
            -- upvalues: v5 (ref)
            if not v5 then
                v5 = "No";
            end;
        end
    });
    local _ = v7:Add("TextLabel", {
        Text = v2.Question, 
        Font = Enum.Font.SourceSans, 
        TextScaled = true, 
        BackgroundTransparency = 1, 
        TextWrapped = true, 
        Size = UDim2.new(1, -10, 1, -45)
    });
    local v9 = v7:Add("TextButton", {
        Text = "Yes", 
        Font = Enum.Font.Arial, 
        TextSize = 18, 
        AnchorPoint = Vector2.new(0, 1), 
        Size = UDim2.new(0.5, -7, 0, 30), 
        Position = UDim2.new(0, 5, 1, -5), 
        BackgroundColor3 = Color3.fromRGB(74, 195, 56), 
        BackgroundTransparency = 0.5
    });
    local v10 = v7:Add("TextButton", {
        Text = "No", 
        Font = Enum.Font.Arial, 
        TextSize = 18, 
        AnchorPoint = Vector2.new(0, 1), 
        Size = UDim2.new(0.5, -7, 0, 30), 
        Position = UDim2.new(0.5, 2, 1, -5), 
        BackgroundColor3 = Color3.fromRGB(206, 72, 45), 
        BackgroundTransparency = 0.5
    });
    v9.MouseButton1Down:Connect(function() --[[ Line: 56 ]]
        -- upvalues: v2 (copy), v6 (copy), v5 (ref), v7 (copy)
        if v2.Delay and os.clock() < v6 + v2.Delay then
            return;
        else
            v5 = "Yes";
            v7:Close();
            return;
        end;
    end);
    v10.MouseButton1Down:Connect(function() --[[ Line: 65 ]]
        -- upvalues: v5 (ref), v7 (copy)
        v5 = "No";
        v7:Close();
    end);
    v4 = v7.gTable;
    v7:Ready();
    if v2.Delay then
        v9.BackgroundColor3 = Color3.fromRGB(38, 100, 28);
        repeat
            v9.Text = string.format("%s", (math.ceil(v6 + v2.Delay - os.clock())));
            task.wait(1);
        until os.clock() > v6 + v2.Delay;
        v9.Text = "Yes";
        v9.BackgroundColor3 = Color3.fromRGB(74, 195, 56);
    end;
    repeat
        task.wait();
    until v5;
    return v5;
end;