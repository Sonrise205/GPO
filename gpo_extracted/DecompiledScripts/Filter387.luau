local v0 = {};
local v1 = require(game.ReplicatedStorage.Modules.RotatedRegion3);
Distance = function(v2, v3) --[[ Line: 3 ]] --[[ Name: Distance ]]
    return (math.sqrt((v2.X - v3.X) * (v2.X - v3.X) + (v2.Z - v3.Z) * (v2.Z - v3.Z)));
end;
local function v10(v4, v5) --[[ Line: 6 ]] --[[ Name: check ]]
    -- upvalues: v1 (copy)
    local v6 = false;
    local l_FirstChild_0 = workspace.Effects.Rooms:FindFirstChild(v4.Name);
    if l_FirstChild_0 then
        local l_PartsInRegion3WithWhiteList_0 = v1.Ball(l_FirstChild_0.PrimaryPart.CFrame, l_FirstChild_0.PrimaryPart.Size):FindPartsInRegion3WithWhiteList({
            v5
        });
        for v9 = 1, #l_PartsInRegion3WithWhiteList_0 do
            if l_PartsInRegion3WithWhiteList_0[v9] == v5 then
                v6 = true;
            end;
        end;
        if Distance(v5.Position, l_FirstChild_0.PrimaryPart.Position) > l_FirstChild_0.PrimaryPart.Size.X then
            v6 = false;
        end;
    end;
    return v6;
end;
v0.isIn = function(_, v12, v13) --[[ Line: 24 ]] --[[ Name: isIn ]]
    -- upvalues: v10 (copy)
    local v14 = true;
    if workspace.Effects.Rooms:FindFirstChild(v12.Name) then
        if v10(v12, v13) == false then
            return false;
        end;
    else
        v14 = false;
    end;
    return v14;
end;
v0.filter = function(_, v16, v17, v18) --[[ Line: 37 ]] --[[ Name: filter ]]
    -- upvalues: v10 (copy), v1 (copy)
    if v17 == nil then
        return false;
    else
        local v19 = true;
        local l_FirstChild_1 = workspace.Effects.Rooms:FindFirstChild(v16.Name);
        if v17:IsDescendantOf(v16) then
            v19 = false;
        end;
        if v17:IsDescendantOf(workspace.PlayerCharacters) or v17:IsDescendantOf(workspace.NPCs) then
            v19 = false;
        end;
        if l_FirstChild_1 and v17:IsDescendantOf(l_FirstChild_1) then
            v19 = false;
        end;
        if l_FirstChild_1 == nil then
            v19 = false;
        end;
        if l_FirstChild_1 and v10(v16, v17) == false then
            v19 = false;
        end;
        if v17.Size.Magnitude >= 75 or v17.Size.Magnitude <= 2 then
            v19 = false;
        end;
        if v18 and l_FirstChild_1 and v19 == true then
            local l_Part_0 = Instance.new("Part");
            l_Part_0.CanCollide = false;
            l_Part_0.Anchored = true;
            l_Part_0.Transparency = 1;
            l_Part_0.Size = Vector3.new(0, 0, 0, 0);
            l_Part_0.CFrame = CFrame.new(v18);
            l_Part_0.Parent = workspace.Effects;
            local l_PartsInRegion3WithWhiteList_1 = v1.Ball(l_FirstChild_1.PrimaryPart.CFrame, l_FirstChild_1.PrimaryPart.Size):FindPartsInRegion3WithWhiteList({
                l_Part_0
            });
            local v23 = false;
            for v24 = 1, #l_PartsInRegion3WithWhiteList_1 do
                if l_PartsInRegion3WithWhiteList_1[v24] == l_Part_0 then
                    v23 = true;
                end;
            end;
            l_Part_0:Destroy();
            v19 = v23;
        end;
        if l_FirstChild_1 == nil then
            v19 = false;
        end;
        if v17.Transparency >= 1 then
            v19 = false;
        end;
        return v19;
    end;
end;
return v0;