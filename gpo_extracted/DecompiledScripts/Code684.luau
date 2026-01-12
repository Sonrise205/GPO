client = nil;
Pcall = nil;
Routine = nil;
service = nil;
gTable = nil;
return function(v0, v1) --[[ Line: 9 ]]
    if v1 then
        setfenv(1, v1);
    end;
    local v2 = client.UI.Prepare(script.Parent.Parent);
    local l_Frame_0 = v2.Frame;
    local l_Frame_1 = l_Frame_0.Frame;
    local l_Message_0 = l_Frame_1.Message;
    local l_Title_0 = l_Frame_1.Title;
    local _ = v0.gIndex;
    local l_gTable_0 = v0.gTable;
    local l_Title_1 = v0.Title;
    local l_Message_1 = v0.Message;
    local _ = v0.Scroll;
    local l_Time_0 = v0.Time;
    if not v0.Message or not v0.Title then
        l_gTable_0:Destroy();
    end;
    l_Title_0.Text = l_Title_1;
    l_Message_0.Text = l_Message_1;
    local function v14() --[[ Line: 33 ]] --[[ Name: fadeOut ]]
        -- upvalues: l_Message_0 (copy), l_Title_0 (copy), l_Frame_1 (copy), v2 (copy)
        for _ = 1, 12 do
            l_Message_0.TextTransparency = l_Message_0.TextTransparency + 0.05;
            l_Title_0.TextTransparency = l_Title_0.TextTransparency + 0.05;
            l_Message_0.TextStrokeTransparency = l_Message_0.TextStrokeTransparency + 0.05;
            l_Title_0.TextStrokeTransparency = l_Title_0.TextStrokeTransparency + 0.05;
            l_Frame_1.BackgroundTransparency = l_Frame_1.BackgroundTransparency + 0.05;
            service.Wait("Stepped");
        end;
        service.UnWrap(v2):Destroy();
    end;
    l_gTable_0.CustomDestroy = function() --[[ Line: 45 ]]
        -- upvalues: v14 (copy)
        v14();
    end;
    local v15 = {
        Type = "Small Screen Message", 
        Title = l_Title_1, 
        Message = l_Message_1, 
        Icon = "rbxassetid://7501175708", 
        Time = os.date("%X"), 
        Function = nil
    };
    table.insert(client.Variables.CommunicationsHistory, v15);
    service.Events.CommsPanel:Fire(v15);
    task.spawn(function() --[[ Line: 61 ]]
        local v16 = Instance.new("Sound", service.LocalContainer());
        v16.SoundId = "rbxassetid://7152561753";
        v16.Volume = 0.3;
        task.wait(0.1);
        v16:Play();
        task.wait(1);
        v16:Destroy();
    end);
    l_gTable_0.Ready();
    l_Frame_0:TweenSize(UDim2.new(0, 350, 0, 150), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, 0.2);
    if not l_Time_0 then
        local _, v18 = l_Message_1:gsub(" ", "");
        v18 = math.clamp(v18 / 2, 4, 11) + 1;
        task.wait(v18);
    else
        task.wait(l_Time_0);
    end;
    v14();
end;