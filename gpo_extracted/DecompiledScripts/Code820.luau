client = nil;
Pcall = nil;
Routine = nil;
service = nil;
return function(v0, v1) --[[ Line: 8 ]]
    if v1 then
        setfenv(1, v1);
    end;
    local l_Parent_0 = script.Parent.Parent;
    local l_Frame_0 = l_Parent_0.Frame;
    local l_Frame_1 = l_Frame_0.Frame;
    local l_Message_0 = l_Frame_1.Message;
    local l_Title_0 = l_Frame_1.Title;
    local _ = v0.gIndex;
    local l_gTable_0 = v0.gTable;
    local l_Title_1 = v0.Title;
    local l_Message_1 = v0.Message;
    local _ = v0.Scroll;
    local l_Time_0 = v0.Time;
    local v13 = false;
    if not v0.Message or not v0.Title then
        l_gTable_0:Destroy();
    end;
    l_Title_0.Text = l_Title_1;
    l_Message_0.Text = l_Message_1;
    l_Title_0.TextTransparency = 1;
    l_Message_0.TextTransparency = 1;
    l_Title_0.TextStrokeTransparency = 1;
    l_Message_0.TextStrokeTransparency = 1;
    l_Frame_0.BackgroundTransparency = 1;
    local v14 = {
        Type = "Small Screen Message", 
        Title = l_Title_1, 
        Message = l_Message_1, 
        Icon = "rbxassetid://7501175708", 
        Time = os.date("%X"), 
        Function = nil
    };
    table.insert(client.Variables.CommunicationsHistory, v14);
    service.Events.CommsPanel:Fire(v14);
    local function v16() --[[ Line: 62 ]] --[[ Name: fadeIn ]]
        -- upvalues: l_gTable_0 (copy), l_Message_0 (copy), l_Title_0 (copy), l_Frame_0 (copy), l_Frame_1 (copy)
        l_gTable_0:Ready();
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
                l_Frame_1.BackgroundTransparency = l_Frame_0.BackgroundTransparency;
            end;
            service.Wait("Stepped");
        end;
    end;
    local function v18() --[[ Line: 81 ]] --[[ Name: fadeOut ]]
        -- upvalues: v13 (ref), l_Message_0 (copy), l_Title_0 (copy), l_Frame_0 (copy), l_Frame_1 (copy), l_Parent_0 (copy)
        if not v13 then
            v13 = true;
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
                    l_Frame_1.BackgroundTransparency = l_Frame_0.BackgroundTransparency;
                end;
                service.Wait("Stepped");
            end;
            service.UnWrap(l_Parent_0):Destroy();
        end;
    end;
    l_gTable_0.CustomDestroy = function() --[[ Line: 103 ]]
        -- upvalues: v18 (copy)
        v18();
    end;
    v16();
    if not l_Time_0 then
        local _, v20 = l_Message_1:gsub(" ", "");
        v20 = math.clamp(v20 / 2, 4, 11) + 1;
        wait(v20);
    else
        wait(l_Time_0);
    end;
    if not v13 then
        v18();
    end;
end;