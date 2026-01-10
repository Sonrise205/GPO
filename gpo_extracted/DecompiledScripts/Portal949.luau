local l_RunService_0 = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Fishman_0 = game.ReplicatedStorage.Refrences.Fishman;
local v3 = require(l_ReplicatedStorage_0.Util.Tween);
local v4 = require(l_ReplicatedStorage_0.Util.Misc);
local v5 = require(l_Fishman_0.Effects.Shockwave);
local v6 = require(l_Fishman_0.Effects.Slash);
local l_Effects_0 = workspace:WaitForChild("Effects");
local l_CurrentCamera_0 = workspace.CurrentCamera;
local v9 = require(l_ReplicatedStorage_0.Util.ShakeCamera);
local v10 = {};
l_RunService_0:BindToRenderStep(script.Parent.Name .. "-" .. script.Name, Enum.RenderPriority.Last.Value - 1000, function(_) --[[ Line: 18 ]]
    -- upvalues: v10 (copy), v3 (copy), v4 (copy), v5 (copy)
    local v12 = tick();
    local v13 = 0;
    for v14, v15 in next, v10 do
        if v13 > 0 then
            v15 = v10[v14 - v13];
        end;
        local v16 = v12 - v15.Start;
        if v15.FadeIn + v15.FadeOut + v15.Lifetime < v16 then
            v15.crown:Destroy();
            v15.blob.Transparency = 1;
            if v15.FadeIn + v15.FadeOut + v15.Lifetime + 1 < v16 then
                v15.blob:Destroy();
                table.remove(v10, v14 - v13);
                v13 = v13 + 1;
            end;
        elseif v15.FadeIn + v15.Lifetime < v16 then
            local v17 = (v16 - v15.FadeIn - v15.Lifetime) / v15.FadeOut;
            local _ = v3.ease.out.quad(v17, 1, -1, 1);
            local v19 = v3.ease["in"].quad(v17, 1, -1, 1);
            local v20 = v3.ease["in"].quad(v17, 0, 1, 1);
            local v21 = v3.ease.inout.quad(v17, 1, -1, 1);
            local v22 = v3.ease.out.quad(v17, 0, 1, 1);
            local v23 = v15.Scale * v19;
            local v24 = v15.Scale * v19 ^ 0.5;
            v15.blob_mesh.Scale = v15.BLOB_SCALE * Vector3.new(v21 ^ 0.125, v19 ^ 0.5, v21 ^ 0.125) * v15.Scale;
            local v25 = v15.Origin - Vector3.new(0, v15.Scale * 0.005 * v20, 0);
            v15.blob.CFrame = v25;
            v15.blob.Transparency = v3.point(0.55, 1, v20);
            if v15.Surface then
                v15.crown.CFrame = v25 * CFrame.Angles(0, 3.141592653589793 * (v17 % 2) / (2 + 2 * v20), 0);
                v15.crown.Transparency = v22;
            end;
            for _, v27 in next, v15.attachments do
                v27.Object.Position = v27.Offset * v23;
                v27.Particle.Object.Size = v4.ScaleParticleSize(v27.Particle.Size, 1.5 * v23);
                v27.Particle.Object.Acceleration = v27.Particle.Acceleration * (v15.Surface and v23 or v24 * 5 * v19 ^ 0.5);
                v27.Particle.Object.Speed = NumberRange.new(v27.Particle.Speed * v23);
                v27.Particle.Object.ZOffset = v27.Particle.ZOffset * v23;
            end;
            if v17 > 0.75 then
                for _, v29 in next, v15.attachments do
                    v29.Particle.Object.Enabled = false;
                end;
            end;
        elseif v15.FadeIn < v16 then
            local v30 = (v16 - v15.FadeIn) / v15.Lifetime;
            for _, v32 in next, v15.waves do
                v32:Destroy();
            end;
            local v33 = v3.ease.out.quad(v30, 0, 1, 1);
            if v15.Surface then
                v15.crown.CFrame = v15.Origin * CFrame.Angles(0, 6.283185307179586 * (v16 % 2 / 2), 0);
            else
                v15.crown.Transparency = v33;
            end;
        else
            local v34 = v16 / v15.FadeIn;
            local v35 = v3.ease.out.quad(v34, 0, 1, 1);
            local v36 = v3.ease.inout.sine(v34, 0, 1, 1);
            local _ = v3.ease["in"].quad(v34, 0, 1, 1);
            local v38 = v15.Scale * v35;
            v15.blob_mesh.Scale = v15.BLOB_SCALE * v15.Scale * v36;
            v15.crown_mesh.Scale = v15.CROWN_SCALE * v15.Scale * v36 * 0.75;
            v15.crown.CFrame = v15.Origin * CFrame.Angles(0, 6.283185307179586 * (v16 % 2 / 2), 0) + Vector3.new(0, v15.Scale * 0.01 * v36, 0);
            local l_Origin_0 = v15.Origin;
            v15.blob.CFrame = l_Origin_0;
            for _, v41 in next, v15.attachments do
                v41.Object.Position = v41.Offset * v38;
                v41.Particle.Object.Size = v4.ScaleParticleSize(v41.Particle.Size, 1.5 * v38);
                v41.Particle.Object.Acceleration = v41.Particle.Acceleration * v38 * (v15.Surface and 1 or 5);
                v41.Particle.Object.Speed = NumberRange.new(v41.Particle.Speed * v38);
                v41.Particle.Object.ZOffset = v41.Particle.ZOffset * v38;
            end;
            local v42 = v15.Scale / 3;
            local _ = v3.ease.inout.quad(v34, 0, 1, 1);
            local v44 = v3.ease.out.quad(v34, 0, 1, 1);
            local v45 = v3.ease["in"].sine(v34, 0, 1, 1);
            local v46 = v3.ease.out.quad(math.min(v34 / 0.5, 1), 0, 1, 1);
            for v47, v48 in next, v15.waves do
                local v49 = 6.283185307179586 * (v47 / 10);
                local v50 = v42 * v46 * 1.25;
                v48.CFrame = l_Origin_0 * CFrame.fromAxisAngle(Vector3.new(0, 1, 0, 0), v49) * CFrame.new(0, 0, -v3.point(0, v42 * 1.125, v46)) * CFrame.Angles(-3.141592653589793 - 2.792526803190927 * v44 ^ 2, 0, 0);
                v48.Tip.Position = Vector3.new(0, 0, -1, 0) * v50 * 1.5;
                v48.Beam.Width0 = v50 / 1.5;
                v48.Beam.Width1 = v50;
                v48.Beam.Transparency = NumberSequence.new(v45 ^ 0.5);
                v48.Beam.ZOffset = 1 * v42 * v44;
            end;
            if v34 > 0.65 then
                v15.attachments.Origin.Particle.Object.Enabled = false;
            elseif v34 > 0.1 then
                if not v15.emitted then
                    v15.emitted = true;
                    v15.e_ring:Emit(1);
                end;
                if not v15.lastShockwave then
                    v15.lastShockwave = 0;
                end;
                if v15.first and v12 - v15.lastShockwave > v15.FadeIn * 0.65 / 3 then
                    v5({
                        CFrame = l_Origin_0, 
                        Scale = v15.Scale * 0.9, 
                        Duration = v15.FadeIn * 0.5, 
                        Offset = Vector3.new(0, v15.Scale * v3.point(0.5, 1, v34 / 0.65), 0)
                    });
                    v15.lastShockwave = v12;
                elseif not v15.first then
                    v5({
                        CFrame = l_Origin_0, 
                        Scale = v15.Scale * 1.25, 
                        Duration = v15.FadeIn * 0.75
                    });
                    v15.first = true;
                end;
            end;
        end;
    end;
end);
return function(v51) --[[ Line: 168 ]]
    -- upvalues: l_CurrentCamera_0 (copy), l_Fishman_0 (copy), l_Effects_0 (copy), v4 (copy), v9 (copy), v6 (copy), v10 (copy)
    local v52 = v51.CFrame or CFrame.new();
    local v53 = v51.Scale or 20;
    local v54 = v51.Shake or true;
    if (l_CurrentCamera_0.CFrame.p - v52.p).Magnitude > 50 + v53 * 8 then
        return;
    else
        local l_Special_0 = v51.Special;
        local l_Special2_0 = v51.Special2;
        local v57 = v51.FadeIn or 0.75;
        local v58 = v51.Lifetime or 1;
        local v59 = v51.FadeOut or 0.5;
        local l_Surface_0 = v51.Surface;
        local v61 = {};
        local v62 = {};
        local v63 = {};
        local v64 = l_Surface_0 and l_Fishman_0.Assets.Crown:Clone() or l_Fishman_0.Assets.Ring:Clone();
        local l_Mesh_0 = v64.Mesh;
        local v66 = l_Surface_0 and l_Mesh_0.Scale or Vector3.new(1, 1.75, 1, 0) * l_Mesh_0.Scale.X;
        local v67 = l_Fishman_0.Assets.Blob:Clone();
        local l_Mesh_1 = v67.Mesh;
        local v69 = l_Surface_0 and l_Mesh_1.Scale or Vector3.new(1, 1, 1, 0) * l_Mesh_1.Scale.X;
        v67.CFrame = v52;
        l_Mesh_1.Scale = v69 * 0;
        l_Mesh_0.Scale = v66 * 0;
        v64.CFrame = v52;
        for _, v71 in next, v67:GetChildren() do
            if v71:IsA("Attachment") then
                v62[v71.Name] = {
                    Object = v71, 
                    Offset = v71.Position * (l_Surface_0 and 1 or 4), 
                    Particle = {
                        Size = v71.Water.Size.Keypoints, 
                        Object = v71.Water, 
                        Acceleration = v71.Water.Acceleration, 
                        Speed = v71.Water.Speed.Max, 
                        ZOffset = v71.Water.ZOffset
                    }
                };
            end;
        end;
        if not l_Surface_0 then
            v62.Origin.Particle.Acceleration = Vector3.new();
            v62.Origin.Particle.Object.SpreadAngle = Vector2.new(180, 180);
            v62.Origin2.Particle.Object.SpreadAngle = Vector2.new(180, 180);
        end;
        for _ = 1, 10 do
            local v73 = l_Fishman_0.Assets.Wave:Clone();
            v73.CFrame = v52;
            v73.Beam.Width0 = 0;
            v73.Beam.Width1 = 0;
            v73.Beam.ZOffset = 0;
            v73.Tip.Position = Vector3.new();
            v73.Parent = l_Effects_0;
            table.insert(v63, v73);
        end;
        v67.Parent = l_Effects_0;
        v64.Parent = l_Effects_0;
        local v74 = l_Fishman_0.Particles.EnergyRing:Clone();
        v74.Size = v4.ScaleParticleSize(v74.Size.Keypoints, v53 / 2 * (l_Surface_0 and 1 or 1.5));
        v74.Lifetime = NumberRange.new(v57 * 0.65);
        v74.Parent = v62.Origin.Object;
        if v54 then
            local v75 = (l_CurrentCamera_0.CFrame.p - v52.p).Magnitude / (10 + v53 * 2.75);
            if v75 < 1 then
                local v76 = 1 - v75;
                v9({
                    RotationInfluence = Vector3.new(0, 0, 1, 0), 
                    Roughness = 8 * v76, 
                    Magnitude = 6 * v76, 
                    FadeIn = v57, 
                    FadeOut = v59
                });
            end;
        end;
        if l_Special_0 then
            coroutine.resume(coroutine.create(function() --[[ Line: 267 ]]
                -- upvalues: v6 (ref), v52 (copy), v53 (copy), v67 (copy), v57 (copy)
                for v77 = 1, 3 do
                    v6({
                        CFrame = v52, 
                        Scale = v53 * (0.075 + v77 / 6), 
                        Color = v67.Color, 
                        Duration = v57 * (0.65 + v77 / 9)
                    });
                    task.wait(0.15);
                end;
            end));
        end;
        for v78, v79 in next, v62 do
            v79.Object.Position = Vector3.new();
            if l_Special2_0 and v78 ~= "Origin" or not l_Special2_0 then
                v79.Particle.Object.Enabled = true;
                v79.Particle.Object.Rate = v79.Particle.Object.Rate / 90 * v53;
            end;
        end;
        local _ = v4.PlaySound(v62.Origin.Object, l_Fishman_0.Sounds.WaterPillarHit, {
            PlaybackSpeed = 1 / (v57 * 0.75)
        });
        table.insert(v10, {
            Origin = v52, 
            Scale = v53, 
            Shake = v54, 
            FadeIn = v57, 
            FadeOut = v59, 
            Lifetime = v58, 
            Special = l_Special_0, 
            Special2 = l_Special2_0, 
            Surface = l_Surface_0, 
            particles = v61, 
            attachments = v62, 
            waves = v63, 
            e_ring = v74, 
            crown = v64, 
            crown_mesh = l_Mesh_0, 
            CROWN_SCALE = v66, 
            blob = v67, 
            blob_mesh = l_Mesh_1, 
            BLOB_SCALE = v69, 
            Start = tick()
        });
        return;
    end;
end;