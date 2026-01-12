local _ = {};
return function(v1, v2, v3, v4) --[[ Line: 2 ]]
    local _ = nil;
    local _ = nil;
    local _ = nil;
    local l_Blacklist_0 = Enum.RaycastFilterType.Blacklist;
    if v4 ~= "Ignore" then
        l_Blacklist_0 = Enum.RaycastFilterType.Whitelist;
    end;
    local v9 = RaycastParams.new();
    v9.FilterType = l_Blacklist_0;
    v9.FilterDescendantsInstances = v3;
    v9.IgnoreWater = true;
    local v10 = workspace:Raycast(v1, v2, v9);
    if v10 then
        return v10.Instance, v10.Position, v10.Normal;
    else
        return nil, v2 + v1, (Vector3.new(0, 1, 0, 0));
    end;
end;