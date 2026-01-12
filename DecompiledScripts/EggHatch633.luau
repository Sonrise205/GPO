return {
    start = function(_, v1) --[[ Line: 4 ]] --[[ Name: start ]]
        if _G.checkRenderDistance(v1.PrimaryPart.Position) == false then
            return;
        else
            local v2 = v1:Clone();
            v1:Destroy();
            v2.Parent = workspace.Effects;
            v2.PrimaryPart:BreakJoints();
            local l_Children_0 = v2.Cracks:GetChildren();
            for v4 = 1, #l_Children_0 do
                l_Children_0[v4].Parent = workspace.Effects;
                l_Children_0[v4].Anchored = false;
                _G.tween(l_Children_0[v4], {
                    1, 
                    "Quad", 
                    Enum.EasingDirection.In, 
                    0, 
                    false, 
                    0
                }, {
                    Size = Vector3.new(0, 0, 0, 0)
                });
                l_Children_0[v4].Velocity = Vector3.new(math.random(-25, 25), math.random(5, 50), math.random(-25, 25));
                l_Children_0[v4].RotVelocity = Vector3.new(math.random(-5, 5), math.random(-5, 5), math.random(-25, 25));
                _G.destroy(l_Children_0[v4], 1);
            end;
            local v5 = script.Part:Clone();
            v5.CFrame = v2:GetModelCFrame();
            v5.Parent = workspace.Effects;
            _G.tween(v5, {
                0.25, 
                "Quad", 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                Size = Vector3.new(8, 8, 8, 0), 
                Transparency = 1
            });
            _G.destroy(v5, 0.25);
            return;
        end;
    end
};