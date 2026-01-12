local v0 = {};
local l_Y_0 = workspace.Env.WaterStuff.Falls.Position.Y;
local v2 = require(script.Parent.rougelineage);
v0.start = function(_, v4, v5) --[[ Line: 7 ]] --[[ Name: start ]]
    -- upvalues: v2 (copy), l_Y_0 (copy)
    if v4 == game.Players.LocalPlayer and v2:solans(script.Name) == false then
        return;
    else
        local v6 = script.floor:Clone();
        v6.Parent = workspace.Env;
        _G.destroy(v6, 2.5);
        v6.CFrame = CFrame.new(v5.X, l_Y_0 + 0.1, v5.Z) * CFrame.Angles(0, math.rad((math.random(-360, 360))), 0);
        v6.Size = Vector3.new(7.5, 1, 7.5, 0);
        _G.tween(v6, {
            0.25, 
            Enum.EasingStyle.Circular, 
            Enum.EasingDirection.Out, 
            0, 
            false, 
            0
        }, {
            Size = Vector3.new(15, 1, 15, 0), 
            CFrame = v6.CFrame * CFrame.Angles(0, 0.2617993877991494, 0)
        });
        v6.Sound.Pitch = math.random(100, 120) / 100;
        v6.Sound:Play();
        v6.sm2:Emit(15);
        v6.CollisionGroup = "waterLogia";
        v6.Name = "iceFloor";
        spawn(function() --[[ Line: 27 ]]
            -- upvalues: v6 (copy)
            task.wait(0.3);
            v6.sm3.Enabled = false;
        end);
        task.spawn(function() --[[ Line: 31 ]]
            -- upvalues: v6 (copy)
            task.wait(2);
            _G.tween(v6, {
                0.5, 
                "Smooth", 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                Size = Vector3.new(0, 0, 0, 0)
            });
            task.wait(0.475);
            pcall(function() --[[ Line: 35 ]]
                -- upvalues: v6 (ref)
                v6.Parent = workspace.Effects;
            end);
        end);
        if v4 == game.Players.LocalPlayer then
            game.ReplicatedStorage.Events.fruitFloor:FireServer(v6.CFrame, Vector3.new(15, 1, 15, 0), script.floor.Color);
        end;
        return;
    end;
end;
return v0;