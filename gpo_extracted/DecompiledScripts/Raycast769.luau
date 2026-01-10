local v0 = {};
local v1 = {};
script:WaitForChild("AllActors");
script:WaitForChild("Actor");
for _ = 1, 64 do
    local v3 = script.Actor:Clone();
    v3.Parent = script.AllActors;
    table.insert(v1, require(v3.Caster));
end;
v0.cast = function(_, v5, v6, v7, v8) --[[ Line: 12 ]] --[[ Name: cast ]]
    -- upvalues: v1 (copy)
    if typeof(v5) ~= "Ray" then
        return v1[math.random(1, 64)](v5, v6, v7, v8);
    else
        local l_Origin_0 = v5.Origin;
        local l_Direction_0 = v5.Direction;
        return v1[math.random(1, 64)](l_Origin_0, l_Direction_0, v6, v7);
    end;
end;
_G.raycastWhitelist = function(v11, v12, v13) --[[ Line: 22 ]]
    local v14 = nil;
    v14 = if typeof(v11) == "Ray" then v11 else Ray.new(v11.Origin, v11.Direction);
    local v15 = RaycastParams.new();
    v15.FilterDescendantsInstances = v12;
    v15.FilterType = Enum.RaycastFilterType.Include;
    if v13 == true then
        v15.RespectCanCollide = true;
    end;
    local v16 = workspace:Raycast(v14.Origin, v14.Direction, v15);
    local v17 = nil;
    local v18 = nil;
    local v19 = nil;
    if v16 then
        v17 = v16.Instance;
        v18 = v16.Position;
        v19 = v16.Normal;
    end;
    if v19 == Vector3.new(0, 0, 0, 0) or v19 == nil then
        v19 = Vector3.new(0, 1, 0, 0);
    end;
    if v18 == nil then
        v18 = v14.Origin + v14.Direction;
    end;
    return v17, v18, v19;
end;
_G.raycastIgnoreList = function(v20, v21) --[[ Line: 49 ]]
    local v22 = nil;
    v22 = if typeof(v20) == "Ray" then v20 else Ray.new(v20.Origin, v20.Direction);
    local l_workspace_PartOnRayWithIgnoreList_0, v24, v25 = workspace:FindPartOnRayWithIgnoreList(v22, v21);
    return l_workspace_PartOnRayWithIgnoreList_0, v24, v25;
end;
return v0;