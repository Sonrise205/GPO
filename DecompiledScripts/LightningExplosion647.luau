local v0 = require(script.Parent);
local v1 = require(script.Parent.LightningSparks);
local v2 = Random.new();
local l_clock_0 = os.clock;
RandomVectorOffsetBetween = function(v4, v5, v6) --[[ Line: 9 ]] --[[ Name: RandomVectorOffsetBetween ]]
    -- upvalues: v2 (copy)
    return (CFrame.lookAt(Vector3.new(), v4) * CFrame.Angles(0, 0, v2:NextNumber(0, 6.283185307179586)) * CFrame.Angles(math.acos((v2:NextNumber(math.cos(v6), (math.cos(v5))))), 0, 0)).LookVector;
end;
local v7 = {};
local v8 = {};
v8.__index = v8;
v8.new = function(v9, v10, v11, v12, v13, v14) --[[ Line: 20 ]] --[[ Name: new ]]
    -- upvalues: v8 (copy), v2 (copy), v0 (copy), v1 (copy), l_clock_0 (copy), v7 (copy)
    local v15 = setmetatable({}, v8);
    v15.Size = v10 or 1;
    v15.NumBolts = v11 or 14;
    v15.Color = v12 or ColorSequence.new(Color3.new(1, 0, 0), Color3.new(0, 0, 1));
    v15.BoltColor = v13 or Color3.new(0.3, 0.3, 1);
    v15.UpVector = v14 or Vector3.new(0, 1, 0, 0);
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    local l_Part_0 = Instance.new("Part");
    l_Part_0.Name = "LightningExplosion";
    l_Part_0.Anchored = true;
    l_Part_0.CanCollide = false;
    l_Part_0.Locked = true;
    l_Part_0.CastShadow = false;
    l_Part_0.Transparency = 1;
    l_Part_0.Size = Vector3.new(0.05000000074505806, 0.05000000074505806, 0.05000000074505806, 0);
    l_Part_0.CFrame = CFrame.lookAt(v9 + Vector3.new(0, 0.5, 0, 0), v9 + Vector3.new(0, 0.5, 0, 0) + v15.UpVector) * CFrame.lookAt(Vector3.new(), (Vector3.new(0, 1, 0, 0))):inverse();
    l_Part_0.Parent = l_CurrentCamera_0;
    local l_Attachment_0 = Instance.new("Attachment");
    l_Attachment_0.Parent = l_Part_0;
    l_Attachment_0.CFrame = CFrame.new();
    local v19 = script.ExplosionBrightspot:Clone();
    local v20 = script.GlareEmitter:Clone();
    local v21 = script.PlasmaEmitter:Clone();
    local v22 = math.clamp(v15.Size, 0, 1);
    v20.Size = NumberSequence.new(v22 * 30);
    v21.Size = NumberSequence.new(v22 * 18);
    v21.Speed = NumberRange.new(v22 * 100);
    v19.Parent = l_Attachment_0;
    v20.Parent = l_Attachment_0;
    v21.Parent = l_Attachment_0;
    local l_Color_0 = v15.Color;
    if typeof(l_Color_0) == "Color3" then
        local v24 = ColorSequence.new(l_Color_0);
        local v25 = ColorSequence.new(l_Color_0);
        v20.Color = v24;
        v21.Color = v25;
        local v26;
        v24, v25, v26 = Color3.toHSV(l_Color_0);
        v19.Color = ColorSequence.new(Color3.fromHSV(v24, 0.5, v26));
    else
        v20.Color = l_Color_0;
        v21.Color = l_Color_0;
        local l_Keypoints_0 = l_Color_0.Keypoints;
        for v28 = 1, #l_Keypoints_0 do
            local v29, _, v31 = Color3.toHSV(l_Keypoints_0[v28].Value);
            l_Keypoints_0[v28] = ColorSequenceKeypoint.new(l_Keypoints_0[v28].Time, Color3.fromHSV(v29, 0.5, v31));
        end;
        v19.Color = ColorSequence.new(l_Keypoints_0);
    end;
    local v32 = true;
    local v33 = true;
    local v34 = true;
    v19.Enabled = v32;
    v20.Enabled = v33;
    v21.Enabled = v34;
    v32 = {};
    for _ = 1, v15.NumBolts do
        local v36 = {};
        local v37 = {};
        local l_WorldPosition_0 = l_Attachment_0.WorldPosition;
        local v39 = RandomVectorOffsetBetween(v15.UpVector, 1.1344640137963142, 1.3962634015954636);
        v36.WorldPosition = l_WorldPosition_0;
        v36.WorldAxis = v39;
        l_WorldPosition_0 = l_Attachment_0.WorldPosition + v36.WorldAxis * v2:NextNumber(20, 40) * 1.4 * v22;
        v39 = RandomVectorOffsetBetween(-v15.UpVector, 1.2217304763960306, 1.9198621771937625);
        v37.WorldPosition = l_WorldPosition_0;
        v37.WorldAxis = v39;
        l_WorldPosition_0 = v0.new(v36, v37, 10);
        l_WorldPosition_0.AnimationSpeed = 0;
        l_WorldPosition_0.Thickness = 1;
        l_WorldPosition_0.Color = v15.BoltColor;
        l_WorldPosition_0.PulseLength = 0.8;
        l_WorldPosition_0.ColorOffsetSpeed = 20;
        l_WorldPosition_0.Frequency = 2;
        v39 = 0;
        local v40 = v22 * 4;
        l_WorldPosition_0.MinRadius = v39;
        l_WorldPosition_0.MaxRadius = v40;
        l_WorldPosition_0.FadeLength = 0.4;
        l_WorldPosition_0.PulseSpeed = 5;
        v39 = 0.7;
        v40 = 1;
        l_WorldPosition_0.MinThicknessMultiplier = v39;
        l_WorldPosition_0.MaxThicknessMultiplier = v40;
        v39 = v1.new(l_WorldPosition_0, 5);
        v40 = 7.5;
        local v41 = 10;
        v39.MinDistance = v40;
        v39.MaxDistance = v41;
        l_WorldPosition_0.Velocity = (v37.WorldPosition - v36.WorldPosition).Unit * 0.1 * v22;
        v32[#v32 + 1] = l_WorldPosition_0;
    end;
    v15.Bolts = v32;
    v15.Attachment = l_Attachment_0;
    v15.Part = l_Part_0;
    v15.StartT = l_clock_0();
    v15.RefIndex = #v7 + 1;
    v7[v15.RefIndex] = v15;
    return v15;
end;
v8.Destroy = function(v42) --[[ Line: 122 ]] --[[ Name: Destroy ]]
    -- upvalues: v7 (copy)
    v7[v42.RefIndex] = nil;
    v42.Part:Destroy();
    for v43 = 1, #v42.Bolts do
        v42.Bolts[v43] = nil;
    end;
    v42 = nil;
end;
game:GetService("RunService").Heartbeat:Connect(function() --[[ Line: 133 ]]
    -- upvalues: v7 (copy), l_clock_0 (copy)
    for _, v45 in v7 do
        local v46 = l_clock_0() - v45.StartT;
        local l_Attachment_1 = v45.Attachment;
        if v46 < 0.7 then
            if v46 > 0.2 then
                local l_ExplosionBrightspot_0 = l_Attachment_1.ExplosionBrightspot;
                local l_GlareEmitter_0 = l_Attachment_1.GlareEmitter;
                local l_PlasmaEmitter_0 = l_Attachment_1.PlasmaEmitter;
                local v51 = false;
                local v52 = false;
                local v53 = false;
                l_ExplosionBrightspot_0.Enabled = v51;
                l_GlareEmitter_0.Enabled = v52;
                l_PlasmaEmitter_0.Enabled = v53;
            end;
            for v54 = 1, #v45.Bolts do
                local v55 = v45.Bolts[v54];
                v55.Attachment1.WorldPosition = v55.Attachment1.WorldPosition + v55.Velocity;
            end;
        else
            v45:Destroy();
        end;
    end;
end);
return v8;