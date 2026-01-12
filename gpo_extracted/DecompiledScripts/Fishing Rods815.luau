return {
    ["Rare Fishing Rod"] = {
        Icon = "", 
        Description = "Rare Fishing Rod", 
        GivenItem = "Rare Fishing Rod", 
        UseRequiredItem = true, 
        Requirements = {
            ["Rare Fish"] = 20, 
            ["Fishing Rod"] = 1
        }, 
        Default = true, 
        RequirementsExtra = {
            ["Rare Fish"] = {
                AllowMultiple = true, 
                BaseItem = "Rare Fish"
            }
        }
    }, 
    ["Epic Fishing Rod"] = {
        Icon = "", 
        Description = "Epic Fishing Rod", 
        GivenItem = "Epic Fishing Rod", 
        UseRequiredItem = true, 
        Requirements = {
            ["Legendary Fish"] = 15, 
            ["Rare Fishing Rod"] = 1
        }, 
        Default = true, 
        RequirementsExtra = {
            ["Legendary Fish"] = {
                AllowMultiple = true, 
                BaseItem = "Legendary Fish"
            }
        }
    }, 
    ["Jack-O'Rod Blueprint"] = {
        Icon = "", 
        Description = ("Crafting Blueprint for <font color=\"rgb(%*, %*, %*)\">Jack-O'Rod</font>."):format(255, 6, 6), 
        GivenItem = "Jack-O'Rod", 
        IgnoreBaseItem = true, 
        Requirements = {
            ["Dark Skeletal Shark"] = 6, 
            ["Skeletal Shark"] = 6, 
            ["Jack-O'-Bite"] = 6, 
            ["Candy Corn Squid"] = 6
        }
    }, 
    ["Angler Rod Blueprint"] = {
        Icon = "", 
        Description = ("Crafting Blueprint for <font color=\"rgb(%*, %*, %*)\">Angler Rod</font>."):format(255, 6, 6), 
        GivenItem = "Angler Rod", 
        IgnoreBaseItem = true, 
        Requirements = {
            Anglerfish = 25
        }
    }, 
    ["Devil Fruit Rod Blueprint"] = {
        Icon = "", 
        Description = ("Crafting Blueprint for <font color=\"rgb(%*, %*, %*)\">Devil Fruit Rod</font>."):format(255, 6, 6), 
        GivenItem = "Devil Fruit Rod", 
        IgnoreBaseItem = true, 
        ClipList = true, 
        Requirements = {
            Tori = 1, 
            Kira = 1, 
            Pteranodon = 1, 
            Zushi = 1, 
            Spin = 1, 
            Goru = 1, 
            Venom = 1, 
            Mochi = 1, 
            Ito = 1, 
            Hie = 1, 
            Goro = 1, 
            Magu = 1, 
            Pika = 1, 
            Suke = 1
        }
    }
};