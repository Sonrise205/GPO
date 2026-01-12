client = nil;
Pcall = nil;
Routine = nil;
service = nil;
return function(v0) --[[ Line: 8 ]]
    local l_Parent_0 = script.Parent.Parent;
    local _ = service.PlayerGui;
    local l_Frame_0 = l_Parent_0.Frame;
    local l_Message_0 = l_Parent_0.Frame.Message;
    local l_Title_0 = l_Parent_0.Frame.Title;
    local _ = v0.gIndex;
    local _ = v0.gTable;
    local l_Title_1 = v0.Title;
    local l_Message_1 = v0.Message;
    local _ = v0.Scroll;
    local l_Time_0 = v0.Time;
    if not v0.Message or not v0.Title then
        l_Parent_0:Destroy();
    end;
    l_Title_0.Text = l_Title_1;
    l_Message_0.Text = l_Message_1;
    l_Title_0.TextTransparency = 1;
    l_Message_0.TextTransparency = 1;
    l_Title_0.TextStrokeTransparency = 1;
    l_Message_0.TextStrokeTransparency = 1;
    l_Frame_0.BackgroundTransparency = 1;
    l_Parent_0.Enabled = true;
    local function v13() --[[ Line: 46 ]] --[[ Name: fadeIn ]]
        -- upvalues: l_Parent_0 (copy), l_Message_0 (copy), l_Title_0 (copy), l_Frame_0 (copy)
        l_Parent_0.Parent = service.PlayerGui;
        for _ = 1, 10 do
            if l_Message_0.TextTransparency > 0.1 then
                l_Message_0.TextTransparency = l_Message_0.TextTransparency - 0.1;
                l_Title_0.TextTransparency = l_Title_0.TextTransparency - 0.1;
            end;
            if l_Message_0.TextStrokeTransparency > 0.5 then
                l_Message_0.TextStrokeTransparency = l_Message_0.TextStrokeTransparency - 0.1;
                l_Title_0.TextStrokeTransparency = l_Title_0.TextStrokeTransparency - 0.1;
            end;
            if l_Frame_0.BackgroundTransparency > 0.3 then
                l_Frame_0.BackgroundTransparency = l_Frame_0.BackgroundTransparency - 0.03;
            end;
            service.Wait("Stepped");
        end;
    end;
    local function v15() --[[ Line: 64 ]] --[[ Name: fadeOut ]]
        -- upvalues: l_Message_0 (copy), l_Title_0 (copy), l_Frame_0 (copy), l_Parent_0 (copy)
        for _ = 1, 10 do
            if l_Message_0.TextTransparency < 1 then
                l_Message_0.TextTransparency = l_Message_0.TextTransparency + 0.1;
                l_Title_0.TextTransparency = l_Title_0.TextTransparency + 0.1;
            end;
            if l_Message_0.TextStrokeTransparency < 1 then
                l_Message_0.TextStrokeTransparency = l_Message_0.TextStrokeTransparency + 0.1;
                l_Title_0.TextStrokeTransparency = l_Title_0.TextStrokeTransparency + 0.1;
            end;
            if l_Frame_0.BackgroundTransparency < 1 then
                l_Frame_0.BackgroundTransparency = l_Frame_0.BackgroundTransparency + 0.03;
            end;
            service.Wait("Stepped");
        end;
        l_Parent_0:Destroy();
    end;
    v13();
    wait(l_Time_0 or 5);
    v15();
end;