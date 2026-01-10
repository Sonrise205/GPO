task.spawn(function() --[[ Line: 1 ]]
    if script.Parent:IsDescendantOf(workspace) then
        script.Parent:WaitForChild("AnimationController"):LoadAnimation(script:WaitForChild("Animation")):Play();
    end;
end);