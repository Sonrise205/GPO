local function v6(v0, v1) --[[ Line: 2 ]] --[[ Name: ScaleModel ]]
    local l_PrimaryPart_0 = v0.PrimaryPart;
    local l_CFrame_0 = l_PrimaryPart_0.CFrame;
    for _, v5 in (v0:GetChildren()) do
        if v5:IsA("BasePart") then
            v5.Size = v5.Size * v1;
            if v5 ~= l_PrimaryPart_0 then
                v5.CFrame = l_CFrame_0 + l_CFrame_0:inverse() * v5.Position * v1;
            end;
        end;
    end;
    return v0;
end;
local function _(v7, v8) --[[ Line: 16 ]] --[[ Name: destroy ]]
    spawn(function() --[[ Line: 17 ]]
        -- upvalues: v8 (copy), v7 (copy)
        task.wait(v8);
        if v7 then
            v7:Destroy();
        end;
    end);
end;
local function v26(v10, v11, v12) --[[ Line: 26 ]] --[[ Name: crack ]]
    local l_v10_Children_0 = v10:GetChildren();
    for v14 = 1, #l_v10_Children_0 do
        if l_v10_Children_0[v14] ~= v10.PrimaryPart then
            local l_CFrame_1 = l_v10_Children_0[v14].CFrame;
            l_v10_Children_0[v14].Parent = nil;
            l_v10_Children_0[v14].CFrame = CFrame.new(l_CFrame_1.p) * CFrame.new(math.random(-500, 500), -1000, math.random(-500, 500)) * CFrame.Angles(math.rad((math.random(-360, 360))), math.rad((math.random(-360, 360))), (math.rad((math.random(-360, 360)))));
            local v16 = Ray.new(l_CFrame_1.p, (l_CFrame_1.Position - l_v10_Children_0[v14].Position).unit * -1000);
            local v17, v18, _ = _G.raycastWhitelist(v16, {
                workspace.Islands, 
                workspace.Ships
            });
            if v18.Y < workspace.Env.WaterStuff.Falls.Position.Y then
                v18 = Vector3.new(v18.X, workspace.Env.WaterStuff.Falls.Position.Y, v18.Z);
            end;
            l_v10_Children_0[v14].CFrame = CFrame.new(v18) * CFrame.Angles(math.rad((math.random(-360, 360))), math.rad((math.random(-360, 360))), (math.rad((math.random(-360, 360)))));
            if v17 and v18.Y > workspace.Env.WaterStuff.Falls.Position.Y then
                l_v10_Children_0[v14].Color = v17.Color;
                l_v10_Children_0[v14].Material = v17.Material;
            else
                l_v10_Children_0[v14].Color = workspace.Env.WaterStuff.Falls.Color;
                l_v10_Children_0[v14].Material = Enum.Material.Granite;
            end;
            spawn(function() --[[ Line: 49 ]]
                -- upvalues: l_v10_Children_0 (copy), v14 (copy), v10 (copy), l_CFrame_1 (copy)
                task.wait(math.random(300, 800) / 1000);
                l_v10_Children_0[v14].Parent = v10;
                _G.tween(l_v10_Children_0[v14], {
                    math.random(500, 1000) / 1000, 
                    Enum.EasingStyle.Quint, 
                    Enum.EasingDirection.Out, 
                    0, 
                    false
                }, {
                    CFrame = l_CFrame_1
                });
            end);
            spawn(function() --[[ Line: 55 ]]
                -- upvalues: v11 (copy), v12 (copy), l_v10_Children_0 (copy), v14 (copy), v10 (copy), l_CFrame_1 (copy)
                if v11 == v12 then
                    task.wait(2);
                    _G.tween(l_v10_Children_0[v14], {
                        0.25, 
                        Enum.EasingStyle.Cubic, 
                        Enum.EasingDirection.Out, 
                        0, 
                        false
                    }, {
                        CFrame = v10.PrimaryPart.CFrame:Lerp(l_CFrame_1, 0.75), 
                        Size = l_v10_Children_0[v14].Size * 0.75
                    });
                    task.wait(0.35);
                    l_v10_Children_0[v14].Parent = workspace.Effects;
                    l_v10_Children_0[v14].Anchored = false;
                    local v20 = l_v10_Children_0[v14].Size.Magnitude * 7;
                    l_v10_Children_0[v14].Velocity = Vector3.new(math.random(-v20, v20), math.random(-50, 175), math.random(-v20, v20));
                    l_v10_Children_0[v14].RotVelocity = Vector3.new(math.random(-5, 5), math.random(-5, 5), math.random(-5, 5));
                    local v21 = nil;
                    do
                        local l_v21_0 = v21;
                        l_v21_0 = l_v10_Children_0[v14].Touched:Connect(function(v23) --[[ Line: 69 ]]
                            -- upvalues: l_v10_Children_0 (ref), v14 (ref), l_v21_0 (ref)
                            if v23 and v23:IsDescendantOf(workspace.Islands) then
                                l_v10_Children_0[v14].Anchored = true;
                                l_v10_Children_0[v14].Transparency = 1;
                                local v24 = script.ParticleEmitter:Clone();
                                v24.Parent = l_v10_Children_0[v14];
                                v24.Color = ColorSequence.new(l_v10_Children_0[v14].Color);
                                v24.Size = NumberSequence.new(l_v10_Children_0[v14].Size.Magnitude / 2);
                                v24:Emit(25);
                                local v25 = script["brickburst" .. math.random(1, 3)]:Clone();
                                v25.Parent = l_v10_Children_0[v14];
                                v25:Play();
                                l_v21_0:Disconnect();
                            end;
                        end);
                    end;
                end;
            end);
        end;
    end;
end;
local function v32(v27) --[[ Line: 90 ]] --[[ Name: wave ]]
    for v28 = 1, 6 do
        local v29 = script.CircleShockwave:Clone();
        v29.Parent = workspace.Effects;
        v29.CFrame = v27 * CFrame.Angles(math.rad(v28 * 60), 0, 0);
        _G.tween(v29, {
            0.25, 
            Enum.EasingStyle.Quad, 
            Enum.EasingDirection.Out, 
            0, 
            false
        }, {
            Transparency = 1, 
            Size = Vector3.new(300, 2, 300, 0)
        });
        local l_spawn_0 = spawn;
        local v31 = 0.25;
        l_spawn_0(function() --[[ Line: 17 ]]
            -- upvalues: v31 (copy), v29 (copy)
            task.wait(v31);
            if v29 then
                v29:Destroy();
            end;
        end);
    end;
end;
local v33 = {};
local _ = function(v34, v35) --[[ Line: 104 ]] --[[ Name: scale ]]
    -- upvalues: v33 (copy), v6 (copy)
    if v33[v35] == nil then
        local _ = v6(v34, v35);
        v33[v35] = v34:Clone();
        return v34;
    else
        local v37 = v33[v35]:Clone();
        v37.Parent = v34.Parent;
        v34:Destroy();
        v34 = v37;
        return v37;
    end;
end;
local v39 = {};
local function v46(v40, v41) --[[ Line: 120 ]] --[[ Name: suckAll ]]
    local l_Descendants_0 = workspace.Projectiles:GetDescendants();
    for v43 = 1, #l_Descendants_0 do
        if l_Descendants_0[v43]:IsA("BasePart") and (l_Descendants_0[v43].Position - v40.Position).magnitude <= 800 and l_Descendants_0[v43]:FindFirstChild("tenseiSucked") == nil then
            local v44 = Instance.new("ObjectValue", l_Descendants_0[v43]);
            v44.Name = "tenseiSucked";
            v44.Value = v41;
            if l_Descendants_0[v43].Parent:IsA("Model") then
                local v45 = Instance.new("ObjectValue", l_Descendants_0[v43].Parent);
                v45.Name = "tenseiSucked";
                v45.Value = v41;
            end;
            l_Descendants_0[v43].Anchored = true;
        end;
    end;
end;
v39.start = function(_, v48) --[[ Line: 137 ]] --[[ Name: start ]]
    -- upvalues: v46 (copy), v33 (copy), v6 (copy), v26 (copy), v32 (copy)
    local _ = v48.target;
    local l_char_0 = v48.char;
    local l_max_0 = v48.max;
    local l_targetCF_0 = v48.targetCF;
    local v53 = script.orb:Clone();
    v53.Parent = workspace.Effects;
    v53:PivotTo(l_char_0.HumanoidRootPart.CFrame);
    v53.PrimaryPart.Attachment.ParticleEmitter:Emit(1);
    v53.PrimaryPart.sfx2:Play();
    _G.tween(v53.PrimaryPart, {
        4, 
        Enum.EasingStyle.Linear, 
        Enum.EasingDirection.Out, 
        0, 
        false
    }, {
        CFrame = l_targetCF_0
    });
    task.wait(4);
    v53.PrimaryPart.sfx:Play();
    local l_Size_0 = script.phoeyuRock.Ball.Size;
    task.spawn(function() --[[ Line: 154 ]]
        -- upvalues: v46 (ref), l_targetCF_0 (copy), v53 (copy)
        for _ = 1, 80 do
            v46(l_targetCF_0, v53.PrimaryPart);
            task.wait(0.1);
        end;
    end);
    for v56 = 1, l_max_0 do
        if _G.checkRenderDistance(l_targetCF_0.Position) == false then
            return;
        else
            if v56 == l_max_0 then
                _G.tween(v53.PrimaryPart.sfx, {
                    3, 
                    Enum.EasingStyle.Quad, 
                    Enum.EasingDirection.Out, 
                    0, 
                    false
                }, {
                    Volume = 0
                });
            end;
            local v57 = script.phoeyuRock:Clone();
            local v58 = 1 + v56;
            local v59;
            if v33[v58] == nil then
                local _ = v6(v57, v58);
                v33[v58] = v57:Clone();
                v59 = v57;
            else
                local v61 = v33[v58]:Clone();
                v61.Parent = v57.Parent;
                v57:Destroy();
                v57 = v61;
                v59 = v61;
            end;
            v59:PivotTo(l_targetCF_0);
            v59:PivotTo(v59.PrimaryPart.CFrame * CFrame.Angles(math.rad((math.random(-360, 360))), math.rad((math.random(-360, 360))), (math.rad((math.random(-360, 360))))));
            v57 = v59.PrimaryPart.Size;
            v59.PrimaryPart.Size = l_Size_0;
            l_Size_0 = v57 * 0.25;
            v26(v59, v56, l_max_0);
            v59.Parent = workspace.Env;
            _G.tween(v59.PrimaryPart, {
                1.5, 
                Enum.EasingStyle.Quad, 
                Enum.EasingDirection.Out, 
                0, 
                false
            }, {
                Size = v57
            });
            if v56 ~= l_max_0 then
                v58 = v59;
                local l_spawn_1 = spawn;
                local v63 = 1.8;
                l_spawn_1(function() --[[ Line: 17 ]]
                    -- upvalues: v63 (copy), v58 (copy)
                    task.wait(v63);
                    if v58 then
                        v58:Destroy();
                    end;
                end);
            else
                task.wait(2);
                _G.tween(v59.PrimaryPart, {
                    0.25, 
                    Enum.EasingStyle.Exponential, 
                    Enum.EasingDirection.Out, 
                    0, 
                    false
                }, {
                    Size = Vector3.new(0, 0, 0, 0)
                });
                task.wait(0.35);
                v32(v59.PrimaryPart.CFrame);
                v59.PrimaryPart.sfx:play();
                _G.tween(v59.PrimaryPart, {
                    0.25, 
                    Enum.EasingStyle.Quad, 
                    Enum.EasingDirection.Out, 
                    0, 
                    false
                }, {
                    Size = v59.PrimaryPart.Size * 2, 
                    Transparency = 1
                });
                v58 = v59;
                local l_spawn_2 = spawn;
                local v65 = 15;
                l_spawn_2(function() --[[ Line: 17 ]]
                    -- upvalues: v65 (copy), v58 (copy)
                    task.wait(v65);
                    if v58 then
                        v58:Destroy();
                    end;
                end);
            end;
            task.wait(0.25);
        end;
    end;
    v53:Destroy();
end;
return v39;