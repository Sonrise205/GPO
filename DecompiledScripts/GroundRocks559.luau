local v0 = {};
local _ = game:GetService("TweenService");
v0.start = function(_, v3, v4, v5, v6, v7, v8) --[[ Line: 4 ]] --[[ Name: start ]]
    local v9 = CFrame.new(v3.Position);
    if _G.checkRenderDistance(v9.p) == false then
        return;
    else
        v6 = math.floor(v6);
        v9 = v9 * CFrame.Angles(0, math.rad((math.random(-360, 360))), 0);
        for v10 = 1, v6 do
            local v11 = script.Part:Clone();
            v11.CFrame = v9 * CFrame.Angles(0, math.rad(360 / v6 * v10), 0);
            v11.CFrame = v11.CFrame * CFrame.new(0, -v5 / 2, 0);
            local _ = v11.CFrame * CFrame.new(0, 2, -10);
            local v13 = v11.CFrame * CFrame.new(0, 2, -v4) * CFrame.Angles(math.rad((math.random(-360, 360))), math.rad((math.random(-360, 360))), (math.rad((math.random(-360, 360)))));
            _G.destroy(v11, v7 + 1);
            local v14 = {
                0.25, 
                Enum.EasingStyle.Exponential, 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            };
            local v15 = Ray.new(v13.p + Vector3.new(0, 10, 0, 0), CFrame.new(v13.p).UpVector * -20);
            local v16, v17 = _G.raycastWhitelist(v15, {
                workspace.Islands, 
                workspace.Ships, 
                workspace.Env
            });
            if v16 then
                _G.matchMaterial(v11, v16);
                v13 = CFrame.new(v17) * CFrame.Angles(math.rad((math.random(-360, 360))), math.rad((math.random(-360, 360))), (math.rad((math.random(-360, 360)))));
                v11.Parent = workspace.Effects;
                if v8 == nil then
                    _G.tween(v11, v14, {
                        CFrame = v13
                    });
                    _G.tween(v11.Mesh, v14, {
                        Scale = Vector3.new(v5, v5, v5) * (math.random(50, 100) / 100)
                    });
                else
                    v11.CFrame = v13;
                    v11.Mesh.Scale = Vector3.new(v5, v5, v5) * (math.random(50, 100) / 100);
                end;
                task.spawn(function() --[[ Line: 34 ]]
                    -- upvalues: v8 (copy), v16 (copy), v11 (copy), v7 (copy)
                    if v8 == nil then
                        task.wait(0.25);
                    end;
                    local v18 = nil;
                    if v16:IsDescendantOf(workspace.Env) == false and v16.Anchored == false then
                        v18 = Instance.new("Weld", v11);
                        v18.C0 = v16.CFrame:inverse() * v11.CFrame;
                        v18.Part0 = v16;
                        v18.Part1 = v11;
                        v11.Anchored = false;
                    end;
                    task.spawn(function() --[[ Line: 46 ]]
                        -- upvalues: v7 (ref), v11 (ref), v18 (ref)
                        task.wait(v7);
                        if v11 and v11:FindFirstChild("Mesh") == nil then
                            v11:Destroy();
                            return;
                        else
                            _G.tween(v11.Mesh, {
                                0.5, 
                                Enum.EasingStyle.Quad, 
                                Enum.EasingDirection.Out, 
                                0, 
                                false, 
                                0
                            }, {
                                Scale = Vector3.new(0, 0, 0, 0)
                            });
                            if v18 == nil then
                                _G.tween(v11, {
                                    0.5, 
                                    Enum.EasingStyle.Quad, 
                                    Enum.EasingDirection.Out, 
                                    0, 
                                    false, 
                                    0
                                }, {
                                    CFrame = CFrame.new(v11.CFrame.p) * CFrame.new(0, -v11.Size.X, 0)
                                });
                            end;
                            _G.destroy(v11, 1);
                            return;
                        end;
                    end);
                end);
            else
                v11:Destroy();
            end;
        end;
        return;
    end;
end;
return v0;