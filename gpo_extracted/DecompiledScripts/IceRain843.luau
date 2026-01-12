return {
    start = function(_, v1, _, v3, _, v5, v6) --[[ Line: 3 ]] --[[ Name: start ]]
        if not _G.checkRenderDistance(v1.p) then
            return;
        else
            local v7 = script.kenTrain.spike:Clone();
            v7.CFrame = v1;
            v7.Size = v7.Size * v3;
            v7.Parent = workspace.Effects;
            local v8 = (v7.CFrame.p - v5).magnitude / 200 * (v3 / 2);
            local v9 = CFrame.new(v5, v7.CFrame.p) * CFrame.Angles(1.5707963267948966, 0, 0) * CFrame.new(0, -(v7.Size.Y / 2) + 1, 0);
            local v10 = script.kenTrain.Part:Clone();
            v10.CFrame = CFrame.new(v5, v5 + v6) * CFrame.Angles(0, 1.5707963267948966, 0);
            v10.Transparency = 1;
            local l_Y_0 = v7.Size.Y;
            v7.Attachment.Position = Vector3.new(0, l_Y_0 / 2 - 1, 0);
            _G.scaleParticle(v7.Attachment, v3);
            v7.a1.Position = Vector3.new(-v7.Size.X / 2, -l_Y_0 / 2, 0);
            v7.a2.Position = Vector3.new(v7.Size.X / 2, -l_Y_0 / 2, 0);
            v10.Parent = workspace.Effects;
            v10.Mesh.Scale = Vector3.new(0.1, 5 * v3, 5 * v3);
            _G.tween(v10, {
                v8 / 2, 
                Enum.EasingStyle.Linear, 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                Transparency = 0
            });
            _G.tween(v10.Mesh, {
                v8, 
                Enum.EasingStyle.Linear, 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                Scale = Vector3.new(0.10000000149011612, 0, 0, 0)
            });
            _G.destroy(v10, v8);
            _G.tween(v7, {
                v8, 
                Enum.EasingStyle.Linear, 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                CFrame = v9
            });
            task.delay(v8, function() --[[ Line: 30 ]]
                -- upvalues: v7 (copy)
                _G.PlaySound(v7, script.kenTrain.IcicleHitFloor, {
                    Pitch = math.random(90, 110) / 100
                });
                _G.customEmit(v7);
                _G.tween(v7, {
                    2, 
                    Enum.EasingStyle.Quad, 
                    Enum.EasingDirection.Out, 
                    0, 
                    false, 
                    0
                }, {
                    Transparency = 1
                });
                _G.destroy(v7, 2);
            end);
            return;
        end;
    end
};