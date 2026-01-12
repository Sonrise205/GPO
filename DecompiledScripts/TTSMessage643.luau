local v0 = {};
local _ = game:GetService("TextChatService");
v0.start = function(_, v3) --[[ Line: 4 ]] --[[ Name: start ]]
    local l_CFrame_0 = v3.CFrame;
    local l_Text_0 = v3.Text;
    local l_VoiceId_0 = v3.VoiceId;
    local v7 = script.DialogueVolume:Clone();
    local l_v7_Children_0 = v7:GetChildren();
    table.insert(l_v7_Children_0, v7);
    local l_AudioTextToSpeech_0 = v7.AudioTextToSpeech;
    if l_CFrame_0 then
        v7.CFrame = l_CFrame_0;
    end;
    l_AudioTextToSpeech_0.Text = l_Text_0;
    l_AudioTextToSpeech_0.TimePosition = 0;
    l_AudioTextToSpeech_0.VoiceId = l_VoiceId_0 or 2;
    for v10, v11 in pairs(v3) do
        if v10 ~= "Parent" then
            pcall(function() --[[ Line: 26 ]]
                -- upvalues: l_AudioTextToSpeech_0 (copy), v10 (copy), v11 (copy)
                l_AudioTextToSpeech_0[v10] = v11;
            end);
        end;
    end;
    if v3.Parent then
        for v12 = 1, #l_v7_Children_0 do
            l_v7_Children_0[v12].Parent = v3.Parent;
        end;
    else
        v7.Parent = workspace.Effects;
    end;
    if l_AudioTextToSpeech_0.IsLoaded == false then
        repeat
            task.wait();
        until l_AudioTextToSpeech_0.IsLoaded == true;
    end;
    l_AudioTextToSpeech_0:Play();
    l_AudioTextToSpeech_0.Ended:Wait();
    _G.destroy(l_v7_Children_0, 6);
end;
return v0;