local v0 = {};
v0.__index = v0;
v0.new = function(_, v2, v3, _) --[[ Line: 4 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v5 = {
        mount = v2, 
        maxSpeed = 75, 
        acceleration = 0.5, 
        Owner = v3
    };
    setmetatable(v5, v0);
    return v5;
end;
v0.Turn = function(v6, v7) --[[ Line: 15 ]] --[[ Name: Turn ]]
    local l_HumanoidRootPart_0 = v6.mount.HumanoidRootPart;
    l_HumanoidRootPart_0.CFrame = l_HumanoidRootPart_0.CFrame * CFrame.Angles(0, math.rad(v7), 0);
end;
v0.IncreaseSpeed = function(v9) --[[ Line: 20 ]] --[[ Name: IncreaseSpeed ]]
    local l_acceleration_0 = v9.acceleration;
    local l_Owner_0 = v9.Owner;
    local l_Humanoid_0 = v9.mount.Humanoid;
    l_Humanoid_0.WalkSpeed = math.clamp(l_Humanoid_0.WalkSpeed + l_acceleration_0, 0, v9.maxSpeed);
    coroutine.wrap(function() --[[ Line: 26 ]]
        -- upvalues: l_Owner_0 (copy), l_Humanoid_0 (copy), v9 (copy)
        while l_Owner_0.Character.Humanoid.MoveDirection ~= Vector3.new() and l_Humanoid_0.WalkSpeed > 0 do
            l_Humanoid_0:Move(v9.mount.HumanoidRootPart.CFrame.LookVector * 10);
            game["Run Service"].Heartbeat:Wait();
        end;
    end)();
end;
v0.DecreaseSpeed = function(v13) --[[ Line: 37 ]] --[[ Name: DecreaseSpeed ]]
    local v14 = v13.acceleration / 2;
    local l_Humanoid_1 = v13.mount.Humanoid;
    l_Humanoid_1.WalkSpeed = math.clamp(l_Humanoid_1.WalkSpeed - v14, 0, v13.maxSpeed);
end;
return v0;