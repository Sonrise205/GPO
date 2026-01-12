return {
    GetCrewFromPlayer = function(v0) --[[ Line: 3 ]] --[[ Name: GetCrewFromPlayer ]]
        local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. v0.Name);
        if l_FirstChild_0 then
            return l_FirstChild_0.Stats.Crew.Value;
        else
            return "????";
        end;
    end, 
    GetCrewLogo = function(v2) --[[ Line: 12 ]] --[[ Name: GetCrewLogo ]]
        local _ = {
            ["Baroque Works"] = "rbxassetid://9836076474", 
            ["Neo-Marines"] = "rbxassetid://4581111355", 
            Pirates = "rbxassetid://11005456122", 
            Marines = "rbxassetid://3372534036", 
            Germa = "rbxassetid://12545310473"
        };
        if game["Run Service"]:IsServer() == true then
            return "rbxthumb://type=Asset&w=420&h=420&id=" .. _G.CrewsService:GetCrewImage(v2);
        else
            return "rbxthumb://type=Asset&w=420&h=420&id=" .. game.ReplicatedStorage.CrewRemote:InvokeServer({
                Method = "GetImage", 
                CrewName = v2
            });
        end;
    end
};