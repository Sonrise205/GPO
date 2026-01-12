client = nil;
Pcall = nil;
Routine = nil;
service = nil;
return function(v0) --[[ Line: 8 ]]
    local l_Parent_0 = script.Parent.Parent;
    local l_Ok_0 = l_Parent_0.Frame.Main.Ok;
    local l_Question_0 = l_Parent_0.Frame.Main.Question;
    local l_gTable_0 = v0.gTable;
    l_Question_0.Text = v0.Message;
    l_gTable_0:Ready();
    local v5 = Instance.new("Sound", l_Question_0);
    v5.Volume = 1;
    v5.Looped = true;
    v5.SoundId = "http://www.roblox.com/asset/?id=138081509";
    v5:Play();
    l_Ok_0.MouseButton1Click:connect(function() --[[ Line: 24 ]]
        -- upvalues: l_Parent_0 (copy), v5 (copy)
        l_Parent_0:Destroy();
        v5:Stop();
    end);
end;