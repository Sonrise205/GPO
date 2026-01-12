return {
    start = function(_, v1) --[[ Line: 3 ]] --[[ Name: start ]]
        local l_char_0 = v1.char;
        local l_cf_0 = v1.cf;
        if _G.checkRenderDistance(l_cf_0.p) == false then
            return;
        elseif l_char_0.PrimaryPart == nil then
            return;
        else
            local v4 = l_char_0:GetScale() - 1;
            if v1.Flip == nil then
                _G.PlaySound(l_char_0.PrimaryPart, script.Sounds:GetChildren()[math.random(1, #script.Sounds:GetChildren())]);
                local v5 = math.abs(l_char_0.HumanoidRootPart.Velocity.Y / 100);
                if v5 >= 10 then
                    v5 = 10;
                elseif v5 < 1 then
                    v5 = 1;
                end;
                local v6 = script.SplashEffect:Clone();
                v6:PivotTo(CFrame.new(l_cf_0.p.X, _G.getWavePosition(l_cf_0), l_cf_0.p.Z));
                v6:ScaleTo(v5 + v4);
                v6.Parent = workspace.Effects;
                _G.customEmit(v6);
                _G.destroy(v6, 5);
                return;
            else
                local v7 = script.Flip:Clone();
                v7:PivotTo(CFrame.new(l_cf_0.p.X, _G.getWavePosition(l_cf_0), l_cf_0.p.Z));
                v7:ScaleTo(v4 + v7:GetScale());
                v7.Parent = workspace.Effects;
                _G.customEmit(v7);
                _G.destroy(v7, 5);
                _G.PlaySound(l_char_0.PrimaryPart, game.ReplicatedStorage.Util.Swim.Jumps:GetChildren()[math.random(1, #game.ReplicatedStorage.Util.Swim.Jumps:GetChildren())]);
                return;
            end;
        end;
    end
};