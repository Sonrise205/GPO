local v0 = {};
local function _(v1) --[[ Line: 3 ]] --[[ Name: getIsland ]]
    local v2 = nil;
    local l_Children_0 = workspace.Islands:GetChildren();
    for v4 = 1, #l_Children_0 do
        if v1:IsDescendantOf(l_Children_0[v4]) then
            return l_Children_0[v4];
        end;
    end;
    return v2;
end;
v0.check = function(_) --[[ Line: 14 ]] --[[ Name: check ]]
    local l_LocalPlayer_0 = game.Players.LocalPlayer;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local _ = game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
    local v10 = Ray.new(l_Character_0.HumanoidRootPart.Position, l_Character_0.HumanoidRootPart.CFrame.upVector * -1000);
    local _ = _G.raycastWhitelist(v10, {
        workspace.Islands
    });
end;
return v0;