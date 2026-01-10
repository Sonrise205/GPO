if not script.Parent:WaitForChild("Grey.007", 5) then
    return;
else
    script.Parent:WaitForChild("AnimationController"):LoadAnimation(script:WaitForChild("Animation")):Play();
    return;
end;