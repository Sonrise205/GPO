local v0 = require(game.ReplicatedStorage.Modules:WaitForChild("Trove", 3));
if not v0 then
    script:Destroy();
    return;
else
    local l_Parent_0 = script.Parent.Parent;
    local v2 = v0.new();
    local function v3() --[[ Line: 10 ]] --[[ Name: update ]]
        -- upvalues: l_Parent_0 (copy)
        if l_Parent_0.Transparency >= 0.99 then
            script.Parent.Transparency = 1;
            return;
        else
            script.Parent.Transparency = 0;
            return;
        end;
    end;
    if l_Parent_0.Transparency >= 0.99 then
        script.Parent.Transparency = 1;
    else
        script.Parent.Transparency = 0;
    end;
    v2:Connect(l_Parent_0:GetPropertyChangedSignal("Transparency"), v3);
    return;
end;