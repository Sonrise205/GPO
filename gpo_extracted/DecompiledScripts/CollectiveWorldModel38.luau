local v0 = {};
local v1 = nil;
local l_RunService_0 = game:GetService("RunService");
v0.setupWorldModel = function(_) --[[ Line: 5 ]] --[[ Name: setupWorldModel ]]
    -- upvalues: v1 (ref), l_RunService_0 (copy)
    if v1 then
        return v1;
    else
        local v4 = l_RunService_0:IsClient() and "ReplicatedStorage" or "ServerStorage";
        v1 = Instance.new("WorldModel");
        v1.Name = "ZonePlusWorldModel";
        v1.Parent = game:GetService(v4);
        return v1;
    end;
end;
v0._getCombinedResults = function(_, v6, ...) --[[ Line: 16 ]] --[[ Name: _getCombinedResults ]]
    -- upvalues: v1 (ref)
    local v7 = workspace[v6](workspace, ...);
    if v1 then
        local v8 = v1[v6](v1, ...);
        for _, v10 in pairs(v8) do
            table.insert(v7, v10);
        end;
    end;
    return v7;
end;
v0.GetPartBoundsInBox = function(v11, v12, v13, v14) --[[ Line: 27 ]] --[[ Name: GetPartBoundsInBox ]]
    return v11:_getCombinedResults("GetPartBoundsInBox", v12, v13, v14);
end;
v0.GetPartBoundsInRadius = function(v15, v16, v17, v18) --[[ Line: 31 ]] --[[ Name: GetPartBoundsInRadius ]]
    return v15:_getCombinedResults("GetPartBoundsInRadius", v16, v17, v18);
end;
v0.GetPartsInPart = function(v19, v20, v21) --[[ Line: 35 ]] --[[ Name: GetPartsInPart ]]
    return v19:_getCombinedResults("GetPartsInPart", v20, v21);
end;
return v0;