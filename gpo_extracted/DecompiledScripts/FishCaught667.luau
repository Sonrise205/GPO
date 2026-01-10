local v0 = {};
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("TweenService");
local _ = game:GetService("HttpService");
local l_Assets_0 = l_ReplicatedStorage_0.Fishing.Assets;
local _ = l_Assets_0.Rewards;
local l_Children_0 = l_Assets_0.SFX.Nibble:GetChildren();
local _ = function(v7, v8) --[[ Line: 14 ]] --[[ Name: SetTransparency ]]
    for _, v10 in v7:GetDescendants() do
        if v10:IsA("BasePart") and not v10:GetAttribute("CompletelyInvisible") then
            v10.Transparency = v8;
        end;
    end;
end;
v0.start = function(_, v13) --[[ Line: 23 ]] --[[ Name: start ]]
    -- upvalues: l_Children_0 (copy)
    local l_Hook_0 = v13.Hook;
    if not l_Hook_0 then
        return;
    else
        local _ = v13.Reward;
        local v16 = script.Splash:Clone();
        v16.Parent = workspace.Effects;
        while l_Hook_0.Parent and l_Hook_0:GetAttribute("Caught") do
            v16.Position = Vector3.new(0, 1, 0, 0) * _G.getWavePosition(l_Hook_0.Position) + l_Hook_0.Position * Vector3.new(1, 0, 1, 0);
            _G.customEmit(v16);
            _G.PlaySound(v16, l_Children_0[math.random(#l_Children_0)], {
                RandomPitch = true
            });
            task.wait(0.5);
        end;
        task.delay(3, v16.Destroy, v16);
        return;
    end;
end;
return v0;