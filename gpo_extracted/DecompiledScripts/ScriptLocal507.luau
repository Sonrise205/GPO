local v0 = script.Parent:WaitForChild("Character", 5);
if not v0 then
    return;
else
    v0 = v0.Value;
    if script.Parent.PrimaryPart == nil then
        repeat
            task.wait();
        until script.Parent.PrimaryPart ~= nil;
    end;
    local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. v0.Name);
    if l_FirstChild_0 then
        local l_Value_0 = l_FirstChild_0.Customization.BusoColor.Value;
        local l_PrimaryPart_0 = script.Parent.PrimaryPart;
        if l_PrimaryPart_0.Flames:GetAttribute("CustomTailoredColor") then
            l_Value_0 = l_PrimaryPart_0.Flames:GetAttribute("CustomTailoredColor");
        end;
        if typeof(l_Value_0) == "string" then
            l_Value_0 = Color3.fromHex(l_Value_0);
        end;
        local l_Descendants_0 = script.Parent:GetDescendants();
        for v5 = 1, #l_Descendants_0 do
            if l_Descendants_0[v5]:IsA("BasePart") or l_Descendants_0[v5]:IsA("PointLight") then
                l_Descendants_0[v5].Color = l_Value_0;
            elseif l_Descendants_0[v5]:IsA("ParticleEmitter") then
                l_Descendants_0[v5].Color = ColorSequence.new(l_Value_0);
            end;
        end;
    end;
    script.Parent:WaitForChild("Meshes/PumpkinBossFace");
    while v0.Parent ~= workspace.Effects do
        v0.Head.Transparency = 0.99;
        v0.Head.Eye.Transparency = 0.99;
        v0.Head.Mouth.Transparency = 0.99;
        script.Parent["Meshes/PumpkinBossFace"].Transparency = 1;
        task.wait(0.1);
    end;
    return;
end;