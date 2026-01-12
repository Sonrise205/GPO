deepcopy = function(v0) --[[ Line: 1 ]] --[[ Name: deepcopy ]]
    local v1 = type(v0);
    local v2 = nil;
    if v1 == "table" then
        v2 = {};
        for v3, v4 in next, v0 do
            v2[deepcopy(v3)] = deepcopy(v4);
        end;
        setmetatable(v2, deepcopy((getmetatable(v0))));
        return v2;
    else
        return v0;
    end;
end;
local v5 = {
    Yoru = {
        cooldown = 0.4, 
        BaseDMG = 20, 
        MaxDMG = 100, 
        extraBlock = 100, 
        Range = Vector3.new(13, 10, 10, 0), 
        Offset = CFrame.new(0, 0, -3), 
        trailTime = 0.3, 
        stunTime = 0.75, 
        animspeed = 1.5, 
        dmgMulti = 1, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Armament Haki", 
                "j"
            }
        }, 
        C0 = 5, 
        BWidth = 2, 
        showMax = false, 
        style = "Yoru"
    }, 
    Katana = {
        cooldown = 0.25, 
        BaseDMG = 5, 
        MaxDMG = 35, 
        extraBlock = 20, 
        Range = Vector3.new(8, 10, 9, 0), 
        Offset = CFrame.new(0, 0, -2.5), 
        trailTime = 0.4, 
        stunTime = 0.5, 
        animspeed = 1.25, 
        dmgMulti = 1, 
        style = "1SS", 
        C1 = -0.4, 
        hitSounds = {
            "rbxassetid://7564162713", 
            "rbxassetid://7564162829", 
            "rbxassetid://7564162960", 
            "rbxassetid://7564163090"
        }, 
        swingSFX = {
            "rbxassetid://7152981768", 
            "rbxassetid://7152981725", 
            "rbxassetid://7152981668"
        }, 
        pointsPerDMG = 25, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "36 Caliber Phoenix", 
                "e"
            }, 
            {
                "Rapid Slashes", 
                "r"
            }, 
            {
                "Raging Serpent", 
                "z"
            }, 
            {
                "Shishi Sonson", 
                "x"
            }, 
            {
                "Dragon Blaze", 
                "c"
            }, 
            {
                "Sword Style Swap", 
                "v"
            }
        }
    }, 
    Kiribachi = {
        cooldown = 0.4, 
        BaseDMG = 9, 
        MaxDMG = 40, 
        extraBlock = 50, 
        Range = Vector3.new(13, 10, 10, 0), 
        Offset = CFrame.new(0, 0, -3), 
        trailTime = 0.45, 
        stunTime = 2, 
        animspeed = 1.5, 
        dmgMulti = 1.5, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Armament Haki", 
                "j"
            }, 
            {
                "Kiribachi Frenzy", 
                "e"
            }, 
            {
                "Kiribachi Smash", 
                "r"
            }
        }, 
        swingSFX = {
            "rbxassetid://11184577226", 
            "rbxassetid://11184577515", 
            "rbxassetid://11184577078", 
            "rbxassetid://11184577164", 
            "rbxassetid://11184576998"
        }, 
        hitSounds = {
            "rbxassetid://11184577911", 
            "rbxassetid://11184577991", 
            "rbxassetid://11184577848", 
            "rbxassetid://11184578062", 
            "rbxassetid://11184577703"
        }, 
        swingVolume = 0.75, 
        pointsPerDMG = 22, 
        showMax = false
    }, 
    ["Golden Staff"] = {
        cooldown = 0.35, 
        BaseDMG = 7, 
        MaxDMG = 75, 
        extraBlock = 35, 
        Range = Vector3.new(10, 10, 10, 0), 
        Offset = CFrame.new(0, 0, -3), 
        trailTime = 0.5, 
        stunTime = 0.45, 
        animspeed = 1.5, 
        dmgMulti = 1.5, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Armament Haki", 
                "j"
            }, 
            {
                "Rapid Thrust", 
                "e"
            }, 
            {
                "Golden Sweep", 
                "r"
            }, 
            {
                "Pole Counter", 
                "z"
            }, 
            {
                "Golden Staff Transform", 
                "x"
            }
        }, 
        swingSFX = {
            "rbxassetid://6032297786", 
            "rbxassetid://6032297842", 
            "rbxassetid://6029847086", 
            "rbxassetid://6029847126", 
            "rbxassetid://6029847163"
        }, 
        hitSounds = {
            "rbxassetid://6029847244", 
            "rbxassetid://6029847276", 
            "rbxassetid://6029847315"
        }, 
        swingVolume = 1, 
        pointsPerDMG = 25, 
        scaleStat = "Strength", 
        showMax = false
    }, 
    Trident = {
        cooldown = 0.35, 
        BaseDMG = 7, 
        MaxDMG = 85, 
        extraBlock = 35, 
        Range = Vector3.new(10, 10, 10, 0), 
        Offset = CFrame.new(0, 0, -3), 
        trailTime = 0.5, 
        stunTime = 0.45, 
        animspeed = 1.5, 
        dmgMulti = 1.5, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Armament Haki", 
                "j"
            }, 
            {
                "Rapid Thrust", 
                "e"
            }, 
            {
                "Golden Sweep", 
                "r"
            }, 
            {
                "Pole Counter", 
                "z"
            }
        }, 
        swingSFX = {
            "rbxassetid://6032297786", 
            "rbxassetid://6032297842", 
            "rbxassetid://6029847086", 
            "rbxassetid://6029847126", 
            "rbxassetid://6029847163"
        }, 
        hitSounds = {
            "rbxassetid://6029847244", 
            "rbxassetid://6029847276", 
            "rbxassetid://6029847315"
        }, 
        swingVolume = 1, 
        pointsPerDMG = 20, 
        scaleStat = "Strength", 
        showMax = false
    }, 
    ["Candy Cane"] = {
        cooldown = 0.22, 
        BaseDMG = 6, 
        MaxDMG = 45, 
        extraBlock = 20, 
        Range = Vector3.new(8, 10, 11, 0), 
        Offset = CFrame.new(0, 0, -4), 
        trailTime = 0.425, 
        stunTime = 0.5, 
        animspeed = 1.5, 
        dmgMulti = 1, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Sweet Treat", 
                "e"
            }, 
            {
                "Flash Freeze", 
                "r"
            }
        }, 
        swingSFX = {
            "rbxassetid://6093463005", 
            "rbxassetid://6093463047", 
            "rbxassetid://6093463160"
        }, 
        hitSounds = {
            "rbxassetid://6093463131", 
            "rbxassetid://6093462967", 
            "rbxassetid://6093463089"
        }, 
        pointsPerDMG = 25, 
        showMax = false
    }, 
    ["Santa's Bells"] = {
        cooldown = 0.22, 
        BaseDMG = 7, 
        MaxDMG = 35, 
        extraBlock = 20, 
        Range = Vector3.new(5, 10, 6, 0), 
        Offset = CFrame.new(0, 0, -1), 
        trailTime = 0.425, 
        stunTime = 0.5, 
        animspeed = 1.5, 
        dmgMulti = 1, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Healing Rhyme", 
                "e"
            }
        }, 
        swingSFX = {
            "rbxassetid://6097141164", 
            "rbxassetid://6097141219", 
            "rbxassetid://6097141121"
        }, 
        hitSounds = {
            "rbxassetid://6097141026", 
            "rbxassetid://6097141076", 
            "rbxassetid://6097141363", 
            "rbxassetid://6097141327", 
            "rbxassetid://6097141280"
        }, 
        Pitch = false, 
        pointsPerDMG = 25, 
        scaleStat = "Strength", 
        showMax = false
    }, 
    ["Gravity Blade"] = {
        cooldown = 0.25, 
        BaseDMG = 6, 
        MaxDMG = 40, 
        extraBlock = 20, 
        Range = Vector3.new(8, 10, 9, 0), 
        Offset = CFrame.new(0, 0, -4), 
        trailTime = 0.425, 
        stunTime = 0.5, 
        animspeed = 1.5, 
        dmgMulti = 1, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Gravity Frenzy", 
                "e"
            }, 
            {
                "Gravity Field", 
                "r"
            }
        }, 
        swingSFX = {
            "rbxassetid://6252518264", 
            "rbxassetid://6252518315", 
            "rbxassetid://6252518355"
        }, 
        hitSounds = {
            "rbxassetid://6252518496", 
            "rbxassetid://6252518449", 
            "rbxassetid://6252518404"
        }, 
        pointsPerDMG = 25, 
        C1 = 0
    }, 
    ["Neptune's Trident"] = {
        cooldown = 0.25, 
        BaseDMG = 6, 
        MaxDMG = 55, 
        extraBlock = 20, 
        Range = Vector3.new(8, 10, 9, 0), 
        Offset = CFrame.new(0, 0, -4), 
        trailTime = 0.39, 
        stunTime = 0.75, 
        animspeed = 1.5, 
        dmgMulti = 1, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Trident Pull", 
                "e"
            }, 
            {
                "Trident Impale", 
                "r"
            }
        }, 
        swingSFX = {
            "rbxassetid://6303521048", 
            "rbxassetid://6303521146", 
            "rbxassetid://6303521101"
        }, 
        hitSounds = {
            "rbxassetid://6303521008", 
            "rbxassetid://6303521222", 
            "rbxassetid://6303521177"
        }, 
        pointsPerDMG = 25, 
        showMax = false
    }, 
    ["Flower Bouquet"] = {
        cooldown = 0.25, 
        BaseDMG = 5, 
        MaxDMG = 35, 
        extraBlock = 20, 
        Range = Vector3.new(5, 10, 7, 0), 
        Offset = CFrame.new(0, 0, -1), 
        trailTime = 0.25, 
        stunTime = 0.75, 
        animspeed = 1.5, 
        dmgMulti = 1, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Flower Smell", 
                "e"
            }, 
            {
                "Flower Charm", 
                "r"
            }
        }, 
        swingSFX = {
            "rbxassetid://6401495152", 
            "rbxassetid://6401495051", 
            "rbxassetid://6401495088"
        }, 
        hitSounds = {
            "rbxassetid://6401495119", 
            "rbxassetid://6401495218", 
            "rbxassetid://6401495189"
        }, 
        pointsPerDMG = 25, 
        showMax = false
    }, 
    Bisento = {
        cooldown = 0.325, 
        BaseDMG = 10, 
        MaxDMG = 75, 
        extraBlock = 20, 
        Range = Vector3.new(8, 10, 12, 0), 
        Offset = CFrame.new(0, 0, -4), 
        trailTime = 0.42, 
        stunTime = 1.25, 
        animspeed = 1.35, 
        dmgMulti = 1, 
        swingVolume = 0.75, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Heavy Sweep", 
                "e"
            }, 
            {
                "Shockwave Slash", 
                "r"
            }
        }, 
        swingSFX = {
            "rbxassetid://6589514393", 
            "rbxassetid://6589514208", 
            "rbxassetid://6589514445"
        }, 
        hitSounds = {
            "rbxassetid://6589514279", 
            "rbxassetid://6589514156", 
            "rbxassetid://6589514337"
        }, 
        pointsPerDMG = 22, 
        showMax = false
    }, 
    BossBisento = {
        cooldown = 0.4, 
        BaseDMG = 0, 
        MaxDMG = 30, 
        extraBlock = 20, 
        Range = Vector3.new(10, 10, 15, 0), 
        Offset = CFrame.new(0, 0, -4), 
        trailTime = 0.42, 
        stunTime = 1, 
        animspeed = 1.25, 
        dmgMulti = 1, 
        swingVolume = 0.75, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Heavy Sweep", 
                "e"
            }, 
            {
                "Shockwave Slash", 
                "r"
            }
        }, 
        swingSFX = {
            "rbxassetid://6589514393", 
            "rbxassetid://6589514208", 
            "rbxassetid://6589514445"
        }, 
        hitSounds = {
            "rbxassetid://6589514279", 
            "rbxassetid://6589514156", 
            "rbxassetid://6589514337"
        }, 
        pointsPerDMG = 25, 
        showMax = false
    }, 
    ["Elo's Sledgehammer"] = {
        cooldown = 0.35, 
        BaseDMG = 10, 
        MaxDMG = 65, 
        extraBlock = 20, 
        Range = Vector3.new(8, 10, 8.5, 0), 
        Offset = CFrame.new(0, 0, -4), 
        trailTime = 0.42, 
        stunTime = 2, 
        animspeed = 1.25, 
        dmgMulti = 1, 
        swingVolume = 0.75, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Elo Smash", 
                "e"
            }, 
            {
                "Pounding Festival", 
                "r"
            }
        }, 
        swingSFX = {
            "rbxassetid://6652261286", 
            "rbxassetid://6652261218", 
            "rbxassetid://6652261248"
        }, 
        hitSounds = {
            "rbxassetid://6652261365", 
            "rbxassetid://6652261399", 
            "rbxassetid://6652261324"
        }, 
        pointsPerDMG = 22, 
        scaleStat = "Strength", 
        showMax = false
    }, 
    ["2SS"] = {
        cooldown = 0.3, 
        BaseDMG = 5, 
        MaxDMG = 125, 
        extraBlock = 20, 
        Range = Vector3.new(12, 10, 8.25, 0), 
        Offset = CFrame.new(0, 0, -2.5), 
        trailTime = 0.4, 
        stunTime = 0.5, 
        animspeed = 1.25, 
        dmgMulti = 1, 
        style = "2SS", 
        C1 = -0.4, 
        swingSFX = {
            "rbxassetid://10608839958", 
            "rbxassetid://10608839427", 
            "rbxassetid://10608839210"
        }, 
        hitSounds = {
            "rbxassetid://10608840716", 
            "rbxassetid://10608840614", 
            "rbxassetid://10608840530"
        }, 
        pointsPerDMG = 22, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Armament Haki", 
                "j"
            }, 
            {
                "72 Caliber Phoenix", 
                "e"
            }, 
            {
                "Raging Whirl", 
                "r"
            }, 
            {
                "Tower Climb", 
                "z"
            }, 
            {
                "Nitoryu Strike", 
                "x"
            }, 
            {
                "Rashomon Draw", 
                "c"
            }, 
            {
                "Sword Style Swap", 
                "v"
            }
        }
    }, 
    ["Kraken Blade"] = {
        cooldown = 0.4, 
        BaseDMG = 10, 
        MaxDMG = 125, 
        extraBlock = 20, 
        Range = Vector3.new(12, 12, 8.5, 0), 
        Offset = CFrame.new(0, 0, -4), 
        trailTime = 0.475, 
        stunTime = 2, 
        animspeed = 1.2, 
        dmgMulti = 1, 
        swingVolume = 0.75, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Eternal Flow", 
                "e"
            }, 
            {
                "Slayer Cross Slash", 
                "r"
            }
        }, 
        swingSFX = {
            "rbxassetid://7072021979", 
            "rbxassetid://7072022064", 
            "rbxassetid://7072021858"
        }, 
        hitSounds = {
            "rbxassetid://7072021900", 
            "rbxassetid://7072022020", 
            "rbxassetid://7072021942"
        }, 
        pointsPerDMG = 20, 
        baseWeapon = "Kraken Blade", 
        showMax = false
    }, 
    ["Golden Hook"] = {
        cooldown = 0.25, 
        BaseDMG = 5, 
        MaxDMG = 65, 
        extraBlock = 20, 
        Range = Vector3.new(8, 10, 8, 0), 
        Offset = CFrame.new(0, 0, -0.5), 
        trailTime = 0.35, 
        stunTime = 0.75, 
        animspeed = 1.65, 
        dmgMulti = 1, 
        swingVolume = 0.75, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Activate Poison", 
                "e"
            }, 
            {
                "Hook Impale/Dehydrate", 
                "r"
            }
        }, 
        swingSFX = {
            "rbxassetid://7103348546", 
            "rbxassetid://7103348622", 
            "rbxassetid://7103348656"
        }, 
        hitSounds = {
            "rbxassetid://7103348516", 
            "rbxassetid://7103348582", 
            "rbxassetid://7103348479"
        }, 
        pointsPerDMG = 30, 
        showMax = false
    }, 
    ["Crab Cutlass"] = {
        cooldown = 0.275, 
        BaseDMG = 5, 
        MaxDMG = 55, 
        extraBlock = 20, 
        Range = Vector3.new(9, 7, 9, 0), 
        Offset = CFrame.new(0, 0, -4), 
        trailTime = 0.33, 
        stunTime = 0.5, 
        animspeed = 1.5, 
        dmgMulti = 1, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Cutlass Lunge", 
                "e"
            }, 
            {
                "Cutlass Ladder", 
                "r"
            }
        }, 
        swingSFX = {
            "rbxassetid://7173315963", 
            "rbxassetid://7173315777", 
            "rbxassetid://7173315815"
        }, 
        hitSounds = {
            "rbxassetid://7173316005", 
            "rbxassetid://7173315870", 
            "rbxassetid://7173315918"
        }, 
        C1 = 0, 
        pointsPerDMG = 25, 
        showMax = false
    }, 
    ["Demon Jester's Scythe"] = {
        cooldown = 0.325, 
        BaseDMG = 7, 
        MaxDMG = 75, 
        extraBlock = 20, 
        Range = Vector3.new(10, 10, 9, 0), 
        Offset = CFrame.new(0, 0, -4), 
        trailTime = 0.42, 
        stunTime = 1, 
        animspeed = 1.35, 
        dmgMulti = 1, 
        swingVolume = 0.75, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Crimson Slice", 
                "e"
            }, 
            {
                "Reaping Slash", 
                "r"
            }
        }, 
        swingSFX = {
            "rbxassetid://7619457908", 
            "rbxassetid://7619458306", 
            "rbxassetid://7619458102"
        }, 
        hitSounds = {
            "rbxassetid://7619457993", 
            "rbxassetid://7619457782", 
            "rbxassetid://7619457607"
        }, 
        pointsPerDMG = 22, 
        showMax = false
    }, 
    ["Hollow's Fang"] = {
        cooldown = 0.2, 
        BaseDMG = 5, 
        MaxDMG = 50, 
        extraBlock = 20, 
        Range = Vector3.new(8, 8, 8, 0), 
        Offset = CFrame.new(0, 0, -2), 
        trailTime = 0.3, 
        stunTime = 0.5, 
        animspeed = 1.5, 
        dmgMulti = 1, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Shadow's Mark", 
                "e"
            }, 
            {
                "Thousand Strikes", 
                "r"
            }
        }, 
        swingSFX = {
            "rbxassetid://7697818311", 
            "rbxassetid://7703911589", 
            "rbxassetid://7697818541", 
            "rbxassetid://7697818768", 
            "rbxassetid://7697818541"
        }, 
        hitSounds = {
            "rbxassetid://7697818417", 
            "rbxassetid://7703805150", 
            "rbxassetid://7697818651", 
            "rbxassetid://7697818862", 
            "rbxassetid://7697818651"
        }, 
        C1 = 0, 
        pointsPerDMG = 33, 
        showMax = false
    }, 
    ["Prestige Candy Cane"] = {
        cooldown = 0.22, 
        BaseDMG = 6, 
        MaxDMG = 45, 
        extraBlock = 20, 
        Range = Vector3.new(8, 10, 11, 0), 
        Offset = CFrame.new(0, 0, -4), 
        trailTime = 0.425, 
        stunTime = 0.5, 
        animspeed = 1.5, 
        dmgMulti = 1, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Prestige Sweet Treat", 
                "e"
            }, 
            {
                "Prestige Flash Freeze", 
                "r"
            }
        }, 
        swingSFX = {
            "rbxassetid://11585397243", 
            "rbxassetid://11585397349", 
            "rbxassetid://11585397378", 
            "rbxassetid://11585397209", 
            "rbxassetid://11585397317"
        }, 
        hitSounds = {
            "rbxassetid://11585397522", 
            "rbxassetid://11585397439", 
            "rbxassetid://11585397288", 
            "rbxassetid://11585397410", 
            "rbxassetid://11585397265"
        }, 
        pointsPerDMG = 25, 
        showMax = false
    }, 
    ["Festival Lancer"] = {
        cooldown = 0.4, 
        BaseDMG = 7, 
        MaxDMG = 75, 
        extraBlock = 20, 
        Range = Vector3.new(7, 7, 9, 0), 
        Offset = CFrame.new(0, 0, -4), 
        trailTime = 0.42, 
        stunTime = 2, 
        animspeed = 1.35, 
        dmgMulti = 1, 
        swingVolume = 0.75, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Frost Wall", 
                "e"
            }, 
            {
                "Festival Crash", 
                "r"
            }
        }, 
        swingSFX = {
            "rbxassetid://8091378794", 
            "rbxassetid://8091378622", 
            "rbxassetid://8091379014"
        }, 
        hitSounds = {
            "rbxassetid://8091378923", 
            "rbxassetid://8091379117", 
            "rbxassetid://8091378700"
        }, 
        pointsPerDMG = 22, 
        showMax = false
    }, 
    ["Festival Shield"] = {
        cooldown = 0.35, 
        BaseDMG = 7, 
        MaxDMG = 75, 
        extraBlock = 50, 
        Range = Vector3.new(6, 6, 5, 0), 
        Offset = CFrame.new(0, 0, -2), 
        trailTime = 0.375, 
        stunTime = 2, 
        animspeed = 1.5, 
        dmgMulti = 1, 
        swingVolume = 0.75, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Shield Bash", 
                "e"
            }, 
            {
                "Sharing is Caring!", 
                "r"
            }
        }, 
        swingSFX = {
            "rbxassetid://8179305930", 
            "rbxassetid://8179305709", 
            "rbxassetid://8179306898", 
            "rbxassetid://8199855668", 
            "rbxassetid://8179305709"
        }, 
        hitSounds = {
            "rbxassetid://8179306062", 
            "rbxassetid://8179305813", 
            "rbxassetid://8179305579", 
            "rbxassetid://8199855769", 
            "rbxassetid://8179305813"
        }, 
        pointsPerDMG = 22, 
        scaleStat = "Strength", 
        showMax = false
    }, 
    ["Cupid's Wand"] = {
        cooldown = 0.3, 
        BaseDMG = 4, 
        MaxDMG = 60, 
        extraBlock = 20, 
        Range = Vector3.new(7, 7, 7, 0), 
        Offset = CFrame.new(0, 0, -4), 
        trailTime = 0.42, 
        stunTime = 0.6, 
        animspeed = 1.35, 
        dmgMulti = 1, 
        swingVolume = 0.75, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Cupid's Blessing", 
                "e"
            }, 
            {
                "Cupid's Wrath", 
                "r"
            }
        }, 
        swingSFX = {
            "rbxassetid://8713290693", 
            "rbxassetid://8713290373", 
            "rbxassetid://8713291468", 
            "rbxassetid://8713290373"
        }, 
        hitSounds = {
            "rbxassetid://8715572336", 
            "rbxassetid://8715572231", 
            "rbxassetid://8715572133", 
            "rbxassetid://8715572052", 
            "rbxassetid://8715571978"
        }, 
        pointsPerDMG = 25, 
        showMax = false
    }, 
    ["Cupid's Battleaxe"] = {
        cooldown = 0.34, 
        BaseDMG = 10, 
        MaxDMG = 75, 
        extraBlock = 20, 
        Range = Vector3.new(7, 7, 9, 0), 
        Offset = CFrame.new(0, 0, -4), 
        trailTime = 0.42, 
        stunTime = 1, 
        animspeed = 1.35, 
        dmgMulti = 1, 
        swingVolume = 0.75, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Decimation", 
                "e"
            }, 
            {
                "Get over here!", 
                "r"
            }
        }, 
        swingSFX = {
            "rbxassetid://8753819770", 
            "rbxassetid://8753820555", 
            "rbxassetid://8753820142", 
            "rbxassetid://8753819421", 
            "rbxassetid://8753819288"
        }, 
        hitSounds = {
            "rbxassetid://8753820852", 
            "rbxassetid://8753820730", 
            "rbxassetid://8753819600", 
            "rbxassetid://8753819934", 
            "rbxassetid://8753820349"
        }, 
        pointsPerDMG = 20, 
        showMax = false
    }, 
    ["Moria's Scissors"] = {
        cooldown = 0.34, 
        BaseDMG = 7, 
        MaxDMG = 85, 
        extraBlock = 20, 
        Range = Vector3.new(7, 7, 9, 0), 
        Offset = CFrame.new(0, 0, -4), 
        trailTime = 0.42, 
        stunTime = 1, 
        animspeed = 1.35, 
        dmgMulti = 1, 
        swingVolume = 0.75, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Blade Whirl", 
                "e"
            }, 
            {
                "Shadow Extraction/Scissor Impale", 
                "r"
            }
        }, 
        swingSFX = {
            "rbxassetid://8918921552", 
            "rbxassetid://9017145088", 
            "rbxassetid://9017145843", 
            "rbxassetid://9017146121", 
            "rbxassetid://9017146371"
        }, 
        hitSounds = {
            "rbxassetid://8918922124", 
            "rbxassetid://8918922044", 
            "rbxassetid://8918921764", 
            "rbxassetid://8918921664", 
            "rbxassetid://8918921457"
        }, 
        pointsPerDMG = 22, 
        showMax = false
    }, 
    Shusui = {
        cooldown = 0.25, 
        BaseDMG = 5, 
        MaxDMG = 75, 
        extraBlock = 20, 
        Range = Vector3.new(8, 10, 8, 0), 
        Offset = CFrame.new(0, 0, -2.5), 
        trailTime = 0.4, 
        stunTime = 0.5, 
        animspeed = 1.25, 
        dmgMulti = 1, 
        C1 = -0.4, 
        hitSounds = {
            "rbxassetid://9604275752", 
            "rbxassetid://9604275966", 
            "rbxassetid://9604275543", 
            "rbxassetid://9604275658", 
            "rbxassetid://9604275893"
        }, 
        swingSFX = {
            "rbxassetid://9604275143", 
            "rbxassetid://9604274901", 
            "rbxassetid://9604274853", 
            "rbxassetid://9604275303", 
            "rbxassetid://9604275414"
        }, 
        pointsPerDMG = 25, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Crescent Slash", 
                "e"
            }, 
            {
                "Triple Ripple", 
                "r"
            }
        }
    }, 
    ["Knight's Gauntlet"] = {
        cooldown = 0.23, 
        BaseDMG = 5, 
        MaxDMG = 90, 
        extraBlock = 45, 
        Range = Vector3.new(8, 10, 7, 0), 
        Offset = CFrame.new(0, 0, -2.5), 
        trailTime = 0.4, 
        stunTime = 0.5, 
        animspeed = 1.35, 
        dmgMulti = 1, 
        hitSounds = {
            "rbxassetid://9630328289", 
            "rbxassetid://9630328090", 
            "rbxassetid://9630327106", 
            "rbxassetid://9630327786", 
            "rbxassetid://9630327513"
        }, 
        swingSFX = {
            "rbxassetid://9630326906", 
            "rbxassetid://9630327235", 
            "rbxassetid://9630327360", 
            "rbxassetid://9630327672", 
            "rbxassetid://9630327924"
        }, 
        pointsPerDMG = 22.5, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Over Shoulder Slam", 
                "e"
            }, 
            {
                "Grand Entrance Slam", 
                "r"
            }
        }, 
        showMax = false, 
        scaleStat = "Strength", 
        attackParticle = "Melee"
    }, 
    ["Soul Cane"] = {
        cooldown = 0.22, 
        BaseDMG = 6, 
        MaxDMG = 55, 
        extraBlock = 20, 
        Range = Vector3.new(8, 10, 9, 0), 
        Offset = CFrame.new(0, 0, -4), 
        trailTime = 0.425, 
        stunTime = 0.5, 
        animspeed = 1.5, 
        dmgMulti = 1, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Soul Parade", 
                "e"
            }, 
            {
                "Drawing Song", 
                "r"
            }
        }, 
        swingSFX = {
            "rbxassetid://9612581551", 
            "rbxassetid://9612581466", 
            "rbxassetid://9612581396"
        }, 
        hitSounds = {
            "rbxassetid://9612582028", 
            "rbxassetid://9612581829", 
            "rbxassetid://9612581765", 
            "rbxassetid://9612581672", 
            "rbxassetid://9612581948"
        }, 
        pointsPerDMG = 25, 
        showMax = false
    }, 
    Boneshiver = {
        cooldown = 0.34, 
        BaseDMG = 7, 
        MaxDMG = 85, 
        extraBlock = 20, 
        Range = Vector3.new(7, 7, 9, 0), 
        Offset = CFrame.new(0, 0, -4), 
        trailTime = 0.52, 
        stunTime = 1, 
        animspeed = 1.25, 
        dmgMulti = 1, 
        swingVolume = 0.75, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Bone Frenzy", 
                "e"
            }, 
            {
                "Rib Smash", 
                "r"
            }
        }, 
        swingSFX = {
            "rbxassetid://10621319809", 
            "rbxassetid://10621320020", 
            "rbxassetid://10621320766", 
            "rbxassetid://10621321182", 
            "rbxassetid://10621321449"
        }, 
        hitSounds = {
            "rbxassetid://10621318011", 
            "rbxassetid://10621318358", 
            "rbxassetid://10621318792", 
            "rbxassetid://10621319145", 
            "rbxassetid://10621319485"
        }, 
        pointsPerDMG = 22, 
        scaleStat = "Strength", 
        showMax = false
    }, 
    ["World Ender"] = {
        cooldown = 0.4, 
        BaseDMG = 10, 
        MaxDMG = 125, 
        extraBlock = 20, 
        Range = Vector3.new(12, 12, 12, 0), 
        Offset = CFrame.new(0, 0, -4), 
        trailTime = 0.4, 
        stunTime = 2, 
        animspeed = 1.4, 
        dmgMulti = 1, 
        swingVolume = 0.75, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "THE TROXX", 
                "e"
            }, 
            {
                "Soul Eater", 
                "r"
            }
        }, 
        swingSFX = {
            "rbxassetid://11315332505", 
            "rbxassetid://11315332880", 
            "rbxassetid://11315332437", 
            "rbxassetid://11315332601", 
            "rbxassetid://11315332371"
        }, 
        hitSounds = {
            "rbxassetid://11315333046", 
            "rbxassetid://11315333116", 
            "rbxassetid://11315332799", 
            "rbxassetid://11315332972", 
            "rbxassetid://11315332709"
        }, 
        pointsPerDMG = 20, 
        showMax = false
    }, 
    ["Vrael's Pipe"] = {
        cooldown = 0.35, 
        BaseDMG = 8, 
        MaxDMG = 85, 
        extraBlock = 35, 
        Range = Vector3.new(10, 10, 10, 0), 
        Offset = CFrame.new(0, 0, -3), 
        trailTime = 0.45, 
        stunTime = 0.45, 
        animspeed = 1.25, 
        dmgMulti = 1.5, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Pipe Rush", 
                "e"
            }, 
            {
                "Pipe Beatdown", 
                "r"
            }
        }, 
        swingSFX = {
            "rbxassetid://11382654106", 
            "rbxassetid://11382653932", 
            "rbxassetid://11382654063", 
            "rbxassetid://11382654005", 
            "rbxassetid://11382653877"
        }, 
        hitSounds = {
            "rbxassetid://11382654316", 
            "rbxassetid://11382654280", 
            "rbxassetid://11382654228", 
            "rbxassetid://11382654184", 
            "rbxassetid://11382654364"
        }, 
        pointsPerDMG = 25, 
        scaleStat = "Strength", 
        showMax = false
    }, 
    ["Firework Lancer"] = {
        cooldown = 0.25, 
        BaseDMG = 6, 
        MaxDMG = 75, 
        extraBlock = 25, 
        Range = Vector3.new(10, 10, 10, 0), 
        Offset = CFrame.new(0, 0, -4), 
        trailTime = 0.39, 
        stunTime = 0.75, 
        animspeed = 1.5, 
        dmgMulti = 1, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "TO THE MOON!", 
                "e"
            }, 
            {
                "Firework Rush", 
                "r"
            }
        }, 
        swingSFX = {
            "rbxassetid://11509751899", 
            "rbxassetid://11509751776", 
            "rbxassetid://11509752041", 
            "rbxassetid://11509751873", 
            "rbxassetid://11509751843"
        }, 
        hitSounds = {
            "rbxassetid://11509752109", 
            "rbxassetid://11509752069", 
            "rbxassetid://11509751806", 
            "rbxassetid://11509752005", 
            "rbxassetid://11509751954"
        }, 
        pointsPerDMG = 25, 
        showMax = false
    }, 
    ["Inferno Rocket Blade"] = {
        cooldown = 0.325, 
        BaseDMG = 5, 
        MaxDMG = 50, 
        extraBlock = 20, 
        Range = Vector3.new(7, 7, 9, 0), 
        Offset = CFrame.new(0, 0, -4), 
        trailTime = 0.4, 
        stunTime = 0.5, 
        animspeed = 1.35, 
        dmgMulti = 1, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Explosive Field", 
                "e"
            }, 
            {
                "SUPER MEGA DEATH ROCKET", 
                "r"
            }
        }, 
        swingSFX = {
            "rbxassetid://11546446103", 
            "rbxassetid://11546446552", 
            "rbxassetid://11546445763", 
            "rbxassetid://11546445999", 
            "rbxassetid://11546445882"
        }, 
        hitSounds = {
            "rbxassetid://11546446664", 
            "rbxassetid://11546446754", 
            "rbxassetid://11546446204", 
            "rbxassetid://11546446419", 
            "rbxassetid://11546446316"
        }, 
        pointsPerDMG = 25, 
        showMax = false, 
        scaleStat = "GunMastery"
    }, 
    ["Iceborn Daggers"] = {
        cooldown = 0.25, 
        BaseDMG = 5, 
        MaxDMG = 50, 
        extraBlock = 20, 
        Range = Vector3.new(8, 8, 8, 0), 
        Offset = CFrame.new(0, 0, -2), 
        trailTime = 0.3, 
        stunTime = 0.5, 
        animspeed = 1, 
        dmgMulti = 1, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Iceborn Aura", 
                "e"
            }, 
            {
                "Iceborn Death Lotus", 
                "r"
            }
        }, 
        swingSFX = {
            "rbxassetid://11755760314", 
            "rbxassetid://11755760211", 
            "rbxassetid://11755895391", 
            "rbxassetid://11755760185", 
            "rbxassetid://11755760127"
        }, 
        hitSounds = {
            "rbxassetid://11755760387", 
            "rbxassetid://11755760363", 
            "rbxassetid://11755760338", 
            "rbxassetid://11755760235", 
            "rbxassetid://11755760162"
        }, 
        C1 = 0, 
        pointsPerDMG = 33, 
        showMax = false
    }, 
    ["Tori-Tori"] = {
        cooldown = 0.25, 
        BaseDMG = 5, 
        MaxDMG = 50, 
        extraBlock = 20, 
        Range = Vector3.new(8, 10, 7, 0), 
        Offset = CFrame.new(0, 0, -3), 
        trailTime = 0.425, 
        stunTime = 0.5, 
        animspeed = 1.5, 
        dmgMulti = 1, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Sweet Treat", 
                "e"
            }, 
            {
                "Flash Freeze", 
                "r"
            }
        }, 
        swingSFX = {
            "rbxassetid://6158211658", 
            "rbxassetid://6158211388", 
            "rbxassetid://6158211322"
        }, 
        hitSounds = {
            "rbxassetid://10618363411", 
            "rbxassetid://10618363327", 
            "rbxassetid://10618362905"
        }, 
        pointsPerDMG = 33, 
        scaleStat = "DevilFruitMastery", 
        showMax = false
    }, 
    ["Iceborn Rapier"] = {
        cooldown = 0.22, 
        BaseDMG = 6, 
        MaxDMG = 55, 
        extraBlock = 20, 
        Range = Vector3.new(8, 10, 9, 0), 
        Offset = CFrame.new(0, 0, -4), 
        trailTime = 0.425, 
        stunTime = 0.5, 
        animspeed = 1.5, 
        dmgMulti = 1, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Iceborn Lunge", 
                "e"
            }, 
            {
                "Iceborn Shards", 
                "r"
            }
        }, 
        swingSFX = {
            "rbxassetid://11838468180", 
            "rbxassetid://11838468137", 
            "rbxassetid://11838467966", 
            "rbxassetid://11838468071", 
            "rbxassetid://11838468381"
        }, 
        hitSounds = {
            "rbxassetid://11838468588", 
            "rbxassetid://11838468530", 
            "rbxassetid://11838468315", 
            "rbxassetid://11838468458", 
            "rbxassetid://11838468249"
        }, 
        pointsPerDMG = 25, 
        showMax = false
    }, 
    ["Spring-Spring Mode"] = {
        cooldown = 0.275, 
        BaseDMG = 8, 
        MaxDMG = 50, 
        extraBlock = 20, 
        Range = Vector3.new(7, 7, 12, 0), 
        Offset = CFrame.new(0, 0, -3), 
        trailTime = 0.3, 
        stunTime = 0.5, 
        animspeed = 1, 
        dmgMulti = 1, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Iceborn Aura", 
                "e"
            }, 
            {
                "Iceborn Death Lotus", 
                "r"
            }
        }, 
        swingSFX = {
            "rbxassetid://12510132676", 
            "rbxassetid://12510132831", 
            "rbxassetid://12510132908", 
            "rbxassetid://12510133012", 
            "rbxassetid://12510133111"
        }, 
        hitSounds = {
            "rbxassetid://12510133393", 
            "rbxassetid://12510133295", 
            "rbxassetid://12510133333", 
            "rbxassetid://12510132950", 
            "rbxassetid://12510132741"
        }, 
        C1 = 0, 
        pointsPerDMG = 12, 
        showMax = false, 
        scaleStat = "Strength", 
        attackParticle = "Melee"
    }, 
    Kessui = {
        cooldown = 0.275, 
        BaseDMG = 8, 
        MaxDMG = 50, 
        extraBlock = 20, 
        Range = Vector3.new(7, 7, 12, 0), 
        Offset = CFrame.new(0, 0, -3), 
        trailTime = 0.3, 
        stunTime = 0.25, 
        animspeed = 1, 
        dmgMulti = 1, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Kessui Ignite", 
                "e"
            }, 
            {
                "Kessui Barrage", 
                "r"
            }
        }, 
        swingSFX = {
            "rbxassetid://12654715158", 
            "rbxassetid://12654712319", 
            "rbxassetid://12654712294", 
            "rbxassetid://12654712223", 
            "rbxassetid://12654712160"
        }, 
        hitSounds = {
            "rbxassetid://12654713238", 
            "rbxassetid://12654713130", 
            "rbxassetid://12654713021", 
            "rbxassetid://12654712950", 
            "rbxassetid://12654712358"
        }, 
        C1 = 0, 
        pointsPerDMG = 22, 
        showMax = false
    }, 
    Kikoku = {
        cooldown = 0.275, 
        BaseDMG = 8, 
        MaxDMG = 75, 
        extraBlock = 20, 
        Range = Vector3.new(7, 7, 12, 0), 
        Offset = CFrame.new(0, 0, -3), 
        trailTime = 0.325, 
        stunTime = 0.25, 
        animspeed = 1, 
        dmgMulti = 1, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Sterben Linie", 
                "e"
            }, 
            {
                "Amputate", 
                "r"
            }, 
            {
                "Sterben Kreis", 
                "z"
            }, 
            {
                "Amputating Cleave", 
                "x"
            }
        }, 
        swingSFX = {
            "rbxassetid://13132779383", 
            "rbxassetid://13132778847", 
            "rbxassetid://13132778750", 
            "rbxassetid://13132779079", 
            "rbxassetid://13132778653"
        }, 
        hitSounds = {
            "rbxassetid://13132779286", 
            "rbxassetid://13132779173", 
            "rbxassetid://13132778933", 
            "rbxassetid://13132778552", 
            "rbxassetid://13132779008"
        }, 
        C1 = 0, 
        pointsPerDMG = 23, 
        customHaki = true, 
        SeaStone = true
    }, 
    Raiui = {
        cooldown = 0.25, 
        BaseDMG = 5, 
        MaxDMG = 75, 
        extraBlock = 20, 
        Range = Vector3.new(8, 10, 9, 0), 
        Offset = CFrame.new(0, 0, -2.5), 
        trailTime = 0.4, 
        stunTime = 0.5, 
        animspeed = 1.25, 
        dmgMulti = 1, 
        C1 = -0.4, 
        hitSounds = {
            "rbxassetid://14511577711", 
            "rbxassetid://14511577644", 
            "rbxassetid://14511577579", 
            "rbxassetid://14511577301", 
            "rbxassetid://14511577172"
        }, 
        swingSFX = {
            "rbxassetid://14511577419", 
            "rbxassetid://14511577041", 
            "rbxassetid://14511576953", 
            "rbxassetid://14511576858", 
            "rbxassetid://14511577520"
        }, 
        pointsPerDMG = 25, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Ruthless Blade", 
                "e"
            }, 
            {
                "Dragon Flash", 
                "r"
            }
        }
    }, 
    ["Firework Daggers"] = {
        cooldown = 0.25, 
        BaseDMG = 5, 
        MaxDMG = 50, 
        extraBlock = 20, 
        Range = Vector3.new(7, 7, 7, 0), 
        Offset = CFrame.new(0, 0, -2), 
        trailTime = 0.4, 
        stunTime = 0.5, 
        animspeed = 1, 
        dmgMulti = 1, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Firework Parade", 
                "e"
            }, 
            {
                "Dashing Pyrotechnics", 
                "r"
            }
        }, 
        swingSFX = {
            "rbxassetid://14850868607", 
            "rbxassetid://14850868963", 
            "rbxassetid://14850868880", 
            "rbxassetid://14850869218", 
            "rbxassetid://14850868777"
        }, 
        hitSounds = {
            "rbxassetid://14850869529", 
            "rbxassetid://14850869434", 
            "rbxassetid://14850869315", 
            "rbxassetid://14850869038", 
            "rbxassetid://14850869108"
        }, 
        C1 = 0, 
        swingVolume = 0.5, 
        pointsPerDMG = 33, 
        showMax = false
    }, 
    ["Roger's Ace"] = {
        cooldown = 0.25, 
        BaseDMG = 5, 
        MaxDMG = 75, 
        extraBlock = 20, 
        Range = Vector3.new(8, 10, 9, 0), 
        Offset = CFrame.new(0, 0, -2.5), 
        trailTime = 0.4, 
        stunTime = 0.5, 
        animspeed = 1.25, 
        dmgMulti = 1, 
        C1 = -0.4, 
        hitSounds = {
            "rbxassetid://14827754123", 
            "rbxassetid://14827754059", 
            "rbxassetid://14827754091", 
            "rbxassetid://14827754038", 
            "rbxassetid://14827754010"
        }, 
        swingSFX = {
            "rbxassetid://14827753980", 
            "rbxassetid://14827753946", 
            "rbxassetid://14827753916", 
            "rbxassetid://14827753824", 
            "rbxassetid://14827753756"
        }, 
        pointsPerDMG = 25, 
        customHaki = true, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Final Retort", 
                "e"
            }, 
            {
                "Laughing Counter", 
                "r"
            }, 
            {
                "Overflow", 
                "z"
            }, 
            {
                "Divine Departure", 
                "x"
            }
        }, 
        SeaStone = true
    }, 
    ["Black Pitchfork"] = {
        cooldown = 0.275, 
        BaseDMG = 6, 
        MaxDMG = 55, 
        extraBlock = 20, 
        Range = Vector3.new(8, 10, 9, 0), 
        Offset = CFrame.new(0, 0, -4), 
        trailTime = 0.39, 
        stunTime = 0.75, 
        animspeed = 1.2, 
        dmgMulti = 1, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Pitchfork Impale", 
                "e"
            }, 
            {
                "Pitchfork Dance", 
                "r"
            }
        }, 
        swingSFX = {
            "rbxassetid://15091297221", 
            "rbxassetid://15091297142", 
            "rbxassetid://15091297183", 
            "rbxassetid://15091297074", 
            "rbxassetid://15091296980"
        }, 
        hitSounds = {
            "rbxassetid://15091297319", 
            "rbxassetid://15091297263", 
            "rbxassetid://15091296883", 
            "rbxassetid://15091297408", 
            "rbxassetid://15091296816"
        }, 
        pointsPerDMG = 25, 
        showMax = false
    }, 
    ["Stark Gun"] = {
        cooldown = 0.25, 
        BaseDMG = 5, 
        MaxDMG = 50, 
        extraBlock = 20, 
        Range = Vector3.new(9, 7, 13, 0), 
        Offset = CFrame.new(0, 0, -6), 
        trailTime = 0.33, 
        stunTime = 0.5, 
        animspeed = 1, 
        dmgMulti = 1, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Right Gun", 
                "e"
            }, 
            {
                "Soul Wolves", 
                "r"
            }, 
            {
                "Cero Metralleta", 
                "z"
            }
        }, 
        swingSFX = {
            "rbxassetid://15028032470", 
            "rbxassetid://15028032114", 
            "rbxassetid://15028031970", 
            "rbxassetid://15028032371", 
            "rbxassetid://15028032186"
        }, 
        hitSounds = {
            "rbxassetid://15028032790", 
            "rbxassetid://15028032894", 
            "rbxassetid://15028032701", 
            "rbxassetid://15028032279", 
            "rbxassetid://15028032597"
        }, 
        C1 = 0, 
        pointsPerDMG = 33, 
        showMax = false, 
        scaleStat = "GunMastery"
    }, 
    ["Hollow's Halberd"] = {
        cooldown = 0.325, 
        BaseDMG = 10, 
        MaxDMG = 75, 
        extraBlock = 20, 
        Range = Vector3.new(8, 10, 12, 0), 
        Offset = CFrame.new(0, 0, -4), 
        trailTime = 0.42, 
        stunTime = 1.25, 
        animspeed = 1.35, 
        dmgMulti = 1, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Hollow Sweep", 
                "e"
            }, 
            {
                "Hollow Impale", 
                "r"
            }
        }, 
        swingSFX = {
            "rbxassetid://15039388690", 
            "rbxassetid://15039388617", 
            "rbxassetid://15039389621", 
            "rbxassetid://15039388387", 
            "rbxassetid://15039388447"
        }, 
        hitSounds = {
            "rbxassetid://15039389174", 
            "rbxassetid://15039388968", 
            "rbxassetid://15039388854", 
            "rbxassetid://15039389086", 
            "rbxassetid://15039389046"
        }, 
        pointsPerDMG = 22, 
        showMax = false
    }, 
    ["Hollow's Great Sword"] = {
        cooldown = 0.4, 
        BaseDMG = 10, 
        MaxDMG = 125, 
        extraBlock = 20, 
        Range = Vector3.new(8, 12, 12, 0), 
        Offset = CFrame.new(0, 0, -4), 
        trailTime = 0.475, 
        stunTime = 2, 
        animspeed = 1.2, 
        dmgMulti = 1, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Spirit Pierce", 
                "e"
            }, 
            {
                "Ghost Barrage", 
                "r"
            }
        }, 
        swingSFX = {
            "rbxassetid://15147514775", 
            "rbxassetid://15147514972", 
            "rbxassetid://15147514534", 
            "rbxassetid://15147514912", 
            "rbxassetid://15147514659"
        }, 
        hitSounds = {
            "rbxassetid://15147515221", 
            "rbxassetid://15147515178", 
            "rbxassetid://15147515016", 
            "rbxassetid://15147515134", 
            "rbxassetid://15147514863"
        }, 
        pointsPerDMG = 20, 
        showMax = false
    }, 
    ["Vera's Whip"] = {
        cooldown = 0.4, 
        BaseDMG = 4, 
        MaxDMG = 125, 
        extraBlock = 20, 
        Range = Vector3.new(8, 12, 12, 0), 
        Offset = CFrame.new(0, 0, -4), 
        trailTime = 0.475, 
        stunTime = 2, 
        animspeed = 1.25, 
        dmgMulti = 1, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Whip Slam", 
                "e"
            }, 
            {
                "Tempestuous Defence", 
                "r"
            }
        }, 
        swingSFX = {
            "rbxassetid://15248728793", 
            "rbxassetid://15248728519", 
            "rbxassetid://15248728594", 
            "rbxassetid://15248728720", 
            "rbxassetid://15248728654"
        }, 
        hitSounds = {
            "rbxassetid://15248729339", 
            "rbxassetid://15248729545", 
            "rbxassetid://15248729264", 
            "rbxassetid://15248729389", 
            "rbxassetid://15248729193"
        }, 
        pointsPerDMG = 45, 
        AnimationWeight = 5, 
        runSpeed = 2.3, 
        showMax = false
    }, 
    ["Iceborn Blade"] = {
        cooldown = 0.3, 
        BaseDMG = 6, 
        MaxDMG = 55, 
        extraBlock = 20, 
        Range = Vector3.new(8, 10, 9, 0), 
        Offset = CFrame.new(0, 0, -4), 
        trailTime = 0.425, 
        stunTime = 0.5, 
        animspeed = 1.5, 
        dmgMulti = 1, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Hellheim's Storm", 
                "e"
            }, 
            {
                "Flames Of Frost", 
                "r"
            }
        }, 
        swingSFX = {
            "rbxassetid://15706175693", 
            "rbxassetid://15706175582", 
            "rbxassetid://15706174952", 
            "rbxassetid://15706174803", 
            "rbxassetid://15706174437"
        }, 
        hitSounds = {
            "rbxassetid://15519384547", 
            "rbxassetid://15519384461", 
            "rbxassetid://15519384377", 
            "rbxassetid://15519384275", 
            "rbxassetid://15519383958"
        }, 
        pointsPerDMG = 25, 
        runSpeed = 1.5, 
        swingVolume = 0.4, 
        showMax = false
    }, 
    ["Firework Rocket Launcher"] = {
        cooldown = 0.35, 
        BaseDMG = 5, 
        MaxDMG = 75, 
        extraBlock = 20, 
        Range = Vector3.new(8, 10, 9, 0), 
        Offset = CFrame.new(0, 0, -2.5), 
        trailTime = 0.4, 
        stunTime = 0.5, 
        animspeed = 1.45, 
        dmgMulti = 1, 
        hitSounds = {
            "rbxassetid://15613217888", 
            "rbxassetid://15613217697", 
            "rbxassetid://15613217466", 
            "rbxassetid://15613216460", 
            "rbxassetid://15613217273"
        }, 
        swingSFX = {
            "rbxassetid://15627299967", 
            "rbxassetid://15613216851", 
            "rbxassetid://15613216644", 
            "rbxassetid://15613217081", 
            "rbxassetid://15613216016"
        }, 
        pointsPerDMG = 25, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Firework Rocket", 
                "e"
            }, 
            {
                "Skyhigh Firework Rocket", 
                "r"
            }
        }, 
        runSpeed = 1.5, 
        showMax = false, 
        scaleStat = "GunMastery"
    }, 
    ["Iceborn Katana"] = {
        cooldown = 0.3, 
        BaseDMG = 5, 
        MaxDMG = 75, 
        extraBlock = 20, 
        Range = Vector3.new(8, 10, 8, 0), 
        Offset = CFrame.new(0, 0, -2.5), 
        trailTime = 0.4, 
        stunTime = 0.5, 
        animspeed = 1.25, 
        dmgMulti = 1, 
        hitSounds = {
            "rbxassetid://15647086749", 
            "rbxassetid://15647086857", 
            "rbxassetid://15647086637", 
            "rbxassetid://15647086493", 
            "rbxassetid://15647086317"
        }, 
        swingSFX = {
            "rbxassetid://15647084973", 
            "rbxassetid://15647085411", 
            "rbxassetid://15647084876", 
            "rbxassetid://15647084707", 
            "rbxassetid://15647084567"
        }, 
        pointsPerDMG = 25, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Frost Flash", 
                "e"
            }, 
            {
                "Frostfall Cascade", 
                "r"
            }
        }, 
        runSpeed = 1.3, 
        showMax = false
    }, 
    ["Iceborn Battleaxe"] = {
        cooldown = 0.34, 
        BaseDMG = 10, 
        MaxDMG = 75, 
        extraBlock = 20, 
        Range = Vector3.new(7, 7, 9, 0), 
        Offset = CFrame.new(0, 0, -4), 
        trailTime = 0.42, 
        stunTime = 1, 
        animspeed = 1.35, 
        dmgMulti = 1, 
        swingVolume = 0.75, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Decimation", 
                "e"
            }, 
            {
                "Get over here!", 
                "r"
            }
        }, 
        swingSFX = {
            "rbxassetid://8753819770", 
            "rbxassetid://8753820555", 
            "rbxassetid://8753820142", 
            "rbxassetid://8753819421", 
            "rbxassetid://8753819288"
        }, 
        hitSounds = {
            "rbxassetid://8753820852", 
            "rbxassetid://8753820730", 
            "rbxassetid://8753819600", 
            "rbxassetid://8753819934", 
            "rbxassetid://8753820349"
        }, 
        pointsPerDMG = 20, 
        showMax = false
    }, 
    ["Flower Sword"] = {
        cooldown = 0.3, 
        BaseDMG = 5, 
        MaxDMG = 75, 
        extraBlock = 20, 
        Range = Vector3.new(8, 10, 8, 0), 
        Offset = CFrame.new(0, 0, -2.5), 
        trailTime = 0.4, 
        stunTime = 0.5, 
        animspeed = 1.25, 
        dmgMulti = 1, 
        hitSounds = {
            "rbxassetid://16629595830", 
            "rbxassetid://16629595729", 
            "rbxassetid://16629595417", 
            "rbxassetid://16629595151", 
            "rbxassetid://16629595028"
        }, 
        swingSFX = {
            "rbxassetid://16629594939", 
            "rbxassetid://16629594791", 
            "rbxassetid://16629594524", 
            "rbxassetid://16629594184", 
            "rbxassetid://16629594853"
        }, 
        pointsPerDMG = 25, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Flower Aroma", 
                "e"
            }, 
            {
                "Absolute Seduction", 
                "r"
            }
        }, 
        runSpeed = 1.5, 
        showMax = false
    }, 
    ["Dark Blade"] = {
        cooldown = 0.4, 
        BaseDMG = 10, 
        MaxDMG = 175, 
        extraBlock = 20, 
        Range = Vector3.new(13, 12, 12, 0), 
        Offset = CFrame.new(0, 0, -4), 
        trailTime = 0.4, 
        stunTime = 2, 
        animspeed = 1.25, 
        dmgMulti = 1, 
        hitSounds = {
            "rbxassetid://17343088055", 
            "rbxassetid://17343087574", 
            "rbxassetid://17343087908", 
            "rbxassetid://17343087758", 
            "rbxassetid://17343087158"
        }, 
        swingSFX = {
            "rbxassetid://17343069316", 
            "rbxassetid://17343069168", 
            "rbxassetid://17343069480", 
            "rbxassetid://17343069642", 
            "rbxassetid://17343069044"
        }, 
        pointsPerDMG = 25, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Thousand Slices", 
                "e"
            }, 
            {
                "Nightfall Counter", 
                "r"
            }, 
            {
                "Nightfall Rush", 
                "z"
            }, 
            {
                "World's Strongest Slash", 
                "x"
            }
        }, 
        runSpeed = 1.5, 
        customHaki = true, 
        SeaStone = true
    }, 
    ["Inverted Spear of Heaven"] = {
        cooldown = 0.225, 
        BaseDMG = 5, 
        MaxDMG = 50, 
        extraBlock = 20, 
        Range = Vector3.new(8, 8, 8, 0), 
        Offset = CFrame.new(0, 0, -2), 
        trailTime = 0.3, 
        stunTime = 0.5, 
        animspeed = 1.5, 
        dmgMulti = 1, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Massacre Counter", 
                "e"
            }, 
            {
                "Chain Reel", 
                "r"
            }
        }, 
        swingSFX = {
            "rbxassetid://18212649337", 
            "rbxassetid://18212650342", 
            "rbxassetid://18212648820", 
            "rbxassetid://18212649144", 
            "rbxassetid://18212649848"
        }, 
        hitSounds = {
            "rbxassetid://18212651086", 
            "rbxassetid://18212650579", 
            "rbxassetid://18212650855", 
            "rbxassetid://18212650099", 
            "rbxassetid://18212648983"
        }, 
        C1 = 0, 
        runSpeed = 1.2, 
        pointsPerDMG = 33, 
        showMax = false
    }, 
    ["PikaV2-PikaV2"] = {
        cooldown = 0.3, 
        BaseDMG = 5, 
        MaxDMG = 50, 
        extraBlock = 20, 
        Range = Vector3.new(13, 12, 12, 0), 
        Offset = CFrame.new(0, 0, -4), 
        trailTime = 0.3, 
        stunTime = 0.5, 
        animspeed = 1.5, 
        dmgMulti = 1, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Massacre Counter", 
                "e"
            }, 
            {
                "Chain Reel", 
                "r"
            }
        }, 
        swingSFX = {
            "rbxassetid://18787973744", 
            "rbxassetid://18787974767", 
            "rbxassetid://18787975798", 
            "rbxassetid://18787975039", 
            "rbxassetid://18787973428"
        }, 
        hitSounds = {
            "rbxassetid://18787977400", 
            "rbxassetid://18787978650", 
            "rbxassetid://18787976568", 
            "rbxassetid://18787976207", 
            "rbxassetid://18787974504"
        }, 
        C1 = 0, 
        runSpeed = 2, 
        pointsPerDMG = 33, 
        showMax = false, 
        scaleStat = "DevilFruitMastery", 
        SeaStone = true, 
        swingVolume = 0.5
    }, 
    ["Sunken Anchor"] = {
        cooldown = 0.42, 
        BaseDMG = 5, 
        MaxDMG = 150, 
        extraBlock = 20, 
        Range = Vector3.new(13, 12, 13, 0), 
        Offset = CFrame.new(0, 0, -4), 
        trailTime = 0.5, 
        stunTime = 1.7, 
        animspeed = 1, 
        dmgMulti = 1, 
        hitSounds = {
            "rbxassetid://103544511150922", 
            "rbxassetid://102180191314856", 
            "rbxassetid://94474857112886", 
            "rbxassetid://73782327170255", 
            "rbxassetid://136580703602978"
        }, 
        swingSFX = {
            "rbxassetid://108840109093867", 
            "rbxassetid://70931645339313", 
            "rbxassetid://129921065672241", 
            "rbxassetid://102267452771054", 
            "rbxassetid://99908270321796"
        }, 
        pointsPerDMG = 22, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Sunken Depths", 
                "e"
            }, 
            {
                "Sunken Hook", 
                "r"
            }
        }, 
        runSpeed = 2, 
        showMax = false, 
        SeaStone = true, 
        scaleStat = "Strength"
    }, 
    Jitte = {
        cooldown = 0.3, 
        BaseDMG = 5, 
        MaxDMG = 75, 
        extraBlock = 20, 
        Range = Vector3.new(10, 10, 12, 0), 
        Offset = CFrame.new(0, 0, -2.5), 
        trailTime = 0.35, 
        stunTime = 0.5, 
        animspeed = 1.25, 
        dmgMulti = 1, 
        hitSounds = {
            "rbxassetid://100656802605694", 
            "rbxassetid://115795311459797", 
            "rbxassetid://116412942262049", 
            "rbxassetid://134100169143664", 
            "rbxassetid://104843716231184"
        }, 
        swingSFX = {
            "rbxassetid://96432399296794", 
            "rbxassetid://112131189856461", 
            "rbxassetid://124952383677646", 
            "rbxassetid://99970785405558", 
            "rbxassetid://111498468284828"
        }, 
        pointsPerDMG = 25, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Jitte Strike", 
                "e"
            }, 
            {
                "Jitte Leap", 
                "r"
            }
        }, 
        runSpeed = 2, 
        scaleStat = "Strength", 
        swingVolume = 0.5, 
        SeaStone = true, 
        showMax = false
    }, 
    ["Blood Scythe"] = {
        cooldown = 0.325, 
        BaseDMG = 7, 
        MaxDMG = 75, 
        extraBlock = 20, 
        Range = Vector3.new(10, 10, 10, 0), 
        Offset = CFrame.new(0, 0, -4), 
        trailTime = 0.42, 
        stunTime = 1, 
        animspeed = 1.35, 
        dmgMulti = 1, 
        swingVolume = 0.5, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Reaping Strike", 
                "e"
            }, 
            {
                "Reaping Grasp", 
                "r"
            }
        }, 
        swingSFX = {
            "rbxassetid://102501881936930", 
            "rbxassetid://88584321688454", 
            "rbxassetid://108304966435377", 
            "rbxassetid://76208064232646", 
            "rbxassetid://92290173959439"
        }, 
        hitSounds = {
            "rbxassetid://122804580373335", 
            "rbxassetid://93580716677866", 
            "rbxassetid://122497388960042", 
            "rbxassetid://78609357586751", 
            "rbxassetid://71412412531253"
        }, 
        pointsPerDMG = 22, 
        runSpeed = 2, 
        showMax = false
    }, 
    ["Victorious Claws"] = {
        cooldown = 0.23, 
        BaseDMG = 5, 
        MaxDMG = 90, 
        extraBlock = 45, 
        Range = Vector3.new(8, 10, 7, 0), 
        Offset = CFrame.new(0, 0, -2.5), 
        trailTime = 0.4, 
        stunTime = 0.5, 
        animspeed = 1.35, 
        dmgMulti = 1, 
        hitSounds = {
            "rbxassetid://9630328289", 
            "rbxassetid://9630328090", 
            "rbxassetid://9630327106", 
            "rbxassetid://9630327786", 
            "rbxassetid://9630327513"
        }, 
        swingSFX = {
            "rbxassetid://9630326906", 
            "rbxassetid://9630327235", 
            "rbxassetid://9630327360", 
            "rbxassetid://9630327672", 
            "rbxassetid://9630327924"
        }, 
        pointsPerDMG = 22.5, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Over Shoulder Slam", 
                "e"
            }, 
            {
                "Grand Entrance Slam", 
                "r"
            }
        }, 
        showMax = false
    }, 
    ["3SS"] = {
        cooldown = 0.3, 
        BaseDMG = 10, 
        MaxDMG = 125, 
        extraBlock = 20, 
        Range = Vector3.new(12, 10, 10, 0), 
        Offset = CFrame.new(0, 0, -2.5), 
        trailTime = 0.3, 
        stunTime = 0.5, 
        animspeed = 1, 
        dmgMulti = 1, 
        style = "3SS", 
        C1 = -0.4, 
        swingSFX = {
            "rbxassetid://75359292451210", 
            "rbxassetid://71692332779672", 
            "rbxassetid://108676718832481", 
            "rbxassetid://129335358481428", 
            "rbxassetid://111834993615227"
        }, 
        hitSounds = {
            "rbxassetid://124446098206313", 
            "rbxassetid://102823615654864", 
            "rbxassetid://120510170548972", 
            "rbxassetid://120802586610243", 
            "rbxassetid://91425995502856"
        }, 
        pointsPerDMG = 28.6, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "1080 Pound Phoenix", 
                "e"
            }, 
            {
                "Tiger Hunt", 
                "r"
            }, 
            {
                "Dragon Twister", 
                "t"
            }, 
            {
                "Onigiri", 
                "z"
            }, 
            {
                "Crossing Six Paths", 
                "x"
            }, 
            {
                "Billion-Fold World", 
                "c"
            }, 
            {
                "Sword Style Swap", 
                "v"
            }
        }
    }, 
    ["Iceborn Gunblade"] = {
        cooldown = 0.31, 
        BaseDMG = 6, 
        MaxDMG = 55, 
        extraBlock = 20, 
        Range = Vector3.new(8, 10, 9, 0), 
        Offset = CFrame.new(0, 0, -4), 
        trailTime = 0.325, 
        stunTime = 0.5, 
        animspeed = 1.5, 
        dmgMulti = 1, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Frost Bullets", 
                "e"
            }, 
            {
                "Frost Blast", 
                "r"
            }
        }, 
        swingSFX = {
            "rbxassetid://107446313536652", 
            "rbxassetid://88426703699012", 
            "rbxassetid://113657706132755", 
            "rbxassetid://96131514266731", 
            "rbxassetid://74173102112673"
        }, 
        hitSounds = {
            "rbxassetid://70924265564796", 
            "rbxassetid://71172178708777", 
            "rbxassetid://75560016239291", 
            "rbxassetid://132922085078178", 
            "rbxassetid://115920609291043"
        }, 
        pointsPerDMG = 25, 
        runSpeed = 2.25, 
        swingVolume = 0.4, 
        scaleStat = "GunMastery", 
        showMax = false
    }, 
    ["Snowcap Scepter"] = {
        cooldown = 0.325, 
        BaseDMG = 6, 
        MaxDMG = 55, 
        extraBlock = 20, 
        Range = Vector3.new(8, 10, 9, 0), 
        Offset = CFrame.new(0, 0, -4), 
        trailTime = 0.425, 
        stunTime = 0.5, 
        animspeed = 1.3, 
        dmgMulti = 1, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Scepter Snowball", 
                "e"
            }, 
            {
                "Scepter Storm", 
                "r"
            }
        }, 
        swingSFX = {
            "rbxassetid://82979730956345", 
            "rbxassetid://79295526888781", 
            "rbxassetid://123914257234697", 
            "rbxassetid://92202891543546", 
            "rbxassetid://96536441589284"
        }, 
        hitSounds = {
            "rbxassetid://123603534572992", 
            "rbxassetid://138955056393755", 
            "rbxassetid://93786195657307", 
            "rbxassetid://96335991505355", 
            "rbxassetid://129012911754630"
        }, 
        pointsPerDMG = 25, 
        runSpeed = 1.2, 
        swingVolume = 0.4, 
        showMax = false
    }, 
    ["Cupid's Bow"] = {
        cooldown = 0.325, 
        BaseDMG = 6, 
        MaxDMG = 55, 
        extraBlock = 20, 
        Range = Vector3.new(8, 10, 10, 0), 
        Offset = CFrame.new(0, 0, -5), 
        trailTime = 0.425, 
        stunTime = 0.5, 
        animspeed = 1, 
        dmgMulti = 1, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Cupid's Rain", 
                "e"
            }, 
            {
                "Cupid Burst", 
                "r"
            }
        }, 
        swingSFX = {
            "rbxassetid://112582500988092", 
            "rbxassetid://118545797165649", 
            "rbxassetid://79705796370902", 
            "rbxassetid://87933659202778", 
            "rbxassetid://97720369661318"
        }, 
        hitSounds = {
            "rbxassetid://138057023548820", 
            "rbxassetid://101559041069736", 
            "rbxassetid://12785113369011", 
            "rbxassetid://73150347883595", 
            "rbxassetid://72122117096320"
        }, 
        pointsPerDMG = 25, 
        runSpeed = 2.25, 
        swingVolume = 0.4, 
        scaleStat = "GunMastery", 
        showMax = false
    }, 
    ["Mega-Pow"] = {
        cooldown = 0.325, 
        BaseDMG = 6, 
        MaxDMG = 55, 
        extraBlock = 20, 
        Range = Vector3.new(8, 10, 10, 0), 
        Offset = CFrame.new(0, 0, -5), 
        trailTime = 0.425, 
        stunTime = 0.5, 
        animspeed = 1, 
        dmgMulti = 1, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Rapid Fire", 
                "TAP"
            }, 
            {
                "Monkey Chompers", 
                "e"
            }, 
            {
                "SUPER MEGA DEATH ROCKET!", 
                "r"
            }
        }, 
        swingSFX = {
            "rbxassetid://112582500988092", 
            "rbxassetid://118545797165649", 
            "rbxassetid://79705796370902", 
            "rbxassetid://87933659202778", 
            "rbxassetid://97720369661318"
        }, 
        hitSounds = {
            "rbxassetid://138057023548820", 
            "rbxassetid://101559041069736", 
            "rbxassetid://12785113369011", 
            "rbxassetid://73150347883595", 
            "rbxassetid://72122117096320"
        }, 
        pointsPerDMG = 25, 
        runSpeed = 2.25, 
        swingVolume = 0.4, 
        scaleStat = "GunMastery", 
        showMax = false
    }, 
    ["Blo's Sledgehammer"] = {
        cooldown = 0.35, 
        BaseDMG = 10, 
        MaxDMG = 65, 
        extraBlock = 20, 
        Range = Vector3.new(8, 10, 8.5, 0), 
        Offset = CFrame.new(0, 0, -4), 
        trailTime = 0.42, 
        stunTime = 2, 
        animspeed = 1.25, 
        dmgMulti = 1, 
        swingVolume = 0.4, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Eggsplosive Rift", 
                "e"
            }, 
            {
                "Eggsweeper", 
                "r"
            }
        }, 
        swingSFX = {
            "rbxassetid://114294581236373", 
            "rbxassetid://72565507235883", 
            "rbxassetid://104934567333851", 
            "rbxassetid://107289519339880", 
            "rbxassetid://108911583888685"
        }, 
        hitSounds = {
            "rbxassetid://109229911427556", 
            "rbxassetid://111635253998163", 
            "rbxassetid://75041137819939", 
            "rbxassetid://128288429802659", 
            "rbxassetid://90906226685749"
        }, 
        pointsPerDMG = 22, 
        scaleStat = "Strength", 
        runSpeed = 1.25, 
        showMax = false
    }, 
    ["Blo's Crimson Sledgehammer"] = {
        cooldown = 0.35, 
        BaseDMG = 10, 
        MaxDMG = 65, 
        extraBlock = 20, 
        Range = Vector3.new(8, 10, 8.5, 0), 
        Offset = CFrame.new(0, 0, -4), 
        trailTime = 0.42, 
        stunTime = 2, 
        animspeed = 1.25, 
        dmgMulti = 1, 
        swingVolume = 0.4, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Eggsplosive Rift", 
                "e"
            }, 
            {
                "Eggsweeper", 
                "r"
            }
        }, 
        swingSFX = {
            "rbxassetid://115315690060254", 
            "rbxassetid://87805847604957", 
            "rbxassetid://93643990723534", 
            "rbxassetid://112505822800808", 
            "rbxassetid://76424475141156"
        }, 
        hitSounds = {
            "rbxassetid://118273104921492", 
            "rbxassetid://91410648931193", 
            "rbxassetid://108124339945843", 
            "rbxassetid://128024393098930", 
            "rbxassetid://118315322224614"
        }, 
        pointsPerDMG = 22, 
        scaleStat = "Strength", 
        runSpeed = 1.25, 
        showMax = false
    }, 
    ["Swordfish Rapier"] = {
        cooldown = 0.25, 
        BaseDMG = 6, 
        MaxDMG = 55, 
        extraBlock = 20, 
        Range = Vector3.new(8, 10, 9, 0), 
        Offset = CFrame.new(0, 0, -4), 
        trailTime = 0.425, 
        stunTime = 0.5, 
        animspeed = 1.5, 
        dmgMulti = 1, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Aquatic Lunge", 
                "e"
            }, 
            {
                "Call of the Deep", 
                "r"
            }
        }, 
        swingSFX = {
            "rbxassetid://113793745407730", 
            "rbxassetid://126356102477592", 
            "rbxassetid://116250881017546", 
            "rbxassetid://93483800725561", 
            "rbxassetid://84434531950120"
        }, 
        hitSounds = {
            "rbxassetid://113489129793444", 
            "rbxassetid://90356095116822", 
            "rbxassetid://71529629210503", 
            "rbxassetid://130265572368893", 
            "rbxassetid://90659090141233"
        }, 
        pointsPerDMG = 30, 
        runSpeed = 1.25, 
        SeaStone = true, 
        showMax = false
    }, 
    DragonHybird = {
        cooldown = 0.33, 
        BaseDMG = 8, 
        MaxDMG = 75, 
        extraBlock = 20, 
        Range = Vector3.new(8, 10, 9, 0), 
        Offset = CFrame.new(0, 0, -4), 
        trailTime = 0.425, 
        stunTime = 0.5, 
        animspeed = 1, 
        dmgMulti = 1, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Call of the Deep", 
                "e"
            }, 
            {
                "Aquatic Lunge", 
                "r"
            }
        }, 
        swingSFX = {
            "rbxassetid://104758282335547", 
            "rbxassetid://137425142682205", 
            "rbxassetid://120225639449752", 
            "rbxassetid://132096915094300", 
            "rbxassetid://137425142682205"
        }, 
        hitSounds = {
            "rbxassetid://136571629756610", 
            "rbxassetid://99406565490600", 
            "rbxassetid://118329010477052", 
            "rbxassetid://111205157446932", 
            "rbxassetid://90659090141233", 
            "rbxassetid://118329010477052"
        }, 
        pointsPerDMG = 20, 
        runSpeed = 1.25, 
        showMax = false, 
        swingVolume = 0.4, 
        hitSFXVolume = 0.5, 
        AnimationLength = 0.33, 
        AnimationWeight = 1, 
        scaleStat = "Strength"
    }, 
    ["Ghost Princess's Umbrella"] = {
        cooldown = 0.325, 
        BaseDMG = 6, 
        MaxDMG = 55, 
        extraBlock = 20, 
        Range = Vector3.new(8, 10, 9, 0), 
        Offset = CFrame.new(0, 0, -4), 
        trailTime = 0.425, 
        stunTime = 0.5, 
        animspeed = 1.3, 
        dmgMulti = 1, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Umbrella Float", 
                "e"
            }, 
            {
                "Umbrella Thrust", 
                "r"
            }
        }, 
        swingSFX = {
            "rbxassetid://120581199818522", 
            "rbxassetid://123943972517756", 
            "rbxassetid://113418257642475", 
            "rbxassetid://104966346275602", 
            "rbxassetid://98370792698423"
        }, 
        hitSounds = {
            "rbxassetid://78177584505344", 
            "rbxassetid://113996681825526", 
            "rbxassetid://95098764840950", 
            "rbxassetid://111573112573255", 
            "rbxassetid://91338673267700"
        }, 
        pointsPerDMG = 28, 
        runSpeed = 1.2, 
        hitSFXVolume = 1, 
        showMax = false
    }, 
    ["World Ender 2"] = {
        cooldown = 0.4, 
        BaseDMG = 10, 
        MaxDMG = 125, 
        extraBlock = 20, 
        Range = Vector3.new(12, 12, 12, 0), 
        Offset = CFrame.new(0, 0, -4), 
        trailTime = 0.4, 
        stunTime = 2, 
        animspeed = 1.4, 
        dmgMulti = 1, 
        swingVolume = 0.75, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "THE TROXX2", 
                "e"
            }, 
            {
                "Soul Eater2", 
                "r"
            }
        }, 
        swingSFX = {
            "rbxassetid://11315332505", 
            "rbxassetid://11315332880", 
            "rbxassetid://11315332437", 
            "rbxassetid://11315332601", 
            "rbxassetid://11315332371"
        }, 
        hitSounds = {
            "rbxassetid://11315333046", 
            "rbxassetid://11315333116", 
            "rbxassetid://11315332799", 
            "rbxassetid://11315332972", 
            "rbxassetid://11315332709"
        }, 
        pointsPerDMG = 20, 
        showMax = false
    }, 
    ["Helix Skewer"] = {
        cooldown = 0.35, 
        BaseDMG = 5, 
        MaxDMG = 90, 
        extraBlock = 45, 
        Range = Vector3.new(11, 11, 11, 0), 
        Offset = CFrame.new(0, 0, -5), 
        trailTime = 0.35, 
        stunTime = 0.4, 
        animspeed = 2, 
        dmgMulti = 1, 
        hitSounds = {
            "rbxassetid://135476390778532", 
            "rbxassetid://93333388926497", 
            "rbxassetid://113270691404429", 
            "rbxassetid://104085775754191", 
            "rbxassetid://78834618044770"
        }, 
        swingSFX = {
            "rbxassetid://100166019154686", 
            "rbxassetid://87529021823777", 
            "rbxassetid://82380180551686", 
            "rbxassetid://101604533900904", 
            "rbxassetid://111765782835267"
        }, 
        pointsPerDMG = 22.5, 
        swingVolume = 1, 
        hitSFXVolume = 1, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Wringing Vortex", 
                "e"
            }, 
            {
                "Wringing Rupture", 
                "r"
            }
        }, 
        showMax = false, 
        runSpeed = 1.5
    }, 
    ["Soul Cleaver"] = {
        cooldown = 0.285, 
        BaseDMG = 5, 
        MaxDMG = 75, 
        extraBlock = 20, 
        Range = Vector3.new(8, 10, 9, 0), 
        Offset = CFrame.new(0, 0, -2.5), 
        trailTime = 0.3, 
        stunTime = 0.5, 
        animspeed = 1.25, 
        dmgMulti = 1, 
        C1 = -0.4, 
        hitSounds = {
            "rbxassetid://116537937737476", 
            "rbxassetid://132194283306001", 
            "rbxassetid://125188393066915", 
            "rbxassetid://115905673604114", 
            "rbxassetid://77354803857136"
        }, 
        swingSFX = {
            "rbxassetid://79866738705172", 
            "rbxassetid://138477492820246", 
            "rbxassetid://90552833739452", 
            "rbxassetid://119929996607801", 
            "rbxassetid://102594694548634"
        }, 
        pointsPerDMG = 25, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Maser Ray", 
                "e"
            }, 
            {
                "Hahaba", 
                "r"
            }, 
            {
                "Hakai Slash", 
                "z"
            }, 
            {
                "Blaze Eruption", 
                "x"
            }
        }, 
        SeaStone = true, 
        showMax = false
    }, 
    ["Mochi Trident"] = {
        cooldown = 0.275, 
        BaseDMG = 6, 
        MaxDMG = 55, 
        extraBlock = 20, 
        Range = Vector3.new(8, 10, 9, 0), 
        Offset = CFrame.new(0, 0, -4), 
        trailTime = 0.25, 
        stunTime = 0.75, 
        animspeed = 1.2, 
        dmgMulti = 1, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Mochi Trident Drill", 
                "e"
            }, 
            {
                "Mochi Trident Throw", 
                "r"
            }
        }, 
        swingSFX = {
            "rbxassetid://85900841666483", 
            "rbxassetid://121772570034594", 
            "rbxassetid://87036298579690", 
            "rbxassetid://74044616963326", 
            "rbxassetid://93510884193496"
        }, 
        hitSounds = {
            "rbxassetid://71317079648104", 
            "rbxassetid://73754930807533", 
            "rbxassetid://73612828417507", 
            "rbxassetid://100418381667516", 
            "rbxassetid://133159280757994"
        }, 
        pointsPerDMG = 25, 
        hitSFXVolume = 1, 
        showMax = false
    }, 
    ["Pretzel Longsword"] = {
        cooldown = 0.375, 
        BaseDMG = 5, 
        MaxDMG = 90, 
        extraBlock = 45, 
        Range = Vector3.new(11, 11, 11, 0), 
        Offset = CFrame.new(0, 0, -5), 
        trailTime = 0.35, 
        stunTime = 0.425, 
        animspeed = 2, 
        dmgMulti = 1, 
        hitSounds = {
            "rbxassetid://135476390778532", 
            "rbxassetid://93333388926497", 
            "rbxassetid://113270691404429", 
            "rbxassetid://104085775754191", 
            "rbxassetid://78834618044770"
        }, 
        swingSFX = {
            "rbxassetid://88322219233388", 
            "rbxassetid://138219230512813", 
            "rbxassetid://124000547372904", 
            "rbxassetid://90652070894012", 
            "rbxassetid://76862618233582"
        }, 
        pointsPerDMG = 22.5, 
        swingVolume = 1, 
        hitSFXVolume = 1, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Wringing Vortex", 
                "e"
            }, 
            {
                "Wringing Rupture", 
                "r"
            }
        }, 
        showMax = false, 
        runSpeed = 1.5
    }, 
    ["Iceborn Candy Cane"] = {
        cooldown = 0.22, 
        BaseDMG = 6, 
        MaxDMG = 45, 
        extraBlock = 20, 
        Range = Vector3.new(8, 10, 11, 0), 
        Offset = CFrame.new(0, 0, -4), 
        trailTime = 0.425, 
        stunTime = 0.5, 
        animspeed = 1.5, 
        dmgMulti = 1, 
        keys = {
            {
                "Block", 
                "f"
            }, 
            {
                "Sweet Treat", 
                "e"
            }, 
            {
                "Flash Freeze", 
                "r"
            }
        }, 
        swingSFX = {
            "rbxassetid://137924169102231", 
            "rbxassetid://89353751782730", 
            "rbxassetid://91908049306901", 
            "rbxassetid://134165456290065", 
            "rbxassetid://139118341461107"
        }, 
        hitSounds = {
            "rbxassetid://72617542102294", 
            "rbxassetid://124989636036115", 
            "rbxassetid://127432082569253", 
            "rbxassetid://128663207237551", 
            "rbxassetid://134057991018018"
        }, 
        pointsPerDMG = 25, 
        showMax = false
    }
};
v5["Skyblue Katana"] = deepcopy(v5.Katana);
v5["Skyblue Katana"].BaseDMG = 6;
v5["Skyblue Katana"].MaxDMG = 40;
v5["Skyblue Katana"].extraBlock = 25;
v5["Skyblue Katana"].dmgMulti = 1;
v5["Ryu's Katana"] = deepcopy(v5.Katana);
v5["Ryu's Katana"].BaseDMG = 7;
v5["Ryu's Katana"].MaxDMG = 50;
v5["Ryu's Katana"].extraBlock = 35;
v5["Ryu's Katana"].dmgMulti = 1.025;
v5["Seabeast Katana"] = deepcopy(v5.Katana);
v5["Seabeast Katana"].BaseDMG = 8;
v5["Seabeast Katana"].MaxDMG = 60;
v5["Seabeast Katana"].extraBlock = 35;
v5["Seabeast Katana"].dmgMulti = 1.1;
v5["Kraken Katana"] = deepcopy(v5.Katana);
v5["Kraken Katana"].BaseDMG = 9;
v5["Kraken Katana"].MaxDMG = 85;
v5["Kraken Katana"].extraBlock = 35;
v5["Kraken Katana"].dmgMulti = 1.12;
v5["Kraken Katana"].swingSFX = {
    "rbxassetid://7241463002", 
    "rbxassetid://7241463067", 
    "rbxassetid://7241463121"
};
v5["Kraken Katana"].hitSounds = {
    "rbxassetid://7241463042", 
    "rbxassetid://7241463142", 
    "rbxassetid://7241463172"
};
v5["Musashi's Crimson Katana"] = deepcopy(v5.Katana);
v5["Musashi's Crimson Katana"].BaseDMG = 10;
v5["Musashi's Crimson Katana"].MaxDMG = 85;
v5["Musashi's Crimson Katana"].extraBlock = 35;
v5["Musashi's Crimson Katana"].dmgMulti = 1.15;
v5["Musashi's Rose Katana"] = deepcopy(v5.Katana);
v5["Musashi's Rose Katana"].BaseDMG = 10;
v5["Musashi's Rose Katana"].MaxDMG = 85;
v5["Musashi's Rose Katana"].extraBlock = 35;
v5["Musashi's Rose Katana"].dmgMulti = 1.15;
v5["Neptune Trident Boss"] = v5["Neptune's Trident"];
v5["Prestige Firework Lancer"] = deepcopy(v5["Firework Lancer"]);
v5["Prestige Firework Lancer"].swingSFX = {
    "rbxassetid://11561207649", 
    "rbxassetid://11561207567", 
    "rbxassetid://11561207807", 
    "rbxassetid://11561207704", 
    "rbxassetid://11561207752"
};
v5["Prestige Firework Lancer"].hitSounds = {
    "rbxassetid://11561207996", 
    "rbxassetid://11561208030", 
    "rbxassetid://11561207959", 
    "rbxassetid://11561207901", 
    "rbxassetid://11561207848"
};
v5["Prestige Firework Lancer"].keys = {
    {
        "Block", 
        "f"
    }, 
    {
        "PRESTIGE TO THE MOON!", 
        "e"
    }, 
    {
        "Prestige Firework Rush", 
        "r"
    }
};
v5["Blessed Cupid's Bow"] = deepcopy(v5["Cupid's Bow"]);
v5["Anomalized Mega-Pow"] = deepcopy(v5["Mega-Pow"]);
v5["Hollow's World Ender"] = deepcopy(v5["World Ender"]);
v5["Prestige World Ender"] = deepcopy(v5["World Ender"]);
v5["Prestige World Ender"].swingSFX = {
    "rbxassetid://80786808805489", 
    "rbxassetid://112241958177523", 
    "rbxassetid://136226517682813", 
    "rbxassetid://84074775058158", 
    "rbxassetid://112751438993214"
};
v5["Prestige World Ender"].hitSounds = {
    "rbxassetid://88969859813557", 
    "rbxassetid://105893451051203", 
    "rbxassetid://97407819994718", 
    "rbxassetid://89629536515725", 
    "rbxassetid://76781623544427"
};
local function _(v6, v7) --[[ Line: 1578 ]] --[[ Name: addNewKatana ]]
    -- upvalues: v5 (copy)
    v5[v6] = deepcopy(v5.Katana);
    v5[v6].BaseDMG = v7.BaseDMG;
    v5[v6].MaxDMG = v7.MaxDMG;
    v5[v6].extraBlock = v7.extraBlock;
    v5[v6].dmgMulti = v7.dmgMulti;
end;
local v9 = {
    BaseDMG = 10, 
    MaxDMG = 90, 
    extraBlock = 35, 
    dmgMulti = 1.2
};
v5["Crimson Fang Katana"] = deepcopy(v5.Katana);
v5["Crimson Fang Katana"].BaseDMG = v9.BaseDMG;
v5["Crimson Fang Katana"].MaxDMG = v9.MaxDMG;
v5["Crimson Fang Katana"].extraBlock = v9.extraBlock;
v5["Crimson Fang Katana"].dmgMulti = v9.dmgMulti;
v9 = {
    BaseDMG = 10, 
    MaxDMG = 90, 
    extraBlock = 35, 
    dmgMulti = 1.2
};
v5["Shattered Fang Katana"] = deepcopy(v5.Katana);
v5["Shattered Fang Katana"].BaseDMG = v9.BaseDMG;
v5["Shattered Fang Katana"].MaxDMG = v9.MaxDMG;
v5["Shattered Fang Katana"].extraBlock = v9.extraBlock;
v5["Shattered Fang Katana"].dmgMulti = v9.dmgMulti;
v9 = {
    BaseDMG = 10, 
    MaxDMG = 90, 
    extraBlock = 35, 
    dmgMulti = 1.2
};
v5["Amethyst Fang Katana"] = deepcopy(v5.Katana);
v5["Amethyst Fang Katana"].BaseDMG = v9.BaseDMG;
v5["Amethyst Fang Katana"].MaxDMG = v9.MaxDMG;
v5["Amethyst Fang Katana"].extraBlock = v9.extraBlock;
v5["Amethyst Fang Katana"].dmgMulti = v9.dmgMulti;
v9 = {
    BaseDMG = 8, 
    MaxDMG = 75, 
    extraBlock = 30, 
    dmgMulti = 1.07
};
v5["ODM Katana"] = deepcopy(v5.Katana);
v5["ODM Katana"].BaseDMG = v9.BaseDMG;
v5["ODM Katana"].MaxDMG = v9.MaxDMG;
v5["ODM Katana"].extraBlock = v9.extraBlock;
v5["ODM Katana"].dmgMulti = v9.dmgMulti;
if script.Parent:GetAttribute("PrestigeWeapons") == nil then
    repeat
        task.wait();
    until script.Parent:GetAttribute("PrestigeWeapons") ~= nil;
end;
v9 = game:GetService("HttpService"):JSONDecode(script.Parent:GetAttribute("PrestigeWeapons"));
local v10 = {
    ["Inferno Rocket Blade"] = {
        swingSFX = {
            "rbxassetid://11560454661", 
            "rbxassetid://11560454799", 
            "rbxassetid://11560454639", 
            "rbxassetid://11560454746", 
            "rbxassetid://11560454681"
        }, 
        hitSounds = {
            "rbxassetid://11560454890", 
            "rbxassetid://11560454863", 
            "rbxassetid://11560456008", 
            "rbxassetid://11560454833", 
            "rbxassetid://11560454762"
        }
    }, 
    ["Candy Cane"] = {
        swingSFX = {
            "rbxassetid://11585397243", 
            "rbxassetid://11585397349", 
            "rbxassetid://11585397378", 
            "rbxassetid://11585397209", 
            "rbxassetid://11585397317"
        }, 
        hitSounds = {
            "rbxassetid://11585397522", 
            "rbxassetid://11585397439", 
            "rbxassetid://11585397288", 
            "rbxassetid://11585397410", 
            "rbxassetid://11585397265"
        }
    }, 
    ["Firework Lancer"] = {
        swingSFX = {
            "rbxassetid://11561207649", 
            "rbxassetid://11561207567", 
            "rbxassetid://11561207807", 
            "rbxassetid://11561207704", 
            "rbxassetid://11561207752"
        }, 
        hitSounds = {
            "rbxassetid://11561207996", 
            "rbxassetid://11561208030", 
            "rbxassetid://11561207959", 
            "rbxassetid://11561207901", 
            "rbxassetid://11561207848"
        }
    }, 
    ["World Ender"] = {
        swingSFX = {
            "rbxassetid://80786808805489", 
            "rbxassetid://112241958177523", 
            "rbxassetid://136226517682813", 
            "rbxassetid://84074775058158", 
            "rbxassetid://112751438993214"
        }, 
        hitSounds = {
            "rbxassetid://88969859813557", 
            "rbxassetid://105893451051203", 
            "rbxassetid://97407819994718", 
            "rbxassetid://89629536515725", 
            "rbxassetid://76781623544427"
        }
    }
};
for v11 = 1, #v9 do
    local v12 = v9[v11];
    v5["Prestige " .. v12] = deepcopy(v5[v12]);
    local v13 = v5["Prestige " .. v12];
    if v10[v12] then
        for v14, v15 in pairs(v10[v12]) do
            v13[v14] = v15;
        end;
    end;
end;
local v16 = {
    "Purple", 
    "Blue", 
    "Green", 
    "Red", 
    "Azure", 
    "Gold"
};
for v17 = 1, #v16 do
    local v18 = "Kraken Blade " .. "(" .. v16[v17] .. ")";
    v5[v18] = v5["Kraken Blade"];
    if game["Run Service"]:IsServer() then
        local v19 = script.Parent.Swords["Kraken Blade"]:Clone();
        v19.Name = v18;
        v19.Parent = script.Parent.Swords;
    end;
    local v20 = "Kraken Katana " .. "(" .. v16[v17] .. ")";
    v5[v20] = v5["Kraken Katana"];
    if game["Run Service"]:IsServer() then
        local v21 = script.Parent.Swords.Katana:Clone();
        v21.Name = v20;
        v21.Parent = script.Parent.Swords;
    end;
end;
for _, v23 in pairs(v5) do
    if v23.scaleStat ~= nil and v23.scaleStat == "Strength" and v23.attackParticle == nil then
        v23.attackParticle = "Melee";
    end;
end;
script:ClearAllChildren();
return v5;