client = nil;
Pcall = nil;
Routine = nil;
service = nil;
return function(_, v1) --[[ Line: 8 ]]
    if v1 then
        setfenv(1, v1);
    end;
    local l_PlayerGui_0 = service.PlayerGui;
    local _ = service.Player;
    local l_Toggle_0 = script.Parent.Parent.Toggle;
    if client.UI.Get("Chat") then
        l_Toggle_0.Position = UDim2.new(1, -85, 1, -45);
    end;
    l_Toggle_0.MouseButton1Down:Connect(function() --[[ Line: 21 ]]
        local v5 = client.UI.Get("UserPanel", nil, true);
        if v5 then
            v5.Object:Destroy();
            return;
        else
            client.UI.Make("UserPanel", {});
            return;
        end;
    end);
    script.Parent.Parent.Parent = l_PlayerGui_0;
end;