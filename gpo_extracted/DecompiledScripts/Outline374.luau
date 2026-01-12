local v0 = {};
local v1 = {
    Transparency = 1
};
v0.start = function(_, v3, v4, v5, v6, v7, v8) --[[ Line: 7 ]] --[[ Name: start ]]
    -- upvalues: v1 (copy)
    if v3.Parent == nil then
        return;
    elseif v3.PrimaryPart == nil then
        return;
    elseif (workspace.CurrentCamera.CFrame.Position - v3.PrimaryPart.Position).magnitude >= 300 then
        return;
    else
        local l_v3_Children_0 = v3:GetChildren();
        local v10 = {};
        for v11 = 1, #l_v3_Children_0 do
            if l_v3_Children_0[v11]:IsA("BasePart") and l_v3_Children_0[v11].Transparency ~= 1 then
                if l_v3_Children_0[v11]:FindFirstChild("Outline") then
                    l_v3_Children_0[v11].Outline:Destroy();
                end;
                local v12 = l_v3_Children_0[v11]:Clone();
                if v12.Name == "Head" then
                    v12 = script.head:Clone();
                    v12.Size = v12.Size * v3.Humanoid.HeadScale.Value;
                end;
                v12:ClearAllChildren();
                v12.Parent = workspace.Effects;
                v12.Anchored = false;
                v12.Size = v12.Size * 1.001;
                v12.CanCollide = false;
                v12.Massless = true;
                v12.CastShadow = false;
                v12.Material = Enum.Material.Neon;
                v12.Color = Color3.fromRGB(190, 104, 98);
                if v4 then
                    v12.Color = v4;
                end;
                v12.Name = "Outline";
                v12.Transparency = 0;
                if v6 then
                    v12.Transparency = v6;
                end;
                local l_Weld_0 = Instance.new("Weld");
                l_Weld_0.Parent = v12;
                l_Weld_0.Part0 = l_v3_Children_0[v11];
                l_Weld_0.Part1 = v12;
                if v7 == nil then
                    local v14 = TweenInfo.new(v5, Enum.EasingStyle.Quart, Enum.EasingDirection.In, 0, false, 0);
                    game:GetService("TweenService"):Create(v12, v14, v1):Play();
                    _G.destroy(v12, v5);
                else
                    local v15 = TweenInfo.new(v5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out, -1, true, 0);
                    local v16 = {
                        Transparency = 1, 
                        Color = v8
                    };
                    game:GetService("TweenService"):Create(v12, v15, v16):Play();
                    table.insert(v10, v12);
                end;
                local _ = workspace.CurrentCamera;
            end;
        end;
        if v7 == nil then
            return;
        else
            return function() --[[ Line: 77 ]]
                -- upvalues: v10 (copy)
                for v18 = 1, #v10 do
                    v10[v18]:Destroy();
                end;
            end;
        end;
    end;
end;
return v0;