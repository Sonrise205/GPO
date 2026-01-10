client = nil;
Pcall = nil;
Routine = nil;
service = nil;
gTable = nil;
return function(_, v1) --[[ Line: 15 ]]
    if v1 then
        setfenv(1, v1);
    end;
    local _ = service.PlayerGui;
    local l_LocalPlayer_0 = service.Players.LocalPlayer;
    local v4 = service.New("ScreenGui");
    local v5 = service.New("ImageButton", v4);
    local v6 = service.New("Frame", v4);
    local l_UICorner_0 = Instance.new("UICorner");
    l_UICorner_0.CornerRadius = UDim.new(0, 6);
    l_UICorner_0.Parent = v6;
    local l_UICorner_1 = Instance.new("UICorner");
    l_UICorner_1.CornerRadius = UDim.new(0, 6);
    l_UICorner_1.Parent = v5;
    local v9 = nil;
    local v10 = client.UI.Register(v4);
    if client.UI.Get("HelpButton", v4, true) then
        v4:Destroy();
        v10:Destroy();
        return nil;
    else
        v9 = client.HelpButtonImage ~= "rbxassetid://357249130";
        v10.Name = "HelpButton";
        v10.CanKeepAlive = false;
        v5.Name = "Toggle";
        v6.Name = "RoundFrame";
        v6.BackgroundColor3 = Color3.fromRGB(17, 17, 17);
        v5.BackgroundTransparency = 1;
        v6.Position = UDim2.new(1, -45, 1, -45);
        v5.Position = UDim2.new(1, -42, 1, -38);
        v5.Size = UDim2.new(0, 33, 0, 33);
        v5.ZIndex = 67;
        v6.Size = UDim2.new(0, 40, 0, 40);
        if v9 then
            v5.Image = client.HelpButtonImage;
        else
            v5.Image = ("https://www.roblox.com/headshot-thumbnail/image?userId=%*&width=420&height=420&format=png"):format(l_LocalPlayer_0.UserId);
        end;
        v5.ImageTransparency = 0;
        v5.MouseButton1Down:Connect(function() --[[ Line: 74 ]]
            local v11 = client.UI.Get("UserPanel", nil, true);
            if v11 then
                v11.Object:Destroy();
                return;
            else
                client.UI.Make("UserPanel", {});
                return;
            end;
        end);
        v10:Ready();
        return;
    end;
end;