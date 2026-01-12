local v0 = {};
local _ = require(script.Parent.Lightning);
v0.start = function(_, v3) --[[ Line: 4 ]] --[[ Name: start ]]
    local l_obj_0 = v3.obj;
    local l_siz_0 = v3.siz;
    local l_speed_0 = v3.speed;
    local l_lifeMulti_0 = v3.lifeMulti;
    local l_checkDistance_0 = v3.checkDistance;
    local l_disable_0 = v3.disable;
    local l_ti_0 = v3.ti;
    local l_p_0 = v3.p;
    local l_offset_0 = v3.offset;
    local l_force_0 = v3.force;
    if _G.checkRenderDistance(l_obj_0.Position) == false then
        return;
    else
        local v14 = nil;
        local v15 = script.SurfaceT:Clone();
        if l_p_0 then
            v15 = script.SurfaceT2:Clone();
        end;
        if l_siz_0 then
            v15.dust.Size = NumberSequence.new(0, l_siz_0);
            v15.water.Size = NumberSequence.new(0, l_siz_0);
        end;
        if l_speed_0 then
            v15.dust.Speed = NumberRange.new(l_speed_0 / 2, l_speed_0);
            v15.water.Speed = NumberRange.new(l_speed_0 / 2, l_speed_0);
        end;
        v15.Parent = workspace.Effects;
        if l_checkDistance_0 == nil then
            l_checkDistance_0 = 20;
        end;
        if l_lifeMulti_0 then
            v15.dust.Lifetime = NumberRange.new(v15.dust.Lifetime.Min * l_lifeMulti_0, v15.dust.Lifetime.Max * l_lifeMulti_0);
            v15.rock.Lifetime = NumberRange.new(v15.rock.Lifetime.Min * l_lifeMulti_0, v15.rock.Lifetime.Max * l_lifeMulti_0);
            v15.water.Lifetime = NumberRange.new(v15.water.Lifetime.Min * l_lifeMulti_0, v15.water.Lifetime.Max * l_lifeMulti_0);
        end;
        if l_disable_0 then
            pcall(function() --[[ Line: 50 ]]
                -- upvalues: l_disable_0 (copy), v15 (ref)
                for v16 = 1, #l_disable_0 do
                    v15[l_disable_0[v16]].Transparency = NumberSequence.new(1);
                end;
            end);
        end;
        if l_obj_0:IsDescendantOf(workspace.Ships) and l_offset_0 == nil then
            l_offset_0 = 0;
        end;
        if l_offset_0 == nil then
            l_offset_0 = l_obj_0.Size.Y / 2;
        end;
        local v17 = tick();
        local l_Position_0 = l_obj_0.Position;
        v14 = game["Run Service"].Heartbeat:Connect(function() --[[ Line: 67 ]]
            -- upvalues: l_ti_0 (copy), v17 (copy), l_obj_0 (copy), l_force_0 (copy), v14 (ref), v15 (ref), l_offset_0 (ref), l_checkDistance_0 (ref), l_Position_0 (ref)
            local v19 = false;
            if l_ti_0 and tick() - v17 >= l_ti_0 then
                v19 = true;
            end;
            if l_obj_0:IsDescendantOf(game) == false or v19 == true and l_force_0 == nil then
                v14:Disconnect();
                v14 = nil;
                v15.dust.Enabled = false;
                v15.rock.Enabled = false;
                v15.water.Enabled = false;
                _G.destroy(v15, 2);
                return;
            else
                local v20 = CFrame.new(l_obj_0.Position + Vector3.new(0, l_offset_0, 0));
                local v21 = Ray.new(v20.p, v20.upVector * -l_checkDistance_0);
                local v22, v23, v24 = _G.raycastWhitelist(v21, {
                    workspace.Islands, 
                    workspace.Ships, 
                    workspace.Env
                });
                local v25 = l_obj_0.Position.Y - workspace.Env.WaterStuff.Ocean.Position.Y;
                local v26 = false;
                if (l_obj_0.Position - l_Position_0).magnitude >= 0.1 then
                    v26 = true;
                end;
                if v22 and v22.CanCollide ~= false and v26 == true and (v23.Y > workspace.Env.WaterStuff.Falls.Position.Y or workspace.Env.WaterStuff.Sand.Position.Y > v23.Y) then
                    v15.CFrame = CFrame.new(v23, v23 + v24);
                    v15.dust.Enabled = true;
                    v15.rock.Enabled = true;
                    v15.dust.Color = ColorSequence.new(v22.Color);
                    v15.rock.Color = ColorSequence.new(v22.Color);
                    v15.water.Enabled = false;
                elseif v25 >= 1 and v25 < 20 and v26 == true and v23.Y <= workspace.Env.WaterStuff.Falls.Position.Y then
                    v15.CFrame = CFrame.new(l_obj_0.Position.X, workspace.Env.WaterStuff.Ocean.Position.Y + 0.25, l_obj_0.Position.Z);
                    v15.water.Enabled = true;
                    v15.dust.Enabled = false;
                    v15.rock.Enabled = false;
                else
                    v15.dust.Enabled = false;
                    v15.rock.Enabled = false;
                    v15.water.Enabled = false;
                end;
                if l_obj_0 then
                    l_Position_0 = l_obj_0.Position;
                end;
                return;
            end;
        end);
        return;
    end;
end;
return v0;