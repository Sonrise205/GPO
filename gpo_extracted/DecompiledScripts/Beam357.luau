return {
    start = function(_, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12) --[[ Line: 4 ]] --[[ Name: start ]]
        if _G.checkRenderDistance(v1.Position) == false then
            return;
        else
            local v13 = script.BeamShock:Clone();
            v13.Parent = workspace.Effects;
            v13.CFrame = v1;
            _G.destroy(v13, v4 + 0.1);
            local l_Attachment11_0 = v13.Attachment11;
            local l_Attachment21_0 = v13.Attachment21;
            l_Attachment11_0.Position = Vector3.new(0, v2 / 4, -v3 / 4);
            l_Attachment21_0.Position = Vector3.new(0, v2 / 4, v3 / 4);
            local v16 = v3 / 2;
            v13.Beam.CurveSize0 = -v16 / 4;
            v13.Beam.CurveSize1 = v16 / 4;
            v13.Beam.Width0 = v6;
            v13.Beam.Width1 = v7;
            if v5 then
                v13.Beam.Color = v5;
                v13.Beam2.Color = v5;
            end;
            if v12 then
                v13.Beam.TextureSpeed = v12;
                v13.Beam2.TextureSpeed = v12;
            end;
            if v9 then
                v13.Beam.Texture = v9;
                v13.Beam2.Texture = v9;
            end;
            if v11 then
                v13.Beam.TextureLength = v11;
                v13.Beam2.TextureLength = v11;
            end;
            if v10 then
                v13.Beam.Transparency = v10;
                v13.Beam2.Transparency = v10;
            end;
            if v8 then
                v13.Beam.LightEmission = v8;
                v13.Beam2.LightEmission = v8;
            end;
            v13.Beam.LightInfluence = 0;
            v13.Beam2.LightInfluence = 0;
            v13.Beam2.CurveSize0 = v16 / 4;
            v13.Beam2.CurveSize1 = -v16 / 4;
            v13.Beam2.Width0 = v6;
            v13.Beam2.Width1 = v7;
            _G.tween(l_Attachment11_0, {
                v4, 
                Enum.EasingStyle.Quad, 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                Position = Vector3.new(0, v2, -v3)
            });
            _G.tween(l_Attachment21_0, {
                v4, 
                Enum.EasingStyle.Quad, 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                Position = Vector3.new(0, v2, v3)
            });
            _G.tween(v13.Beam, {
                v4, 
                Enum.EasingStyle.Quad, 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                CurveSize0 = -v16, 
                CurveSize1 = v16, 
                Width0 = 0, 
                Width1 = 0
            });
            _G.tween(v13.Beam2, {
                v4, 
                Enum.EasingStyle.Quad, 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                CurveSize0 = v16, 
                CurveSize1 = -v16, 
                Width0 = 0, 
                Width1 = 0
            });
            return;
        end;
    end
};