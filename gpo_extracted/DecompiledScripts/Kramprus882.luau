local l_Value_0 = script:WaitForChild("Character").Value;
if not l_Value_0 then
    script:Destroy();
    return;
else
    local l_workspace_0 = workspace;
    local v2 = l_Value_0:WaitForChild("Humanoid", 5);
    if v2:IsA("Humanoid") == false then
        script:Destroy();
        return;
    elseif not v2 or v2.Health <= 0 then
        script:Destroy();
        return;
    else
        local v3 = v2:WaitForChild("Animator", 3) or v2;
        if v2.Parent and v2:IsDescendantOf(l_workspace_0) and v3.Parent and v3:IsDescendantOf(l_workspace_0) then
            v3:LoadAnimation(script.idle):Play();
            if l_Value_0:FindFirstChild("Overhead") == nil then
                local v4 = script.Overhead:Clone();
                v4.Adornee = l_Value_0.Head;
                v4.Health.Frame.Script.char.Value = l_Value_0;
                v4.Parent = game.Players.LocalPlayer.PlayerGui.HealthBars;
                v4.Health.Frame.Script.Disabled = false;
            end;
            local v5 = 1;
            while true do
                task.wait(math.random(5, 10));
                _G.PlaySound(l_Value_0.Head, script["H" .. v5]).Parent = l_Value_0.Head;
                v5 = v5 + 1;
                if v5 > 3 then
                    v5 = 1;
                end;
            end;
        end;
        return;
    end;
end;