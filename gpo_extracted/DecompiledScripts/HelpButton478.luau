client = nil;
Pcall = nil;
Routine = nil;
service = nil;
gTable = nil;
return function(_, v1) --[[ Line: 9 ]]
    if v1 then
        setfenv(1, v1);
    end;
    local l_UI_0 = client.UI;
    local v3 = service.New("ScreenGui", {
        ResetOnSpawn = false
    });
    local v4 = l_UI_0.Register(v3);
    if l_UI_0.Get("HelpButton", v3, true) then
        v3:Destroy();
        v4:Destroy();
        return nil;
    else
        v4.Name = "HelpButton";
        v4.CanKeepAlive = true;
        service.New("ImageButton", {
            Parent = v3, 
            Name = "Toggle", 
            BackgroundTransparency = 1, 
            Position = UDim2.new(1, -45, 1, -45), 
            Size = UDim2.fromOffset(40, 40), 
            Image = client.HelpButtonImage, 
            ImageTransparency = 0.5
        }).MouseButton1Down:Connect(function() --[[ Line: 42 ]]
            -- upvalues: l_UI_0 (copy)
            local v5 = l_UI_0.Get("UserPanel", nil, true);
            if v5 then
                v5.Object:Destroy();
                return;
            else
                l_UI_0.Make("UserPanel");
                return;
            end;
        end);
        v4:Ready();
        return;
    end;
end;