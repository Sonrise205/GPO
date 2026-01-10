local v0 = {};
local v1 = require(game.ReplicatedStorage.Modules.FastWait);
v0.start = function(_, v3, v4, v5, v6, v7, v8, v9) --[[ Line: 5 ]] --[[ Name: start ]]
    -- upvalues: v1 (copy)
    if _G.checkRenderDistance(v3.p) == false then
        return;
    else
        v4 = math.floor(v4);
        local v10 = 360 / v4;
        local v11 = 6.283185307179586 * v5 / v4 * 1.1;
        local v12 = Instance.new("Model", workspace.Effects);
        _G.destroy(v12, v8 + 0.25);
        local v13 = {};
        local v14 = {};
        local v15 = nil;
        v3 = v3 * CFrame.Angles(0, math.random(-360, 360), 0);
        for v16 = 1, v4 do
            local v17 = script.Part:Clone();
            local v18 = v3 * CFrame.Angles(0, math.rad(v16 * v10), 0) * CFrame.new(0, 0, v5) * CFrame.Angles(0.7853981633974483, 0, 0);
            local v19 = v6 * math.random(50, 120) / 100;
            v17.Size = Vector3.new(v11, v19, v19);
            local v20 = 5 + v6 * 2;
            local v21 = CFrame.new(v18.Position) * CFrame.new(0, v20, 0);
            if v9 ~= nil then
                v21 = v18 * CFrame.new(0, v20, 0);
            end;
            local v22 = Ray.new(v21.p, v21.upVector * (-v20 * 2));
            local v23, v24, v25 = _G.raycastWhitelist(v22, {
                workspace.Islands, 
                workspace.Ships, 
                workspace.Env
            });
            do
                local l_v18_0 = v18;
                if v23 then
                    _G.matchMaterial(v17, v23);
                    local l_magnitude_0 = (l_v18_0.Position - v24).magnitude;
                    local v28 = 1;
                    if l_v18_0.Position.Y > v24.Y then
                        v28 = -1;
                    end;
                    l_v18_0 = l_v18_0 * CFrame.new(0, l_magnitude_0 * v28, 0);
                    local v29 = v3 * CFrame.Angles(0, math.rad(v16 * v10), 0) * CFrame.new(0, 0, v5 / 2);
                    v17.CFrame = v3 * CFrame.Angles(0, math.rad(v16 * v10), 0) * CFrame.new(0, 0, v5 / 2);
                    v17.Parent = v12;
                    if v16 == 1 then
                        v15 = v17.CFrame;
                    end;
                    l_v18_0 = CFrame.new(v24, v24 + v25) * CFrame.Angles(1.5707963267948966, 0, 0);
                    table.insert(v13, v16, v17);
                    table.insert(v14, v16, v29);
                    task.spawn(function() --[[ Line: 52 ]]
                        -- upvalues: v3 (ref), l_v18_0 (ref), v17 (copy), v7 (copy), v1 (ref), v8 (copy), v6 (copy)
                        local v30, v31, v32 = v3:components();
                        local _, _, _, v36, v37, v38, v39, v40, v41, v42, v43, v44 = l_v18_0:components();
                        local v45 = CFrame.new(v30, v31, v32, v36, v37, v38, v39, v40, v41, v42, v43, v44);
                        l_v18_0 = CFrame.new(l_v18_0.Position, v45.p) * CFrame.Angles(math.rad((math.random(20, 50))), 0, 0);
                        _G.tween(v17, {
                            v7, 
                            "EntranceExpressive", 
                            Enum.EasingDirection.Out, 
                            0, 
                            false, 
                            0
                        }, {
                            CFrame = l_v18_0
                        });
                        v1(v8);
                        if v17 then
                            _G.tween(v17.Mesh, {
                                0.25, 
                                Enum.EasingStyle.Quad, 
                                Enum.EasingDirection.Out, 
                                0, 
                                false, 
                                0
                            }, {
                                Scale = Vector3.new(1, 0, 0, 0)
                            });
                            _G.tween(v17, {
                                0.25, 
                                Enum.EasingStyle.Quad, 
                                Enum.EasingDirection.Out, 
                                0, 
                                false, 
                                0
                            }, {
                                CFrame = l_v18_0 * CFrame.new(0, -v6 * 1.25, 0)
                            });
                        end;
                    end);
                else
                    v17:Destroy();
                end;
            end;
        end;
        return;
    end;
end;
return v0;