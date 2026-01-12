local v0 = {
    Example = {
        Icon = "", 
        Description = "", 
        GivenItem = "Bazooka", 
        Requirements = {
            Wood = 5, 
            Bolts = 10
        }
    }, 
    ["Legendary Fruit Chest Blueprint"] = {
        Icon = "", 
        Description = ("Crafting Blueprint for <font color=\"rgb(%*, %*, %*)\">Legendary Fruit Chest</font>."):format(255, 255, 0), 
        GivenItem = "Legendary Fruit Chest", 
        UseRequiredItem = true, 
        Requirements = {
            ["Legendary Fruit"] = 5
        }, 
        RequirementsExtra = {
            ["Legendary Fruit"] = {
                AllowMultiple = true, 
                BaseItem = "Legendary Fruit"
            }
        }
    }, 
    ["Shark Blood Bottle Blueprint"] = {
        Icon = "", 
        Description = ("Crafting Blueprint for <font color=\"rgb(%*, %*, %*)\">Shark Blood Bottle</font>."):format(255, 6, 6), 
        GivenItem = "Shark Blood Bottle", 
        Requirements = {
            ["Shark Tooth"] = 10
        }
    }, 
    ["Megalodon Armor Set Blueprint"] = {
        Icon = "", 
        Description = ("Crafting Blueprint for <font color=\"rgb(%*, %*, %*)\">Shark Blood Bottle</font>."):format(255, 6, 6), 
        GivenItem = "Megalodon Armor Set", 
        Requirements = {
            ["Megalodon Teeth"] = 10, 
            ["Kraken Armor Set"] = 1
        }
    }, 
    ["Boneshiver Blueprint"] = {
        Icon = "", 
        Description = ("Crafting Blueprint for <font color=\"rgb(%*, %*, %*)\">Shark Blood Bottle</font>."):format(255, 6, 6), 
        GivenItem = "Boneshiver", 
        Requirements = {
            ["Megalodon Teeth"] = 5, 
            Kiribachi = 1
        }
    }, 
    ["Egg Phone Blueprint"] = {
        Icon = "", 
        Description = ("Crafting Blueprint for <font color=\"rgb(%*, %*, %*)\">Shark Blood Bottle</font>."):format(255, 6, 6), 
        GivenItem = "Egg Phone", 
        Requirements = {
            ["Blue Star Egghead"] = 1, 
            ["Orange n Yellow Egghead"] = 1, 
            ["Peach Dots Egghead"] = 1, 
            ["Pink Squiggly Egghead"] = 1, 
            ["White Glowing Egghead"] = 1
        }
    }, 
    ["Megalodon Helmet Blueprint"] = {
        Icon = "", 
        Description = ("Crafting Blueprint for <font color=\"rgb(%*, %*, %*)\">Shark Blood Bottle</font>."):format(255, 6, 6), 
        GivenItem = "Megalodon Helmet", 
        Requirements = {
            ["Megalodon Teeth"] = 10, 
            ["Shark Blood Bottle"] = 3, 
            ["Slayer's Mask"] = 1
        }
    }, 
    ["Swordfish Rapier Blueprint"] = {
        Icon = "", 
        Description = ("Crafting Blueprint for <font color=\"rgb(%*, %*, %*)\">Swordfish Rapier</font>."):format(255, 6, 6), 
        GivenItem = "Swordfish Rapier", 
        IgnoreBaseItem = true, 
        Requirements = {
            Swordfish = 25
        }
    }, 
    ["Skeletal Shark Mask Blueprint"] = {
        Icon = "", 
        Description = ("Crafting Blueprint for <font color=\"rgb(%*, %*, %*)\">Skeletal Shark Mask</font>."):format(255, 6, 6), 
        GivenItem = "Skeletal Shark Mask", 
        IgnoreBaseItem = true, 
        Requirements = {
            ["Skeletal Shark"] = 8
        }
    }, 
    ["Dark Skeletal Shark Mask Blueprint"] = {
        Icon = "", 
        Description = ("Crafting Blueprint for <font color=\"rgb(%*, %*, %*)\">Dark Skeletal Shark Mask</font>."):format(255, 6, 6), 
        GivenItem = "Dark Skeletal Shark Mask", 
        IgnoreBaseItem = true, 
        Requirements = {
            ["Dark Skeletal Shark"] = 15
        }
    }, 
    ["Angler's Lantern Blueprint"] = {
        Icon = "", 
        Description = ("Crafting Blueprint for <font color=\"rgb(%*, %*, %*)\">Angler's Lantern</font>."):format(255, 6, 6), 
        GivenItem = "Angler's Lantern", 
        IgnoreBaseItem = true, 
        Requirements = {
            Anglerfish = 8
        }
    }
};
for v1, v2 in pairs(v0) do
    v2.Requirements[v1] = 1;
end;
return v0;