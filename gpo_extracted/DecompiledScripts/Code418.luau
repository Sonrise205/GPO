client = nil;
Pcall = nil;
Routine = nil;
service = nil;
gTable = nil;
return function(_) --[[ Line: 9 ]]
    local _ = service.PlayerGui;
    local _ = service.Players.LocalPlayer;
    local l_Parent_0 = script.Parent.Parent;
    local _ = l_Parent_0.Frame;
    local l_Ms_0 = l_Parent_0.Frame.Ms;
    local l_Close_0 = l_Parent_0.Frame.Close;
    local v7 = true;
    gTable:Ready();
    l_Ms_0.Text = "...";
    l_Close_0.MouseButton1Click:connect(function() --[[ Line: 21 ]]
        -- upvalues: l_Parent_0 (copy), v7 (ref)
        l_Parent_0:Destroy();
        v7 = false;
    end);
    repeat
        l_Ms_0.Text = ("%*ms"):format((client.Remote.Ping()));
        wait(2);
    until not v7 or not gTable.Active;
    if l_Parent_0 then
        l_Parent_0:Destroy();
    end;
end;