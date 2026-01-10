local v0 = {};
local v1 = require(game.ReplicatedStorage.Modules.LightningBolt);
local _ = require(game.ReplicatedStorage.Modules.LightningBolt.LightningSparks);
local _ = require(game.ReplicatedStorage.Modules.LightningBolt.LightningExplosion);
local _ = require(game.ReplicatedStorage.Modules.sBeat);
local function v9(v5, v6) --[[ Line: 7 ]] --[[ Name: particle ]]
    local l_v5_Descendants_0 = v5:GetDescendants();
    for v8 = 1, #l_v5_Descendants_0 do
        pcall(function() --[[ Line: 10 ]]
            -- upvalues: l_v5_Descendants_0 (copy), v8 (copy), v6 (copy)
            l_v5_Descendants_0[v8].Enabled = v6;
        end);
    end;
end;
local function _(v10, v11) --[[ Line: 15 ]] --[[ Name: attachment ]]
    local v12 = Instance.new("Attachment", workspace.Terrain);
    _G.destroy(v12, 5);
    if v11 then
        v12.Parent = v11;
    elseif typeof(v10) == "CFrame" then
        v12.WorldCFrame = v10;
    end;
    if typeof(v10) == "Vector3" then
        v12.Position = v10;
    end;
    return v12;
end;
v0.impact = function(v14, v15, v16, v17, _) --[[ Line: 29 ]]
    -- upvalues: v9 (copy), v1 (copy)
    _G.destroy(v14, 2);
    v9(v14, false);
    local v19 = script.Explosion:Clone();
    v19.CFrame = CFrame.new(v16, v16 + v17);
    v19.Parent = workspace.Effects;
    _G.destroy(v19, 10);
    _G.customEmit(v19.partone);
    task.wait(0.02);
    _G.customEmit(v19.parttwo);
    task.spawn(function() --[[ Line: 43 ]]
        -- upvalues: v16 (copy)
        _G.shakenear(v16, 150, 75, 100, -2);
    end);
    _G.PlaySound(v19, script.ex1);
    task.wait(0.4);
    _G.customEmit(v19.partthree);
    task.wait(0.1);
    task.wait(0.65);
    _G.PlaySound(v19, script.ex2);
    task.spawn(function() --[[ Line: 55 ]]
        -- upvalues: v19 (copy)
        local l_Character_0 = game.Players.LocalPlayer.Character;
        if l_Character_0 and l_Character_0:FindFirstChild("HumanoidRootPart") and (v19.Position - l_Character_0.HumanoidRootPart.Position).Magnitude <= 75 and (v19.CFrame:inverse() * l_Character_0.HumanoidRootPart.CFrame).Z < 0 then
            local v21 = script.Lighting.PesadoCC:Clone();
            local v22 = script.Lighting.pesadoblur:Clone();
            v21.Parent = game.Lighting;
            v22.Parent = game.Lighting;
            _G.destroy(v21, 3);
            _G.destroy(v22, 3);
            _G.tween(v21, {
                0.2, 
                "EntranceProductive", 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                Brightness = 0.2, 
                Contrast = 1, 
                Saturation = -1
            });
            _G.tween(v22, {
                0.3, 
                "EntranceProductive", 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                Size = 9
            });
            task.wait(0.2);
            _G.tween(v21, {
                0.3, 
                "EntranceProductive", 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                Contrast = -0.45
            });
            task.wait(1);
            _G.tween(v21, {
                1, 
                "EntranceProductive", 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                Brightness = 0, 
                Contrast = 0, 
                Saturation = 0
            });
            _G.tween(v22, {
                1, 
                "EntranceProductive", 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                Size = 0
            });
        end;
    end);
    _G.tween(v19.PointLight, {
        0.25, 
        "Quad", 
        Enum.EasingDirection.Out, 
        0, 
        false, 
        0
    }, {
        Range = 120, 
        Brightness = 0
    });
    task.spawn(function() --[[ Line: 77 ]]
        -- upvalues: v19 (copy), v1 (ref)
        for _ = 1, 20 do
            local v24 = math.random(0, 360);
            local _ = math.random(100, 200) / 100;
            local v26 = v19.CFrame * CFrame.Angles(math.rad((math.random(-360, 360))), math.rad((math.random(-360, 360))), (math.rad((math.random(-360, 360))))) * CFrame.new(0, 0, math.random(10, 15));
            local l_v26_0 = v26;
            local v28 = Instance.new("Attachment", workspace.Terrain);
            _G.destroy(v28, 5);
            if typeof(l_v26_0) == "CFrame" then
                v28.WorldCFrame = l_v26_0;
            end;
            if typeof(l_v26_0) == "Vector3" then
                v28.Position = l_v26_0;
            end;
            local l_v28_0 = v28;
            l_v26_0 = v26 * CFrame.Angles(math.rad(v24), math.rad(v24), (math.rad(v24)));
            local v30 = v26 * CFrame.Angles(math.rad(v24), math.rad(v24), (math.rad(v24)));
            local v31 = Instance.new("Attachment", workspace.Terrain);
            _G.destroy(v31, 5);
            if typeof(v30) == "CFrame" then
                v31.WorldCFrame = v30;
            end;
            if typeof(v30) == "Vector3" then
                v31.Position = v30;
            end;
            v28 = v31;
            v30 = math.random(250, 750) / 1000;
            v31 = math.random(750, 1100) / 10;
            _G.tween(v28, {
                math.random(200, 1000) / 1000, 
                "Quad", 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                WorldCFrame = l_v26_0 * CFrame.new(0, v31, 0)
            });
            local v32 = v1.new(l_v28_0, v28, 15);
            local v33 = 0;
            local v34 = math.random(-50, 50);
            v32.CurveSize0 = v33;
            v32.CurveSize1 = v34;
            v32.PulseSpeed = math.random(4, 10);
            v32.AnimationSpeed = math.random(6, 20);
            v32.PulseLength = math.random(3, 8);
            v32.FadeLength = math.random(100, 500) / 1000;
            v32.Thickness = math.random(100, 400) / 100;
            v32.Color = Color3.fromRGB(148, 121, 255);
            v32.Frequency = math.random(1, 25) / 50;
            v32.MinThicknessMultiplier = 0.1;
            v32.MaxThicknessMultiplier = 1;
            v32.MinRadius = 0;
            v32.MaxRadius = math.random(30, 70);
            v32.ContractFrom = 0.1;
        end;
    end);
    v19.final["35"].Color = ColorSequence.new(v15.Color);
    _G.customEmit(v19.final);
    _G.PlayEffect("GroundRocks2", nil, CFrame.new(v19.CFrame.p), 35, 65, 6, 0.1, 5);
    local v35 = script.Part:Clone();
    v35.Material = Enum.Material.ForceField;
    v35.Anchored = true;
    v35.Color = Color3.fromRGB(0, 0, 0);
    v35.CFrame = v19.CFrame;
    v35.Parent = workspace.Effects;
    v35.Mesh.Scale = Vector3.new(75, 75, 75, 0);
    _G.tween(v35.Mesh, {
        0.3, 
        "Quad", 
        Enum.EasingDirection.Out, 
        0, 
        false, 
        0
    }, {
        Scale = Vector3.new(150, 150, 150, 0)
    });
    _G.tween(v35, {
        0.3, 
        "Quad", 
        Enum.EasingDirection.Out, 
        0, 
        false, 
        0
    }, {
        Transparency = 1
    });
    _G.destroy(v35, 0.3);
    local v36 = script.invert:Clone();
    v36.CFrame = v19.CFrame;
    v36.Size = Vector3.new(100, 100, 100, 0);
    v36.Parent = workspace.Effects;
    _G.tween(v36, {
        0.35, 
        "Sine", 
        Enum.EasingDirection.Out, 
        0, 
        false, 
        0
    }, {
        Size = Vector3.new(200, 200, 200, 0), 
        Transparency = 1
    });
    _G.destroy(v36, 0.35);
    local v37 = v19.CFrame * CFrame.Angles(-1.5707963267948966, 0, 0) * CFrame.new(0, 5, 0);
    _G.PlayEffect("Shockwave2", nil, v37 * CFrame.new(0, -5, 0), v37, BrickColor.new("White"), Vector3.new(187.5, 7.5, 187.5, 0), Vector3.new(62.5, 2.5, 62.5, 0), 0.5, 0, Enum.EasingStyle.Quad, Color3.fromRGB(0, 0, 0), Enum.Material.Neon, "Rings");
    _G.PlayEffect("meshShock", nil, v19.CFrame, 175, 2);
    _G.shakenear(v36.Position, 175, 120, 175, -0.8);
end;
local v38 = {};
v0.move = function(v39, v40) --[[ Line: 162 ]]
    -- upvalues: v38 (copy), v1 (copy)
    if _G.checkRenderDistance(v40.Position) == false then
        return;
    else
        if v38[v39] == nil then
            v38[v39] = {
                v40, 
                CFrame.new()
            };
        end;
        local v41 = v38[v39][1];
        if (v41.p - v40.p).magnitude <= 5 then
            return;
        else
            local _ = math.random(100, 200) / 100;
            local l_CFrame_0 = v39.CFrame;
            local v44 = Instance.new("Attachment", workspace.Terrain);
            _G.destroy(v44, 5);
            if v39 then
                v44.Parent = v39;
            elseif typeof(l_CFrame_0) == "CFrame" then
                v44.WorldCFrame = l_CFrame_0;
            end;
            if typeof(l_CFrame_0) == "Vector3" then
                v44.Position = l_CFrame_0;
            end;
            local l_v44_0 = v44;
            local l_s_0 = s;
            local v47 = Instance.new("Attachment", workspace.Terrain);
            _G.destroy(v47, 5);
            if typeof(l_s_0) == "CFrame" then
                v47.WorldCFrame = l_s_0;
            end;
            if typeof(l_s_0) == "Vector3" then
                v47.Position = l_s_0;
            end;
            v44 = v47;
            l_s_0 = math.random(250, 750) / 1000;
            v44.WorldCFrame = l_CFrame_0 * CFrame.new(math.random(-300, 300) / 100, math.random(-200, 200) / 100, 0);
            v47 = v1.new(l_v44_0, v44, 25);
            local v48 = 0;
            local v49 = 0;
            v47.CurveSize0 = v48;
            v47.CurveSize1 = v49;
            v47.PulseSpeed = math.random(15, 50);
            v47.AnimationSpeed = math.random(15, 20);
            v47.PulseLength = math.random(1, 3);
            v47.FadeLength = 0.1;
            v47.Thickness = math.random(100, 400) / 500;
            v47.Color = Color3.fromRGB(148, 121, 255);
            v47.Frequency = math.random(10, 50) / 100;
            v47.MinThicknessMultiplier = 0.1;
            v47.MaxThicknessMultiplier = 1;
            v47.MinRadius = 0;
            v47.MaxRadius = math.random(5, 10);
            v47.ContractFrom = 0.5;
            if (v38[v39][2].p - v40.p).magnitude >= 60 then
                v48 = v40 * CFrame.Angles(0, 0, 1.5707963267948966);
                v38[v39][2] = v48;
            end;
            v48 = script.Part2:Clone();
            v49 = (v41.p - v40.p).magnitude;
            v48.Mesh.Scale = Vector3.new(0, v49, 0);
            v48.CFrame = CFrame.new(v41.p, v40.p) * CFrame.Angles(1.5707963267948966, 0, 0) * CFrame.new(0, -v49 / 2, 0);
            v48.Mesh.Scale = Vector3.new(1, v49, 1);
            v48.Parent = workspace.Effects;
            _G.tween(v48.Mesh, {
                0.25, 
                "EntranceProductive", 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                Scale = Vector3.new(0, v49, 0)
            });
            _G.destroy(v48, 0.25);
            v38[v39][1] = v40;
            return;
        end;
    end;
end;
v0.splash = function(v50, _) --[[ Line: 226 ]]
    local l_v50_Descendants_0 = v50:GetDescendants();
    for v53 = 1, #l_v50_Descendants_0 do
        if l_v50_Descendants_0[v53]:IsA("ParticleEmitter") then
            l_v50_Descendants_0[v53].Enabled = false;
        end;
    end;
    _G.destroy(v50, 2);
    v50.Parent = workspace.Effects;
    Instance.new("BoolValue", v50).Name = "FinishHit";
end;
v0.Fire = function(_, _, v56) --[[ Line: 240 ]] --[[ Name: Fire ]]
    v56.throw:Play();
    _G.PlayEffect("FloorTrail", nil, v56, nil, Color3.fromRGB(213, 104, 14), Color3.fromRGB(0, 0, 0), 1, 0.25, 15);
end;
return v0;