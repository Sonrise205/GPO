local v0 = {};
v0.__index = v0;
v0.Start = function(_, v2, v3) --[[ Line: 4 ]] --[[ Name: Start ]]
    -- upvalues: v0 (copy)
    local v4 = {};
    setmetatable(v4, v0);
    repeat
        task.wait();
    until v2.Humanoid.SeatPart ~= nil;
    local v5 = v2.Humanoid.SeatPart:WaitForChild("SeatWeld", 2);
    if v5 then
        v5.C0 = v5.C0 * CFrame.new(0, 0, 1.1 * v2.Humanoid.BodyHeightScale.Value - 0.1);
    end;
    local v6 = v2.Humanoid:LoadAnimation(script.sit);
    local v7 = v2.Humanoid:LoadAnimation(script.sit2);
    v7:Play();
    v4.anims = {
        v6, 
        v7
    };
    v4.ship = v3;
    v3.FlamePart.Burn.Enabled = true;
    return v4;
end;
v0.int = function(_, v9, v10) --[[ Line: 24 ]] --[[ Name: int ]]
    -- upvalues: v0 (copy)
    local v11 = {};
    setmetatable(v11, v0);
    repeat
        task.wait();
    until v9.Humanoid.SeatPart ~= nil;
    local v12 = v9.Humanoid:LoadAnimation(script.sit);
    local v13 = v9.Humanoid:LoadAnimation(script.sit2);
    v13:Play();
    v11.anims = {
        v12, 
        v13
    };
    v11.ship = v10;
    v10.FlamePart.foot:Play();
    return v11;
end;
v0.Foward = function(v14, v15) --[[ Line: 39 ]] --[[ Name: Foward ]]
    if v14.anims[2].IsPlaying == true then
        v14.anims[2]:Stop();
    end;
    if v14.anims[1].IsPlaying == false then
        v14.anims[1]:Play();
    end;
    if v15.Back.sfx.IsPlaying == false then
        v15.Back.sfx:Play();
    end;
    if v15.Backglow:FindFirstChild("glow") == nil then
        local v16 = Instance.new("BoolValue", v15.Backglow);
        v16.Name = "glow";
        _G.destroy(v16, 0.35);
        _G.tween(v15.Backglow, {
            0.25, 
            "Sine", 
            Enum.EasingDirection.Out, 
            0, 
            false, 
            0
        }, {
            Color = Color3.fromRGB(255, 98, 7)
        });
        _G.tween(v15.Back.PointLight, {
            0.25, 
            "Sine", 
            Enum.EasingDirection.Out, 
            0, 
            false, 
            0
        }, {
            Range = 8
        });
    end;
    local _ = v15.VehicleSeat.Occupant.Parent;
    v15.Back.Attachment.Burn.Enabled = true;
    v15.Steam.Attachment.ParticleEmitter.Enabled = true;
    v15.Steam.Attachment2.ParticleEmitter.Enabled = true;
end;
v0.Backward = function(_, v19) --[[ Line: 63 ]] --[[ Name: Backward ]]
    local _ = v19.VehicleSeat.Occupant.Parent;
    v19.Back.sfx:Stop();
    v19.Back.Attachment.Burn.Enabled = false;
    if v19.Backglow:FindFirstChild("glow2") == nil and v19.Backglow.Color ~= Color3.fromRGB(0, 0, 0) then
        local v21 = Instance.new("BoolValue", v19.Backglow);
        v21.Name = "glow2";
        _G.destroy(v21, 0.35);
        _G.tween(v19.Backglow, {
            0.25, 
            "Sine", 
            Enum.EasingDirection.Out, 
            0, 
            false, 
            0
        }, {
            Color = Color3.fromRGB(0, 0, 0)
        });
        _G.tween(v19.Back.PointLight, {
            0.25, 
            "Sine", 
            Enum.EasingDirection.Out, 
            0, 
            false, 
            0
        }, {
            Range = 0
        });
    end;
    v19.Steam.Attachment.ParticleEmitter.Enabled = false;
    v19.Steam.Attachment2.ParticleEmitter.Enabled = false;
end;
v0.Idle = function(v22, v23) --[[ Line: 79 ]] --[[ Name: Idle ]]
    -- upvalues: v0 (copy)
    if v22.anims[1].IsPlaying == true then
        v22.anims[1]:Stop();
    end;
    if v22.anims[2].IsPlaying == false then
        v22.anims[2]:Play();
    end;
    v0:Backward(v23);
end;
v0.End = function(v24) --[[ Line: 89 ]] --[[ Name: End ]]
    local l_ship_0 = v24.ship;
    if v24.anims then
        for v26 = 1, #v24.anims do
            v24.anims[v26]:Stop();
        end;
    end;
    l_ship_0.FlamePart.Burn.Enabled = false;
    l_ship_0.FlamePart.foot:Stop();
    return true;
end;
return v0;