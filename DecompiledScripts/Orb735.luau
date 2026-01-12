local l_RunService_0 = game:GetService("RunService");
local l_Fishman_0 = game.ReplicatedStorage.Refrences.Fishman;
local l_Effects_0 = workspace:WaitForChild("Effects");
local v3 = require(game:GetService("ReplicatedStorage").Util.Tween);
local v4 = require(game:GetService("ReplicatedStorage").Util.Misc);
local v5 = require(l_Fishman_0.Effects.Shockwave);
local v6 = require(l_Fishman_0.Effects.Slash);
local v7 = require(l_Fishman_0.Effects.Wind);
local _ = workspace.CurrentCamera;
local v9 = {};
l_RunService_0:BindToRenderStep(script.Parent.Name .. "-" .. script.Name, Enum.RenderPriority.Last.Value - 1000, function(v10) --[[ Line: 16 ]]
    -- upvalues: v9 (copy)
    local _ = tick();
    local v12 = 0;
    for v13, v14 in next, v9 do
        if v12 > 0 then
            v14 = v9[v13 - v12];
        end;
        do
            local l_v14_0 = v14;
            if not l_v14_0.Reference.Parent then
                spawn(function() --[[ Line: 24 ]]
                    -- upvalues: l_v14_0 (ref)
                    l_v14_0:Destroy();
                end);
                table.remove(v9, v13 - v12);
                v12 = v12 + 1;
            else
                l_v14_0:Update(v10);
            end;
        end;
    end;
end);
local v16 = {};
v16.new = function(v17, v18) --[[ Line: 35 ]] --[[ Name: new ]]
    -- upvalues: v16 (copy)
    v18 = v18 or {};
    return setmetatable({
        Reference = v17, 
        FadeIn = v18.FadeIn or 0.5, 
        FadeOut = v18.FadeOut or 0.5
    }, {
        __index = v16
    }):__init();
end;
v16.__init = function(v19) --[[ Line: 44 ]] --[[ Name: __init ]]
    -- upvalues: l_Fishman_0 (copy), l_Effects_0 (copy), v9 (copy)
    v19.Effect = l_Fishman_0.Assets.Orb:Clone();
    v19.Mesh = v19.Effect.Mesh;
    v19.UnitScale = v19.Mesh.Scale;
    v19.Transparency = v19.Effect.Transparency;
    v19.Attachments = {};
    for _, v21 in next, v19.Effect:GetChildren() do
        if v21:IsA("Attachment") and not v21.Name:find("2") then
            v19.Attachments[v21.Name] = {
                Object = v21, 
                Offset = v21.Position, 
                Particle = {
                    Size = v21.Water.Size.Keypoints, 
                    Object = v21.Water, 
                    Acceleration = v21.Water.Acceleration, 
                    Speed = v21.Water.Speed.Max, 
                    ZOffset = v21.Water.ZOffset
                }
            };
        end;
    end;
    v19.Mesh.Scale = v19.UnitScale * 0;
    v19.Effect.Transparency = v19.Transparency;
    v19.Effect.CFrame = v19.Reference.CFrame;
    v19.Effect.Parent = l_Effects_0;
    local v22 = script.WaterBallLoop:Clone();
    v22.Parent = v19.Attachments.Origin.Object;
    v22:Play();
    v19.SoundLoop = v22;
    for _, v24 in next, v19.Attachments do
        v24.Particle.Object.Enabled = true;
    end;
    table.insert(v9, v19);
    return v19;
end;
v16.Update = function(v25, v26) --[[ Line: 88 ]] --[[ Name: Update ]]
    -- upvalues: v3 (copy), v4 (copy), l_Fishman_0 (copy), v5 (copy), v7 (copy)
    local v27 = tick();
    if not v25.Start then
        v25.Start = v27;
    end;
    local v28 = v27 - v25.Start;
    local l_CFrame_0 = v25.Reference.CFrame;
    v25.CurrentScale = (v25.Reference.Size.X + v25.Reference.Size.Y + v25.Reference.Size.Z) / 3;
    if not v25.LastScale then
        v25.LastScale = v25.CurrentScale;
    end;
    v25.CurrentPosition = l_CFrame_0.p;
    if not v25.LastPosition then
        v25.LastPosition = v25.CurrentPosition;
    end;
    local v30 = v25.LastPosition:Lerp(v25.CurrentPosition, v26 * 12);
    local v31 = v3.point(v25.LastScale, v25.CurrentScale, v26 * 6);
    local v32 = v25.Reference.Velocity.Magnitude > 0.01 and v25.Reference.Velocity.Unit or Vector3.new(0, 1, 0, 0);
    v25.Effect.CFrame = CFrame.new(v30, v30 + v32);
    local v33 = 0;
    local v34 = math.min(1, v28 / v25.FadeIn);
    local v35 = v3.ease.out.back(v34, 0, 1, 1);
    local v36 = v3.ease["in"].back(v34, 0, 1, 1);
    local v37 = math.sin(6.283185307179586 * v27);
    v33 = v31 * v35;
    local v38 = v31 * v36;
    v25.Effect.Transparency = v3.point(1, v25.Transparency, v35);
    v25.Effect.Mesh.Scale = v25.UnitScale * v38;
    v25.Mesh.Scale = v25.Mesh.Scale + v25.UnitScale * 0.1 * v38 * v37;
    for _, v40 in next, v25.Attachments do
        local l_Acceleration_0 = v40.Particle.Acceleration;
        if v40.Particle.Acceleration.Magnitude > 0.01 then
            l_Acceleration_0 = l_CFrame_0:VectorToWorldSpace(v40.Particle.Acceleration.Unit) * v40.Particle.Acceleration.Magnitude;
        end;
        local v42 = v40.Particle.Acceleration.Magnitude > 0.01 and v38 + v38 * 0.1 * v37 or v33 + v33 * 0.1 * v37;
        v40.Object.Position = v40.Offset * v38 + v40.Offset * 0.1 * v37;
        v40.Particle.Object.Size = v4.ScaleParticleSize(v40.Particle.Size, v42 + 2);
        v40.Particle.Object.Acceleration = l_Acceleration_0 * v33 + l_Acceleration_0 * v33 * 0.1 * v37;
        v40.Particle.Object.Speed = NumberRange.new(v40.Particle.Speed * v33 + v40.Particle.Speed * v33 * 0.1 * v37);
        v40.Particle.Object.ZOffset = v40.Particle.ZOffset * v33 + v40.Particle.ZOffset * v33 * 0.1 * v37;
    end;
    local v43 = (v25.CurrentPosition - v25.LastPosition).Magnitude > 1;
    local v44 = false;
    if v34 == 1 then
        v44 = v43;
    end;
    if not v44 then
        local v45 = 5 * v28;
        local v46 = 6.283185307179586 * v45 / 2;
        v25.Effect.Trail.Lifetime = v25.FadeIn;
        v25.Effect.Trail2.Lifetime = v25.Effect.Trail.Lifetime;
        local v47 = CFrame.new() * CFrame.new(0, v33 * math.sin(v45), 0) * CFrame.Angles(0, v46, 0);
        local v48 = CFrame.Angles(1.5707963267948966, 0, 0) * CFrame.new(0, v33 * math.sin(v45 + 1.5707963267948966), 0) * CFrame.Angles(0, v46, 0);
        local v49 = v47 * CFrame.new(0, 0, -v33);
        local v50 = v48 * CFrame.new(0, 0, -v33);
        v25.Effect.Top2.CFrame = v49 * CFrame.new(v33 * 0.175, 0, 0);
        v25.Effect.Top22.CFrame = v49 * CFrame.new(-v33 * 0.175, 0, 0);
        v25.Effect.Bottom2.CFrame = v50 * CFrame.new(v33 * 0.175, 0, 0);
        v25.Effect.Bottom22.CFrame = v50 * CFrame.new(-v33 * 0.175, 0, 0);
    end;
    if v34 == 1 and v44 then
        if not v25.Emitted then
            v4.PlaySound(v25.Attachments.Origin.Object, l_Fishman_0.Sounds.Pulse, {
                PlaybackSpeed = 1.5
            });
            local v51 = l_Fishman_0.Particles.EnergyRing:Clone();
            v51.Color = ColorSequence.new(Color3.fromRGB(100, 200, 255));
            v51.LockedToPart = false;
            v51.Size = v4.ScaleParticleSize({
                NumberSequenceKeypoint.new(0, 1), 
                NumberSequenceKeypoint.new(1, 0)
            }, v31 * 1.75);
            v51.Lifetime = NumberRange.new(0.35 * v25.FadeIn);
            v51.Parent = v25.Attachments.Origin.Object;
            v51:Emit(1);
            local v52 = l_Fishman_0.Particles.WaterSplash:Clone();
            v52.Color = ColorSequence.new(Color3.fromRGB(75, 175, 255));
            v52.LockedToPart = false;
            v52.Transparency = l_Fishman_0.Particles.EnergyRing.Transparency;
            v52.Size = v4.ScaleParticleSize({
                NumberSequenceKeypoint.new(0, 1), 
                NumberSequenceKeypoint.new(1, 0)
            }, v31 * 1.75);
            v52.Lifetime = NumberRange.new(0.45 * v25.FadeIn);
            v52.Parent = v25.Attachments.Origin.Object;
            v52:Emit(1);
            v25.Emitted = true;
        end;
        if not v25.StartShockwave then
            v25.StartShockwave = Vector3.new();
        end;
        if not v25.StartWind then
            v25.StartWind = Vector3.new();
        end;
        local v53 = 10 * v28;
        local v54 = Vector3.new(math.cos(v53), (math.sin(v53)));
        local v55 = Vector3.new(math.cos(3.141592653589793 + v53), (math.sin(3.141592653589793 + v53)));
        local v56 = CFrame.new(v33 * 0.5 * v54) * CFrame.new(0, v33 / 4, 0);
        local v57 = CFrame.new(v33 * 0.5 * v55) * CFrame.new(0, -v33 / 4, 0);
        if (v25.CurrentPosition - v25.StartShockwave).Magnitude > v31 * 0.55 and v25.Effect.Anchored == false then
            v5({
                CFrame = CFrame.new(l_CFrame_0.p, l_CFrame_0.p + v32) * CFrame.Angles(-1.5707963267948966, 0, 0), 
                Scale = v31 * 1.25, 
                Duration = 0.55, 
                Offset = Vector3.new(0, -v31 / 2, 0), 
                YInfluence = 0.25
            });
            v25.StartShockwave = v25.CurrentPosition;
        end;
        if (l_CFrame_0.p - v25.StartWind).Magnitude > v31 * 0.4 then
            local l_Unit_0 = v25.Reference.Velocity.Unit;
            local v59 = Ray.new(l_CFrame_0.p, Vector3.new(0, -1, 0, 0) * v31 * 0.75);
            local v60, v61, v62 = _G.raycastWhitelist(v59, {
                workspace.Islands, 
                workspace.Env, 
                workspace.Ships
            });
            if v60 then
                local v63 = v4.AlignCFrame(CFrame.new(v61, v61 + l_Unit_0), v62) * CFrame.new(0, 0, -v31 * 0.25);
                for v64 = 1, 2 do
                    local v65 = v64 % 2 == 0 and 1 or -1;
                    v7({
                        CFrame = v63 * CFrame.new(v65 * v31 * 0.125, 0, 0) * CFrame.Angles(0, v65 * 3.141592653589793 * 0.0125, v65 * -3.141592653589793 / 6), 
                        Scale = v31 * 1.125, 
                        Duration = 0.75, 
                        Offset = Vector3.new(v65 * v31 * 0.25, v31 * 0.1, 0.5 * v31)
                    });
                end;
            end;
            v25.StartWind = l_CFrame_0.p;
        end;
        v25.Effect.Trail.Lifetime = 50 / v25.Reference.Velocity.Magnitude;
        v25.Effect.Trail2.Lifetime = v25.Effect.Trail.Lifetime;
        v25.Effect.Top2.CFrame = v56 + v56.UpVector * v33 * 0.5;
        v25.Effect.Top22.CFrame = v56 - v56.UpVector * v33 * 0.5;
        v25.Effect.Bottom2.CFrame = v57 + v57.UpVector * v33 * 0.5;
        v25.Effect.Bottom22.CFrame = v57 - v57.UpVector * v33 * 0.5;
    end;
    v25.LastPosition = v30;
    v25.LastScale = v31;
end;
v16.Destroy = function(v66) --[[ Line: 268 ]] --[[ Name: Destroy ]]
    -- upvalues: v4 (copy), l_Fishman_0 (copy), v3 (copy), v6 (copy), l_RunService_0 (copy)
    local _ = v4.PlaySound(v66.LastPosition, l_Fishman_0.Sounds.WaterPillarStart, {
        PlaybackSpeed = 1 / (v66.FadeOut * 0.75)
    });
    v66.LastScale = v66.LastScale or Vector3.new();
    v66.Effect.Trail.Lifetime = v66.FadeOut;
    v66.Effect.Trail2.Lifetime = v66.Effect.Trail.Lifetime;
    local l_Scale_0 = v66.Mesh.Scale;
    local v69 = nil;
    while true do
        local v70 = tick();
        if not v69 then
            v69 = v70;
        end;
        local v71 = math.min(1, (v70 - v69) / v66.FadeOut);
        local v72 = v3.ease["in"].quad(v71, 0, 1, 1);
        local v73 = v3.ease.out.sine(v71, 0, 1, 1);
        if v71 < 0.75 then
            if not v66.LastRender then
                v66.LastRender = 0;
            end;
            if v66.LastRender == 10 then
                v6({
                    CFrame = v66.Effect.CFrame, 
                    Scale = v66.LastScale * 0.9 * 0.25, 
                    AngleOffset = CFrame.Angles(Random.new():NextNumber(-1, 1) * 3.141592653589793, Random.new():NextNumber(-1, 1) * 3.141592653589793, Random.new():NextNumber(-1, 1) * 3.141592653589793), 
                    Duration = v66.FadeOut * 0.45, 
                    YInfluence = 10
                });
                v66.LastRender = 0;
            else
                v66.LastRender = v66.LastRender + 1;
            end;
        end;
        v66.Effect.Transparency = v3.point(v66.Transparency, 1, v72);
        v66.Mesh.Scale = l_Scale_0 + Vector3.new(0.10000000149011612, 0.10000000149011612, 0.10000000149011612, 0) * l_Scale_0.Magnitude * math.sin(6.283185307179586 * v73);
        if v71 > 0.5 then
            for _, v75 in next, v66.Attachments do
                v75.Particle.Object.Enabled = false;
            end;
        end;
        if v71 ~= 1 then
            l_RunService_0.RenderStepped:Wait();
        else
            break;
        end;
    end;
    task.wait(1);
    v66.Effect:Destroy();
end;
return v16;