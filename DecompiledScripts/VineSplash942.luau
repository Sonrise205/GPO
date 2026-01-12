local v0 = {};
local _ = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local function _(v3, v4, v5) --[[ Line: 6 ]] --[[ Name: lerp ]]
    return v3 + (v4 - v3) * v5;
end;
v0.start = function(_, v8) --[[ Line: 16 ]] --[[ Name: start ]]
    -- upvalues: l_RunService_0 (copy)
    local v9 = script.MainTrail:Clone();
    v9.Anchored = true;
    v9.CanCollide = false;
    v9.Size = Vector3.new(1, 1, 1, 0);
    v9.Position = v8.StartPosition;
    v9.Transparency = 1;
    v9.Parent = workspace.Effects;
    local v10 = script.MiniSlashTrail:Clone();
    v10.Anchored = false;
    v10.CanCollide = false;
    v10.Size = Vector3.new(1, 1, 1, 0);
    v10.Position = v8.StartPosition;
    v10.Parent = workspace.Effects;
    local v11 = v9.CFrame * CFrame.new(0, 0, 0);
    local l_Weld_0 = Instance.new("Weld");
    l_Weld_0.Part0 = v9;
    l_Weld_0.Part1 = v10;
    l_Weld_0.C0 = (v11 * CFrame.Angles(1.5707963267948966, 0, 0)):Inverse() * v10.CFrame;
    l_Weld_0.Parent = v10;
    local v13 = script.MiniSlashTrail:Clone();
    v13.Anchored = false;
    v13.CanCollide = false;
    v13.Size = Vector3.new(1, 1, 1, 0);
    v13.Position = v8.StartPosition;
    v13.Parent = workspace.Effects;
    local l_Weld_1 = Instance.new("Weld");
    l_Weld_1.Part0 = v9;
    l_Weld_1.Part1 = v13;
    l_Weld_1.C0 = (v11 * CFrame.Angles(1.5707963267948966, 0, 0)):Inverse() * v13.CFrame;
    l_Weld_1.Parent = v9;
    local l_StartPosition_0 = v8.StartPosition;
    local l_EndPosition_0 = v8.EndPosition;
    local v17 = (CFrame.new(l_StartPosition_0, l_EndPosition_0) * CFrame.new(0, 0, -(l_StartPosition_0 - l_EndPosition_0).Magnitude / 2)).Position + Vector3.new(0, math.random(25, 50) * 2, 0);
    local v18 = tick();
    local v19 = nil;
    v19 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 59 ]]
        -- upvalues: v18 (copy), v8 (copy), l_StartPosition_0 (copy), v17 (copy), l_EndPosition_0 (copy), v9 (copy), l_Weld_1 (copy), l_Weld_0 (copy), v19 (ref), v10 (copy), v13 (copy)
        local v20 = math.clamp(tick() - v18, 0, v8.Duration);
        local v21 = math.clamp(v20 / v8.Duration, 0, 1);
        local l_l_StartPosition_0_0 = l_StartPosition_0;
        local v23 = l_l_StartPosition_0_0 + (v17 - l_l_StartPosition_0_0) * v21;
        local l_v17_0 = v17;
        l_v17_0 = v23 + (l_v17_0 + (l_EndPosition_0 - l_v17_0) * v21 - v23) * v21;
        local v25 = math.clamp(v21 + 0.1, 0, 1);
        local l_l_StartPosition_0_1 = l_StartPosition_0;
        local v27 = l_l_StartPosition_0_1 + (v17 - l_l_StartPosition_0_1) * v25;
        local l_v17_1 = v17;
        l_v17_1 = v27 + (l_v17_1 + (l_EndPosition_0 - l_v17_1) * v25 - v27) * v25;
        local v29 = v20 * 3.141592653589793 * 2;
        v9.CFrame = CFrame.new(l_v17_0, l_v17_1);
        l_Weld_1.C1 = CFrame.new(math.sin(v29) * 5, 0, math.cos(v29) * 5);
        l_Weld_0.C1 = CFrame.new(math.sin(v29) * -5, 0, math.cos(v29) * -5);
        if v21 >= 1 then
            v19:Disconnect();
            _G.destroy(v10, 2);
            _G.destroy(v13, 2);
            _G.destroy(v9, 2);
            return;
        else
            return;
        end;
    end);
end;
return v0;