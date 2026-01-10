local l_getLastWordFromPascalCase_0 = require(script.Parent:WaitForChild("getLastWordFromPascalCase"));
local v1 = {
    Hand = "Arm", 
    Foot = "Leg"
};
local function _(v2) --[[ Line: 43 ]] --[[ Name: getLimbType ]]
    -- upvalues: l_getLastWordFromPascalCase_0 (copy), v1 (copy)
    local v3 = l_getLastWordFromPascalCase_0(v2);
    return v1[v3] or v3;
end;
local function v19(v5, v6) --[[ Line: 72 ]] --[[ Name: getLimbs ]]
    -- upvalues: l_getLastWordFromPascalCase_0 (copy), v1 (copy)
    local v7 = {};
    local v8 = {};
    local v9 = {};
    local function v10(v11, v12) --[[ Line: 77 ]] --[[ Name: parsePart ]]
        -- upvalues: l_getLastWordFromPascalCase_0 (ref), v1 (ref), v7 (copy), v9 (copy), v8 (copy), v6 (copy), v10 (copy)
        if v11 == nil then
            return;
        else
            if v11 and v11.Name ~= "HumanoidRootPart" then
                local l_Name_0 = v11.Name;
                local v14 = l_getLastWordFromPascalCase_0(l_Name_0);
                local v15 = v1[v14] or v14;
                v7[v15] = v7[v15] or {};
                table.insert(v7[v15], v11);
                l_Name_0 = v7[v15];
                if v15 ~= v12 then
                    v9[v15] = v9[v15] or {};
                    if v12 then
                        v9[v15][v12] = true;
                    end;
                    table.insert(v8, {
                        Part = v11, 
                        Type = v15
                    });
                    v12 = v15;
                end;
            end;
            for _, v17 in ipairs(v11:GetChildren()) do
                if v17:isA("Attachment") and v6[v17.Name] then
                    local l_Parent_0 = v6[v17.Name].Attachment1.Parent;
                    if l_Parent_0 and l_Parent_0 ~= v11 then
                        v10(l_Parent_0, v12);
                    end;
                end;
            end;
            return;
        end;
    end;
    v10(v5);
    return v7, v8, v9;
end;
local function _(v20, v21) --[[ Line: 113 ]] --[[ Name: createNoCollision ]]
    local l_NoCollisionConstraint_0 = Instance.new("NoCollisionConstraint");
    l_NoCollisionConstraint_0.Name = v20.Name .. "<->" .. v21.Name;
    l_NoCollisionConstraint_0.Part0 = v20;
    l_NoCollisionConstraint_0.Part1 = v21;
    return l_NoCollisionConstraint_0;
end;
return function(v24, v25) --[[ Line: 122 ]]
    -- upvalues: v19 (copy)
    local l_Folder_0 = Instance.new("Folder");
    l_Folder_0.Name = "NoCollisionConstraints";
    local v27, v28, v29 = v19(v25, v24);
    for v30, v31 in ipairs(v28) do
        local v32 = v28[v30 + 1];
        if v32 then
            local l_Type_0 = v31.Type;
            local l_Type_1 = v32.Type;
            if not v29[l_Type_0][l_Type_1] and not v29[l_Type_1][l_Type_0] then
                local l_Part_0 = v31.Part;
                local l_Part_1 = v32.Part;
                local l_NoCollisionConstraint_1 = Instance.new("NoCollisionConstraint");
                l_NoCollisionConstraint_1.Name = l_Part_0.Name .. "<->" .. l_Part_1.Name;
                l_NoCollisionConstraint_1.Part0 = l_Part_0;
                l_NoCollisionConstraint_1.Part1 = l_Part_1;
                l_NoCollisionConstraint_1.Parent = l_Folder_0;
            end;
        end;
    end;
    for v38, v39 in pairs(v27) do
        for v40, _ in pairs(v29[v38]) do
            for _, v43 in v27[v40] do
                for _, v45 in ipairs(v39) do
                    local l_NoCollisionConstraint_2 = Instance.new("NoCollisionConstraint");
                    l_NoCollisionConstraint_2.Name = v45.Name .. "<->" .. v43.Name;
                    l_NoCollisionConstraint_2.Part0 = v45;
                    l_NoCollisionConstraint_2.Part1 = v43;
                    l_NoCollisionConstraint_2.Parent = l_Folder_0;
                end;
            end;
        end;
    end;
    return l_Folder_0;
end;