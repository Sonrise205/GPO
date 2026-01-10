local l_RunService_0 = game:GetService("RunService");
local l_Phoenix_0 = game.ReplicatedStorage.Refrences.Phoenix;
local l_Effects_0 = workspace:WaitForChild("Effects");
local v3 = require(game.ReplicatedStorage.Util.Misc);
local v4 = {};
l_RunService_0:BindToRenderStep(script.Parent.Name .. "-" .. script.Name, Enum.RenderPriority.Last.Value - 1000, function(v5) --[[ Line: 9 ]]
    -- upvalues: v4 (copy)
    local _ = tick();
    for _, v8 in next, v4 do
        v8:Update(v5);
    end;
end);
local v9 = {};
v9.new = function(v10) --[[ Line: 18 ]] --[[ Name: new ]]
    -- upvalues: v9 (copy)
    return setmetatable({
        Anchor = v10.Anchor, 
        Scale = v10.Scale or 10, 
        Lifetime = v10.Lifetime or 1
    }, {
        __index = v9
    }):__init();
end;
v9.__init = function(v11) --[[ Line: 26 ]] --[[ Name: __init ]]
    -- upvalues: l_Phoenix_0 (copy), l_Effects_0 (copy)
    if v11.Reference then
        return v11;
    else
        v11.Reference = l_Phoenix_0.Assets.Trail:Clone();
        v11.Particles = {};
        for _, v13 in next, v11.Reference:GetChildren() do
            local l_ParticleEmitter_0 = v13:FindFirstChildOfClass("ParticleEmitter");
            if l_ParticleEmitter_0 then
                l_ParticleEmitter_0.ZOffset = v11.Scale * 0.1;
                table.insert(v11.Particles, l_ParticleEmitter_0);
            end;
        end;
        v11.Top2 = v11.Reference.Top2;
        v11.Top22 = v11.Reference.Top22;
        v11.Bottom2 = v11.Reference.Bottom2;
        v11.Bottom22 = v11.Reference.Bottom22;
        v11.Reference.CFrame = v11.Anchor.CFrame;
        v11.lastPos = v11.Reference.CFrame.p;
        v11.Reference.Parent = l_Effects_0;
        v11.Angle = 0;
        return v11;
    end;
end;
v9.Emit = function(v15) --[[ Line: 55 ]] --[[ Name: Emit ]]
    -- upvalues: v3 (copy), l_Phoenix_0 (copy), v4 (copy)
    for _, v17 in next, v15.Particles do
        v17.Size = v3.ScaleParticleSize(v17.Size.Keypoints, v15.Scale * 0.25);
        v17.Lifetime = NumberRange.new(v15.Lifetime * 0.5, v15.Lifetime);
        v17.Enabled = true;
    end;
    v15.Sound = v3.PlaySound(v15.Reference, l_Phoenix_0.Sounds.Burning, {
        PlaybackSpeed = 1
    });
    v4[v15] = v15;
end;
v9.Destroy = function(v18) --[[ Line: 68 ]] --[[ Name: Destroy ]]
    -- upvalues: v4 (copy), v3 (copy)
    if v18.Destroying then
        return;
    else
        v18.Destroying = true;
        v4[v18] = nil;
        v3.DestroySound(v18.Sound, 0.25);
        for _, v20 in next, v18.Particles do
            v20.Enabled = false;
        end;
        coroutine.resume(coroutine.create(function() --[[ Line: 81 ]]
            -- upvalues: v18 (copy)
            task.wait(1 + v18.Particles[1].Lifetime.Max);
            v18.Reference:Destroy();
        end));
        return;
    end;
end;
v9.Update = function(v21, v22) --[[ Line: 87 ]] --[[ Name: Update ]]
    local v23 = tick();
    if not v21.Start then
        v21.Start = v23;
    end;
    local v24 = math.min(1, (v23 - v21.Start) / v21.Lifetime);
    local l_Scale_0 = v21.Scale;
    v21.Angle = v21.Angle + 25.132741228718345 * v22;
    local l_Angle_0 = v21.Angle;
    local v27 = Vector3.new(math.cos(l_Angle_0), (math.sin(l_Angle_0)));
    local v28 = Vector3.new(math.cos(3.141592653589793 + l_Angle_0), (math.sin(3.141592653589793 + l_Angle_0)));
    local v29 = CFrame.new(l_Scale_0 * 0.5 * v27) * CFrame.new(0, l_Scale_0 / 4, 0);
    local v30 = CFrame.new(l_Scale_0 * 0.5 * v28) * CFrame.new(0, -l_Scale_0 / 4, 0);
    v21.Top2.CFrame = v29 + v29.UpVector * l_Scale_0 * 0.5;
    v21.Top22.CFrame = v29 - v29.UpVector * l_Scale_0 * 0.5;
    v21.Bottom2.CFrame = v30 + v30.UpVector * l_Scale_0 * 0.5;
    v21.Bottom22.CFrame = v30 - v30.UpVector * l_Scale_0 * 0.5;
    local l_Position_0 = v21.Anchor.Position;
    v21.lastPos = v21.lastPos:Lerp(l_Position_0, v22 * 8);
    local v32 = CFrame.new(l_Position_0, v21.lastPos);
    v21.Reference.CFrame = v32;
    if v24 == 1 or not v21.Anchor.Parent then
        v21:Destroy();
        return;
    else
        if v24 > 0.75 then
            for _, v34 in next, v21.Particles do
                v34.Enabled = false;
            end;
        end;
        return;
    end;
end;
return v9;