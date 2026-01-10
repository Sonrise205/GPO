local v0 = {};
local v1 = 0;
v0.start = function(_, v3, v4, v5, v6, v7) --[[ Line: 5 ]] --[[ Name: start ]]
    -- upvalues: v1 (ref)
    if (workspace.CurrentCamera.CFrame.Position - v3).magnitude > 60 then
        return;
    elseif v1 >= 50 then
        return;
    else
        v1 = v1 + 1;
        local v8 = script.DMGIND:Clone();
        if v7 == nil then
            v3 = v3 + Vector3.new(0, math.random(1, 3), 0);
        end;
        v8.CFrame = CFrame.new(v3);
        local l_Frame_0 = v8.Bill.Frame;
        local _ = v8.Bill.Frame.Position;
        local _ = l_Frame_0.Size;
        v8.Bill.Frame.TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255);
        v8.Bill.Frame.TextLabel.Text = v4;
        v8.Bill.Frame.TextLabel.TextLabel.Text = v4;
        v8.Bill.Frame.TextLabel.TextColor3 = v5;
        v8.Parent = workspace.Effects;
        if v6 == nil then
            v6 = "Elastic";
        end;
        if v7 == nil then
            v8.Anchored = false;
        end;
        v8.Velocity = Vector3.new(math.random(-15, 15), math.random(25, 45), math.random(-15, 15));
        local l_BodyVelocity_0 = Instance.new("BodyVelocity");
        l_BodyVelocity_0.maxForce = Vector3.new(0, 1e999, 0, 0);
        l_BodyVelocity_0.velocity = Vector3.new(0, 5, 0, 0);
        l_BodyVelocity_0.Parent = v8;
        _G.destroy(l_BodyVelocity_0, 0.2);
        task.wait(0.25);
        local v13 = math.random(20, 45) / 100;
        _G.tween(v8.Bill.Frame.TextLabel, {
            v13, 
            Enum.EasingStyle.Quad, 
            Enum.EasingDirection.In, 
            0, 
            false, 
            0
        }, {
            TextColor3 = Color3.fromRGB(0, 0, 0)
        });
        l_Frame_0:TweenSizeAndPosition(UDim2.new(0, 0, 0, 0), UDim2.new(0.5, 0, 0.5, 0), "In", v6, v13);
        _G.destroy(v8, 0.25);
        task.delay(0.25, function() --[[ Line: 54 ]]
            -- upvalues: v1 (ref)
            v1 = v1 - 1;
        end);
        return;
    end;
end;
return v0;