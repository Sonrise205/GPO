return {
    start = function(_, v1, v2, v3) --[[ Line: 3 ]] --[[ Name: start ]]
        local v4 = tick();
        repeat
            v1:SetAttribute("previousEvasiveTick", tick());
            _G.soruDashing = true;
            v1:SetAttribute("evading", true);
            v1.Humanoid.WalkSpeed = v2;
            game["Run Service"].RenderStepped:Wait();
        until v3 <= tick() - v4;
        v1.Humanoid.WalkSpeed = 16;
        v1:SetAttribute("previousEvasiveTick", tick());
        _G.soruDashing = nil;
        v1:SetAttribute("evading", nil);
    end
};