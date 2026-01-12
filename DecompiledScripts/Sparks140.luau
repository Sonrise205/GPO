return {
    start = function(_, v1) --[[ Line: 4 ]] --[[ Name: start ]]
        local l_rep_0 = v1.rep;
        local l_vel_0 = v1.vel;
        local l_cf_0 = v1.cf;
        if _G.checkRenderDistance(l_cf_0.p) == false then
            return;
        else
            local v5, v6, v7 = unpack(l_vel_0);
            local v8 = math.random(20, 75) / 100;
            local v9 = Instance.new("NumberValue", game.ReplicatedStorage);
            v9.Value = v8;
            local v10 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0);
            local v11 = {
                Value = 0
            };
            game:GetService("TweenService"):Create(v9, v10, v11):Play();
            _G.destroy(v9, 2);
            for _ = 1, l_rep_0 do
                local v13 = script.Spark:Clone();
                v13.Parent = workspace.Effects;
                v13.CFrame = l_cf_0;
                v13.Velocity = Vector3.new(math.random(-v5, v5), math.random(v6 / 1.25, v6), math.random(-v7, v7));
                v13.Size = v13.Size * v8;
                v13.Trail.WidthScale = NumberSequence.new(v8, 0);
                v9.Changed:Connect(function() --[[ Line: 32 ]]
                    -- upvalues: v13 (copy), v9 (copy)
                    v13.Trail.WidthScale = NumberSequence.new(v9.Value, 0);
                end);
                _G.destroy(v13, 2);
            end;
            return;
        end;
    end
};