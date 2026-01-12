local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("TweenService");
local _ = game:GetService("ReplicatedStorage");
local v3 = {};
v3.__index = v3;
v3.new = function(v4) --[[ Line: 7 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy)
    local v5 = setmetatable({}, v3);
    v5.Projectile = v4.Part or v4.Model;
    v5.IsModel = v5.Projectile:IsA("Model");
    v5.Velocity = v4.Velocity;
    v5.Target = v4.Target;
    v5.ExplosionRange = v4.ExplosionRange or 5;
    v5.ProjectileSpeed = v4.Speed or 25;
    v5.ExplodeFunction = v4.ExplodeFunction or nil;
    v5.SnakeAmplitude = v4.SnakeAmplitude or 30;
    v5.SnakeFrequency = v4.SnakeFrequency or 15;
    v5.Time = 0;
    v5.Lifetime = v4.Lifetime or 5;
    v5.TravelFunction = v4.TravelFunction;
    v5:_main();
    return v5;
end;
v3._clampVelocity = function(_, v7, v8) --[[ Line: 26 ]] --[[ Name: _clampVelocity ]]
    if v8 < v7.Magnitude then
        return v7.Unit * v8;
    else
        return v7;
    end;
end;
v3._Explode = function(v9, v10) --[[ Line: 33 ]] --[[ Name: _Explode ]]
    if v9.ExplodeFunction then
        v9.ExplodeFunction(v10);
    end;
end;
v3._getPosition = function(v11) --[[ Line: 39 ]] --[[ Name: _getPosition ]]
    if v11.IsModel then
        return v11.Projectile:GetPivot().Position;
    else
        return v11.Projectile.Position;
    end;
end;
v3._setPosition = function(v12, v13) --[[ Line: 47 ]] --[[ Name: _setPosition ]]
    if v12.IsModel then
        local l_Pivot_0 = v12.Projectile:GetPivot();
        v12.Projectile:PivotTo(CFrame.new(v13) * l_Pivot_0.Rotation);
        return;
    else
        v12.Projectile.Position = v13;
        return;
    end;
end;
v3._setCFrame = function(v15, v16) --[[ Line: 56 ]] --[[ Name: _setCFrame ]]
    if v15.IsModel then
        v15.Projectile:PivotTo(v16);
        return;
    else
        v15.Projectile.CFrame = v16;
        return;
    end;
end;
v3._main = function(v17) --[[ Line: 64 ]] --[[ Name: _main ]]
    -- upvalues: l_RunService_0 (copy)
    local v18 = nil;
    v18 = l_RunService_0.Heartbeat:Connect(function(v19) --[[ Line: 66 ]]
        -- upvalues: v17 (copy), v18 (ref)
        local l_v17_0 = v17;
        l_v17_0.Time = l_v17_0.Time + v19;
        l_v17_0 = false;
        if v17.TravelFunction then
            v17.TravelFunction();
        end;
        if v17.FunctionCheck and v17.FunctionCheck() == true then
            l_v17_0 = true;
        end;
        if v17.Target and v17.Target:IsDescendantOf(game) then
            local v21 = v17:_getPosition();
            local v22 = v17.Target:IsA("Model") and v17.Target:GetPivot().Position or v17.Target.Position;
            local v23 = v22 - v21;
            v17.Velocity = (v23 + v23.Unit:Cross((Vector3.new(0, 1, 0, 0))).Unit * math.sin(v17.Time * v17.SnakeFrequency) * v17.SnakeAmplitude).Unit * v19 * v17.ProjectileSpeed;
            local v24 = v21 + v17.Velocity;
            v17:_setPosition(v24);
            local v25 = CFrame.new(v24, v22);
            if v25 == v25 then
                v17:_setCFrame(v25);
            end;
            if v23.Magnitude <= v17.ExplosionRange then
                l_v17_0 = true;
            end;
        else
            l_v17_0 = true;
        end;
        if l_v17_0 == true or v17.Time >= v17.Lifetime or v17.Cancel ~= nil then
            v18:Disconnect();
            v18 = nil;
            v17:_Explode(v17.Time > v17.Lifetime);
            return;
        else
            return;
        end;
    end);
end;
return function(v26) --[[ Line: 111 ]]
    -- upvalues: v3 (copy)
    return v3.new(v26);
end;