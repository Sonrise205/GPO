local v0 = {};
local v1 = _G.getEffect("Shockwave2");
local v2 = _G.getEffect("Beam");
v0.start = function(_, v4) --[[ Line: 6 ]] --[[ Name: start ]]
    -- upvalues: v2 (copy), v1 (copy)
    local l_char_0 = v4.char;
    local l_info_0 = v4.info;
    if _G.checkRenderDistance(l_char_0.HumanoidRootPart.CFrame.p) == false then
        return;
    else
        l_info_0 = {};
        local l_l_char_0_Children_0 = l_char_0:GetChildren();
        for v8 = 1, #l_l_char_0_Children_0 do
            if l_l_char_0_Children_0[v8]:IsA("BasePart") and l_l_char_0_Children_0[v8].Name ~= "Head" and l_l_char_0_Children_0[v8]:IsA("MeshPart") and l_l_char_0_Children_0[v8].Size.Magnitude > 1 then
                table.insert(l_info_0, {
                    l_l_char_0_Children_0[v8], 
                    l_l_char_0_Children_0[v8].CFrame
                });
            end;
        end;
        for v9 = 1, #l_info_0 do
            if l_info_0[v9][1].Parent == l_char_0 then
                local v10 = l_info_0[v9][1];
                local v11 = l_info_0[v9][2];
                local v12 = v10:Clone();
                v12:BreakJoints();
                v12:ClearAllChildren();
                v12.Anchored = false;
                v12.Parent = workspace.Effects;
                v12.Name = "TekkaiEffect";
                v12.CFrame = v11 * CFrame.new(0, v12.Size.Y / 2, 0);
                v12.Transparency = -0.5;
                v12.CanCollide = false;
                v12.Massless = true;
                v12.Color = Color3.fromRGB(101, 147, 255);
                v12.Material = "Neon";
                v12.Size = Vector3.new(v12.Size.X * 1.1, 0.05, v12.Size.Z * 1.1);
                local v13 = script.teka:Clone();
                v13.Parent = v10;
                v13:Emit(3);
                _G.destroy(v13, 2);
                _G.destroy(v12, 0.5);
                local v14 = Instance.new("Weld", v10);
                v14.Part0 = v10;
                v14.Part1 = v12;
                v14.C0 = CFrame.new(0, v10.Size.Y / 2, 0);
                local v15 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0);
                local v16 = {
                    Transparency = 1, 
                    Color = BrickColor.new("Pastel light blue").Color
                };
                game:GetService("TweenService"):Create(v12, v15, v16):Play();
                local v17 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0);
                local v18 = {
                    C0 = CFrame.new(0, -v10.Size.Y / 4, 0)
                };
                game:GetService("TweenService"):Create(v14, v17, v18):Play();
            end;
        end;
        local v19 = CFrame.new(l_char_0.HumanoidRootPart.CFrame.p) * CFrame.new(0, -2, 0);
        v2:start(v19, 15, 0, 0.25, ColorSequence.new(BrickColor.new("Pastel light blue").Color, Color3.fromRGB(255, 255, 255)), 1, 15, 50, nil, NumberSequence.new(0.8, 1));
        v1:start(v19 * CFrame.new(0, 5, 0), v19, BrickColor.new("Institutional white"), Vector3.new(8, 0.10000000149011612, 8, 0), Vector3.new(2, 0.20000000298023224, 2, 0), 0.25, -1, Enum.EasingStyle.Quad, nil, Enum.Material.Neon, "Rings");
        v1:start(v19, v19 * CFrame.new(0, 4, 0), BrickColor.new("Institutional white"), Vector3.new(15, 0.4000000059604645, 15, 0), Vector3.new(2, 0.20000000298023224, 2, 0), 0.25, -1, Enum.EasingStyle.Quad, nil, Enum.Material.Neon, "g2");
        local v20 = script.tekkaip.Attachment.Shockwave:Clone();
        v20.Parent = l_char_0.UpperTorso.WaistRigAttachment;
        v20:Emit(1);
        local v21 = script.tekkaip.Attachment.teks:Clone();
        v21.Parent = l_char_0.Head;
        v21:Play();
        _G.destroy(v21, 5);
        _G.destroy(v20, 5);
        return;
    end;
end;
return v0;