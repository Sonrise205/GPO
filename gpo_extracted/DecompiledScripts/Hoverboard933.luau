local v0 = {};
v0.__index = v0;
v0.Start = function(_, v2, v3) --[[ Line: 4 ]] --[[ Name: Start ]]
    -- upvalues: v0 (copy)
    local v4 = {};
    setmetatable(v4, v0);
    repeat
        task.wait();
    until v2.Humanoid.SeatPart ~= nil;
    if v2.Humanoid.SeatPart:WaitForChild("SeatWeld", 2) then

    end;
    local v5 = v2.Humanoid:LoadAnimation(script.sit);
    local v6 = v2.Humanoid:LoadAnimation(script.sit2);
    v6:Play();
    v4.RegY = v3.m.Position.Y;
    v4.anims = {
        v5, 
        v6
    };
    v4.ship = v3;
    return v4;
end;
v0.int = function(_, v8, v9) --[[ Line: 25 ]] --[[ Name: int ]]
    -- upvalues: v0 (copy)
    local v10 = {};
    setmetatable(v10, v0);
    repeat
        task.wait();
    until v8.Humanoid.SeatPart ~= nil;
    local v11 = v8.Humanoid:LoadAnimation(script.sit);
    local v12 = v8.Humanoid:LoadAnimation(script.sit2);
    v12:Play();
    v10.anims = {
        v11, 
        v12
    };
    v10.ship = v9;
    return v10;
end;
v0.disableEngine = function(_, v14) --[[ Line: 39 ]] --[[ Name: disableEngine ]]
    if v14:FindFirstChild("Back") then
        v14.Back.Attachment.ParticleEmitter.Enabled = false;
        v14.Back.Glare.ParticleEmitter.Enabled = false;
        v14.Back.Glare.SurfaceLight.Enabled = false;
    end;
end;
v0.Foward = function(v15, v16) --[[ Line: 49 ]] --[[ Name: Foward ]]
    if v15.anims[2].IsPlaying == true then
        v15.anims[2]:Stop();
    end;
    if v15.anims[1].IsPlaying == false then
        v15.anims[1]:Play();
    end;
    v16.Back.Attachment.ParticleEmitter.Enabled = true;
    v16.Back.Glare.ParticleEmitter.Enabled = true;
    v16.Back.Glare.SurfaceLight.Enabled = true;
    if v16.Hover.drive.IsPlaying == false or v16.Hover.drive.Volume == 0 then
        if v16.Hover.drive.Volume == 0 then
            _G.tween(v16.Hover.drive, {
                0.25, 
                "Sine", 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                Volume = 0.6
            });
        end;
        if v16.Hover.drive.IsPlaying == false then
            v16.Hover.drive:Play();
        end;
    end;
end;
v0.looped = function(_, v18) --[[ Line: 82 ]] --[[ Name: looped ]]
    local v19 = CFrame.new(v18.PrimaryPart.Position);
    local v20 = Ray.new(v19.Position, v19.UpVector * -4);
    local v21, v22 = _G.raycastWhitelist(v20, {
        workspace.Islands, 
        workspace.Env
    });
    local v23 = -1;
    if v21 then
        v23 = 1;
    end;
    if v22 and v22.Y < workspace.Env.WaterStuff.Falls.Position.Y then
        v23 = 0.5;
    end;
    local l_BodyPosition_0 = v18.m.BodyPosition;
    l_BodyPosition_0.Position = l_BodyPosition_0.Position:Lerp(l_BodyPosition_0.Position + Vector3.new(0, v23, 0), 0.4);
end;
v0.Backward = function(_, v26) --[[ Line: 101 ]] --[[ Name: Backward ]]
    -- upvalues: v0 (copy)
    local _ = v26.VehicleSeat.Occupant.Parent;
    v0:disableEngine(v26);
    if v26.Hover.drive.IsPlaying == true then
        _G.tween(v26.Hover.drive, {
            0.25, 
            "Sine", 
            Enum.EasingDirection.Out, 
            0, 
            false, 
            0
        }, {
            Volume = 0
        });
    end;
end;
v0.Idle = function(v28, v29) --[[ Line: 110 ]] --[[ Name: Idle ]]
    -- upvalues: v0 (copy)
    if v28.anims[1].IsPlaying == true then
        v28.anims[1]:Stop();
    end;
    if v28.anims[2].IsPlaying == false then
        v28.anims[2]:Play();
    end;
    v0:Backward(v29);
end;
v0.End = function(v30) --[[ Line: 121 ]] --[[ Name: End ]]
    -- upvalues: v0 (copy)
    local l_ship_0 = v30.ship;
    if v30.anims then
        for v32 = 1, #v30.anims do
            v30.anims[v32]:Stop();
        end;
    end;
    v0:disableEngine(l_ship_0);
    return true;
end;
return v0;