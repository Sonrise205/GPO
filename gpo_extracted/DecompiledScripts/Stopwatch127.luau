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
    local v6 = false;
    local v7 = service.New("Sound", {
        Volume = 0.25, 
        Looped = false, 
        SoundId = "rbxassetid://151715959"
    });
    local l_TextSize_0 = service.TextService:GetTextSize(0, 100, Enum.Font.SourceSans, Vector2.new(math.huge, math.huge));
    if l_TextSize_0.X < 150 then
        l_TextSize_0 = Vector2.new(175, l_TextSize_0.Y);
    end;
    local v9 = client.UI.Make("Window", {
        Name = "Stopwatch", 
        Title = "Stopwatch", 
        Icon = client.MatIcons["Hourglass full"], 
        Size = {
            l_TextSize_0.X + 40, 
            l_TextSize_0.Y + 20
        }, 
        Position = UDim2.new(0, 10, 1, -(l_TextSize_0.Y + 30)), 
        OnClose = function() --[[ Line: 27 ]] --[[ Name: OnClose ]]
            -- upvalues: v7 (copy)
            v7:Stop();
            v7:Destroy();
        end
    });
    local v10 = v9:Add("TextLabel", {
        Text = 0, 
        BackgroundTransparency = 1, 
        TextScaled = true
    });
    v5 = v9:AddTitleButton({
        Text = "", 
        OnClick = function() --[[ Line: 41 ]] --[[ Name: OnClick ]]
            -- upvalues: v6 (ref), v7 (copy), v5 (ref)
            if v6 then
                v7.Volume = 0.25;
                v5.Image = "rbxassetid://1638551696";
                v6 = false;
                return;
            else
                v7.Volume = 0;
                v5.Image = "rbxassetid://1638584675";
                v6 = true;
                return;
            end;
        end
    }):Add("ImageLabel", {
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        ScaleType = Enum.ScaleType.Fit, 
        Image = "rbxassetid://1638551696", 
        BackgroundTransparency = 1
    });
    v7.Parent = v10;
    v4 = v9.gTable;
    v4:Ready();
    local v11 = 0;
    while task.wait(1) and v4.Active do
        v7:Play();
        v11 = v11 + 1;
        v10.Text = v11;
    end;
end;