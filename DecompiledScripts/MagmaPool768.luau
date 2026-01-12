return {
    start = function(_, v1) --[[ Line: 5 ]] --[[ Name: start ]]
        if _G.checkRenderDistance(v1.p) == false then
            return;
        else
            local v2 = CFrame.new(v1.p) * CFrame.new(math.random(-2, 2), 0, math.random(-2, 2));
            local v3 = Ray.new(v2.p, v2.UpVector * -10);
            local _, v5, v6 = _G.raycastWhitelist(v3, {
                workspace.Islands, 
                workspace.Env, 
                workspace.Ships
            });
            local v7 = script.ball:Clone();
            v7.CFrame = CFrame.new(v5, v5 + v6) * CFrame.Angles(1.5707963267948966, math.rad((math.random(-360, 360))), 0);
            local v8 = math.random(200, 800) / 50;
            v7.Size = Vector3.new(v8, 7, v8) / 2;
            v7.Parent = workspace.Effects;
            _G.tween(v7, {
                0.5, 
                "Back", 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                Size = Vector3.new(v8, math.random(100, 200) / 100, v8)
            });
            _G.tween(v7, {
                2, 
                "Smooth", 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                CFrame = v7.CFrame * CFrame.Angles(0, 1.5707963267948966, 0)
            });
            spawn(function() --[[ Line: 21 ]]
                -- upvalues: v7 (copy)
                task.wait(1);
                _G.tween(v7, {
                    0.5, 
                    "Smooth", 
                    Enum.EasingDirection.Out, 
                    0, 
                    false, 
                    0
                }, {
                    Size = Vector3.new(0, 0, 0, 0), 
                    Color = Color3.fromRGB(0, 0, 0)
                });
                _G.destroy(v7, 0.5);
            end);
            return;
        end;
    end
};