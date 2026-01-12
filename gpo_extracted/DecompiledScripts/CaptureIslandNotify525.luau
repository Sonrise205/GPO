local l_SFX_0 = script.SFX;
return {
    start = function(_, v2) --[[ Line: 5 ]] --[[ Name: start ]]
        -- upvalues: l_SFX_0 (copy)
        local l_FlagName_0 = v2.FlagName;
        local v4 = "";
        local v5 = nil;
        if v2.Type == "GainedPoint" then
            v4 = v2.Player .. " has captured " .. l_FlagName_0 .. " for your crew!";
            v5 = Color3.new(0.152941, 1, 0.109804);
            l_SFX_0.Captured:GetChildren()[math.random(#l_SFX_0.Captured:GetChildren())]:Play();
        elseif v2.Type == "LostPoint" then
            v4 = "Your crew has lost " .. l_FlagName_0;
            v5 = Color3.new(1, 0, 0);
            l_SFX_0.FlagLost:Play();
        elseif v2.Type == "Contesting" then
            v4 = l_FlagName_0 .. " is currently being contested";
            v5 = Color3.new(1, 0.576471, 0.14902);
            l_SFX_0.FlagContested:Play();
        end;
        _G.PlayEffect("ClientChatMessage", nil, "<font color='rgb(" .. math.ceil(v5.R * 255) .. "," .. math.ceil(v5.G * 255) .. "," .. math.ceil(v5.B * 255) .. ")'>" .. v4 .. "</font>");
    end
};