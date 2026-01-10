local v0 = {};
local v1 = OverlapParams.new();
v1.FilterType = Enum.RaycastFilterType.Include;
v1.FilterDescendantsInstances = {
    workspace.Env, 
    workspace.Islands, 
    workspace.Ships
};
local v2 = OverlapParams.new();
v2.FilterType = Enum.RaycastFilterType.Include;
v2.FilterDescendantsInstances = {
    workspace.PlayerCharacters
};
v0.new = function(_, v4, v5) --[[ Line: 13 ]]
    local v6 = v4.Properties or {};
    local l_Part_0 = Instance.new("Part");
    l_Part_0.Size = Vector3.new(1, 1, 1, 0);
    l_Part_0.Transparency = 1;
    local v8 = true;
    local v9 = false;
    l_Part_0.Anchored = v8;
    l_Part_0.CanCollide = v9;
    l_Part_0.Massless = true;
    l_Part_0.CastShadow = false;
    for v10, v11 in next, v6 do
        l_Part_0[v10] = v11;
    end;
    if v5 then
        task.delay(v5, function() --[[ Line: 28 ]]
            -- upvalues: l_Part_0 (copy)
            l_Part_0:Destroy();
        end);
    end;
    return l_Part_0;
end;
v0.HitboxScan = function(_, v13, v14, v15) --[[ Line: 36 ]] --[[ Name: HitboxScan ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v16 = {};
    local l_ipairs_0 = ipairs;
    local l_workspace_0 = workspace;
    local l_v14_0 = v14;
    local v20 = v15 and v1 or v2;
    for _, v22 in l_ipairs_0(l_workspace_0:GetPartsInPart(l_v14_0, v20)) do
        local l_Parent_0 = v22.Parent;
        if (l_Parent_0:FindFirstChild("Humanoid") and not v22:IsDescendantOf(v13) or v15 and v22:IsDescendantOf(workspace.Env) or v22:IsDescendantOf(workspace.Islands)) and not table.find(v16, l_Parent_0) then
            table.insert(v16, l_Parent_0);
        end;
    end;
    return v16;
end;
v0.Destroy = function(_, v25) --[[ Line: 53 ]] --[[ Name: Destroy ]]
    v25:Destroy();
end;
return v0;