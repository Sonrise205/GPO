local l_Parent_0 = script.Parent.Parent;
l_Parent_0:WaitForChild("HumanoidRootPart", 10);
local _ = game.ReplicatedStorage:FindFirstChild("Stats" .. l_Parent_0.Name);
local v2 = script.Parent:WaitForChild("AnimationController"):LoadAnimation(script:WaitForChild("whiteCape"));
v2:Play();
game["Run Service"].Stepped:connect(function() --[[ Line: 7 ]]
    -- upvalues: l_Parent_0 (copy), v2 (copy)
    local l_Magnitude_0 = l_Parent_0.HumanoidRootPart.AssemblyLinearVelocity.Magnitude;
    v2:AdjustSpeed((math.clamp(l_Magnitude_0 / 6, 1, 10)));
end);