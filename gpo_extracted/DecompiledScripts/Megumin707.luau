local v0 = {};
local _ = require(game.ReplicatedStorage.Modules.FastWait);
v0.start = function(_, v3, v4, v5) --[[ Line: 4 ]] --[[ Name: start ]]
    if v5 == nil then
        v5 = 1;
    end;
    if v3 ~= "explosion" then
        local v6 = tick();
        local v7 = 0;
        repeat
            if tick() - v7 >= 0.02 then
                local v8 = Instance.new("Attachment", v3.MeguminStaff.Orb);
                local v9 = Instance.new("Attachment", v3.MeguminStaff.Orb);
                v9.Position = Vector3.new(math.random(-5, 5), math.random(-5, 5), math.random(-5, 5));
                local v10 = script.Beam:Clone();
                v10.Parent = v8.Parent;
                v10.Attachment0 = v8;
                v10.Attachment1 = v9;
                _G.tween(v9, {
                    0.25, 
                    "Smoother", 
                    Enum.EasingDirection.Out, 
                    0, 
                    false, 
                    0
                }, {
                    Position = Vector3.new(0, 0, 0, 0)
                });
                _G.destroy(v10, 0.25);
                _G.destroy(v8, 0.25);
                _G.destroy(v9, 0.25);
                v7 = tick();
            end;
            game["Run Service"].Heartbeat:Wait();
        until tick() - v6 >= 5;
    else
        _G.PlayEffect("GroundRocks2", nil, v4, 25 * v5, 45, 8, 0.25, 10);
        if v5 == 1 then
            local v11 = _G.PlaySound(v4, script.nuke);
            _G.tween(v11, {
                5, 
                "Quad", 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                Volume = 0
            });
        else
            local _ = _G.PlaySound(v4, script.TitanNukes:GetChildren()[math.random(1, 3)]);
        end;
        for v13 = 1, 15 do
            local v14 = script.exploson:Clone();
            v14.CFrame = v4;
            v14.Size = Vector3.new(0, 0, 0, 0);
            v14.Parent = workspace.Effects;
            local v15 = 15 * v5;
            local v16 = math.random(50, 80) * v5;
            local l_Color_0 = v14.Color;
            local v18 = 0.75;
            local _ = 0;
            local v20 = 200;
            if v13 % 2 == 1 then
                l_Color_0 = BrickColor.new("Black").Color;
                v18 = 1.25;
                v20 = 200 * v5;
            end;
            _G.tween(v14, {
                v18 * 4, 
                "EntranceExpressive", 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                CFrame = v14.CFrame * CFrame.new(math.random(-v15, v15), math.random(0, v20), math.random(-v15, v15)) * CFrame.Angles(math.rad((math.random(-360, 900))), math.rad((math.random(-360, 900))), (math.rad((math.random(-360, 900)))))
            });
            _G.tween(v14, {
                v18 * 1, 
                "Smoother", 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                Color = l_Color_0
            });
            _G.tween(v14, {
                v18 * 1.5, 
                "EntranceProductive", 
                Enum.EasingDirection.Out, 
                0, 
                true, 
                0
            }, {
                Size = Vector3.new(v16, v16, v16)
            });
            _G.destroy(v14, v18 * 4);
        end;
        local v21 = script.Part:Clone();
        v21.CFrame = v4;
        v21.Mesh.Scale = Vector3.new(25 * v5, 10000, 25 * v5);
        v21.Parent = workspace.Effects;
        _G.tween(v21.Mesh, {
            0.2, 
            "EntranceProductive", 
            Enum.EasingDirection.Out, 
            0, 
            false, 
            0
        }, {
            Scale = Vector3.new(0, 10000, 0, 0)
        });
        _G.tween(v21.PointLight, {
            0.2, 
            "EntranceProductive", 
            Enum.EasingDirection.Out, 
            0, 
            false, 
            0
        }, {
            Range = 500, 
            Brightness = 0
        });
        _G.destroy(v21, 0.2);
        _G.PlayEffect("Shockwave2", nil, v4 * CFrame.new(0, 120 * v5, 0), v4, BrickColor.new("White"), Vector3.new(125, 10, 125, 0) * v5, Vector3.new(5, 10, 5, 0) * v5, 1, 0, Enum.EasingStyle.Quad, Color3.fromRGB(255, 255, 255), Enum.Material.Neon, "Rings");
        _G.PlayEffect("Shockwave2", nil, v4 * CFrame.new(0, 10 * v5, 0), v4, BrickColor.new("White"), Vector3.new(250, 10, 250, 0) * v5, Vector3.new(75, 10, 75, 0) * v5, 2, 0, Enum.EasingStyle.Quad, Color3.fromRGB(255, 255, 255), Enum.Material.Neon, "Rings");
    end;
end;
return v0;