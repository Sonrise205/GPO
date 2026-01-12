local v0 = {};
local function v4(v1) --[[ Line: 3 ]] --[[ Name: getrid ]]
    local l_v1_Children_0 = v1:GetChildren();
    for v3 = 1, #l_v1_Children_0 do
        if l_v1_Children_0[v3]:IsA("Weld") == false and l_v1_Children_0[v3]:IsA("ParticleEmitter") == false and l_v1_Children_0[v3]:FindFirstChildWhichIsA("ParticleEmitter") == nil then
            l_v1_Children_0[v3]:Destroy();
        end;
    end;
end;
local function v9(v5) --[[ Line: 12 ]] --[[ Name: setup ]]
    local l_v5_Descendants_0 = v5:GetDescendants();
    for v7 = 1, #l_v5_Descendants_0 do
        local v8 = l_v5_Descendants_0[v7];
        if (v8:IsA("Attachment") or v8:IsA("Motor6D") or v8:IsA("Vector3Value")) and v8:IsA("Bone") == false and v8:FindFirstChildWhichIsA("ParticleEmitter") == nil then
            v8:Destroy();
        end;
    end;
end;
v0.PutOn = function(_, v11, v12) --[[ Line: 22 ]] --[[ Name: PutOn ]]
    -- upvalues: v9 (copy), v4 (copy)
    v9(v12);
    local l_v11_Children_0 = v11:GetChildren();
    for v14 = 1, #l_v11_Children_0 do
        if v12:FindFirstChild(l_v11_Children_0[v14].Name) and l_v11_Children_0[v14]:GetAttribute("preClothInvis") ~= nil then
            v11[l_v11_Children_0[v14].Name].Transparency = 0;
            v11[l_v11_Children_0[v14].Name]:SetAttribute("preClothInvis", nil);
        end;
    end;
    local l_v12_Children_0 = v12:GetChildren();
    for v16 = 1, #l_v12_Children_0 do
        if v11:FindFirstChild(l_v12_Children_0[v16].Name) then
            local l_Weld_0 = Instance.new("Weld");
            l_Weld_0.Part0 = v11[l_v12_Children_0[v16].Name];
            l_Weld_0.Part1 = l_v12_Children_0[v16];
            l_Weld_0.Parent = l_v12_Children_0[v16];
            l_Weld_0.Name = l_v12_Children_0[v16].Name .. " Weld";
            v4(l_v12_Children_0[v16]);
            l_v12_Children_0[v16].Transparency = 1;
            if l_v12_Children_0[v16]:GetAttribute("invisible") ~= nil then
                v11[l_v12_Children_0[v16].Name].Transparency = 1;
                v11[l_v12_Children_0[v16].Name]:SetAttribute("preClothInvis", true);
            elseif v11[l_v12_Children_0[v16].Name]:GetAttribute("preClothInvis") ~= nil then
                v11[l_v12_Children_0[v16].Name].Transparency = 0;
                v11[l_v12_Children_0[v16].Name]:SetAttribute("preClothInvis", nil);
            end;
        end;
    end;
end;
return v0;