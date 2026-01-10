local v0 = {};
local _ = _G.getEffect("Shockwave2");
local _ = _G.getEffect("Beam");
local _ = game:GetService("PhysicsService");
local v4 = {};
local function _(v5) --[[ Line: 9 ]] --[[ Name: clearDecals ]]
    local l_v5_Children_0 = v5:GetChildren();
    for v7 = 1, #l_v5_Children_0 do
        if l_v5_Children_0[v7]:IsA("Decal") then
            l_v5_Children_0[v7]:Destroy();
        end;
    end;
end;
v0.start = function(_, v10) --[[ Line: 18 ]] --[[ Name: start ]]
    -- upvalues: v4 (copy)
    local l_char_0 = v10.char;
    local l_ti_0 = v10.ti;
    local l_noSound_0 = v10.noSound;
    if l_ti_0 == nil then
        l_ti_0 = 0.5;
    end;
    if l_char_0 == nil then
        return;
    elseif l_char_0.PrimaryPart == nil then
        return;
    elseif _G.checkRenderDistance(l_char_0.HumanoidRootPart.CFrame.p) == false then
        return;
    else
        local _ = l_char_0.UpperTorso.Position;
        task.spawn(function() --[[ Line: 35 ]]
            -- upvalues: l_char_0 (copy), l_ti_0 (ref), v4 (ref), l_noSound_0 (copy)
            local v15 = {};
            local _ = function(v16, _) --[[ Line: 37 ]] --[[ Name: trans ]]
                -- upvalues: l_char_0 (ref), v15 (ref), l_ti_0 (ref), v4 (ref)
                local v18 = nil;
                v18 = v16 ~= 1;
                local l_l_char_0_Descendants_0 = l_char_0:GetDescendants();
                local v20 = _G.getAccessorys(l_char_0);
                for v21 = 1, #v20 do
                    table.insert(l_l_char_0_Descendants_0, v20[v21]);
                end;
                if #v15 == 0 then
                    for v22 = 1, #l_l_char_0_Descendants_0 do
                        if (l_l_char_0_Descendants_0[v22]:IsA("BasePart") or l_l_char_0_Descendants_0[v22]:IsA("Decal")) and l_l_char_0_Descendants_0[v22].Transparency ~= v16 and l_l_char_0_Descendants_0[v22].Transparency ~= v16 then
                            table.insert(v15, l_l_char_0_Descendants_0[v22]);
                            if l_ti_0 ~= 0 then
                                l_l_char_0_Descendants_0[v22].Transparency = v16;
                            end;
                        elseif (l_l_char_0_Descendants_0[v22]:IsA("BillboardGui") or l_l_char_0_Descendants_0[v22]:IsA("ParticleEmitter") or l_l_char_0_Descendants_0[v22]:IsA("Beam") or l_l_char_0_Descendants_0[v22]:IsA("PointLight")) and l_l_char_0_Descendants_0[v22].Enabled ~= v18 then
                            table.insert(v15, l_l_char_0_Descendants_0[v22]);
                            l_l_char_0_Descendants_0[v22].Enabled = v18;
                        end;
                    end;
                    return;
                else
                    for v23 = 1, #v15 do
                        local v24 = v15[v23];
                        if (v24:IsA("BasePart") or v24:IsA("Decal")) and v24.Transparency ~= v16 then
                            v24.Transparency = v16;
                            if v4[v24] then
                                v24.Transparency = v4[v24];
                                v4[v24] = nil;
                            end;
                        elseif (v24:IsA("BillboardGui") or v24:IsA("ParticleEmitter") or v24:IsA("Beam") or v24:IsA("PsdointLight")) and v24.Enabled ~= v18 then
                            v24.Enabled = v18;
                        end;
                    end;
                    v15 = {};
                    return;
                end;
            end;
            local v26 = script.sorun:Clone();
            v26.CFrame = CFrame.new(l_char_0.UpperTorso.Position);
            v26.Parent = workspace.Effects;
            _G.customEmit(v26);
            local l_HumanoidRootPart_0 = l_char_0.HumanoidRootPart;
            local v28 = nil;
            local v29 = nil;
            v28 = Instance.new("Attachment", l_HumanoidRootPart_0);
            v28.Position = Vector3.new(l_HumanoidRootPart_0.Size.X / 2, 0, 0);
            _G.tween(v28, {
                0.25, 
                Enum.EasingStyle.Quad, 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                Position = Vector3.new(0, 0, 0, 0)
            });
            v29 = Instance.new("Attachment", l_HumanoidRootPart_0);
            v29.Position = Vector3.new(-l_HumanoidRootPart_0.Size.X / 2, 0, 0);
            _G.tween(v29, {
                0.25, 
                Enum.EasingStyle.Quad, 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                Position = Vector3.new(0, 0, 0, 0)
            });
            local v30 = script.GepoTrail:Clone();
            v30.Color = ColorSequence.new(Color3.fromRGB(0, 0, 0));
            v30.Attachment0 = v28;
            v30.Attachment1 = v29;
            v30.Transparency = NumberSequence.new(0.8, 1);
            v30.WidthScale = NumberSequence.new(1);
            v30.Parent = workspace.Effects;
            if l_noSound_0 == nil then
                local v31 = script["SoruNew" .. math.random(1, 2)]:Clone();
                v31.Parent = l_char_0.Head;
                v31:Play();
                _G.destroy(v31, 2);
            end;
            if game.Players.LocalPlayer.PlayerGui:FindFirstChild("HealthBars") and game.Players.LocalPlayer.PlayerGui.HealthBars:FindFirstChild(l_char_0.Name) then
                game.Players.LocalPlayer.PlayerGui.HealthBars:FindFirstChild(l_char_0.Name).Enabled = false;
            end;
            task.spawn(function() --[[ Line: 120 ]]
                -- upvalues: l_ti_0 (ref), v30 (copy), v28 (ref), v29 (ref)
                task.wait(l_ti_0);
                v30.Enabled = false;
                if v28 then
                    _G.destroy(v28, v30.Lifetime);
                    _G.destroy(v29, v30.Lifetime);
                end;
                _G.destroy(v30, v30.Lifetime);
            end);
            _G.destroy(v26, 3);
            _G.transparentCharacter(l_char_0);
            if l_ti_0 ~= 0 then
                task.wait(l_ti_0);
                _G.transparentCharacter(l_char_0, true);
                local v32 = script.sorun:Clone();
                v32.CFrame = CFrame.new(l_char_0.UpperTorso.Position);
                v32.Parent = workspace.Effects;
                _G.customEmit(v32);
                _G.destroy(v32, 3);
            end;
            if game.Players.LocalPlayer.PlayerGui.HealthBars:FindFirstChild(l_char_0.Name) then
                game.Players.LocalPlayer.PlayerGui.HealthBars:FindFirstChild(l_char_0.Name).Enabled = true;
            end;
        end);
        return;
    end;
end;
return v0;