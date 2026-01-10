local v0 = {};
local l_Y_0 = workspace.Env.WaterStuff.Falls.Position.Y;
local function v5(v2) --[[ Line: 3 ]] --[[ Name: clones ]]
    local l_Children_0 = script.ball:GetChildren();
    for v4 = 1, #l_Children_0 do
        l_Children_0[v4]:Clone().Parent = v2;
    end;
end;
local v6 = require(script.Parent.rougelineage);
v0.start = function(_, v8, v9) --[[ Line: 12 ]] --[[ Name: start ]]
    -- upvalues: v6 (copy), v5 (copy), l_Y_0 (copy)
    if v8 == game.Players.LocalPlayer and v6:solans(script.Name) == false then
        return;
    else
        local v10 = _G.clientEffectsFolder.DevilFruits.Magu.MaguBalls["Ball" .. math.random(1, 4)]:Clone();
        v10:ClearAllChildren();
        v5(v10);
        v10.Parent = workspace.Env;
        v10.CanCollide = true;
        v10.CFrame = CFrame.new(v9.X, l_Y_0, v9.Z) * CFrame.Angles(0, math.rad((math.random(-360, 360))), 0);
        _G.destroy(v10, 2.5);
        local v11 = math.random(100, 200) / 100;
        v10.Size = Vector3.new(7.5, v11, 7.5);
        _G.tween(v10, {
            1, 
            Enum.EasingStyle.Back, 
            Enum.EasingDirection.Out, 
            0, 
            false, 
            0
        }, {
            Size = Vector3.new(15, v11, 15)
        });
        _G.PlaySound(v10, script["MaguStep" .. math.random(1, 3)]);
        v10.CollisionGroup = "waterLogia";
        _G.destroy(v10, 4);
        task.spawn(function() --[[ Line: 35 ]]
            -- upvalues: v10 (copy)
            task.wait(0.1);
            v10.sm2:Emit(10);
        end);
        task.spawn(function() --[[ Line: 39 ]]
            -- upvalues: v10 (copy)
            task.wait(2);
            _G.tween(v10, {
                0.5, 
                "Smooth", 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                Size = Vector3.new(0, 0, 0, 0), 
                Color = Color3.fromRGB(0, 0, 0)
            });
            task.wait(0.475);
            pcall(function() --[[ Line: 43 ]]
                -- upvalues: v10 (ref)
                v10.Parent = workspace.Effects;
            end);
        end);
        if v8 == game.Players.LocalPlayer then
            game.ReplicatedStorage.Events.fruitFloor:FireServer(v10.CFrame, Vector3.new(15, v11, 15), BrickColor.new("Medium red").Color);
        end;
        return;
    end;
end;
return v0;