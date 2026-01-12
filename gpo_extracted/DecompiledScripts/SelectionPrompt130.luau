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
    local v6 = false;
    local l_Options_0 = v2.Options;
    local l_Name_0 = v2.Name;
    local v9 = client.UI.Make("Window", {
        Name = l_Name_0 or "SelectionPrompt", 
        Title = l_Name_0 or "Selection Prompt", 
        Icon = client.MatIcons["Format list bulleted"], 
        Size = {
            225, 
            150
        }, 
        SizeLocked = true, 
        OnClose = function() --[[ Line: 21 ]] --[[ Name: OnClose ]]
            -- upvalues: v5 (ref), v6 (ref)
            if not v5 then
                v5 = nil;
            end;
            v6 = true;
        end
    });
    local v10 = v9:Add("ScrollingFrame", {
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundTransparency = 1
    });
    local v11 = service.New("UIListLayout", {
        Parent = v10, 
        FillDirection = "Vertical", 
        HorizontalAlignment = "Center", 
        VerticalAlignment = "Top"
    });
    for _, v13 in l_Options_0 do
        v10:Add("TextButton", {
            Text = v13.Text, 
            Size = UDim2.new(1, 0, 0, 30), 
            OnClick = function() --[[ Line: 48 ]] --[[ Name: OnClick ]]
                -- upvalues: v5 (ref), v13 (copy), v6 (ref), v9 (copy)
                v5 = v13.Data;
                v6 = true;
                v9:Destroy();
            end
        });
    end;
    v10.CanvasSize = UDim2.new(0, 0, 0, v11.AbsoluteContentSize.Y);
    v10.CanvasPosition = Vector2.new(0, v11.AbsoluteContentSize.Y);
    v4 = v9.gTable;
    v9:Ready();
    repeat
        wait();
    until v6 == true;
    return v5;
end;