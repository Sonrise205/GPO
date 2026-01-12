return {
    start = function(_, v1, v2, v3) --[[ Line: 4 ]] --[[ Name: start ]]
        if v1 == game.Players.LocalPlayer then
            return;
        elseif v2 == nil then
            return;
        elseif v2.PrimaryPart == nil then
            return;
        elseif _G.checkRenderDistance(v2.PrimaryPart.Position, 300) == false then
            return;
        elseif v3 == nil then
            _G.footstep(nil, nil, v2);
            return;
        else
            _G.footstep("land", nil, v2);
            return;
        end;
    end
};