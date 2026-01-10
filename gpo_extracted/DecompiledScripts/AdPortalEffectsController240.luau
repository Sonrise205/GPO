local l_Parent_0 = script.Parent.Parent;
local l_StateDependent_0 = script.Parent:WaitForChild("StateDependent");
local l_Blocker_0 = l_StateDependent_0:WaitForChild("Blocker");
local l_FX_0 = l_StateDependent_0:WaitForChild("FX");
local l_AdPortal_0 = l_Parent_0:WaitForChild("BasePortal"):WaitForChild("Door"):WaitForChild("AdPortal");
local function _(v5, v6) --[[ Line: 10 ]] --[[ Name: configureBlockerEffect ]]
    if v5:IsA("Part") then
        v5.Transparency = v6 and 1 or 0;
        v5.CanCollide = not v6;
    end;
end;
local function v10(v8, v9) --[[ Line: 17 ]] --[[ Name: configureVisualEffect ]]
    if v8:IsA("ParticleEmitter") or v8:IsA("Light") or v8:IsA("Beam") then
        v8.Enabled = v9;
        return;
    else
        if v8:IsA("UnionOperation") then
            v8.Transparency = v9 and 0 or 1;
            if v8.Name ~= "Arrow" then
                v8.CanCollide = v9;
                return;
            end;
        elseif v8:IsA("Sound") then
            if v9 then
                v8:Play();
                return;
            else
                v8:Stop();
            end;
        end;
        return;
    end;
end;
local function v16() --[[ Line: 35 ]] --[[ Name: onAdStatusChange ]]
    -- upvalues: l_AdPortal_0 (copy), l_Blocker_0 (copy), l_FX_0 (copy), v10 (copy)
    local v11 = l_AdPortal_0.Status == Enum.AdUnitStatus.Active;
    for _, v13 in pairs(l_Blocker_0:GetDescendants()) do
        if v13:IsA("Part") then
            v13.Transparency = v11 and 1 or 0;
            v13.CanCollide = not v11;
        end;
    end;
    for _, v15 in pairs(l_FX_0:GetDescendants()) do
        v10(v15, v11);
    end;
end;
l_AdPortal_0:GetPropertyChangedSignal("Status"):Connect(v16);
l_Blocker_0.DescendantAdded:Connect(function(v17) --[[ Line: 53 ]]
    -- upvalues: l_AdPortal_0 (copy)
    local v18 = l_AdPortal_0.Status == Enum.AdUnitStatus.Active;
    if v17:IsA("Part") then
        v17.Transparency = v18 and 1 or 0;
        v17.CanCollide = not v18;
    end;
end);
l_FX_0.DescendantAdded:Connect(function(v19) --[[ Line: 57 ]]
    -- upvalues: v10 (copy), l_AdPortal_0 (copy)
    v10(v19, l_AdPortal_0.Status == Enum.AdUnitStatus.Active);
end);
v16();