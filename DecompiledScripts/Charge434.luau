local l_RunService_0 = game:GetService("RunService");
local l_Effects_0 = workspace:WaitForChild("Effects");
local v2 = require(game.ReplicatedStorage.Util.Tween);
local v3 = require(game:GetService("ReplicatedStorage"):WaitForChild("Util").Misc);
local l_Phoenix_0 = game:GetService("ReplicatedStorage"):WaitForChild("Phoenix");
local v5 = require(l_Phoenix_0.Modules.Slash);
local _ = require(l_Phoenix_0.Effects.Shockwave);
local v7 = require(l_Phoenix_0.Effects.Flare);
local v8 = require(game:GetService("ReplicatedStorage").Util.ShakeCamera);
local l_CurrentCamera_0 = workspace.CurrentCamera;
return function(v10, v11, v12, v13, v14) --[[ Line: 15 ]]
    -- upvalues: l_Phoenix_0 (copy), v3 (copy), l_Effects_0 (copy), v7 (copy), v2 (copy), l_CurrentCamera_0 (copy), v8 (copy), v5 (copy), l_RunService_0 (copy)
    local v15 = v12 or 10;
    if not v13 then
        local _ = Color3.fromRGB(255, 170, 0);
    end;
    local v17 = v14 or 0.5;
    local l_CFrame_0 = v10.CFrame;
    local l_Part_0 = Instance.new("Part");
    local v20 = true;
    local v21 = false;
    l_Part_0.Anchored = v20;
    l_Part_0.CanCollide = v21;
    l_Part_0.Size = Vector3.new(1, 1, 1, 0) * v15;
    l_Part_0.Transparency = 1;
    l_Part_0.CFrame = l_CFrame_0;
    v20 = Instance.new("Attachment", l_Part_0);
    v20.Position = Vector3.new(0, -l_Part_0.Size.Y / 2, 0);
    v21 = script.dust.Attachment:Clone();
    v21.Position = Vector3.new(0, -l_Part_0.Size.Y / 3, 0);
    v21.Parent = l_Part_0;
    local v22 = {};
    local v23 = {};
    for v24 = 1, 2 do
        local v25 = v24 == 1 and 1.25 or 1.5;
        local v26 = l_Phoenix_0.Particles["Flame" .. v24]:Clone();
        v23[v26] = v26.Size.Keypoints;
        v26.Rate = math.min(200, v15 * 8);
        v26.Size = v3.ScaleParticleSize(v23[v26], v15 * 0.35);
        v26.Drag = v15 * 0.5;
        v26.ZOffset = 1;
        v26.Speed = NumberRange.new(v15 * 2 * v25, v15 * 8 * v25);
        v26.Parent = v20;
        table.insert(v22, v26);
    end;
    l_Part_0.Parent = l_Effects_0;
    for _, v28 in next, v22 do
        v28.Enabled = true;
    end;
    v7(l_Part_0.CFrame, Color3.fromRGB(255, 170, 0), v15 * 1.5, math.min(12, v15 * 0.5), v15 * 0.5, v15 * 0.75, v17 * 0.5, v17 * 0.25);
    local _ = v3.PlaySound(l_Part_0, l_Phoenix_0.Sounds["Audio/PhoUltWhoosh1"]);
    local v30 = tick();
    local v31 = 0;
    local v32 = 0;
    local v33 = nil;
    while v10 and v10.Parent and v11 and v11.Value do
        local v34 = tick();
        local v35 = math.min(1, (v34 - v30) / 5);
        if v11.Value then
            local l_CFrame_1 = v10.CFrame;
            local v37 = v2.point(v15, v15 * 2, v35);
            local v38 = v17 * v2.point(1, 0.75, v35);
            l_Part_0.Size = Vector3.new(1, 1, 1, 0) * v37;
            l_Part_0.CFrame = l_CFrame_1;
            for v39, v40 in next, v22 do
                local v41 = v39 == 1 and 1.25 or 1.5;
                local v42 = v23[v40];
                v40.Size = v3.ScaleParticleSize(v42, v37 * 0.2);
                v40.Rate = math.min(360, v37 * 5);
                v40.Drag = v37 * 0.75;
                v40.Speed = NumberRange.new(v37 * 8 * v41, v37 * 16 * v41);
            end;
            v21.Rocks.Speed = NumberRange.new(v37 * 8, v37 * 16);
            v21.sm2.Speed = NumberRange.new(v37 * 8, v37 * 16);
            local v43 = Ray.new(v21.WorldPosition + Vector3.new(0, 3, 0, 0), v21.WorldCFrame.upVector * -10);
            local v44, _, _ = _G.raycastWhitelist(v43, {
                workspace.Islands, 
                workspace.Env, 
                workspace.Ships
            });
            if v44 then
                v21.Rocks.Color = ColorSequence.new(v44.Color);
                v21.sm2.Color = v21.Rocks.Color;
            else
                v21.Rocks.Enabled = false;
                v21.sm2.Enabled = false;
            end;
            if v34 - v32 > v38 * 0.6 then
                local _ = v3.PlaySound(l_Part_0, l_Phoenix_0.Sounds["Audio/PhoUltStart"], {
                    PlaybackSpeed = 1 / v38
                });
                v32 = v34;
            end;
            if v38 < v34 - v31 then
                local v48 = (l_CurrentCamera_0.CFrame.p - l_CFrame_1.p).Magnitude / (25 + v37 * 2.75);
                if v48 < 1 then
                    local v49 = 1 - v48;
                    v8({
                        RotationInfluence = Vector3.new(0, 0, 1, 0), 
                        Roughness = 8 * v49, 
                        Magnitude = 6 * v49, 
                        FadeIn = v38 * 2, 
                        FadeOut = v38 * 0.5
                    });
                end;
                if v35 > 0.2 then
                    local v50 = v37 * 2 * 1.5;
                    local v51 = CFrame.new(0, -2.5, 0);
                    v5.new(8, {
                        Anchor = l_Part_0, 
                        Scale = v50, 
                        Color = Color3.fromRGB(0, 170, 255), 
                        Accent = Color3.fromRGB(255, 170, 0), 
                        Offset = v51, 
                        Transparency = 0.075, 
                        Duration = v38 * 0.75 * 1.5, 
                        RotationDirection = 3
                    }):Emit();
                end;
                if v35 > 0 then
                    v5.new(5, {
                        Anchor = l_Part_0, 
                        Scale = v37 * 1.5 * Random.new():NextNumber(0.75, 1.25), 
                        Color = Color3.fromRGB(0, 170, 255), 
                        Duration = v38, 
                        Transparency = 0, 
                        RotationDirection = (math.random(1, 2) == 1 and 1 or -1) * 2
                    }):Emit();
                end;
                if v35 > 0.15 then
                    v5.new(6, {
                        Anchor = l_Part_0, 
                        Scale = v37 * 1.75 * Random.new():NextNumber(1, 1.5), 
                        Offset = CFrame.new(0, math.random(-v37 / 2, -v37 / 4), 0), 
                        Transparency = 0, 
                        Color = Color3.fromRGB(213, 115, 61), 
                        Duration = v38 * 1.5, 
                        RotationDirection = (math.random(1, 2) == 1 and 1 or -1) * 2
                    }):Emit();
                end;
                v31 = v34;
            end;
            if not v33 then
                v33 = 0;
            end;
            if v35 > 0.05 and v34 - v33 > v38 * 0.65 then
                v33 = v34;
            end;
            l_RunService_0.RenderStepped:Wait();
        else
            break;
        end;
    end;
    for _, v53 in next, v22 do
        v53.Enabled = false;
    end;
    v21.Rocks.Enabled = false;
    v21.sm2.Enabled = false;
    task.wait(1 + v22[2].Lifetime.Max);
    l_Part_0:Destroy();
end;