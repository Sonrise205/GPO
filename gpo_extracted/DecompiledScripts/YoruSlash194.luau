local v0 = {};
local _ = require(script.Parent.Lightning);
local _ = function(v2, v3, v4, v5, v6) --[[ Line: 3 ]] --[[ Name: groundrockangle ]]
    local v7 = v2.HumanoidRootPart.CFrame * v6;
    local v8 = v3 / v5;
    task.spawn(function() --[[ Line: 6 ]]
        -- upvalues: v5 (copy), v7 (copy), v8 (copy), v4 (copy)
        for v9 = 1, v5 do
            local v10 = v7 * CFrame.new(v8 * v9, 0, 0);
            local v11 = Ray.new(v10.p + Vector3.new(0, 2, 0, 0), v10.upVector * -15);
            local v12, v13, _ = _G.raycastIgnoreList(v11, {
                workspace.Effects, 
                workspace.Projectiles, 
                workspace.NPCs, 
                workspace.PlayerCharacters, 
                workspace.Ragdolls
            });
            if v12 then
                local v15 = script.Part2:Clone();
                v15.Parent = workspace.Effects;
                _G.matchMaterial(v15, v12);
                v15.Attachment.sm.Color = ColorSequence.new(v15.Color);
                v15.Attachment.sm.Size = NumberSequence.new(v4.magnitude / 2);
                v15.Size = v4 * (v9 / v5 + 0.2);
                v15.Attachment.Position = Vector3.new(0, v4.Y, 0);
                local v16 = CFrame.new(v13) * CFrame.Angles(math.rad((math.random(-360, 360))), math.rad((math.random(-360, 360))), (math.rad((math.random(-360, 360)))));
                v15.CFrame = CFrame.new(v16.p) * CFrame.new(0, -v4.Y / 2, 0);
                _G.tween(v15, {
                    0.25, 
                    Enum.EasingStyle.Exponential, 
                    Enum.EasingDirection.Out, 
                    0, 
                    false, 
                    0
                }, {
                    CFrame = v16
                });
                _G.destroy(v15, 3);
                task.spawn(function() --[[ Line: 26 ]]
                    -- upvalues: v15 (copy), v16 (copy), v4 (ref)
                    task.wait(1);
                    _G.tween(v15, {
                        1, 
                        Enum.EasingStyle.Quad, 
                        Enum.EasingDirection.Out, 
                        0, 
                        false, 
                        0
                    }, {
                        CFrame = CFrame.new(v16.p) * CFrame.new(0, -v4.Y / 2, 0), 
                        Transparency = 1
                    });
                end);
            end;
            game["Run Service"].Heartbeat:Wait();
        end;
    end);
end;
local v18 = {};
local function v22() --[[ Line: 36 ]] --[[ Name: checkTree ]]
    -- upvalues: v18 (ref)
    v18 = {};
    local v19 = {};
    local l_Descendants_0 = workspace.Islands:GetDescendants();
    for v21 = 1, #l_Descendants_0 do
        if l_Descendants_0[v21].Parent.Name:match("Tree") and v19[l_Descendants_0[v21].Parent] == nil then
            v19[l_Descendants_0[v21].Parent] = true;
            table.insert(v18, l_Descendants_0[v21].Parent);
        end;
    end;
end;
v0.start = function(_, v24) --[[ Line: 47 ]] --[[ Name: start ]]
    -- upvalues: v22 (copy), v18 (ref)
    if _G.checkRenderDistance(v24.HumanoidRootPart.Position) == false then
        return;
    else
        local v25 = v24.HumanoidRootPart.CFrame * CFrame.new(0, -3, 0);
        local v26 = CFrame.Angles(0, 1.6580627893946132, 0);
        local v27 = v24.HumanoidRootPart.CFrame * v26;
        local l_spawn_0 = task.spawn;
        local v29 = 15;
        local v30 = 6.666666666666667;
        local v31 = Vector3.new(4, 4, 4, 0);
        local l_v29_0 = v29 --[[ copy: 7 -> 10 ]];
        local l_v27_0 = v27 --[[ copy: 4 -> 11 ]];
        local l_v30_0 = v30 --[[ copy: 8 -> 12 ]];
        local l_v31_0 = v31 --[[ copy: 9 -> 13 ]];
        l_spawn_0(function() --[[ Line: 6 ]]
            -- upvalues: l_v29_0 (copy), l_v27_0 (copy), l_v30_0 (copy), l_v31_0 (copy)
            for v36 = 1, l_v29_0 do
                local v37 = l_v27_0 * CFrame.new(l_v30_0 * v36, 0, 0);
                local v38 = Ray.new(v37.p + Vector3.new(0, 2, 0, 0), v37.upVector * -15);
                local v39, v40, _ = _G.raycastIgnoreList(v38, {
                    workspace.Effects, 
                    workspace.Projectiles, 
                    workspace.NPCs, 
                    workspace.PlayerCharacters, 
                    workspace.Ragdolls
                });
                if v39 then
                    local v42 = script.Part2:Clone();
                    v42.Parent = workspace.Effects;
                    _G.matchMaterial(v42, v39);
                    v42.Attachment.sm.Color = ColorSequence.new(v42.Color);
                    v42.Attachment.sm.Size = NumberSequence.new(l_v31_0.magnitude / 2);
                    v42.Size = l_v31_0 * (v36 / l_v29_0 + 0.2);
                    v42.Attachment.Position = Vector3.new(0, l_v31_0.Y, 0);
                    local v43 = CFrame.new(v40) * CFrame.Angles(math.rad((math.random(-360, 360))), math.rad((math.random(-360, 360))), (math.rad((math.random(-360, 360)))));
                    v42.CFrame = CFrame.new(v43.p) * CFrame.new(0, -l_v31_0.Y / 2, 0);
                    _G.tween(v42, {
                        0.25, 
                        Enum.EasingStyle.Exponential, 
                        Enum.EasingDirection.Out, 
                        0, 
                        false, 
                        0
                    }, {
                        CFrame = v43
                    });
                    _G.destroy(v42, 3);
                    task.spawn(function() --[[ Line: 26 ]]
                        -- upvalues: v42 (copy), v43 (copy), l_v31_0 (ref)
                        task.wait(1);
                        _G.tween(v42, {
                            1, 
                            Enum.EasingStyle.Quad, 
                            Enum.EasingDirection.Out, 
                            0, 
                            false, 
                            0
                        }, {
                            CFrame = CFrame.new(v43.p) * CFrame.new(0, -l_v31_0.Y / 2, 0), 
                            Transparency = 1
                        });
                    end);
                end;
                game["Run Service"].Heartbeat:Wait();
            end;
        end);
        v26 = CFrame.Angles(0, 1.4835298641951802, 0);
        v27 = v24.HumanoidRootPart.CFrame * v26;
        l_spawn_0 = task.spawn;
        v29 = 15;
        v30 = 6.666666666666667;
        v31 = Vector3.new(4, 4, 4, 0);
        local l_v27_1 = v27 --[[ copy: 4 -> 14 ]];
        l_spawn_0(function() --[[ Line: 6 ]]
            -- upvalues: v29 (copy), l_v27_1 (copy), v30 (copy), v31 (copy)
            for v45 = 1, v29 do
                local v46 = l_v27_1 * CFrame.new(v30 * v45, 0, 0);
                local v47 = Ray.new(v46.p + Vector3.new(0, 2, 0, 0), v46.upVector * -15);
                local v48, v49, _ = _G.raycastIgnoreList(v47, {
                    workspace.Effects, 
                    workspace.Projectiles, 
                    workspace.NPCs, 
                    workspace.PlayerCharacters, 
                    workspace.Ragdolls
                });
                if v48 then
                    local v51 = script.Part2:Clone();
                    v51.Parent = workspace.Effects;
                    _G.matchMaterial(v51, v48);
                    v51.Attachment.sm.Color = ColorSequence.new(v51.Color);
                    v51.Attachment.sm.Size = NumberSequence.new(v31.magnitude / 2);
                    v51.Size = v31 * (v45 / v29 + 0.2);
                    v51.Attachment.Position = Vector3.new(0, v31.Y, 0);
                    local v52 = CFrame.new(v49) * CFrame.Angles(math.rad((math.random(-360, 360))), math.rad((math.random(-360, 360))), (math.rad((math.random(-360, 360)))));
                    v51.CFrame = CFrame.new(v52.p) * CFrame.new(0, -v31.Y / 2, 0);
                    _G.tween(v51, {
                        0.25, 
                        Enum.EasingStyle.Exponential, 
                        Enum.EasingDirection.Out, 
                        0, 
                        false, 
                        0
                    }, {
                        CFrame = v52
                    });
                    _G.destroy(v51, 3);
                    task.spawn(function() --[[ Line: 26 ]]
                        -- upvalues: v51 (copy), v52 (copy), v31 (ref)
                        task.wait(1);
                        _G.tween(v51, {
                            1, 
                            Enum.EasingStyle.Quad, 
                            Enum.EasingDirection.Out, 
                            0, 
                            false, 
                            0
                        }, {
                            CFrame = CFrame.new(v52.p) * CFrame.new(0, -v31.Y / 2, 0), 
                            Transparency = 1
                        });
                    end);
                end;
                game["Run Service"].Heartbeat:Wait();
            end;
        end);
        v26 = {};
        task.spawn(function() --[[ Line: 63 ]]
            -- upvalues: v25 (copy), v22 (ref), v18 (ref)
            task.wait();
            local l_v25_0 = v25;
            local v54 = {};
            local v55 = nil;
            v22();
            local l_v18_0 = v18;
            local v57 = {
                workspace.Effects, 
                workspace.PlayerCharacters, 
                workspace.NPCs, 
                workspace.Projectiles, 
                workspace.Ragdolls, 
                workspace.CurrentCamera
            };
            for v58 = 1, #v57 do
                table.insert(l_v18_0, v57[v58]);
            end;
            for v59 = 1, 100 do
                scheduler:QueueTask(function() --[[ Line: 77 ]]
                    -- upvalues: v25 (ref), v59 (copy), l_v18_0 (copy), l_v25_0 (ref), v55 (ref), v54 (ref)
                    local v60 = v25 * CFrame.new(0, 0, -10 * ((v59 - 1) / 10));
                    local v61 = v60 * CFrame.new(0, 50, 0);
                    local v62 = Ray.new(v61.p, v61.upVector * -100);
                    local v63, v64 = _G.raycastIgnoreList(v62, l_v18_0);
                    if v63 then
                        local _ = (v60.p - v64).magnitude;
                        v60 = CFrame.new(v64);
                        local v66 = script.trail:Clone();
                        local l_magnitude_1 = (l_v25_0.p - v60.p).magnitude;
                        v66.CFrame = CFrame.new(l_v25_0.p, v60.p) * CFrame.Angles(1.5707963267948966, 0, 0) * CFrame.new(0, -l_magnitude_1 / 2, 0);
                        local v68 = v59 / 100;
                        local v69 = Vector3.new(2 * (v59 / 100), l_magnitude_1, 0.1);
                        v55 = (v66.CFrame * CFrame.new(0, 0, l_magnitude_1)).Y;
                        v66.Mesh.Scale = Vector3.new(0, l_magnitude_1, 0);
                        v66.Parent = workspace.Effects;
                        local v70 = NumberSequence.new(10 * v68);
                        local v71 = NumberRange.new(150 * v68 / 2, 150 * v68);
                        local v72 = NumberRange.new(200 * v68 / 2, 200 * v68);
                        task.spawn(function() --[[ Line: 102 ]]
                            -- upvalues: v68 (copy), v66 (copy), v71 (copy), v72 (copy), v70 (copy), v63 (copy)
                            task.wait(0.2 * v68);
                            v66.dust.Speed = v71;
                            v66.dust2.Speed = v71;
                            v66.rock.Speed = v72;
                            v66.dust.Size = v70;
                            v66.dust2.Size = v70;
                            v66.dust.Color = ColorSequence.new(v63.Color);
                            v66.dust2.Color = ColorSequence.new(v63.Color);
                            v66.rock.Color = ColorSequence.new(v63.Color);
                            v66.rock:Emit(2);
                            v66.dust:Emit(5);
                            v66.dust2:Emit(5);
                        end);
                        _G.tween(v66, {
                            0.5, 
                            Enum.EasingStyle.Quad, 
                            Enum.EasingDirection.Out, 
                            0, 
                            false, 
                            0
                        }, {
                            Color = Color3.fromRGB(0, 0, 0)
                        });
                        _G.tween(v66.Mesh, {
                            0.5, 
                            Enum.EasingStyle.Quad, 
                            Enum.EasingDirection.Out, 
                            0, 
                            false, 
                            0
                        }, {
                            Scale = v69
                        });
                        l_v25_0 = CFrame.new(v64);
                        local _ = v66.CFrame;
                        table.insert(v54, v66);
                    end;
                end);
            end;
            task.wait(1);
            for v74 = 1, #v54 do
                _G.tween(v54[v74].Mesh, {
                    0.25, 
                    Enum.EasingStyle.Quad, 
                    Enum.EasingDirection.Out, 
                    0, 
                    false, 
                    0
                }, {
                    Scale = Vector3.new(0, v54[v74].Mesh.Scale.Y, 0)
                });
                _G.destroy(v54[v74], 2);
            end;
            v54 = {};
            v54 = nil;
        end);
        v27 = script.Main:Clone();
        v27.Parent = workspace.Effects;
        v27.CFrame = v25 * CFrame.Angles(0, 3.141592653589793, 1.5707963267948966) * CFrame.new(0, 0, 22.5);
        v27.Mesh.Scale = Vector3.new(0, 0, 0, 0);
        _G.tween(v27.Mesh, {
            0.25, 
            Enum.EasingStyle.Exponential, 
            Enum.EasingDirection.Out, 
            0, 
            false, 
            0
        }, {
            Scale = script.Main.Mesh.Scale, 
            Offset = Vector3.new(0, 0, -50, 0)
        });
        _G.tween(v27.decal, {
            0.5, 
            Enum.EasingStyle.Quad, 
            Enum.EasingDirection.Out, 
            0, 
            false, 
            0
        }, {
            Transparency = 1
        });
        _G.tween(v27, {
            0.5, 
            Enum.EasingStyle.Quad, 
            Enum.EasingDirection.Out, 
            0, 
            false, 
            0
        }, {
            CFrame = v27.CFrame * CFrame.new(0, 0, 100)
        });
        _G.destroy(v27, 0.5);
        return;
    end;
end;
return v0;