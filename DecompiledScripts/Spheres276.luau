return {
    start = function(_, v1) --[[ Line: 3 ]] --[[ Name: start ]]
        if _G.checkRenderDistance(v1.cf.p) == false then
            return;
        else
            local _ = v1.w;
            local l_cf_0 = v1.cf;
            local l_part_0 = v1.part;
            local l_range_0 = v1.range;
            local l_minThick_0 = v1.minThick;
            local l_maxThick_0 = v1.maxThick;
            local l_ti_0 = v1.ti;
            local l_ti2_0 = v1.ti2;
            local l_color_0 = v1.color;
            local l_am_0 = v1.am;
            local l_startSize_0 = v1.startSize;
            local l_xrange_0 = v1.xrange;
            local l_yrange_0 = v1.yrange;
            local l_zrange_0 = v1.zrange;
            local v16 = nil;
            if l_xrange_0 == nil then
                l_xrange_0 = l_range_0;
                l_yrange_0 = l_range_0;
                l_zrange_0 = l_range_0;
            else
                v16 = l_yrange_0 / 10;
            end;
            for _ = 1, l_am_0 do
                if l_part_0 then
                    l_cf_0 = l_part_0.CFrame;
                end;
                local v18 = script.sphere:Clone();
                v18.Color = l_color_0;
                local v19 = l_cf_0 * CFrame.new(math.random(-l_xrange_0, l_xrange_0), math.random(v16 or -l_yrange_0, l_yrange_0), math.random(-l_zrange_0, l_zrange_0));
                v18.CFrame = CFrame.new(l_cf_0.p, v19.p) * CFrame.Angles(1.5707963267948966, 0, 0);
                local v20 = math.random(l_minThick_0, l_maxThick_0);
                local l_magnitude_0 = (v19.p - l_cf_0.p).magnitude;
                if l_startSize_0 then
                    v18.Mesh.Scale = l_startSize_0;
                end;
                v18.Parent = workspace.Effects;
                _G.tween(v18, {
                    l_ti_0, 
                    Enum.EasingStyle.Quad, 
                    Enum.EasingDirection.Out, 
                    0, 
                    false, 
                    0
                }, {
                    CFrame = CFrame.new(v19.p, l_cf_0.p) * CFrame.Angles(-1.5707963267948966, 0, 0), 
                    Size = Vector3.new(0, 1, 0, 0)
                });
                _G.tween(v18.Mesh, {
                    l_ti_0, 
                    Enum.EasingStyle.Quad, 
                    Enum.EasingDirection.Out, 
                    0, 
                    false, 
                    0
                }, {
                    Scale = Vector3.new(v20, l_magnitude_0, v20), 
                    Offset = Vector3.new(0, -l_magnitude_0 / 2, 0)
                });
                task.spawn(function() --[[ Line: 43 ]]
                    -- upvalues: l_ti_0 (copy), v18 (copy), l_ti2_0 (copy), l_magnitude_0 (copy)
                    _G.fw(l_ti_0 / 2);
                    if v18:FindFirstChild("Mesh") then
                        _G.tween(v18.Mesh, {
                            l_ti2_0, 
                            Enum.EasingStyle.Quad, 
                            Enum.EasingDirection.Out, 
                            0, 
                            false, 
                            0
                        }, {
                            Scale = Vector3.new(0, 0, 0, 0), 
                            Offset = Vector3.new(0, -l_magnitude_0, 0)
                        });
                    end;
                end);
                _G.destroy(v18, l_ti2_0 * 2 + l_ti_0);
            end;
            return;
        end;
    end
};