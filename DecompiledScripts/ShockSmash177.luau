return {
    start = function(_, v1) --[[ Line: 4 ]] --[[ Name: start ]]
        local l_cf_0 = v1.cf;
        local l_char_0 = v1.char;
        if _G.checkRenderDistance(l_cf_0.p) == false then
            return;
        else
            local v4 = Ray.new(l_cf_0.p, l_cf_0.UpVector * -20);
            local v5, v6, _ = _G.raycastWhitelist(v4, {
                workspace.Env, 
                workspace.Ships, 
                workspace.Islands
            });
            if v5 then
                v6 = CFrame.new(v6);
                l_cf_0 = l_cf_0 * CFrame.new(0, -l_char_0.Humanoid.HipHeight / 2, -1);
                _G.PlayEffect("GroundRocks", nil, l_cf_0, math.random(15, 20), 4, 20, 2);
                local v8 = 15;
                v6 = v6.Position;
                local v9 = script.dust:Clone();
                v9.Parent = workspace.Effects;
                v9.CFrame = CFrame.new(v6);
                v9.Attachment.sm2.Color = ColorSequence.new(v5.Color);
                v9.Attachment.Rocks.Color = ColorSequence.new(v5.Color);
                v9.Attachment.sm2:Emit(40);
                v9.Attachment.Rocks:Emit(20);
                _G.destroy(v9, 3);
                local v10 = script.Part:Clone();
                v10.Parent = workspace.Effects;
                v10.CFrame = l_cf_0 * CFrame.Angles(-1.5707963267948966, 0, 0);
                _G.tween(v10.PointLight, {
                    0.25, 
                    Enum.EasingStyle.Quad, 
                    Enum.EasingDirection.Out, 
                    0, 
                    false, 
                    0
                }, {
                    Range = 75, 
                    Brightness = 0
                });
                _G.destroy(v10, 0.5);
                _G.PlaySound(l_char_0.Head, script.gauss_electro2);
                _G.PlaySound(l_char_0.Head, script.downsmash);
                _G.PlayEffect("Shockwave2", nil, l_cf_0 * CFrame.new(0, 50, 0), l_cf_0 * CFrame.new(0, 0, 0), BrickColor.new("Toothpaste"), Vector3.new(55, 0, 55, 0), Vector3.new(10, 2, 10, 0), 0.2, 0, Enum.EasingStyle.Quad, BrickColor.new("White").Color, Enum.Material.Neon, "Rings");
                _G.PlayEffect("Shockwave2", nil, l_cf_0, l_cf_0, BrickColor.new("Toothpaste"), Vector3.new(45, 0, 45, 0), Vector3.new(10, 2, 10, 0), 0.25, 0, Enum.EasingStyle.Quad, BrickColor.new("White").Color, Enum.Material.Neon, "Rings");
                for _ = 1, 10 do
                    local l_Color_0 = BrickColor.new("Cyan").Color;
                    if math.random(1, 2) == 1 then
                        l_Color_0 = BrickColor.new("Baby blue").Color;
                    end;
                    local v13 = {
                        color = l_Color_0, 
                        color2 = BrickColor.new("Baby blue").Color, 
                        ti = math.random(100, 400) / 1000, 
                        decay = math.random(100, 200) / 1000, 
                        bends = 2, 
                        fork_bends = 1, 
                        fork_chance = 0, 
                        transparency = 0.5, 
                        thickness = math.random(10, 75) / 200, 
                        max_depth = 50
                    };
                    _G.PlayEffect("Lightning", nil, v6, v6 + Vector3.new(math.random(-v8, v8), math.random(20, 65), math.random(-v8, v8)), v13);
                    game["Run Service"].Heartbeat:Wait();
                end;
                do
                    local l_v8_0 = v8;
                    task.spawn(function() --[[ Line: 59 ]]
                        -- upvalues: l_v8_0 (ref), v6 (ref)
                        l_v8_0 = 35;
                        for _ = 1, 10 do
                            local l_Color_1 = BrickColor.new("Cyan").Color;
                            if math.random(1, 2) == 1 then
                                l_Color_1 = BrickColor.new("Baby blue").Color;
                            end;
                            local v17 = {
                                color = l_Color_1, 
                                color2 = BrickColor.new("Baby blue").Color, 
                                ti = math.random(100, 200) / 1000, 
                                decay = math.random(100, 200) / 1000, 
                                bends = 2, 
                                fork_bends = 1, 
                                fork_chance = 0, 
                                transparency = 0.5, 
                                thickness = math.random(10, 75) / 200, 
                                max_depth = 50
                            };
                            local v18 = Vector3.new(math.random(-l_v8_0, l_v8_0), math.random(5, 10), math.random(-l_v8_0, l_v8_0));
                            _G.PlayEffect("Lightning", nil, v6 + v18 / 2, v6 + v18, v17);
                        end;
                    end);
                end;
            end;
            return;
        end;
    end
};