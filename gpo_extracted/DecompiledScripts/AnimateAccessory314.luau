local l_Parent_0 = script.Parent.Parent;
local l_HumanoidRootPart_0 = l_Parent_0:WaitForChild("HumanoidRootPart");
local _ = game.ReplicatedStorage:FindFirstChild("Stats" .. l_Parent_0.Name);
local v3 = script.Parent:WaitForChild("AnimationController"):LoadAnimation(script:WaitForChild("whiteCape"));
v3:Play();
game["Run Service"].Stepped:connect(function() --[[ Line: 8 ]]
    -- upvalues: l_HumanoidRootPart_0 (copy), v3 (copy)
    if l_HumanoidRootPart_0 then
        local l_Magnitude_0 = l_HumanoidRootPart_0.AssemblyLinearVelocity.Magnitude;
        v3:AdjustSpeed((math.clamp(l_Magnitude_0 / 6, 1, 10)));
    end;
end);