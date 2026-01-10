return {
    start = function(_, v1) --[[ Line: 5 ]] --[[ Name: start ]]
        local l_char_0 = v1.char;
        local l_cf_0 = v1.cf;
        if _G.checkRenderDistance(l_cf_0.p) == false then
            return;
        else
            _G.PlaySound(l_char_0.PrimaryPart, script.Sounds:GetChildren()[math.random(1, #script.Sounds:GetChildren())]);
            local v4 = math.abs(l_char_0.HumanoidRootPart.Velocity.Y / 100);
            if v4 >= 10 then
                v4 = 10;
            elseif v4 < 1 then
                v4 = 1;
            end;
            local v5 = script.SplashEffect:Clone();
            v5.Parent = workspace.Effects;
            v5:PivotTo(CFrame.new(l_cf_0.p.X, workspace.Env.WaterStuff.Falls.Position.Y, l_cf_0.p.Z));
            v5.Effect2.CFrame = v5.Effect2.CFrame * CFrame.Angles(0, math.random(-360, 360), 0) * CFrame.new(0, v4, 0);
            v5.Effect3.CFrame = v5.Effect3.CFrame * CFrame.Angles(0, math.random(-360, 360), 0) * CFrame.new(0, v4, 0);
            v5.Effect1.Transparency = 0.3;
            _G.tween(v5.Effect1, {
                0.625, 
                Enum.EasingStyle.Quad, 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                Size = Vector3.new(7.199999809265137, 0.1599999964237213, 7.199999809265137, 0) * v4, 
                Transparency = 1, 
                CFrame = v5.Effect1.CFrame * CFrame.new(0, 5 * v4, 0)
            });
            _G.tween(v5.Effect2, {
                0.5625, 
                Enum.EasingStyle.Quad, 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                Size = Vector3.new(9, 5, 9, 0) * v4, 
                Transparency = 1, 
                Color = script.SplashEffect.Effect2.Color, 
                CFrame = v5.Effect2.CFrame * CFrame.Angles(0, 45, 0)
            });
            _G.tween(v5.Effect3, {
                0.5625, 
                Enum.EasingStyle.Quad, 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                Size = Vector3.new(8, 9, 8, 0) * v4, 
                Transparency = 1, 
                Color = script.SplashEffect.Effect3.Color, 
                CFrame = v5.Effect3.CFrame * CFrame.Angles(0, 45, 0)
            });
            local v6 = v5.Effect1:Clone();
            v6.Parent = v5;
            v6.Transparency = 0;
            _G.tween(v6, {
                0.9375, 
                Enum.EasingStyle.Quad, 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                Size = Vector3.new(12, 0.20000000298023224, 12, 0) * v4, 
                Transparency = 1
            });
            _G.destroy(v5, 2);
            local v7 = script.Part:Clone();
            v7.Parent = workspace.Effects;
            v7.CFrame = v6.CFrame;
            v7.LavaFlow.Size = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 2 * v4, 0), 
                NumberSequenceKeypoint.new(0.7, 1.65 * v4, 0), 
                NumberSequenceKeypoint.new(1, 0, 0)
            });
            v7.LavaFlow.Speed = NumberRange.new(20 * v4, 30 * v4);
            v7.LavaFlow.Acceleration = Vector3.new(0, -50 * v4, 0);
            local v8 = v4 / 2;
            if v8 < 1 then
                v8 = 1;
            end;
            v7.LavaFlow:Emit(15 * v8);
            _G.destroy(v7, 1.1);
            return;
        end;
    end
};