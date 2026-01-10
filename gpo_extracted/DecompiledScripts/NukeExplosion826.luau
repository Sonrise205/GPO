local v0 = {};
local _ = _G.clientimpacts[game.ReplicatedStorage.ClientImpacts.Sparks];
local _ = _G.clientimpacts[game.ReplicatedStorage.ClientImpacts.RockDebs];
v0.start = function(_, v4) --[[ Line: 6 ]] --[[ Name: start ]]
    local _ = v4.obj;
    local l_cf_0 = v4.cf;
    local _ = v4.hit;
    local _ = v4.normal;
    local v9 = script.Model:Clone();
    v9.Parent = workspace.Effects;
    v9:PivotTo(l_cf_0);
    local v10 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0);
    local v11 = {
        Size = Vector3.new(800, 800, 800, 0), 
        Transparency = 0
    };
    game:GetService("TweenService"):Create(v9.Sphere, v10, v11):Play();
    local v12 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0);
    local v13 = {
        Size = Vector3.new(Vector3.new(800, 800, 800, 0).X + 400, 2, Vector3.new(800, 800, 800, 0).X + 400), 
        Transparency = 0
    };
    game:GetService("TweenService"):Create(v9.Ring, v12, v13):Play();
    task.spawn(function() --[[ Line: 30 ]]
        -- upvalues: v9 (copy)
        task.wait(2);
        local v14 = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0);
        local v15 = {
            Transparency = 1
        };
        game:GetService("TweenService"):Create(v9.Sphere, v14, v15):Play();
        local v16 = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0);
        local v17 = {
            Transparency = 1
        };
        game:GetService("TweenService"):Create(v9.Ring, v16, v17):Play();
        _G.destroy(v9, 20);
        _G.destroy(v9, 20);
    end);
end;
return v0;