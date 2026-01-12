local v0 = false;
if script.Parent:IsDescendantOf(workspace) == false then
    return;
else
    local l_Parent_0 = script.Parent;
    local v2 = l_Parent_0:WaitForChild("Character", 1);
    v0 = v2 ~= nil;
    local v3 = l_Parent_0:WaitForChild("Gold.013");
    local l_RunService_0 = game:GetService("RunService");
    local v5 = {};
    local v6 = 0;
    local v7 = nil;
    local l_Descendants_0 = script.Parent:GetDescendants();
    for v9 = 1, #l_Descendants_0 do
        if l_Descendants_0[v9].Name == "Dark_Gold.002" then
            v7 = l_Descendants_0[v9];
        end;
        if l_Descendants_0[v9]:IsA("BasePart") and l_Descendants_0[v9].Material == Enum.Material.Neon or l_Descendants_0[v9]:IsA("ParticleEmitter") and l_Descendants_0[v9]:GetAttribute("recolorable") then
            table.insert(v5, l_Descendants_0[v9]);
        end;
    end;
    if v0 == true then
        for v10 = 1, #v5 do
            if v5[v10]:IsA("BasePart") then
                v5[v10].Parent = workspace.Effects;
            end;
        end;
        v3:GetPropertyChangedSignal("Transparency"):Connect(function() --[[ Line: 29 ]]
            -- upvalues: v5 (copy), v3 (copy)
            for v11 = 1, #v5 do
                if v5[v11]:IsA("BasePart") then
                    v5[v11].Transparency = v3.Transparency;
                end;
            end;
        end);
        l_Parent_0.Destroying:Connect(function() --[[ Line: 36 ]]
            -- upvalues: v5 (copy)
            for v12 = 1, #v5 do
                pcall(function() --[[ Line: 38 ]]
                    -- upvalues: v5 (ref), v12 (copy)
                    v5[v12]:Destroy();
                end);
            end;
        end);
    end;
    local v13 = nil;
    if v2 ~= nil and v2.Value ~= nil then
        v13 = game.ReplicatedStorage:WaitForChild("Stats" .. v2.Value.Name, 600);
        if not v13 then
            return;
        else
            v13:WaitForChild("Customization"):WaitForChild("ASEChromaColor");
        end;
    end;
    local v14 = 0;
    l_RunService_0.Heartbeat:Connect(function(v15) --[[ Line: 53 ]]
        -- upvalues: l_Parent_0 (copy), v0 (ref), v6 (ref), v13 (ref), v5 (copy), v14 (ref), v3 (copy), v7 (ref)
        if l_Parent_0:IsDescendantOf(workspace) == false then
            script:Destroy();
            return;
        else
            if v0 == true then
                if l_Parent_0.PrimaryPart == nil then
                    return;
                elseif (workspace.CurrentCamera.CFrame.Position - l_Parent_0.PrimaryPart.Position).Magnitude >= 100 then
                    return;
                end;
            end;
            v6 = (v6 + v15 * 0.05) % 1;
            local v16 = Color3.fromHSV(v6, 1, 1);
            if v13 and v13.Settings.CustomASEChroma.Value == true then
                v16 = v13.Customization.ASEChromaColor.Value;
            end;
            for _, v18 in ipairs(v5) do
                if v18:IsA("BasePart") then
                    v18.Color = v16;
                elseif v18:IsA("ParticleEmitter") then
                    v18.Color = ColorSequence.new(v16);
                end;
            end;
            if tick() - v14 >= Random.new():NextNumber(0.2, 0.4) and _G.PlayEffect ~= nil and v3.Transparency ~= 1 then
                _G.PlayEffect("ASEGlitch", nil, v7, v16);
                v14 = tick();
            end;
            return;
        end;
    end);
    return;
end;