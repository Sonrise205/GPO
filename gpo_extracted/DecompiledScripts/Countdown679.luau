local v0 = nil;
local v1 = nil;
client = v0;
service = v1;
return function(v2, v3) --[[ Line: 3 ]]
    if v3 then
        setfenv(1, v3);
    end;
    local v4 = nil;
    local l_Time_0 = v2.Time;
    local v6 = nil;
    local v7 = false;
    local v8 = service.New("Sound", {
        Volume = 0.25, 
        Looped = false, 
        SoundId = "rbxassetid://151715959"
    });
    local v9 = service.New("Sound", {
        Volume = 0.25, 
        Looped = false, 
        SoundId = "rbxassetid://267883066"
    });
    local l_TextSize_0 = service.TextService:GetTextSize(l_Time_0, 100, Enum.Font.SourceSans, Vector2.new(math.huge, math.huge));
    if l_TextSize_0.X < 150 then
        l_TextSize_0 = Vector2.new(175, l_TextSize_0.Y);
    end;
    local v11 = client.UI.Make("Window", {
        Name = "Countdown", 
        Title = "Countdown", 
        Icon = client.MatIcons["Hourglass full"], 
        Size = {
            l_TextSize_0.X + 40, 
            l_TextSize_0.Y + 20
        }, 
        Position = UDim2.new(0, 10, 1, -(l_TextSize_0.Y + 30)), 
        OnClose = function() --[[ Line: 30 ]] --[[ Name: OnClose ]]
            -- upvalues: v8 (copy), v9 (copy)
            v8:Stop();
            v9:Stop();
            v8:Destroy();
            v9:Destroy();
        end
    });
    local v12 = v11:Add("TextLabel", {
        Text = l_Time_0, 
        BackgroundTransparency = 1, 
        TextScaled = true
    });
    local v13 = v11:Add("TextLabel", {
        Text = "0", 
        TextXAlignment = Enum.TextXAlignment.Right, 
        BackgroundTransparency = 1, 
        Size = UDim2.fromOffset(25, 25), 
        Position = UDim2.new(1, -30, 1, -25)
    });
    v6 = v11:AddTitleButton({
        Text = "", 
        OnClick = function() --[[ Line: 54 ]] --[[ Name: OnClick ]]
            -- upvalues: v7 (ref), v8 (copy), v9 (copy), v6 (ref)
            if v7 then
                v8.Volume = 0.25;
                v9.Volume = 0.25;
                v6.Image = "rbxassetid://1638551696";
                v7 = false;
                return;
            else
                v8.Volume = 0;
                v9.Volume = 0;
                v6.Image = "rbxassetid://1638584675";
                v7 = true;
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
    v8.Parent = v12;
    v9.Parent = v12;
    v4 = v11.gTable;
    v4:Ready();
    local v14 = os.clock();
    local v15 = 0;
    local v16 = 0;
    for v17 = l_Time_0, 1, -1 do
        if v4.Active then
            v8:Play();
            v12.Text = v17;
            v13.Text = l_Time_0 - v17;
            task.wait(1 - v16);
            v15 = v15 + 1;
            v16 = os.clock() - v14 - v15;
        else
            break;
        end;
    end;
    v12.Text = "0";
    v13.Text = l_Time_0;
    v9:Play();
    for _ = 0, 3 do
        v9:Play();
        for v19 = 1, 0, -0.1 do
            v12.TextTransparency = v19;
            task.wait(0.05);
        end;
        for v20 = 0, 1, 0.1 do
            v12.TextTransparency = v20;
            task.wait(0.05);
        end;
    end;
    v11:Close();
end;