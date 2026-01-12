local _ = game:GetService("RunService");
local _ = workspace:WaitForChild("Effects");
local _ = game:GetService("TweenService");
local v3 = require(game:GetService("ReplicatedStorage"):WaitForChild("Util").Misc);
local l_Phoenix_0 = game:GetService("ReplicatedStorage"):WaitForChild("Phoenix");
local v5 = require(l_Phoenix_0.Effects.Flare);
local v6 = require(game:GetService("ReplicatedStorage").Util.ShakeCamera);
local l_CurrentCamera_0 = workspace.CurrentCamera;
return function(v8, v9, v10, v11) --[[ Line: 13 ]]
    -- upvalues: l_CurrentCamera_0 (copy), v3 (copy), l_Phoenix_0 (copy), v6 (copy), v5 (copy)
    local v12 = v8 or CFrame.new();
    local v13 = math.min(15, v9 or 10);
    local v14 = v10 or 1;
    local function _(v15, v16) --[[ Line: 18 ]] --[[ Name: CanRender ]]
        -- upvalues: l_CurrentCamera_0 (ref), v13 (copy)
        local v17 = v15 or Vector3.new();
        local v18 = v16 or 7;
        return (l_CurrentCamera_0.CFrame.p - v17).Magnitude < v18 * 5 + v13 * v18;
    end;
    local v20 = v12.p or Vector3.new();
    if not ((l_CurrentCamera_0.CFrame.p - v20).Magnitude < 35 + v13 * 7) then
        return;
    else
        local v21 = if v11 then v3.PlaySound(v12, l_Phoenix_0.Sounds["Audio/PhoUltFinalHit"], {
            PlaybackSpeed = 1 / v14
        }) else v3.PlaySound(v12, l_Phoenix_0.Sounds["Audio/PhoUltHit1"], {
            PlaybackSpeed = 1.25
        });
        v20 = (l_CurrentCamera_0.CFrame.p - v12.p).Magnitude / (v13 * 2.75 + 25);
        if v20 < 1 then
            local v22 = 1 - v20;
            v6({
                RotationInfluence = Vector3.new(0, 0, 1, 0), 
                Roughness = 8 * v22, 
                Magnitude = 6 * v22, 
                FadeIn = v14 * 2, 
                FadeOut = v14 * 0.75
            });
        end;
        v21 = Instance.new("Attachment", workspace.Terrain);
        v21.CFrame = v12;
        local v23 = l_Phoenix_0.Particles.Hit:Clone();
        v23.ZOffset = v13 * 0.1;
        v23.Lifetime = NumberRange.new(v14);
        v23.Size = v3.ScaleParticleSize(v23.Size.Keypoints, v13 * 1.125);
        v23.Parent = v21;
        v20 = l_Phoenix_0.Particles.Hit2:Clone();
        v20.ZOffset = v13 * 0.1;
        v20.Lifetime = NumberRange.new(v14);
        v20.Size = v3.ScaleParticleSize(v20.Size.Keypoints, v13 * 1.125);
        v20.Parent = v21;
        v23:Emit(1);
        v20:Emit(1);
        local v24 = script.Part.Attachment:Clone();
        v24.Parent = workspace.Terrain;
        v24.CFrame = v12;
        local l_v24_Children_0 = v24:GetChildren();
        for v26 = 1, #l_v24_Children_0 do
            l_v24_Children_0[v26]:Emit(15);
        end;
        v5(v12, Color3.fromRGB(255, 170, 0), v13, math.min(12, v13 * 0.5), v13 * 0.75, v13 * 1.25, v14 * 0.5, v14 * v14 * 0.25);
        task.wait(v14 + 1);
        v24:Destroy();
        v21:Destroy();
        return;
    end;
end;