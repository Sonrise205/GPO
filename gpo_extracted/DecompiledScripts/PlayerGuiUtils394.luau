local l_Players_0 = game:GetService("Players");
return {
    getPlayerGui = function() --[[ Line: 9 ]] --[[ Name: getPlayerGui ]]
        -- upvalues: l_Players_0 (copy)
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        if not l_LocalPlayer_0 then
            error("No localPlayer");
        end;
        return l_LocalPlayer_0:FindFirstChildOfClass("PlayerGui") or error("No PlayerGui");
    end
};