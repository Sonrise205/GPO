local v0 = {};
local _ = require(script.Parent.Lightning);
v0.start = function(_, v3, v4, v5, v6, v7, v8, v9, v10, v11) --[[ Line: 4 ]] --[[ Name: start ]]
    v3 = _G.awaitObject(v3);
    if v3 == nil then
        return;
    elseif _G.checkRenderDistance(v3.Position) == false then
        return;
    else
        local v12 = nil;
        local v13 = script.SurfaceT:Clone();
        if v5 then
            v13 = script.SurfaceT2:Clone();
        end;
        if v6 then
            v13.dust.Size = NumberSequence.new(0, v6);
            v13.water.Size = NumberSequence.new(0, v6);
            warn("size is " .. v6);
        end;
        if v8 then
            v13.dust.Speed = NumberRange.new(v8 / 2, v8);
            v13.water.Speed = NumberRange.new(v8 / 2, v8);
        end;
        v13.Parent = workspace.Effects;
        if v9 == nil then
            v9 = 20;
        end;
        if v10 then
            v13.dust.Lifetime = NumberRange.new(v13.dust.Lifetime.Min * v10, v13.dust.Lifetime.Max * v10);
            v13.rock.Lifetime = NumberRange.new(v13.rock.Lifetime.Min * v10, v13.rock.Lifetime.Max * v10);
            v13.water.Lifetime = NumberRange.new(v13.water.Lifetime.Min * v10, v13.water.Lifetime.Max * v10);
        end;
        if v11 then
            pcall(function() --[[ Line: 36 ]]
                -- upvalues: v11 (copy), v13 (ref)
                for v14 = 1, #v11 do
                    v13[v11[v14]].Transparency = NumberSequence.new(1);
                end;
            end);
        end;
        local v15 = v3.Size.Y / 2;
        if v3:IsDescendantOf(workspace.Ships) then
            v15 = 0;
        end;
        local v16 = tick();
        local l_Position_0 = v3.Position;
        v12 = game["Run Service"].Heartbeat:Connect(function() --[[ Line: 48 ]]
            -- upvalues: v4 (copy), v16 (copy), v3 (ref), v7 (copy), v12 (ref), v13 (ref), v15 (ref), v9 (ref), l_Position_0 (ref)
            local v18 = false;
            if v4 and tick() - v16 >= v4 then
                v18 = true;
            end;
            if v3:IsDescendantOf(game) == false or (v3.Anchored == true or v18 == true) and v7 == nil then
                v12:Disconnect();
                v12 = nil;
                v13.dust.Enabled = false;
                v13.rock.Enabled = false;
                v13.water.Enabled = false;
                _G.destroy(v13, 2);
                return;
            else
                local v19 = CFrame.new(v3.Position + Vector3.new(0, v15, 0));
                local v20 = Ray.new(v19.p, v19.upVector * -v9);
                local v21, v22, v23 = _G.raycastWhitelist(v20, {
                    workspace.Islands, 
                    workspace.Ships, 
                    workspace.Env
                });
                local v24 = v3.Position.Y - workspace.Env.WaterStuff.Ocean.Position.Y;
                local v25 = false;
                if (v3.Position - l_Position_0).magnitude >= 0.1 then
                    v25 = true;
                end;
                if v21 and v21.CanCollide ~= false and v25 == true and (v22.Y > workspace.Env.WaterStuff.Falls.Position.Y or workspace.Env.WaterStuff.Sand.Position.Y > v22.Y) then
                    v13.CFrame = CFrame.new(v22, v22 + v23);
                    v13.dust.Enabled = true;
                    v13.rock.Enabled = true;
                    v13.dust.Color = ColorSequence.new(v21.Color);
                    v13.rock.Color = ColorSequence.new(v21.Color);
                    v13.water.Enabled = false;
                elseif v24 >= 1 and v24 < 20 and v25 == true and v22.Y <= workspace.Env.WaterStuff.Falls.Position.Y then
                    v13.CFrame = CFrame.new(v3.Position.X, workspace.Env.WaterStuff.Ocean.Position.Y + 0.25, v3.Position.Z);
                    v13.water.Enabled = true;
                    v13.dust.Enabled = false;
                    v13.rock.Enabled = false;
                else
                    v13.dust.Enabled = false;
                    v13.rock.Enabled = false;
                    v13.water.Enabled = false;
                end;
                if v3 then
                    l_Position_0 = v3.Position;
                end;
                return;
            end;
        end);
        return;
    end;
end;
return v0;