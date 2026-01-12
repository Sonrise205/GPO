return {
    start = function(_, v1) --[[ Line: 3 ]] --[[ Name: start ]]
        if _G.checkRenderDistance(v1.PrimaryPart.Position) == false then
            return;
        else
            local v2 = v1:Clone();
            v1:Destroy();
            local l_CFrame_0 = v2.PrimaryPart.CFrame;
            local l_Color_0 = v2.PrimaryPart.Color;
            l_Color_0 = nil;
            v2.PrimaryPart:BreakJoints();
            v2.PrimaryPart:Destroy();
            v1 = v2;
            v1.Parent = workspace.Effects;
            _G.destroy(v1, 2);
            _G.PlayEffect("BombExplosion", nil, l_CFrame_0, -5, 15, 0.25, 0.75, 300, 15, l_Color_0);
            local l_Children_0 = v1.Cracks:GetChildren();
            for v6 = 1, #l_Children_0 do
                l_Children_0[v6].Velocity = Vector3.new(math.random(-45, 45), math.random(60, 125), math.random(-45, 45));
                l_Children_0[v6].RotVelocity = Vector3.new(math.random(-5, 5), math.random(-5, 5), math.random(-45, 45));
            end;
            local v7 = script.Part:Clone();
            v7.CFrame = l_CFrame_0;
            if l_Color_0 then
                v7.Color = l_Color_0;
            end;
            v7.Parent = workspace.Effects;
            v7.Mesh.Scale = Vector3.new(6.25, 6.25, 6.25, 0);
            _G.tween(v7.Mesh, {
                0.25, 
                "Quad", 
                Enum.EasingDirection.Out, 
                0, 
                true, 
                0
            }, {
                Scale = Vector3.new(25, 25, 25, 0) * math.random(70, 110) / 100
            });
            _G.tween(v7, {
                0.25, 
                "Quad", 
                Enum.EasingDirection.Out, 
                0, 
                true, 
                0
            }, {
                Transparency = 1
            });
            _G.destroy(v7, 0.25);
            return;
        end;
    end
};