local v0 = {};
local function _(v1, v2, v3) --[[ Line: 3 ]] --[[ Name: lerp ]]
    return v1 + (v2 - v1) * v3;
end;
local function _(v5, v6, v7, v8, v9, v10, v11) --[[ Line: 7 ]] --[[ Name: spawnSingleProjectile ]]
    local v12 = v7:Clone();
    v12.CFrame = CFrame.new(v5);
    v12.Parent = workspace.Effects;
    local v13 = tick();
    local v14 = nil;
    v14 = game:GetService("RunService").Heartbeat:Connect(function() --[[ Line: 14 ]]
        -- upvalues: v13 (copy), v9 (copy), v12 (copy), v8 (copy), v6 (copy), v14 (ref), v5 (copy), v10 (copy), v11 (copy)
        local v15 = (tick() - v13) / v9;
        if v15 >= 1 then
            v12:Destroy();
            if v8 then
                v8(v6, nil);
            end;
            v14:Disconnect();
            return;
        else
            local l_v5_0 = v5;
            local v17 = v5 + Vector3.new(0, v10, 0);
            local v18 = v6 + Vector3.new(0, v10, 0);
            local l_v6_0 = v6;
            local v20 = l_v5_0 + (v17 - l_v5_0) * v15;
            local v21 = v17 + (v18 - v17) * v15;
            local v22 = v18 + (l_v6_0 - v18) * v15;
            local v23 = v20 + (v21 - v20) * v15;
            local v24 = v23 + (v21 + (v22 - v21) * v15 - v23) * v15;
            v12.Position = v24;
            if v11 then
                v12.CFrame = CFrame.new(v24) * CFrame.Angles(0, v15 * 6.283185307179586, 0);
            end;
            return;
        end;
    end);
end;
v0.SpawnProjectiles = function(v26) --[[ Line: 46 ]] --[[ Name: SpawnProjectiles ]]
    local l_root_0 = v26.root;
    local l_projectile_0 = v26.projectile;
    local v29 = v26.onHit or function() --[[ Line: 49 ]]

    end;
    local v30 = v26.count or 1;
    local v31 = v26.spreadRadius or 5;
    local v32 = v26.startHeight or 5;
    local v33 = v26.duration or 1;
    local v34 = v26.arcHeight or 10;
    local v35 = v26.evenlySpaced or false;
    local v36 = v26.rotate or false;
    local v37 = v26.spawnDelay or 0;
    local v38 = v26.lifetime or 1;
    local v39 = l_root_0.Position + Vector3.new(0, v32, 0);
    for v40 = 1, v30 do
        local v41 = nil;
        if v35 then
            local v42 = v40 / v30 * 3.141592653589793 * 2;
            v41 = Vector3.new(math.cos(v42) * v31, 0, math.sin(v42) * v31);
        else
            v41 = Vector3.new(math.random(-v31, v31), 0, math.random(-v31, v31));
        end;
        local v43 = l_root_0.Position + v41;
        local v44 = math.random() * v37;
        task.delay(v44, function() --[[ Line: 82 ]]
            -- upvalues: l_projectile_0 (copy), v39 (copy), v43 (copy), v34 (copy), v33 (copy), v29 (copy), v38 (copy), v36 (copy)
            local v45 = l_projectile_0:Clone();
            v45.CFrame = CFrame.new(v39);
            v45.Parent = workspace.Effects;
            local v46 = (v39 + v43) / 2 + Vector3.new(0, v34, 0);
            local v47 = v33 / 30;
            local v48 = 0;
            local function _(v49, v50, v51, v52) --[[ Line: 93 ]] --[[ Name: bezierPoint ]]
                return (1 - v49) ^ 2 * v50 + 2 * (1 - v49) * v49 * v51 + v49 ^ 2 * v52;
            end;
            local v54 = nil;
            v54 = game:GetService("RunService").Heartbeat:Connect(function(v55) --[[ Line: 98 ]]
                -- upvalues: v48 (ref), v47 (copy), v54 (ref), v45 (copy), v29 (ref), v38 (ref), v39 (ref), v46 (copy), v43 (ref), v36 (ref)
                v48 = v48 + v55 / v47;
                if v48 >= 30 then
                    v54:Disconnect();
                    if v45 and v45.Parent then
                        for _, v57 in ipairs(v45:GetChildren()) do
                            if v57:IsA("ParticleEmitter") then
                                v57:Emit(v57:GetAttribute("EmitCount") or 30);
                            end;
                        end;
                        v29(v45.Position, v45);
                        task.delay(v38, function() --[[ Line: 110 ]]
                            -- upvalues: v45 (ref)
                            if v45 and v45.Parent then
                                v45:Destroy();
                            end;
                        end);
                        return;
                    end;
                else
                    local v58 = v48 / 30;
                    local l_v39_0 = v39;
                    local l_v46_0 = v46;
                    local l_v43_0 = v43;
                    local v62 = (1 - v58) ^ 2 * l_v39_0 + 2 * (1 - v58) * v58 * l_v46_0 + v58 ^ 2 * l_v43_0;
                    v45.CFrame = CFrame.new(v62);
                    if v36 then
                        l_v39_0 = (v43 - v62).Unit;
                        v45.CFrame = CFrame.new(v62, v62 + l_v39_0);
                    end;
                end;
            end);
        end);
    end;
end;
return v0;