local v0 = {
    islands = {
        ["Town of Beginnings"] = 0, 
        ["Shell's Town"] = 1000, 
        ["Island Of Zou"] = 1750, 
        ["Orange Town"] = 2000, 
        ["Kori Island"] = 4000, 
        ["Restaurant Baratie"] = 1250, 
        ["Roca Island"] = 2000, 
        ["Marine Fort F-1"] = 500, 
        Colosseum = 500, 
        Sandora = 500, 
        ["Shark Park"] = 1000, 
        ["Sphinx Island"] = 1200, 
        ["Land of the Sky"] = 2000, 
        ["Gravito's Fort"] = 2200, 
        ["Traders Lounge"] = 1000, 
        ["Fishman Cave"] = 3000, 
        ["Valentine Island"] = 2000, 
        ["Coco Island"] = 2000, 
        ["Marine Base G-1"] = 3000, 
        ["Elo's Island"] = 3000, 
        ["Reverse Mountain"] = 3000, 
        ["Desert Kingdom"] = 5000, 
        ["Colosseum of Arc"] = 3000, 
        Transylvania = 3000, 
        ["Winter Wonderland"] = 3000, 
        ["Thriller Bark"] = 5000, 
        ["Foro Island"] = 5000, 
        ["Dokkan Island"] = 5000, 
        ["Rose Kingdom"] = 5000, 
        ["Impel Base"] = 5000, 
        ["Sett's Arena"] = 5000, 
        ["Logue Town"] = 2000, 
        Spooksville = 0, 
        ["Sakura Stronghold"] = 2000, 
        ["Umi Island"] = 2000, 
        ["Turtleback Cave"] = 2000, 
        ["Blo's Island"] = 2000, 
        ["Whole Cake Island"] = 2000
    }
};
local function v5(v1) --[[ Line: 45 ]] --[[ Name: getIsland ]]
    local v2 = nil;
    local l_Children_0 = workspace.Islands:GetChildren();
    for v4 = 1, #l_Children_0 do
        if v1:IsDescendantOf(l_Children_0[v4]) then
            return l_Children_0[v4];
        end;
    end;
    return v2;
end;
local function v9(v6) --[[ Line: 57 ]] --[[ Name: findIsland ]]
    -- upvalues: v5 (copy)
    local v7 = Ray.new(v6.HumanoidRootPart.Position, v6.HumanoidRootPart.CFrame.upVector * -1000);
    local v8 = _G.raycastWhitelist(v7, {
        workspace.Islands
    });
    return (v5(v8));
end;
v0.check = function(_, v11) --[[ Line: 64 ]] --[[ Name: check ]]
    -- upvalues: v9 (copy), v0 (copy)
    local l_LocalPlayer_0 = game.Players.LocalPlayer;
    local _ = l_LocalPlayer_0.Character;
    local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
    local v15 = v9(v11);
    local v16 = v0.islands[v15.Name];
    if v16 == nil then
        return;
    elseif l_FirstChild_0.Stats.Peli.Value < v16 and _G.HasItem(l_LocalPlayer_0, v15.Name .. " Eternal Pose") == false then
        return {
            {
                talkname = "nomoney", 
                talknumber = 2, 
                talkend = 2
            }
        };
    elseif _G.HasItem(l_LocalPlayer_0, v15.Name .. " Eternal Pose") == true then
        return {
            {
                talkname = "haveitem", 
                talknumber = 2, 
                talkend = 2
            }
        };
    else
        return nil;
    end;
end;
v0.adjust = function(_, v18) --[[ Line: 83 ]] --[[ Name: adjust ]]
    -- upvalues: v9 (copy), v0 (copy)
    local v19 = v9(v18);
    local v20 = v0.islands[v19.Name];
    return {
        {
            talkname = "Talk1", 
            new = "I travel form island to island selling <Color=Blue>Eternal Poses<Color=/>.Would you like to buy one for this island for <Color=Yellow>" .. v20 .. " <Color=/>Peli?"
        }
    };
end;
return v0;