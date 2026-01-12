local v0 = script.Character.Value:WaitForChild("Humanoid", 5);
if not v0 then
    script:Destroy();
    return;
else
    local v1 = v0:LoadAnimation(script.walk);
    local v2 = v0:LoadAnimation(script.idle);
    if not v2.IsPlaying then
        v2:Play();
    end;
    v0.Running:Connect(function(v3) --[[ Line: 14 ]]
        -- upvalues: v1 (copy), v2 (copy)
        if v3 > 0.5 then
            if not v1.IsPlaying then
                v1:Play();
            end;
            if v2.IsPlaying then
                v2:Stop();
                return;
            end;
        else
            if v1.IsPlaying then
                v1:Stop();
            end;
            if not v2.IsPlaying then
                v2:Play();
            end;
        end;
    end);
    return;
end;