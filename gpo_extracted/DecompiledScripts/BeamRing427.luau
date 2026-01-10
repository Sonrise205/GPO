local v0 = {};
local _ = _G.clientimpacts[game.ReplicatedStorage.ClientImpacts.Sparks];
local _ = _G.clientimpacts[game.ReplicatedStorage.ClientImpacts.RockDebs];
v0.start = function(_, v4) --[[ Line: 6 ]] --[[ Name: start ]]
    local l_cf_0 = v4.cf;
    local l_dam_0 = v4.dam;
    local l_ti_0 = v4.ti;
    local l_ti2_0 = v4.ti2;
    local l_rot_0 = v4.rot;
    local l_color_0 = v4.color;
    local l_le_0 = v4.le;
    local l_width_0 = v4.width;
    local l_rotmulti_0 = v4.rotmulti;
    if l_rotmulti_0 == nil then
        l_rotmulti_0 = 1;
    end;
    if _G.checkRenderDistance(l_cf_0.p) == false then
        return;
    else
        local v14 = script.BeamRing:Clone();
        v14.Parent = workspace.Effects;
        if l_width_0 == nil then
            l_width_0 = math.random(50, 100) / 100;
        end;
        local v15 = 1.3333333333333333 * (l_dam_0 / 2) * 0.41421356237309503;
        local v16 = Vector3.new(0, 0, l_dam_0 / 2);
        local v17 = Vector3.new(-l_dam_0 / 2, 0, 0);
        local v18 = Vector3.new(0, 0, -l_dam_0 / 2);
        v14.Beam.CurveSize0 = 0;
        v14.Beam.CurveSize1 = 0;
        v14.Beam.Width0 = l_width_0;
        v14.Beam.Width1 = l_width_0;
        v14.Beam2.CurveSize0 = 0;
        v14.Beam2.CurveSize1 = 0;
        v14.Beam2.Width0 = l_width_0;
        v14.Beam2.Width1 = l_width_0;
        v14.CFrame = l_cf_0;
        if l_color_0 then
            v14.Beam.Color = l_color_0;
            v14.Beam2.Color = l_color_0;
        end;
        if l_le_0 then
            v14.Beam.LightEmission = l_le_0;
            v14.Beam2.LightEmission = l_le_0;
        end;
        local l_Sine_0 = Enum.EasingStyle.Sine;
        if l_ti_0 > 0 then
            _G.tween(v14.A1, {
                l_ti_0, 
                l_Sine_0, 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                Position = v16
            });
            _G.tween(v14.A2, {
                l_ti_0, 
                l_Sine_0, 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                Position = v17
            });
            _G.tween(v14.A3, {
                l_ti_0, 
                l_Sine_0, 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                Position = v18
            });
            _G.tween(v14.Beam, {
                l_ti_0, 
                l_Sine_0, 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                CurveSize0 = v15, 
                CurveSize1 = v15
            });
            _G.tween(v14.Beam2, {
                l_ti_0, 
                l_Sine_0, 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                CurveSize0 = v15, 
                CurveSize1 = v15
            });
        else
            v14.A1.Position = v16;
            v14.A2.Position = v17;
            v14.A3.Position = v18;
            v14.Beam.CurveSize0 = v15;
            v14.Beam2.CurveSize0 = v15;
            v14.Beam.CurveSize1 = v15;
            v14.Beam2.CurveSize1 = v15;
        end;
        local v20 = Vector3.new(0, 0, 0, 0);
        if l_rot_0 == "x" then
            v20 = Vector3.new(360, 0, 0, 0);
        elseif l_rot_0 == "y" then
            v20 = Vector3.new(0, 360, 0, 0);
        elseif l_rot_0 == "z" then
            v20 = Vector3.new(0, 0, 360, 0);
        end;
        v20 = v20 * l_rotmulti_0;
        _G.tween(v14, {
            2, 
            l_Sine_0, 
            Enum.EasingDirection.Out, 
            0, 
            false, 
            0
        }, {
            Orientation = v14.Orientation + v20
        });
        local v21 = Instance.new("NumberValue", game.ReplicatedStorage);
        v21.Value = 0;
        v21.Changed:Connect(function() --[[ Line: 81 ]]
            -- upvalues: v21 (copy), v14 (copy)
            local l_Value_0 = v21.Value;
            v14.Beam.Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1, 0), 
                NumberSequenceKeypoint.new(0.2, 1, 0), 
                NumberSequenceKeypoint.new(0.3, l_Value_0, 0), 
                NumberSequenceKeypoint.new(1, l_Value_0, 0)
            });
            v14.Beam2.Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, l_Value_0, 0), 
                NumberSequenceKeypoint.new(0.75, 1, 0), 
                NumberSequenceKeypoint.new(1, 1, 0)
            });
        end);
        _G.tween(v21, {
            l_ti2_0, 
            l_Sine_0, 
            Enum.EasingDirection.Out, 
            0, 
            false, 
            0
        }, {
            Value = 1
        });
        _G.destroy(v21, l_ti2_0);
        _G.destroy(v14, l_ti2_0);
        return;
    end;
end;
return v0;