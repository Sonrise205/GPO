repeat
    task.wait();
until game.Players.LocalPlayer;
local _ = game.Players.LocalPlayer;
game:GetService("TextChatService").MessageReceived:Connect(function(v1) --[[ Line: 7 ]]
    local l_TextSource_0 = v1.TextSource;
    local l_Text_0 = v1.Text;
    if l_TextSource_0 and l_TextSource_0.Name == game.Players.LocalPlayer.Name then
        if l_Text_0 == "/sounds" then
            print("PLAYING SOUNDS\n");
            local l_game_Descendants_0 = game:GetDescendants();
            for v5 = 1, #l_game_Descendants_0 do
                pcall(function() --[[ Line: 15 ]]
                    -- upvalues: l_game_Descendants_0 (copy), v5 (copy)
                    if l_game_Descendants_0[v5]:IsA("Sound") and l_game_Descendants_0[v5].IsPlaying == true then
                        print(l_game_Descendants_0[v5]:GetFullName() .. " is Playing! Looped: " .. tostring(l_game_Descendants_0[v5].Looped) .. " Length: " .. l_game_Descendants_0[v5].TimeLength);
                    end;
                end);
            end;
            return;
        elseif l_Text_0 == "/highlights" then
            print("all highlights");
            local l_game_Descendants_1 = game:GetDescendants();
            for v7 = 1, #l_game_Descendants_1 do
                pcall(function() --[[ Line: 25 ]]
                    -- upvalues: l_game_Descendants_1 (copy), v7 (copy)
                    if l_game_Descendants_1[v7]:IsA("Highlight") then
                        print(l_game_Descendants_1[v7]:GetFullName() .. " is a highlight!");
                    end;
                end);
            end;
        end;
    end;
end);