local l_HumanoidRootPart_0 = script.Parent.Parent:WaitForChild("HumanoidRootPart");
local v1 = script.Parent:WaitForChild("AnimationController"):LoadAnimation(script:WaitForChild("whiteCape"));
v1:Play();
local _ = script.Parent:WaitForChild("RootPart"):GetDescendants();
game["Run Service"].Stepped:connect(function() --[[ Line: 11 ]]
    -- upvalues: l_HumanoidRootPart_0 (copy), v1 (copy)
    if l_HumanoidRootPart_0 then
        local l_Magnitude_0 = l_HumanoidRootPart_0.AssemblyLinearVelocity.Magnitude;
        v1:AdjustSpeed((math.clamp(l_Magnitude_0 / 6, 1, 10)));
    end;
end);