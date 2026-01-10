client = nil;
service = nil;
return function(v0, v1) --[[ Line: 5 ]]
    if v1 then
        setfenv(1, v1);
    end;
    local v2 = nil;
    local l_Time_0 = v0.Time;
    local v4 = nil;
    local v5 = false;
    local v6 = service.New("Sound");
    v6.Volume = 0.25;
    v6.Looped = false;
    v6.SoundId = "http://www.roblox.com/asset/?id=151715959";
    local v7 = service.New("Sound");
    v7.Volume = 0.25;
    v7.Looped = false;
    v7.SoundId = "http://www.roblox.com/asset/?id=267883066";
    local l_TextSize_0 = service.TextService:GetTextSize(l_Time_0, 100, Enum.Font.SourceSans, Vector2.new(math.huge, math.huge));
    if l_TextSize_0.X < 150 then
        l_TextSize_0 = Vector2.new(175, l_TextSize_0.Y);
    end;
    local v9 = client.UI.Make("Window", {
        Name = "Countdown", 
        Title = "Countdown", 
        Size = {
            l_TextSize_0.X + 20, 
            l_TextSize_0.Y + 20
        }, 
        Position = UDim2.new(0, 10, 1, -(l_TextSize_0.Y + 30)), 
        OnClose = function() --[[ Line: 33 ]] --[[ Name: OnClose ]]
            -- upvalues: v6 (copy), v7 (copy)
            v6:Stop();
            v7:Stop();
            v6:Destroy();
            v7:Destroy();
        end
    });
    local v10 = v9:Add("TextLabel", {
        Text = l_Time_0, 
        BackgroundTransparency = 1, 
        TextScaled = true
    });
    v4 = v9:AddTitleButton({
        Text = "", 
        OnClick = function() --[[ Line: 49 ]] --[[ Name: OnClick ]]
            -- upvalues: v5 (ref), v6 (copy), v7 (copy), v4 (ref)
            if v5 then
                v6.Volume = 0.25;
                v7.Volume = 0.25;
                v4.Image = "rbxassetid://7463478056";
                v5 = false;
                return;
            else
                v6.Volume = 0;
                v7.Volume = 0;
                v4.Image = "rbxassetid://7463462018";
                v5 = true;
                return;
            end;
        end
    }):Add("ImageLabel", {
        Size = UDim2.new(1, 0, 0.85, 0), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        ScaleType = Enum.ScaleType.Fit, 
        Position = UDim2.new(0.5, 0, 0.536, 0), 
        Image = "rbxassetid://7463478056", 
        BackgroundTransparency = 1
    });
    v6.Parent = v10;
    v7.Parent = v10;
    v2 = v9.gTable;
    v2:Ready();
    local v11 = os.clock();
    local v12 = 0;
    local v13 = 0;
    for v14 = l_Time_0, 1, -1 do
        if v2.Active then
            v6:Play();
            v10.Text = v14;
            wait(1 - v13);
            v12 = v12 + 1;
            v13 = os.clock() - v11 - v12;
        else
            break;
        end;
    end;
    v10.Text = "0";
    v7:Play();
    for _ = 0, 3 do
        v7:Play();
        for v16 = 1, 0, -0.1 do
            v10.TextTransparency = v16;
            wait(0.05);
        end;
        for v17 = 0, 1, 0.1 do
            v10.TextTransparency = v17;
            wait(0.05);
        end;
    end;
    v9:Close();
end;