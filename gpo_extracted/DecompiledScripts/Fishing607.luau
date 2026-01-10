if workspace:GetAttribute("RNGSeed") == nil then
    if game["Run Service"]:IsServer() == true then
        workspace:SetAttribute("RNGSeed", math.random(0, 100000000));
    end;
    repeat
        task.wait();
    until workspace:GetAttribute("RNGSeed") ~= nil;
end;
local v0 = Random.new(workspace:GetAttribute("RNGSeed"));
return {
    ["Basic Fish Luck Brew"] = {
        tradeLevel = 1, 
        Rare = "Uncommon", 
        Desc = "Contains a strange liquid which attracts rarer fishes within the area until it fades. <Color=Yellow>1.2x Luck multiplier<Color=/> <Color=Red>does not stack with other brews. <Color=/>Lasts <Color=Blue>1 Min<Color=/>", 
        Max = 5, 
        Type = "Drink"
    }, 
    ["Rare Fish Luck Brew"] = {
        tradeLevel = 75, 
        Rare = "Rare", 
        Desc = "Contains a strange liquid which attracts rarer fishes within the area until it fades. <Color=Yellow>1.275x Luck multiplier<Color=/> <Color=Red>does not stack with other brews. <Color=/>Lasts <Color=Blue>2 Mins<Color=/>", 
        Max = 5, 
        Type = "Drink"
    }, 
    Tigerfin = {
        tradeLevel = 1, 
        Rare = "Common", 
        Desc = "A common fish with tiger-like stripes.", 
        Max = 40, 
        Type = "Fish", 
        BaseItem = "Common Fish", 
        Price = v0:NextInteger(0, 250)
    }, 
    ["Exotic Tigerfin"] = {
        tradeLevel = 1, 
        Rare = "Rare", 
        Desc = "A rare variation of the striped Tigerfin.", 
        Max = 40, 
        Type = "Fish", 
        BaseItem = "Rare Fish", 
        Price = v0:NextInteger(1000, 3000)
    }, 
    ["Golden Tigerfin"] = {
        tradeLevel = 1, 
        Rare = "Legendary", 
        Desc = "A legendary Tigerfin with gleaming golden scales.", 
        Max = 40, 
        Type = "Fish", 
        BaseItem = "Legendary Fish", 
        Price = v0:NextInteger(10000, 15000)
    }, 
    ["Zebra Ribbon Angelfish"] = {
        tradeLevel = 1, 
        Rare = "Rare", 
        Desc = "A rare angelfish with zebra-like ribbons.", 
        Max = 40, 
        Type = "Fish", 
        BaseItem = "Rare Fish", 
        Price = v0:NextInteger(1000, 3000)
    }, 
    ["Golden Ribbon Angelfish"] = {
        tradeLevel = 1, 
        Rare = "Legendary", 
        Desc = "A golden angelfish adorned with elegant ribbon patterns.", 
        Max = 40, 
        Type = "Fish", 
        BaseItem = "Legendary Fish", 
        Price = v0:NextInteger(10000, 15000)
    }, 
    ["Crimson Polka Puffer"] = {
        tradeLevel = 1, 
        Rare = "Rare", 
        Desc = "A rare pufferfish with crimson polka dots.", 
        Max = 40, 
        Type = "Fish", 
        BaseItem = "Rare Fish", 
        Price = v0:NextInteger(1000, 3000)
    }, 
    ["Golden Polka Puffer"] = {
        tradeLevel = 1, 
        Rare = "Legendary", 
        Desc = "A legendary pufferfish with shimmering golden spots.", 
        Max = 40, 
        Type = "Fish", 
        BaseItem = "Legendary Fish", 
        Price = v0:NextInteger(10000, 15000)
    }, 
    ["Blue-Lip Grouper"] = {
        tradeLevel = 1, 
        Rare = "Common", 
        Desc = "A common grouper with a distinct blue-lipped appearance.", 
        Max = 40, 
        Type = "Fish", 
        BaseItem = "Common Fish", 
        Price = v0:NextInteger(0, 250)
    }, 
    ["Crimson Snapper"] = {
        tradeLevel = 1, 
        Rare = "Rare", 
        Desc = "A rare snapper fish with a crimson tint.", 
        Max = 40, 
        Type = "Fish", 
        BaseItem = "Rare Fish", 
        Price = v0:NextInteger(1000, 3000)
    }, 
    Fangfish = {
        tradeLevel = 1, 
        Rare = "Rare", 
        Desc = "A rare fish with sharp, fang-like teeth.", 
        Max = 40, 
        Type = "Fish", 
        BaseItem = "Rare Fish", 
        Price = v0:NextInteger(1000, 3000)
    }, 
    Anglerfish = {
        tradeLevel = 1, 
        Rare = "Legendary", 
        Desc = "A legendary deep-sea fish with an eerie glow.", 
        Max = 40, 
        Type = "Fish", 
        BaseItem = "Legendary Fish", 
        Price = v0:NextInteger(10000, 15000)
    }, 
    Swordfish = {
        tradeLevel = 1, 
        Rare = "Legendary", 
        Desc = "A legendary fish with a sword-like bill.", 
        Max = 40, 
        Type = "Fish", 
        BaseItem = "Legendary Fish", 
        Price = v0:NextInteger(10000, 15000)
    }, 
    ["Candy Corn Squid"] = {
        tradeLevel = 1, 
        Rare = "Rare", 
        Desc = "A squid-like creature with bright orange, white, and yellow colors, resembling a piece of candy corn. Exclusive to the Halloween event.", 
        Max = 40, 
        Type = "Fish", 
        BaseItem = "Rare Fish", 
        Price = v0:NextInteger(10000, 15000)
    }, 
    ["Jack-O'-Bite"] = {
        tradeLevel = 1, 
        Rare = "Legendary", 
        Desc = "A fierce, pumpkin-shaped fish with glowing green eyes and a jagged grin. Exclusive to the Halloween event.", 
        Max = 40, 
        Type = "Fish", 
        BaseItem = "Legendary Fish", 
        Price = v0:NextInteger(10000, 15000)
    }, 
    ["Dark Skeletal Shark"] = {
        tradeLevel = 1, 
        Rare = "Legendary", 
        Desc = "A fearsome black skeletal shark with glowing blue eyes, haunting the deep. Exclusive to the Halloween event.", 
        Max = 40, 
        Type = "Fish", 
        BaseItem = "Legendary Fish", 
        Price = v0:NextInteger(10000, 15000)
    }, 
    ["Skeletal Shark"] = {
        tradeLevel = 1, 
        Rare = "Epic", 
        Desc = "A massive skeletal shark with a stone-like appearance, eerie green eyes, and an ancient, haunting aura. Exclusive to the Halloween event.", 
        Max = 40, 
        Type = "Fish", 
        BaseItem = "Rare Fish", 
        Price = v0:NextInteger(10000, 15000)
    }, 
    ["Common Fish Bait"] = {
        tradeLevel = 1, 
        Rare = "Common", 
        Desc = "Standard bait used for catching common fish.", 
        Max = 300, 
        Type = "Display", 
        isFishBait = true
    }, 
    ["Rare Fish Bait"] = {
        tradeLevel = 1, 
        Rare = "Rare", 
        Desc = "Special bait for attracting rare fish.", 
        Max = 300, 
        Type = "Display", 
        isFishBait = true
    }, 
    ["Legendary Fish Bait"] = {
        tradeLevel = 1, 
        Rare = "Legendary", 
        Desc = "Premium bait designed for catching legendary fish.", 
        Max = 300, 
        Type = "Display", 
        isFishBait = true
    }
};