client = nil;
Pcall = nil;
Routine = nil;
service = nil;
gTable = nil;
return function(v0) --[[ Line: 10 ]]
    local v1 = client.UI.Prepare(script.Parent.Parent);
    local _ = service.PlayerGui;
    local _ = v1.Drag.Frame;
    local l_Close_0 = v1.Drag.Frame.Close;
    local _ = v1.Drag.Frame.Main;
    local l_Question_0 = v1.Drag.Frame.Main.Question;
    local l_Answers_0 = v1.Drag.Frame.Main.Answers;
    local l_Entry_0 = v1.Entry;
    local l_Question_1 = v0.Question;
    local l_Answers_1 = v0.Answers;
    local v11 = nil;
    l_Question_0.Text = l_Question_1;
    l_Close_0.MouseButton1Click:connect(function() --[[ Line: 28 ]]
        -- upvalues: v1 (copy), v11 (ref)
        v1:Destroy();
        v11 = false;
    end);
    local v12 = 0;
    for _, v14 in pairs(l_Answers_1) do
        local v15 = l_Entry_0:clone();
        v15.Parent = l_Answers_0;
        v15.Text = v14;
        v15.Position = UDim2.new(0, 0, 0, v12 * 20);
        v15.Visible = true;
        v15.MouseButton1Click:connect(function() --[[ Line: 40 ]]
            -- upvalues: v1 (copy), v11 (ref), v14 (copy)
            v1:Destroy();
            v11 = v14;
        end);
        v12 = v12 + 1;
    end;
    gTable:Ready();
    local v16 = 0;
    repeat
        wait(0.1);
        v16 = v16 + 0.1;
    until v16 > 60 or v11 ~= nil;
    if v1 and v1.Parent then
        v1:Destroy();
    end;
    return v11;
end;