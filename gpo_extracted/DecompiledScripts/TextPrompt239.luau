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
    local v6 = client.UI.Make("Window", {
        Name = v2.Name or "Prompt", 
        Title = v2.Title or "Prompt", 
        Size = v2.Size or {
            225, 
            150
        }, 
        SizeLocked = true, 
        OnClose = function() --[[ Line: 16 ]] --[[ Name: OnClose ]]
            -- upvalues: v5 (ref), v2 (copy)
            if not v5 then
                v5 = v2.DefaultAnswer or "";
            end;
        end
    });
    local _ = v6:Add("TextLabel", {
        Text = v2.Question, 
        Font = "SourceSans", 
        TextScaled = true, 
        BackgroundTransparency = 1, 
        TextWrapped = true, 
        Size = UDim2.new(1, -10, 1, -35)
    });
    local v8 = v6:Add("TextBox", {
        Text = "", 
        TextSize = 18, 
        PlaceholderText = v2.PlaceholderText or "", 
        ClearTextOnFocus = v2.ClearTextOnFocus or false, 
        Size = UDim2.new(1, -40, 0, 25), 
        Position = UDim2.new(0, 5, 1, -30)
    });
    v8.FocusLost:Connect(function(v9) --[[ Line: 40 ]]
        -- upvalues: v5 (ref), v8 (copy), v6 (copy)
        if v9 then
            v5 = v8.Text;
            v6:Close();
        end;
    end);
    local _ = v6:Add("TextButton", {
        Text = ">", 
        Font = "Arial", 
        TextSize = 22, 
        Size = UDim2.new(0, 25, 0, 25), 
        Position = UDim2.new(1, -30, 1, -30), 
        OnClick = function() --[[ Line: 53 ]] --[[ Name: OnClick ]]
            -- upvalues: v5 (ref), v8 (copy), v6 (copy)
            v5 = v8.Text;
            v6:Close();
        end
    });
    v4 = v6.gTable;
    v6:Ready();
    repeat
        task.wait();
    until v5;
    return v5;
end;