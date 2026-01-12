return {
    Raycast = function(v0) --[[ Line: 10 ]] --[[ Name: Raycast ]]
        local v1 = RaycastParams.new();
        v1.FilterDescendantsInstances = v0.FilterGroup or {
            workspace.Effects
        };
        v1.FilterType = v0.FilterType or Enum.RaycastFilterType.Exclude;
        return workspace:Raycast(v0.Position, v0.Direction, v1);
    end
};