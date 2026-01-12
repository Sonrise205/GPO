local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = {};
local v2 = require(l_ReplicatedStorage_0.Modules.Leveling);
local v3 = {
    Bazooka = {
        tradeLevel = 10, 
        Desc = "A devestating weapon that fires explosive shells powerful enough to fell the mightiest of warriors", 
        Max = 1, 
        Type = "Gun", 
        Rare = "Uncommon"
    }, 
    Rifle = {
        tradeLevel = 1, 
        Desc = "Basically an upgraded pistol. This gun boasts higher accuracy at long distances along with an increase in damage", 
        Max = 1, 
        Type = "Gun", 
        Rare = "Common"
    }, 
    Pistol = {
        tradeLevel = 1, 
        Rare = "Common", 
        Desc = "A gun as weak as it is small", 
        Max = 1, 
        Type = "Gun"
    }, 
    Shotgun = {
        tradeLevel = 100, 
        Rare = "Rare", 
        Desc = "A close range gun that shoots multiple bullets", 
        Max = 1, 
        Type = "Gun"
    }, 
    Galt = {
        tradeLevel = 1, 
        Rare = "Legendary", 
        Desc = "A gun as weak as it is small", 
        Max = 1, 
        Type = "Gun"
    }, 
    ["Normal Cannonball"] = {
        tradeLevel = 1, 
        Rare = "Common", 
        Desc = "A normal cannonball thats fired form cannons", 
        Max = 64, 
        Type = "Cannonball"
    }, 
    ["Shotgun Cannonball"] = {
        tradeLevel = 1, 
        Rare = "Common", 
        Desc = "A cannonball that shoots 10 cannonballs at fast speeds", 
        Max = 64, 
        Type = "Cannonball"
    }, 
    ["Nuke Cannonball"] = {
        tradeLevel = 1, 
        Rare = "Common", 
        Desc = "A cannonball that shoots 10 cannonballs at fast speeds", 
        Max = 64, 
        Type = "Cannonball"
    }, 
    ["Firework Cannonball"] = {
        tradeLevel = 1, 
        Rare = "Common", 
        Desc = "A cannonball that shoots 232313 cannonballs at fast speeds", 
        Max = 64, 
        Type = "Cannonball"
    }, 
    Rowboat = {
        tradeLevel = 1, 
        Rare = "Common", 
        Desc = "A basic boat used to travel the seas", 
        Max = 1, 
        Type = "Ship"
    }, 
    Caravel = {
        tradeLevel = 1, 
        Rare = "Common", 
        Desc = "A medium sized ship with good speed equipped with 2 cannons on both sides", 
        Max = 1, 
        Type = "Ship"
    }, 
    Galleon = {
        tradeLevel = 1, 
        Rare = "Common", 
        Desc = "A large sized ship with good speed equipped with 4 cannons on both sides", 
        Max = 1, 
        Type = "Ship"
    }, 
    ["Coffin Boat"] = {
        tradeLevel = 1, 
        Rare = "Legendary", 
        Desc = "A small boat that resembles yoru", 
        Max = 1, 
        Type = "Ship"
    }, 
    Striker = {
        tradeLevel = 1, 
        Rare = "Legendary", 
        Desc = "A small boat powered by the power of the Mera-Mera fruit", 
        Max = 1, 
        Type = "Ship"
    }, 
    Titanic = {
        tradeLevel = 1, 
        Desc = "huge", 
        Max = 1, 
        Type = "Ship"
    }, 
    ["Wooden Plank"] = {
        tradeLevel = 1, 
        Rare = "Common", 
        Desc = "Planks used to repair ships using a hammer, one plank repairs 10 hp", 
        Max = 1000, 
        Type = "Display", 
        HP = 10, 
        BRMax = 1000
    }, 
    Hammer = {
        tradeLevel = 1, 
        Rare = "Common", 
        Desc = "A hammer that can be used along with wooden planks to repair ships", 
        Max = 1, 
        Type = "Hammer"
    }, 
    ["Marine Cape"] = {
        tradeLevel = 1, 
        Rare = "Collectable", 
        Desc = "A cape worn by marines", 
        Max = 1, 
        Type = "Cape", 
        Cosmetic = true, 
        Exclusive = true
    }, 
    ["Marine Cap"] = {
        tradeLevel = 1, 
        Rare = "Collectable", 
        Desc = "A cap worn by marines", 
        Max = 1, 
        Type = "Cap", 
        Cosmetic = true, 
        Exclusive = true
    }, 
    ["Den Den Mushi"] = {
        tradeLevel = 1, 
        Rare = "Common", 
        Desc = "A device used to call people across the seas", 
        Max = 1, 
        Type = "Item"
    }, 
    ["Stamina Drink"] = {
        tradeLevel = 1, 
        Rare = "Common", 
        Desc = "Boosts stamina regen for 30 seconds and stacks", 
        Max = 20, 
        Type = "Drink"
    }, 
    ["Health Drink"] = {
        tradeLevel = 1, 
        Rare = "Common", 
        Desc = "Boosts health regen for 30 seconds and stacks", 
        Max = 20, 
        Type = "Drink"
    }, 
    ["Shark Repellent Drink"] = {
        tradeLevel = 1, 
        Rare = "Uncommon", 
        Desc = "Repels sharks for 30 seconds in the water and stacks", 
        Max = 20, 
        Type = "Drink"
    }, 
    Carrot = {
        tradeLevel = 1, 
        Rare = "Uncommon", 
        Desc = "A yummy carrot", 
        Max = 100, 
        Type = "Display"
    }, 
    ["Wooden Shovel"] = {
        tradeLevel = 1, 
        Rare = "Common", 
        Desc = "A shovel used to dig dirt", 
        Max = 1, 
        Type = "Shovel"
    }, 
    Katana = {
        tradeLevel = 1, 
        Rare = "Common", 
        Desc = "A regular katana with decent damage", 
        Max = 3, 
        Type = "Katana"
    }, 
    ["Buggy's Cape"] = {
        tradeLevel = 50, 
        Rare = "Rare", 
        Desc = "A cape worn by the Star Clown", 
        Max = 1, 
        Type = "Cape"
    }, 
    ["Cool Shades"] = {
        tradeLevel = 1, 
        Rare = "Collectable", 
        Desc = "Cool Shades", 
        Max = 1, 
        Type = "Glasses", 
        Exclusive = true
    }, 
    Kiribachi = {
        tradeLevel = 80, 
        Rare = "Rare", 
        Desc = "A long sword used by the Saw Shark", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Metal Jaw"] = {
        tradeLevel = 10, 
        Rare = "Uncommon", 
        Desc = "A metal jaw form Logan", 
        Max = 1, 
        Type = "Jaw"
    }, 
    ["Bandit Eyepatch"] = {
        tradeLevel = 1, 
        Rare = "Common", 
        Desc = "A eyepatch worn by the bandit boss", 
        Max = 1, 
        Type = "Glasses"
    }, 
    ["Mihawk Hat"] = {
        tradeLevel = 1, 
        Rare = "Legendary", 
        Desc = "A hat worn by mihawk", 
        Max = 1, 
        Type = "Cap"
    }, 
    ["Gorilla King Crown"] = {
        tradeLevel = 60, 
        Rare = "Rare", 
        Desc = "A crown worn by the Gorilla king", 
        Max = 1, 
        Type = "Cap"
    }, 
    ["Burn Bazooka"] = {
        tradeLevel = 140, 
        Rare = "Rare", 
        Desc = "A bazooka", 
        Max = 1, 
        Type = "Gun"
    }, 
    ["Admiral Cape"] = {
        tradeLevel = 1, 
        Rare = "Common", 
        Desc = "A cape worn by Admirals", 
        Max = 1, 
        Type = "Cape"
    }, 
    ["Golden Staff"] = {
        tradeLevel = 160, 
        Rare = "Rare", 
        Desc = "A golden staff", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Tomoe Drums"] = {
        tradeLevel = 160, 
        Rare = "Legendary", 
        Desc = "Tomoe drums used by the thunder god to conduct electricity", 
        Max = 1, 
        Type = "Back"
    }, 
    ["Skyblue Katana"] = {
        tradeLevel = 120, 
        Rare = "Rare", 
        Desc = "A katana used by the captain of the guardians of the sky", 
        Max = 3, 
        Type = "Katana"
    }, 
    ["Candy Cane"] = {
        tradeLevel = 100, 
        Rare = "Legendary", 
        Desc = "A sharp candy cane used by santa", 
        Max = 1, 
        Type = "Katana", 
        Limited = true
    }, 
    AnonAE3X = {
        tradeLevel = 1, 
        Rare = "Rare", 
        Desc = "fgfgfgfgfgfg", 
        Max = 1, 
        Type = "Jaw", 
        Exclusive = true, 
        Limited = true
    }, 
    ["Santa's Hat"] = {
        tradeLevel = 100, 
        Rare = "Rare", 
        Desc = "Exclusive hat worn by santa", 
        Max = 1, 
        Type = "Cap", 
        Limited = true
    }, 
    ["Guardian's Helmet"] = {
        tradeLevel = 120, 
        Rare = "Rare", 
        Desc = "Hat worn by the Head Guardian of skypiea", 
        Max = 1, 
        Type = "Cap"
    }, 
    ["Elf's Hat"] = {
        tradeLevel = 100, 
        Rare = "Uncommon", 
        Desc = "Exclusive hat worn by santa's elfs", 
        Max = 1, 
        Type = "Cap"
    }, 
    ["Santa's Bells"] = {
        tradeLevel = 100, 
        Rare = "Uncommon", 
        Desc = "A bell used by santa's elfs to heal and attack", 
        Max = 1, 
        Type = "Katana", 
        Limited = true
    }, 
    ["Music Snail"] = {
        tradeLevel = 1, 
        Rare = "Uncommon", 
        Desc = "A device used play music", 
        Max = 1, 
        Type = "Item"
    }, 
    ["Red Scarf"] = {
        tradeLevel = 1, 
        Rare = "Uncommon", 
        Desc = "scarf", 
        Max = 1, 
        Type = "Jaw"
    }, 
    xFedora = {
        tradeLevel = 1, 
        Rare = "Collectable", 
        Desc = "x", 
        Max = 1, 
        Type = "Cap"
    }, 
    xVoidStar = {
        tradeLevel = 1, 
        Rare = "Collectable", 
        Desc = "x", 
        Max = 1, 
        Type = "Jaw"
    }, 
    ["Gravity Blade"] = {
        tradeLevel = 190, 
        Rare = "Rare", 
        Desc = "A cane blade used by gravito the marine admiral", 
        Max = 1, 
        Type = "Katana"
    }, 
    Hoverboard = {
        tradeLevel = 1, 
        Rare = "Legendary", 
        Desc = "Hoverboard that gravito uses to travel the seas, the Zushi fruit will speed up the hoverboard", 
        Max = 1, 
        Type = "Ship"
    }, 
    ["Shark Tooth"] = {
        tradeLevel = 1, 
        Rare = "Uncommon", 
        Desc = "A tooth dropped form a shark", 
        Max = 200, 
        Type = "Display"
    }, 
    ["Neptune's Trident"] = {
        tradeLevel = 230, 
        Rare = "Legendary", 
        Desc = "A trident used by neptune, ruler of fishman island", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Ryu's Katana"] = {
        tradeLevel = 210, 
        Rare = "Rare", 
        Desc = "A katana used Ryu of fishman island", 
        Max = 3, 
        Type = "Katana"
    }, 
    ["Shark Necklace"] = {
        tradeLevel = 210, 
        Rare = "Uncommon", 
        Desc = "A necklace made of shark tooth worn by Ryu", 
        Max = 1, 
        Type = "Jaw"
    }, 
    ["Neptune's Crown"] = {
        tradeLevel = 230, 
        Rare = "Rare", 
        Desc = "A crown worn by neptune, fishmans crowned king", 
        Max = 1, 
        Type = "Cap"
    }, 
    ["Gravito's Cape"] = {
        tradeLevel = 190, 
        Rare = "Uncommon", 
        Desc = "A cape worn by marine admiral Gravito", 
        Max = 1, 
        Type = "Cape"
    }, 
    ["Black Cape"] = {
        tradeLevel = 1, 
        Rare = "Uncommon", 
        Desc = "A cape worn by marine admiral Gravito", 
        Max = 1, 
        Type = "Cape"
    }, 
    ["Flower Bouquet"] = {
        tradeLevel = 100, 
        Limited = true, 
        Rare = "Rare", 
        Desc = "A Bouquet of flowers used by the love empress", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Flamingo Boat"] = {
        tradeLevel = 1, 
        Limited = true, 
        Rare = "Uncommon", 
        Desc = "Flamingo boat used by the Love Empress to travel", 
        Max = 1, 
        Type = "Ship"
    }, 
    ["Slayer's Mask"] = {
        tradeLevel = 300, 
        Chroma = true, 
        Rare = "Legendary", 
        Desc = "A mask worn by a powerful beast hunter who was eaten by a sea beast. The mask reduces incoming damage by a base of <Color=Blue>.5%<Color=/> + <Color=Blue>.5%<Color=/> for every <Color=Yellow>75<Color=/> levels with a maxium of 5%", 
        Max = 1, 
        Type = "Jaw"
    }, 
    ["Flame Scarf"] = {
        tradeLevel = 250, 
        Rare = "Rare", 
        Desc = "A scarf that reduces burning damage by <Color=Blue>15%", 
        Max = 1, 
        Type = "Jaw"
    }, 
    ["Ice Necklace"] = {
        tradeLevel = 250, 
        Rare = "Rare", 
        Desc = "A necklace that reduces freeze time by <Color=Blue>10%", 
        Max = 1, 
        Type = "Jaw"
    }, 
    ["Sea Serpent's Core"] = {
        tradeLevel = 325, 
        Rare = "Legendary", 
        Desc = "The core of a sea serpent which allows the user to summon a sea serpent under their command.", 
        Max = 1, 
        Type = "Core"
    }, 
    ["Lantern of Hope"] = {
        tradeLevel = 250, 
        Rare = "Rare", 
        Desc = "A lantern that provides <Color=Green>25HP<Color=/> and <Color=Green>.5+<Color=/> health regen.", 
        Max = 1, 
        Type = "Waist"
    }, 
    Bisento = {
        tradeLevel = 270, 
        Rare = "Legendary", 
        Desc = "A long spear like weapon used by Captain Zhen.", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Scorched Heart"] = {
        tradeLevel = 1, 
        Rare = "Rare", 
        Desc = "A heart forged form intense heat sustained by the user.", 
        Max = 1, 
        Type = "Item"
    }, 
    ["Captain Zhen's Cape"] = {
        tradeLevel = 270, 
        Rare = "Rare", 
        Desc = "A cape worn by the infamous Captain Zhen which wields the power that can destroy the world.", 
        Max = 1, 
        Type = "Cape"
    }, 
    ["Marine Captain Cape"] = {
        tradeLevel = 250, 
        Rare = "Rare", 
        Desc = "A cape worn by marine captains to show their power.", 
        Max = 1, 
        Type = "Cape"
    }, 
    ["Fire Essence"] = {
        tradeLevel = 100, 
        Rare = "Uncommon", 
        Desc = "A orb that contains fire essence, which has enormous amounts of heat.", 
        Max = 1, 
        Type = "Essence"
    }, 
    ["Slayer's Armor Set"] = {
        tradeLevel = 300, 
        Chroma = true, 
        Rare = "Legendary", 
        Desc = "Armor worn by a previous beast slayer that was devoured by a beast. This armor reduces incoming damage by a base of <Color=Blue>1%<Color=/> + <Color=Blue>.5%<Color=/> for every <Color=Yellow>100<Color=/> levels with a maxium of 10% and provides <Color=Blue>2+<Color=/> stamina regen along with <Color=Green>75<Color=/> extra HP", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Elo's Sledgehammer"] = {
        tradeLevel = 100, 
        Limited = true, 
        Rare = "Legendary", 
        Desc = "hammer used by big fat bunny", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Mini Bunny"] = {
        tradeLevel = 100, 
        Limited = true, 
        Rare = "Epic", 
        Desc = "Allows you to summon your own mini bunny that follows your commands. The amount of bunnys you can spawn depends on how much mini bunnys you have in your inventory (the max is 6). The stats of the bunnys depends on the owners stats.", 
        Max = 6, 
        Type = "Pet"
    }, 
    ["Bunny Hoodie"] = {
        tradeLevel = 100, 
        Limited = true, 
        Rare = "Uncommon", 
        Desc = "A hoodie form the 2021 easter event!", 
        Max = 3, 
        Type = "Cap"
    }, 
    ["Star Shades"] = {
        tradeLevel = 100, 
        Limited = true, 
        Rare = "Uncommon", 
        Desc = "Cool star shades from 2021 easter event!", 
        Max = 1, 
        Type = "Glasses"
    }, 
    ["Pink Egg"] = {
        tradeLevel = 100, 
        Limited = true, 
        Rare = "Uncommon", 
        Desc = "A pink egg from the 2021 easter event!", 
        Max = 1, 
        Type = "Egg"
    }, 
    ["Golden Egg"] = {
        tradeLevel = 100, 
        Limited = true, 
        Rare = "Uncommon", 
        Desc = "A egg made of gold from the 2021 easter event!", 
        Max = 1, 
        Type = "Egg"
    }, 
    ["Egg of Wonder"] = {
        tradeLevel = 100, 
        Limited = true, 
        Rare = "Rare", 
        Desc = "A egg with many colorful swirls from the 2021 easter event!", 
        Max = 1, 
        Type = "Egg"
    }, 
    ["Rainbow Egg"] = {
        tradeLevel = 100, 
        Limited = true, 
        Rare = "Rare", 
        Desc = "A virbrant rainbow egg from the 2021 easter event!", 
        Max = 1, 
        Type = "Egg"
    }, 
    ["Rainbow Halo"] = {
        tradeLevel = 100, 
        Limited = true, 
        Rare = "Rare", 
        Desc = "A rainbow halo from the 2021 easter event!", 
        Max = 1, 
        Type = "Cap"
    }, 
    ["Mini Bunny Egg"] = {
        tradeLevel = 100, 
        Limited = true, 
        Rare = "Epic", 
        Desc = "A egg that contains a mini bunny from the 2021 easter event!", 
        Max = 1, 
        Type = "Egg"
    }, 
    ["Elo's Egg"] = {
        tradeLevel = 100, 
        Limited = true, 
        Rare = "Rare", 
        Desc = "A egg that contains the hammer that Elo uses from the 2021 easter event!", 
        Max = 1, 
        Type = "Egg"
    }, 
    ["Seabeast Katana"] = {
        tradeLevel = 300, 
        Limited = true, 
        Rare = "Rare", 
        Desc = "A katana forged of material form seabeasts.", 
        Max = 3, 
        Type = "Katana"
    }, 
    ["Wonder Balloon"] = {
        tradeLevel = 100, 
        Limited = true, 
        Rare = "Rare", 
        Desc = "A balloon that allows you to slowly fall when equiped from the 2021 easter event!", 
        Max = 1, 
        Type = "Baloon"
    }, 
    ["Trading Sign"] = {
        tradeLevel = 1, 
        Rare = "Uncommon", 
        Desc = "A sign that can be customized!", 
        Max = 1, 
        Type = "Item"
    }, 
    ["Kraken Cape"] = {
        tradeLevel = 350, 
        Chroma = true, 
        Rare = "Rare", 
        Desc = "A cape made from Kraken material", 
        Max = 1, 
        Type = "Cape"
    }, 
    ["Kraken Armor Set"] = {
        tradeLevel = 345, 
        Chroma = true, 
        Rare = "Legendary", 
        Desc = "Armor forged with the remains of a Kraken. This armor reduces incoming damage by a base of <Color=Blue>1%<Color=/> + <Color=Blue>.65%<Color=/> for every <Color=Yellow>100<Color=/> levels with a maxium of 10% and provides <Color=Blue>2+<Color=/> stamina regen along with <Color=Green>100<Color=/> extra HP", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Kraken Blade"] = {
        tradeLevel = 400, 
        Rare = "Legendary", 
        Desc = "A blade crafted by a legendary blacksmith using the remains of a Kraken.", 
        Max = 1, 
        Type = "Katana", 
        Chroma = true
    }, 
    ["World Scroll"] = {
        tradeLevel = 325, 
        Rare = "Rare", 
        Desc = "A scroll containing contents of the new world.", 
        Max = 1, 
        Type = "Display"
    }, 
    ["Spirit Essence"] = {
        tradeLevel = 300, 
        Rare = "Rare", 
        Desc = "A orb that contains spirit essence, which can evolve ones spirit if used properly.", 
        Max = 1, 
        Type = "Essence"
    }, 
    ["Golden Hook"] = {
        tradeLevel = 345, 
        Rare = "Rare", 
        Desc = "A hook made of gold, also a primary weapon used by the Pharaoh Akshan", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Crab Cutlass"] = {
        tradeLevel = 385, 
        Rare = "Legendary", 
        Desc = "A cutlass that the king crab has used in his early days", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Cho's Crown"] = {
        tradeLevel = 375, 
        Rare = "Rare", 
        Desc = "A crown that the king of crabs wear", 
        Max = 1, 
        Type = "Cap"
    }, 
    ["Karoo Mount"] = {
        tradeLevel = 0, 
        Rare = "Uncommon", 
        Desc = "A mount that allows for swift land transportation", 
        Max = 1, 
        Type = "Mount"
    }, 
    ["Karoo Food"] = {
        tradeLevel = 0, 
        Rare = "Common", 
        Desc = "Vegetables to feed karoos", 
        Max = 64, 
        Type = "Food"
    }, 
    ["Kraken Katana"] = {
        tradeLevel = 385, 
        Rare = "Legendary", 
        Desc = "A katana forged with materials from a Kraken", 
        Max = 3, 
        Type = "Katana"
    }, 
    ["Book of Spirits"] = {
        tradeLevel = 350, 
        Rare = "Rare", 
        Desc = "A book containing contents of a spirit", 
        Max = 1, 
        Type = "Book"
    }, 
    ["Book of Nitoryu"] = {
        tradeLevel = 350, 
        Rare = "Rare", 
        Desc = "A book containing contents relating to Two Sword Style", 
        Max = 1, 
        Type = "Book"
    }, 
    ["Seer of Zaro"] = {
        tradeLevel = 300, 
        Rare = "Rare", 
        Desc = "A golden eye", 
        Max = 1, 
        Type = "Artifact"
    }, 
    ["Cup of Vedas"] = {
        tradeLevel = 300, 
        Rare = "Rare", 
        Desc = "A golden cup", 
        Max = 1, 
        Type = "Artifact"
    }, 
    ["Heart of Sol"] = {
        tradeLevel = 300, 
        Rare = "Rare", 
        Desc = "A golden heart", 
        Max = 1, 
        Type = "Artifact"
    }, 
    ["Venra's Hat"] = {
        tradeLevel = 200, 
        Rare = "Rare", 
        Desc = "A replicate of the hat that the greatest Karoo rider wore", 
        Max = 1, 
        Type = "Cap"
    }, 
    ["Horned Pilot"] = {
        tradeLevel = 200, 
        Rare = "Rare", 
        Desc = "A hat that resembles a bull, maybe your Karoo is secretly a bull", 
        Max = 1, 
        Type = "Cap"
    }, 
    ["Ruin Mask"] = {
        tradeLevel = 200, 
        Rare = "Rare", 
        Desc = "A hat that will make your fellow riders fear you", 
        Max = 1, 
        Type = "Cap"
    }, 
    ["Riding Mohican"] = {
        tradeLevel = 200, 
        Rare = "Rare", 
        Desc = "A hat full of euthusiasm", 
        Max = 1, 
        Type = "Cap"
    }, 
    ["Pharaoh Akshan's Cape"] = {
        tradeLevel = 350, 
        Rare = "Rare", 
        Desc = "A cape worn by the pharaoh of the desert kingdom.", 
        Max = 1, 
        Type = "Cape"
    }, 
    ["Kraken Core"] = {
        tradeLevel = 400, 
        Rare = "Legendary", 
        Desc = "The core of a kraken which allows the user to summon a kraken under their command.", 
        Max = 1, 
        Type = "Core"
    }, 
    ["Musashi's Hat"] = {
        tradeLevel = 400, 
        Rare = "Legendary", 
        Desc = "A hat worn by the legendary Two Sword Style founder. This hat increases all sword damage by 2%.", 
        Max = 1, 
        Type = "Cap"
    }, 
    ["Musashi's Crimson Katana"] = {
        tradeLevel = 385, 
        Rare = "Legendary", 
        Desc = "One of the legendary katanas wielded by Musashi, an ominous soul resides within the blade", 
        Max = 3, 
        Type = "Katana"
    }, 
    ["Musashi's Karuta"] = {
        tradeLevel = 400, 
        Rare = "Legendary", 
        Desc = "Outfit worn by Musashi the 2SS founder. Wearing this provides a <Color=Blue>3%<Color=/> damage boost for all skills that involves swords.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Musashi's Rose Katana"] = {
        tradeLevel = 385, 
        Rare = "Legendary", 
        Desc = "One of the legendary katanas wielded by Musashi, don't let it's gentle apperance deceive you", 
        Max = 3, 
        Type = "Katana"
    }, 
    ["Bean Coffee"] = {
        tradeLevel = 25, 
        Rare = "Common", 
        Desc = "A coffee brewed by the bean cafe located at the desert kingdom.", 
        Max = 1, 
        Type = "Item"
    }, 
    ["Kingdom Guard Outfit"] = {
        tradeLevel = 345, 
        Rare = "Uncommon", 
        Desc = "A fine outfit worn by the guards of the desert kingdom", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Golden Hammer"] = {
        tradeLevel = 1, 
        Rare = "Rare", 
        Desc = "A <Color=Yellow>GOLDEN<Color=/> hammer that repairs ships 4x faster!", 
        Max = 1, 
        Type = "Hammer"
    }, 
    ["Demon Jester's Scythe"] = {
        tradeLevel = 385, 
        Limited = true, 
        Rare = "Legendary", 
        Desc = "A scythe used by the Demon Jester form the abyss...", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Fruit Bag"] = {
        tradeLevel = 0, 
        Rare = "Rare", 
        Desc = "A bag that allows the storage of devil fruits.", 
        Max = 1, 
        Type = "FruitBag"
    }, 
    ["Spare Fruit Bag"] = {
        tradeLevel = 0, 
        Limited = true, 
        Rare = "Rare", 
        Desc = "A spare fruit bag that can be traded to other players.", 
        Max = 3, 
        Type = "FruitBag"
    }, 
    ["Hollow's Fang"] = {
        tradeLevel = 385, 
        Limited = true, 
        Rare = "Legendary", 
        Desc = "A quick and swift dagger used by Lord Ba'al", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Ba'al's Cape"] = {
        tradeLevel = 375, 
        Limited = true, 
        Rare = "Rare", 
        Desc = "A cape worn by Ba'al", 
        Max = 1, 
        Type = "Cape"
    }, 
    ["Dark Root"] = {
        tradeLevel = 1, 
        Rare = "Rare", 
        Desc = "A dark tree root, when consumed removes the users devil fruit powers.", 
        Max = 10, 
        Type = "FruitRemover", 
        OneTime = true
    }, 
    ["Zombie Arm"] = {
        tradeLevel = 300, 
        Rare = "Common", 
        Desc = "A arm of a zombie", 
        Max = 30, 
        Type = "Artifact"
    }, 
    ["Zombie Leg"] = {
        tradeLevel = 300, 
        Rare = "Common", 
        Desc = "A leg of a zombie", 
        Max = 30, 
        Type = "Artifact"
    }, 
    ["Zombie Skull"] = {
        tradeLevel = 300, 
        Rare = "Common", 
        Desc = "A skull of a zombie", 
        Max = 30, 
        Type = "Artifact"
    }, 
    ["Ba'als Core"] = {
        tradeLevel = 365, 
        Limited = true, 
        Rare = "Rare", 
        Desc = "A golden skull...", 
        Max = 3, 
        Type = "Artifact"
    }, 
    ["Witch's Key"] = {
        tradeLevel = 300, 
        Limited = true, 
        Rare = "Rare", 
        Desc = "A golden key...", 
        Max = 3, 
        Type = "Key"
    }, 
    ["Witch's Hat"] = {
        tradeLevel = 350, 
        Limited = true, 
        Rare = "Rare", 
        Desc = "A hat worn by the witch", 
        Max = 1, 
        Type = "Cap"
    }, 
    ["Jester's Hat"] = {
        tradeLevel = 350, 
        Limited = true, 
        Rare = "Rare", 
        Desc = "A hat worn by the demon jester!", 
        Max = 1, 
        Type = "Cap"
    }, 
    ["Witch's Outfit"] = {
        tradeLevel = 400, 
        Limited = true, 
        Rare = "Rare", 
        Desc = "A outfit worn by the witch during the 2021 haloween event!", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    Jumpsuit = {
        tradeLevel = 0, 
        Limited = true, 
        Rare = "Rare", 
        Desc = "A jumpsuit...", 
        Max = 3, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Triangle Hoodie"] = {
        tradeLevel = 0, 
        Limited = true, 
        Rare = "Rare", 
        Desc = "TRIANGLE", 
        Max = 3, 
        Type = "Cap"
    }, 
    ["Square Hoodie"] = {
        tradeLevel = 0, 
        Limited = true, 
        Rare = "Rare", 
        Desc = "SQUARE", 
        Max = 3, 
        Type = "Cap"
    }, 
    ["Circle Hoodie"] = {
        tradeLevel = 0, 
        Limited = true, 
        Rare = "Rare", 
        Desc = "CIRCLE", 
        Max = 3, 
        Type = "Cap"
    }, 
    ["Jester's Outfit"] = {
        tradeLevel = 400, 
        Limited = true, 
        Rare = "Collectable", 
        Desc = "A outfit worn by the demon jester!", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Zombie Costume 1"] = {
        tradeLevel = 0, 
        Rare = "Common", 
        Desc = "A outfit worn by a zombie", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Zombie Costume 2"] = {
        tradeLevel = 0, 
        Rare = "Common", 
        Desc = "A outfit worn by a zombie", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Zombie Costume 3"] = {
        tradeLevel = 0, 
        Rare = "Common", 
        Desc = "A outfit worn by a zombie", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Zombie Costume 4"] = {
        tradeLevel = 0, 
        Rare = "Common", 
        Desc = "A outfit worn by a zombie", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Zombie Costume 5"] = {
        tradeLevel = 0, 
        Rare = "Common", 
        Desc = "A outfit worn by a zombie", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Zombie Costume 6"] = {
        tradeLevel = 0, 
        Rare = "Common", 
        Desc = "A outfit worn by a zombie", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Zombie Costume 7"] = {
        tradeLevel = 0, 
        Rare = "Common", 
        Desc = "A outfit worn by a zombie", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Head of Ba'al"] = {
        tradeLevel = 375, 
        Limited = true, 
        Rare = "Legendary", 
        Desc = "Ba'als head", 
        Max = 1, 
        Type = "Katana2"
    }, 
    ["Jester Box"] = {
        tradeLevel = 385, 
        Limited = true, 
        Rare = "Legendary", 
        Desc = "A jester box used by the demon jester", 
        Max = 1, 
        Type = "Katana2"
    }, 
    Lantern = {
        tradeLevel = 0, 
        Rare = "Legendary", 
        Desc = "A lantern for light!", 
        Max = 1, 
        Type = "Displasy"
    }, 
    ["Prestige Fruitbag"] = {
        tradeLevel = 350, 
        Limited = true, 
        Rare = "Legendary", 
        Desc = "A fruitbag that allows you to store 2 of the same fruits.", 
        Max = 1, 
        Type = "Cape"
    }, 
    ["Anniversary Cap"] = {
        tradeLevel = 0, 
        Limited = true, 
        Rare = "Rare", 
        Desc = "1 year anniversary cap!", 
        Max = 1, 
        Type = "Cap"
    }, 
    ["Anniversary Hat"] = {
        tradeLevel = 0, 
        Limited = true, 
        Rare = "Rare", 
        Desc = "1 year anniversary hat!", 
        Max = 1, 
        Type = "Cap"
    }, 
    ["Anniversary Shades"] = {
        tradeLevel = 0, 
        Limited = true, 
        Rare = "Rare", 
        Desc = "1 year anniversary Shades!", 
        Max = 1, 
        Type = "Glasses"
    }, 
    ["Anniversary Firework"] = {
        tradeLevel = 0, 
        Limited = true, 
        Rare = "Common", 
        Desc = "A firework to celebrate!", 
        Max = 1, 
        Type = "Displasy"
    }, 
    ["SP Reset Essence"] = {
        tradeLevel = 0, 
        Rare = "Common", 
        Desc = "Absorb the essence to reset your stat points", 
        Max = 50, 
        Type = "Essence"
    }, 
    ["Anniversary Lantern"] = {
        tradeLevel = 250, 
        Limited = true, 
        Rare = "Rare", 
        Desc = "A lantern that provides <Color=Green>30HP<Color=/> and <Color=Green>.5+<Color=/> health regen.", 
        Max = 1, 
        Type = "Waist"
    }, 
    ["Prestige Candy Cane"] = {
        tradeLevel = 425, 
        Limited = true, 
        Rare = "Collectable", 
        Desc = "A sharp candy cane used by santa <Color=Purple>[PRESTIGE]", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Festival Lancer"] = {
        tradeLevel = 385, 
        Limited = true, 
        Rare = "Legendary", 
        Desc = "A festival tree lancer.", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Festival Shield"] = {
        tradeLevel = 385, 
        Limited = true, 
        Rare = "Legendary", 
        Desc = "A festival shield", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Peppermint Buttons Dress"] = {
        tradeLevel = 0, 
        Limited = true, 
        Rare = "Common", 
        Desc = "A dress with peppermint buttons", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Peppermint Buttons Outfit"] = {
        tradeLevel = 0, 
        Limited = true, 
        Rare = "Common", 
        Desc = "A outfit with peppermint buttons", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Santa's Outfit"] = {
        tradeLevel = 0, 
        Limited = true, 
        Rare = "Common", 
        Desc = "A outfit worn by santa", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Regular Christmas Outfit"] = {
        tradeLevel = 0, 
        Limited = true, 
        Rare = "Common", 
        Desc = "A regular christmas outfit.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Elf's Outfit"] = {
        tradeLevel = 0, 
        Limited = true, 
        Rare = "Common", 
        Desc = "A outfit worn by a santa's elfs", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Bell Armor"] = {
        tradeLevel = 345, 
        Limited = true, 
        Rare = "Uncommon", 
        Desc = "Bell armor??", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Tall Elf Hat"] = {
        tradeLevel = 350, 
        Limited = true, 
        Rare = "Uncommon", 
        Desc = "A tall elf hat!", 
        Max = 1, 
        Type = "Cap"
    }, 
    ["Santa's Beard"] = {
        tradeLevel = 350, 
        Limited = true, 
        Rare = "Uncommon", 
        Desc = "SANTA'S BEARD??", 
        Max = 1, 
        Type = "Jaw"
    }, 
    ["Rudolph's Hat"] = {
        tradeLevel = 350, 
        Limited = true, 
        Rare = "Uncommon", 
        Desc = "Rudolph's hat!!", 
        Max = 1, 
        Type = "Cap"
    }, 
    ["Reindeer Horns"] = {
        tradeLevel = 350, 
        Limited = true, 
        Rare = "Uncommon", 
        Desc = "Reindeer horns, none were harmed!", 
        Max = 1, 
        Type = "Cap"
    }, 
    ["Peppermint Scarf"] = {
        tradeLevel = 350, 
        Limited = true, 
        Rare = "Rare", 
        Desc = "Peppermient scarf?", 
        Max = 1, 
        Type = "Jaw"
    }, 
    ["Festival Tree Hat"] = {
        tradeLevel = 350, 
        Limited = true, 
        Rare = "Rare", 
        Desc = "Tree hat!!", 
        Max = 1, 
        Type = "Cap"
    }, 
    ["Frosted Gingerbread"] = {
        tradeLevel = 275, 
        Limited = true, 
        Rare = "Rare", 
        Desc = "Frosted gingerbread head", 
        Max = 1, 
        Type = "Back"
    }, 
    ["Gingerbread Giftbox"] = {
        tradeLevel = 300, 
        Limited = true, 
        Rare = "Common", 
        Desc = "A empty giftbox made form gingerbread", 
        Max = 15, 
        Type = "Artifact"
    }, 
    ["Gift of Armor"] = {
        tradeLevel = 300, 
        Limited = true, 
        Rare = "Rare", 
        Desc = "A gift form <Color=Blue>Christmas 2021<Color=/>!", 
        Max = 1, 
        Type = "Artifact"
    }, 
    ["Gift of Lancer"] = {
        tradeLevel = 300, 
        Limited = true, 
        Rare = "Legendary", 
        Desc = "A gift form <Color=Blue>Christmas 2021<Color=/>!", 
        Max = 1, 
        Type = "Artifact"
    }, 
    ["Gift of Shield"] = {
        tradeLevel = 300, 
        Limited = true, 
        Rare = "Rare", 
        Desc = "A gift form <Color=Blue>Christmas 2021<Color=/>!", 
        Max = 1, 
        Type = "Artifact"
    }, 
    ["Gift of Beard"] = {
        tradeLevel = 300, 
        Limited = true, 
        Rare = "Uncommon", 
        Desc = "A gift form <Color=Blue>Christmas 2021<Color=/>!", 
        Max = 1, 
        Type = "Artifact"
    }, 
    ["Gift of Tree"] = {
        tradeLevel = 300, 
        Limited = true, 
        Rare = "Rare", 
        Desc = "A gift form <Color=Blue>Christmas 2021<Color=/>!", 
        Max = 1, 
        Type = "Artifact"
    }, 
    ["Gift of Scarf"] = {
        tradeLevel = 300, 
        Limited = true, 
        Rare = "Rare", 
        Desc = "A gift form <Color=Blue>Christmas 2021<Color=/>!", 
        Max = 1, 
        Type = "Artifact"
    }, 
    ["Gift of Horns"] = {
        tradeLevel = 300, 
        Limited = true, 
        Rare = "Uncommon", 
        Desc = "A gift form <Color=Blue>Christmas 2021<Color=/>!", 
        Max = 1, 
        Type = "Artifact"
    }, 
    ["Gift of Rudolph"] = {
        tradeLevel = 300, 
        Limited = true, 
        Rare = "Uncommon", 
        Desc = "A gift form <Color=Blue>Christmas 2021<Color=/>!", 
        Max = 1, 
        Type = "Artifact"
    }, 
    ["Gift of Outfit"] = {
        tradeLevel = 300, 
        Limited = true, 
        Rare = "Uncommon", 
        Desc = "A gift form <Color=Blue>Christmas 2021<Color=/>!", 
        Max = 1, 
        Type = "Artifact"
    }, 
    ["Gift of Tall Hat"] = {
        tradeLevel = 300, 
        Limited = true, 
        Rare = "Uncommon", 
        Desc = "A gift form <Color=Blue>Christmas 2021<Color=/>!", 
        Max = 1, 
        Type = "Artifact"
    }, 
    ["Gift of Fruit"] = {
        tradeLevel = 300, 
        Limited = true, 
        Rare = "Rare", 
        Desc = "A gift form <Color=Blue>Christmas 2021<Color=/>!", 
        Max = 3, 
        Type = "Artifact"
    }, 
    ["Cupid's Wand"] = {
        tradeLevel = 425, 
        Limited = true, 
        Rare = "Legendary", 
        Desc = "A wand used by the cupid queen", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Cupid's Battleaxe"] = {
        tradeLevel = 425, 
        Limited = true, 
        Rare = "Legendary", 
        Desc = "A battleaxe used by the cupid queen and her guards", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Cupid Boat"] = {
        tradeLevel = 1, 
        Limited = true, 
        Rare = "Rare", 
        Desc = "A small boat pulled by a swan.", 
        Max = 1, 
        Type = "Ship"
    }, 
    ["Cupid Queen's Outfit"] = {
        tradeLevel = 425, 
        Limited = true, 
        Rare = "Collectable", 
        Desc = "A outfit worn by the Cupid Queen!", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Cupid Queen's Wings"] = {
        tradeLevel = 425, 
        Limited = true, 
        Rare = "Legendary", 
        Desc = "Wings form the Cupid Queen", 
        Max = 1, 
        Type = "Back"
    }, 
    ["Wings of Roses"] = {
        tradeLevel = 425, 
        Limited = true, 
        Rare = "Rare", 
        Desc = "Golden wings worn on the back", 
        Max = 1, 
        Type = "Back"
    }, 
    ["Wings of Leo"] = {
        tradeLevel = 425, 
        Limited = true, 
        Rare = "Rare", 
        Desc = "Ear wings worn by Leo", 
        Max = 1, 
        Type = "Ears"
    }, 
    ["Worshiper's Cape"] = {
        tradeLevel = 275, 
        Limited = true, 
        Rare = "Rare", 
        Desc = "A cape worn by the worshippers of the Cupid Queen", 
        Max = 1, 
        Type = "Cape"
    }, 
    ["Love Witch's Hat"] = {
        tradeLevel = 275, 
        Limited = true, 
        Rare = "Rare", 
        Desc = "Love Witch's Hat", 
        Max = 1, 
        Type = "Cap"
    }, 
    ["Cupid Headband"] = {
        tradeLevel = 275, 
        Limited = true, 
        Rare = "Rare", 
        Desc = "Cupid headband", 
        Max = 1, 
        Type = "Headband"
    }, 
    ["Cupid Mask"] = {
        tradeLevel = 250, 
        Limited = true, 
        Rare = "Rare", 
        Desc = "A mask worn by cupid worshippers", 
        Max = 1, 
        Type = "Jaw"
    }, 
    ["Cupid Scarf"] = {
        tradeLevel = 275, 
        Limited = true, 
        Rare = "Rare", 
        Desc = "A scarf worn by the worshippers of the Cupid Queen", 
        Max = 1, 
        Type = "Cape"
    }, 
    ["Cupid Guard Outfit (Male)"] = {
        tradeLevel = 345, 
        Limited = true, 
        Rare = "Uncommon", 
        Desc = "Outfit worn by cupid guards", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Cupid Guard Outfit (Female)"] = {
        tradeLevel = 345, 
        Limited = true, 
        Rare = "Uncommon", 
        Desc = "Outfit worn by cupid guards", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Leo's Outfit"] = {
        tradeLevel = 350, 
        Limited = true, 
        Rare = "Rare", 
        Desc = "A outfit worn by the Leo, a knight of the cupid queen.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Moria's Scissors"] = {
        tradeLevel = 425, 
        Rare = "Legendary", 
        Desc = "Razor sharp scissors that exude an ominous aura. Its true purpose can be realized with the power of the Kage-Kage no mi.", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Bomi's Log Pose"] = {
        tradeLevel = 0, 
        Rare = "Rare", 
        Desc = "A log pose that can track multiple locations.", 
        Max = 3, 
        Type = "Item"
    }, 
    ["Zombie Knight's Armor"] = {
        tradeLevel = 425, 
        Rare = "Rare", 
        Desc = "Armor of a once valiant knight.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Zombie Knight's Armor (Bandaged)"] = {
        tradeLevel = 425, 
        Rare = "Rare", 
        Desc = "Armor of a once self-less knight.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Zombie Knight's Helmet 1"] = {
        tradeLevel = 425, 
        Rare = "Rare", 
        Desc = "A helmet worn by zombie knights at thriller bark.", 
        Max = 1, 
        Type = "Cap"
    }, 
    ["Zombie Knight's Helmet 2"] = {
        tradeLevel = 425, 
        Rare = "Rare", 
        Desc = "A helmet worn by zombie knights at thriller bark.", 
        Max = 1, 
        Type = "Cap"
    }, 
    ["Zombie Knight's Helmet 3"] = {
        tradeLevel = 425, 
        Rare = "Rare", 
        Desc = "A helmet worn by zombie knights at thriller bark.", 
        Max = 1, 
        Type = "Cap"
    }, 
    ["Ryuma's Scarf"] = {
        tradeLevel = 475, 
        Rare = "Epic", 
        Desc = "Warmth of the legendary dragonslayer who led a frugal life.", 
        Max = 1, 
        Type = "Cape"
    }, 
    ["Ryuma's Outfit"] = {
        tradeLevel = 475, 
        Rare = "Legendary", 
        Desc = "Garment from the far east. It bears a motif of destruction.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Moria's Tophat"] = {
        tradeLevel = 475, 
        Rare = "Epic", 
        Desc = "Stylized tophat from the lord of shadows.", 
        Max = 1, 
        Type = "Cap"
    }, 
    ["Moria's Necklace"] = {
        tradeLevel = 475, 
        Rare = "Epic", 
        Desc = "Cross-shaped necklace from the lord of shadows.", 
        Max = 1, 
        Type = "Jaw"
    }, 
    ["Bat Swarm"] = {
        tradeLevel = 475, 
        Rare = "Legendary", 
        Desc = "An unusual but friendly entourage.", 
        Max = 1, 
        Type = "Ears"
    }, 
    ["All Seeing Eye"] = {
        tradeLevel = 0, 
        Rare = "Mythical", 
        BaseItem = "All Seeing Eye", 
        Desc = "The clairvoyant eye will locate and identify devil fruits as they spawn. <Color=Cyan>Grants the beholder 2x logia rates while in their possession.", 
        Max = 3, 
        Type = "ASESlot"
    }, 
    ["Devil Fruit Journal"] = {
        tradeLevel = 0, 
        Rare = "Epic", 
        Desc = "A record of one's devil fruit gains since acquiring the journal.", 
        Max = 3, 
        Type = "Item"
    }, 
    Shusui = {
        tradeLevel = 425, 
        Rare = "Legendary", 
        Desc = "The prized blade of one who knew no equal.", 
        Max = 3, 
        Type = "Katana", 
        isKatana = true
    }, 
    ["Knight's Gauntlet"] = {
        tradeLevel = 425, 
        Rare = "Legendary", 
        Desc = "Ancient relics of a peerless knight. These loyal vessels require strength to show their true potential.", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Soul Cane"] = {
        tradeLevel = 475, 
        Rare = "Legendary", 
        Desc = "A soul twice lost finds itself entombed within the wintry blade.", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Soul King's Outfit"] = {
        tradeLevel = 475, 
        Rare = "Legendary", 
        Desc = "Tattered pirate's attire from the Soul King.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Brook's OutfitBOSS"] = {
        tradeLevel = 475, 
        Rare = "Legendary", 
        Desc = "Outfit worn by Brook", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Soul King's Tophat"] = {
        tradeLevel = 475, 
        Rare = "Epic", 
        Desc = "Hat and cravat of the Soul King.", 
        Max = 1, 
        Type = "Cap"
    }, 
    ["Borj's Armor"] = {
        tradeLevel = 450, 
        Rare = "Legendary", 
        Desc = "Protector of the swordless knight.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Borj's ArmorBOSS"] = {
        tradeLevel = 375, 
        Rare = "Legendary", 
        Desc = "armor", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Soul King's Violin"] = {
        tradeLevel = 450, 
        Rare = "Epic", 
        Desc = "Soul King's treasured violin. It reminds of bygone days.", 
        Max = 1, 
        Type = "Katana2"
    }, 
    SoulKingRockstar = {
        tradeLevel = 345, 
        Rare = "Legendary", 
        Desc = "Outfit worn by Brook", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Soul King's Rockstar Outfit"] = {
        tradeLevel = 475, 
        Rare = "Legendary", 
        Desc = "An assortment of clothing that defined the Rockstar.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Soul King's Guitar"] = {
        tradeLevel = 475, 
        Rare = "Legendary", 
        Desc = "Soul King's treasured electric guitar. It inspires the Rockstar.", 
        Max = 1, 
        Type = "Katana2"
    }, 
    ["Soul King's Tophat (Rockstar)"] = {
        tradeLevel = 475, 
        Rare = "Epic", 
        Desc = "Crown of the rising Rockstar.", 
        Max = 1, 
        Type = "Cap"
    }, 
    ["Soul King's Shades"] = {
        tradeLevel = 475, 
        Rare = "Epic", 
        Desc = "Heart-shaped glasses worn by the Rockstar.", 
        Max = 1, 
        Type = "Glasses"
    }, 
    ["Borj's Soul"] = {
        tradeLevel = 325, 
        Rare = "Uncommon", 
        Desc = "The soul of Borj.", 
        Max = 3, 
        Type = "Essence"
    }, 
    ["Ryuma's Soul"] = {
        tradeLevel = 325, 
        Rare = "Uncommon", 
        Desc = "The soul of Ryuma.", 
        Max = 3, 
        Type = "Essence"
    }, 
    ["Soul King's Scarf"] = {
        tradeLevel = 475, 
        Rare = "Collectable", 
        Desc = "Soul King's feather boa.", 
        Max = 1, 
        Type = "TorsoScarf"
    }, 
    ["Soul King's Rockstar OutfitBOSS"] = {
        tradeLevel = 345, 
        Rare = "Legendary", 
        Desc = "Outfit worn by Brook", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Moria's Outfit"] = {
        tradeLevel = 475, 
        Rare = "Legendary", 
        Desc = "Noble black coat from the lord of shadows.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Vel's Lantern"] = {
        tradeLevel = 75, 
        Rare = "Common", 
        Desc = "A lantern used by Vel to guide thru the darkness.", 
        Max = 1, 
        Type = "Back2"
    }, 
    ["Thrilled Ship"] = {
        tradeLevel = 1, 
        Rare = "Rare", 
        Desc = "A large sized ship with good speed equipped with 4 cannons on both sides", 
        Max = 3, 
        Type = "Ship"
    }, 
    PinH = {
        tradeLevel = 1, 
        Rare = "Collectable", 
        Desc = "one of a kind", 
        Max = 1, 
        Type = "Jaw", 
        Exclusive = true
    }, 
    BlindfoldH = {
        tradeLevel = 100, 
        Rare = "Uncommon", 
        Desc = "Cool star shades from 2021 easter event!", 
        Max = 1, 
        Type = "Glasses"
    }, 
    BunnyHat = {
        tradeLevel = 1, 
        Rare = "Rare", 
        Desc = "e", 
        Max = 1, 
        Type = "Cap", 
        Cosmetic = true
    }, 
    ["Coyote Outfit"] = {
        tradeLevel = 475, 
        Rare = "Legendary", 
        Desc = "outfit", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Drippy Fit V2"] = {
        tradeLevel = 0, 
        Rare = "Uncommon", 
        Desc = "Another version of the drippy fit", 
        Max = 3, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["GPO Fedora"] = {
        tradeLevel = 1, 
        Rare = "Uncommon", 
        Desc = "A item award to player who played during paid access", 
        Max = 1, 
        Type = "Cap", 
        Cosmetic = true
    }, 
    Boneshiver = {
        tradeLevel = 375, 
        Rare = "Legendary", 
        Desc = "A weapon upgraded from Kiribachi with Megalodon Teeth. This weapon scales off <Color=Orange>Strength", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Legendary Chest"] = {
        tradeLevel = 1, 
        Rare = "Legendary", 
        Desc = "e", 
        Max = 1, 
        Type = "Chest"
    }, 
    ["Rare Chest"] = {
        tradeLevel = 1, 
        Rare = "Rare", 
        Desc = "e", 
        Max = 1, 
        Type = "Chest"
    }, 
    ["Uncommon Chest"] = {
        tradeLevel = 1, 
        Rare = "Uncommon", 
        Desc = "e", 
        Max = 1, 
        Type = "Chest"
    }, 
    ["Common Chest"] = {
        tradeLevel = 1, 
        Rare = "Common", 
        Desc = "e", 
        Max = 1, 
        Type = "Chest"
    }, 
    ["Mythical Chest"] = {
        tradeLevel = 1, 
        Rare = "Mythical", 
        Desc = "e", 
        Max = 1, 
        Type = "Chest"
    }, 
    ["Prisoner Outfit"] = {
        tradeLevel = 0, 
        Rare = "Uncommon", 
        Desc = "Prisoner Outfit", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        AllowInBR = true
    }, 
    ["Life Essence"] = {
        tradeLevel = 0, 
        Rare = "Common", 
        Desc = "Life essence droped by players, can be used to revive a teammate once enough has been collected.", 
        Max = 100, 
        Type = "Essence"
    }, 
    ["Hero's Costume"] = {
        tradeLevel = 0, 
        Rare = "Epic", 
        Desc = "A outfit worn by the strongest hero.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["Platinum Coat"] = {
        tradeLevel = 0, 
        Rare = "Epic", 
        Desc = "A coat worn by ORA ORA.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["Hero's Cape"] = {
        tradeLevel = 0, 
        Rare = "Epic", 
        Desc = "A cape worn by the strongest hero", 
        Max = 1, 
        Type = "Cape"
    }, 
    ["World Ender"] = {
        tradeLevel = 475, 
        Rare = "Legendary", 
        Desc = "Streaked in sinister crimson, this ancient construct yearns for the end of all creation. Be wary, for you are not its first vessel.", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Red Cloud Costume"] = {
        tradeLevel = 0, 
        Rare = "Epic", 
        Desc = "Red cloud costume worn by ninjas. ", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["Demon Corps Costume"] = {
        tradeLevel = 0, 
        Rare = "Epic", 
        Desc = "Outfit worn by demon hunters.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["Ten Tails Jinchuriki Costume"] = {
        tradeLevel = 0, 
        Rare = "Epic", 
        Desc = "White cloak worn by the strongest ninja. ", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["Vrael's Pipe"] = {
        tradeLevel = 475, 
        Rare = "Epic", 
        Desc = "A pipe used by the former marine Vrael", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Black Bull Costume"] = {
        tradeLevel = 0, 
        Rare = "Epic", 
        Desc = "Outfit worn by the captain of the black bulls. ", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["Ninja Costume"] = {
        tradeLevel = 0, 
        Rare = "Epic", 
        Desc = "Outfit worn by the strongest kage ", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["Thunder Haori"] = {
        tradeLevel = 0, 
        Rare = "Epic", 
        Desc = "A yellow haori. ", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["Itadori Costume"] = {
        tradeLevel = 0, 
        Rare = "Epic", 
        Desc = "Slim fit outfit. ", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["Legendary Fruit Chest"] = {
        tradeLevel = 75, 
        Rare = "Legendary", 
        Desc = "A legendary chest that contains a legendary or higher fruit!", 
        Max = 10, 
        Type = "FruitChest"
    }, 
    ["Rare Fruit Chest"] = {
        tradeLevel = 75, 
        Rare = "Rare", 
        Desc = "A rare chest that contains a rare or higher fruit!", 
        Max = 10, 
        Type = "FruitChest"
    }, 
    ["Sabo's Costume"] = {
        tradeLevel = 0, 
        Rare = "Epic", 
        Desc = "A outfit worn by sabo ", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["Firework Lancer"] = {
        tradeLevel = 475, 
        Limited = true, 
        Rare = "Legendary", 
        Desc = "An apt spear for the occasion. The Firework Lancer carries a near infinite stock of skyrockets to ennact its vibrant attacks.", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Inferno Rocket Blade"] = {
        tradeLevel = 475, 
        Limited = true, 
        Rare = "Legendary", 
        Desc = "The amalgamation of several relics across time; this gun has transcended the realm of conventionality and is starting to become a sword.", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Prestige Inferno Rocket Blade"] = {
        tradeLevel = 475, 
        Rare = "Collectable", 
        Desc = "The amalgamation of several relics across time; this gun has transcended the realm of conventionality and is starting to become a sword. It is more stylish than would normally be expected.<Color=Purple>[PRESTIGE]", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Prestige Firework Lancer"] = {
        tradeLevel = 475, 
        Rare = "Collectable", 
        Desc = "An apt spear for the occasion. The Firework Lancer carries a near infinite stock of skyrockets to ennact its vibrant attacks. Its flexible blades also assist in rocket propulson.<Color=Purple>[PRESTIGE]", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Anniversary Shawl"] = {
        tradeLevel = 275, 
        Limited = true, 
        Rare = "Rare", 
        Desc = "Gilded ceremonial wear from a distant land. Fancy but impractical.", 
        Max = 1, 
        Type = "Cape"
    }, 
    ["Anniversary Headband"] = {
        tradeLevel = 275, 
        Limited = true, 
        Rare = "Rare", 
        Desc = "A golden crown accessory adorned with rubies. Its creation commemorates an important occasion.", 
        Max = 1, 
        Type = "Headband"
    }, 
    ["Anniversary Dress"] = {
        tradeLevel = 275, 
        Limited = true, 
        Rare = "Rare", 
        Desc = "Gilded ornate dress for the elegant merrymaker. It even comes with shoes.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Anniversary Suit"] = {
        tradeLevel = 275, 
        Limited = true, 
        Rare = "Rare", 
        Desc = "Gilded ornate suit for the elegant merrymaker.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Iceborn Daggers"] = {
        tradeLevel = 475, 
        Limited = true, 
        Rare = "Legendary", 
        Desc = "Noble blades that once served a dedicated assassin. Years entombed in permafrost has done nothing to tarnish their lethality.", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Iceborn Rapier"] = {
        tradeLevel = 475, 
        Limited = true, 
        Rare = "Legendary", 
        Desc = "An instrument of chivalry reserved for the principled master. Santa hopes that players will be kind to each other this Christmas.", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Santa's Outfit Dripped"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "A outfit worn by santa", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["Santa's Reindeer Hat"] = {
        tradeLevel = 275, 
        Rare = "Rare", 
        Desc = "Exclusive hat worn by santa", 
        Max = 1, 
        Type = "Cap", 
        BattlePassItem = true
    }, 
    ["Nutcracker's Tall Hat"] = {
        tradeLevel = 275, 
        Rare = "Rare", 
        Desc = "A hat worn by a nutcracker", 
        Max = 1, 
        Type = "Cap", 
        BattlePassItem = true
    }, 
    ["Nutcracker's Outfit"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "A outfit worn by a nutcracker", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["Happy Elf Outfit"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "A outfit worn by a happy elf", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["Candy Cane Outfit"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "A outfit with a candycane on back]", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["Green Monster Outfit"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "A fuzy green outfit", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["Green Monster Hat"] = {
        tradeLevel = 275, 
        Rare = "Rare", 
        Desc = "Green monster hat", 
        Max = 1, 
        Type = "Cap", 
        BattlePassItem = true
    }, 
    ["UFO Beam"] = {
        tradeLevel = 275, 
        Rare = "Rare", 
        Desc = "A beam of ufo!", 
        Max = 10, 
        Type = "Grip"
    }, 
    Explosion = {
        tradeLevel = 275, 
        Rare = "Rare", 
        Desc = "EXPLOSION!!!!", 
        Max = 10, 
        Type = "Grip"
    }, 
    Deathball = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "An explosion of light", 
        Max = 10, 
        Type = "Grip"
    }, 
    KO = {
        tradeLevel = 275, 
        Rare = "Legendary", 
        Desc = "Knockout baby!", 
        Max = 10, 
        Type = "Grip"
    }, 
    Sentinel = {
        tradeLevel = 275, 
        Rare = "Legendary", 
        Desc = "Harness power of the Sentinels of Light!", 
        Max = 10, 
        Type = "Grip"
    }, 
    ["Venom Hydra"] = {
        tradeLevel = 275, 
        Rare = "Legendary", 
        Desc = "Overkill them with a venom hydra.", 
        Max = 10, 
        Type = "Grip"
    }, 
    ["Dirty Fireworks"] = {
        tradeLevel = 275, 
        Rare = "Legendary", 
        Desc = "Celebrate your victory with some fireworks!", 
        Max = 10, 
        Type = "Grip"
    }, 
    Blackhole = {
        tradeLevel = 275, 
        Rare = "Legendary", 
        Desc = "A celestial enigma that defies physics", 
        Max = 10, 
        Type = "Grip"
    }, 
    Kikoku = {
        tradeLevel = 475, 
        Rare = "Mythical", 
        Desc = "A cursed blade capable of harnessing the power of the Ope Ope no mi.", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Law's Cap"] = {
        tradeLevel = 475, 
        Rare = "Epic", 
        Desc = "A cap worn by the strong pirate Law", 
        Max = 1, 
        Type = "Cap", 
        Cosmetic = true
    }, 
    ["Law's Outfit"] = {
        tradeLevel = 475, 
        Rare = "Legendary", 
        Desc = "An outfit worn by the strong pirate Law", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Law's Cape"] = {
        tradeLevel = 475, 
        Rare = "Legendary", 
        Desc = "A cape worn by the strong pirate Law", 
        Max = 1, 
        Type = "Cape"
    }, 
    ["Scientist Outfit"] = {
        tradeLevel = 275, 
        Rare = "Rare", 
        Desc = "An outfit made for research.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Pica's Armor"] = {
        tradeLevel = 345, 
        Rare = "Legendary", 
        Desc = "Strong and durable armor worn by the giant Pica", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Pica's Helmet"] = {
        tradeLevel = 420, 
        Rare = "Epic", 
        Desc = "A strong and durable helmet worn by the giant Pica", 
        Max = 1, 
        Type = "Cap"
    }, 
    ["Cyborg Gear"] = {
        tradeLevel = 1, 
        Rare = "Uncommon", 
        Desc = "A metal gear that can be used by cyborgs for upgrades.", 
        Max = 500, 
        Type = "Item"
    }, 
    Susanoo = {
        tradeLevel = 275, 
        Rare = "Mythical", 
        Desc = "The Five kage are nothing compared to me.", 
        Max = 10, 
        Type = "Grip"
    }, 
    ["Donmingo's Outfit"] = {
        tradeLevel = 475, 
        Rare = "Legendary", 
        Desc = "An outfit worn by the tyrant Donmingo", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Donmingo's Shades"] = {
        tradeLevel = 475, 
        Rare = "Epic", 
        Desc = "An pair of shades worn by the tyrant Donmingo", 
        Max = 1, 
        Type = "Glasses"
    }, 
    ["Donmingo's Cape"] = {
        tradeLevel = 475, 
        Rare = "Legendary", 
        Desc = "A flamingo cape worn by the tyrant Donmingo", 
        Max = 1, 
        Type = "Cape"
    }, 
    ["AE10's Outfit"] = {
        tradeLevel = 475, 
        Rare = "Rare", 
        Desc = "An outfit worn by the Cyborg mechanic", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Bellom's Outfit"] = {
        tradeLevel = 475, 
        Rare = "Rare", 
        Desc = "An outfit worn by the pirate Bellom", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Bellom's Glasses"] = {
        tradeLevel = 475, 
        Rare = "Epic", 
        Desc = "Glases worn by the pirate Bellom", 
        Max = 1, 
        Type = "Glasses"
    }, 
    ["Mysterious Book"] = {
        tradeLevel = 1, 
        Rare = "Rare", 
        Desc = "A Mysterious Book that can reveal the secrets of the Poneglyphs.", 
        Max = 1, 
        Type = "Display"
    }, 
    ["String Dissection"] = {
        tradeLevel = 275, 
        Rare = "Legendary", 
        Desc = "Fatality.", 
        Max = 10, 
        Type = "Grip"
    }, 
    ["Pica Smash"] = {
        tradeLevel = 275, 
        Rare = "Legendary", 
        Desc = "Tag in Pica to finish them off!", 
        Max = 10, 
        Type = "Grip"
    }, 
    ["Ope Scramble"] = {
        tradeLevel = 275, 
        Rare = "Legendary", 
        Desc = "Perform your opponents last operation.", 
        Max = 10, 
        Type = "Grip"
    }, 
    ["Mythical Fruit Chest"] = {
        tradeLevel = 1, 
        Rare = "Mythical", 
        Desc = "A Mythical chest that contains a Mythical fruit!", 
        Max = 10, 
        Type = "FruitChest"
    }, 
    ["Gladiator's Cape"] = {
        tradeLevel = 420, 
        Limited = true, 
        Rare = "Epic", 
        Desc = "A cape worn by the gladiators of the Rose Kingdom", 
        Max = 1, 
        Type = "Cape"
    }, 
    ["Gladiator's Helmet"] = {
        tradeLevel = 420, 
        Rare = "Rare", 
        Desc = "Helmet worn by Gladiators at Rose Kingdom", 
        Max = 1, 
        Type = "Cap"
    }, 
    ["Gladiator's Armor"] = {
        tradeLevel = 420, 
        Rare = "Epic", 
        Desc = "Armor worn by gladiators", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Lucy's Outfit"] = {
        tradeLevel = 420, 
        Rare = "Epic", 
        Desc = "Armor worn by the infamous pirate Lucy", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Lucy's Helmet"] = {
        tradeLevel = 420, 
        Rare = "Rare", 
        Desc = "Helmet worn by the infamous pirate Lucy", 
        Max = 1, 
        Type = "Cap"
    }, 
    ["Lucy's Cape"] = {
        tradeLevel = 420, 
        Limited = true, 
        Rare = "Epic", 
        Desc = "A cape worn by the infamous pirate Lucy", 
        Max = 1, 
        Type = "Cape"
    }, 
    ["Raylo's Outfit"] = {
        tradeLevel = 420, 
        Rare = "Epic", 
        Desc = "An outfit worn by the famed pirate Raylo", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        Cosmetic = true
    }, 
    Kurohitsugi = {
        tradeLevel = 275, 
        Rare = "Mythical", 
        Desc = "Seeping crest of turbidity. Arrogant vessel of lunacy! Boil forth and deny! Grow numb and flicker! Disrupt sleep! Crawling queen of iron! Eternally self-destructing doll of mud! Unite! Repulse! Fill with soil and know your own powerlessness!", 
        Max = 10, 
        Type = "Grip"
    }, 
    ["Planetary Devastation"] = {
        tradeLevel = 275, 
        Rare = "Mythical", 
        Desc = "Chibaku Tensei!", 
        Max = 10, 
        Type = "Grip"
    }, 
    ["Meteor Strike"] = {
        tradeLevel = 275, 
        Rare = "Legendary", 
        Desc = "Not doomfist ult.", 
        Max = 10, 
        Type = "Grip"
    }, 
    ["Burning Body"] = {
        tradeLevel = 275, 
        Rare = "Rare", 
        Desc = "Ignited for 270 True damage.", 
        Max = 10, 
        Type = "Grip"
    }, 
    ["Donmingo Kid Outfit"] = {
        tradeLevel = 420, 
        Rare = "Epic", 
        Desc = "An outfit worn by a pirate of Donmingo's crew", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Donmingo Kid Hat"] = {
        tradeLevel = 420, 
        Rare = "Epic", 
        Desc = "Hat worn by a pirate of Donmingo's crew", 
        Max = 1, 
        Type = "Cap"
    }, 
    Reaver = {
        tradeLevel = 275, 
        Rare = "Legendary", 
        Desc = "Drag them into the shadows", 
        Max = 10, 
        Type = "Grip"
    }, 
    Oni = {
        tradeLevel = 275, 
        Rare = "Legendary", 
        Desc = "Chain them to the ground with samurai blades. ", 
        Max = 10, 
        Type = "Grip"
    }, 
    ["Bari Sphere Crush"] = {
        tradeLevel = 275, 
        Rare = "Legendary", 
        Desc = "Trap and crush your opponent using a Barrier. ", 
        Max = 10, 
        Type = "Grip"
    }, 
    ["Lightning Strike"] = {
        tradeLevel = 275, 
        Rare = "Legendary", 
        Desc = "Summon a bolt of lightning that strikes your opponent. ", 
        Max = 10, 
        Type = "Grip"
    }, 
    ["Bomu Mines"] = {
        tradeLevel = 275, 
        Rare = "Legendary", 
        Desc = "Place a field of mines beneath your opponent that explode. ", 
        Max = 10, 
        Type = "Grip"
    }, 
    ["Ice Grip"] = {
        tradeLevel = 275, 
        Rare = "Legendary", 
        Desc = "Enclose your opponent in an Icy embrace. ", 
        Max = 10, 
        Type = "Grip"
    }, 
    ["Mero Grip"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "Fire a Love Burst into your opponent. ", 
        Max = 10, 
        Type = "Grip"
    }, 
    ["Paw Grip"] = {
        tradeLevel = 275, 
        Rare = "Legendary", 
        Desc = "Force upon your opponent pain and suffering. ", 
        Max = 10, 
        Type = "Grip"
    }, 
    ["Pika Grip"] = {
        tradeLevel = 275, 
        Rare = "Legendary", 
        Desc = "A burst of light that vaporizes your opponent. ", 
        Max = 10, 
        Type = "Grip"
    }, 
    ["Suna Grip"] = {
        tradeLevel = 275, 
        Rare = "Legendary", 
        Desc = "Drag your opponent into a sand vortex. ", 
        Max = 10, 
        Type = "Grip"
    }, 
    ["Tori Grip"] = {
        tradeLevel = 275, 
        Rare = "Legendary", 
        Desc = "Burn your opponent away using the Phoenix flames. . ", 
        Max = 10, 
        Type = "Grip"
    }, 
    ["Han's Outfit"] = {
        tradeLevel = 420, 
        Rare = "Epic", 
        Desc = "An outfit worn by the Guardian of floor 3.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Han's Hoodie"] = {
        tradeLevel = 420, 
        Rare = "Epic", 
        Desc = "An hoodie worn by the Guardian of floor 3", 
        Max = 1, 
        Type = "Cap"
    }, 
    ["Vera's Outfit"] = {
        tradeLevel = 475, 
        Rare = "Legendary", 
        Desc = "An outfit worn by the officer of Floor 5.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Vera's Outfit 2"] = {
        tradeLevel = 475, 
        Rare = "Legendary", 
        Desc = "An outfit worn by the officer of Floor 5.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Vera's Cap"] = {
        tradeLevel = 475, 
        Rare = "Epic", 
        Desc = "An cap worn by the officer of Floor 5.", 
        Max = 1, 
        Type = "Cap", 
        Cosmetic = true
    }, 
    ["Impel Guard Hat 1"] = {
        tradeLevel = 425, 
        Rare = "Uncommon", 
        Desc = "A hat worn by guards from Impel Down.", 
        Max = 1, 
        Type = "Cap"
    }, 
    ["Impel Guard Hat 2"] = {
        tradeLevel = 425, 
        Rare = "Uncommon", 
        Desc = "A hat worn by guards from Impel Down.", 
        Max = 1, 
        Type = "Cap"
    }, 
    ["Impel Guard Outfit"] = {
        tradeLevel = 420, 
        Rare = "Epic", 
        Desc = "An outfit worn by guards from Impel Down.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Impel Officier Outfit"] = {
        tradeLevel = 420, 
        Rare = "Epic", 
        Desc = "An outfit worn by guards from Impel Down.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Impel Officier Hat"] = {
        tradeLevel = 425, 
        Rare = "Uncommon", 
        Desc = "A hoodie worn by guards from Impel Down.", 
        Max = 1, 
        Type = "Cap"
    }, 
    ["Vera's Wings"] = {
        tradeLevel = 475, 
        Rare = "Epic", 
        Desc = "A pair of wings worn by Vera", 
        Max = 1, 
        Type = "Back"
    }, 
    ["Impel Guard Outfit 2"] = {
        tradeLevel = 420, 
        Rare = "Epic", 
        Desc = "An outfit worn by guards from Impel Down.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Shiryu's Outfit"] = {
        tradeLevel = 420, 
        Rare = "Epic", 
        Desc = "An outfit worn an infamous Officer from Impel Down.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Shiryu's Hat"] = {
        tradeLevel = 425, 
        Rare = "Epic", 
        Desc = "A hat worn by an infamous Officer from Impel Down.", 
        Max = 1, 
        Type = "Cap"
    }, 
    ["Shiryu's Cape"] = {
        tradeLevel = 425, 
        Rare = "Epic", 
        Desc = "A cape worn by an infamous Officer from Impel Down", 
        Max = 1, 
        Type = "Cape"
    }, 
    Raiui = {
        tradeLevel = 475, 
        Rare = "Legendary", 
        Desc = "A blade of simple shape, and high quality. Capable of slashing through many powerful opponents.", 
        Max = 3, 
        Type = "Katana", 
        isKatana = true
    }, 
    ["Black Pitchfork"] = {
        tradeLevel = 475, 
        Rare = "Legendary", 
        Desc = "Black pitch fork used by one of the Officers of Impel Down.", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Vera's Whip"] = {
        tradeLevel = 420, 
        Rare = "Legendary", 
        Desc = "A specialized weapon to discipline prisoners.", 
        Max = 1, 
        Type = "Katana"
    }, 
    Kessui = {
        tradeLevel = 475, 
        Rare = "Legendary", 
        Desc = "A double edged weapon used by a impel guard.", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Ulquiorra Outfit"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "An outfit worn by the 4th Espada", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["Soul Captain Outfit"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "An outfit to signify a captain's status", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["Ichigo War Outfit"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "An outfit worn by the Chosen One", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["Soul Trainer Outfit"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "An outfit worn by Soul Reapers", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["Soul Trainer Robes"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "A robe worn by Soul Reapers", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["Grimmjow Outfit"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "An outfit worn by the 6th Espada", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["Kenpachi Outfit"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "An outfit worn by the Strongest", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["Kisuke Outfit"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "An outfit worn by a Genius", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["Ichigo Robes"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "An outfit worn by the Chosen One", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["Marine Officer Outfit"] = {
        tradeLevel = 475, 
        Rare = "Epic", 
        Desc = "An outfit worn by a Marine Officer.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        Untradeable = true
    }, 
    ["Marine Lieutenant Outfit"] = {
        tradeLevel = 475, 
        Rare = "Epic", 
        Desc = "An outfit worn by a Marine Lieutenant.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        Untradeable = true
    }, 
    ["Marine Commander Outfit"] = {
        tradeLevel = 475, 
        Rare = "Epic", 
        Desc = "An outfit worn by a Marine Commander.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        Untradeable = true
    }, 
    ["Marine Commander Cape"] = {
        tradeLevel = 475, 
        Rare = "Epic", 
        Desc = "A cape worn by a Marine Commander.", 
        Max = 1, 
        Type = "Cape", 
        Untradeable = true
    }, 
    ["Marine Captain Cape 2"] = {
        tradeLevel = 475, 
        Rare = "Epic", 
        Desc = "Another cape worn by a Marine Commander.", 
        Max = 1, 
        Type = "Cape", 
        Untradeable = true
    }, 
    ["Marine Rear Admiral Outfit"] = {
        tradeLevel = 475, 
        Rare = "Epic", 
        Desc = "An outfit worn by a Marine Rear Admiral.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        Untradeable = true
    }, 
    ["Marine Captain Outfit"] = {
        tradeLevel = 475, 
        Rare = "Epic", 
        Desc = "An outfit worn by a Marine Captain.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        Untradeable = true
    }, 
    ["True Ba'al's Guard"] = {
        tradeLevel = 475, 
        Rare = "Legendary", 
        Desc = "A remnant of the True Demon Ba'al's true form", 
        Max = 1, 
        Type = "Back"
    }, 
    ["True Ba'al's Snake Head"] = {
        tradeLevel = 475, 
        Rare = "Legendary", 
        Desc = "A remnant of the True Demon Ba'al's true form", 
        Max = 1, 
        Type = "Cap"
    }, 
    ["Stark Gun"] = {
        tradeLevel = 475, 
        Rare = "Legendary", 
        Desc = "Unique Weapons that fire Ceros.", 
        Max = 1, 
        Type = "Katana", 
        GunM1 = true
    }, 
    ["Hollow's Halberd"] = {
        tradeLevel = 475, 
        Rare = "Legendary", 
        Desc = "A Halberd containing mystical powers derived from Halloween", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Resurrected Ba'al's Outfit"] = {
        tradeLevel = 420, 
        Rare = "Epic", 
        Desc = "An outfit worn by Resurrected Ba'al.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Wandering Soul"] = {
        tradeLevel = 300, 
        Rare = "Common", 
        Desc = "A wandering soul", 
        Max = 100, 
        Type = "Artifact"
    }, 
    ["Hollow's Great Sword"] = {
        tradeLevel = 475, 
        Rare = "Legendary", 
        Desc = "A Greatsword containing mystical powers derived from Halloween.", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Resurrected Ba'al's Head"] = {
        tradeLevel = 475, 
        Rare = "Legendary", 
        Desc = "The head of the Demon Ba'al.", 
        Max = 1, 
        Type = "Head"
    }, 
    ["Resurrected Ba'al's Head 2.0"] = {
        tradeLevel = 475, 
        Rare = "Legendary", 
        Desc = "The head of the Demon Ba'al.", 
        Max = 1, 
        Type = "Head"
    }, 
    ["Spirit Color Essence"] = {
        tradeLevel = 0, 
        Rare = "Epic", 
        Desc = "Absorb the essence to recolor your Spirit", 
        Max = 10, 
        Type = "Essence"
    }, 
    ["Firework Daggers"] = {
        tradeLevel = 475, 
        Rare = "Legendary", 
        Desc = "A pair of finely crafted daggers that turns strikes into dazzling displays of fireworks.", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Prestige Firework Daggers"] = {
        tradeLevel = 475, 
        Rare = "Collectable", 
        Desc = "A pair of finely crafted daggers that turns strikes into dazzling displays of fireworks. <Color=Purple>[PRESTIGE]", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Iceborn Blade"] = {
        tradeLevel = 475, 
        Limited = true, 
        Rare = "Legendary", 
        Desc = "A sword that harnesses frigid winds and glacial snow, infusing its strike with the biting power of frost.", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Firework Rocket Launcher"] = {
        tradeLevel = 475, 
        Rare = "Legendary", 
        Desc = "A rocket launcher that shoots colorful fireworks on impact.", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Prestige Firework Rocket Launcher"] = {
        tradeLevel = 475, 
        Rare = "Collectable", 
        Desc = "A rocket launcher that shoots colorful fireworks on impact. <Color=Purple>[PRESTIGE]", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Anniversary Dress 2023"] = {
        tradeLevel = 275, 
        Limited = true, 
        Rare = "Rare", 
        Desc = "A white dazzling dress decorated with delicate luminescent stars that seem to twinkle.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Iceborn Katana"] = {
        tradeLevel = 275, 
        Rare = "Legendary", 
        Desc = "A katana that's as cold and as sharp as a winter's breath.", 
        Max = 3, 
        Type = "Katana"
    }, 
    ["Anniversary Suit 2023"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "A white, long, and dominantly white coat decorated with stars", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Rocky's Mysterious Hat"] = {
        tradeLevel = 475, 
        Rare = "Epic", 
        Desc = "Stylized hat from the supreme evil giftbox boss, Rocky.", 
        Max = 1, 
        Type = "Cap"
    }, 
    ["Rocky's Vicious Top Hat"] = {
        tradeLevel = 475, 
        Rare = "Epic", 
        Desc = "Vicious Stylized tophat from the supreme evil giftbox boss, Rocky.", 
        Max = 1, 
        Type = "Cap"
    }, 
    ["Festive Merry Dress"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "A red dress with with stripes, decorated with snowflakes that embodies the spirits of Christmas.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["Snow Detective Outfit"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "A cozy black, stealthy outfit that has white fur to serve as insulation.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["Festive Snow Dress"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "A black dress thats covered in snow.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["Frosty Festive Dress"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "A red dress with a white fur trim and a large buckle that embodies the spirits of Christmas.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["Merry Dress"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "A red dress with white fur trim filled with the joyous Christmas spirit.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["Chill Hoodie"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "A cool comfy hoodie with a slick ice design.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["Xmas Outfit"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "A cool comfy outfit.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["Snow Detective Cap"] = {
        tradeLevel = 475, 
        Rare = "Epic", 
        Desc = "A comfy cap that keeps detectives warm during the cold.", 
        Max = 1, 
        Type = "Cap"
    }, 
    ["Festive Snow Antlers"] = {
        tradeLevel = 475, 
        Rare = "Epic", 
        Desc = "Deer antlers with festive, and glittering Christmas ornaments hang from it", 
        Max = 1, 
        Type = "Cap"
    }, 
    ["Festive Merry Dress Beanie"] = {
        tradeLevel = 475, 
        Rare = "Epic", 
        Desc = "A festive, red beanie that keeps the top of your head warm!", 
        Max = 1, 
        Type = "Cap"
    }, 
    ["Festive Merry Dress Hat"] = {
        tradeLevel = 475, 
        Rare = "Epic", 
        Desc = "A classic and festive hat, decorated with holiday cheers and a little white pom pom at the tip.", 
        Max = 1, 
        Type = "Cap"
    }, 
    ["Frosty Festive Dress Hat"] = {
        tradeLevel = 475, 
        Rare = "Epic", 
        Desc = "A classic and festive hat, decorated with holiday cheers.", 
        Max = 1, 
        Type = "Cap"
    }, 
    Blackvalk = {
        tradeLevel = 425, 
        Rare = "Mythical", 
        Desc = "Exclusive item from the crew shop!", 
        Max = 1, 
        Type = "Ears"
    }, 
    ["Valkyrie Helm"] = {
        tradeLevel = 425, 
        Limited = true, 
        Rare = "Legendary", 
        Desc = "Exclusive item from the crew shop!", 
        Max = 1, 
        Type = "Ears"
    }, 
    ["Flower Sword"] = {
        tradeLevel = 475, 
        Rare = "Legendary", 
        Desc = "A flower sword!", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Purple Star Egghead"] = {
        tradeLevel = 475, 
        Rare = "Epic", 
        Desc = "Easter egghead from 2024 event.", 
        Max = 1, 
        Type = "Head", 
        HideHair = true
    }, 
    ["Purple Squiggly Egghead"] = {
        tradeLevel = 475, 
        Rare = "Epic", 
        Desc = "Easter egghead from 2024 event.", 
        Max = 1, 
        Type = "Head", 
        HideHair = true
    }, 
    ["Green n Orange Egghead"] = {
        tradeLevel = 475, 
        Rare = "Epic", 
        Desc = "Easter egghead from 2024 event.", 
        Max = 1, 
        Type = "Head", 
        HideHair = true
    }, 
    ["Purple n Blue Egghead"] = {
        tradeLevel = 475, 
        Rare = "Epic", 
        Desc = "Easter egghead from 2024 event.", 
        Max = 1, 
        Type = "Head", 
        HideHair = true
    }, 
    ["Orange Dots Egghead"] = {
        tradeLevel = 475, 
        Rare = "Epic", 
        Desc = "Easter egghead from 2024 event.", 
        Max = 1, 
        Type = "Head", 
        HideHair = true
    }, 
    ["Shark Blood Bottle Blueprint"] = {
        tradeLevel = 325, 
        Rare = "Rare", 
        Desc = "Crafting Blueprint for Shark Blood Bottle", 
        Max = 5, 
        Type = "Display"
    }, 
    ["Megalodon Armor Set Blueprint"] = {
        tradeLevel = 325, 
        Rare = "Rare", 
        Desc = "Crafting Blueprint for Shark Blood Bottle", 
        Max = 1, 
        Type = "Display"
    }, 
    ["Boneshiver Blueprint"] = {
        tradeLevel = 325, 
        Rare = "Rare", 
        Desc = "Crafting Blueprint for Shark Blood Bottle", 
        Max = 1, 
        Type = "Display"
    }, 
    ["Legendary Fruit Chest Blueprint"] = {
        tradeLevel = 325, 
        Rare = "Legendary", 
        Desc = "Crafting Blueprint for Legendary Chest", 
        Max = 5, 
        Type = "Display"
    }, 
    ["Shark Blood Bottle"] = {
        tradeLevel = 350, 
        Rare = "Epic", 
        Desc = "Contains the blood of sharks", 
        Max = 5, 
        Type = "Artifact"
    }, 
    ["Megalodon Teeth"] = {
        tradeLevel = 350, 
        Rare = "Rare", 
        Desc = "A tooth dropped form a Megalodon", 
        Max = 10, 
        Type = "Display"
    }, 
    ["Megalodon Armor Set"] = {
        tradeLevel = 345, 
        Rare = "Legendary", 
        Desc = "Armor forged from upgrading a Kraken Armor Set with Megalodon Teeth. This armor reduces incoming damage by a base of <Color=Blue>1%<Color=/> + <Color=Blue>.75%<Color=/> for every <Color=Yellow>100<Color=/> levels with a maxium of 15% and provides <Color=Blue>3+<Color=/> stamina regen along with <Color=Green>150<Color=/> extra HP", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Egg Phone"] = {
        tradeLevel = 1, 
        Rare = "Rare", 
        Desc = "A egg phone that gives you info on the current eggs in the server", 
        Max = 1, 
        Type = "Artifact"
    }, 
    ["Egg Phone Blueprint"] = {
        tradeLevel = 1, 
        Rare = "Rare", 
        Desc = "Crafting Blueprint for Egg Phone", 
        Max = 1, 
        Type = "Display"
    }, 
    ["Megalodon Helmet"] = {
        tradeLevel = 425, 
        Rare = "Legendary", 
        Desc = "A helmet crafted from Megalodon teeth,Slayer's Mask and a bit of shark blood.", 
        Max = 1, 
        Type = "Cap", 
        HideHair = true
    }, 
    ["Megalodon Helmet Blueprint"] = {
        tradeLevel = 325, 
        Rare = "Rare", 
        Desc = "Crafting Blueprint for Shark Blood Bottle", 
        Max = 1, 
        Type = "Display"
    }, 
    ["Yukio The Bunny"] = {
        tradeLevel = 325, 
        Rare = "Legendary", 
        Desc = "A bunny obtained from the 2024 easter event!", 
        Max = 1, 
        Type = "Shoulder"
    }, 
    ["Dark Blade"] = {
        tradeLevel = 425, 
        Rare = "Mythical", 
        Desc = "A mythical blade wielded by the strongest swords men.", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Honored Sorcerer Costume"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "A distinguished and comfortable attire fit for a revered sorcerer.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["Krakatoa Curse Costume"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "A fiery and cursed outfit emenating heat.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true, 
        HideHair = true
    }, 
    ["Sorcerer Hunter Costume"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "The perfect attire for those who hunt down sorcerers.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["Prodigy Sorcerer Costume"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "A stylish and comfortable outfit for a young sorcerer prodigy.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["King Of Curses Costume"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "A dignified and intimidating attire for the ruler of all curses.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["Blood Sorcerer Costume"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "An outfit that exudes power and control over blood magic.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["Panda Costume"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "A unique and adorable costume for a panda sorcerer.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true, 
        HideHair = true
    }, 
    ["Frozen Star's Kimono"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "A beautifully crafted kimono with the chill of a frozen star.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["Roger's Outfit"] = {
        tradeLevel = 425, 
        Rare = "Legendary", 
        Desc = "A outfit worn by roger", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Roger's Hat"] = {
        tradeLevel = 425, 
        Rare = "Legendary", 
        Desc = "A hat worn by roger", 
        Max = 1, 
        Type = "Cap"
    }, 
    ["Hawk Eye's Outfit"] = {
        tradeLevel = 425, 
        Rare = "Legendary", 
        Desc = "A outfit worn by Hawk Eye", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Hawk Eye's Hat"] = {
        tradeLevel = 425, 
        Rare = "Legendary", 
        Desc = "A hat worn by Hawk Eye", 
        Max = 1, 
        Type = "Cap"
    }, 
    ["Triple Stongest Slash Skill Scroll"] = {
        tradeLevel = 300, 
        Rare = "Epic", 
        Desc = "A scroll that will teach you the triple strongest slash skill.", 
        Max = 1, 
        Type = "Artifact"
    }, 
    ["Prestige Dark Blade"] = {
        tradeLevel = 9999, 
        Rare = "Collectable", 
        Desc = "A black/white version of the dark blade.", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Roger's Ace"] = {
        tradeLevel = 425, 
        Rare = "Mythical", 
        Desc = "A mythical blade once wielded by the King of the Pirates.", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Inverted Spear of Heaven"] = {
        tradeLevel = 425, 
        Rare = "Legendary", 
        Desc = "Wielded by the Sorcerer Hunter", 
        Max = 1, 
        Type = "Katana"
    }, 
    Amaterasu = {
        tradeLevel = 275, 
        Rare = "Mythical", 
        Desc = "Black flames.", 
        Max = 10, 
        Type = "Grip"
    }, 
    ["Mummy Wrappings"] = {
        tradeLevel = 75, 
        Rare = "Rare", 
        Desc = "A outfit worn by a mummy", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Radiant Admiral's Outfit"] = {
        tradeLevel = 250, 
        Rare = "Legendary", 
        Desc = "An outfit worn by the Radiant Admiral", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Radiant Shades"] = {
        tradeLevel = 475, 
        Rare = "Epic", 
        Desc = "Shades worn by the Radiant Admiral", 
        Max = 1, 
        Type = "Glasses"
    }, 
    ["Radiant Admiral's Cape"] = {
        tradeLevel = 250, 
        Rare = "Legendary", 
        Desc = "An cape worn by the Radiant Admiral", 
        Max = 1, 
        Type = "Cape"
    }, 
    ["Candy Basket 2024"] = {
        tradeLevel = 100, 
        Limited = true, 
        Rare = "Rare", 
        Desc = "A pumpkin candy basket that lets you collect candies!", 
        Max = 1, 
        Type = "CandyBasket"
    }, 
    ["Ashen's Outfit"] = {
        tradeLevel = 250, 
        Rare = "Legendary", 
        Desc = "An outfit worn by the Ashen", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Ashen's Cape"] = {
        tradeLevel = 250, 
        Rare = "Legendary", 
        Desc = "An cape worn by the Ashen", 
        Max = 1, 
        Type = "Cape"
    }, 
    Jitte = {
        tradeLevel = 425, 
        Rare = "Epic", 
        Desc = "Ashen's trusted weapon, built to subdue and disarm foes with precision and control. Forged with seastone.", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Blood Scythe"] = {
        tradeLevel = 425, 
        Rare = "Legendary", 
        Desc = "A sinister weapon forged in darkness, its sharp edge cuts through enemies with eerie precision", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Candy Corn Basket"] = {
        tradeLevel = 100, 
        Limited = true, 
        Rare = "Rare", 
        Desc = "A festive candy corn-themed basket that lets you collect up to 500 candies!", 
        Max = 1, 
        Type = "CandyBasket", 
        MaxCandy = 500
    }, 
    ["Pumpkin Bag"] = {
        tradeLevel = 100, 
        Limited = true, 
        Rare = "Rare", 
        Desc = "A small pumpkin bag, perfect for gathering up to 100 candies on your Halloween adventures!", 
        Max = 1, 
        Type = "CandyBasket", 
        MaxCandy = 100
    }, 
    ["Pumpkin Basket"] = {
        tradeLevel = 100, 
        Limited = true, 
        Rare = "Rare", 
        Desc = "A medium-sized pumpkin basket designed to hold up to 250 candies during spooky events!", 
        Max = 1, 
        Type = "CandyBasket", 
        MaxCandy = 250
    }, 
    ["Titan of Justice's Outfit"] = {
        tradeLevel = 450, 
        Rare = "Legendary", 
        Desc = "An outfit worn by the mighty Titan of Justice, symbolizing strength and unshakable resolve.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Titan of Justice's Cape"] = {
        tradeLevel = 450, 
        Rare = "Legendary", 
        Desc = "A legendary cape worn by the Titan of Justice, representing the weight of duty and power.", 
        Max = 1, 
        Type = "Cape"
    }, 
    ["Joker Costume"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "A fun and mischievous costume, perfect for causing Halloween chaos in style.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Plague Doctor Costume"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "A spooky Halloween costume inspired by the eerie Plague Doctor. Ideal for creeping through haunted nights.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        HideHair = true
    }, 
    ["Ghost Face Costume"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "A classic Ghost Face Halloween costume, great for blending into the shadows and scaring others!", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        HideHair = true
    }, 
    ["Sunken Armor"] = {
        tradeLevel = 375, 
        Rare = "Legendary", 
        Desc = "A legendary set fished up from the ocean's depths, offering incredible defense, imbued with the power of the sea.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Sunken Armor Helmet"] = {
        tradeLevel = 425, 
        Rare = "Legendary", 
        Desc = "A rare helm retrieved from the deep, providing strong protection and rumored to hold oceanic power.", 
        Max = 1, 
        Type = "Cap", 
        HideHair = true
    }, 
    ["Sunken Anchor"] = {
        tradeLevel = 425, 
        Rare = "Legendary", 
        Desc = "A legendary anchor fished up from the ocean's depths.", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Fishing Rod"] = {
        tradeLevel = 0, 
        Rare = "Common", 
        Desc = "A basic fishing rod", 
        Max = 1, 
        Type = "Fishing Rod"
    }, 
    ["Rare Fishing Rod"] = {
        tradeLevel = 75, 
        Rare = "Rare", 
        Desc = "A Rare fishing rod", 
        Max = 1, 
        Type = "Fishing Rod"
    }, 
    ["Epic Fishing Rod"] = {
        tradeLevel = 125, 
        Rare = "Epic", 
        Desc = "An Epic fishing rod", 
        Max = 1, 
        Type = "Fishing Rod"
    }, 
    ["Nightfall Shroud"] = {
        tradeLevel = 275, 
        Rare = "Collectable", 
        Desc = "A cloak woven from shadows, the Nightfall Shroud wraps you in an aura of mystery and darkness.", 
        Max = 1, 
        Type = "Outfit", 
        Limited = true, 
        Shirt = true, 
        Pants = true
    }, 
    ["Stench of the Deep"] = {
        tradeLevel = 350, 
        Rare = "Epic", 
        Desc = "Drink this to avoid seabeasts spawning on you for 5 mins", 
        Max = 5, 
        Type = "Drink"
    }, 
    ["Haunted Seeking Pumpkin"] = {
        tradeLevel = 275, 
        Rare = "Legendary", 
        Desc = "Haunted Falling Pumpkin", 
        Max = 1, 
        Type = "Grip", 
        Rollable = false, 
        CustomMax = 1
    }, 
    ["Victorious Claws"] = {
        tradeLevel = 425, 
        Rare = "Legendary", 
        Desc = "Victorious Claws", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Fading Crows"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "Fading Crows", 
        Max = 1, 
        Type = "Grip"
    }, 
    ["Gingerbread Costume"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "A distinguished and comfortable attire fit for a revered sorcerer.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true, 
        HideHair = true
    }, 
    ["Reindeer Costume"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "A distinguished and comfortable attire fit for a revered sorcerer.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true, 
        HideHair = true
    }, 
    ["Frost Scout Outfit"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "A distinguished and comfortable attire fit for a revered sorcerer.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["Frostspire Noble Outfit"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "A distinguished and comfortable attire fit for a revered sorcerer.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["Holly Jolly Female Outfit"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "A distinguished and comfortable attire fit for a revered sorcerer.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["Holly Jolly Male Outfit"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "A distinguished and comfortable attire fit for a revered sorcerer.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["Frostspire Marshal Outfit"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "A distinguished and comfortable attire fit for a revered sorcerer.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["Frostspire Dress"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "A distinguished and comfortable attire fit for a revered sorcerer.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["Snowfall Santa Outfit"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "A distinguished and comfortable attire fit for a revered sorcerer.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["Holly Jolly Coat"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "A distinguished and comfortable attire fit for a revered sorcerer.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["Frostspire Hood"] = {
        tradeLevel = 250, 
        Rare = "Legendary", 
        Desc = "Frostspire Hood", 
        Max = 1, 
        Type = "Cape"
    }, 
    ["Gift Explosion"] = {
        tradeLevel = 275, 
        Rare = "Legendary", 
        Desc = "Gift Explosion", 
        Max = 1, 
        Type = "Grip", 
        Rollable = false, 
        CustomMax = 1
    }, 
    ["Candy Cane Blossom"] = {
        tradeLevel = 275, 
        Rare = "Legendary", 
        Desc = "Candy Cane Blossom", 
        Max = 1, 
        Type = "Grip", 
        Rollable = false, 
        CustomMax = 1
    }, 
    ["Frostspire Storm"] = {
        tradeLevel = 275, 
        Rare = "Legendary", 
        Desc = "Frostspire Storm", 
        Max = 1, 
        Type = "Grip", 
        Rollable = false, 
        CustomMax = 1
    }, 
    ["Iceborn Gunblade"] = {
        tradeLevel = 425, 
        Rare = "Legendary", 
        Desc = "A sleek hybrid of rifle and sword, its blade and barrel encased in translucent ice.", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Snowcap Scepter"] = {
        tradeLevel = 425, 
        Rare = "Legendary", 
        Desc = "A twisted candy-cane staff topped with a ghostly snowman\226\128\153s head, wearing a tiny top hat and glowing from within.", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Crimson Fang Katana"] = {
        tradeLevel = 475, 
        Rare = "Legendary", 
        Desc = "A sleek katana with a dark, gently curved blade. Its handle is wrapped in deep red and black, and the matching scabbard gives it a fierce, elegant presence.", 
        Max = 3, 
        Type = "Katana"
    }, 
    ["Shattered Fang Katana"] = {
        tradeLevel = 475, 
        Rare = "Legendary", 
        Desc = "A chipped, jagged-edged blade wrapped in pale white. Its uneven silhouette and battle-worn grip hint at countless hard-fought victories.", 
        Max = 3, 
        Type = "Katana"
    }, 
    ["Amethyst Fang Katana"] = {
        tradeLevel = 475, 
        Rare = "Legendary", 
        Desc = "Elegant purple katana with gold star motifs and red wrappings. Regal and powerful design.", 
        Max = 3, 
        Type = "Katana"
    }, 
    ["Zorana's Haori"] = {
        tradeLevel = 475, 
        Rare = "Legendary", 
        Desc = "Outfit worn by Zorana the 3SS founder.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Zorana's Robe"] = {
        tradeLevel = 475, 
        Rare = "Legendary", 
        Desc = "Outfit worn by Zorana the 3SS founder.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Turtleback Armor"] = {
        tradeLevel = 475, 
        Rare = "Legendary", 
        Desc = "Armor worn by Juzo the Diamondback", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Turtleback Helmet"] = {
        tradeLevel = 425, 
        Rare = "Legendary", 
        Desc = "Helmet worn by Juzo the Diamondback", 
        Max = 1, 
        Type = "Cap"
    }, 
    ["Dominus Empyreus"] = {
        tradeLevel = 425, 
        Limited = true, 
        Rare = "Mythical", 
        Desc = "Exclusive item from the crew leaderboard!", 
        Max = 1, 
        Type = "Cap", 
        HideHair = true
    }, 
    ["Emerald Valkyrie"] = {
        tradeLevel = 425, 
        Rare = "Mythical", 
        Desc = "Exclusive item from the crew shop!", 
        Max = 1, 
        Type = "Ears"
    }, 
    ["Ice Valkyrie"] = {
        tradeLevel = 425, 
        Rare = "Legendary", 
        Desc = "Exclusive item from the crew shop!", 
        Max = 1, 
        Type = "Ears"
    }, 
    ["Violet Valkyrie"] = {
        tradeLevel = 425, 
        Rare = "Legendary", 
        Desc = "Exclusive item from the crew shop!", 
        Max = 1, 
        Type = "Ears"
    }, 
    ["Sparkle Time Valkyrie"] = {
        tradeLevel = 425, 
        Rare = "Mythical", 
        Desc = "Exclusive item from the crew shop!", 
        Max = 1, 
        Type = "Ears"
    }, 
    ["Cupid's Bow"] = {
        tradeLevel = 475, 
        Rare = "Legendary", 
        Desc = "A bow used by the cupid queen", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Exalted Cupid Queen Outfit"] = {
        tradeLevel = 425, 
        Limited = true, 
        Rare = "Collectable", 
        Desc = "A outfit worn by the Cupid Queen!", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Cupid Vanguard Outfit"] = {
        tradeLevel = 345, 
        Limited = true, 
        Rare = "Uncommon", 
        Desc = "Outfit worn by cupid vanguards", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Cupid Queen's Scarf"] = {
        tradeLevel = 475, 
        Rare = "Mythical", 
        Desc = "Scarf worn by the cupid queen", 
        Max = 1, 
        Type = "TorsoScarf"
    }, 
    ["Exalted Cupid Queen's Wings"] = {
        tradeLevel = 425, 
        Limited = true, 
        Rare = "Legendary", 
        Desc = "Wings form the Cupid Queen", 
        Max = 1, 
        Type = "Back"
    }, 
    ["Blessed Cupid's Bow"] = {
        cupidBlessed = true, 
        tradeLevel = 475, 
        Rare = "Collectable", 
        Desc = "A blessed bow used by the cupid queen", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Blessed Exalted Cupid Queen Outfit"] = {
        cupidBlessed = true, 
        tradeLevel = 425, 
        Limited = true, 
        Rare = "Collectable", 
        Desc = "A Blessed outfit worn by the Cupid Queen!", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Blessed Exalted Cupid Queen's Wings"] = {
        cupidBlessed = true, 
        radeLevel = 425, 
        Limited = true, 
        Rare = "Collectable", 
        Desc = "Blessed Wings form the Cupid Queen", 
        Max = 1, 
        Type = "Back"
    }, 
    ["Blessed Cupid Vanguard Outfit"] = {
        cupidBlessed = true, 
        tradeLevel = 425, 
        Limited = true, 
        Rare = "Collectable", 
        Desc = "A blessed outfit worn by cupid vanguards", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Blessed Cupid Queen's Scarf"] = {
        cupidBlessed = true, 
        tradeLevel = 475, 
        Rare = "Collectable", 
        Desc = "Blessed Scarf worn by the cupid queen", 
        Max = 1, 
        Type = "TorsoScarf"
    }, 
    ["Mega-Pow"] = {
        tradeLevel = 475, 
        Rare = "Legendary", 
        Desc = "A devastating hybrid of firepower, Mega-Pow combines a rapid-firing minigun in the front with an explosive rocket launcher in the back, delivering chaos with every shot.", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Anomalized Mega-Pow"] = {
        tradeLevel = 475, 
        Rare = "Collectable", 
        Desc = "A devastating hybrid of firepower, Mega-Pow combines a rapid-firing minigun in the front with an explosive rocket launcher in the back, delivering chaos with every shot.", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Supreme Giftbox Armor (Female)"] = {
        tradeLevel = 425, 
        Limited = true, 
        Rare = "Legendary", 
        Desc = "A armor dropped by Supreme Giftbox, Rocky!", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Supreme Giftbox Armor (Male)"] = {
        tradeLevel = 425, 
        Limited = true, 
        Rare = "Legendary", 
        Desc = "A armor dropped by Supreme Giftbox, Rocky!", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Supreme Giftbox Crown"] = {
        tradeLevel = 425, 
        Rare = "Epic", 
        Desc = "A crown dropped by Supreme Giftbox, Rocky!", 
        Max = 1, 
        Type = "Headband"
    }, 
    ["Supreme Giftbox Helmet"] = {
        tradeLevel = 425, 
        Rare = "Legendary", 
        Desc = "A helmet dropped by Supreme Giftbox, Rocky!", 
        Max = 1, 
        Type = "Cap", 
        HideHair = true
    }, 
    ["Supreme Giftbox, Rocky Shoulder Pet"] = {
        tradeLevel = 325, 
        Rare = "Legendary", 
        Desc = "ROCKY ON YOUR SHOULDER", 
        Max = 1, 
        Type = "Shoulder"
    }, 
    ["Chromatic All Seeing Eye"] = {
        tradeLevel = 0, 
        BaseItem = "All Seeing Eye", 
        Rare = "Mythical", 
        Desc = "The clairvoyant eye will locate and identify devil fruits as they spawn. <Color=Cyan>Grants the beholder 2x logia rates while in their possession.", 
        Max = 3, 
        Type = "ASESlot"
    }, 
    ["Clown Wig"] = {
        tradeLevel = 1, 
        Rare = "Epic", 
        Desc = "A clown", 
        Max = 1, 
        Type = "Jaw"
    }, 
    ["Epic Banana"] = {
        tradeLevel = 1, 
        Rare = "Epic", 
        Desc = "A Epic Banana", 
        Max = 1, 
        Type = "Cap"
    }, 
    ["Troll Face"] = {
        tradeLevel = 1, 
        Rare = "Epic", 
        Desc = "A Troll Face", 
        Max = 1, 
        Type = "Glasses"
    }, 
    ["Blo's Sledgehammer"] = {
        tradeLevel = 300, 
        Limited = true, 
        Rare = "Legendary", 
        Desc = "hammer used by big fat bunny brother", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Blo's Explosive Egg"] = {
        tradeLevel = 275, 
        Rare = "Legendary", 
        Desc = "Blo's Explosive Egg", 
        Max = 1, 
        Type = "Grip", 
        Rollable = false, 
        CustomMax = 1
    }, 
    ["Blo's Costume"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "Bunny costume", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        HideHair = true
    }, 
    ["Blue Star Egghead"] = {
        tradeLevel = 475, 
        Rare = "Epic", 
        Desc = "Easter egghead from 2025 event.", 
        Max = 1, 
        Type = "Head", 
        HideHair = true
    }, 
    ["Orange n Yellow Egghead"] = {
        tradeLevel = 475, 
        Rare = "Epic", 
        Desc = "Easter egghead from 2025 event.", 
        Max = 1, 
        Type = "Head", 
        HideHair = true
    }, 
    ["Peach Dots Egghead"] = {
        tradeLevel = 475, 
        Rare = "Epic", 
        Desc = "Easter egghead from 2025 event.", 
        Max = 1, 
        Type = "Head", 
        HideHair = true
    }, 
    ["Pink Squiggly Egghead"] = {
        tradeLevel = 475, 
        Rare = "Epic", 
        Desc = "Easter egghead from 2025 event.", 
        Max = 1, 
        Type = "Head", 
        HideHair = true
    }, 
    ["White Glowing Egghead"] = {
        tradeLevel = 475, 
        Rare = "Epic", 
        Desc = "Easter egghead from 2025 event.", 
        Max = 1, 
        Type = "Head", 
        HideHair = true
    }, 
    ["Blo Egghead"] = {
        tradeLevel = 475, 
        Rare = "Legendary", 
        Desc = "Easter egghead from 2025 event.", 
        Max = 1, 
        Type = "Head", 
        HideHair = true
    }, 
    ["All Seeing Egg"] = {
        tradeLevel = 0, 
        BaseItem = "All Seeing Eye", 
        Rare = "Mythical", 
        Desc = "The clairvoyant eye will locate and identify devil fruits as they spawn. <Color=Cyan>Grants the beholder 2x logia rates while in their possession.", 
        Max = 3, 
        Type = "ASESlot"
    }, 
    ["Bunny Costume"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "A unique and adorable costume", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true, 
        HideHair = true
    }, 
    ["Blo's Crimson Sledgehammer"] = {
        tradeLevel = 300, 
        BaseItem = "Blo's Sledgehammer", 
        Limited = true, 
        Rare = "Legendary", 
        Desc = "hammer used by big fat bunny brother", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Eggventurer's Attire"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "A festive outfit featuring bright suspenders and cozy overalls, perfect for springtime egg hunts and Easter celebrations.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["Eggventurer's Hat"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "A soft, patterned hat with floppy side flaps, perfect for keeping cozy during festive Easter adventures.", 
        Max = 1, 
        Type = "Cap", 
        BattlePassItem = true, 
        HideHair = true
    }, 
    ["Starry Bunny Pajamas"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "A festive outfit featuring bright suspenders and cozy overalls, perfect for springtime egg hunts and Easter celebrations.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["Starry Bunny Hood"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "A soft, patterned hat with floppy side flaps, perfect for keeping cozy during festive Easter adventures.", 
        Max = 1, 
        Type = "Cap", 
        BattlePassItem = true
    }, 
    ["Eggsplorer Jacket"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "A stylish pink jacket decorated with festive Easter eggs, perfect for casual springtime adventures.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    Chiikawa_Rig = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "A stylish pink jacket decorated with festive Easter eggs, perfect for casual springtime adventures.", 
        Max = 1, 
        Type = "CustomOutfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["Kumakawa Head"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "A soft, round creature with tiny ears and a cute, innocent smile that melts hearts.", 
        Max = 1, 
        Type = "Cap", 
        BattlePassItem = true, 
        HideHair = true
    }, 
    ["Usamii Head"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "A fluffy, round bunny with tall ears and a sweet, bashful expression.", 
        Max = 1, 
        Type = "Cap", 
        BattlePassItem = true, 
        HideHair = true
    }, 
    ["Cool Guy Egghead"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "A cool guy egg head!", 
        Max = 1, 
        Type = "Head", 
        BattlePassItem = true, 
        HideHair = true
    }, 
    ["Peli Explosion"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "Peli Explosion", 
        Max = 1, 
        Type = "Grip"
    }, 
    ["Lightning Discharge"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "Lightning Discharge", 
        Max = 1, 
        Type = "Grip"
    }, 
    Dismantle = {
        tradeLevel = 275, 
        Rare = "Legendary", 
        Desc = "Dismantle", 
        Max = 1, 
        Type = "Grip"
    }, 
    ["Bunyo The Bunny"] = {
        tradeLevel = 325, 
        Rare = "Legendary", 
        Desc = "A bunny obtained from the 2025 easter event!", 
        Max = 1, 
        Type = "Shoulder2"
    }, 
    ["Scout Trainee Uniform"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "Scout Trainee Uniform obtained from the rumbling event!", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["Recon Scout Uniform"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "Recon Scout Uniform obtained from the rumbling event!", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["Swordfish Rapier"] = {
        tradeLevel = 475, 
        Rare = "Legendary", 
        Desc = "A rapier crafted from the Swordfish", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Race Reroll"] = {
        tradeLevel = 1, 
        Rare = "Rare", 
        Desc = "A race reroll. Reroll your race in the main menu!", 
        Max = 200, 
        Type = "Display"
    }, 
    ["2x EXP"] = {
        tradeLevel = 1, 
        Rare = "Common", 
        Desc = "2x EXP", 
        Max = 200, 
        Type = "Display"
    }, 
    ["Nightfall Half Shroud"] = {
        tradeLevel = 275, 
        Rare = "Collectable", 
        Desc = "A cloak woven from shadows, the Nightfall Shroud wraps you in an aura of mystery and darkness.", 
        Max = 1, 
        Type = "Outfit", 
        Limited = true, 
        Shirt = true, 
        Pants = true
    }, 
    ["Swordfish Rapier Blueprint"] = {
        tradeLevel = 325, 
        Rare = "Rare", 
        Desc = "Crafting Blueprint for Shark Blood Bottle", 
        Max = 1, 
        Type = "Display"
    }, 
    Peli = {
        tradeLevel = 1, 
        Rare = "Common", 
        Desc = "Peli", 
        Max = v2.MaxPeli, 
        Type = "Display"
    }, 
    ["Star Clown's Cape"] = {
        tradeLevel = 55, 
        Rare = "Rare", 
        Desc = "A new star cape worn by the Star Clown", 
        Max = 1, 
        Type = "Cape"
    }, 
    ["Star Clown's Hat"] = {
        tradeLevel = 55, 
        Rare = "Rare", 
        Desc = "A clown hat worn by the Star Clown", 
        Max = 1, 
        Type = "Cap"
    }, 
    ["Star Clown's Outfit"] = {
        tradeLevel = 55, 
        Rare = "Rare", 
        Desc = "A outfit worn by the Star Clown", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Ghost Princess Outfit"] = {
        tradeLevel = 475, 
        Rare = "Epic", 
        Desc = "A outfit worn by the ghost princess", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Ghost Princess Capelet"] = {
        tradeLevel = 475, 
        Rare = "Epic", 
        Desc = "A capelet worn by the ghost princess", 
        Max = 1, 
        Type = "Cape"
    }, 
    ["Ghost Princess Crown"] = {
        tradeLevel = 475, 
        Rare = "Epic", 
        Desc = "A crown worn by the ghost princess", 
        Max = 1, 
        Type = "Cap"
    }, 
    ["Ghost Explosion"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "Ghost Explosion", 
        Max = 1, 
        Type = "Grip", 
        Rollable = false, 
        CustomMax = 1
    }, 
    ["Resurrected Ba'al's Outfit 2.0"] = {
        tradeLevel = 420, 
        Rare = "Epic", 
        Desc = "An outfit worn by Resurrected Ba'al.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Tailors Regalia"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "Tailor's Regalia", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Special Tailor Token"] = {
        tradeLevel = 1, 
        Rare = "Uncommon", 
        Desc = "A token that can be used to apply custom colors to accessories!", 
        Max = 1000, 
        Type = "Display"
    }, 
    ["True Ba'al's Horns"] = {
        tradeLevel = 475, 
        Rare = "Legendary", 
        Desc = "A remnant of the True Demon Ba'al's true form", 
        Max = 1, 
        Type = "Cap"
    }, 
    ["True Ba'al's Snake Fire"] = {
        tradeLevel = 275, 
        Rare = "Legendary", 
        Desc = "True Ba'al's Snake Fire", 
        Max = 1, 
        Type = "Grip", 
        Rollable = false, 
        CustomMax = 1
    }, 
    ["Ghost Princess's Umbrella"] = {
        tradeLevel = 425, 
        Rare = "Epic", 
        Desc = "A umbrella used by the ghost princess", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Desert Merchant Outfit"] = {
        tradeLevel = 325, 
        Rare = "Epic", 
        Desc = "An outfit worn by Desert Merchants", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        Cosmetic = true
    }, 
    ["Sea-Breeze Skirt"] = {
        tradeLevel = 325, 
        Rare = "Epic", 
        Desc = "A skirt", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        Cosmetic = true
    }, 
    ["Tari's Karoo Coat"] = {
        tradeLevel = 325, 
        Rare = "Epic", 
        Desc = "A coat worn by Tari", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        Cosmetic = true
    }, 
    ["Blossom Skirt"] = {
        tradeLevel = 325, 
        Rare = "Epic", 
        Desc = "A skirt", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        Cosmetic = true
    }, 
    ["Sea-Breeze Haori"] = {
        tradeLevel = 325, 
        Rare = "Epic", 
        Desc = "A haori", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        Cosmetic = true
    }, 
    ["Crimson Nightcoat"] = {
        tradeLevel = 325, 
        Rare = "Epic", 
        Desc = "A nightcoat", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        Cosmetic = true
    }, 
    ["Hollow's World Ender"] = {
        tradeLevel = 475, 
        Rare = "Legendary", 
        Desc = "Streaked in hollow green, this ancient construct yearns for the end of all creation. Be wary, for you are not its first vessel.", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Prestige World Ender"] = {
        tradeLevel = 475, 
        Rare = "Collectable", 
        Desc = "Streaked in spectral amethyst, this ancient construct yearns for the end of all creation. Be wary, for you are not its first vessel.<Color=Purple>[PRESTIGE]", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Jack-O'Rod"] = {
        tradeLevel = 175, 
        Rare = "Legendary", 
        Desc = "A halloween fishing rod crafted from hallloween fishes. Has <Color=Green>16%<Color=/> better handling than the <Rare=Epic>Epic Fishing Rod<Rare=/>! Has a <Color=Green>10%<Color=/> higher chance of luring <Color=Orange>halloween fishes!<Color=/>", 
        Max = 1, 
        Type = "Fishing Rod"
    }, 
    ["Jack-O'Rod Blueprint"] = {
        tradeLevel = 200, 
        Rare = "Epic", 
        Desc = "Crafting Blueprint for Jack-O'Rod", 
        Max = 1, 
        Type = "Display"
    }, 
    ["Skeletal Shark Mask"] = {
        tradeLevel = 250, 
        Rare = "Epic", 
        Desc = "A mask crafted from skeletal sharks", 
        Max = 1, 
        Type = "Jaw"
    }, 
    ["Dark Skeletal Shark Mask"] = {
        tradeLevel = 250, 
        Rare = "Legendary", 
        Desc = "A mask crafted from dark skeletal sharks", 
        Max = 1, 
        Type = "Jaw"
    }, 
    ["Skeletal Shark Mask Blueprint"] = {
        tradeLevel = 125, 
        Rare = "Rare", 
        Desc = "Crafting Blueprint for Jack-O'Rod", 
        Max = 1, 
        Type = "Display"
    }, 
    ["Dark Skeletal Shark Mask Blueprint"] = {
        tradeLevel = 125, 
        Rare = "Epic", 
        Desc = "Crafting Blueprint for Jack-O'Rod", 
        Max = 1, 
        Type = "Display"
    }, 
    ["Angler Rod"] = {
        tradeLevel = 175, 
        Rare = "Legendary", 
        Desc = "A rod crafted from many Anglerfish. Has <Color=Green>7%<Color=/> better handling than the <Rare=Epic>Epic Fishing Rod<Rare=/>! Has a <Color=Green>15%<Color=/> higher chance of fishing up <Rare=Legendary>Sunken Gear!<Rare=/>", 
        Max = 1, 
        Type = "Fishing Rod"
    }, 
    ["Angler Rod Blueprint"] = {
        tradeLevel = 200, 
        Rare = "Epic", 
        Desc = "Crafting Blueprint for Angler Rod", 
        Max = 1, 
        Type = "Display"
    }, 
    ["Merchants Banana Rod"] = {
        tradeLevel = 175, 
        Rare = "Legendary", 
        Desc = "A rod sold by the monkey merchant. Attracts fish faster.", 
        Max = 1, 
        Type = "Fishing Rod"
    }, 
    ["Angler's Lantern"] = {
        tradeLevel = 275, 
        Rare = "Legendary", 
        Desc = "Crafted from many Anglerfish. Provides good burn resistance.", 
        Max = 1, 
        Type = "Cap"
    }, 
    ["Angler's Lantern Blueprint"] = {
        tradeLevel = 200, 
        Rare = "Epic", 
        Desc = "Crafting Blueprint for Angler Lantern", 
        Max = 1, 
        Type = "Display"
    }, 
    ["Race Reroll Token"] = {
        tradeLevel = 1, 
        Rare = "Rare", 
        Desc = "A token that can be redeemed to get a race reroll. Use race rerolls in the main menu to reroll your race!", 
        Max = 1000, 
        Type = "Artifact"
    }, 
    ["Powderpunk Outfit"] = {
        tradeLevel = 250, 
        Rare = "Epic", 
        Desc = "A outfit worn by a jinxter", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        Cosmetic = true
    }, 
    ["Shadowrunner Mask"] = {
        tradeLevel = 250, 
        Rare = "Epic", 
        Desc = "A mask worn by a shadow runner", 
        Max = 1, 
        Type = "Jaw", 
        Cosmetic = true
    }, 
    ["Shadowrunner's Outfit"] = {
        tradeLevel = 250, 
        Rare = "Epic", 
        Desc = "A outfit worn by a shadow runner", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        Cosmetic = true
    }, 
    ["Wastelander Goggles"] = {
        tradeLevel = 250, 
        Rare = "Epic", 
        Desc = "Goggles worn by a wastelander", 
        Max = 1, 
        Type = "Glasses", 
        Cosmetic = true
    }, 
    ["Street Enforcer Outfit"] = {
        tradeLevel = 250, 
        Rare = "Epic", 
        Desc = "A outfit worn by street enforcers", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        Cosmetic = true
    }, 
    ["Battle Royale Champion's Cape"] = {
        tradeLevel = 250, 
        Rare = "Epic", 
        Desc = "A cape to prove you are a CHAMP", 
        Max = 1, 
        Type = "Cape", 
        AllowInBR = true, 
        Cosmetic = true
    }, 
    ["Battle Royale Champion's Crown"] = {
        tradeLevel = 250, 
        Rare = "Epic", 
        Desc = "A crown to prove you are a CHAMP", 
        Max = 1, 
        Type = "Cap", 
        AllowInBR = true, 
        Cosmetic = true
    }, 
    ["Battle Royale Champion's Monicle"] = {
        tradeLevel = 250, 
        Rare = "Epic", 
        Desc = "A monicle to prove you are a CHAMP", 
        Max = 1, 
        Type = "Jaw", 
        AllowInBR = true, 
        Cosmetic = true
    }, 
    ["Battle Royale Champion's Tophat"] = {
        tradeLevel = 250, 
        Rare = "Epic", 
        Desc = "A tophat to prove you are a CHAMP", 
        Max = 1, 
        Type = "Cap", 
        AllowInBR = true, 
        Cosmetic = true
    }, 
    ["All Seeing Ba'al"] = {
        tradeLevel = 0, 
        BaseItem = "All Seeing Eye", 
        Rare = "Mythical", 
        Desc = "The clairvoyant eye will locate and identify devil fruits as they spawn. <Color=Cyan>Grants the beholder 2x logia rates while in their possession.", 
        Max = 3, 
        Type = "ASESlot"
    }, 
    ["Devil Fruit Rod"] = {
        tradeLevel = 350, 
        Rare = "Mythical", 
        Desc = "A rod crafted from many <Rare=Legendary>Devil Fruits<Rare=/>. Has <Color=Green>25%<Color=/> better handling than the <Rare=Epic>Epic Fishing Rod<Rare=/>! Has a <Color=Green>35%<Color=/> chance of fishing up a <Rare=Epic>Devil Fruit<Rare=/> if the catch is a <Rare=Legendary>Legendary<Rare=/>, and they count towards <Rare=Epic>pity<Rare=/>!<Rare=/>", 
        Max = 1, 
        Type = "Fishing Rod"
    }, 
    ["Devil Fruit Rod Blueprint"] = {
        tradeLevel = 200, 
        Rare = "Epic", 
        Desc = "Crafting Blueprint for Angler Lantern", 
        Max = 1, 
        Type = "Display"
    }, 
    ["Endbringer Wings"] = {
        tradeLevel = 425, 
        Rare = "Legendary", 
        Desc = "Wings of a endbringer", 
        Max = 1, 
        Type = "Back"
    }, 
    ["Endbringer Armor"] = {
        tradeLevel = 475, 
        Rare = "Legendary", 
        Desc = "Armor worn by a endbringer", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Endbringer Armor2"] = {
        tradeLevel = 475, 
        Rare = "Legendary", 
        Desc = "Armor worn by a endbringer", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Sakamoto Glasses"] = {
        tradeLevel = 1, 
        Rare = "Collectable", 
        Desc = "Sakamoto Glasses", 
        Max = 1, 
        Type = "Glasses"
    }, 
    ["Tropical Parrot"] = {
        tradeLevel = 325, 
        Rare = "Legendary", 
        Desc = "A talking Tropical Parrot", 
        Max = 1, 
        Type = "Shoulder"
    }, 
    ["Pokko Outfit"] = {
        tradeLevel = 250, 
        Rare = "Epic", 
        Desc = "Pokko Outfit", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        Cosmetic = true, 
        AllowInBR = true
    }, 
    ["Founder's Outfit"] = {
        tradeLevel = 250, 
        Rare = "Epic", 
        Desc = "Founder's Outfit", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        Cosmetic = true, 
        AllowInBR = true
    }, 
    ["Iron Warrior Uniform"] = {
        tradeLevel = 250, 
        Rare = "Epic", 
        Desc = "Iron Warrior Uniform", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        Cosmetic = true, 
        AllowInBR = true
    }, 
    ["Scouts Cape"] = {
        tradeLevel = 250, 
        Rare = "Epic", 
        Desc = "Scouts Cape", 
        Max = 1, 
        Type = "Cape", 
        Cosmetic = true, 
        AllowInBR = true
    }, 
    ["Honored Soldiers Necklace"] = {
        tradeLevel = 250, 
        Rare = "Epic", 
        Desc = "Honored Soldiers Necklace", 
        Max = 1, 
        Type = "Jaw", 
        AllowInBR = true
    }, 
    ["ODM Rod"] = {
        tradeLevel = 350, 
        Rare = "Mythical", 
        Desc = "A rod obtained from a special event. Has <Color=Green>15%<Color=/> better handling than the <Rare=Epic>Epic Fishing Rod<Rare=/>! Has a <Color=Green>2%<Color=/> chance of transforming your catch into something a <Rare=Epic>Rarity Tier<Rare=/> higher, <Color=Red>excludes making fruits a tier higher<Color=/>.", 
        Max = 1, 
        Type = "Fishing Rod"
    }, 
    ["ODM Katana"] = {
        tradeLevel = 125, 
        Rare = "Epic", 
        Desc = "A ODM weapon", 
        Max = 3, 
        Type = "Katana"
    }, 
    ["Titan Researcher Goggles"] = {
        tradeLevel = 125, 
        Rare = "Epic", 
        Desc = "Titan Researcher Goggles", 
        Max = 1, 
        Type = "Glasses", 
        AllowInBR = true
    }, 
    ["Titan Shifters Aura"] = {
        tradeLevel = 125, 
        Rare = "Collectable", 
        Desc = "Titan Shifters Aura", 
        Max = 1, 
        Type = "Aura", 
        IsHat = true, 
        AllowInBR = true
    }, 
    ["Helix Skewer"] = {
        tradeLevel = 475, 
        Rare = "Legendary", 
        Desc = "A massive, spiraling greatsword with incredible reach, designed to wring the very essence from your enemies.", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Soul Cleaver"] = {
        tradeLevel = 475, 
        Rare = "Mythical", 
        Desc = "A colossal blade wielded by Big Mama, capable of cleaving both body and soul.", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Turkey Costume"] = {
        tradeLevel = 250, 
        Rare = "Epic", 
        Desc = "Limited time Turkey Costume sold by the Traveling Merchant", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        Cosmetic = true, 
        HideHair = true
    }, 
    ["Turkey Head"] = {
        tradeLevel = 250, 
        Rare = "Epic", 
        Desc = "Limited time Turkey Head sold by the Traveling Merchant", 
        Max = 1, 
        Type = "Head", 
        HideHair = true, 
        Cosmetic = true
    }, 
    ["Pilgrim Hat"] = {
        tradeLevel = 250, 
        Rare = "Epic", 
        Desc = "Limited time Pilgrim Hat sold by the Traveling Merchant", 
        Max = 1, 
        Type = "Cap", 
        HideHair = true
    }, 
    ["Cute Turkey Bucket Hat"] = {
        tradeLevel = 250, 
        Rare = "Epic", 
        Desc = "Limited time Cute Turkey Bucket Hat sold by the Traveling Merchant", 
        Max = 1, 
        Type = "Cap"
    }, 
    ["Mochi Emperor's Outfit"] = {
        tradeLevel = 475, 
        Rare = "Legendary", 
        Desc = "Outfit worn by the Mochi Emperor", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Whole Cake Civilian Outfit 1"] = {
        tradeLevel = 250, 
        Rare = "Epic", 
        Desc = "A outfit worn by a whole cake civilian", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        Cosmetic = true
    }, 
    ["Whole Cake Civilian Outfit 2"] = {
        tradeLevel = 250, 
        Rare = "Epic", 
        Desc = "A outfit worn by a whole cake civilian", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        Cosmetic = true
    }, 
    ["Whole Cake Civilian Outfit 3"] = {
        tradeLevel = 250, 
        Rare = "Epic", 
        Desc = "A outfit worn by a whole cake civilian", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        Cosmetic = true
    }, 
    ["Whole Cake Civilian Outfit 4"] = {
        tradeLevel = 250, 
        Rare = "Epic", 
        Desc = "A outfit worn by a whole cake civilian", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        Cosmetic = true
    }, 
    ["Mochi Trident"] = {
        tradeLevel = 475, 
        Rare = "Legendary", 
        Desc = "A massive mochi-forged trident with crushing reach, designed to pierce and overwhelm anything in its path.", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Juice Empress's Outfit"] = {
        tradeLevel = 475, 
        Rare = "Legendary", 
        Desc = "Royal attire worn by the Juice Empress herself.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Juice Empress's Cape"] = {
        tradeLevel = 475, 
        Rare = "Epic", 
        Desc = "A flowing cape symbolizing overwhelming authority.", 
        Max = 1, 
        Type = "Cape"
    }, 
    ["Juice Empress's Helmet"] = {
        tradeLevel = 475, 
        Rare = "Epic", 
        Desc = "A hardened helmet worn by the Juice Empress in battle.", 
        Max = 1, 
        Type = "Cap"
    }, 
    ["Mochi Emperor's Scarf"] = {
        tradeLevel = 475, 
        Rare = "Legendary", 
        Desc = "A scarf infused with the presence of the Mochi Emperor.", 
        Max = 1, 
        Type = "TorsoScarf"
    }, 
    ["Chess Soldier Bishop Outfit"] = {
        tradeLevel = 375, 
        Rare = "Epic", 
        BaseItem = "Chess Soldier Outfit", 
        Desc = "A chess piece outfit", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        HideHair = true
    }, 
    ["Chess Soldier King Outfit"] = {
        tradeLevel = 375, 
        Rare = "Epic", 
        BaseItem = "Chess Soldier Outfit", 
        Desc = "A chess piece outfit", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        HideHair = true
    }, 
    ["Chess Soldier Knight Outfit"] = {
        tradeLevel = 375, 
        Rare = "Epic", 
        BaseItem = "Chess Soldier Outfit", 
        Desc = "A chess piece outfit", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        HideHair = true
    }, 
    ["Chess Soldier Pawn Outfit"] = {
        tradeLevel = 375, 
        Rare = "Epic", 
        BaseItem = "Chess Soldier Outfit", 
        Desc = "A chess piece outfit", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        HideHair = true
    }, 
    ["Chess Soldier Queen Outfit"] = {
        tradeLevel = 375, 
        Rare = "Epic", 
        BaseItem = "Chess Soldier Outfit", 
        Desc = "A chess piece outfit", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        HideHair = true
    }, 
    ["Chess Soldier Rookie Outfit"] = {
        tradeLevel = 375, 
        Rare = "Epic", 
        BaseItem = "Chess Soldier Outfit", 
        Desc = "A chess piece outfit", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        HideHair = true
    }, 
    ["Angel of Time Costume"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "Garments worn by a serene attendant who moves through time.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["Ape Prince's Costume"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "A proud battle suit once worn by a royal warrior of a fierce race.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["Martial Guardian's Costume"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "Traditional gi of a disciplined guardian who stands watch over the world.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["Ape Warrior's Costume"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "A classic battle gi of a carefree warrior born for combat.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["Bulma's Costume"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "Casual techwear favored by a brilliant inventor and traveler.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["Fallen Ape Warrior's Costume"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "Dark attire of a warrior whose divine power has twisted into malice.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["Future Swordsman's Costume"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "Battle gear of a lone swordsman who fights to protect a ruined future.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["God of Destruction's Costume"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "Regal attire worn by a calm yet terrifying deity of ruin.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["Twin-Soul Ape's Outfit"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "Fusion garb of a warrior born from two mighty souls united in battle.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true, 
        BattlePassItem = true
    }, 
    ["Martial Guardian's Cape"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "A flowing cape that completes the look of a martial guardian.", 
        Max = 1, 
        Type = "Cape", 
        BattlePassItem = true
    }, 
    ["Snoozy Neko"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "A sleepy blue companion that dozes off no matter where the fight goes.", 
        Max = 1, 
        Type = "HoverPet", 
        BattlePassItem = true
    }, 
    ["Power Scouter"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "A sleek visor that gauges an opponent's hidden strength at a glance.", 
        Max = 1, 
        Type = "Glasses", 
        BattlePassItem = true
    }, 
    ["Potara Earrings"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "Mystic earrings said to bind two warriors into one unstoppable force.", 
        Max = 1, 
        Type = "Ears", 
        BattlePassItem = true
    }, 
    ["Guardian's Turban"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "A wrapped turban with hidden power, worn by steadfast guardians.", 
        Max = 1, 
        Type = "Cap", 
        BattlePassItem = true, 
        HideHair = true
    }, 
    ["Crimson Star Cap"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "A smart cap marked with a golden star and a four-star emblem.", 
        Max = 1, 
        Type = "Cap", 
        BattlePassItem = true, 
        HideHair = true
    }, 
    ["Hover Pod"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "A hover pod that can fly up and down. Hold Q/E.", 
        Max = 1, 
        Type = "Ship"
    }, 
    ["Limit Breaker Aura"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "An intense aura that erupts when a warrior shatters their limits.", 
        Max = 1, 
        Type = "Aura", 
        BattlePassItem = true, 
        IsHat = true
    }, 
    ["Big Mama's Outfit (Female)"] = {
        tradeLevel = 600, 
        Rare = "Legendary", 
        Desc = "The iconic outfit worn by Big Mama.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Big Mama's Outfit (Male)"] = {
        tradeLevel = 600, 
        Rare = "Legendary", 
        Desc = "The iconic outfit worn by Big Mama.", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Big Mama's Cape"] = {
        tradeLevel = 600, 
        Rare = "Legendary", 
        Desc = "A regal cape that radiates overwhelming presence.", 
        Max = 1, 
        Type = "Cape"
    }, 
    ["Big Mama's Hat"] = {
        tradeLevel = 600, 
        Rare = "Epic", 
        Desc = "A distinctive hat worn by Big Mama.", 
        Max = 1, 
        Type = "Cap"
    }, 
    ["Pretzel Longsword"] = {
        tradeLevel = 600, 
        Rare = "Legendary", 
        Desc = "A massive, spiraling greatsword with incredible reach, designed to wring the very essence from your enemies.", 
        Max = 1, 
        Type = "Katana"
    }, 
    ["Time-Rift Capsule"] = {
        tradeLevel = 300, 
        Rare = "Epic", 
        Desc = "A mysterious capsule infused with fractured time energy. When the time is right, activating it tears open a brief rift, granting a <Rare=Epic>Scythe<Rare=/> pulled from a alternate timeline.", 
        Max = 1, 
        Type = "Artifact"
    }, 
    ["Biscuit Commander's Outfit"] = {
        tradeLevel = 475, 
        Rare = "Epic", 
        Desc = "Outfit worn by the Biscuit Commander", 
        Max = 1, 
        Type = "Outfit", 
        Shirt = true, 
        Pants = true
    }, 
    ["Biscuit Commander's Shoulder Cape"] = {
        tradeLevel = 475, 
        Rare = "Epic", 
        Desc = "Warmth of the legendary dragonslayer who led a frugal life.", 
        Max = 1, 
        Type = "Cape"
    }, 
    ["Iceborn Candy Cane"] = {
        tradeLevel = 100, 
        Rare = "Collectable", 
        Desc = "An iceborn version of the Candy Cane", 
        Max = 1, 
        Type = "Katana", 
        Limited = true
    }, 
    ["All Seeing Holly"] = {
        tradeLevel = 0, 
        BaseItem = "All Seeing Eye", 
        Rare = "Mythical", 
        Desc = "The clairvoyant eye will locate and identify devil fruits as they spawn. <Color=Cyan>Grants the beholder 2x logia rates while in their possession.", 
        Max = 3, 
        Type = "ASESlot"
    }, 
    ["Iceborn Headband"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "Iceborn headband", 
        Max = 1, 
        Type = "Headband", 
        Cosmetic = true
    }, 
    ["Iceborn Wings"] = {
        tradeLevel = 475, 
        Rare = "Legendary", 
        Desc = "Iceborn Wings", 
        Max = 1, 
        Type = "Back", 
        Cosmetic = true
    }, 
    ["Iceborn Necklace"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "Iceborn Necklace", 
        Max = 1, 
        Type = "Jaw", 
        Cosmetic = true
    }, 
    ["Christmas Burst"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "A burst of christmas", 
        Max = 10, 
        Type = "Grip"
    }, 
    ["Freezing Shatter"] = {
        tradeLevel = 275, 
        Rare = "Legendary", 
        Desc = "A Freezing Shatter", 
        Max = 10, 
        Type = "Grip"
    }, 
    ["Gift Blizard"] = {
        tradeLevel = 275, 
        Rare = "Epic", 
        Desc = "A Gift Blizard", 
        Max = 10, 
        Type = "Grip"
    }
};
for _, v5 in ipairs(script:WaitForChild("Categories"):GetChildren()) do
    for v6, v7 in require(v5) do
        if v3[v6] ~= nil then
            warn((("%* already exist!"):format(v6)));
        else
            v3[v6] = v7;
        end;
    end;
end;
local v8 = game:GetService("RunService"):IsServer();
local l_Tools_0 = game.ReplicatedStorage:FindFirstChild("Tools");
for v10, v11 in pairs(v3) do
    if v11.Type == "Cap" or v11.Type == "Head" or v11.Type == "Cape" or v11.Type == "Waist" or v11.Type == "Jaw" or v11.Type == "Back" or v11.Type == "Glasses" or v11.Type == "Headband" or v11.Type == "Ears" or v11.Type == "TorsoScarf" or v11.Type == "Shoulder" or v11.Type == "Shoulder2" or v11.Type == "HoverPet" then
        v11.IsHat = true;
    end;
    if v11.BattlePassItem ~= nil then
        v11.Desc = v11.Desc .. " <Color=Blue>\n[WEARABLE IN BR]";
    end;
    if v11.Type == "Grip" then
        v11.Max = 10;
        v11.tradeLevel = 1;
        if v11.CustomMax then
            v11.Max = v11.CustomMax;
        end;
        if game.ReplicatedStorage:FindFirstChild("Tools") and v8 == true then
            local v12 = script.Part:Clone();
            v12.Name = v10;
            v12.Parent = game.ReplicatedStorage.Tools;
        end;
    end;
    if l_Tools_0 and v10:match("Blueprint") then
        local v13, _ = string.gsub(v10, "Blueprint", "");
        v11.Desc = "Crafting Blueprint for <Color=Blue>" .. v13;
        if v8 == true and l_Tools_0:FindFirstChild(v10) == nil then
            local v15 = script.Blueprint:Clone();
            v15.Name = v10;
            v15.Parent = game.ReplicatedStorage.Tools;
        end;
    end;
    if v11.BattlePassItem == true then
        v11.Cosmetic = true;
    end;
    if v11.Chroma == true then
        v11.BaseItem = v10;
    end;
end;
local v16 = {
    "Red", 
    "Blue", 
    "Green", 
    "Orange"
};
for v17 = 1, #v16 do
    local v18 = v16[v17];
    v3["Slayer's Armor Set" .. " (" .. v18 .. ")"] = v3["Slayer's Armor Set"];
    v3["Slayer's Mask" .. " (" .. v18 .. ")"] = v3["Slayer's Mask"];
end;
local v19 = {
    "Purple", 
    "Blue", 
    "Green", 
    "Red", 
    "Azure", 
    "Gold"
};
v3["Kraken Cape"].Variants = {};
v3["Kraken Armor Set"].Variants = {};
v3["Kraken Blade"].Variants = {};
v3["Kraken Katana"].Variants = {};
for v20 = 1, #v19 do
    local v21 = v19[v20];
    v3["Kraken Cape" .. " (" .. v21 .. ")"] = v3["Kraken Cape"];
    v3["Kraken Armor Set" .. " (" .. v21 .. ")"] = v3["Kraken Armor Set"];
    v3["Kraken Blade" .. " (" .. v21 .. ")"] = v3["Kraken Blade"];
    v3["Kraken Katana" .. " (" .. v21 .. ")"] = v3["Kraken Katana"];
    v3["Kraken Cape"].Variants["Kraken Cape" .. " (" .. v21 .. ")"] = v21;
    v3["Kraken Armor Set"].Variants["Kraken Armor Set" .. " (" .. v21 .. ")"] = v21;
    v3["Kraken Blade"].Variants["Kraken Blade" .. " (" .. v21 .. ")"] = v21;
    v3["Kraken Katana"].Variants["Kraken Katana" .. " (" .. v21 .. ")"] = v21;
end;
if workspace:WaitForChild("Islands", 3) ~= nil then
    repeat
        game["Run Service"].Heartbeat:Wait();
    until workspace.Islands:GetAttribute("allIslands") ~= "";
    local l_Attribute_0 = workspace.Islands:GetAttribute("allIslands");
    do
        local l_l_Attribute_0_0 = l_Attribute_0;
        pcall(function() --[[ Line: 972 ]]
            -- upvalues: l_l_Attribute_0_0 (ref), v3 (copy)
            l_l_Attribute_0_0 = game.HttpService:JSONDecode(l_l_Attribute_0_0);
            for v24 = 1, #l_l_Attribute_0_0 do
                v3[l_l_Attribute_0_0[v24] .. " Eternal Pose"] = {
                    Rare = "Common", 
                    Desc = "A device that always points to " .. l_l_Attribute_0_0[v24], 
                    Max = 1, 
                    Type = "ETPose"
                };
            end;
        end);
        local l_Bomi_0 = game.ReplicatedStorage:WaitForChild("Modules"):WaitForChild("NPCInteractions"):WaitForChild("Conditions"):WaitForChild("Bomi");
        local l_islands_0 = require(l_Bomi_0).islands;
        for v27, _ in pairs(l_islands_0) do
            v3[v27 .. " Eternal Pose"] = {
                Rare = "Common", 
                Desc = "A device that always points to " .. v27, 
                Max = 1, 
                Type = "ETPose"
            };
        end;
    end;
end;
script.Fruits:WaitForChild("Common", 1);
if #script.Fruits:GetChildren() <= 0 then
    repeat
        task.wait();
    until #script.Fruits:GetChildren() > 0;
end;
local l_Descendants_0 = script.Fruits:GetDescendants();
for v30 = 1, #l_Descendants_0 do
    if l_Descendants_0[v30]:IsA("StringValue") then
        v3[l_Descendants_0[v30].Name] = {
            Rare = l_Descendants_0[v30].Parent.Name, 
            Desc = "A devil fruit", 
            Max = 1, 
            Type = "Fruit", 
            OneTime = true, 
            tradeLevel = 25
        };
        if v3[l_Descendants_0[v30].Name].Rare == "Legendary" then
            v3[l_Descendants_0[v30].Name].BaseItem = "Legendary Fruit";
        end;
    end;
end;
table.clear(l_Descendants_0);
_G.itemsReady = true;
return v3;