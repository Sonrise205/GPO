local v0 = {};
local _ = require(game.ReplicatedStorage.Refrences.Fishman.Modules.SpikyFoam);
local function v4(v2) --[[ Line: 5 ]] --[[ Name: change ]]
    local v3 = v2:Clone();
    v2.Enabled = false;
    v3.Parent = v2.Parent;
    v3.Enabled = false;
    v3.Lifetime = NumberRange.new(0.25, 0.5);
    v3.Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 10, 5), 
        NumberSequenceKeypoint.new(1, 0, 0)
    });
    v3.Speed = NumberRange.new(50, 100);
    v3.Drag = 5;
    v3.SpreadAngle = Vector2.new(-360, 360);
    v3:Emit(40);
end;
v0.impact = function(v5, v6, _, _, _) --[[ Line: 19 ]]
    -- upvalues: v4 (copy)
    local v10 = require(script.Explode);
    v5.Anchored = true;
    v5.Parent = workspace.Effects;
    v4(v5.Attachment.BurningPart);
    v5.looped:Stop();
    v10:start(v5.CFrame, v5.CFrame, v5, v6);
    _G.tween(v5.PointLight, {
        0.25, 
        Enum.EasingStyle.Quad, 
        Enum.EasingDirection.Out, 
        0, 
        false, 
        0
    }, {
        Range = 50, 
        Brightness = 0
    });
    _G.destroy(v5, 2);
    local v11 = script.Explode.sphere:Clone();
    v11.Parent = workspace.Effects;
    v11.CFrame = v5.CFrame;
    v11.Material = Enum.Material.ForceField;
    v11.Transparency = -1;
    _G.tween(v11, {
        0.25, 
        Enum.EasingStyle.Quad, 
        Enum.EasingDirection.Out, 
        0, 
        false, 
        0
    }, {
        Transparency = 1
    });
    _G.tween(v11.Mesh, {
        0.25, 
        Enum.EasingStyle.Quad, 
        Enum.EasingDirection.Out, 
        0, 
        false, 
        0
    }, {
        Scale = Vector3.new(45, 45, 45, 0)
    });
    _G.destroy(v11, 0.25);
    _G.PlaySound(v11, script.ex);
end;
local v12 = {};
v0.move = function(v13, v14) --[[ Line: 45 ]]
    -- upvalues: v12 (copy)
    if _G.checkRenderDistance(v14.Position) == false then
        return;
    else
        if v12[v13] == nil then
            v12[v13] = {
                v14, 
                v14
            };
        end;
        local v15 = v12[v13][1];
        if (v15.p - v14.p).magnitude <= 5 then
            return;
        else
            local v16 = script.Part:Clone();
            local l_magnitude_0 = (v15.p - v14.p).magnitude;
            v16.Mesh.Scale = Vector3.new(0, l_magnitude_0, 0);
            v16.CFrame = CFrame.new(v15.p, v14.p) * CFrame.Angles(1.5707963267948966, 0, 0) * CFrame.new(0, -l_magnitude_0 / 2, 0);
            if (v12[v13][2].p - v14.p).magnitude >= 40 then
                local v18 = v16.CFrame * CFrame.Angles(3.141592653589793, 0, 0);
                _G.PlayEffect("Shockwave2", nil, v18, v18, BrickColor.new("White"), Vector3.new(15, 1, 15, 0), Vector3.new(0, 1, 0, 0), 0.25, 0, Enum.EasingStyle.Quad, Color3.fromRGB(255, 255, 255), Enum.Material.Neon, "Rings");
                v12[v13][2] = v18;
            end;
            v16.Mesh.Scale = Vector3.new(3, l_magnitude_0, 3);
            v16.Parent = workspace.Effects;
            _G.tween(v16.Mesh, {
                0.25, 
                "EntranceProductive", 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                Scale = Vector3.new(0, l_magnitude_0, 0)
            });
            _G.tween(v16, {
                0.25, 
                "EntranceProductive", 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                Color = BrickColor.new("Persimmon").Color
            });
            _G.destroy(v16, 0.25);
            v12[v13][1] = v14;
            return;
        end;
    end;
end;
v0.splash = function(v19, v20) --[[ Line: 80 ]]
    local l_v19_Descendants_0 = v19:GetDescendants();
    for v22 = 1, #l_v19_Descendants_0 do
        if l_v19_Descendants_0[v22]:IsA("ParticleEmitter") then
            l_v19_Descendants_0[v22].Enabled = false;
        end;
    end;
    _G.destroy(v19, 2);
    v19.Parent = workspace.Effects;
    Instance.new("BoolValue", v19).Name = "FinishHit";
    local v23 = script.smoke:Clone();
    v23.Parent = workspace.Effects;
    v23.CFrame = v20;
    v23.Attachment.sm2:Emit(35);
    _G.destroy(v23, 2);
end;
v0.Fire = function(_, _, v26) --[[ Line: 99 ]] --[[ Name: Fire ]]
    v26.looped:Play();
end;
return v0;