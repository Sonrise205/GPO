return {
    ["Kraken Slayer"] = {
        Perks = {
            "1.5x DMG TO KRAKENS"
        }, 
        RoleColor = Color3.fromRGB(255, 0, 127), 
        PerkTags = {
            NPC = "Kraken", 
            dmgBoost = 1.5
        }, 
        Obtain = {
            Kills = 100, 
            NPC = "Kraken"
        }, 
        ID = 1
    }, 
    ["Cabin Boy"] = {
        Perks = {}, 
        RoleColor = Color3.fromRGB(255, 255, 255), 
        Obtain = {
            Bounty = 50000, 
            Team = "Pirate", 
            Grips = 20
        }, 
        ID = 2
    }, 
    Rookie = {
        Perks = {}, 
        RoleColor = Color3.fromRGB(255, 255, 255), 
        Obtain = {
            Bounty = 100000, 
            Team = "Pirate", 
            Grips = 40
        }, 
        ID = 3
    }, 
    ["Great Pirate"] = {
        Perks = {}, 
        RoleColor = Color3.fromRGB(255, 255, 255), 
        ID = 4, 
        Obtain = {
            Bounty = 250000, 
            Team = "Pirate", 
            Grips = 85
        }
    }, 
    Supernova = {
        Perks = {}, 
        RoleColor = Color3.fromRGB(85, 85, 255), 
        ID = 5, 
        Obtain = {
            Bounty = 500000, 
            Team = "Pirate", 
            Grips = 120
        }
    }, 
    Warlord = {
        Perks = {
            "Pirate and Marine ships do not chase you, as they are too scared."
        }, 
        PerkTags = {
            noShips = true
        }, 
        RoleColor = Color3.fromRGB(255, 0, 0), 
        ID = 6, 
        removeable = true, 
        Obtain = {
            Bounty = 1000000, 
            Team = "Pirate", 
            Grips = 300
        }
    }, 
    Officer = {
        Perks = {}, 
        RoleColor = Color3.fromRGB(255, 255, 255), 
        Obtain = {
            Bounty = 50000, 
            Team = "Marine", 
            Arrests = 5
        }, 
        Rewards = {
            "Marine Officer Outfit"
        }, 
        removeable = true, 
        ID = 7
    }, 
    Lieutenant = {
        Perks = {}, 
        RoleColor = Color3.fromRGB(255, 255, 255), 
        Obtain = {
            Bounty = 100000, 
            Team = "Marine", 
            Arrests = 10
        }, 
        Rewards = {
            "Marine Lieutenant Outfit"
        }, 
        removeable = true, 
        ID = 8
    }, 
    Commander = {
        Perks = {}, 
        RoleColor = Color3.fromRGB(255, 255, 255), 
        Obtain = {
            Bounty = 250000, 
            Team = "Marine", 
            Arrests = 25
        }, 
        Rewards = {
            "Marine Commander Cape", 
            "Marine Commander Outfit"
        }, 
        removeable = true, 
        ID = 9
    }, 
    Captain = {
        Perks = {}, 
        RoleColor = Color3.fromRGB(170, 255, 255), 
        Obtain = {
            Bounty = 500000, 
            Team = "Marine", 
            Arrests = 50
        }, 
        Rewards = {
            "Marine Captain Outfit", 
            "Marine Captain Cape 2"
        }, 
        removeable = true, 
        ID = 10
    }, 
    ["Rear Admiral"] = {
        Perks = {
            "Pirate and Marine ships do not chase you, as they are too scared."
        }, 
        PerkTags = {
            noShips = true
        }, 
        RoleColor = Color3.fromRGB(85, 170, 255), 
        Obtain = {
            Bounty = 1000000, 
            Team = "Marine", 
            Arrests = 100
        }, 
        Rewards = {
            "Marine Rear Admiral Outfit"
        }, 
        removeable = true, 
        ID = 11
    }, 
    ["Beast Slayer"] = {
        Perks = {
            "1.5x DMG TO SEA SERPENTS"
        }, 
        RoleColor = Color3.fromRGB(200, 0, 100), 
        PerkTags = {
            NPC = "Sea Serpent", 
            dmgBoost = 1.5
        }, 
        Obtain = {
            Kills = 100, 
            NPC = "Sea Serpent"
        }, 
        ID = 12
    }, 
    ["Wood Collector"] = {
        Perks = {
            "Collect 2x the ammount of Wooden Planks"
        }, 
        RoleColor = Color3.fromRGB(170, 255, 127), 
        Obtain = {
            Kills = 1000, 
            NPC = "Wooden Plank"
        }, 
        ID = 13
    }, 
    ["Arena Warrior"] = {
        Perks = {
            "5% DMG boost to NPCs"
        }, 
        PerkTags = {
            NPC = "All", 
            dmgBoost = 1.05
        }, 
        RoleColor = Color3.fromRGB(255, 170, 127), 
        Obtain = {
            ["1v1Wins"] = 100
        }, 
        ID = 14
    }, 
    Champion = {
        Perks = {
            "8% DMG boost to NPCs"
        }, 
        PerkTags = {
            NPC = "All", 
            dmgBoost = 1.08
        }, 
        RoleColor = Color3.fromRGB(0, 0, 255), 
        Obtain = {
            ["1v1Wins"] = 250
        }, 
        ID = 15
    }, 
    Immortal = {
        Perks = {
            "15% DMG boost to NPCs"
        }, 
        PerkTags = {
            NPC = "All", 
            dmgBoost = 1.15
        }, 
        RoleColor = Color3.fromRGB(255, 85, 127), 
        Obtain = {
            WinStreak = 150
        }, 
        ID = 16
    }, 
    ["Explorer of the Seas"] = {
        Perks = {}, 
        RoleColor = Color3.fromRGB(255, 255, 255), 
        ID = 17
    }, 
    ["Devil's Luck"] = {
        Perks = {}, 
        RoleColor = Color3.fromRGB(170, 170, 255), 
        ID = 18
    }, 
    Tester = {
        Perks = {
            "50% DMG boost to NPCs"
        }, 
        PerkTags = {
            NPC = "All", 
            dmgBoost = 1.5
        }, 
        RoleColor = Color3.fromRGB(73, 237, 255), 
        ID = 19
    }, 
    ["Content Creator"] = {
        Perks = {
            "Anonymous mode in battle royale"
        }, 
        RoleColor = Color3.fromRGB(170, 0, 0), 
        OnFunction = function(v0) --[[ Line: 142 ]] --[[ Name: OnFunction ]]
            if _G.arena == true then
                v0:SetAttribute("hidePlayerList", true);
            end;
        end, 
        OffFunction = function(v1) --[[ Line: 148 ]] --[[ Name: OffFunction ]]
            v1:SetAttribute("hidePlayerList", nil);
        end, 
        ID = 20
    }, 
    ["Tik Toker"] = {
        Perks = {
            "\240\159\147\183\240\159\147\183\240\159\147\183\240\159\147\183\240\159\147\183\240\159\147\183"
        }, 
        RoleColor = Color3.fromRGB(170, 0, 0), 
        ID = 21
    }, 
    ["Beginner Swordsman"] = {
        Perks = {}, 
        Obtain = {
            FightingStyle = "1SS"
        }, 
        RoleColor = Color3.fromRGB(255, 255, 255), 
        ID = 22
    }, 
    ["Advanced Swordsman"] = {
        Perks = {}, 
        Obtain = {
            FightingStyle = "2SS"
        }, 
        RoleColor = Color3.fromRGB(195, 130, 97), 
        ID = 23
    }, 
    Admin = {
        Perks = {
            "50% DMG boost to NPCs"
        }, 
        PerkTags = {
            NPC = "All", 
            dmgBoost = 1.5
        }, 
        RoleColor = Color3.fromRGB(0, 255, 255), 
        ID = 24
    }, 
    ["Last One Standing"] = {
        Perks = {}, 
        RoleColor = Color3.fromRGB(255, 255, 255), 
        Obtain = {
            CombinedWins = 1
        }, 
        ID = 25
    }, 
    ["Way of the fish"] = {
        Perks = {}, 
        Obtain = {
            FightingStyle = "FishmanKarate"
        }, 
        RoleColor = Color3.fromRGB(255, 255, 255), 
        ID = 26
    }, 
    ["Dragon's Claw"] = {
        Perks = {}, 
        Obtain = {
            FightingStyle = "DragonClaw"
        }, 
        RoleColor = Color3.fromRGB(255, 255, 255), 
        ID = 27
    }, 
    Electro = {
        Perks = {}, 
        Obtain = {
            FightingStyle = "Electro"
        }, 
        RoleColor = Color3.fromRGB(255, 255, 255), 
        ID = 28
    }, 
    ["Beginner Trader"] = {
        Perks = {}, 
        Obtain = {
            TradesCompleted = 10
        }, 
        RoleColor = Color3.fromRGB(255, 255, 255), 
        ID = 29
    }, 
    ["Novice Trader"] = {
        Perks = {}, 
        Obtain = {
            TradesCompleted = 25
        }, 
        RoleColor = Color3.fromRGB(255, 255, 255), 
        ID = 30
    }, 
    ["Intermediate Trader"] = {
        Perks = {}, 
        Obtain = {
            TradesCompleted = 50
        }, 
        RoleColor = Color3.fromRGB(255, 255, 255), 
        ID = 31
    }, 
    ["Skilled Trader"] = {
        Perks = {}, 
        Obtain = {
            TradesCompleted = 100
        }, 
        RoleColor = Color3.fromRGB(229, 255, 219), 
        ID = 32
    }, 
    ["Advanced Trader"] = {
        Perks = {}, 
        Obtain = {
            TradesCompleted = 200
        }, 
        RoleColor = Color3.fromRGB(170, 255, 127), 
        ID = 33
    }, 
    ["Senior Trader"] = {
        Perks = {}, 
        Obtain = {
            TradesCompleted = 400
        }, 
        RoleColor = Color3.fromRGB(170, 255, 0), 
        ID = 34
    }, 
    ["Expert Trader"] = {
        Perks = {}, 
        Obtain = {
            TradesCompleted = 800
        }, 
        RoleColor = Color3.fromRGB(0, 255, 0), 
        ID = 35
    }, 
    Collector = {
        Perks = {
            "Originates from the one"
        }, 
        Obtain = {
            Collectable = 1
        }, 
        removeable = true, 
        RoleColor = Color3.fromRGB(0, 0, 0), 
        ID = 36
    }, 
    Kicker = {
        Perks = {}, 
        Obtain = {
            FightingStyle = "BlackLeg"
        }, 
        RoleColor = Color3.fromRGB(255, 255, 255), 
        ID = 37
    }, 
    Superhuman = {
        Perks = {}, 
        Obtain = {
            FightingStyle = "Rokushiki"
        }, 
        RoleColor = Color3.fromRGB(255, 255, 255), 
        ID = 38
    }, 
    ["Demon Step"] = {
        Perks = {}, 
        Obtain = {
            BlackLeg = 7
        }, 
        RoleColor = Color3.fromRGB(255, 170, 0), 
        ID = 39
    }, 
    ["The All Seeing"] = {
        Perks = {
            "2X Logia Rates, 100% Legendary Fruit Chest in battle royales if victorious.", 
            "10% DMG boost to all NPCs", 
            "1/40 Legendary Pity for fruits instead of 1/100"
        }, 
        PerkTags = {
            NPC = "All", 
            dmgBoost = 1.1
        }, 
        Obtain = {
            BaseItem = "All Seeing Eye"
        }, 
        removeable = true, 
        RoleColor = Color3.fromRGB(170, 170, 255), 
        ID = 40
    }, 
    ["Mind Reader"] = {
        Perks = {}, 
        Obtain = {
            KenV2 = true
        }, 
        RoleColor = Color3.fromRGB(255, 255, 255), 
        ID = 41
    }, 
    ["Spirit Enlightened"] = {
        Perks = {}, 
        Obtain = {
            BusoV2 = true
        }, 
        RoleColor = Color3.fromRGB(255, 255, 255), 
        ID = 42
    }, 
    ["Gate Crasher"] = {
        Perks = {}, 
        RoleColor = Color3.fromRGB(180, 180, 180), 
        ID = 43
    }, 
    ["True Gate Crasher"] = {
        Perks = {}, 
        RoleColor = Color3.fromRGB(0, 0, 0), 
        ID = 44
    }, 
    ["NO LIFE"] = {
        Perks = {}, 
        Obtain = {
            afkTime = 1000000
        }, 
        RoleColor = Color3.fromRGB(153, 255, 246), 
        ID = 45
    }, 
    Patreon = {
        Perks = {}, 
        RoleColor = Color3.fromRGB(170, 255, 127), 
        ID = 46
    }, 
    ["Fruit Unboxer"] = {
        Perks = {}, 
        Obtain = {
            FruitsUnboxed = 100
        }, 
        RoleColor = Color3.fromRGB(255, 170, 0), 
        ID = 47
    }, 
    ["Tough One"] = {
        Perks = {}, 
        RoleColor = Color3.fromRGB(255, 255, 255), 
        Obtain = {
            CombinedWins = 15
        }, 
        ID = 48
    }, 
    ["Absolute Unit"] = {
        Perks = {}, 
        RoleColor = Color3.fromRGB(255, 170, 0), 
        Obtain = {
            CombinedWins = 75
        }, 
        ID = 49
    }, 
    Developer = {
        Perks = {
            "250% DMG boost to NPCs"
        }, 
        PerkTags = {
            NPC = "All", 
            dmgBoost = 2.5
        }, 
        RoleColor = Color3.fromRGB(255, 0, 0), 
        ID = 50
    }, 
    ["Exclusive Collector"] = {
        Perks = {
            "All for one"
        }, 
        Obtain = {
            ToolTag = "Exclusive"
        }, 
        StartText = "<stroke color=\"#5555ff\" joins=\"miter\" thickness=\"1.5\" transparency=\"0.25\">", 
        EndText = "</stroke>", 
        removeable = true, 
        RoleColor = Color3.fromRGB(0, 0, 0), 
        ID = 51
    }, 
    ["2022 Anniversary Observer"] = {
        Perks = {}, 
        RoleColor = Color3.fromRGB(255, 255, 127), 
        ID = 52
    }, 
    ["Phoeyu's Blessing"] = {
        Perks = {}, 
        RoleColor = Color3.fromRGB(85, 85, 255), 
        ID = 53
    }, 
    ["Mythic Chest Opener"] = {
        Perks = {}, 
        RoleColor = Color3.fromRGB(85, 85, 255), 
        ID = 54
    }, 
    ["Gear Second"] = {
        Perks = {}, 
        RoleColor = Color3.fromRGB(255, 170, 255), 
        ID = 55
    }, 
    ["Event Winner"] = {
        Perks = {
            "5% DMG boost TO NPCs"
        }, 
        PerkTags = {
            NPC = "All", 
            dmgBoost = 1.05
        }, 
        RoleColor = Color3.fromRGB(0, 0, 0), 
        StartText = "<stroke color=\"#da91da\" joins=\"miter\" thickness=\"1.5\" transparency=\"0.25\">", 
        EndText = "</stroke>", 
        ID = 56
    }, 
    ["Middle Man"] = {
        Perks = {
            ""
        }, 
        RoleColor = Color3.fromRGB(0, 255, 127), 
        ID = 57
    }, 
    Moderator = {
        Perks = {
            "50% DMG boost to NPCs"
        }, 
        PerkTags = {
            NPC = "All", 
            dmgBoost = 1.5
        }, 
        RoleColor = Color3.fromRGB(0, 255, 255), 
        ID = 58
    }, 
    Cyborg = {
        Perks = {}, 
        Obtain = {
            FightingStyle = "Cyborg"
        }, 
        RoleColor = Color3.fromRGB(170, 255, 255), 
        ID = 59
    }, 
    ["Sett, The Boss"] = {
        Perks = {
            "boss"
        }, 
        PerkTags = {
            NPC = "All/Players", 
            dmgBoost = 20
        }, 
        StartText = "<stroke color=\"#000000\" joins=\"miter\" thickness=\"1.5\" transparency=\"0.25\">", 
        EndText = "</stroke>", 
        RoleColor = Color3.fromRGB(255, 51, 10), 
        ID = 60
    }, 
    ["Impel Down Escapee"] = {
        Perks = {}, 
        RoleColor = Color3.fromRGB(255, 255, 255), 
        Obtain = {
            ["Impel Down"] = 1
        }, 
        ID = 61
    }, 
    ["Impel Down Challenger"] = {
        Perks = {}, 
        RoleColor = Color3.fromRGB(170, 85, 127), 
        Obtain = {
            HighestImpelDownClear = 2
        }, 
        ID = 62
    }, 
    Dullahan = {
        Perks = {}, 
        RoleColor = Color3.fromRGB(0, 85, 255), 
        Obtain = {
            Race = "Dullahan"
        }, 
        ID = 63
    }, 
    Vampire = {
        Perks = {}, 
        RoleColor = Color3.fromRGB(255, 0, 0), 
        Obtain = {
            Race = "Vampire"
        }, 
        ID = 64
    }, 
    ["2023 Anniversary Participant"] = {
        Perks = {}, 
        RoleColor = Color3.fromRGB(255, 255, 127), 
        ID = 65
    }, 
    ["Gift Hunter"] = {
        Perks = {}, 
        RoleColor = Color3.fromRGB(255, 0, 0), 
        ID = 66
    }, 
    ["Nightmare of Impel Down"] = {
        Perks = {}, 
        RoleColor = Color3.fromRGB(170, 85, 127), 
        StartText = "<stroke color=\"#000000\" joins=\"miter\" thickness=\"1.5\" transparency=\"0.25\">", 
        EndText = "</stroke>", 
        Obtain = {
            HighestImpelDownClear = 3
        }, 
        ID = 67
    }, 
    Yonko = {
        Perks = {
            "Pirate and Marine ships do not chase you, as they are too scared."
        }, 
        PerkTags = {
            noShips = true
        }, 
        StartText = "<stroke color=\"#000000\" joins=\"miter\" thickness=\"1.5\" transparency=\"0.25\">", 
        EndText = "</stroke>", 
        RoleColor = Color3.fromRGB(255, 85, 0), 
        ID = 68
    }, 
    Moonlit = {
        Perks = {}, 
        StartText = "<stroke color=\"#55aaff\" joins=\"miter\" thickness=\"1.5\" transparency=\"0.25\">", 
        EndText = "</stroke>", 
        RoleColor = Color3.fromRGB(170, 255, 255), 
        ID = 69
    }, 
    ["Abyssal Strider"] = {
        Perks = {}, 
        StartText = "<stroke color=\"#000000\" joins=\"miter\" thickness=\"1.5\" transparency=\"0.25\">", 
        EndText = "</stroke>", 
        RoleColor = Color3.fromRGB(0, 85, 255), 
        ID = 70
    }, 
    ["Egg Hunter"] = {
        Perks = {}, 
        RoleColor = Color3.fromRGB(255, 0, 0), 
        ID = 71
    }, 
    ["Megalodon Slayer"] = {
        Perks = {
            "1.20x DMG TO MEGALODONS"
        }, 
        RoleColor = Color3.fromRGB(85, 85, 85), 
        PerkTags = {
            NPC = "Megalodon", 
            dmgBoost = 1.2
        }, 
        Obtain = {
            Kills = 100, 
            NPC = "Megalodon"
        }, 
        ID = 72
    }, 
    ["Crafting Noob"] = {
        Perks = {}, 
        Obtain = {
            ItemsCrafted = 1
        }, 
        RoleColor = Color3.fromRGB(255, 255, 255), 
        ID = 73
    }, 
    ["Crafting Novice"] = {
        Perks = {}, 
        Obtain = {
            ItemsCrafted = 50
        }, 
        RoleColor = Color3.fromRGB(170, 255, 127), 
        ID = 74
    }, 
    ["Crafting Enthusiast"] = {
        Perks = {}, 
        Obtain = {
            ItemsCrafted = 150
        }, 
        RoleColor = Color3.fromRGB(170, 255, 0), 
        ID = 75
    }, 
    ["Creative Maestro"] = {
        Perks = {}, 
        Obtain = {
            ItemsCrafted = 500
        }, 
        RoleColor = Color3.fromRGB(170, 0, 255), 
        ID = 76
    }, 
    ["Creative Genius"] = {
        Perks = {}, 
        Obtain = {
            ItemsCrafted = 500
        }, 
        RoleColor = Color3.fromRGB(170, 170, 255), 
        ID = 77
    }, 
    ["Master of Creation"] = {
        Perks = {}, 
        Obtain = {
            ItemsCrafted = 20000
        }, 
        StartText = "<font face=\"GrenzeGotisch\">", 
        EndText = "</font>", 
        RoleColor = Color3.fromRGB(85, 85, 255), 
        ID = 78
    }, 
    ["God Human"] = {
        Perks = {}, 
        StartText = "<stroke color=\"#aaffff\" joins=\"miter\" thickness=\"1.5\" transparency=\"0.25\">", 
        EndText = "</stroke>", 
        RoleColor = Color3.fromRGB(255, 255, 255), 
        ID = 79
    }, 
    ["Mobile Player"] = {
        Perks = {
            "have fun!"
        }, 
        RoleColor = Color3.fromRGB(170, 85, 127), 
        ID = 80
    }, 
    ["Console Player"] = {
        Perks = {
            "have fun!"
        }, 
        RoleColor = Color3.fromRGB(170, 85, 0), 
        ID = 81
    }, 
    ["Radiant One"] = {
        Perks = {}, 
        RoleColor = Color3.fromRGB(255, 255, 99), 
        ID = 82
    }, 
    ["Trick or Treater"] = {
        Perks = {}, 
        RoleColor = Color3.fromRGB(255, 170, 0), 
        ID = 83
    }, 
    ["Lucky Treater"] = {
        Perks = {}, 
        RoleColor = Color3.fromRGB(255, 170, 0), 
        ID = 84
    }, 
    ["Unlucky Treater"] = {
        Perks = {}, 
        RoleColor = Color3.fromRGB(255, 170, 0), 
        ID = 85
    }, 
    ["Novice Fisherman"] = {
        Perks = {
            "Lure fish faster by 5%"
        }, 
        RoleColor = Color3.fromRGB(102, 178, 255), 
        PerkTags = {
            Type = "FishLure", 
            Boost = 1.05
        }, 
        Obtain = {
            FishesCaught = 50
        }, 
        ID = 86
    }, 
    ["Skilled Fisherman"] = {
        Perks = {
            "Lure fish faster by 15%"
        }, 
        PerkTags = {
            Type = "FishLure", 
            Boost = 1.15
        }, 
        RoleColor = Color3.fromRGB(0, 128, 255), 
        Obtain = {
            FishesCaught = 200
        }, 
        ID = 87
    }, 
    ["Master Fisherman"] = {
        Perks = {
            "Catch rare fish more easily (1.25x chance)"
        }, 
        PerkTags = {
            Type = "FishChance", 
            Boost = 1.25
        }, 
        RoleColor = Color3.fromRGB(0, 102, 204), 
        Obtain = {
            FishesCaught = 1000
        }, 
        ID = 88
    }, 
    ["Godly Fisherman"] = {
        Perks = {
            "Catch rare fish more easily (2x chance)"
        }, 
        PerkTags = {
            Type = "FishChance", 
            Boost = 2
        }, 
        StartText = "<stroke color=\"#aaffff\" joins=\"miter\" thickness=\"1.5\" transparency=\"0.25\">", 
        EndText = "</stroke>", 
        RoleColor = Color3.fromRGB(0, 128, 255), 
        Obtain = {
            FishesCaught = 10000
        }, 
        ID = 89
    }, 
    ["Iron Fist"] = {
        Perks = {}, 
        Obtain = {
            FightingStyle = "Iron Fist"
        }, 
        StartText = "<stroke color=\"#000000\" joins=\"miter\" thickness=\"1.5\" transparency=\"0.25\">", 
        EndText = "</stroke>", 
        RoleColor = Color3.fromRGB(255, 0, 0), 
        ID = 90
    }, 
    ["Sticky One"] = {
        Perks = {}, 
        RoleColor = Color3.fromRGB(255, 255, 255), 
        ID = 91
    }, 
    ["Master Swordsman"] = {
        Perks = {}, 
        Obtain = {
            FightingStyle = "3SS"
        }, 
        RoleColor = Color3.fromRGB(85, 0, 255), 
        ID = 92
    }, 
    ["Cupid's Nemesis"] = {
        Perks = {
            "1.10x DMG TO CUPID QUEEN"
        }, 
        RoleColor = Color3.fromRGB(255, 170, 255), 
        PerkTags = {
            NPC = "Cupid Queen", 
            dmgBoost = 1.1
        }, 
        Obtain = {
            Kills = 25, 
            NPC = "Cupid Queen"
        }, 
        ArenaApply = true, 
        ID = 93
    }, 
    ["Cupid's Survivor"] = {
        Perks = {}, 
        RoleColor = Color3.fromRGB(156, 104, 156), 
        ID = 94
    }, 
    ["Cupid's Blessing"] = {
        Perks = {}, 
        RoleColor = Color3.fromRGB(255, 170, 255), 
        StartText = "<stroke color=\"#ff0000\" joins=\"miter\" thickness=\"1.5\" transparency=\"0.25\">", 
        EndText = "</stroke>", 
        ID = 95
    }, 
    ["2024 Anniversary Participant"] = {
        Perks = {}, 
        RoleColor = Color3.fromRGB(255, 255, 127), 
        ID = 96
    }, 
    ["Rocky's Nemesis"] = {
        Perks = {
            "1.10x DMG TO Supreme Giftbox, Rocky"
        }, 
        RoleColor = Color3.fromRGB(85, 85, 255), 
        PerkTags = {
            NPC = "Supreme Giftbox, Rocky", 
            dmgBoost = 1.1
        }, 
        Obtain = {
            Kills = 100, 
            NPC = "Supreme Giftbox, Rocky"
        }, 
        ArenaApply = true, 
        ID = 97
    }, 
    ["\240\159\144\176"] = {
        Perks = {
            "1.20x DMG TO Blo The Bunny"
        }, 
        RoleColor = Color3.fromRGB(255, 255, 255), 
        PerkTags = {
            NPC = "Blo The Bunny", 
            dmgBoost = 1.2
        }, 
        Obtain = {
            Kills = 50, 
            NPC = "Blo The Bunny"
        }, 
        ArenaApply = true, 
        ID = 98
    }, 
    ["\240\159\165\154"] = {
        Perks = {
            "Obtained from the roblox hatch event!"
        }, 
        RoleColor = Color3.fromRGB(255, 255, 255), 
        ArenaApply = true, 
        ID = 99
    }, 
    ["7-Day Login"] = {
        Perks = {}, 
        RoleColor = Color3.fromRGB(200, 200, 200), 
        Obtain = {
            ConsecutiveLogins = 7
        }, 
        ID = 100
    }, 
    ["30-Day Login"] = {
        Perks = {}, 
        RoleColor = Color3.fromRGB(210, 255, 210), 
        Obtain = {
            ConsecutiveLogins = 30
        }, 
        ID = 101
    }, 
    ["75-Day Login"] = {
        Perks = {}, 
        RoleColor = Color3.fromRGB(170, 220, 255), 
        Obtain = {
            ConsecutiveLogins = 75
        }, 
        ID = 102
    }, 
    ["Centennial Login"] = {
        Perks = {}, 
        StartText = "<stroke color=\"#3a2a00\" joins=\"miter\" thickness=\"2\" transparency=\"0.05\">", 
        EndText = "</stroke>", 
        RoleColor = Color3.fromRGB(255, 215, 0), 
        Obtain = {
            ConsecutiveLogins = 100
        }, 
        ID = 103
    }, 
    ["200-Day Login"] = {
        Perks = {}, 
        StartText = "<stroke color=\"#1f3b12\" joins=\"miter\" thickness=\"2\" transparency=\"0.05\">", 
        EndText = "</stroke>", 
        RoleColor = Color3.fromRGB(170, 255, 127), 
        Obtain = {
            ConsecutiveLogins = 200
        }, 
        ID = 104
    }, 
    ["300-Day Login"] = {
        Perks = {}, 
        StartText = "<stroke color=\"#0b2c59\" joins=\"miter\" thickness=\"2\" transparency=\"0.05\">", 
        EndText = "</stroke>", 
        RoleColor = Color3.fromRGB(85, 170, 255), 
        Obtain = {
            ConsecutiveLogins = 300
        }, 
        ID = 105
    }, 
    ["Annual Login"] = {
        Perks = {}, 
        StartText = "<stroke color=\"#0a2a44\" joins=\"miter\" thickness=\"2\" transparency=\"0.05\">", 
        EndText = "</stroke>", 
        RoleColor = Color3.fromRGB(120, 200, 255), 
        Obtain = {
            ConsecutiveLogins = 365
        }, 
        ID = 106
    }, 
    ["Quincent Login"] = {
        Perks = {}, 
        StartText = "<stroke color=\"#24004a\" joins=\"miter\" thickness=\"2\" transparency=\"0.05\">", 
        EndText = "</stroke>", 
        RoleColor = Color3.fromRGB(160, 100, 255), 
        Obtain = {
            ConsecutiveLogins = 500
        }, 
        ID = 107
    }, 
    ["Two-Year Login"] = {
        Perks = {}, 
        StartText = "<stroke color=\"#003a2d\" joins=\"miter\" thickness=\"2\" transparency=\"0.05\">", 
        EndText = "</stroke>", 
        RoleColor = Color3.fromRGB(0, 255, 170), 
        Obtain = {
            ConsecutiveLogins = 730
        }, 
        ID = 108
    }, 
    ["Millennium Login"] = {
        Perks = {}, 
        StartText = "<stroke color=\"#000000\" joins=\"miter\" thickness=\"2\" transparency=\"0.05\">", 
        EndText = "</stroke>", 
        RoleColor = Color3.fromRGB(255, 255, 255), 
        Obtain = {
            ConsecutiveLogins = 1000
        }, 
        ID = 109
    }, 
    Nightfall = {
        Perks = {}, 
        StartText = "<stroke color=\"#24004a\" joins=\"miter\" thickness=\"2\" transparency=\"0.05\">", 
        EndText = "</stroke>", 
        RoleColor = Color3.fromRGB(0, 0, 0), 
        ID = 110
    }, 
    ["Fruit Fisher"] = {
        Perks = {}, 
        RoleColor = Color3.fromRGB(102, 178, 255), 
        ID = 111
    }, 
    ["Candy Scout"] = {
        Perks = {}, 
        RoleColor = Color3.fromRGB(255, 255, 255), 
        ID = 112
    }, 
    ["Candy Champion"] = {
        Perks = {}, 
        RoleColor = Color3.fromRGB(255, 158, 102), 
        ID = 113
    }, 
    ["Candy King"] = {
        Perks = {}, 
        RoleColor = Color3.fromRGB(255, 103, 15), 
        ID = 114
    }, 
    ["High Spender"] = {
        Perks = {}, 
        RoleColor = Color3.fromRGB(255, 255, 127), 
        ID = 115
    }, 
    ["Tailored One"] = {
        Perks = {}, 
        RoleColor = Color3.fromRGB(255, 214, 133), 
        ID = 116
    }, 
    ["Mama's Favorite"] = {
        Perks = {
            "1.10x DMG TO BIG MAMA"
        }, 
        RoleColor = Color3.fromRGB(255, 170, 255), 
        PerkTags = {
            NPC = "Big Mama", 
            dmgBoost = 1.1
        }, 
        Obtain = {
            Kills = 25, 
            NPC = "Big Mama"
        }, 
        ID = 117
    }, 
    ["Whole Cake Survivor"] = {
        Perks = {}, 
        RoleColor = Color3.fromRGB(255, 222, 249), 
        ID = 118
    }, 
    ["Mama's Scholar"] = {
        Perks = {}, 
        RoleColor = Color3.fromRGB(203, 246, 255), 
        ID = 119
    }, 
    ["Mama's Gardener"] = {
        Perks = {}, 
        RoleColor = Color3.fromRGB(255, 223, 60), 
        ID = 120
    }, 
    ["Mama's Baker"] = {
        Perks = {}, 
        RoleColor = Color3.fromRGB(255, 194, 125), 
        ID = 121
    }, 
    ["Mama's Treasurer"] = {
        Perks = {}, 
        RoleColor = Color3.fromRGB(255, 170, 0), 
        ID = 122
    }, 
    ["Holly Jolly"] = {
        Perks = {
            "1% DMG boost TO NPCs"
        }, 
        PerkTags = {
            NPC = "All", 
            dmgBoost = 1.01
        }, 
        RoleColor = Color3.fromRGB(54, 221, 54), 
        StartText = "<stroke color=\"#c41e3a\" joins=\"miter\" thickness=\"1.5\" transparency=\"0.25\">", 
        EndText = "</stroke>", 
        ID = 123
    }
};