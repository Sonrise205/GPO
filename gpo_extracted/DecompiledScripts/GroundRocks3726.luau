local v0 = {};
local v1 = RaycastParams.new();
v1.FilterType = Enum.RaycastFilterType.Whitelist;
v1.FilterDescendantsInstances = {
    workspace.Islands, 
    workspace.Env, 
    workspace.Ships
};
crater = function(v2, v3, v4) --[[ Line: 6 ]] --[[ Name: crater ]]
    local v5 = {};
    for v6 = 1, 14 do
        local v7 = v6 / 14 * 360;
        local v8 = script.Rock1:Clone();
        v8:PivotTo(v2 * CFrame.new(0, -2, 0) * CFrame.Angles(0, math.rad(v7), 0) * CFrame.new(0, 0, -v4) * CFrame.Angles(-0.3490658503988659, 0, 0) * CFrame.Angles(math.rad((math.random(-15, 15))), math.rad((math.random(-15, 15))), (math.rad((math.random(-15, 15))))));
        table.insert(v5, v8);
        v8.Parent = workspace.Effects;
    end;
    for v9 = 1, 15 do
        local v10 = v9 / 15 * 360;
        local v11 = script.Rock2:Clone();
        v11:PivotTo(v2 * CFrame.new(0, -1.5, 0) * CFrame.Angles(0, math.rad(v10), 0) * CFrame.new(0, 0, -v3) * CFrame.Angles(0.3490658503988659, 0, 0) * CFrame.Angles(math.rad((math.random(-15, 15))), math.rad((math.random(-15, 15))), (math.rad((math.random(-15, 15))))));
        table.insert(v5, v11);
        v11.Parent = workspace.Effects;
    end;
    return v5;
end;
v0.start = function(_, v13, v14, v15, v16) --[[ Line: 28 ]] --[[ Name: start ]]
    -- upvalues: v1 (copy)
    local v17 = crater(v13, v14, v15);
    for v18, v19 in v17 do
        local v20 = workspace:Raycast(v19.PrimaryPart.Position + Vector3.new(0, 6, 0, 0), Vector3.new(0, -8, 0, 0), v1);
        if not v20 then
            v19:Destroy();
            v17[v18] = nil;
        else
            _G.matchMaterial(v19.Top, v20.Instance);
            v19:PivotTo(v19.PrimaryPart.CFrame * CFrame.new(0, -4, 0));
            local v21 = 0.05 + math.random(0, 50) / 1000;
            if v19.Name == "Rock1" then
                v21 = v21 + 0.06666666666666667;
            end;
            _G.tween(v19.PrimaryPart, {
                v21, 
                "Quad", 
                Enum.EasingDirection.Out
            }, {
                CFrame = v19.PrimaryPart.CFrame * CFrame.new(0, 4, 0)
            });
        end;
    end;
    task.delay(v16, function() --[[ Line: 47 ]]
        -- upvalues: v17 (copy)
        for _, v23 in v17 do
            _G.tween(v23.PrimaryPart, {
                0.5 + math.random(0, 200) / 1000, 
                "Quint", 
                Enum.EasingDirection.In
            }, {
                CFrame = v23.PrimaryPart.CFrame * CFrame.new(0, -6, 0)
            });
            _G.destroy(v23, 0.6);
        end;
    end);
end;
return v0;