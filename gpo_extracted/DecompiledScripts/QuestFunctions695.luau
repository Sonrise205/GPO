return {
    QuestHandle = function(_, v1, v2, v3) --[[ Line: 3 ]] --[[ Name: QuestHandle ]]
        if v3 == nil then
            v3 = game.Players.LocalPlayer;
        end;
        local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. v3.Name);
        if l_FirstChild_0 == nil then
            return;
        else
            if v2 == "takequest" and l_FirstChild_0.Quest.CurrentQuest.Value == "None" then
                game.ReplicatedStorage.Events.Quest:InvokeServer({
                    "takequest", 
                    v1
                });
            end;
            return;
        end;
    end
};