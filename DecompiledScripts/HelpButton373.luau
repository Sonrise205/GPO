client = nil;
Pcall = nil;
Routine = nil;
service = nil;
gTable = nil;
return function(_, v1) --[[ Line: 9 ]]
    if v1 then
        setfenv(1, v1);
    end;
    local _ = service.PlayerGui;
    local _ = service.Players.LocalPlayer;
    local v4 = service.New("ScreenGui");
    local v5 = service.New("ImageButton", v4);
    local v6 = client.UI.Register(v4);
    local v7 = service.New("Sound");
    v7.Parent = v5;
    v7.Volume = 0.25;
    v7.SoundId = "rbxassetid://156286438";
    if client.UI.Get("HelpButton", v4, true) then
        v4:Destroy();
        v6:Destroy();
        return nil;
    else
        v6.Name = "HelpButton";
        v6.CanKeepAlive = false;
        v5.Name = "Toggle";
        v5.BackgroundTransparency = 1;
        v5.Position = UDim2.new(1, -45, 1, -45);
        v5.Size = UDim2.new(0, 40, 0, 40);
        v5.Image = client.HelpButtonImage;
        v5.ImageTransparency = 0.35;
        v5.Modal = client.Variables.ModalMode;
        v5.ClipsDescendants = true;
        v5.MouseButton1Down:Connect(function() --[[ Line: 47 ]]
            -- upvalues: v5 (copy), v7 (copy)
            task.spawn(function() --[[ Line: 48 ]]
                -- upvalues: v5 (ref)
                local l_ImageLabel_0 = Instance.new("ImageLabel");
                l_ImageLabel_0.Parent = v5;
                l_ImageLabel_0.AnchorPoint = Vector2.new(0.5, 0.5);
                l_ImageLabel_0.BorderSizePixel = 0;
                l_ImageLabel_0.ZIndex = v5.ZIndex + 1;
                l_ImageLabel_0.BackgroundTransparency = 1;
                l_ImageLabel_0.ImageTransparency = 0.8;
                l_ImageLabel_0.Image = "rbxasset://textures/whiteCircle.png";
                l_ImageLabel_0.Position = UDim2.new(0.5, 0, 0.5, 0);
                l_ImageLabel_0:TweenSize(UDim2.new(0, v5.AbsoluteSize.X * 2.5, 0, v5.AbsoluteSize.X * 2.5), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.2);
                task.wait(0.2);
                l_ImageLabel_0:Destroy();
            end);
            local v9 = client.UI.Get("UserPanel", nil, true);
            if v9 then
                v9.Object:Destroy();
                return;
            else
                v7:Play();
                client.UI.Make("UserPanel", {});
                return;
            end;
        end);
        v6:Ready();
        return;
    end;
end;