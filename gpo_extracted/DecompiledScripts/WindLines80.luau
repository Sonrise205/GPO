local l_RunService_0 = game:GetService("RunService");
local l_Terrain_0 = workspace:FindFirstChildOfClass("Terrain");
local v2 = {};
local v3 = {
    UpdateQueue = table.create(10)
};
v3.Init = function(_, v5) --[[ Line: 13 ]] --[[ Name: Init ]]
    -- upvalues: v3 (copy), l_RunService_0 (copy)
    v3.Lifetime = v5.Lifetime or 3;
    v3.Direction = v5.Direction or Vector3.new(1, 0, 0, 0);
    v3.Speed = v5.Speed or 6;
    if v3.UpdateConnection then
        v3.UpdateConnection:Disconnect();
        v3.UpdateConnection = nil;
    end;
    for _, v7 in v3.UpdateQueue do
        v7.Attachment0:Destroy();
        v7.Attachment1:Destroy();
        v7.Trail:Destroy();
    end;
    table.clear(v3.UpdateQueue);
    v3.LastSpawned = tick();
    local v8 = 1 / (v5.SpawnRate or 25);
    v3.UpdateConnection = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 36 ]]
        -- upvalues: v3 (ref), v8 (copy)
        local v9 = tick();
        if v9 - v3.LastSpawned > v8 then
            v3:Create();
            v3.LastSpawned = v9;
        end;
        debug.profilebegin("Wind Lines");
        for v10, v11 in v3.UpdateQueue do
            local v12 = v9 - v11.StartClock;
            if v11.Lifetime <= v12 then
                v11.Attachment0:Destroy();
                v11.Attachment1:Destroy();
                v11.Trail:Destroy();
                local v13 = #v3.UpdateQueue;
                v3.UpdateQueue[v10] = v3.UpdateQueue[v13];
                v3.UpdateQueue[v13] = nil;
            else
                v11.Trail.MaxLength = 20 - 20 * (v12 / v11.Lifetime);
                local v14 = (v9 + v11.Seed) * (v11.Speed * 0.2);
                local l_Position_0 = v11.Position;
                v11.Attachment0.WorldPosition = (CFrame.new(l_Position_0, l_Position_0 + v11.Direction) * CFrame.new(0, 0, v11.Speed * -v12)).Position + Vector3.new(math.sin(v14) * 0.5, math.sin(v14) * 0.8, math.sin(v14) * 0.5);
                v11.Attachment1.WorldPosition = v11.Attachment0.WorldPosition + Vector3.new(0, 0.10000000149011612, 0, 0);
            end;
        end;
        debug.profileend();
    end);
end;
v3.Cleanup = function(_) --[[ Line: 81 ]] --[[ Name: Cleanup ]]
    -- upvalues: v3 (copy)
    if v3.UpdateConnection then
        v3.UpdateConnection:Disconnect();
        v3.UpdateConnection = nil;
    end;
    for _, v18 in v3.UpdateQueue do
        v18.Attachment0:Destroy();
        v18.Attachment1:Destroy();
        v18.Trail:Destroy();
    end;
    table.clear(v3.UpdateQueue);
end;
v3.Create = function(_, v20) --[[ Line: 97 ]] --[[ Name: Create ]]
    -- upvalues: v2 (copy), v3 (copy), l_Terrain_0 (copy)
    debug.profilebegin("Add Wind Line");
    v20 = v20 or v2;
    local v21 = v20.Lifetime or v3.Lifetime;
    local v22 = v20.Position or workspace.CurrentCamera.CFrame * CFrame.Angles(math.rad((math.random(-30, 70))), math.rad((math.random(-80, 80))), 0) * CFrame.new(0, 0, math.random(200, 600) * -0.1).Position;
    local v23 = v20.Direction or v3.Direction;
    local v24 = v20.Speed or v3.Speed;
    if v24 <= 0 then
        return;
    else
        local l_Attachment_0 = Instance.new("Attachment");
        local l_Attachment_1 = Instance.new("Attachment");
        local l_Trail_0 = Instance.new("Trail");
        l_Trail_0.Attachment0 = l_Attachment_0;
        l_Trail_0.Attachment1 = l_Attachment_1;
        l_Trail_0.WidthScale = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.3), 
            NumberSequenceKeypoint.new(0.2, 1), 
            NumberSequenceKeypoint.new(0.8, 1), 
            NumberSequenceKeypoint.new(1, 0)
        });
        l_Trail_0.Transparency = NumberSequence.new(0.7);
        l_Trail_0.FaceCamera = true;
        l_Trail_0.Parent = l_Attachment_0;
        l_Attachment_0.WorldPosition = v22;
        l_Attachment_1.WorldPosition = v22 + Vector3.new(0, 0.10000000149011612, 0, 0);
        local v28 = {
            Attachment0 = l_Attachment_0, 
            Attachment1 = l_Attachment_1, 
            Trail = l_Trail_0, 
            Lifetime = v21 + math.random(-10, 10) * 0.1, 
            Position = v22, 
            Direction = v23, 
            Speed = v24 + math.random(-10, 10) * 0.1, 
            StartClock = tick(), 
            Seed = math.random(1, 1000) * 0.1
        };
        v3.UpdateQueue[#v3.UpdateQueue + 1] = v28;
        l_Attachment_0.Parent = l_Terrain_0;
        l_Attachment_1.Parent = l_Terrain_0;
        debug.profileend();
        return;
    end;
end;
return v3;