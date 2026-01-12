return {
    start = function(_, v1, v2) --[[ Line: 4 ]] --[[ Name: start ]]
        if _G.checkRenderDistance(v1.PrimaryPart.Position) == false then
            return;
        else
            local l_CFrame_0 = v1.PrimaryPart.CFrame;
            local v4 = v1:Clone();
            v4.Parent = workspace.Effects;
            _G.destroy(v4, 2);
            v1:Destroy();
            if v2 == nil then
                _G.PlayEffect("BombExplosion", nil, l_CFrame_0, -5, 15, 0.25, 0.75, 300, 15);
            end;
            v4:BreakJoints();
            v4.PrimaryPart:Destroy();
            local l_v4_Descendants_0 = v4:GetDescendants();
            for v6 = 1, #l_v4_Descendants_0 do
                if l_v4_Descendants_0[v6]:IsA("BasePart") ~= false then
                    l_v4_Descendants_0[v6]:BreakJoints();
                    l_v4_Descendants_0[v6].Velocity = Vector3.new(math.random(-25, 25), math.random(50, 75), math.random(-25, 25));
                    l_v4_Descendants_0[v6].RotVelocity = Vector3.new(math.random(-10, 10), math.random(-10, 10), math.random(-10, 10));
                    l_v4_Descendants_0[v6].CanCollide = false;
                end;
            end;
            return;
        end;
    end
};