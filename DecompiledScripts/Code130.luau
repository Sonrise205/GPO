client = nil;
Pcall = nil;
Routine = nil;
service = nil;
gTable = nil;
return function(_, v1) --[[ Line: 10 ]]
    if v1 then
        setfenv(1, v1);
    end;
    local l_TextLabel_0 = script.Parent.Parent.TextLabel;
    local _ = service.PlayerGui;
    l_TextLabel_0.Position = UDim2.new(0, 0, 0, -40);
    gTable:Ready();
end;