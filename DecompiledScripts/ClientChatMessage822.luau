local v0 = {};
local l_TextChatService_0 = game:GetService("TextChatService");
v0.start = function(_, v3) --[[ Line: 4 ]] --[[ Name: start ]]
    -- upvalues: l_TextChatService_0 (copy)
    if v3 == "hideChatUI" then
        game:GetService("TextChatService").ChatWindowConfiguration.Enabled = false;
        return;
    elseif v3 == "showChatUI" then
        game:GetService("TextChatService").ChatWindowConfiguration.Enabled = true;
        return;
    elseif typeof(v3) == "boolean" then
        return;
    else
        l_TextChatService_0.TextChannels.RBXSystem:DisplaySystemMessage(v3);
        return;
    end;
end;
return v0;