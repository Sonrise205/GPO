local l_RunService_0 = game:GetService("RunService");
local l_Fishman_0 = game.ReplicatedStorage.Refrences.Fishman;
local l_Effects_0 = workspace:WaitForChild("Effects");
local v3 = require(game:GetService("ReplicatedStorage").Util.FABRIK);
local v4 = require(game:GetService("ReplicatedStorage").Util.Tween);
local v5 = require(game:GetService("ReplicatedStorage").Util.Misc);
local v6 = require(l_Fishman_0.Effects.Shockwave);
local v7 = {};
game["Run Service"].Heartbeat:Connect(function(v8) --[[ Line: 13 ]]
    -- upvalues: v7 (copy)
    local _ = tick();
    local v10 = 0;
    for v11, v12 in next, v7 do
        if v10 > 0 then
            v12 = v7[v11 - v10];
        end;
        do
            local l_v12_0 = v12;
            if not l_v12_0.Origin.Parent then
                task.spawn(function() --[[ Line: 21 ]]
                    -- upvalues: l_v12_0 (ref)
                    l_v12_0:Destroy();
                end);
                table.remove(v7, v11 - v10);
                v10 = v10 + 1;
            else
                l_v12_0:Update(nil, v8);
            end;
        end;
    end;
end);
local v14 = {};
v14.new = function(v15, v16, v17) --[[ Line: 35 ]] --[[ Name: new ]]
    -- upvalues: v14 (copy)
    return setmetatable({
        Origin = v15 or Vector3.new(), 
        Goal = v16 or Vector3.new(0, 0, -1, 0), 
        Width = v17 or 1
    }, {
        __index = v14
    }):__init();
end;
v14.__init = function(v18) --[[ Line: 43 ]] --[[ Name: __init ]]
    -- upvalues: l_Fishman_0 (copy), v3 (copy), l_Effects_0 (copy), v5 (copy), v7 (copy)
    if v18.Chain then
        return v18;
    else
        local v19 = typeof(v18.Origin) == "Vector3" and v18.Origin or v18.Origin.Position;
        local v20 = typeof(v18.Goal) == "Vector3" and v18.Goal or v18.Goal.Position;
        v18.Growing = true;
        v18.LastVelocity = Vector3.new(0, 1, 0, 0);
        v18.Part = l_Fishman_0.Assets.Water:Clone();
        v18.Unit = v18.Part.Size;
        v18.Bones = {};
        v18.Particles = {};
        v18.Points = {
            v19
        };
        for v21, v22 in next, v18.Part:GetDescendants() do
            if v22:IsA("Bone") then
                v22.Visible = false;
                local l_CFrame_0 = v22.CFrame;
                if v21 > 1 then
                    l_CFrame_0 = v18.Bones[v21 - 1].Offset * v22.CFrame;
                end;
                table.insert(v18.Bones, {
                    Bone = v22, 
                    Offset = l_CFrame_0 - l_CFrame_0.p, 
                    LocalOffset = v22.CFrame
                });
                local l_Attachment_0 = Instance.new("Attachment");
                local v25 = l_Fishman_0.Particles.Water:Clone();
                local v26 = l_Fishman_0.Particles.WaterBlobs:Clone();
                v25.Rate = 5;
                v25.ZOffset = -0.1;
                v25.Enabled = true;
                v25.Parent = l_Attachment_0;
                v26.Rate = 20;
                v26.ZOffset = v18.Width;
                v26.Enabled = true;
                v26.Parent = l_Attachment_0;
                l_Attachment_0.Parent = v18.Part;
                table.insert(v18.Particles, {
                    Particle = v25, 
                    Particle2 = v26, 
                    Attachment = l_Attachment_0, 
                    Size = v25.Size.Keypoints, 
                    Size2 = v26.Size.Keypoints
                });
            end;
        end;
        for v27, v28 in next, v18.Bones do
            local v29 = 0;
            if v27 == 1 then
                v29 = v18.Bones[v27].Bone.Position.Magnitude;
            else
                v29 = v28.Bone.Position.Magnitude;
                if #v18.Bones - 2 <= v27 then

                end;
            end;
            v18.Points[v27 + 1] = v18.Points[v27] - v18.LastVelocity * v29;
        end;
        v18.Chain = v3.new(v18.Points, v20);
        v18:SetWidth();
        v18:Update();
        v18.Part.Parent = l_Effects_0;
        v18.SoundLoop = v5.PlaySound(v18.Particles[1].Attachment, l_Fishman_0.Sounds.WaterPillarLoop);
        table.insert(v7, v18);
        return v18;
    end;
end;
v14.ScaleParticles = function(v30, v31) --[[ Line: 125 ]] --[[ Name: ScaleParticles ]]
    -- upvalues: v5 (copy)
    for _, v33 in next, v30.Particles do
        v33.Particle.Size = v5.ScaleParticleSize(v33.Size, v31);
        v33.Particle.Speed = NumberRange.new(v31, 2 * v31);
        v33.Particle2.Size = v5.ScaleParticleSize(v33.Size2, 4 * v31);
        v33.Particle2.Speed = NumberRange.new(v31);
    end;
end;
v14.SetWidth = function(v34, v35) --[[ Line: 135 ]] --[[ Name: SetWidth ]]
    v35 = v35 or 0;
    local l_totallength_0 = v34.Chain.totallength;
    local v37 = Vector3.new();
    local v38 = Vector3.new();
    if v34.Unit.X > v34.Unit.Y and v34.Unit.X > v34.Unit.Z then
        v37 = Vector3.new(1, 0, 0, 0);
        v38 = Vector3.new(0, 1, 1, 0);
    elseif v34.Unit.Y > v34.Unit.X and v34.Unit.Y > v34.Unit.Z then
        v37 = Vector3.new(0, 1, 0, 0);
        v38 = Vector3.new(1, 0, 1, 0);
    else
        v37 = Vector3.new(0, 0, 1, 0);
        v38 = Vector3.new(1, 1, 0, 0);
    end;
    local v39 = v37 * l_totallength_0 + v38 * v35;
    v34.Part.Size = v39;
    v34:ScaleParticles(v35);
end;
v14.Destroy = function(v40) --[[ Line: 161 ]] --[[ Name: Destroy ]]
    -- upvalues: v4 (copy), l_RunService_0 (copy)
    local l_origin_0 = v40.Chain.origin;
    local l_LastVelocity_0 = v40.LastVelocity;
    local l_Transparency_0 = v40.Part.Transparency;
    local l_Width_0 = v40.Width;
    local v45 = nil;
    local v46 = nil;
    while true do
        local v47 = tick();
        if not v45 then
            v45 = v47;
            v46 = 0.016666666666666666;
        end;
        local v48 = math.min(1, (v47 - v45) / 0.5);
        local _ = v4.ease.out.quad(v48, 0, 1, 1);
        local v50 = v4.ease["in"].quad(v48, 0, 1, 1);
        local v51 = v4.ease.out.quint(v48, 0, 1, 1);
        v40:Update(l_origin_0 + l_LastVelocity_0 * v40.Chain.totallength * v48, v46);
        v40.Part.Transparency = v4.point(l_Transparency_0, 1, v50);
        v40:SetWidth(v4.point(l_Width_0, 0, v51));
        if v48 ~= 1 then
            if v48 > 0.5 then
                for _, v53 in next, v40.Particles do
                    v53.Particle.Enabled = false;
                end;
            end;
            l_RunService_0.RenderStepped:Wait();
            v46 = tick() - v47;
        else
            break;
        end;
    end;
    v40.Part:Destroy();
end;
v14.Update = function(v54, v55, v56) --[[ Line: 209 ]] --[[ Name: Update ]]
    -- upvalues: v6 (copy)
    local v57 = tick();
    if not v54.Start or not v54.LastLerp then
        v54.Start = v57;
        v54.LastLerp = v57;
    end;
    v56 = v56 or 0.016666666666666666;
    local v58 = math.min(1, (v57 - v54.Start) / 0.25);
    if v54.Growing then
        v54:SetWidth(v54.Width * v58);
    end;
    if v58 == 1 then
        v54.Growing = false;
    else
        v54.Growing = true;
    end;
    v58 = 6.283185307179586 * tick();
    local v59 = v55 or typeof(v54.Origin) == "Vector3" and v54.Origin or v54.Origin.Position;
    local v60 = v54.Origin.Parent and v54.Origin.CFrame.LookVector.Unit or v54.LastVelocity;
    if v60 ~= v60 or v60.Magnitude < 0.01 then
        v60 = v54.LastVelocity;
    end;
    local v61 = Vector3.new(0, v54.Chain.totallength * 0.1 * (v55 and 2 or 1) * math.sin(2 * v58 * (v55 and 2 or 1)), 0);
    local v62 = CFrame.new(Vector3.new(), v60):PointToObjectSpace(v61);
    v54.Chain.origin = v59 + v62;
    v54.Chain:forward();
    v54.Chain.target = v54.Chain.joints[#v54.Chain.joints];
    v54.LastVelocity = v60;
    if not v55 then
        if not v54.StartShockwave then
            v54.StartShockwave = Vector3.new();
        end;
        if (v59 - v54.StartShockwave).Magnitude > v54.Chain.totallength * 0.175 then
            v6({
                CFrame = CFrame.new(v54.Chain.joints[1], v54.Chain.joints[2]) * CFrame.Angles(-1.5707963267948966, 0, 0), 
                Scale = v54.Width * 1.75, 
                Duration = 0.4, 
                Offset = Vector3.new(0, v54.Width, 0), 
                YInfluence = 0.3
            });
            v54.StartShockwave = v59;
        end;
    end;
    local v63 = CFrame.new(v54.Chain.origin + (v54.Chain.target - v54.Chain.origin).Unit * v54.Chain.totallength / 2, v54.Chain.target);
    v54.Part.CFrame = v63;
    for v64, _ in next, v54.Chain.joints do
        local v66 = false;
        if v64 < #v54.Chain.joints then
            v66 = v64 + 1;
        end;
        if v66 then
            local v67 = v54.Chain.joints[v66] - v54.Chain.joints[v64];
            local v68 = CFrame.new(v54.Chain.joints[v64] + v67 / 2, v54.Chain.joints[v66]);
            local v69 = CFrame.Angles(0, 3.141592653589793, 0) * v54.Bones[v64].Offset;
            local v70 = v63:ToObjectSpace(v68 * v69);
            local v71 = v63 * v70;
            local v72 = CFrame.new(0, 0, -v67.Magnitude / 2);
            if v64 > 1 then
                local v73 = v54.Chain.joints[v64] - v54.Chain.joints[v64 - 1];
                local v74 = v63:ToObjectSpace(CFrame.new(v54.Chain.joints[v64 - 1] + v73 / 2, v54.Chain.joints[v64]) * v69);
                local v75 = (v63 * v74):ToObjectSpace(v71);
                v54.Bones[v64].Bone.CFrame = v75;
                v54.Particles[v64].Attachment.CFrame = v74 * v72;
            else
                v54.Bones[v64].Bone.CFrame = v70;
                v54.Particles[v64].Attachment.CFrame = v70 * v72;
            end;
            v54.Particles[v64].Particle.Acceleration = v60 * v54.Chain.totallength;
        end;
    end;
end;
return v14;