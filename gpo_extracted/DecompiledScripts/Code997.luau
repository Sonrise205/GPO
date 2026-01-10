client = nil;
Pcall = nil;
Routine = nil;
service = nil;
return function(v0, v1) --[[ Line: 8 ]]
    if v1 then
        setfenv(1, v1);
    end;
    local v2 = client.UI.Prepare(script.Parent.Parent);
    local _ = service.PlayerGui;
    local l_Frame_0 = v2.Frame;
    local l_Message_0 = v2.Frame.Message;
    local l_Title_0 = v2.Frame.Title;
    local _ = v0.gIndex;
    local l_gTable_0 = v0.gTable;
    local l_Title_1 = v0.Title;
    local l_Message_1 = v0.Message;
    local _ = v0.Scroll;
    local l_Time_0 = v0.Time;
    if not v0.Message or not v0.Title then
        v2:Destroy();
    end;
    l_Title_0.Text = l_Title_1;
    l_Message_0.Text = l_Message_1;
    l_Title_0.TextTransparency = 1;
    l_Message_0.TextTransparency = 1;
    l_Title_0.TextStrokeTransparency = 1;
    l_Message_0.TextStrokeTransparency = 1;
    l_Frame_0.BackgroundTransparency = 1;
    local v13 = {
        Type = "Full Screen Message", 
        Title = l_Title_1, 
        Message = l_Message_1, 
        Icon = "rbxassetid://7501175708", 
        Time = os.date("%X"), 
        Function = nil
    };
    table.insert(client.Variables.CommunicationsHistory, v13);
    service.Events.CommsPanel:Fire(v13);
    local v14 = service.New("BlurEffect");
    v14.Enabled = false;
    v14.Size = 0;
    v14.Parent = workspace.CurrentCamera;
    local v15 = false;
    local function v17() --[[ Line: 67 ]] --[[ Name: fadeIn ]]
        -- upvalues: v15 (ref), v14 (copy), l_gTable_0 (copy), l_Message_0 (copy), l_Title_0 (copy), l_Frame_0 (copy)
        if not v15 then
            v14.Enabled = true;
            l_gTable_0:Ready();
            for _ = 1, 10 do
                if v14.Size < 10 then
                    v14.Size = v14.Size + 1;
                end;
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
                wait(0.016666666666666666);
            end;
        end;
    end;
    local function v19() --[[ Line: 92 ]] --[[ Name: fadeOut ]]
        -- upvalues: v15 (ref), v14 (copy), l_Message_0 (copy), l_Title_0 (copy), l_Frame_0 (copy), v2 (copy)
        if not v15 then
            for _ = 1, 10 do
                if v14.Size > 0 then
                    v14.Size = v14.Size - 1;
                end;
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
                wait(0.016666666666666666);
            end;
            v14.Enabled = false;
            v14:Destroy();
            service.UnWrap(v2):Destroy();
            v15 = true;
        end;
    end;
    l_gTable_0.CustomDestroy = function() --[[ Line: 118 ]]
        -- upvalues: v15 (ref), v19 (copy), v2 (copy), v14 (copy)
        if not v15 then
            v15 = true;
            pcall(v19);
        end;
        pcall(function() --[[ Line: 124 ]]
            -- upvalues: v2 (ref)
            service.UnWrap(v2):Destroy();
        end);
        pcall(function() --[[ Line: 125 ]]
            -- upvalues: v14 (ref)
            v14:Destroy();
        end);
    end;
    v17();
    wait(l_Time_0 or 5);
    if not v15 then
        v19();
    end;
end;