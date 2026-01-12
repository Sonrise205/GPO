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
    script.Parent:WaitForChild("Meshes/PumpkinBossFace");
    local l_Head_0 = v0:WaitForChild("Head");
    local v2 = script.Parent:WaitForChild("Meshes/PumpkinBossFace");
    while v0.Parent ~= workspace.Effects do
        l_Head_0.Transparency = 0.99;
        l_Head_0.Eye.Transparency = 0.99;
        l_Head_0.Mouth.Transparency = 0.99;
        v2.Transparency = 1;
        task.wait(0.1);
    end;
    return;
end;