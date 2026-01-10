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
    local v7 = nil;
    if client.UI.Get("HelpButton", v4, true) then
        v4:Destroy();
        v6:Destroy();
        return nil;
    else
        v7 = client.HelpButtonImage ~= "rbxassetid://357249130";
        v6.Name = "HelpButton";
        v6.CanKeepAlive = false;
        v5.Name = "Toggle";
        v5.BackgroundTransparency = 1;
        v5.Position = UDim2.new(1, -45, 1, -45);
        v5.Size = UDim2.new(0, 40, 0, 40);
        if v7 then
            v5.Image = client.HelpButtonImage;
        else
            v5.Image = "http://www.roblox.com/asset/?id=7059706594";
        end;
        v5.ImageTransparency = 0;
        v5.MouseButton1Down:Connect(function() --[[ Line: 51 ]]
            local v8 = client.UI.Get("UserPanel", nil, true);
            if v8 then
                v8.Object:Destroy();
                return;
            else
                client.UI.Make("UserPanel", {});
                return;
            end;
        end);
        v6:Ready();
        return;
    end;
end;