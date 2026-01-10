local v0 = {};
local v1 = game:GetService("RunService"):IsServer();
local _ = game:GetService("RunService");
local v3 = {
    percentStamina = 0.01, 
    baseStamina = 1
};
local v7 = {
    {
        ["B-Shot"] = {
            moneyreq = 0, 
            stamreq = 10, 
            statreq = {
                FightingStyleMastery = 1, 
                ["/SKILL/BlackLeg"] = 1
            }, 
            cd = 3, 
            desc = "User lands on his hands underneath an opponent's chin, then uses both hands to spring upwards to deliver a blow to the opponent's chin with both feet"
        }, 
        Coiller = {
            moneyreq = 500, 
            stamreq = 15, 
            statreq = {
                FightingStyleMastery = 10, 
                ["/SKILL/BlackLeg"] = 2
            }, 
            cd = 17, 
            desc = "A kick to the neck which user does whilst still on the ground"
        }, 
        ["Sky Walk"] = {
            percentStamina = v3.percentStamina, 
            baseStamina = v3.baseStamina, 
            moneyreq = 750, 
            statreq = {
                FightingStyleMastery = 20, 
                ["/SKILL/BlackLeg"] = 3
            }, 
            stamreq = 0, 
            cd = 0.2, 
            desc = "Allows the users to actually jump off the air itself, allowing them to stay in the air for much longer than usual"
        }, 
        Concasser = {
            moneyreq = 1250, 
            stamreq = 25, 
            statreq = {
                FightingStyleMastery = 25, 
                ["/SKILL/BlackLeg"] = 4
            }, 
            cd = 8, 
            desc = "User accelerates through the air while rotating at incredible speeds to generate a crushing blow upon impact."
        }, 
        ["Party Table Kick Course"] = {
            moneyreq = 1800, 
            stamreq = 15, 
            statreq = {
                FightingStyleMastery = 30, 
                ["/SKILL/BlackLeg"] = 5
            }, 
            cd = 5, 
            desc = "The user flips upside down and rotate their legs at high speeds to generate a small vortex capable of dealing spontaneous damage."
        }, 
        ["Anti-Manner Kick Course"] = {
            ULT = true, 
            moneyreq = 3000, 
            stamreq = 45, 
            statreq = {
                FightingStyleMastery = 55, 
                ["/SKILL/BlackLeg"] = 6
            }, 
            cd = 25, 
            desc = "User delivers a swift strike from below that stuns and launches enemies skyward. Despite its simplicity, this technique packs enough force to be the most powerful basic black leg skill."
        }, 
        ["Demon Step Transformation"] = {
            transformation = true, 
            stamreq = 0, 
            statreq = {
                FightingStyleMastery = 125, 
                ["/SKILL/BlackLeg"] = 7
            }, 
            cd = 0, 
            desc = "User enshrouds their feet in violent flames whose intensity will scorch even the toughest of foes. This technique also augments the abilities of other black leg skills."
        }, 
        ["Demon Spectrum"] = {
            moneyreq = 0, 
            stamreq = 65, 
            statreq = {
                FightingStyleMastery = 75, 
                ["/SKILL/BlackLeg"] = 8
            }, 
            cd = 13, 
            desc = "A series of instantaneous kicks performed solely with the user's flaming right leg to reach high temperatures whose intensity generate bands of colors."
        }, 
        ["Demon Flash"] = {
            moneyreq = 3000, 
            stamreq = 40, 
            statreq = {
                FightingStyleMastery = 85, 
                ["/SKILL/BlackLeg"] = 9
            }, 
            cd = 9, 
            desc = "Teleport and strike an enemy from behind."
        }, 
        ["Demon Blitz"] = {
            moneyreq = 5000, 
            stamreq = 45, 
            statreq = {
                FightingStyleMastery = 90, 
                ["/SKILL/BlackLeg"] = 10
            }, 
            cd = 15, 
            desc = "Project fiery missiles with the demon leg."
        }, 
        ["Demon Axe Drop"] = {
            moneyreq = 8000, 
            stamreq = 75, 
            statreq = {
                FightingStyleMastery = 130, 
                ["/SKILL/BlackLeg"] = 11
            }, 
            cd = 20, 
            desc = "Shower a set area with torrents of kicks before performing a drop-kick."
        }, 
        ["Demonic Sky Driller"] = {
            ULT = true, 
            moneyreq = 12000, 
            stamreq = 125, 
            statreq = {
                FightingStyleMastery = 150, 
                ["/SKILL/BlackLeg"] = 12
            }, 
            cd = 70, 
            desc = "Perform a teleporting side-snap kick that sends the target flying amidst a blazing vortex."
        }
    }, 
    {
        Shigan = {
            moneyreq = 0, 
            statreq = {
                FightingStyleMastery = 1, 
                ["/SKILL/Rokushiki"] = 1
            }, 
            stamreq = 15, 
            cd = 10, 
            desc = "The Shigan is a close-quarter combat technique, in which the user pushes their finger into a certain target at a very high speed"
        }, 
        Soru = {
            hyperArmor = true, 
            moneyreq = 1250, 
            statreq = {
                FightingStyleMastery = 5, 
                ["/SKILL/Rokushiki"] = 2
            }, 
            stamreq = 15, 
            cd = 1, 
            desc = "The Soru allows the users to move at extremely high speeds in order to avoid attacks"
        }, 
        Tekkai = {
            moneyreq = 1500, 
            statreq = {
                FightingStyleMastery = 15, 
                ["/SKILL/Rokushiki"] = 3
            }, 
            stamreq = 20, 
            cd = 15, 
            desc = "The Tekkai hardens the users' muscles to the level of iron, in order to nullify damage taken from attacks."
        }, 
        Geppo = {
            percentStamina = v3.percentStamina, 
            baseStamina = v3.baseStamina, 
            moneyreq = 1750, 
            statreq = {
                FightingStyleMastery = 20, 
                ["/SKILL/Rokushiki"] = 4
            }, 
            stamreq = 0, 
            cd = 0.2, 
            desc = "The Geppo allows the users to actually jump off the air itself, allowing them to stay in the air for much longer than usual"
        }, 
        Rankakyu = {
            moneyreq = 2000, 
            statreq = {
                FightingStyleMastery = 25, 
                ["/SKILL/Rokushiki"] = 5
            }, 
            stamreq = 20, 
            cd = 5, 
            desc = "The Rankyaku is a  powerful projectile technique, in which the users start by kicking at very high speeds and strength, sending out a sharp compressed air blade that can slice objects and greatly damage a human body"
        }, 
        Rokuogan = {
            ULT = true, 
            moneyreq = 9000, 
            statreq = {
                FightingStyleMastery = 95, 
                ["/SKILL/Rokushiki"] = 6
            }, 
            stamreq = 150, 
            cd = 60, 
            desc = "The user places both their fists right in front of the target to focus their physical strength to launch a devastating shock wave in a forward direction"
        }
    }, 
    {
        ["Armament Haki"] = {
            stamreq = 0, 
            statreq = {
                BusoMastery = 1
            }, 
            cd = 0.2, 
            desc = "A form of Haki that allows the user to use their spirit to create, in essence, an invisible armor around themselves"
        }
    }, 
    {
        Block = {
            stamreq = 10, 
            cd = 0.2, 
            desc = "Blocks against damage, will stun the user if attacks are too powerful"
        }
    }, 
    {
        ["Heavy Punch"] = {
            stamreq = 0, 
            cd = 3, 
            desc = "A heavy punch that breaks blocks."
        }
    }, 
    {
        ["Gomu-Gomu no Pistol"] = {
            stamreq = 20, 
            statreq = {
                DevilFruitMastery = 15
            }, 
            cd = 0.25, 
            desc = "A very straightforward punch intensified by stretching the user's highly elastic arm. Useful at mid range."
        }, 
        ["Gomu-Gomu no Balloon"] = {
            stamreq = 45, 
            statreq = {
                DevilFruitMastery = 25
            }, 
            cd = 18, 
            desc = "A technique that inflates the user from within the abdomen, temporarily enhancing defense and deflects cannonballs."
        }, 
        ["Gomu-Gomu no Rocket"] = {
            stamreq = 45, 
            statreq = {
                DevilFruitMastery = 35
            }, 
            cd = 13, 
            desc = "User stretches both arms and grabs onto the target before retracting and flinging themselves airborne."
        }, 
        ["Gomu-Gomu no Bazooka"] = {
            stamreq = 50, 
            statreq = {
                DevilFruitMastery = 50
            }, 
            cd = 15, 
            desc = "A stretched, two handed palm strike focused on pushing the enemy back and dealing medium damage."
        }, 
        ["Gomu-Gomu no Gatling"] = {
            stamreq = 20, 
            statreq = {
                DevilFruitMastery = 60
            }, 
            cd = 20, 
            desc = "This technique assaults your enemies with a swift barrage of stretched punches, pummeling them with overwhelming force."
        }, 
        ["Gomu-Gomu no Rifle"] = {
            ULT = true, 
            statreq = {
                DevilFruitMastery = 85
            }, 
            stamreq = 100, 
            cd = 65, 
            desc = "As an amplified version of its predecessor, this technique strikes faster than the eye can see."
        }
    }, 
    {
        ["36 Caliber Phoenix"] = {
            moneyreq = 0, 
            stamreq = 20, 
            statreq = {
                SwordMastery = 0, 
                ["/SKILL/1SS"] = 1
            }, 
            isFS = true, 
            cd = 4, 
            desc = "User creates a sharp, spiraling wind torrent that pierces and knocks back the target."
        }, 
        ["Rapid Slashes"] = {
            moneyreq = 750, 
            stamreq = 25, 
            statreq = {
                SwordMastery = 15, 
                ["/SKILL/1SS"] = 2
            }, 
            isFS = true, 
            cd = 10, 
            desc = "User sheathes and concentrates for an instant before performing an innumerable amount of slashes in quick succession."
        }, 
        ["Raging Serpent"] = {
            moneyreq = 1999, 
            stamreq = 40, 
            statreq = {
                SwordMastery = 45, 
                ["/SKILL/1SS"] = 3
            }, 
            isFS = true, 
            cd = 10, 
            desc = "User expands their consciousness and rends any hostiles within their field of fire upon release."
        }, 
        ["Shishi Sonson"] = {
            moneyreq = 9876, 
            stamreq = 85, 
            statreq = {
                SwordMastery = 80, 
                ["/SKILL/1SS"] = 4
            }, 
            isFS = true, 
            cd = 10, 
            desc = "User sheathes and braces before dashing flashing towards the cursor with a hypersonic quick draw."
        }, 
        ["Dragon Blaze"] = {
            ULT = true, 
            moneyreq = 12345, 
            stamreq = 125, 
            statreq = {
                SwordMastery = 200, 
                ["/SKILL/1SS"] = 5
            }, 
            isFS = true, 
            cd = 60, 
            desc = "While covered in dragon-like flames, the user drifts towards a targeted direction and ignites their trail after a brief pause."
        }
    }, 
    {
        ["Gut Punch"] = {
            stamreq = 10, 
            statreq = {
                Strength = 10
            }, 
            cd = 15, 
            desc = "A heavy punch to the gut with increased knockback and damage."
        }, 
        ["Ground Smash"] = {
            stamreq = 25, 
            statreq = {
                Strength = 25
            }, 
            cd = 20, 
            desc = "A heavy punch to the gut with increased knockback and damage."
        }
    }, 
    {
        ["Electro Fist"] = {
            moneyreq = 0, 
            statreq = {
                FightingStyleMastery = 0, 
                ["/SKILL/Electro"] = 1
            }, 
            stamreq = 20, 
            cd = 45, 
            desc = "A veil of lightning coats the user's fists; subsequent attacks gain electric properties.", 
            hyperArmor = true
        }, 
        ["Electro Dash"] = {
            moneyreq = 750, 
            statreq = {
                FightingStyleMastery = 15, 
                ["/SKILL/Electro"] = 2
            }, 
            stamreq = 20, 
            cd = 15, 
            desc = "User generates an electrifying aura before propelling themselves forwards. "
        }, 
        ["Electro Luna"] = {
            moneyreq = 1250, 
            statreq = {
                FightingStyleMastery = 25, 
                ["/SKILL/Electro"] = 3
            }, 
            stamreq = 30, 
            cd = 5, 
            desc = "User discharges several electrical currents forward."
        }, 
        ["Electro Rain"] = {
            moneyreq = 3000, 
            statreq = {
                FightingStyleMastery = 40, 
                ["/SKILL/Electro"] = 4
            }, 
            stamreq = 45, 
            cd = 9, 
            desc = "User leaps into the air and proceeds to smite a designated area with thunderbolts."
        }, 
        ["Raiju Punishment"] = {
            ULT = true, 
            moneyreq = 9999, 
            statreq = {
                FightingStyleMastery = 95, 
                ["/SKILL/Electro"] = 5
            }, 
            stamreq = 65, 
            cd = 45, 
            desc = "User propels themselves upwards, emulating a lightning strike as they descend."
        }
    }, 
    {
        ["Yoru Slash"] = {
            stamreq = 0, 
            statreq = {
                Strength = 0
            }, 
            cd = 0, 
            desc = "A veil of lightning coats the user's fists; subsequent attacks gain electric properties."
        }, 
        ["Thousand Slashes"] = {
            stamreq = 0, 
            statreq = {
                Strength = 0
            }, 
            cd = 0, 
            desc = "User generates an electrifying aura before propelling themselves forwards. "
        }
    }, 
    {
        Firefly = {
            stamreq = 25, 
            statreq = {
                DevilFruitMastery = 0
            }, 
            cd = 15, 
            desc = "User propels several green fireballs that track their target.", 
            InstantCast = true
        }, 
        ["Flame Flight"] = {
            stamreq = 35, 
            statreq = {
                DevilFruitMastery = 10
            }, 
            cd = 8, 
            desc = "Fly by borrowing properties of fire."
        }, 
        Hiken = {
            stamreq = 50, 
            statreq = {
                DevilFruitMastery = 35
            }, 
            cd = 6, 
            desc = "A fiery projection of the user's fist. Ignites affected terrain."
        }, 
        ["Flame Pillar"] = {
            stamreq = 75, 
            statreq = {
                DevilFruitMastery = 45
            }, 
            cd = 15, 
            desc = "The user erupts into flames, creating a spiraling column of fire within a small vicinity."
        }, 
        ["Dai Enkai: Entei"] = {
            ULT = true, 
            stamreq = 125, 
            statreq = {
                DevilFruitMastery = 95
            }, 
            cd = 45, 
            desc = "The user launches a gigantic sphere of fire that implodes on impact, releasing waves of heat."
        }
    }, 
    {
        ["Barrier Crash"] = {
            stamreq = 15, 
            statreq = {
                DevilFruitMastery = 0
            }, 
            cd = 9, 
            desc = "User summons a barrier and propells it foward, damaging targets."
        }, 
        ["Barrier Sphere"] = {
            stamreq = 25, 
            statreq = {
                DevilFruitMastery = 10
            }, 
            cd = 12, 
            desc = "User erects a spherical barrier that isolates/protects a designated area. This is the ultimate defense agaisnt AOE skills.", 
            InstantCast = true
        }, 
        ["Barrier Stairs"] = {
            stamreq = 15, 
            statreq = {
                DevilFruitMastery = 15
            }, 
            cd = 0.1, 
            desc = "Indestructible stairs to help you traverse any terrain.", 
            percentStamina = 0.05
        }, 
        ["Barrier Cage"] = {
            stamreq = 30, 
            statreq = {
                DevilFruitMastery = 35
            }, 
            cd = 15, 
            desc = "User constructs and levitates a vessel before crashing it into the ground, trapping foes in the process.", 
            InstantCast = true
        }, 
        ["Barrier Spikes"] = {
            ULT = true, 
            stamreq = 55, 
            statreq = {
                DevilFruitMastery = 55
            }, 
            cd = 45, 
            desc = "User conjures several cone-shaped barriers to erupt from the ground."
        }
    }, 
    {
        ["Light Lunge"] = {
            stamreq = 25, 
            statreq = {
                DevilFruitMastery = 20
            }, 
            cd = 12, 
            desc = "A sword thrust at the speed of light!"
        }, 
        ["Light Kick"] = {
            stamreq = 65, 
            statreq = {
                DevilFruitMastery = 40
            }, 
            cd = 13, 
            desc = "Discharge a burst of light that explodes on impact."
        }, 
        ["Light Ray"] = {
            stamreq = 75, 
            statreq = {
                DevilFruitMastery = 55
            }, 
            cd = 14, 
            desc = "User directs a maneuverable ray of light to scorch everything in its path."
        }, 
        ["Mirror Kick"] = {
            stamreq = 95, 
            statreq = {
                DevilFruitMastery = 75
            }, 
            cd = 10, 
            desc = "User zooms above a designated location before unleashing a light kick downwards.", 
            InstantCast = true
        }, 
        ["Jewels of Light"] = {
            ULT = true, 
            stamreq = 50, 
            statreq = {
                DevilFruitMastery = 95
            }, 
            cd = 45, 
            desc = "A devestating barrage of explosive beams."
        }, 
        PikaDash = {
            stamreq = 10, 
            statreq = {
                DevilFruitMastery = 0
            }, 
            cd = 0.5, 
            desc = "Passive: Dash replaced with teleport."
        }, 
        ["Light Flight"] = {
            stamreq = 15, 
            statreq = {
                DevilFruitMastery = 60
            }, 
            cd = 15, 
            desc = "User transforms into light and flys, reflecting off surfaces when touched.", 
            InstantCast = true
        }
    }, 
    {
        ["Self Invisibility"] = {
            stamreq = 25, 
            statreq = {
                DevilFruitMastery = 0
            }, 
            cd = 5, 
            desc = "User makes them self invisble and undetected"
        }, 
        ["Area Invisibility"] = {
            stamreq = 35, 
            statreq = {
                DevilFruitMastery = 15
            }, 
            cd = 8, 
            desc = "User makes everyone around them invisible and undetected."
        }, 
        ["Invisible Rock Throw"] = {
            stamreq = 30, 
            statreq = {
                DevilFruitMastery = 35
            }, 
            cd = 3, 
            desc = "User picks up a rock and makes it invisble then throws."
        }
    }, 
    {
        ["Magma Swamp"] = {
            stamreq = 25, 
            statreq = {
                DevilFruitMastery = 0
            }, 
            cd = 5, 
            desc = "Submerge yourself in lava for a while and emerge with a sudden punch."
        }, 
        ["Magma Eruption"] = {
            stamreq = 25, 
            statreq = {
                DevilFruitMastery = 25
            }, 
            cd = 15, 
            desc = "User calls forth bursts of magma from under all nearby enemies."
        }, 
        ["Magma Fist"] = {
            stamreq = 45, 
            statreq = {
                DevilFruitMastery = 45
            }, 
            cd = 7, 
            desc = "Envelope one arm with magma and unleash a deadly strike."
        }, 
        ["Magma Hound"] = {
            stamreq = 50, 
            statreq = {
                DevilFruitMastery = 65
            }, 
            cd = 14, 
            desc = "Fire a mass of hound-like magma with overwhelming might."
        }, 
        ["Magma Rain"] = {
            ULT = true, 
            stamreq = 25, 
            statreq = {
                DevilFruitMastery = 95
            }, 
            cd = 50, 
            desc = "Let loose a sky of red."
        }
    }, 
    {
        ["Kiribachi Frenzy"] = {
            stamreq = 35, 
            statreq = {
                SwordMastery = 50
            }, 
            cd = 20, 
            desc = "User spins around dealing aoe damage"
        }, 
        ["Kiribachi Smash"] = {
            stamreq = 45, 
            statreq = {
                SwordMastery = 65
            }, 
            cd = 12, 
            desc = "User smashes the ground with kiribachi"
        }, 
        ["Kiribachi Throw"] = {
            ULT = true, 
            stamreq = 0, 
            statreq = {
                DevilFruitMastery = 0
            }, 
            cd = 0, 
            desc = "User constructs and levitates a vessel before crashing it into the ground, trapping foes in the process."
        }
    }, 
    {
        ["Ice Partisan"] = {
            stamreq = 15, 
            statreq = {
                DevilFruitMastery = 0
            }, 
            cd = 0.75, 
            desc = "Launch glacial spears that produce patches of frost."
        }, 
        ["Ice Bike"] = {
            stamreq = 25, 
            statreq = {
                DevilFruitMastery = 15
            }, 
            cd = 16, 
            desc = "The fanciest method of transportation."
        }, 
        ["Pheasant Beak"] = {
            stamreq = 35, 
            statreq = {
                DevilFruitMastery = 30
            }, 
            cd = 15, 
            desc = "Propel a mass of pheasant-shaped ice capable of freezing victims."
        }, 
        ["Ice Stomp"] = {
            stamreq = 45, 
            statreq = {
                DevilFruitMastery = 55
            }, 
            cd = 7, 
            desc = "Chunks of ice burst forth to cripple enemies."
        }, 
        ["Frost Blade"] = {
            stamreq = 60, 
            statreq = {
                DevilFruitMastery = 70
            }, 
            cd = 12, 
            desc = "Slash thrice with a frigid blade."
        }, 
        ["Ice Age"] = {
            ULT = true, 
            stamreq = 75, 
            statreq = {
                DevilFruitMastery = 85
            }, 
            cd = 50, 
            desc = "Flash freeze everything within a vast radius."
        }
    }, 
    {
        ["Five Thousand Brick Fist"] = {
            moneyreq = 0, 
            stamreq = 25, 
            statreq = {
                FightingStyleMastery = 0, 
                ["/SKILL/FishmanKarate"] = 1
            }, 
            cd = 8, 
            desc = "Deliver a crushing blow with drenched fists."
        }, 
        ["Water Prison"] = {
            moneyreq = 2000, 
            stamreq = 35, 
            statreq = {
                FightingStyleMastery = 25, 
                ["/SKILL/FishmanKarate"] = 2
            }, 
            cd = 12, 
            desc = "Entrap the target in a levitating sphere of water.", 
            InstantCast = true
        }, 
        ["Shark Barrage"] = {
            moneyreq = 4000, 
            stamreq = 40, 
            statreq = {
                FightingStyleMastery = 50, 
                ["/SKILL/FishmanKarate"] = 3
            }, 
            cd = 12, 
            desc = "Release a string of shark-shaped projectiles that rupture on impact"
        }, 
        ["Water Serpent"] = {
            moneyreq = 6000, 
            stamreq = 50, 
            statreq = {
                FightingStyleMastery = 75, 
                ["/SKILL/FishmanKarate"] = 4
            }, 
            cd = 6, 
            desc = "Sends forth a giant serpent made of water that follows your mouse and explodes on contact.", 
            InstantCast = true
        }, 
        ["Water Bomb"] = {
            ULT = true, 
            moneyreq = 12000, 
            stamreq = 150, 
            statreq = {
                FightingStyleMastery = 125, 
                ["/SKILL/FishmanKarate"] = 5
            }, 
            cd = 45, 
            desc = "User generates a large water bomb and shoots it towards a target."
        }
    }, 
    {
        BombDash = {
            stamreq = 10, 
            statreq = {
                DevilFruitMastery = 0
            }, 
            cd = 0.75, 
            desc = "User summons a barrier and propells it foward, damaging targets."
        }, 
        ["Explosive Leap"] = {
            stamreq = 15, 
            percentStamina = 0.02, 
            statreq = {
                DevilFruitMastery = 0
            }, 
            cd = 1, 
            desc = "Propel yourself to bombastic heights."
        }, 
        ["Explosive Swipe"] = {
            stamreq = 30, 
            statreq = {
                DevilFruitMastery = 15
            }, 
            cd = 3, 
            desc = "A target location is combusted.", 
            InstantCast = true
        }, 
        ["Explosive Mines"] = {
            stamreq = 50, 
            statreq = {
                DevilFruitMastery = 30
            }, 
            cd = 9, 
            desc = "Patches of terrain are transmuted into landmines."
        }, 
        ["Explosive Grab"] = {
            stamreq = 25, 
            statreq = {
                DevilFruitMastery = 50
            }, 
            cd = 19, 
            desc = "Deliver a point blank detonation in someone's face."
        }, 
        ["Self Destruction"] = {
            ULT = true, 
            stamreq = 0, 
            statreq = {
                DevilFruitMastery = 85
            }, 
            cd = 45, 
            desc = "Sacrifice your very self for the ultimate art."
        }
    }, 
    {
        GoroDash = {
            stamreq = 15, 
            statreq = {
                DevilFruitMastery = 0
            }, 
            cd = 0.5, 
            desc = "User constructs and levitates a vessel before crashing it into the ground, trapping foes in the process."
        }, 
        ["Lightning Paralyzation"] = {
            stamreq = 15, 
            statreq = {
                DevilFruitMastery = 0
            }, 
            cd = 15, 
            desc = "Conjure several bolts of lightning in an adjustable area."
        }, 
        ["Flash Smash"] = {
            hyperArmor = true, 
            stamreq = 30, 
            statreq = {
                DevilFruitMastery = 15
            }, 
            cd = 12, 
            desc = "Flash toward a target location and discharge electricity. "
        }, 
        ["Lightning Form"] = {
            stamreq = 45, 
            statreq = {
                DevilFruitMastery = 35
            }, 
            cd = 16, 
            desc = "Flash thru the air, allowing for quick transportation."
        }, 
        ["Lightning Wrath"] = {
            stamreq = 75, 
            statreq = {
                DevilFruitMastery = 50
            }, 
            cd = 18, 
            desc = "Call upon torrents of lightning bolts to smite a wide area. "
        }, 
        ["Lightning Dragon"] = {
            stamreq = 50, 
            statreq = {
                DevilFruitMastery = 75
            }, 
            cd = 7, 
            desc = "Release a current of electricity shaped like a dragon and does chain damage."
        }, 
        ["Thunder Greeting"] = {
            ULT = true, 
            stamreq = 95, 
            statreq = {
                DevilFruitMastery = 125
            }, 
            cd = 65, 
            desc = "Several thunderstorms are condensed to unleash a sphere of thundery destruction."
        }
    }, 
    {
        ["Rapid Thrust"] = {
            stamreq = 35, 
            statreq = {
                Strength = 25
            }, 
            cd = 10, 
            desc = "A rapid thrust"
        }, 
        ["Golden Sweep"] = {
            stamreq = 40, 
            statreq = {
                Strength = 45
            }, 
            cd = 15, 
            desc = "User spins their pole over their head."
        }, 
        ["Pole Counter"] = {
            stamreq = 20, 
            statreq = {
                Strength = 75
            }, 
            cd = 25, 
            desc = "A counter move that heals damage taken", 
            IsCounter = true
        }, 
        ["Golden Staff Transform"] = {
            stamreq = 0, 
            statreq = {
                Strength = 0, 
                DF = {
                    "Goro-Goro", 
                    "Goru-Goru"
                }
            }, 
            cd = 2, 
            desc = "User constructs and levitates a vessel before crashing it into the ground, trapping foes in the process."
        }
    }, 
    {
        ["Healing Rhyme"] = {
            stamreq = 25, 
            statreq = {
                Strength = 25
            }, 
            cd = 15, 
            desc = "User rings their bell and heals party members including themselves."
        }, 
        ["Juggernaut Rhyme"] = {
            stamreq = 0, 
            statreq = {
                SwordMastery = 0
            }, 
            cd = 0, 
            desc = "User summons a barrier and propells it foward, damaging targets."
        }
    }, 
    {
        ["Sweet Treat"] = {
            stamreq = 35, 
            statreq = {
                SwordMastery = 20
            }, 
            cd = 20, 
            desc = "User bits on the candy cane and gets health regen"
        }, 
        ["Flash Freeze"] = {
            stamreq = 45, 
            statreq = {
                SwordMastery = 50
            }, 
            cd = 15, 
            desc = "User stabs the floor summoning ice that freezes."
        }
    }, 
    {
        ["Gravity Push"] = {
            stamreq = 30, 
            statreq = {
                DevilFruitMastery = 15
            }, 
            cd = 5, 
            desc = "Repel everything within a short area towards the cursor."
        }, 
        ["Gravity Fly"] = {
            stamreq = 10, 
            statreq = {
                DevilFruitMastery = 35
            }, 
            cd = 10, 
            desc = "A target is pulled towards the user."
        }, 
        ["Gravity Pull"] = {
            stamreq = 25, 
            statreq = {
                DevilFruitMastery = 45
            }, 
            cd = 15, 
            desc = "Fly by levitating a chunk of the terrain."
        }, 
        ["Gravity Dominance"] = {
            stamreq = 50, 
            statreq = {
                DevilFruitMastery = 60
            }, 
            cd = 12, 
            desc = "Assert pressure over an increasing area of effect."
        }, 
        ["Meteor Strike"] = {
            stamreq = 75, 
            statreq = {
                DevilFruitMastery = 70
            }, 
            cd = 15, 
            desc = "Redirect a meteor's trajectory towards the cursor."
        }, 
        ["Meteor Fury"] = {
            ULT = true, 
            stamreq = 130, 
            statreq = {
                DevilFruitMastery = 85
            }, 
            cd = 45, 
            desc = "Bring down a cluster of cosmic debris."
        }
    }, 
    {
        ["Gravity Frenzy"] = {
            stamreq = 35, 
            statreq = {
                SwordMastery = 25
            }, 
            cd = 7, 
            desc = "User grabs all targets near towards them with the power of gravity then preceeds to rapid slash them"
        }, 
        ["Gravity Field"] = {
            stamreq = 50, 
            statreq = {
                SwordMastery = 50
            }, 
            cd = 15, 
            desc = "User targets a specific area with the power of gravity"
        }
    }, 
    {
        ["Trident Pull"] = {
            stamreq = 20, 
            statreq = {
                SwordMastery = 25
            }, 
            cd = 15, 
            desc = "User throws their trident and pulls targets towards them"
        }, 
        ["Trident Impale"] = {
            stamreq = 35, 
            statreq = {
                SwordMastery = 50
            }, 
            cd = 10, 
            desc = "User impales the target doing bleed damage then smashing them to the ground after"
        }
    }, 
    {
        ["Love Pistol"] = {
            stamreq = 20, 
            statreq = {
                DevilFruitMastery = 15
            }, 
            cd = 2, 
            desc = "Shoot a small heart towards the target, if hit turning them to stone for a short time."
        }, 
        ["Love Bomb"] = {
            stamreq = 35, 
            statreq = {
                DevilFruitMastery = 25
            }, 
            cd = 14, 
            desc = "Charm those around you and stun them for a short time."
        }, 
        ["Love Wave"] = {
            stamreq = 40, 
            statreq = {
                DevilFruitMastery = 40
            }, 
            cd = 13, 
            desc = "Release multiple waves of love, turning all targets that it passes thru into stone."
        }, 
        ["Love Burst"] = {
            stamreq = 50, 
            statreq = {
                DevilFruitMastery = 60
            }, 
            cd = 15, 
            desc = "Release a burst of arrows that block break and turns targets into stone."
        }, 
        ["Perfume Femur"] = {
            ULT = true, 
            stamreq = 35, 
            statreq = {
                DevilFruitMastery = 90
            }, 
            cd = 45, 
            desc = "A barrage of powerful kicks"
        }
    }, 
    {
        ["Flower Smell"] = {
            stamreq = 25, 
            statreq = {
                SwordMastery = 20
            }, 
            cd = 10, 
            desc = "User smells the flower gaining stamina regen"
        }, 
        ["Flower Charm"] = {
            stamreq = 40, 
            statreq = {
                SwordMastery = 40
            }, 
            cd = 15, 
            desc = "User waves their flower, charming those around and brings them closer"
        }
    }, 
    {
        ["Shock Punch"] = {
            stamreq = 35, 
            statreq = {
                DevilFruitMastery = 20
            }, 
            cd = 9, 
            desc = "Launch a space-shattering ball of shock-waves a short distance toward the cursor."
        }, 
        ["Head Crusher"] = {
            stamreq = 40, 
            statreq = {
                DevilFruitMastery = 45
            }, 
            cd = 15, 
            desc = "Obliterate a target with three localized earthquakes delivered at point-blank range."
        }, 
        ["Come AT me"] = {
            stamreq = 50, 
            statreq = {
                DevilFruitMastery = 65
            }, 
            cd = 20, 
            desc = "Short-duration counter that prompts a teleporting Shock Punch.", 
            IsCounter = true
        }, 
        ["Blast Clutcher"] = {
            stamreq = 80, 
            statreq = {
                DevilFruitMastery = 80
            }, 
            cd = 30, 
            desc = "Fracture space within a small proximity to crush surrounding foes."
        }, 
        ["Sea Quake"] = {
            ULT = true, 
            stamreq = 130, 
            statreq = {
                DevilFruitMastery = 115
            }, 
            cd = 75, 
            desc = "A two-stage attack of seismic and tidal waves. Enemies within a huge vicinity are squashed between colliding tsunamis."
        }
    }, 
    {
        ["Heavy Sweep"] = {
            stamreq = 35, 
            statreq = {
                SwordMastery = 45
            }, 
            cd = 15, 
            desc = "Rotate the mighty polearm at extremely high speeds to continuously damage foes.", 
            InstantCast = true
        }, 
        ["Shockwave Slash"] = {
            stamreq = 55, 
            statreq = {
                SwordMastery = 75
            }, 
            cd = 25, 
            desc = "Perform a devestating smash; the number of quake-slashes incurred depends on the user's fruit.", 
            InstantCast = true
        }
    }, 
    {
        ["Elo Smash"] = {
            stamreq = 35, 
            statreq = {
                Strength = 50
            }, 
            cd = 15, 
            desc = "SMASH THAT HAMMER"
        }, 
        ["Pounding Festival"] = {
            stamreq = 50, 
            statreq = {
                Strength = 69
            }, 
            cd = 25, 
            desc = "SMASHES TARGET"
        }
    }, 
    {
        ["Summon Bunny"] = {
            stamreq = 0, 
            statreq = {
                SwordMastery = 0
            }, 
            cd = 0.2, 
            desc = "Summons a bunny which will obey your commands"
        }, 
        ["Bunny Target"] = {
            stamreq = 0, 
            statreq = {
                SwordMastery = 0
            }, 
            cd = 0, 
            desc = "Give your bunnies a target to attack", 
            InstantCast = true
        }, 
        ["Bunny Move"] = {
            stamreq = 0, 
            statreq = {
                SwordMastery = 0
            }, 
            cd = 0, 
            desc = "Command your bunnies to move to a given location"
        }, 
        ["Bunny Recall"] = {
            stamreq = 0, 
            statreq = {
                SwordMastery = 0
            }, 
            cd = 3, 
            desc = "Recalls your current bunny and teleports them to you"
        }
    }, 
    {
        ["Spinning Flight"] = {
            stamreq = 25, 
            statreq = {
                DevilFruitMastery = 15
            }, 
            cd = 8, 
            desc = "Achieve flight by rotating both arms like airplane propellers. "
        }, 
        ["Spinning Cyclone"] = {
            stamreq = 35, 
            statreq = {
                DevilFruitMastery = 35
            }, 
            cd = 15, 
            desc = "Obliterate a target with three localized earthquakes delivered at point-blank range."
        }, 
        ["Twister Throw"] = {
            stamreq = 40, 
            statreq = {
                DevilFruitMastery = 50
            }, 
            cd = 10, 
            desc = "Short-duration counter that prompts a teleporting Shock Punch."
        }
    }, 
    {
        ["Kilo Rise"] = {
            stamreq = 0, 
            statreq = {
                DevilFruitMastery = 15
            }, 
            cd = 0.1, 
            desc = "Elevate and enter a state of levitation."
        }, 
        ["Kilo Descend"] = {
            stamreq = 0, 
            statreq = {
                DevilFruitMastery = 15
            }, 
            cd = 0.1, 
            desc = "Enter a state of levitation and descend at a controlled pace."
        }, 
        ["Kilo Crash"] = {
            stamreq = 65, 
            statreq = {
                DevilFruitMastery = 45
            }, 
            cd = 50, 
            desc = "User increases their own weight and enters a state of freefall. Impact radius scales with initial height."
        }, 
        ["Kilo Float"] = {
            stamreq = 0, 
            statreq = {
                DevilFruitMastery = 0
            }, 
            cd = 0, 
            desc = "User makes their body heavy and crashes down."
        }
    }, 
    {
        ["72 Caliber Phoenix"] = {
            moneyreq = 0, 
            stamreq = 35, 
            statreq = {
                SwordMastery = 35, 
                ["/SKILL/2SS"] = 1
            }, 
            isFS = true, 
            cd = 6, 
            desc = "A torrent of shredding winds capable of slight knockback."
        }, 
        ["Raging Whirl"] = {
            InstantCast = true, 
            moneyreq = 0, 
            stamreq = 30, 
            statreq = {
                SwordMastery = 55, 
                ["/SKILL/2SS"] = 2
            }, 
            isFS = true, 
            cd = 15, 
            desc = "A vortex of slashes maintained through vertical rotation."
        }, 
        ["Tower Climb"] = {
            moneyreq = 0, 
            stamreq = 35, 
            statreq = {
                SwordMastery = 75, 
                ["/SKILL/2SS"] = 3
            }, 
            isFS = true, 
            cd = 12, 
            desc = "Assume a brief stance that allows the user to strike airborne their next source of harm.", 
            IsCounter = true
        }, 
        ["Nitoryu Strike"] = {
            moneyreq = 0, 
            stamreq = 50, 
            statreq = {
                SwordMastery = 90, 
                ["/SKILL/2SS"] = 4
            }, 
            isFS = true, 
            cd = 25, 
            desc = "Ferocious charge followed by a 2-stage spacial incision."
        }, 
        ["Rashomon Draw"] = {
            hyperArmor = true, 
            ULT = true, 
            moneyreq = 0, 
            stamreq = 90, 
            statreq = {
                SwordMastery = 125, 
                ["/SKILL/2SS"] = 5
            }, 
            isFS = true, 
            cd = 90, 
            desc = "A cross-slash performed at the speed of Iai techniques. Executions will trigger a cinematic sequence. "
        }
    }, 
    {
        ["Desert Cutlass"] = {
            moneyreq = 0, 
            stamreq = 35, 
            statreq = {
                DevilFruitMastery = 25
            }, 
            cd = 13, 
            desc = "Generate a coarse, crescent blade for a quick swipe. "
        }, 
        ["Desert Cutlass: Frenzy"] = {
            moneyreq = 0, 
            stamreq = 35, 
            statreq = {
                DevilFruitMastery = 35
            }, 
            cd = 15, 
            desc = "An uppercut that leads to a sequence of slashes. "
        }, 
        ["Desert Flight"] = {
            moneyreq = 0, 
            stamreq = 35, 
            statreq = {
                DevilFruitMastery = 50
            }, 
            cd = 10, 
            desc = "Mimic flight by transforming the user's lower half into a mini dust tornado. "
        }, 
        ["Desert Storm"] = {
            moneyreq = 0, 
            stamreq = 45, 
            statreq = {
                DevilFruitMastery = 60
            }, 
            cd = 20, 
            desc = "Spawn a fierce cyclone formed from sand and gale. "
        }, 
        ["Desert Spada"] = {
            moneyreq = 0, 
            stamreq = 55, 
            statreq = {
                DevilFruitMastery = 80
            }, 
            cd = 16, 
            desc = "Send a stream of sand underground that erupts after a delay, splitting apart anyone caught in its path."
        }, 
        ["Desert Railgun"] = {
            ULT = true, 
            moneyreq = 0, 
            stamreq = 90, 
            statreq = {
                DevilFruitMastery = 100
            }, 
            cd = 90, 
            desc = "Maximize particle collision by compressing a sandstorm. The resulting explosion is accompanied by violent bursts of electricity. "
        }
    }, 
    {
        ["Eternal Flow"] = {
            moneyreq = 0, 
            stamreq = 35, 
            statreq = {
                SwordMastery = 60
            }, 
            cd = 15, 
            desc = "Manifest the sunken remains of an eldritch entity to pull in surrounding enemies.", 
            InstantCast = true
        }, 
        ["Slayer Cross Slash"] = {
            moneyreq = 0, 
            stamreq = 55, 
            statreq = {
                SwordMastery = 90
            }, 
            cd = 25, 
            desc = "Harness the Kraken's power in two overwhelming sword motions."
        }
    }, 
    {
        ["Hook Impale/Dehydrate"] = {
            moneyreq = 0, 
            stamreq = 40, 
            statreq = {
                SwordMastery = 60
            }, 
            cd = 20, 
            desc = "Puncture and suspend a target before bashing them into the ground. A draining choke is performed instead should the user possess affinity for the sands. "
        }, 
        ["Activate Poison"] = {
            moneyreq = 0, 
            stamreq = 25, 
            statreq = {
                SwordMastery = 35
            }, 
            cd = 15, 
            desc = "Poisonous vapor emerges to imbue the weapon with deadly afflictions."
        }
    }, 
    {
        ["Cutlass Lunge"] = {
            moneyreq = 0, 
            stamreq = 35, 
            statreq = {
                SwordMastery = 75
            }, 
            cd = 15, 
            desc = "Lunge towards the cursor after a brief delay, carrying enemies along. "
        }, 
        ["Cutlass Ladder"] = {
            moneyreq = 0, 
            stamreq = 50, 
            statreq = {
                SwordMastery = 90
            }, 
            cd = 8, 
            desc = "A back-handed upward spiral that propels enemies airborne. "
        }
    }, 
    {
        ["Exit Mount"] = {
            stamreq = 0, 
            statreq = {
                DevilFruitMastery = 0
            }, 
            cd = 0, 
            desc = "Exit da karoo!"
        }
    }, 
    {
        ["Nobu Meteor"] = {
            moneyreq = 0, 
            stamreq = 5, 
            statreq = {
                DevilFruitMastery = 25
            }, 
            cd = 35, 
            desc = "bye bye earth"
        }, 
        ["Nobu Bat Barrage"] = {
            moneyreq = 0, 
            stamreq = 5, 
            statreq = {
                DevilFruitMastery = 25
            }, 
            cd = 10, 
            desc = "bye bye earth"
        }, 
        ["Nobu Hammer"] = {
            moneyreq = 0, 
            stamreq = 5, 
            statreq = {
                DevilFruitMastery = 25
            }, 
            cd = 10, 
            desc = "bye bye earth"
        }, 
        ["Nobu Morph"] = {
            moneyreq = 0, 
            stamreq = 5, 
            statreq = {
                DevilFruitMastery = 25
            }, 
            cd = 0.2, 
            desc = "bye bye earth"
        }, 
        ["Gates of Nobu"] = {
            moneyreq = 0, 
            stamreq = 5, 
            statreq = {
                DevilFruitMastery = 25
            }, 
            cd = 15, 
            desc = "bye bye earth"
        }, 
        ["Nobu Command"] = {
            moneyreq = 0, 
            stamreq = 5, 
            statreq = {
                DevilFruitMastery = 25
            }, 
            cd = 15, 
            desc = "bye bye earth"
        }, 
        ["Nobu Swap"] = {
            moneyreq = 0, 
            stamreq = 5, 
            statreq = {
                DevilFruitMastery = 25
            }, 
            cd = 2, 
            desc = "bye bye earth"
        }
    }, 
    {
        ["Negative Hollow"] = {
            moneyreq = 0, 
            stamreq = 35, 
            statreq = {
                DevilFruitMastery = 25
            }, 
            cd = 17, 
            desc = "Summon a tracking hollow that depresses its target."
        }, 
        ["Explosive Snap"] = {
            moneyreq = 0, 
            stamreq = 15, 
            statreq = {
                DevilFruitMastery = 35
            }, 
            cd = 1, 
            desc = "Detonate every explosive hollow attached to an eligible target."
        }, 
        ["Soul Unbound"] = {
            moneyreq = 0, 
            stamreq = 50, 
            statreq = {
                DevilFruitMastery = 55
            }, 
            cd = 18, 
            desc = "Assume remote control of your soul in an experience akin to astral projection. The main body is twice as vulnerable in this state; taking damage will force the soul back to its place."
        }, 
        ["Mini Hollow Barrage"] = {
            moneyreq = 0, 
            stamreq = 70, 
            statreq = {
                DevilFruitMastery = 75
            }, 
            cd = 10, 
            desc = "First usage readies a hollow brigade that attaches to their target. Second usage sends them after a designated target."
        }, 
        ["Explosive Snap: Twirl"] = {
            moneyreq = 0, 
            stamreq = 50, 
            statreq = {
                DevilFruitMastery = 80
            }, 
            cd = 18, 
            desc = "Levitate every nearby foe with explosive negative hollows and deliver a parting snap."
        }, 
        ["Kamikaze Hollow"] = {
            ULT = true, 
            moneyreq = 0, 
            stamreq = 100, 
            statreq = {
                DevilFruitMastery = 100
            }, 
            cd = 60, 
            desc = "Invoke a giant, explosive hollow capable of restraining an enemy."
        }
    }, 
    {
        ["Crimson Slice"] = {
            moneyreq = 0, 
            stamreq = 35, 
            statreq = {
                SwordMastery = 45
            }, 
            cd = 13, 
            desc = "Reap vertically in a semi-circular motion."
        }, 
        ["Reaping Slash"] = {
            moneyreq = 0, 
            stamreq = 50, 
            statreq = {
                SwordMastery = 65
            }, 
            cd = 18, 
            desc = "Sever all enemies in your immediate radius after a brief charge."
        }
    }, 
    {
        ["Shadow's Mark"] = {
            hyperArmor = true, 
            moneyreq = 0, 
            stamreq = 35, 
            statreq = {
                SwordMastery = 45
            }, 
            cd = 9, 
            desc = "Leave behind a shadowy apparition to be swapped with upon recasting."
        }, 
        ["Thousand Strikes"] = {
            moneyreq = 0, 
            stamreq = 0, 
            statreq = {
                SwordMastery = 70
            }, 
            cd = 10, 
            desc = "A quick burst of slashes capable of shredding most means of defense."
        }
    }, 
    {
        ["Ba'als Fear"] = {
            moneyreq = 0, 
            stamreq = 45, 
            statreq = {
                SwordMastery = 0
            }, 
            cd = 15, 
            desc = "Unleash an aura of doom that compel enemies to flee."
        }
    }, 
    {
        ["Jack in the Box"] = {
            moneyreq = 0, 
            stamreq = 25, 
            statreq = {
                SwordMastery = 0
            }, 
            cd = 15, 
            desc = "Place a box that will activate when a target is near and fear them."
        }
    }, 
    {
        ["Prestige Sweet Treat"] = {
            stamreq = 35, 
            statreq = {
                SwordMastery = 20
            }, 
            cd = 15, 
            desc = "User bits on the candy cane and gets health regen"
        }, 
        ["Prestige Flash Freeze"] = {
            stamreq = 45, 
            statreq = {
                SwordMastery = 50
            }, 
            cd = 20, 
            desc = "User stabs the floor summoning ice that freezes."
        }
    }, 
    {
        ["Festival Thrust"] = {
            stamreq = 35, 
            statreq = {
                SwordMastery = 20
            }, 
            cd = 15, 
            desc = "User bits on the candy cane and gets health regen"
        }, 
        ["Festival Crash"] = {
            stamreq = 45, 
            statreq = {
                SwordMastery = 65
            }, 
            cd = 15, 
            desc = "User stabs a target and runs with them impaled."
        }, 
        ["Frost Wall"] = {
            stamreq = 60, 
            statreq = {
                SwordMastery = 85
            }, 
            cd = 20, 
            desc = "User stabs the floor summoning a ice wall."
        }
    }, 
    {
        ["Shield Bash"] = {
            stamreq = 55, 
            statreq = {
                Strength = 50
            }, 
            cd = 20, 
            desc = "BASH"
        }, 
        ["Sharing is Caring!"] = {
            stamreq = 45, 
            statreq = {
                Strength = 75
            }, 
            cd = 35, 
            desc = "User goes into a stance and prepares to reflect all source of damage for 5 seconds. Reflected damage % scales off defense."
        }
    }, 
    {
        ["Mochi Barrage"] = {
            stamreq = 35, 
            statreq = {
                DevilFruitMastery = 25
            }, 
            cd = 15, 
            desc = "Oppress the target area with a great hail of haki-infused punches.", 
            InstantCast = true
        }, 
        ["Power Mochi"] = {
            stamreq = 45, 
            statreq = {
                DevilFruitMastery = 45
            }, 
            cd = 15, 
            desc = "Project a gigantic mochi fist clad in haki."
        }, 
        ["Mochi Drops"] = {
            stamreq = 45, 
            statreq = {
                DevilFruitMastery = 55
            }, 
            cd = 17, 
            desc = "A six-fold eruption of mochi that impacts surrounding terrain."
        }, 
        ["Mochi Donut Roll"] = {
            stamreq = 50, 
            statreq = {
                DevilFruitMastery = 65
            }, 
            cd = 18, 
            desc = "Transform into a mochi doughnut to bulldoze your victims."
        }, 
        ["Chestnut Mochi"] = {
            stamreq = 35, 
            statreq = {
                DevilFruitMastery = 80
            }, 
            cd = 20, 
            desc = "Form a spiraling strip of mochi that fires haki-infused spikes in quick succession."
        }, 
        ["Burning Mochi Punch"] = {
            stamreq = 60, 
            statreq = {
                DevilFruitMastery = 85
            }, 
            cd = 14, 
            desc = "Superheat a condensed mochi fist before letting it fly. The attack dissipates shortly but carries tremendous force."
        }, 
        ["Mochi Buzzcut"] = {
            ULT = true, 
            stamreq = 95, 
            statreq = {
                DevilFruitMastery = 125
            }, 
            cd = 75, 
            desc = "Rotate your mochi forearm at dizzying speeds. Enemies caught by the revolving colossus are impaled by haki spikes and crushed under a powerful will."
        }, 
        ["Future Sight"] = {
            hiddenLock = true, 
            moneyreq = 0, 
            stamreq = 0, 
            statreq = {
                KenMastery = 700
            }, 
            cd = 0, 
            desc = "The height of observation coupled with this devil fruit allows the user to become completely impervious to most forms of attack."
        }
    }, 
    {
        ["String Bullet"] = {
            stamreq = 10, 
            statreq = {
                DevilFruitMastery = 15
            }, 
            cd = 1.5, 
            desc = "Fire a bullet of intertwined threads."
        }, 
        ["Pentachromatic Strings"] = {
            stamreq = 30, 
            statreq = {
                DevilFruitMastery = 30
            }, 
            cd = 12, 
            desc = "Dash forth with multi-colored slashes."
        }, 
        ["Sky Strings"] = {
            InstantCast = true, 
            stamreq = 0, 
            statreq = {
                DevilFruitMastery = 45
            }, 
            cd = 0.1, 
            desc = "Sling some strings and travel by pivoting off of your point of contact."
        }, 
        ["Overheated Whip"] = {
            stamreq = 45, 
            statreq = {
                DevilFruitMastery = 60
            }, 
            cd = 15, 
            desc = "Brandishing a fiery whip, erupt a small area in flames."
        }, 
        ["Parasitic Strings"] = {
            stamreq = 55, 
            statreq = {
                DevilFruitMastery = 75
            }, 
            cd = 15, 
            desc = "A target is rendered momentarily immobile by strangulating strings. "
        }, 
        Birdcage = {
            InstantCast = true, 
            ULT = true, 
            stamreq = 75, 
            statreq = {
                DevilFruitMastery = 85
            }, 
            cd = 75, 
            desc = "Create a large enclosure that eviscerates its prisoners."
        }
    }, 
    {
        ["Sky Walk2"] = {
            percentStamina = v3.percentStamina, 
            baseStamina = v3.baseStamina, 
            statreq = {
                Strength = 0
            }, 
            stamreq = 0, 
            cd = 0.2, 
            desc = "The Geppo allows the users to actually jump off the air itself, allowing them to stay in the air for much longer than usual"
        }
    }, 
    {
        ["Cupid's Blessing"] = {
            stamreq = 40, 
            statreq = {
                SwordMastery = 35
            }, 
            cd = 20, 
            desc = "Call a blessing, healing you and all party members around you."
        }, 
        ["Cupid's Wrath"] = {
            stamreq = 55, 
            statreq = {
                SwordMastery = 55
            }, 
            cd = 15, 
            desc = "Call a thunder cloud which strikes targets that are nearby"
        }
    }, 
    {
        Decimation = {
            stamreq = 35, 
            statreq = {
                SwordMastery = 40
            }, 
            cd = 10, 
            desc = "Spin and slash all targets around you."
        }, 
        ["Get over here!"] = {
            stamreq = 40, 
            statreq = {
                SwordMastery = 55
            }, 
            cd = 15, 
            desc = "Pulls a target towards you with axe."
        }
    }, 
    {
        ["Bat Tornado"] = {
            stamreq = 25, 
            statreq = {
                DevilFruitMastery = 15
            }, 
            cd = 15, 
            desc = "Attack by dissolving into bat-like shadows."
        }, 
        ["Shadow Trap"] = {
            stamreq = 45, 
            statreq = {
                DevilFruitMastery = 35
            }, 
            cd = 16, 
            desc = "Spawn a box of shadows at the cursor that will slam down on those entrapped.", 
            InstantCast = true
        }, 
        ["Fleeing Shadows"] = {
            stamreq = 45, 
            statreq = {
                DevilFruitMastery = 55
            }, 
            cd = 9, 
            desc = "The user dematerializes for a brief moment to enable rapid movement.", 
            InstantCast = true
        }, 
        ["Burrowing Shadows"] = {
            stamreq = 45, 
            statreq = {
                DevilFruitMastery = 75
            }, 
            cd = 13, 
            desc = "Submerge in shifting shadows and release a massive column of umbral matter on exit.", 
            InstantCast = true, 
            Grounded = true
        }, 
        ["Shadows Grasp"] = {
            stamreq = 55, 
            statreq = {
                DevilFruitMastery = 85
            }, 
            cd = 20, 
            desc = "A ghastly hand sprouts from the cursor, grasping and crushing anyone in its immediate radius.", 
            InstantCast = true
        }, 
        ["Sillhouette's Assault"] = {
            stamreq = 75, 
            ULT = true, 
            statreq = {
                DevilFruitMastery = 125
            }, 
            cd = 85, 
            desc = "Materialize a reflection of oneself from beyond the umbra."
        }
    }, 
    {
        ["Blade Whirl"] = {
            stamreq = 35, 
            statreq = {
                SwordMastery = 35
            }, 
            cd = 12, 
            desc = "The scissors are spun at high speeds to facilitate multiple incisions."
        }, 
        ["Shadow Extraction/Scissor Impale"] = {
            stamreq = 55, 
            statreq = {
                SwordMastery = 55
            }, 
            cd = 15, 
            desc = "Skewer the victim with both blades before punching them away. A shadow execution is performed instead should the user possess affinity for the shade."
        }
    }, 
    {
        ["Paw Cannon"] = {
            hyperArmor = true, 
            stamreq = 35, 
            statreq = {
                DevilFruitMastery = 25
            }, 
            cd = 6, 
            desc = "Fire a paw-shaped bubble of compressed air."
        }, 
        ["Shock Repel"] = {
            stamreq = 45, 
            statreq = {
                DevilFruitMastery = 35
            }, 
            cd = 13, 
            desc = "Emit an omnidirectional shockwave to repel attacks.", 
            IsCounter = true
        }, 
        Rendezvous = {
            stamreq = 100, 
            statreq = {
                DevilFruitMastery = 55
            }, 
            cd = 15, 
            desc = "Place an anchoring bubble that can be returned to upon recast."
        }, 
        ["Paw Bomb"] = {
            stamreq = 55, 
            statreq = {
                DevilFruitMastery = 65
            }, 
            cd = 13, 
            desc = "Compress pain and fatigue into an exploding bubble."
        }, 
        ["Paw Barrage"] = {
            stamreq = 50, 
            statreq = {
                DevilFruitMastery = 75
            }, 
            cd = 15, 
            desc = "Tiny bubbles of air, launched consecutively."
        }, 
        ["Ursus Shock"] = {
            stamreq = 90, 
            ULT = true, 
            statreq = {
                DevilFruitMastery = 95
            }, 
            cd = 70, 
            desc = "Surrounding air is compressed numerous times to form a bubble of mass destruction. Damage is reduced during charge."
        }, 
        PawDash = {
            stamreq = 10, 
            statreq = {
                DevilFruitMastery = 0
            }, 
            cd = 0.5, 
            desc = "Passive: Dash replaced with teleport."
        }
    }, 
    {
        ["Crescent Slash"] = {
            stamreq = 25, 
            statreq = {
                SwordMastery = 35
            }, 
            cd = 9, 
            desc = "Shusui's essence is condensed to form a crescent-shaped flying slash."
        }, 
        ["Triple Ripple"] = {
            stamreq = 45, 
            statreq = {
                SwordMastery = 75
            }, 
            cd = 16, 
            desc = "Slash vertically in three consecutive spins."
        }
    }, 
    {
        ["Soul Parade"] = {
            stamreq = 70, 
            statreq = {
                SwordMastery = 55
            }, 
            cd = 15, 
            desc = "Counter by freezing the immediate assailant with an otherworldy chill.", 
            IsCounter = true
        }, 
        ["Drawing Song"] = {
            stamreq = 45, 
            statreq = {
                SwordMastery = 75
            }, 
            cd = 15, 
            desc = "Shift toward the cursor and inflict multiple lacerations on foes en route."
        }
    }, 
    {
        ["Over Shoulder Slam"] = {
            stamreq = 25, 
            statreq = {
                Strength = 35
            }, 
            cd = 9, 
            desc = "Grapple and throw an opponent over yourself, back-first. This incredible feat scales with strength."
        }, 
        ["Grand Entrance Slam"] = {
            stamreq = 45, 
            statreq = {
                Strength = 65
            }, 
            cd = 15, 
            desc = "Leap a designated distance and shatter the earth on landing. Tremendous strength is necessary to perfect this technique."
        }
    }, 
    {
        ["Freezing Tune"] = {
            stamreq = 35, 
            statreq = {
                SwordMastery = 35
            }, 
            cd = 25, 
            desc = "Melodies to chill the soul."
        }
    }, 
    {
        ["Amp It Up!"] = {
            stamreq = 35, 
            statreq = {
                SwordMastery = 35
            }, 
            cd = 13, 
            desc = "Rev up the embers of life! Regain missing health at a set percentage."
        }, 
        ["Power Chord"] = {
            stamreq = 35, 
            statreq = {
                SwordMastery = 55
            }, 
            cd = 15, 
            desc = "Strings imbued with soulful vigor emit an attack of sound and frost."
        }
    }, 
    {
        ["Chilling Soul"] = {
            stamreq = 25, 
            statreq = {
                DevilFruitMastery = 35
            }, 
            cd = 24, 
            desc = "Release a wave of frigid air to freeze enemies where they stand."
        }, 
        ["Soul Form"] = {
            stamreq = 40, 
            statreq = {
                DevilFruitMastery = 55
            }, 
            cd = 15, 
            desc = "Escape the confinements of mortal flesh to seek out foes. Those contacted will freeze to their bones."
        }, 
        Skedaddle = {
            stamreq = 20, 
            statreq = {
                DevilFruitMastery = 65
            }, 
            cd = 15, 
            desc = "Approach your enemies with comedic intent. Transportation like no other."
        }, 
        ["Soul Assault"] = {
            stamreq = 45, 
            statreq = {
                DevilFruitMastery = 80
            }, 
            cd = 12, 
            desc = "Project a series of kicks using the player's partially detached spiritual avatar."
        }, 
        ["Death Defied"] = {
            stamreq = 100, 
            statreq = {
                DevilFruitMastery = 120
            }, 
            cd = 1, 
            desc = "A mutiny against the end. Resurrect on death with handicaps."
        }, 
        ["Soul King Roar"] = {
            stamreq = 125, 
            ULT = true, 
            statreq = {
                DevilFruitMastery = 90
            }, 
            cd = 50, 
            desc = "Summon an otherworldy avatar of the user's soul that sends surrounding enemies into a fearful frenzy."
        }
    }, 
    {
        ["Bone Frenzy"] = {
            stamreq = 35, 
            statreq = {
                Strength = 35
            }, 
            cd = 12, 
            desc = "Rev up the embers of life! Regain missing health at a set percentage."
        }, 
        ["Rib Smash"] = {
            stamreq = 35, 
            statreq = {
                Strength = 55
            }, 
            cd = 15, 
            desc = "Strings imbued with soulful vigor emit an attack of sound and frost."
        }
    }, 
    {
        ["Black Hole"] = {
            stamreq = 25, 
            statreq = {
                DevilFruitMastery = 15
            }, 
            cd = 12, 
            desc = "Summon a surge of darkness to entrap others around you."
        }, 
        ["Cruel Burst"] = {
            stamreq = 40, 
            statreq = {
                DevilFruitMastery = 25
            }, 
            cd = 16, 
            desc = "Create a point of attraction that engulfs and overwhelms its prey."
        }, 
        ["Abyssal Form"] = {
            stamreq = 25, 
            statreq = {
                DevilFruitMastery = 35
            }, 
            cd = 25, 
            desc = "Enter a temporary state of formlessness to mimic flight.", 
            InstantCast = true
        }, 
        ["Black Vortex"] = {
            stamreq = 30, 
            statreq = {
                DevilFruitMastery = 55
            }, 
            cd = 18, 
            desc = "Enemies are drawn closer by plumes of darkness.", 
            InstantCast = true
        }, 
        ["Dark Liberation"] = {
            stamreq = 45, 
            statreq = {
                DevilFruitMastery = 65
            }, 
            cd = 12, 
            desc = "Open a rift to the depths of darkness that consumes surrounding matter. Crushed debris is then released proportional to the mass consumed."
        }, 
        ["Black Star"] = {
            stamreq = 100, 
            ULT = true, 
            statreq = {
                DevilFruitMastery = 95
            }, 
            cd = 99, 
            desc = "Darkness insurmountable coalesce to form a destructive singularity."
        }
    }, 
    {
        ["Dragon Fist"] = {
            stamreq = 25, 
            statreq = {
                FightingStyleMastery = 15, 
                ["/SKILL/DragonClaw"] = 1
            }, 
            cd = 12, 
            desc = "Charge up a punch and knockback enemies in front of you."
        }, 
        ["Dragon Breath"] = {
            stamreq = 35, 
            statreq = {
                FightingStyleMastery = 25, 
                ["/SKILL/DragonClaw"] = 2
            }, 
            cd = 14, 
            desc = "Break the ground under you knocking enemies into the air"
        }, 
        ["Dragon Claw Stance"] = {
            stamreq = 45, 
            statreq = {
                FightingStyleMastery = 45, 
                ["/SKILL/DragonClaw"] = 3
            }, 
            cd = 45, 
            desc = "[HOLD] Enter a stance, that applies a brief damage boost to your next attacks"
        }, 
        ["Dragon Claw Slash"] = {
            stamreq = 35, 
            statreq = {
                FightingStyleMastery = 55, 
                ["/SKILL/DragonClaw"] = 4
            }, 
            cd = 16, 
            desc = "[PRESS] To perform a rapid slash barrage"
        }, 
        ["Dragon Rush"] = {
            stamreq = 70, 
            statreq = {
                FightingStyleMastery = 65, 
                ["/SKILL/DragonClaw"] = 5
            }, 
            cd = 18, 
            desc = "Rush forward bashing the first enemy hit into the ground"
        }, 
        ["Reverse Dragon"] = {
            stamreq = 25, 
            statreq = {
                FightingStyleMastery = 85, 
                ["/SKILL/DragonClaw"] = 6
            }, 
            cd = 20, 
            desc = "Enter a stance that will counter the next enemy attack", 
            IsCounter = true
        }, 
        ["Dragon Skull Crusher"] = {
            stamreq = 150, 
            ULT = true, 
            statreq = {
                FightingStyleMastery = 100, 
                ["/SKILL/DragonClaw"] = 7
            }, 
            cd = 90, 
            desc = "Charge up an ultimate skull crushing blow"
        }
    }, 
    {
        ["THE TROXX"] = {
            stamreq = 60, 
            statreq = {
                SwordMastery = 35
            }, 
            cd = 20, 
            desc = "Release 3 energy slashes"
        }, 
        ["Soul Eater"] = {
            stamreq = 35, 
            statreq = {
                SwordMastery = 75
            }, 
            cd = 30, 
            desc = "Impale a target and drain their life, healing yourself for a portion."
        }
    }, 
    {
        ["Pipe Rush"] = {
            stamreq = 35, 
            statreq = {
                Strength = 35
            }, 
            cd = 18, 
            desc = "Rush foward rapidly spinning your pipe and damaging enemies near"
        }, 
        ["Pipe Beatdown"] = {
            stamreq = 45, 
            statreq = {
                Strength = 65
            }, 
            cd = 17, 
            desc = "BEAT DOWN"
        }
    }, 
    {
        ["Explosive Field"] = {
            stamreq = 35, 
            statreq = {
                GunMastery = 35
            }, 
            cd = 12, 
            desc = "Designates three patches of terrain in front of the player where explosive outbursts will emerge."
        }, 
        ["SUPER MEGA DEATH ROCKET"] = {
            transformation = true, 
            stamreq = 75, 
            statreq = {
                GunMastery = 60
            }, 
            cd = 60, 
            desc = "Fire an ultra-accurate, explosive projectile that scales with charge. The resulting blast is nigh unstoppable."
        }
    }, 
    {
        ["Prestige Explosive Field"] = {
            stamreq = 35, 
            statreq = {
                GunMastery = 35
            }, 
            cd = 12, 
            desc = "Designates three patches of terrain in front of the player where explosive outbursts will emerge."
        }, 
        ["PRESTIGE SUPER MEGA DEATH ROCKET"] = {
            stamreq = 75, 
            statreq = {
                GunMastery = 60
            }, 
            cd = 60, 
            desc = "Fire an ultra-accurate, explosive projectile that scales with charge. The resulting blast is nigh unstoppable."
        }
    }, 
    {
        ["PRESTIGE TO THE MOON!"] = {
            stamreq = 25, 
            statreq = {
                SwordMastery = 25
            }, 
            cd = 12, 
            desc = "The next victim of this spear shall become firework, launched by its skyrocket in the spirit of celebration."
        }, 
        ["Prestige Firework Rush"] = {
            stamreq = 35, 
            statreq = {
                SwordMastery = 45
            }, 
            cd = 17, 
            desc = "Manuever the rocket-propelled spear to blast your target away."
        }
    }, 
    {
        ["TO THE MOON!"] = {
            stamreq = 25, 
            statreq = {
                SwordMastery = 25
            }, 
            cd = 12, 
            desc = "The next victim of this spear shall become firework, launched by its skyrocket in the spirit of celebration."
        }, 
        ["Firework Rush"] = {
            stamreq = 35, 
            statreq = {
                SwordMastery = 45
            }, 
            cd = 17, 
            desc = "Manuever the rocket-propelled spear to blast your target away."
        }
    }, 
    {
        ["Triple Talon Kick"] = {
            stamreq = 25, 
            statreq = {
                DevilFruitMastery = 10
            }, 
            cd = 8, 
            desc = "A deadly combo designed to overwhelm its victims. The receiver is lifted, battered, and dispatched with ease."
        }, 
        ["Talon Barrage"] = {
            stamreq = 25, 
            statreq = {
                DevilFruitMastery = 25
            }, 
            cd = 14, 
            desc = "With talons aflame, set off a frenzy of kicks to buffet and scorch your foes."
        }, 
        ["Phoenix Pyreapple"] = {
            stamreq = 15, 
            statreq = {
                DevilFruitMastery = 45
            }, 
            cd = 15, 
            desc = "Undying flames adorn the Phoenix. Every last malady is burnt away."
        }, 
        ["Phoenix Transformation"] = {
            transformation = true, 
            stamreq = 15, 
            statreq = {
                DevilFruitMastery = 55
            }, 
            cd = 1, 
            desc = "Soar to the sky on wings of blue. On hold, assume the mythical majesty in its entirety."
        }, 
        ["Immortal Thistle"] = {
            stamreq = 35, 
            statreq = {
                DevilFruitMastery = 65
            }, 
            cd = 20, 
            desc = "Maintain a fiery bulwark to nullify most damage."
        }, 
        ["Phoenix Brand"] = {
            stamreq = 35, 
            statreq = {
                DevilFruitMastery = 45
            }, 
            cd = 10, 
            desc = "Seize upon the Phoenix's wrath to deliver a charge of cometic might."
        }, 
        ["Phoenix Burst"] = {
            stamreq = 35, 
            statreq = {
                DevilFruitMastery = 55
            }, 
            cd = 10, 
            desc = "Unleash a spiraling blaze upon the earth. The number of projectiles is tripled while fully transformed."
        }, 
        ["Phoenix Dive Bomb"] = {
            stamreq = 75, 
            ULT = true, 
            statreq = {
                DevilFruitMastery = 90
            }, 
            cd = 65, 
            desc = "In two fell swoops, swipe your foes off their feet and lay waste to those below.", 
            InstantCast = true
        }, 
        ["Phoenix Carry"] = {
            stamreq = 20, 
            statreq = {
                DevilFruitMastery = 125
            }, 
            cd = 1, 
            desc = "roll"
        }
    }, 
    {
        ["Iceborn Aura"] = {
            stamreq = 25, 
            statreq = {
                SwordMastery = 25
            }, 
            cd = 14, 
            desc = "Imbue the chilling daggers with piercing cold. Repeated strikes will freeze the opponent."
        }, 
        ["Iceborn Death Lotus"] = {
            stamreq = 45, 
            statreq = {
                SwordMastery = 45
            }, 
            cd = 25, 
            desc = "The user is made nexus amidst a whirlwind of glacial blades."
        }
    }, 
    {
        ["Iceborn Lunge"] = {
            stamreq = 35, 
            statreq = {
                SwordMastery = 25
            }, 
            cd = 14, 
            desc = "Layers of frost form and shatter as the user drills forward in a vigorous lunge."
        }, 
        ["Iceborn Shards"] = {
            stamreq = 31.499999999999996, 
            statreq = {
                SwordMastery = 45
            }, 
            cd = 17, 
            desc = "Launch three frozen shards to extend the rapier's icy sting.", 
            InstantCast = true
        }
    }, 
    {
        ["Snow Gust"] = {
            stamreq = 25, 
            statreq = {
                DevilFruitMastery = 15
            }, 
            cd = 14, 
            desc = "Summon an advancing vortex of snow to occupy your opponents."
        }, 
        ["Frost Bite"] = {
            stamreq = 35, 
            statreq = {
                DevilFruitMastery = 25
            }, 
            cd = 15, 
            desc = "Choked of breath and warmth, the victim is freed only to shatter in a merciless slam."
        }, 
        ["Snow Reformation"] = {
            stamreq = 55, 
            statreq = {
                DevilFruitMastery = 55
            }, 
            cd = 25, 
            desc = "Assume the properties of snow to overcome obstacles.", 
            InstantCast = true
        }, 
        ["Snow Bunny Turret"] = {
            stamreq = 35, 
            statreq = {
                DevilFruitMastery = 65
            }, 
            cd = 20, 
            desc = "A sentient helper that will nail an opponent with snowballs until it melts."
        }, 
        ["Snow Storm"] = {
            stamreq = 25, 
            statreq = {
                DevilFruitMastery = 75
            }, 
            cd = 20, 
            desc = "Form a small but deadly storm of icicles to dice the opposition."
        }, 
        ["Snow Blizzard"] = {
            stamreq = 75, 
            ULT = true, 
            statreq = {
                DevilFruitMastery = 80
            }, 
            cd = 75, 
            desc = "Enemies are rendered helpless by an expanding snowstorm."
        }
    }, 
    {
        ["Venom Spit"] = {
            stamreq = 15, 
            statreq = {
                DevilFruitMastery = 25
            }, 
            cd = 6, 
            desc = "Spit a concentrated ball of venom to poison your foes."
        }, 
        ["Venom Hydra"] = {
            stamreq = 40, 
            statreq = {
                DevilFruitMastery = 35
            }, 
            cd = 17, 
            desc = "Manipulate vast amounts of venom and form it to a hydra that chases your foes.", 
            InstantCast = true
        }, 
        ["Venom Road"] = {
            stamreq = 20, 
            statreq = {
                DevilFruitMastery = 45
            }, 
            cd = 20, 
            desc = "Travel through your venom hydra to approach your enemies.", 
            InstantCast = true
        }, 
        ["Venom Discharge"] = {
            stamreq = 45, 
            statreq = {
                DevilFruitMastery = 55
            }, 
            cd = 12, 
            desc = "Discharge your venom in a powerful blast that arround you."
        }, 
        ["Venom Aura"] = {
            stamreq = 45, 
            statreq = {
                DevilFruitMastery = 65
            }, 
            cd = 25, 
            desc = "Produce a dangerous cloud of venom to harm foes surrounding you."
        }, 
        ["Venom Demon"] = {
            transformation = true, 
            stamreq = 125, 
            ULT = true, 
            statreq = {
                DevilFruitMastery = 90
            }, 
            cd = 25, 
            desc = "Manipulate your venom to create a demonic avatar which immensely increases your fighting capabilities."
        }, 
        ["Venom Rush"] = {
            stamreq = 100, 
            statreq = {
                DevilFruitMastery = 95
            }, 
            cd = 35, 
            desc = "Charge forward with your body to decimate all in your way."
        }, 
        ["Venom Poisonous Gas"] = {
            stamreq = 75, 
            statreq = {
                DevilFruitMastery = 105
            }, 
            cd = 35, 
            desc = "Produce an even more dangerous cloud of poison to wither surrounding foes."
        }, 
        ["Venom Slam"] = {
            stamreq = 55, 
            statreq = {
                DevilFruitMastery = 115
            }, 
            cd = 18, 
            desc = "Create a powerful poisonious slam downwards."
        }, 
        ["Venom Grab"] = {
            stamreq = 55, 
            statreq = {
                DevilFruitMastery = 120
            }, 
            cd = 25, 
            desc = "Ensnare a victim and bring them into your venomous embrace."
        }
    }, 
    {
        ["Spring Mode"] = {
            stamreq = 15, 
            statreq = {
                DevilFruitMastery = 5
            }, 
            cd = 25, 
            desc = "Morph your limbs into springs to enhance your combative capabilities."
        }, 
        ["Spring Facebreaker"] = {
            stamreq = 35, 
            statreq = {
                DevilFruitMastery = 25
            }, 
            cd = 16, 
            desc = "Bound forward and drag an enemy across the ground."
        }, 
        ["Spring Leap"] = {
            stamreq = 25, 
            statreq = {
                DevilFruitMastery = 30
            }, 
            cd = 14, 
            desc = "Leap into the air using the power of your springy limbs."
        }, 
        ["Spring Blitz"] = {
            stamreq = 35, 
            statreq = {
                DevilFruitMastery = 35
            }, 
            cd = 19, 
            desc = "Move forward in a zig-zag while attacking your foes."
        }, 
        ["Death Knock"] = {
            stamreq = 45, 
            statreq = {
                DevilFruitMastery = 55
            }, 
            cd = 25, 
            desc = "Compress your springs to charge forward and knockback enemies."
        }, 
        ["Coil Crusher"] = {
            stamreq = 65, 
            ULT = true, 
            statreq = {
                DevilFruitMastery = 65
            }, 
            cd = 65, 
            desc = "Unleash a powerful dropkick to devastate your opponent."
        }, 
        ["Spring Dash"] = {
            stamreq = 15, 
            statreq = {
                DevilFruitMastery = 0
            }, 
            DashSkill = true, 
            cd = 0.5, 
            desc = "Release a wave of frigid air to freeze enemies where they stand."
        }
    }, 
    {
        ["Healing Orb"] = {
            stamreq = 35, 
            statreq = {
                DevilFruitMastery = 25
            }, 
            cd = 10, 
            desc = "Release orbs which replenish your allies health."
        }, 
        ["Healing Support"] = {
            stamreq = 45, 
            statreq = {
                DevilFruitMastery = 35
            }, 
            cd = 20, 
            desc = "Conjure a healing orb that floats by your side and heals allies"
        }, 
        ["Healing Field"] = {
            stamreq = 35, 
            statreq = {
                DevilFruitMastery = 45
            }, 
            cd = 50, 
            desc = "Create a field that rapidly regenerates health when inside."
        }
    }, 
    {
        Room = {
            stamreq = 15, 
            statreq = {
                DevilFruitMastery = 15
            }, 
            cd = 1, 
            desc = "Create a spherical space around your opponents that allows you to begin your operation."
        }, 
        Thorn = {
            stamreq = 45, 
            statreq = {
                DevilFruitMastery = 25
            }, 
            cd = 20, 
            desc = "Tear up the ground to release a spike that launches your foes into the air.", 
            InstantCast = true
        }, 
        Shambles = {
            stamreq = 55, 
            statreq = {
                DevilFruitMastery = 35
            }, 
            cd = 8, 
            desc = "Rapidly switch places with any target of your choosing inside the room.", 
            InstantCast = true
        }, 
        Tact = {
            stamreq = 10, 
            statreq = {
                DevilFruitMastery = 45
            }, 
            cd = 25, 
            desc = "Tear up the ground to create floating debris that can be launched at devastating speeds.", 
            InstantCast = true
        }, 
        ["Counter Shock"] = {
            stamreq = 35, 
            statreq = {
                DevilFruitMastery = 55
            }, 
            cd = 18, 
            desc = "Grab your opponent and deliver a strong electric surge.", 
            InstantCast = true
        }, 
        ["Radio Knife"] = {
            stamreq = 45, 
            statreq = {
                DevilFruitMastery = 65
            }, 
            cd = 18, 
            desc = "Charge electricity into a blade and deliver multiple high speed slashes."
        }, 
        ["Injection Shot"] = {
            stamreq = 35, 
            statreq = {
                DevilFruitMastery = 70
            }, 
            cd = 22, 
            desc = "Release a powerful strike that pierces your foes."
        }, 
        Mes = {
            stamreq = 55, 
            statreq = {
                DevilFruitMastery = 85
            }, 
            cd = 28, 
            desc = "Strike forward and grab your opponents heart to deal devastating damage."
        }, 
        ["Surgeon Mode"] = {
            stamreq = 0, 
            statreq = {
                DevilFruitMastery = 55
            }, 
            cd = 1, 
            desc = "Discard abilites and gain new ones to continue your operation."
        }, 
        ["Gamma Knife"] = {
            stamreq = 75, 
            ULT = true, 
            statreq = {
                DevilFruitMastery = 95
            }, 
            cd = 90, 
            desc = "Pierce your opponent with a blade of pure energy that destroys your victims from the inside."
        }
    }, 
    {
        ["Machine Gun Blows"] = {
            moneyreq = 1, 
            stamreq = 35, 
            statreq = {
                FightingStyleMastery = 15, 
                ["/SKILL/Cyborg"] = 1
            }, 
            cd = 20, 
            desc = "Unleash a barrage of high speed punches to devastate your foes."
        }, 
        ["Laser Pulsar"] = {
            moneyreq = 1, 
            stamreq = 30, 
            statreq = {
                FightingStyleMastery = 25, 
                ["/SKILL/Cyborg"] = 2
            }, 
            cd = 14, 
            desc = "Release a powerful laser pulse at your foes."
        }, 
        ["Cyborg Flight"] = {
            moneyreq = 1, 
            stamreq = 55, 
            statreq = {
                FightingStyleMastery = 45, 
                ["/SKILL/Cyborg"] = 3
            }, 
            cd = 15, 
            desc = "Use your thrusters to take flight."
        }, 
        ["Self Repair"] = {
            moneyreq = 1, 
            stamreq = 45, 
            statreq = {
                FightingStyleMastery = 65, 
                ["/SKILL/Cyborg"] = 4
            }, 
            cd = 25, 
            desc = "Repair yourself to regenerate health quicky.", 
            Grounded = true
        }, 
        ["Missle Shower"] = {
            moneyreq = 1, 
            stamreq = 35, 
            statreq = {
                FightingStyleMastery = 75, 
                ["/SKILL/Cyborg"] = 5
            }, 
            cd = 19, 
            desc = "Fire a barrage of missles to strike your enemies from afar."
        }, 
        ["Obliteration Rush"] = {
            InstantCast = true, 
            moneyreq = 1, 
            ULT = true, 
            stamreq = 75, 
            statreq = {
                FightingStyleMastery = 100, 
                ["/SKILL/Cyborg"] = 6
            }, 
            cd = 75, 
            desc = "Lock onto a target and rapidly approach them before dealing a devastating blow."
        }
    }, 
    {
        Amputate = {
            stamreq = 35, 
            statreq = {
                SwordMastery = 25
            }, 
            cd = 20, 
            desc = "Deliver multiple slashes forward before sheathing the blade."
        }, 
        ["Sterben Linie"] = {
            stamreq = 45, 
            statreq = {
                SwordMastery = 35
            }, 
            cd = 16, 
            desc = "Unleash the Kikoku in a buzzsaw motion to vertically slash your enemies."
        }, 
        ["Sterben Kreis"] = {
            stamreq = 45, 
            statreq = {
                SwordMastery = 45, 
                DF = "Ope-Ope"
            }, 
            cd = 17, 
            desc = "Harness the power of the Ope to deliver horizontal slashes with the Kikoku."
        }, 
        ["Amputating Cleave"] = {
            stamreq = 55, 
            statreq = {
                SwordMastery = 55, 
                DF = "Ope-Ope"
            }, 
            cd = 20, 
            desc = "Harness the power of the Ope fruit to slash an opponents torso."
        }
    }, 
    {
        Gear2Dash = {
            stamreq = 15, 
            statreq = {
                DevilFruitMastery = 0
            }, 
            cd = 1, 
            desc = "The user's enhanced disposition allows for bursts of speed."
        }, 
        ["Jet Pistol"] = {
            stamreq = 15, 
            statreq = {
                DevilFruitMastery = 25
            }, 
            cd = 1, 
            desc = "A punch faster than the eye can follow."
        }, 
        ["Jet Stomp"] = {
            stamreq = 35, 
            statreq = {
                DevilFruitMastery = 35
            }, 
            cd = 15, 
            desc = "Evade the next instance of damage and trample its source."
        }, 
        ["Jet Rocket"] = {
            stamreq = 25, 
            statreq = {
                DevilFruitMastery = 55
            }, 
            cd = 12, 
            desc = "Propel yourself towards a grappled point and deal damage to foes on site."
        }, 
        ["Red Hawk"] = {
            stamreq = 45, 
            statreq = {
                DevilFruitMastery = 75
            }, 
            cd = 18, 
            desc = "A typical pistol punch imbued with flames of will. Its might reverberates in a fiery explosion."
        }, 
        ["Jet Gatling"] = {
            stamreq = 45, 
            statreq = {
                DevilFruitMastery = 85
            }, 
            cd = 12, 
            desc = "An untold amount of strikes besiege the enemy."
        }, 
        ["Elephant Gun"] = {
            stamreq = 85, 
            ULT = true, 
            statreq = {
                DevilFruitMastery = 120
            }, 
            cd = 85, 
            desc = "Appear above the target and let fall a punch of astronomical proportions."
        }, 
        ["Gear 2 Transformation"] = {
            transformation = true, 
            stamreq = 0, 
            statreq = {
                Gear2 = 6
            }, 
            cd = 12, 
            desc = "Manipulate your unique physiology to raise blood flow, oxygen, and nutrients to a critical point."
        }
    }, 
    {
        ["Will O' Wisp"] = {
            InstantCast = true, 
            moneyreq = 10, 
            stamreq = 15, 
            statreq = {
                FightingStyleMastery = 15, 
                ["/SKILL/Dullahan"] = 1
            }, 
            cd = 9, 
            desc = "Summon orbs of spirit fire that track down enemies."
        }, 
        ["Fear Inducement"] = {
            moneyreq = 20, 
            stamreq = 25, 
            statreq = {
                FightingStyleMastery = 25, 
                ["/SKILL/Dullahan"] = 2
            }, 
            cd = 18, 
            desc = "Grab hold of an opponent to instill a primal fear inside them."
        }, 
        ["Head Throw"] = {
            InstantCast = true, 
            moneyreq = 30, 
            stamreq = 35, 
            statreq = {
                FightingStyleMastery = 35, 
                ["/SKILL/Dullahan"] = 3
            }, 
            cd = 15, 
            desc = "Toss your own head as an explosive projectile."
        }, 
        Resurrection = {
            InstantCast = true, 
            moneyreq = 40, 
            stamreq = 75, 
            statreq = {
                FightingStyleMastery = 65, 
                ["/SKILL/Dullahan"] = 4
            }, 
            cd = 60, 
            desc = "Ressurect the dead to fight for you."
        }, 
        ["Onslaught of Shadows"] = {
            InstantCast = true, 
            moneyreq = 50, 
            ULT = true, 
            stamreq = 150, 
            statreq = {
                FightingStyleMastery = 75, 
                ["/SKILL/Dullahan"] = 5
            }, 
            cd = 80, 
            desc = "Summon shadows that charge forward alongside you and fear enemies on arrival."
        }
    }, 
    {
        ["Vampire Bite"] = {
            moneyreq = 5000, 
            stamreq = 35, 
            statreq = {
                FightingStyleMastery = 25, 
                ["/SKILL/Vampire"] = 1
            }, 
            cd = 18, 
            desc = "Leap forward and bite, replenishing health and blood."
        }, 
        ["Blood Dash"] = {
            moneyreq = 10000, 
            stamreq = 15, 
            statreq = {
                FightingStyleMastery = 35, 
                ["/SKILL/Vampire"] = 2
            }, 
            cd = 7, 
            desc = "Surround yourself in blood as you dash forward."
        }, 
        ["Blood Chain"] = {
            moneyreq = 15000, 
            stamreq = 25, 
            statreq = {
                FightingStyleMastery = 55, 
                ["/SKILL/Vampire"] = 3
            }, 
            cd = 25, 
            desc = "Impale opponents with a chain of blood before pulling them back and striking them."
        }, 
        ["Blood Aura"] = {
            transformation = true, 
            moneyreq = 25000, 
            stamreq = 45, 
            statreq = {
                FightingStyleMastery = 65, 
                ["/SKILL/Vampire"] = 4
            }, 
            cd = 18, 
            desc = "Gain lifesteal off abilities in exchange for Blood."
        }, 
        ["Blood Dragon"] = {
            InstantCast = true, 
            moneyreq = 50000, 
            ULT = true, 
            stamreq = 15, 
            statreq = {
                FightingStyleMastery = 125, 
                ["/SKILL/Vampire"] = 5
            }, 
            cd = 65, 
            desc = "Summon dragons conjured from Blood that swarm and destroy the targetted area."
        }
    }, 
    {
        ["Ruthless Blade"] = {
            stamreq = 45, 
            statreq = {
                SwordMastery = 25
            }, 
            cd = 20, 
            desc = "Ready a strike and teleport forwards, leaving behind a trail of slashes."
        }, 
        ["Dragon Flash"] = {
            stamreq = 25, 
            statreq = {
                SwordMastery = 25
            }, 
            cd = 12, 
            desc = "Charge a strike and propel it forwards as a projectile."
        }
    }, 
    {
        BasicEvasive = {
            stamreq = 0, 
            statreq = {
                SwordMastery = 0
            }, 
            cd = 0, 
            desc = "Gain the ability to swiftly evade out of attacks."
        }
    }, 
    {
        ["Final Retort"] = {
            stamreq = 45, 
            statreq = {
                SwordMastery = 25
            }, 
            cd = 16, 
            desc = "Leap towards an opponent and land with a burst of Haki.", 
            InstantCast = true
        }, 
        ["Laughing Counter"] = {
            stamreq = 30, 
            statreq = {
                SwordMastery = 50
            }, 
            cd = 20, 
            desc = "Taunt your enemies with a hearty laugh, and punish them greatly if they strike you.", 
            IsCounter = true
        }, 
        Overflow = {
            stamreq = 35, 
            statreq = {
                SwordMastery = 75
            }, 
            cd = 14, 
            desc = "Imbue haki into the blade, and deliver a devastating strike."
        }, 
        ["Divine Departure"] = {
            stamreq = 45, 
            statreq = {
                SwordMastery = 100
            }, 
            cd = 18, 
            desc = "Coat the blade in a supreme tier of Haki, before launching a slash that flies through the air."
        }
    }, 
    {
        ["Buddha Transformation"] = {
            transformation = true, 
            stamreq = 20, 
            statreq = {
                DevilFruitMastery = 15
            }, 
            cd = 0.25, 
            desc = "Transform your body into a golden substance, gaining Damage Reduction."
        }, 
        ["Palm Strike"] = {
            stamreq = 45, 
            statreq = {
                DevilFruitMastery = 25
            }, 
            cd = 12, 
            desc = "Strike forward and release a shockwave of pressure."
        }, 
        ["Heavenly Shockwave"] = {
            stamreq = 45, 
            statreq = {
                DevilFruitMastery = 35
            }, 
            cd = 10, 
            desc = "Release a Palm Strike infused with divine energy."
        }, 
        ["Judgement Impact"] = {
            stamreq = 50, 
            statreq = {
                DevilFruitMastery = 50
            }, 
            cd = 15, 
            desc = "Leap into the air and fall down to crush any beneath you."
        }, 
        ["Heaven-sent Impact Leap"] = {
            stamreq = 20, 
            statreq = {
                DevilFruitMastery = 60
            }, 
            cd = 20, 
            desc = "Leap towards a targetted area, and release a wave of divine energy on impact."
        }, 
        ["Heaven-sent Impact"] = {
            statreq = {
                DevilFruitMastery = 85
            }, 
            stamreq = 100, 
            cd = 18, 
            desc = "As an amplified version of its predecessor, this technique strikes faster than the eye can see."
        }, 
        Enlightenment = {
            statreq = {
                DevilFruitMastery = 85
            }, 
            stamreq = 75, 
            cd = 28, 
            desc = "Surround your allies in divine energy, giving them temporary buffs."
        }, 
        ["Spine Breaker"] = {
            statreq = {
                DevilFruitMastery = 85
            }, 
            stamreq = 35, 
            cd = 12, 
            desc = "Bear hug an opponent before suplex slamming them into the ground."
        }, 
        ["Heaven Fall"] = {
            statreq = {
                DevilFruitMastery = 85
            }, 
            stamreq = 55, 
            cd = 24, 
            desc = "Grab onto an opponent and crush them in your palm before slamming them into the ground."
        }, 
        ["Divine Retribution"] = {
            statreq = {
                DevilFruitMastery = 85
            }, 
            ULT = true, 
            stamreq = 125, 
            cd = 89, 
            desc = "Charge an ultimate divine blast that releases a devastating explosion."
        }
    }, 
    {
        ["Pitchfork Impale"] = {
            stamreq = 25, 
            statreq = {
                SwordMastery = 35
            }, 
            cd = 13, 
            desc = "Impale an opponent, raise them overhead, and slam them into the ground."
        }, 
        ["Pitchfork Dance"] = {
            stamreq = 35, 
            statreq = {
                SwordMastery = 45
            }, 
            cd = 20, 
            desc = "Unleash a dance of slashes in front of you."
        }
    }, 
    {
        ["Right Gun"] = {
            stamreq = 35, 
            statreq = {
                GunMastery = 35
            }, 
            cd = 17, 
            desc = "Unleash a powerful ranged burst of energy from your Right Gun."
        }, 
        ["Soul Wolves"] = {
            stamreq = 45, 
            statreq = {
                GunMastery = 45
            }, 
            cd = 13, 
            desc = "Summon Soul Wolves that hunt down and target nearby opponents."
        }, 
        ["Cero Metralleta"] = {
            transformation = true, 
            stamreq = 125, 
            statreq = {
                GunMastery = 125
            }, 
            cd = 75, 
            desc = "Fire a continous onslaught of blasts in a wide arc to completely overwhelm your foes."
        }
    }, 
    {
        ["Hollow Sweep"] = {
            stamreq = 25, 
            statreq = {
                SwordMastery = 35
            }, 
            cd = 15, 
            desc = "Raise the Halberd overheard and deliver sweeping slashes in a wide area."
        }, 
        ["Hollow Impale"] = {
            stamreq = 45, 
            statreq = {
                SwordMastery = 55
            }, 
            cd = 20, 
            desc = "Charge forward and Impale an enemy, traveling with them for a great distance, or into a wall."
        }
    }, 
    {
        ["Spirit Pierce"] = {
            stamreq = 35, 
            statreq = {
                SwordMastery = 25
            }, 
            cd = 17, 
            desc = "A two stage attack that involves a horizontal sweep and a vertical slash."
        }, 
        ["Ghost Barrage"] = {
            stamreq = 45, 
            statreq = {
                SwordMastery = 45
            }, 
            cd = 20, 
            desc = "Plunge the blade into the ground, and unleash a barrage of Spirits to swarm the enemy."
        }
    }, 
    {
        ["Whip Slam"] = {
            stamreq = 25, 
            statreq = {
                SwordMastery = 25
            }, 
            cd = 14, 
            desc = "Finesse with the whip allows you to grab onto an opponent and slam them into the ground."
        }, 
        ["Tempestuous Defence"] = {
            stamreq = 30, 
            statreq = {
                SwordMastery = 55
            }, 
            cd = 16, 
            desc = "Rapidly swing the Whip in order to create a barrier that allows for a simultaneous offense and defense."
        }
    }, 
    {
        ["Kessui Ignite"] = {
            stamreq = 35, 
            statreq = {
                SwordMastery = 25
            }, 
            cd = 40, 
            desc = "Ignite the Kessui in flames to enhance its attack potency."
        }, 
        ["Kessui Barrage"] = {
            stamreq = 25, 
            statreq = {
                SwordMastery = 45
            }, 
            cd = 14, 
            desc = "A swift barrage of stabs that finish with a sweeping slash."
        }
    }, 
    {
        ["Hellheim's Storm"] = {
            stamreq = 35, 
            statreq = {
                SwordMastery = 45
            }, 
            cd = 17, 
            desc = "Imbue the chilling daggers with piercing cold. Repeated strikes will freeze the opponent."
        }, 
        ["Flames Of Frost"] = {
            stamreq = 45, 
            statreq = {
                SwordMastery = 65
            }, 
            cd = 21, 
            desc = "Imbue the chilling daggers with piercing cold. Repeated strikes will freeze the opponent."
        }
    }, 
    {
        ["Firework Rocket"] = {
            stamreq = 35, 
            statreq = {
                GunMastery = 25
            }, 
            cd = 5, 
            desc = "Imbue the chilling daggers with piercing cold. Repeated strikes will freeze the opponent.", 
            InstantCast = true
        }, 
        ["Skyhigh Firework Rocket"] = {
            stamreq = 75, 
            statreq = {
                GunMastery = 45
            }, 
            cd = 19, 
            desc = "Imbue the chilling daggers with piercing cold. Repeated strikes will freeze the opponent.", 
            InstantCast = true
        }
    }, 
    {
        ["Frost Flash"] = {
            stamreq = 45, 
            statreq = {
                SwordMastery = 35
            }, 
            cd = 15, 
            desc = "Imbue the chilling daggers with piercing cold. Repeated strikes will freeze the opponent."
        }, 
        ["Frostfall Cascade"] = {
            stamreq = 35, 
            statreq = {
                SwordMastery = 55
            }, 
            cd = 19, 
            desc = "Imbue the chilling daggers with piercing cold. Repeated strikes will freeze the opponent."
        }
    }, 
    {
        ["Firework Parade"] = {
            stamreq = 35, 
            statreq = {
                SwordMastery = 35
            }, 
            cd = 18, 
            desc = "Deliver multiple slashes forward before sheathing the blade."
        }, 
        ["Dashing Pyrotechnics"] = {
            stamreq = 55, 
            statreq = {
                SwordMastery = 65
            }, 
            cd = 25, 
            desc = "Propel yourself forward and unleash a trail of bombs that explode."
        }
    }, 
    {
        ["Thunderous Roar"] = {
            moneyreq = 5000, 
            stamreq = 35, 
            statreq = {
                FightingStyleMastery = 50, 
                ["/SKILL/Moonlit Electro"] = 0
            }, 
            cd = 13, 
            desc = "Leap forward and bite, replenishing health and blood."
        }, 
        ["Thunderous Whirlwind"] = {
            InstantCast = true, 
            moneyreq = 5000, 
            stamreq = 55, 
            statreq = {
                FightingStyleMastery = 75, 
                ["/SKILL/Moonlit Electro"] = 0
            }, 
            cd = 15, 
            desc = "Leap forward and bite, replenishing health and blood."
        }, 
        ["Thunderous Tackle"] = {
            moneyreq = 5000, 
            stamreq = 35, 
            statreq = {
                FightingStyleMastery = 100, 
                ["/SKILL/Moonlit Electro"] = 0
            }, 
            cd = 16, 
            desc = "Leap forward and bite, replenishing health and blood."
        }, 
        ["Thunderous Drill"] = {
            InstantCast = true, 
            moneyreq = 5000, 
            stamreq = 65, 
            statreq = {
                FightingStyleMastery = 125, 
                ["/SKILL/Moonlit Electro"] = 0
            }, 
            cd = 25, 
            desc = "Leap forward and bite, replenishing health and blood."
        }, 
        ["Thunderous Bite"] = {
            moneyreq = 5000, 
            stamreq = 35, 
            statreq = {
                FightingStyleMastery = 145, 
                ["/SKILL/Moonlit Electro"] = 0
            }, 
            cd = 18, 
            desc = "Leap forward and bite, replenishing health and blood."
        }, 
        ["Thunderous Blitz"] = {
            moneyreq = 5000, 
            ULT = true, 
            stamreq = 75, 
            statreq = {
                FightingStyleMastery = 150, 
                ["/SKILL/Moonlit Electro"] = 0
            }, 
            cd = 100, 
            desc = "Leap forward and bite, replenishing health and blood."
        }, 
        SulongDash = {
            stamreq = 10, 
            statreq = {
                DevilFruitMastery = 0
            }, 
            cd = 0.5, 
            desc = "Passive: Dash replaced with teleport."
        }
    }, 
    {
        ["Flower Aroma"] = {
            stamreq = 55, 
            statreq = {
                SwordMastery = 35
            }, 
            cd = 15, 
            desc = "Propel yourself forward and unleash a trail of bombs that explode."
        }, 
        ["Absolute Seduction"] = {
            stamreq = 35, 
            statreq = {
                SwordMastery = 65
            }, 
            cd = 25, 
            desc = "Deliver multiple slashes forward before sheathing the blade."
        }
    }, 
    {
        ["Demon Brick Fist"] = {
            moneyreq = 0, 
            stamreq = 45, 
            statreq = {
                FightingStyleMastery = 45, 
                ["/SKILL/Abyssal Karate"] = 1
            }, 
            cd = 13, 
            desc = "Deliver a crushing blow with drenched fists."
        }, 
        ["Splitting Sea Fist"] = {
            moneyreq = 0, 
            stamreq = 25, 
            statreq = {
                FightingStyleMastery = 65, 
                ["/SKILL/Abyssal Karate"] = 1
            }, 
            cd = 15, 
            desc = "Deliver a crushing blow with drenched fists."
        }, 
        ["Diving Tides"] = {
            moneyreq = 0, 
            stamreq = 25, 
            statreq = {
                FightingStyleMastery = 75, 
                ["/SKILL/Abyssal Karate"] = 1
            }, 
            cd = 19, 
            desc = "Deliver a crushing blow with drenched fists.", 
            InstantCast = true
        }, 
        ["Surging Bermuda"] = {
            moneyreq = 0, 
            stamreq = 25, 
            statreq = {
                FightingStyleMastery = 90, 
                ["/SKILL/Abyssal Karate"] = 1
            }, 
            cd = 12, 
            desc = "Deliver a crushing blow with drenched fists.", 
            InstantCast = true
        }, 
        ["Feeding Frenzy"] = {
            moneyreq = 0, 
            stamreq = 25, 
            statreq = {
                FightingStyleMastery = 100, 
                ["/SKILL/Abyssal Karate"] = 1
            }, 
            cd = 17, 
            desc = "Deliver a crushing blow with drenched fists."
        }, 
        ["Leviathan Plunge"] = {
            moneyreq = 0, 
            ULT = true, 
            stamreq = 25, 
            statreq = {
                FightingStyleMastery = 130, 
                ["/SKILL/Abyssal Karate"] = 1
            }, 
            cd = 90, 
            desc = "Deliver a crushing blow with drenched fists.", 
            InstantCast = true
        }, 
        ["Abyssal Awakening"] = {
            transformation = true, 
            moneyreq = 0, 
            stamreq = 25, 
            statreq = {
                FightingStyleMastery = 150, 
                ["/SKILL/Abyssal Karate"] = 1
            }, 
            cd = 1, 
            desc = "Deliver a crushing blow with drenched fists."
        }
    }, 
    {
        ["Shigan Barrage"] = {
            moneyreq = 0, 
            stamreq = 25, 
            statreq = {
                FightingStyleMastery = 45
            }, 
            cd = 15, 
            desc = "Deliver a crushing blow with drenched fists."
        }, 
        ["Absolute Tekkai"] = {
            moneyreq = 0, 
            stamreq = 45, 
            statreq = {
                FightingStyleMastery = 65
            }, 
            cd = 20, 
            desc = "Deliver a crushing blow with drenched fists."
        }, 
        ["Instant Soru"] = {
            moneyreq = 0, 
            stamreq = 45, 
            statreq = {
                FightingStyleMastery = 100
            }, 
            cd = 18, 
            desc = "Deliver a crushing blow with drenched fists.", 
            InstantCast = true
        }, 
        ["True Rankakyu"] = {
            moneyreq = 0, 
            stamreq = 45, 
            statreq = {
                FightingStyleMastery = 125
            }, 
            cd = 18, 
            desc = "Deliver a crushing blow with drenched fists."
        }, 
        ["Counter Kick"] = {
            moneyreq = 0, 
            stamreq = 45, 
            statreq = {
                FightingStyleMastery = 145
            }, 
            cd = 20, 
            desc = "Deliver a crushing blow with drenched fists.", 
            IsCounter = true
        }, 
        ["True Rokuogan"] = {
            ULT = true, 
            moneyreq = 0, 
            stamreq = 45, 
            statreq = {
                FightingStyleMastery = 150
            }, 
            cd = 120, 
            desc = "Deliver a crushing blow with drenched fists."
        }, 
        KamishikiSoru = {
            hyperArmor = true, 
            moneyreq = 0, 
            stamreq = 15, 
            statreq = {
                FightingStyleMastery = 45
            }, 
            cd = 0.5, 
            desc = "Deliver a crushing blow with drenched fists."
        }, 
        KamishikiGeppo = {
            percentStamina = v3.percentStamina, 
            baseStamina = v3.baseStamina, 
            moneyreq = 1750, 
            statreq = {
                FightingStyleMastery = 20, 
                ["/SKILL/Rokushiki"] = 4
            }, 
            stamreq = 0, 
            cd = 0.2, 
            desc = "The Geppo allows the users to actually jump off the air itself, allowing them to stay in the air for much longer than usual"
        }
    }, 
    {
        ["Thousand Slices"] = {
            stamreq = 45, 
            statreq = {
                SwordMastery = 75
            }, 
            cd = 16, 
            desc = "Propel yourself forward and unleash a trail of bombs that explode."
        }, 
        ["Nightfall Counter"] = {
            stamreq = 35, 
            statreq = {
                SwordMastery = 95
            }, 
            cd = 13, 
            desc = "Propel yourself forward and unleash a trail of bombs that explode.", 
            IsCounter = true
        }, 
        ["Nightfall Rush"] = {
            stamreq = 45, 
            statreq = {
                SwordMastery = 100
            }, 
            cd = 20, 
            desc = "Propel yourself forward and unleash a trail of bombs that explode."
        }, 
        ["World's Strongest Slash"] = {
            stamreq = 75, 
            statreq = {
                SwordMastery = 150
            }, 
            cd = 30, 
            desc = "Propel yourself forward and unleash a trail of bombs that explode."
        }
    }, 
    {
        ["Sonic Screech"] = {
            stamreq = 35, 
            statreq = {
                DevilFruitMastery = 25
            }, 
            cd = 18, 
            desc = "scream"
        }, 
        ["Vermillion Bow"] = {
            stamreq = 45, 
            statreq = {
                DevilFruitMastery = 45
            }, 
            cd = 12, 
            desc = "bow"
        }, 
        ["Winged Flight"] = {
            stamreq = 0, 
            statreq = {
                DevilFruitMastery = 55
            }, 
            cd = 15, 
            desc = "fly"
        }, 
        ["Pteranodon Transform"] = {
            transformation = true, 
            stamreq = 0, 
            statreq = {
                DevilFruitMastery = 75
            }, 
            cd = 1, 
            desc = "transform"
        }, 
        ["Skyborne Slam"] = {
            stamreq = 35, 
            statreq = {
                DevilFruitMastery = 85
            }, 
            cd = 17, 
            desc = "grab"
        }, 
        ["Flame Form"] = {
            stamreq = 50, 
            statreq = {
                DevilFruitMastery = 100
            }, 
            cd = 30, 
            desc = "form"
        }, 
        ["Relentless Strikes"] = {
            ULT = true, 
            stamreq = 75, 
            statreq = {
                DevilFruitMastery = 125
            }, 
            cd = 25, 
            desc = "strikes"
        }, 
        ["Barrel Roll"] = {
            stamreq = 20, 
            statreq = {
                DevilFruitMastery = 0
            }, 
            cd = 9, 
            desc = "roll"
        }, 
        ["Pteranodon Carry"] = {
            stamreq = 20, 
            statreq = {
                DevilFruitMastery = 125
            }, 
            cd = 1, 
            desc = "roll"
        }, 
        ["Imperial Storm"] = {
            stamreq = 55, 
            statreq = {
                DevilFruitMastery = 135
            }, 
            cd = 25, 
            desc = "storm"
        }, 
        ["Imperial Dive Bomb"] = {
            ULT = true, 
            stamreq = 75, 
            statreq = {
                DevilFruitMastery = 175
            }, 
            cd = 125, 
            desc = "dive"
        }
    }, 
    {
        ["Massacre Counter"] = {
            stamreq = 25, 
            statreq = {
                SwordMastery = 25
            }, 
            cd = 13, 
            desc = "Propel yourself forward and unleash a trail of bombs that explode.", 
            IsCounter = true
        }, 
        ["Chain Reel"] = {
            stamreq = 45, 
            statreq = {
                SwordMastery = 65
            }, 
            cd = 16, 
            desc = "Propel yourself forward and unleash a trail of bombs that explode."
        }
    }, 
    {
        ["Starlight Rapier: Blitzstrike"] = {
            stamreq = 35, 
            statreq = {
                DevilFruitMastery = 50
            }, 
            cd = 15, 
            desc = "Discharge a burst of light that explodes on impact."
        }, 
        ["Radiant Kick"] = {
            stamreq = 45, 
            statreq = {
                DevilFruitMastery = 75
            }, 
            cd = 13, 
            desc = "Discharge a burst of light that explodes on impact."
        }, 
        ["Radiant Ray"] = {
            stamreq = 65, 
            statreq = {
                DevilFruitMastery = 85
            }, 
            cd = 18, 
            desc = "Discharge a burst of light that explodes on impact."
        }, 
        ["Radiant Flight"] = {
            stamreq = 15, 
            statreq = {
                DevilFruitMastery = 90
            }, 
            cd = 15, 
            desc = "Discharge a burst of light that explodes on impact."
        }, 
        ["Radiant Jewels"] = {
            stamreq = 75, 
            statreq = {
                DevilFruitMastery = 120
            }, 
            cd = 30, 
            desc = "Discharge a burst of light that explodes on impact."
        }, 
        ["Starlight Rapier: Excalibur"] = {
            stamreq = 100, 
            statreq = {
                DevilFruitMastery = 150
            }, 
            ULT = true, 
            cd = 70, 
            desc = "Discharge a burst of light that explodes on impact."
        }, 
        PikaDashV2 = {
            stamreq = 10, 
            statreq = {
                DevilFruitMastery = 0
            }, 
            cd = 0.5, 
            desc = "Passive: Dash replaced with teleport."
        }
    }, 
    {
        ["Golden Fist"] = {
            stamreq = 35, 
            statreq = {
                DevilFruitMastery = 25
            }, 
            cd = 10, 
            desc = "Discharge a burst of light that explodes on impact."
        }, 
        ["Golden Touch"] = {
            stamreq = 45, 
            statreq = {
                DevilFruitMastery = 50
            }, 
            cd = 15, 
            desc = "Discharge a burst of light that explodes on impact."
        }, 
        ["Golden Path"] = {
            stamreq = 45, 
            statreq = {
                DevilFruitMastery = 75
            }, 
            cd = 25, 
            desc = "Discharge a burst of light that explodes on impact."
        }, 
        ["Golden Field"] = {
            stamreq = 50, 
            statreq = {
                DevilFruitMastery = 90
            }, 
            cd = 15, 
            desc = "Discharge a burst of light that explodes on impact."
        }, 
        ["Golden Judgement"] = {
            stamreq = 55, 
            statreq = {
                DevilFruitMastery = 100
            }, 
            cd = 23, 
            desc = "Discharge a burst of light that explodes on impact."
        }, 
        ["Golden Age"] = {
            stamreq = 100, 
            statreq = {
                DevilFruitMastery = 125
            }, 
            cd = 120, 
            desc = "Discharge a burst of light that explodes on impact.", 
            ULT = true
        }
    }, 
    {
        ["Sunken Depths"] = {
            stamreq = 25, 
            statreq = {
                Strength = 25
            }, 
            cd = 13, 
            desc = "Propel yourself forward and unleash a trail of bombs that explode."
        }, 
        ["Sunken Hook"] = {
            stamreq = 45, 
            statreq = {
                Strength = 65
            }, 
            cd = 16, 
            desc = "Propel yourself forward and unleash a trail of bombs that explode."
        }
    }, 
    {
        ["Oversized Iron Ball"] = {
            stamreq = 25, 
            statreq = {
                FightingStyleMastery = 45
            }, 
            cd = 14, 
            desc = "Propel yourself forward and unleash a trail of bombs that explode."
        }, 
        ["Meteor Fist Shower"] = {
            stamreq = 45, 
            statreq = {
                FightingStyleMastery = 65
            }, 
            cd = 17, 
            desc = "Propel yourself forward and unleash a trail of bombs that explode."
        }, 
        ["Fusillade Fist"] = {
            stamreq = 35, 
            statreq = {
                FightingStyleMastery = 75
            }, 
            cd = 16, 
            desc = "Propel yourself forward and unleash a trail of bombs that explode."
        }, 
        ["Fist Of Love"] = {
            stamreq = 45, 
            statreq = {
                FightingStyleMastery = 125
            }, 
            cd = 20, 
            desc = "Propel yourself forward and unleash a trail of bombs that explode."
        }, 
        ["Galaxy Impact"] = {
            stamreq = 200, 
            statreq = {
                FightingStyleMastery = 300
            }, 
            cd = 120, 
            desc = "Propel yourself forward and unleash a trail of bombs that explode.", 
            ULT = true
        }
    }, 
    {
        ["White Barrage"] = {
            stamreq = 30, 
            statreq = {
                DevilFruitMastery = 25
            }, 
            cd = 15, 
            desc = "Discharge a burst of light that explodes on impact."
        }, 
        ["White Out"] = {
            stamreq = 45, 
            statreq = {
                DevilFruitMastery = 40
            }, 
            cd = 25, 
            desc = "Discharge a burst of light that explodes on impact."
        }, 
        ["White Rocket"] = {
            stamreq = 35, 
            statreq = {
                DevilFruitMastery = 75
            }, 
            cd = 15, 
            desc = "Discharge a burst of light that explodes on impact."
        }, 
        ["White Snake"] = {
            stamreq = 45, 
            statreq = {
                DevilFruitMastery = 90
            }, 
            cd = 20, 
            desc = "Discharge a burst of light that explodes on impact."
        }, 
        ["White Fog"] = {
            stamreq = 85, 
            statreq = {
                DevilFruitMastery = 125
            }, 
            cd = 75, 
            desc = "Discharge a burst of light that explodes on impact.", 
            ULT = true
        }
    }, 
    {
        ["Jitte Strike"] = {
            stamreq = 25, 
            statreq = {
                Strength = 45
            }, 
            cd = 13, 
            desc = "Propel yourself forward and unleash a trail of bombs that explode."
        }, 
        ["Jitte Leap"] = {
            stamreq = 45, 
            statreq = {
                Strength = 65
            }, 
            cd = 16, 
            desc = "Propel yourself forward and unleash a trail of bombs that explode."
        }
    }, 
    {
        ["Reaping Strike"] = {
            stamreq = 25, 
            statreq = {
                SwordMastery = 25
            }, 
            cd = 13, 
            desc = "Propel yourself forward and unleash a trail of bombs that explode."
        }, 
        ["Reaping Grasp"] = {
            stamreq = 45, 
            statreq = {
                SwordMastery = 65
            }, 
            cd = 16, 
            desc = "Propel yourself forward and unleash a trail of bombs that explode."
        }
    }, 
    {
        ["Victory Maul"] = {
            stamreq = 25, 
            statreq = {
                SwordMastery = 25
            }, 
            cd = 13, 
            desc = "Propel yourself forward and unleash a trail of bombs that explode."
        }
    }, 
    {
        ["1080 Pound Phoenix"] = {
            stamreq = 25, 
            statreq = {
                SwordMastery = 25
            }, 
            isFS = true, 
            cd = 13, 
            desc = "Propel yourself forward and unleash a trail of bombs that explode."
        }, 
        Onigiri = {
            stamreq = 35, 
            statreq = {
                SwordMastery = 45
            }, 
            isFS = true, 
            cd = 13, 
            desc = "Propel yourself forward and unleash a trail of bombs that explode."
        }, 
        ["Dragon Twister"] = {
            stamreq = 25, 
            statreq = {
                SwordMastery = 55
            }, 
            isFS = true, 
            cd = 15, 
            desc = "Propel yourself forward and unleash a trail of bombs that explode."
        }, 
        ["Tiger Hunt"] = {
            stamreq = 35, 
            statreq = {
                SwordMastery = 75
            }, 
            isFS = true, 
            cd = 13, 
            desc = "Propel yourself forward and unleash a trail of bombs that explode."
        }, 
        ["Crossing Six Paths"] = {
            stamreq = 45, 
            statreq = {
                SwordMastery = 85
            }, 
            isFS = true, 
            cd = 20, 
            desc = "Propel yourself forward and unleash a trail of bombs that explode."
        }, 
        ["Billion-Fold World"] = {
            stamreq = 100, 
            ULT = true, 
            statreq = {
                SwordMastery = 150
            }, 
            isFS = true, 
            cd = 90, 
            desc = "Propel yourself forward and unleash a trail of bombs that explode."
        }, 
        ["Sword Style Swap"] = {
            stamreq = 0, 
            statreq = {
                FightingStyle = "3SS", 
                SwordMastery = 250
            }, 
            isFS = true, 
            cd = 0.3, 
            desc = "Propel yourself forward and unleash a trail of bombs that explode."
        }
    }, 
    {
        ["Mochi Blitz Barrage"] = {
            stamreq = 25, 
            statreq = {
                DevilFruitMastery = 30
            }, 
            cd = 16, 
            desc = "Transform into a mochi doughnut to bulldoze your victims."
        }, 
        ["Burning Power Mochi"] = {
            stamreq = 45, 
            statreq = {
                DevilFruitMastery = 65
            }, 
            cd = 20, 
            desc = "Project a gigantic mochi fist clad in haki."
        }, 
        ["Zigzag Power Pummel"] = {
            stamreq = 45, 
            statreq = {
                DevilFruitMastery = 75
            }, 
            cd = 22, 
            desc = "Project a gigantic mochi fist clad in haki.", 
            Grounded = true
        }, 
        ["Spiked Donut Roll"] = {
            stamreq = 35, 
            statreq = {
                DevilFruitMastery = 85
            }, 
            cd = 18, 
            desc = "Transform into a mochi doughnut to bulldoze your victims."
        }, 
        ["Burning Chestnut Mochi"] = {
            stamreq = 25, 
            statreq = {
                DevilFruitMastery = 95
            }, 
            cd = 30, 
            desc = "Transform into a mochi doughnut to bulldoze your victims."
        }, 
        ["Burning Mochi Rocket"] = {
            stamreq = 50, 
            statreq = {
                DevilFruitMastery = 125
            }, 
            cd = 25, 
            desc = "Transform into a mochi doughnut to bulldoze your victims."
        }, 
        ["Supreme Mochi Buzzcut"] = {
            stamreq = 100, 
            statreq = {
                DevilFruitMastery = 150
            }, 
            ULT = true, 
            cd = 125, 
            desc = "Transform into a mochi doughnut to bulldoze your victims.", 
            hyperArmor = true
        }
    }, 
    {
        IceGunbladePull = {
            stamreq = 25, 
            statreq = {
                GunMastery = 25
            }, 
            cd = 13, 
            desc = "Propel yourself forward and unleash a trail of bombs that explode."
        }, 
        ["Frost Bullets"] = {
            stamreq = 25, 
            statreq = {
                GunMastery = 25
            }, 
            cd = 12, 
            desc = "Propel yourself forward and unleash a trail of bombs that explode."
        }, 
        ["Frost Blast"] = {
            stamreq = 45, 
            statreq = {
                GunMastery = 55
            }, 
            cd = 20, 
            desc = "Propel yourself forward and unleash a trail of bombs that explode."
        }
    }, 
    {
        ["Scepter Snowball"] = {
            stamreq = 25, 
            statreq = {
                SwordMastery = 25
            }, 
            cd = 2, 
            desc = "Propel yourself forward and unleash a trail of bombs that explode."
        }, 
        ["Scepter Storm"] = {
            stamreq = 25, 
            statreq = {
                SwordMastery = 25
            }, 
            cd = 17, 
            desc = "Propel yourself forward and unleash a trail of bombs that explode."
        }
    }, 
    {
        ["Diamond Dash"] = {
            stamreq = 25, 
            statreq = {
                DevilFruitMastery = 35
            }, 
            cd = 15, 
            desc = ""
        }, 
        ["Diamond Kick"] = {
            stamreq = 35, 
            statreq = {
                DevilFruitMastery = 45
            }, 
            cd = 10, 
            desc = ""
        }, 
        ["Rock Toss"] = {
            stamreq = 25, 
            statreq = {
                DevilFruitMastery = 55
            }, 
            cd = 12, 
            desc = "", 
            Grounded = true
        }, 
        ["Diamond Defense"] = {
            stamreq = 0, 
            statreq = {
                DevilFruitMastery = 75
            }, 
            cd = 10, 
            desc = ""
        }, 
        ["Prismatic Lift"] = {
            stamreq = 125, 
            statreq = {
                DevilFruitMastery = 100
            }, 
            cd = 85, 
            desc = "", 
            Grounded = true, 
            ULT = true
        }
    }, 
    {
        ["Cupid's Rain"] = {
            stamreq = 25, 
            statreq = {
                GunMastery = 25
            }, 
            cd = 14, 
            desc = "Propel yourself forward and unleash a trail of bombs that explode.", 
            Grounded = true
        }, 
        ["Cupid Burst"] = {
            stamreq = 45, 
            statreq = {
                GunMastery = 55
            }, 
            cd = 17, 
            desc = "Propel yourself forward and unleash a trail of bombs that explode."
        }
    }, 
    {
        ["Rapid Fire"] = {
            stamreq = 0, 
            statreq = {
                GunMastery = 0
            }, 
            cd = 5, 
            desc = "Propel yourself forward and unleash a trail of bombs that explode.", 
            hideMobile = true
        }, 
        ["Monkey Chompers"] = {
            stamreq = 35, 
            statreq = {
                GunMastery = 55
            }, 
            cd = 17, 
            desc = "Propel yourself forward and unleash a trail of bombs that explode."
        }, 
        ["SUPER MEGA DEATH ROCKET!"] = {
            stamreq = 75, 
            statreq = {
                GunMastery = 100
            }, 
            cd = 40, 
            desc = "Fire an ultra-accurate, explosive projectile that scales with charge. The resulting blast is nigh unstoppable."
        }
    }, 
    {
        ["Eggsplosive Rift"] = {
            stamreq = 25, 
            statreq = {
                Strength = 25
            }, 
            cd = 14, 
            desc = "Propel yourself forward and unleash a trail of bombs that explode.", 
            Grounded = true
        }, 
        Eggsweeper = {
            stamreq = 45, 
            statreq = {
                Strength = 55
            }, 
            cd = 17, 
            desc = "Propel yourself forward and unleash a trail of bombs that explode."
        }
    }, 
    {
        ["Aquatic Lunge"] = {
            hyperArmor = true, 
            stamreq = 45, 
            statreq = {
                SwordMastery = 45
            }, 
            cd = 15, 
            desc = "Propel yourself forward and unleash a trail of bombs that explode."
        }, 
        ["Call of the Deep"] = {
            stamreq = 55, 
            statreq = {
                SwordMastery = 75
            }, 
            cd = 20, 
            desc = "Propel yourself forward and unleash a trail of bombs that explode."
        }
    }, 
    {
        ["Hellfire Ring"] = {
            stamreq = 15, 
            statreq = {
                DevilFruitMastery = 25
            }, 
            cd = 12, 
            desc = ""
        }, 
        ["Draconic Warcry"] = {
            stamreq = 30, 
            statreq = {
                DevilFruitMastery = 30
            }, 
            cd = 18, 
            desc = ""
        }, 
        ["Draconic Ascension"] = {
            stamreq = 0, 
            statreq = {
                DevilFruitMastery = 55
            }, 
            cd = 3, 
            desc = "", 
            transformation = true
        }, 
        ["Thunderclad Veil"] = {
            stamreq = 35, 
            statreq = {
                DevilFruitMastery = 65
            }, 
            cd = 20, 
            desc = ""
        }, 
        ["Draconic Cataclysm"] = {
            stamreq = 55, 
            statreq = {
                DevilFruitMastery = 80
            }, 
            cd = 17, 
            desc = ""
        }, 
        ["Draconic Tail Slam"] = {
            stamreq = 25, 
            statreq = {
                DevilFruitMastery = 70
            }, 
            cd = 16, 
            desc = ""
        }, 
        ["Draconic Thunderfall"] = {
            stamreq = 30, 
            statreq = {
                DevilFruitMastery = 75
            }, 
            cd = 20, 
            desc = ""
        }, 
        ["Thunderclaw Rush"] = {
            stamreq = 60, 
            statreq = {
                DevilFruitMastery = 85
            }, 
            cd = 18, 
            desc = ""
        }, 
        ["Hellfire Ray"] = {
            stamreq = 80, 
            statreq = {
                DevilFruitMastery = 95
            }, 
            cd = 30, 
            desc = ""
        }, 
        ["Draconic Breath"] = {
            stamreq = 25, 
            statreq = {
                DevilFruitMastery = 100
            }, 
            cd = 8, 
            desc = "", 
            hideMobile = true
        }, 
        ["Hellfire Mode"] = {
            stamreq = 40, 
            statreq = {
                DevilFruitMastery = 100
            }, 
            cd = 40, 
            desc = ""
        }, 
        ["Draconic Thundercry"] = {
            stamreq = 45, 
            statreq = {
                DevilFruitMastery = 110
            }, 
            cd = 26, 
            desc = ""
        }, 
        ["Draconic Cyclone"] = {
            stamreq = 60, 
            statreq = {
                DevilFruitMastery = 125
            }, 
            cd = 22, 
            desc = ""
        }, 
        ["Draconic Tempest Spiral"] = {
            stamreq = 60, 
            statreq = {
                DevilFruitMastery = 135
            }, 
            cd = 25, 
            desc = ""
        }, 
        ["Hellfire Blast Breath"] = {
            stamreq = 100, 
            statreq = {
                DevilFruitMastery = 155
            }, 
            cd = 90, 
            desc = ""
        }
    }, 
    {
        ["Soul Swap"] = {
            stamreq = 0, 
            statreq = {
                DevilFruitMastery = 0
            }, 
            cd = 0.1, 
            desc = ""
        }, 
        ["Thunder Drop"] = {
            stamreq = 0, 
            statreq = {
                DevilFruitMastery = 35
            }, 
            cd = 10, 
            desc = ""
        }, 
        ["Storm Circuit"] = {
            stamreq = 0, 
            statreq = {
                DevilFruitMastery = 55
            }, 
            cd = 0.2, 
            percentStamina = 0.03, 
            baseStamina = 5, 
            customCDInfo = {
                FullCooldown = 15, 
                FunctionCheck = function(v4, v5) --[[ Line: 965 ]] --[[ Name: FunctionCheck ]]
                    -- upvalues: v1 (copy)
                    local l_v5_Attribute_0 = v5:GetAttribute("StormCircuitCount");
                    if not l_v5_Attribute_0 then
                        return true;
                    elseif l_v5_Attribute_0 >= 5 then
                        if v4 and v1 == true then
                            return false;
                        else
                            return false;
                        end;
                    else
                        return;
                    end;
                end
            }, 
            desc = ""
        }, 
        ["Nimbus Ride"] = {
            stamreq = 15, 
            statreq = {
                DevilFruitMastery = 65
            }, 
            cd = 20, 
            desc = ""
        }, 
        ["Storm Chaser"] = {
            stamreq = 35, 
            statreq = {
                DevilFruitMastery = 75
            }, 
            cd = 20, 
            desc = ""
        }, 
        ["Raijin Plunge"] = {
            stamreq = 45, 
            statreq = {
                DevilFruitMastery = 85
            }, 
            cd = 18, 
            desc = ""
        }, 
        ["Zigzag Bolt"] = {
            stamreq = 35, 
            statreq = {
                DevilFruitMastery = 95
            }, 
            cd = 20, 
            desc = ""
        }, 
        ["Divine Thunderfall"] = {
            stamreq = 75, 
            statreq = {
                DevilFruitMastery = 150
            }, 
            cd = 75, 
            desc = ""
        }, 
        ["Bon-Bon Fireball"] = {
            stamreq = 15, 
            statreq = {
                DevilFruitMastery = 35
            }, 
            cd = 3, 
            desc = ""
        }, 
        ["Bon-Bon Bomb"] = {
            stamreq = 35, 
            statreq = {
                DevilFruitMastery = 55
            }, 
            cd = 12, 
            desc = ""
        }, 
        ["Prominence Ray"] = {
            stamreq = 55, 
            statreq = {
                DevilFruitMastery = 75
            }, 
            cd = 20, 
            desc = ""
        }, 
        ["Prominence Punch"] = {
            stamreq = 45, 
            statreq = {
                DevilFruitMastery = 85
            }, 
            cd = 20, 
            desc = ""
        }, 
        ["Bon-Bon Torch"] = {
            stamreq = 55, 
            statreq = {
                DevilFruitMastery = 100
            }, 
            cd = 25, 
            desc = ""
        }, 
        ["Sunfall Cataclysm"] = {
            stamreq = 75, 
            statreq = {
                DevilFruitMastery = 150
            }, 
            cd = 90, 
            desc = "", 
            hyperArmor = true
        }, 
        ["Lick, the Lollipop"] = {
            stamreq = 0, 
            statreq = {
                DevilFruitMastery = 25
            }, 
            cd = 2, 
            desc = ""
        }, 
        ["Crumbleshot, the Cake"] = {
            stamreq = 0, 
            statreq = {
                DevilFruitMastery = 35
            }, 
            cd = 2, 
            desc = ""
        }, 
        ["Gloomroot, the Tree"] = {
            stamreq = 0, 
            statreq = {
                DevilFruitMastery = 55
            }, 
            cd = 2, 
            desc = ""
        }, 
        ["Soul Rage"] = {
            stamreq = 0, 
            statreq = {
                DevilFruitMastery = 85
            }, 
            cd = 1, 
            desc = "", 
            transformation = true
        }, 
        ["Soul Summoning"] = {
            stamreq = 0, 
            statreq = {
                DevilFruitMastery = 25
            }, 
            cd = 0.1, 
            desc = ""
        }
    }, 
    {
        ["Umbrella Float"] = {
            stamreq = 25, 
            statreq = {
                SwordMastery = 25
            }, 
            cd = 15, 
            desc = "Propel yourself forward and unleash a trail of bombs that explode."
        }, 
        ["Umbrella Thrust"] = {
            stamreq = 25, 
            statreq = {
                SwordMastery = 55
            }, 
            cd = 13, 
            desc = "Propel yourself forward and unleash a trail of bombs that explode."
        }
    }, 
    {
        ["THE TROXX2"] = {
            stamreq = 0, 
            statreq = {
                SwordMastery = 35
            }, 
            cd = 20, 
            desc = "Release 3 energy slashes"
        }, 
        ["Soul Eater2"] = {
            stamreq = 0, 
            statreq = {
                SwordMastery = 75
            }, 
            cd = 30, 
            desc = "Impale a target and drain their life, healing yourself for a portion."
        }
    }, 
    {
        ["Wringing Vortex"] = {
            stamreq = 30, 
            statreq = {
                SwordMastery = 45
            }, 
            cd = 13, 
            desc = ""
        }, 
        ["Wringing Rupture"] = {
            stamreq = 50, 
            statreq = {
                SwordMastery = 75
            }, 
            cd = 16, 
            desc = ""
        }
    }, 
    {
        ["Maser Ray"] = {
            stamreq = 25, 
            statreq = {
                SwordMastery = 35
            }, 
            cd = 14, 
            desc = ""
        }, 
        Hahaba = {
            stamreq = 35, 
            statreq = {
                SwordMastery = 75
            }, 
            cd = 16, 
            desc = ""
        }, 
        ["Hakai Slash"] = {
            stamreq = 50, 
            statreq = {
                SwordMastery = 100, 
                DF = "Soul-Soul"
            }, 
            cd = 17, 
            desc = ""
        }, 
        ["Blaze Eruption"] = {
            stamreq = 55, 
            statreq = {
                SwordMastery = 125, 
                DF = "Soul-Soul"
            }, 
            cd = 25, 
            desc = "", 
            Grounded = true
        }
    }, 
    {
        ["Mochi Trident Drill"] = {
            stamreq = 35, 
            statreq = {
                SwordMastery = 35
            }, 
            cd = 13, 
            desc = ""
        }, 
        ["Mochi Trident Throw"] = {
            stamreq = 55, 
            statreq = {
                SwordMastery = 65
            }, 
            cd = 19, 
            desc = ""
        }
    }, 
    {
        ["Pretzel Stabs"] = {
            stamreq = 30, 
            statreq = {
                SwordMastery = 45
            }, 
            cd = 13, 
            desc = ""
        }, 
        ["Pretzel Blitz Strikes"] = {
            stamreq = 50, 
            statreq = {
                SwordMastery = 75
            }, 
            cd = 16, 
            desc = ""
        }
    }
};
v0.Skills = v7;
v0.Get = function(v8) --[[ Line: 1061 ]] --[[ Name: Get ]]
    -- upvalues: v7 (copy)
    if v8 == "Black Leg" then
        return v7[1];
    elseif v8 == "Rokushiki" then
        return v7[2];
    elseif v8 == "Ice" then
        return v7[5];
    elseif v8 == "Gomu" then
        return v7[6];
    elseif v8 == "Buddha" then
        return v7[7];
    elseif v8 == "1SS" then
        return v7[8];
    else
        return;
    end;
end;
v0.GetM = function(v9) --[[ Line: 1077 ]] --[[ Name: GetM ]]
    -- upvalues: v7 (copy)
    for v10 = 1, #v7 do
        for v11, v12 in v7[v10] do
            if v11 == v9 then
                return v12;
            end;
        end;
    end;
end;
repeat
    game["Run Service"].Heartbeat:Wait();
until game.ReplicatedStorage.reservedCode.Value ~= "checking";
local _ = table.clone(v7);
for v14 = 1, #v7 do
    for _, v16 in v7[v14] do
        if v16.NormalCD == nil then
            v16.NormalCD = v16.cd;
        else
            warn("already has a normal cd!@");
        end;
    end;
end;
if game.GameId == 2097989947 then
    for v17 = 1, #v7 do
        for _, v19 in v7[v17] do
            v19.cd = 0.1;
        end;
    end;
end;
local function v23(v20) --[[ Line: 1118 ]] --[[ Name: updateClients ]]
    local l_Players_0 = game.Players:GetPlayers();
    for v22 = 1, #l_Players_0 do
        task.spawn(function() --[[ Line: 1121 ]]
            -- upvalues: l_Players_0 (copy), v22 (copy), v20 (copy)
            script.getCDs:InvokeClient(l_Players_0[v22], v20);
        end);
    end;
end;
script.normalSkillMult.Changed:Connect(function() --[[ Line: 1127 ]]
    -- upvalues: v1 (copy), v7 (copy), v23 (copy)
    if not v1 then
        return;
    else
        warn("updating cooldowns normal");
        local v24 = {};
        for v25 = 1, #v7 do
            for v26, v27 in v7[v25] do
                if v27.ULT == nil and v27.NormalCD ~= nil then
                    local v28 = v27.NormalCD * script.normalSkillMult.Value;
                    v27.cd = v28;
                    v24[#v24 + 1] = {
                        v25, 
                        v26, 
                        v28
                    };
                end;
            end;
        end;
        v23(v24);
        return;
    end;
end);
script.ultSkillMult.Changed:Connect(function() --[[ Line: 1149 ]]
    -- upvalues: v1 (copy), v7 (copy), v23 (copy)
    if not v1 then
        return;
    else
        warn("updating cooldowns ult");
        local v29 = {};
        for v30 = 1, #v7 do
            for v31, v32 in v7[v30] do
                if v32.ULT ~= nil and v32.cd ~= nil and v32.NormalCD ~= nil then
                    local v33 = v32.NormalCD * script.ultSkillMult.Value;
                    v32.cd = v33;
                    v29[#v29 + 1] = {
                        v30, 
                        v31, 
                        v33
                    };
                end;
            end;
        end;
        v23(v29);
        return;
    end;
end);
v0.arenaCDs = function(_) --[[ Line: 1171 ]] --[[ Name: arenaCDs ]]
    script.normalSkillMult.Value = 1.5;
    script.ultSkillMult.Value = 3;
end;
v0.normalCDs = function(_) --[[ Line: 1176 ]] --[[ Name: normalCDs ]]
    script.normalSkillMult.Value = 1;
    script.ultSkillMult.Value = 1;
end;
v0.noCDs = function(_) --[[ Line: 1181 ]] --[[ Name: noCDs ]]
    script.normalSkillMult.Value = 1.0E-4;
    script.ultSkillMult.Value = 1.0E-4;
end;
if v1 and game.ReplicatedStorage.reservedCode.Value == "arena" and _G.conquest == nil and _G.ImpelDown == nil then
    v0:arenaCDs();
end;
if v1 then
    script.getCDs.OnServerInvoke = function() --[[ Line: 1191 ]]
        -- upvalues: v7 (copy)
        local v37 = {};
        for v38 = 1, #v7 do
            v37[v38] = {};
            for v39, v40 in v7[v38] do
                v37[v38][v39] = {
                    cd = v40.cd, 
                    NormalCD = v40.NormalCD, 
                    ULT = v40.ULT
                };
            end;
        end;
        return v37;
    end;
    return v0;
else
    local v41 = script.getCDs:InvokeServer();
    for v42 = 1, #v7 do
        for v43, v44 in v7[v42] do
            if v41[v42] and v41[v42][v43] then
                v44.cd = v41[v42][v43].cd;
            end;
        end;
    end;
    script.getCDs.OnClientInvoke = function(v45) --[[ Line: 1211 ]]
        -- upvalues: v7 (copy)
        for _, v47 in v45 do
            local v48 = v47[1];
            local v49 = v47[2];
            local v50 = v47[3];
            if v7[v48] and v7[v48][v49] then
                v7[v48][v49].cd = v50;
            end;
        end;
        warn("client updating cds");
    end;
    return v0;
end;