client = nil;
service = nil;
return function(v0, v1) --[[ Line: 4 ]]
    if v1 then
        setfenv(1, v1);
    end;
    local v2 = nil;
    local v3 = false;
    local v4 = service.New("Sound");
    v4.Volume = 1;
    v4.Looped = true;
    v4.SoundId = "http://www.roblox.com/asset/?id=138081509";
    local v5 = client.UI.Make("Window", {
        Name = "Alert", 
        Title = "Alert", 
        Size = {
            300, 
            150
        }, 
        Icon = client.MatIcons.Alert, 
        AllowMultiple = false, 
        OnClose = function() --[[ Line: 24 ]] --[[ Name: OnClose ]]
            -- upvalues: v4 (copy)
            v4:Stop();
            wait();
            v4:Destroy();
        end
    });
    if v5 then
        local v6 = v5:Add("TextLabel", {
            Text = v0.Message, 
            BackgroundTransparency = 1, 
            TextScaled = true, 
            TextWrapped = true
        });
        local v7 = v5:AddTitleButton({
            Text = ""
        });
        local v8 = v7:Add("ImageLabel", {
            Size = UDim2.new(0, 20, 0, 20), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            ScaleType = Enum.ScaleType.Fit, 
            Position = UDim2.new(0.5, 0, 0.536, 0), 
            Image = "rbxassetid://7463478056", 
            BackgroundTransparency = 1
        });
        v7.MouseButton1Down:Connect(function() --[[ Line: 52 ]]
            -- upvalues: v3 (ref), v4 (copy), v8 (copy)
            if v3 then
                v4.Volume = 1;
                v8.Image = "rbxassetid://7463478056";
                v3 = false;
                return;
            else
                v4.Volume = 0;
                v8.Image = "rbxassetid://7463462018";
                v3 = true;
                return;
            end;
        end);
        v4.Parent = v6;
        v4:Play();
        v2 = v5.gTable;
        v5:Ready();
    end;
end;