local l_Parent_0 = script.Parent.Parent;
l_Parent_0:WaitForChild("HumanoidRootPart");
local v1 = script.Parent:WaitForChild("AnimationController"):LoadAnimation(script:WaitForChild("whiteCape"));
v1:Play();
local _ = script.Parent:WaitForChild("RootPart"):GetDescendants();
game["Run Service"].Stepped:connect(function() --[[ Line: 10 ]]
    -- upvalues: l_Parent_0 (copy), v1 (copy)
    if l_Parent_0.PrimaryPart then
        local l_Magnitude_0 = l_Parent_0.HumanoidRootPart.AssemblyLinearVelocity.Magnitude;
        v1:AdjustSpeed((math.clamp(l_Magnitude_0 / 6, 1, 10)));
    end;
end);