local v0 = {};
local l_LocalPlayer_0 = game.Players.LocalPlayer;
local l_ContentProvider_0 = game:GetService("ContentProvider");
task.spawn(function() --[[ Line: 5 ]]
    -- upvalues: l_ContentProvider_0 (copy)
    l_ContentProvider_0:PreloadAsync({
        script
    });
end);
v0.start = function(_, v4) --[[ Line: 10 ]] --[[ Name: start ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    local l_Character_0 = l_LocalPlayer_0.Character;
    local l_FirstChild_0 = script.SFX:FindFirstChild(v4);
    if l_FirstChild_0 then
        if v4 == "Compliments" and math.random(1, 100) <= 1 then
            _G.PlaySound(l_Character_0.PrimaryPart, script.SFX.burp).Parent = l_Character_0.PrimaryPart;
            return;
        else
            _G.PlaySound(l_Character_0.PrimaryPart, l_FirstChild_0, {
                RandomSound = true
            }).Parent = l_Character_0.PrimaryPart;
        end;
    end;
end;
return v0;