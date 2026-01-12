local v0 = {};
local v1 = _G.clientimpacts[game.ReplicatedStorage.ClientImpacts.Sparks];
local v2 = require(game.ReplicatedStorage.ClientImpacts.RockDebs);
v0.start = function(_, v4) --[[ Line: 6 ]] --[[ Name: start ]]
    -- upvalues: v1 (copy), v2 (copy)
    local _ = v4.obj;
    local l_cf_0 = v4.cf;
    local l_hit_0 = v4.hit;
    local l_normal_0 = v4.normal;
    if _G.checkRenderDistance(l_cf_0.p) == false then
        return;
    else
        local v9 = script.explosion:Clone();
        v9.Parent = workspace.Effects;
        v9.CFrame = l_cf_0;
        v9.Smoke:Emit(5);
        v9.Spark:Emit(5);
        v9.Spark2:Emit(5);
        v9.Explosion:Play();
        _G.destroy(v9, 4);
        local v10 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true, 0);
        local v11 = {
            Range = 25, 
            Brightness = 3
        };
        game:GetService("TweenService"):Create(v9.PointLight, v10, v11):Play();
        _G.destroy(v9.PointLight, 0.4);
        v1:start({
            rep = 2, 
            cf = l_cf_0, 
            vel = {
                100, 
                math.random(50, 150), 
                100
            }
        });
        if l_hit_0 then
            v2:start({
                rep = 2, 
                cf = l_cf_0, 
                vel = {
                    55, 
                    100, 
                    55
                }, 
                min = 1, 
                max = 2, 
                color = l_hit_0.Color, 
                material = l_hit_0.Material, 
                normal = l_normal_0
            });
        end;
        return;
    end;
end;
return v0;