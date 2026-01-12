local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = require(l_ReplicatedStorage_0.Modules.ToolDesc);
local l_MaxPeli_0 = require(l_ReplicatedStorage_0.Modules.Leveling).MaxPeli;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Parent_0 = script.Parent;
local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. l_Parent_0.Parent.Name);
if not l_FirstChild_0 then
    return;
else
    local v7 = Random.new();
    local l_RootPart_0 = l_Parent_0:WaitForChild("RootPart");
    local l_Value_0 = l_FirstChild_0.Customization.Height.Value;
    local _ = l_Value_0 / 10;
    local l_Bone_0 = l_RootPart_0:WaitForChild("Bone");
    GetOffset = function(v12) --[[ Line: 20 ]] --[[ Name: GetOffset ]]
        if v12 <= 10 then
            return -0.273;
        else
            return -0.273 * ((v12 - 10) * 0.05);
        end;
    end;
    if l_Bone_0 then
        l_Bone_0.Position = Vector3.new(0, -GetOffset(l_Value_0), 0);
    end;
    local v13 = {
        LowHealth = {
            "{PLAYER}, you're looking mighty rough!", 
            "Time to find a doctor, {PLAYER}!", 
            "Your health is running low!", 
            "Better grab some grub, {PLAYER}!", 
            "Take cover, {PLAYER}!", 
            "We need some bandages!", 
            "Heal up before it's too late!", 
            "You're in bad shape, matey!", 
            "This isn't looking good, {PLAYER}!", 
            "Time to retreat and recover!", 
            "Get to safety, {PLAYER}!", 
            "You need medical attention!", 
            "Don't push yourself too hard!", 
            "Rest up, {PLAYER}!", 
            "Your wounds need tending!", 
            "Time to fall back and regroup!"
        }, 
        Combat = {
            "Show them what you've got, {PLAYER}!", 
            "Let's finish this fight!", 
            "Keep your guard up!", 
            "Don't let them get the upper hand!", 
            "You've got this, {PLAYER}!", 
            "Time to turn the tide!", 
            "Watch your back, {PLAYER}!", 
            "Stay focused on the fight!", 
            "Give them everything you've got!", 
            "Victory is within reach!", 
            "Keep the pressure on!", 
            "They're on the ropes now!", 
            "Finish them off, {PLAYER}!", 
            "Show no mercy!", 
            "Fight with all your might!", 
            "We're in this together, {PLAYER}!", 
            "You're doing great, keep it up!", 
            "They don't stand a chance!", 
            "Let's take them down!", 
            "Press the attack, {PLAYER}!"
        }, 
        Idle = {
            General = {
                "Fine day for sailing, {PLAYER}!", 
                "What's the plan, {PLAYER}?", 
                "Adventure is calling our names!", 
                "I'm quite the pretty bird!", 
                "Ready for action, {PLAYER}!", 
                "Where are we headed next, matey?", 
                "The wind is in our favor!", 
                "Another day, another adventure!", 
                "Keep your eyes on the horizon!", 
                "Life on the seas is the best!", 
                "Smooth sailing ahead, {PLAYER}!", 
                "The ocean is beautiful today!", 
                "What a lovely view from up here!", 
                "I love being a bird, {PLAYER}!", 
                "The sun feels nice today!", 
                "Feeling good today, {PLAYER}!", 
                "Ready for whatever comes next!", 
                "The world is full of possibilities!", 
                "Can't wait to see what happens!", 
                "This is the life, {PLAYER}!", 
                "Every day is an adventure with you!", 
                "Where to next, {PLAYER}?", 
                "I'm ready when you are!", 
                "Let's make today count!", 
                "The seas are ours to explore!"
            }, 
            RichPlayer = {
                "Look at all that Peli, {PLAYER}!", 
                "We're swimming in treasure!", 
                "You're quite wealthy, {PLAYER}!", 
                "All that Peli is impressive!", 
                "Rich as can be, {PLAYER}!", 
                "We've got more than enough Peli!", 
                "You're doing well for yourself!", 
                "That's a fortune you've got there!", 
                "Living the good life, {PLAYER}!", 
                "Money isn't a problem for us!", 
                "We're set for life, {PLAYER}!"
            }, 
            PoorPlayer = {
                "Our pockets are looking empty, {PLAYER}!", 
                "Time to earn some Peli!", 
                "We could use more treasure!", 
                "Barely a berry to our name!", 
                "Let's go make some money, {PLAYER}!", 
                "The coffers are running dry!", 
                "We need to find some work!", 
                "Time to take on some quests!", 
                "A little Peli would help right now!", 
                "We're running on fumes, {PLAYER}!", 
                "Better start saving up!", 
                "Every bit of Peli counts!"
            }, 
            ModeratePeli = {
                "Decent amount of Peli we've got!", 
                "Not bad, but we could always use more!", 
                "Our funds are looking alright!", 
                "We're doing okay, {PLAYER}!", 
                "Comfortable amount of Peli!", 
                "We're neither rich nor poor!", 
                "Could be worse, could be better!", 
                "A respectable amount, {PLAYER}!", 
                "We're managing just fine!", 
                "Enough to get by comfortably!"
            }, 
            FishingRod = {
                "Time to catch some fish!", 
                "Let's see what's biting today!", 
                "Hope we catch a big one, {PLAYER}!", 
                "Fishing time, {PLAYER}!", 
                "What will we reel in today?", 
                "The fish are calling!", 
                "Perfect weather for fishing!", 
                "I wonder what's under the water!", 
                "Maybe we'll catch something rare!", 
                "Patience is key with fishing!", 
                "The water looks promising today!", 
                "Let's fill our nets, {PLAYER}!", 
                "Hope the fish are hungry today!"
            }, 
            Katana = {
                "That's a fine blade, {PLAYER}!", 
                "Ready to slice through anything!", 
                "Sharp as can be!", 
                "Time to show them your skills!", 
                "Looking sharp today, {PLAYER}!", 
                "Swift and deadly, just like you!", 
                "That blade looks fearsome!", 
                "A warrior's weapon!", 
                "Perfect for close combat!", 
                "Your swordsmanship is impressive!", 
                "That edge looks razor sharp!", 
                "A blade fit for a master!"
            }, 
            Weapon = {
                "Armed and ready, {PLAYER}!", 
                "Time to put that weapon to use!", 
                "Looking dangerous today!", 
                "Ready for battle, {PLAYER}!", 
                "That's a mighty fine weapon!", 
                "Let's show them what we've got!", 
                "You're well equipped!", 
                "That'll strike fear in them!", 
                "A formidable choice, {PLAYER}!", 
                "Ready to defend ourselves!", 
                "That weapon suits you well!", 
                "Prepared for anything!"
            }, 
            TradeHub = {
                "Time to make some deals, {PLAYER}!", 
                "Let's see what's for trade today!", 
                "Maybe we'll find a good bargain!", 
                "Trading time, {PLAYER}!", 
                "What treasures can we trade for?", 
                "Let's see what they're offering!", 
                "The market is open for business!", 
                "Time to browse the wares!", 
                "Perhaps we'll find something useful!", 
                "Let's see if anyone has what we need!", 
                "Good place to do business!", 
                "Wonder what deals are available today!", 
                "Dont get scammed, {PLAYER}!"
            }
        }
    };
    local v14 = {};
    local v15 = nil;
    GetRandomVoiceline = function(v16) --[[ Line: 213 ]] --[[ Name: GetRandomVoiceline ]]
        -- upvalues: v14 (copy), v15 (ref), v7 (copy)
        if not v16 or #v16 == 0 then
            return nil;
        else
            if not v14[v16] then
                v14[v16] = {};
            end;
            local v17 = {};
            for _, v19 in ipairs(v16) do
                if not table.find(v14[v16], v19) and v19 ~= v15 then
                    table.insert(v17, v19);
                end;
            end;
            if #v17 == 0 then
                v14[v16] = {};
                for _, v21 in ipairs(v16) do
                    if v21 ~= v15 then
                        table.insert(v17, v21);
                    end;
                end;
                if #v17 == 0 then
                    v17 = v16;
                end;
            end;
            local v22 = v17[v7:NextInteger(1, #v17)];
            table.insert(v14[v16], v22);
            v15 = v22;
            return v22;
        end;
    end;
    GetIdleVoiceline = function() --[[ Line: 249 ]] --[[ Name: GetIdleVoiceline ]]
        -- upvalues: l_LocalPlayer_0 (copy), v13 (copy), l_ReplicatedStorage_0 (copy), v7 (copy), v2 (copy), l_FirstChild_0 (copy), l_MaxPeli_0 (copy)
        local l_Character_0 = l_LocalPlayer_0.Character;
        if not l_Character_0 then
            return GetRandomVoiceline(v13.Idle.General);
        elseif l_ReplicatedStorage_0:FindFirstChild("tradingHUB") and v7:NextInteger(1, 100) <= 50 then
            return GetRandomVoiceline(v13.Idle.TradeHub);
        else
            local l_Tool_0 = l_Character_0:FindFirstChildOfClass("Tool");
            if l_Tool_0 and v2[l_Tool_0.Name] then
                local l_Type_0 = v2[l_Tool_0.Name].Type;
                if v7:NextInteger(1, 100) <= 60 then
                    if l_Type_0 == "Fishing Rod" and v13.Idle.FishingRod then
                        return GetRandomVoiceline(v13.Idle.FishingRod);
                    elseif l_Type_0 == "Katana" and v13.Idle.Katana then
                        return GetRandomVoiceline(v13.Idle.Katana);
                    end;
                end;
            end;
            local v26 = l_FirstChild_0.Stats.Peli.Value / l_MaxPeli_0 * 100;
            local v27 = v7:NextInteger(1, 100);
            if v26 >= 75 and v27 <= 40 then
                return GetRandomVoiceline(v13.Idle.RichPlayer);
            elseif v26 <= 10 and v27 <= 40 then
                return GetRandomVoiceline(v13.Idle.PoorPlayer);
            elseif v26 > 10 and v26 < 75 and v27 <= 30 then
                return GetRandomVoiceline(v13.Idle.ModeratePeli);
            else
                return GetRandomVoiceline(v13.Idle.General);
            end;
        end;
    end;
    local v28 = 0;
    PlayParrotVoiceline = function(v29) --[[ Line: 297 ]] --[[ Name: PlayParrotVoiceline ]]
        -- upvalues: l_LocalPlayer_0 (copy), l_Parent_0 (copy)
        local l_DisplayName_0 = l_LocalPlayer_0.DisplayName;
        local v31 = string.gsub(v29, "{PLAYER}", l_DisplayName_0);
        _G.PlayEffect("TTSMessage", nil, {
            CFrame = l_Parent_0.PrimaryPart.CFrame, 
            Text = v31, 
            VoiceId = 4, 
            Pitch = 4, 
            Speed = 1
        });
    end;
    local v32 = l_Parent_0:WaitForChild("Character", 3);
    local l_AnimationController_0 = l_Parent_0:WaitForChild("AnimationController");
    l_AnimationController_0:LoadAnimation(script.Idle):Play();
    local v34 = 0;
    if v32 and v32.Value == l_LocalPlayer_0.Character then
        local l_Humanoid_0 = l_LocalPlayer_0.Character:WaitForChild("Humanoid");
        task.spawn(function() --[[ Line: 321 ]]
            -- upvalues: v32 (copy), l_LocalPlayer_0 (copy), l_Parent_0 (copy), v28 (ref), l_Humanoid_0 (copy), v34 (ref), l_AnimationController_0 (copy), v13 (copy)
            while v32.Value == l_LocalPlayer_0.Character and l_Parent_0:IsDescendantOf(workspace) do
                local v36 = tick();
                if v36 - v28 >= 5 then
                    local l_Character_1 = l_LocalPlayer_0.Character;
                    local v38 = l_Humanoid_0.Health / l_Humanoid_0.MaxHealth * 100;
                    local v39 = l_Character_1 and l_Character_1:FindFirstChild("inCombat");
                    v34 = v34 + 1;
                    if v34 > 3 then
                        v34 = 1;
                    end;
                    l_AnimationController_0:LoadAnimation(script.Talks["Talk" .. v34]):Play();
                    if v38 <= 25 and v38 > 0 then
                        local v40 = GetRandomVoiceline(v13.LowHealth);
                        if v40 then
                            PlayParrotVoiceline(v40);
                            v28 = v36;
                        end;
                    elseif v39 then
                        local v41 = GetRandomVoiceline(v13.Combat);
                        if v41 then
                            PlayParrotVoiceline(v41);
                            v28 = v36;
                        end;
                    else
                        local v42 = GetIdleVoiceline();
                        if v42 then
                            PlayParrotVoiceline(v42);
                            v28 = v36;
                        end;
                    end;
                end;
                task.wait(15);
            end;
        end);
    end;
    return;
end;