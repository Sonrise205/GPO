local v0 = {};
local _ = _G.getEffect("Shockwave2");
local _ = _G.getEffect("Beam");
local function v8(v3) --[[ Line: 7 ]] --[[ Name: giveBolt ]]
    local v4 = {};
    local l_Children_0 = script.Bolts:GetChildren();
    for v6 = 1, #l_Children_0 do
        local v7 = l_Children_0[v6]:Clone();
        v7.Parent = v3;
        table.insert(v4, v7);
    end;
    return v4;
end;
v0.start = function(_, v10) --[[ Line: 18 ]] --[[ Name: start ]]
    -- upvalues: v8 (copy)
    local l_char_0 = v10.char;
    if l_char_0 == nil then
        return;
    elseif l_char_0:FindFirstChild("HumanoidRootPart") and _G.checkRenderDistance(l_char_0.HumanoidRootPart.CFrame.p) == false then
        return;
    else
        local l_CFrame_0 = l_char_0.HumanoidRootPart.CFrame;
        local v13 = Ray.new(l_CFrame_0.p, l_CFrame_0.upVector * -10);
        local v14, v15 = _G.raycastIgnoreList(v13, {
            workspace.Effects, 
            workspace.PlayerCharacters, 
            workspace.Projectiles
        });
        if v14 then
            local v16 = script.dust2:Clone();
            v16.Parent = workspace.Effects;
            local l_magnitude_0 = (l_CFrame_0.p - v15).magnitude;
            v16.CFrame = l_CFrame_0 * CFrame.new(0, -l_magnitude_0, 0);
            v16.Attachment.sm2.Color = ColorSequence.new(v14.Color);
            v16.Attachment.sm2:Emit(25);
            _G.destroy(v16, 1);
        end;
        local v18 = script.HumanoidRootPart.Attachment:Clone();
        v18.Parent = l_char_0.UpperTorso;
        _G.destroy(v18, 10);
        local v19 = {};
        local l_l_char_0_Children_0 = l_char_0:GetChildren();
        for v21 = 1, #l_l_char_0_Children_0 do
            if l_l_char_0_Children_0[v21]:IsA("BasePart") and l_l_char_0_Children_0[v21].Transparency ~= 1 then
                local v22 = v8(l_l_char_0_Children_0[v21]);
                for v23 = 1, #v22 do
                    table.insert(v19, v22[v23]);
                end;
            end;
        end;
        _G.PlaySound(l_char_0.Head, script.Electro);
        _G.PlaySound(l_char_0.Head, script["Jump (2)"], {
            TimePosition = 0.35
        });
        local v24 = script.Part.PointLight:Clone();
        v24.Parent = l_char_0.HumanoidRootPart;
        _G.tween(v24, {
            0.25, 
            Enum.EasingStyle.Quad, 
            Enum.EasingDirection.Out, 
            0, 
            true, 
            0
        }, {
            Range = 12
        });
        _G.destroy(v24, 0.5);
        task.spawn(function() --[[ Line: 58 ]]
            -- upvalues: v14 (copy), l_char_0 (copy)
            task.wait(0.2);
            if v14 then
                local v25 = script.Slide:Clone();
                v25.Parent = l_char_0.Head;
                v25:Play();
                _G.tween(v25, {
                    2, 
                    Enum.EasingStyle.Quad, 
                    Enum.EasingDirection.Out, 
                    0, 
                    false, 
                    0
                }, {
                    Volume = 0
                });
                _G.destroy(v25, 2);
            end;
        end);
        task.spawn(function() --[[ Line: 68 ]]
            -- upvalues: l_char_0 (copy)
            task.wait(0.65);
            local l_CFrame_1 = l_char_0.HumanoidRootPart.CFrame;
            local v27 = Ray.new(l_CFrame_1.p, l_CFrame_1.upVector * -10);
            local v28, _ = _G.raycastIgnoreList(v27, {
                workspace.Effects, 
                workspace.PlayerCharacters, 
                workspace.Projectiles
            });
            if v28 then
                local v30 = script.dust:Clone();
                v30.Parent = l_char_0;
                v30.Attachment.sm2.Color = ColorSequence.new(v28.Color);
                v30.Attachment.rocks.Color = ColorSequence.new(v28.Color);
                _G.destroy(v30, 1.5);
                local v31 = Instance.new("Weld", v30);
                v31.Part0 = l_char_0.HumanoidRootPart;
                v31.Part1 = v30;
                v31.C0 = CFrame.new(0, -2, 0);
                task.wait(0.35);
                v30.Attachment.sm2.Enabled = false;
                v30.Attachment.rocks.Enabled = false;
            end;
        end);
        task.spawn(function() --[[ Line: 91 ]]
            -- upvalues: v18 (copy), v19 (copy)
            task.wait(1);
            if v18:FindFirstChild("ParticleEmitter") then
                v18.ParticleEmitter.Enabled = false;
            end;
            _G.destroy(v18, 1);
            for v32 = 1, #v19 do
                v19[v32].Enabled = false;
                _G.destroy(v19[v32], 1);
            end;
        end);
        return;
    end;
end;
return v0;