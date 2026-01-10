return {
    start = function(_, v1, _, v3, v4) --[[ Line: 4 ]] --[[ Name: start ]]
        v3.back.Enabled = false;
        v3.back:Clear();
        v3.back2.Enabled = false;
        v3.back2:Clear();
        local v5 = math.random(8, 15);
        v3.Smoke.Size = NumberSequence.new(v5);
        v3.Smoke.Color = ColorSequence.new(v4.Color);
        v3.Smoke:Emit(25);
        v3.BurningPart.Transparency = NumberSequence.new(0);
        local v6 = script.dust:Clone();
        v6.Parent = workspace.Effects;
        v6.CFrame = v3.CFrame;
        v6.Attachment.Rocks.Color = ColorSequence.new(v4.Color);
        v6.Attachment.Rocks:Emit(35);
        _G.destroy(v6, 2);
        _G.tween(v6.PointLight, {
            0.25, 
            "Quad", 
            Enum.EasingDirection.Out, 
            0, 
            false, 
            0
        }, {
            Range = 40, 
            Brightness = 0
        });
        for _ = 1, 10 do
            local v8 = script.sphere:Clone();
            v8.Parent = workspace.Effects;
            v8.CFrame = v1;
            local v9 = math.random(150, 300) / 100;
            v8.Mesh.Scale = Vector3.new(v9, v9, v9);
            _G.tween(v8, {
                0.35, 
                Enum.EasingStyle.Quad, 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                CFrame = v8.CFrame * CFrame.new(math.random(-3000, 3000) / 100, math.random(-3000, 3000) / 100, math.random(-3000, 3000) / 100)
            });
            _G.tween(v8.Mesh, {
                0.35, 
                Enum.EasingStyle.Quad, 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                Scale = Vector3.new(0, 0, 0, 0)
            });
            _G.destroy(v8, 0.35);
            local v10 = script.sphere:Clone();
            v10.Parent = workspace.Effects;
            v10.CFrame = v1;
            v10.Color = Color3.fromRGB(255, 89, 89);
            local v11 = math.random(250, 500) / 100;
            v10.Mesh.Scale = Vector3.new(v11, v11, v11);
            _G.tween(v10, {
                0.35, 
                Enum.EasingStyle.Quad, 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                CFrame = v10.CFrame * CFrame.new(math.random(-3000, 3000) / 100, math.random(-3000, 3000) / 100, math.random(-3000, 3000) / 100)
            });
            _G.tween(v10.Mesh, {
                0.35, 
                Enum.EasingStyle.Quad, 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                Scale = Vector3.new(0, 0, 0, 0)
            });
            _G.destroy(v10, 0.35);
        end;
    end
};