local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("TweenService");
local l_Splash_0 = l_ReplicatedStorage_0.Fishing.Assets.SFX.Splash;
return {
    start = function(_, v4) --[[ Line: 11 ]] --[[ Name: start ]]
        -- upvalues: l_Splash_0 (copy)
        local l_Hook_0 = v4.Hook;
        if l_Hook_0 == nil then
            return;
        else
            local v6 = workspace.Env.WaterStuff.Falls.Position.Y + 1;
            if v6 < l_Hook_0.Position.Y then
                local v7 = tick();
                repeat
                    task.wait();
                until l_Hook_0.Position.Y < v6 or tick() - v7 >= 2;
            end;
            local v8 = _G.getWavePosition and _G.getWavePosition(l_Hook_0.Position) or workspace.Env.WaterStuff.Falls.Position.Y;
            local v9 = script.Splash:Clone();
            v9.Position = Vector3.new(l_Hook_0.Position.X, v8, l_Hook_0.Position.Z);
            v9.Parent = workspace.Effects;
            _G.customEmit(v9);
            task.delay(3, v9.Destroy, v9);
            local l_l_Splash_0_Children_0 = l_Splash_0:GetChildren();
            local v11 = l_l_Splash_0_Children_0[math.random(#l_l_Splash_0_Children_0)]:Clone();
            v11:Play();
            v11.Parent = l_Hook_0;
            task.delay(5, v11.Destroy, v11);
            return;
        end;
    end
};