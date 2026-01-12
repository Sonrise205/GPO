local v0 = {};
local v1 = {
    ["Hie-Hie"] = true, 
    ["Magu-Magu"] = true
};
v0.solans = function(_, v3) --[[ Line: 5 ]] --[[ Name: solans ]]
    -- upvalues: v1 (copy)
    local l_LocalPlayer_0 = game.Players.LocalPlayer;
    local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
    local l_Character_0 = game.Players.LocalPlayer.Character;
    local l_Value_0 = l_FirstChild_0.Stats.DF.Value;
    if v3 then
        l_Value_0 = v3;
    end;
    local l_l_Character_0_FirstChild_0 = l_Character_0:FindFirstChild(l_Value_0);
    if l_l_Character_0_FirstChild_0 == nil then
        l_l_Character_0_FirstChild_0 = l_LocalPlayer_0.Backpack:FindFirstChild(l_Value_0);
    end;
    local v9 = true;
    v9 = l_l_Character_0_FirstChild_0 and l_l_Character_0_FirstChild_0:FindFirstChild("Main") and true or false;
    if v1[l_Value_0] == nil then
        v9 = false;
    end;
    return v9;
end;
return v0;