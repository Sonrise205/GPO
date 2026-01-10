local v0 = {};
local _ = require(game.ReplicatedStorage.Refrences.Fishman.Modules.SpikyFoam);
local function v4(v2) --[[ Line: 5 ]] --[[ Name: change ]]
    local v3 = v2:Clone();
    v2.Enabled = false;
    v3.Parent = v2.Parent;
    v3.Enabled = false;
    v3.Lifetime = NumberRange.new(0.5, 1.5);
    v3.Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 10, 5), 
        NumberSequenceKeypoint.new(1, 0, 0)
    });
    v3.Speed = NumberRange.new(100, 200);
    v3.Drag = 5;
    v3.SpreadAngle = Vector2.new(-360, 360);
    v3:Emit(25);
end;
v0.impact = function(v5, v6, _, _, _) --[[ Line: 19 ]]
    -- upvalues: v4 (copy)
    local v10 = require(script.Explode);
    v5.sfx:Stop();
    v5.Anchored = true;
    v5.Parent = workspace.Effects;
    v5.FireExplosion:Play();
    v4(v5.BurningPart);
    v4(v5.Attachment.BurningPart);
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
end;
v0.splash = function(v11, v12) --[[ Line: 34 ]]
    local l_v11_Descendants_0 = v11:GetDescendants();
    for v14 = 1, #l_v11_Descendants_0 do
        if l_v11_Descendants_0[v14]:IsA("ParticleEmitter") then
            l_v11_Descendants_0[v14].Enabled = false;
        end;
    end;
    _G.destroy(v11, 2);
    v11.Parent = workspace.Effects;
    Instance.new("BoolValue", v11).Name = "FinishHit";
    local v15 = script.smoke:Clone();
    v15.Parent = workspace.Effects;
    v15.CFrame = v12;
    v15.Attachment.sm2:Emit(35);
    _G.destroy(v15, 2);
end;
v0.Fire = function(_, _, v18) --[[ Line: 52 ]] --[[ Name: Fire ]]
    v18.sfx:Play();
end;
return v0;