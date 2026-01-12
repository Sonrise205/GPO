local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("Players");
local _ = game:GetService("MarketplaceService");
local l_RunService_0 = game:GetService("RunService");
local v4 = require(game.ReplicatedStorage.Modules.Trove);
local v5 = {};
local v6 = {};
local v7 = {};
local l_Children_0 = l_ReplicatedStorage_0.Modules.Shared.AnimationPacks:GetChildren();
for v9 = 1, #l_Children_0 do
    local v10 = require(l_Children_0[v9]);
    for v11, v12 in pairs(v10) do
        v6[v11] = v12[1];
        v6[v11].Pack = l_Children_0[v9].Name;
    end;
end;
v5.GetAnimationData = function(_, v14) --[[ Line: 21 ]] --[[ Name: GetAnimationData ]]
    -- upvalues: v6 (copy)
    return v6[v14];
end;
v5.GetAnimationID = function(_, v16) --[[ Line: 25 ]] --[[ Name: GetAnimationID ]]
    -- upvalues: v6 (copy)
    return v6[v16].id;
end;
v5.PlayEmote = function(_, v18) --[[ Line: 29 ]] --[[ Name: PlayEmote ]]
    -- upvalues: v5 (copy), v7 (copy), v4 (copy), l_RunService_0 (copy)
    local l_LocalPlayer_0 = game.Players.LocalPlayer;
    local l_v5_AnimationID_0 = v5:GetAnimationID(v18);
    if l_v5_AnimationID_0 == nil then
        return;
    else
        if v7[l_LocalPlayer_0] then
            v7[l_LocalPlayer_0]:Destroy();
            v7[l_LocalPlayer_0] = nil;
        end;
        local l_Character_0 = game.Players.LocalPlayer.Character;
        local v22 = v4.new();
        local v23 = v22:Add(Instance.new("Animation"));
        v23.AnimationId = l_v5_AnimationID_0;
        v23.Parent = l_Character_0;
        local v24 = v22:Add(l_Character_0.Humanoid:LoadAnimation(v23));
        v24.Priority = Enum.AnimationPriority.Action4;
        v24:Play();
        v22:Add(function() --[[ Line: 54 ]]
            -- upvalues: v24 (copy)
            v24:Stop();
            v24:Destroy();
        end);
        v22:Connect(l_RunService_0.Heartbeat, function(_) --[[ Line: 59 ]]
            -- upvalues: l_Character_0 (copy), v22 (copy)
            if (l_Character_0.Humanoid.MoveDirection ~= Vector3.new() or _G.check:inspect(l_Character_0) == false or _G.canuse == false) and l_Character_0:FindFirstChild("matchWon") == nil then
                v22:Destroy();
            end;
        end);
        v22:AttachToInstance(l_Character_0);
        v7[l_LocalPlayer_0] = v22;
        return;
    end;
end;
return v5;