local v0 = {};
local v1 = nil;
v0.start = function(_, _, v4) --[[ Line: 4 ]] --[[ Name: start ]]
    -- upvalues: v1 (ref)
    local v5 = workspace.NPCs:WaitForChild("Santa", 600);
    v5:WaitForChild("Humanoid");
    v1 = v5.Humanoid:LoadAnimation(script.happy);
    warn("playing santas aniamtion");
    if v4 == true then
        v1:Play();
        return;
    else
        v1:Stop();
        return;
    end;
end;
return v0;