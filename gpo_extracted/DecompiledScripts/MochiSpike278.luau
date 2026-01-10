local v0 = {};
local _ = _G.getHumanoid;
v0.impact = function(v2, v3, v4, _, v6) --[[ Line: 7 ]]
    if v3 then
        v2.shard.Color = ColorSequence.new(v3.Color);
        v2.flour.Color = ColorSequence.new(v3.Color);
        v2.flour2.Color = ColorSequence.new(v3.Color);
        v2.CFrame = CFrame.new(v4, v6.startpos) * CFrame.new(0, 0, -v2.Size.Y / 3) * CFrame.Angles(1.5707963267948966, math.rad((math.random(-360, 360))), 0);
        task.delay(0.1, function() --[[ Line: 16 ]]
            -- upvalues: v2 (copy)
            v2["0"]["2"].Enabled = false;
            v2["0"].Trail.Enabled = false;
            v2["01"]["2"].Enabled = false;
            _G.tween(v2, {
                1, 
                Enum.EasingStyle.Quad, 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                Transparency = 1
            });
        end);
        if v4.Y > workspace.Env.WaterStuff.Sand.Position.Y - 1 then
            v2.Anchored = false;
            local l_WeldConstraint_0 = Instance.new("WeldConstraint");
            l_WeldConstraint_0.Part0 = v3;
            l_WeldConstraint_0.Part1 = v2;
            l_WeldConstraint_0.Parent = v2;
        end;
        _G.Emit(v2, true);
        _G.PlaySound(v2, script.Sounds.HitGround:GetChildren()[math.random(1, 3)], {
            Pitch = math.random(90, 110) / 100
        });
    end;
    _G.destroy(v2.Parent, 3);
end;
v0.splash = function(v8, v9) --[[ Line: 41 ]]
    _G.clientimpacts[game.ReplicatedStorage.ClientImpacts.Splash]:start({
        obj = v8, 
        Strength = 25, 
        Size = 7, 
        cf = v9, 
        PSize = NumberSequence.new(2, 0)
    });
end;
v0.Fire = function(_, _, v12, v13) --[[ Line: 46 ]] --[[ Name: Fire ]]
    v12.Size = v12.Size * 0.75;
    v12.CFrame = v13;
    _G.PlaySound(v12.CFrame, script.Sounds.Shoot:GetChildren()[math.random(1, 3)]);
    _G.Emit(v12.Attachment, true);
end;
v0.whiz = function(v14) --[[ Line: 54 ]]
    if v14 == nil then
        return true;
    else
        return;
    end;
end;
return v0;