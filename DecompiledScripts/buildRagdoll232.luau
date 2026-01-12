local _ = game:GetService("HttpService");
local l_CollectionService_0 = game:GetService("CollectionService");
local l_buildConstraints_0 = require(script:WaitForChild("buildConstraints"));
local l_buildCollisionFilters_0 = require(script:WaitForChild("buildCollisionFilters"));
local function v12(v4) --[[ Line: 24 ]] --[[ Name: buildAttachmentMap ]]
    local v5 = {};
    for _, v7 in ipairs(v4:GetChildren()) do
        if v7:IsA("BasePart") and v7.CanQuery == true then
            for _, v9 in ipairs(v7:GetChildren()) do
                if v9:IsA("Attachment") then
                    local v10 = string.match(v9.Name, "^(.+)RigAttachment$");
                    local v11 = v10 and v9.Parent:FindFirstChild(v10) or nil;
                    if v11 and v11:IsA("Motor6D") and v11.Part0 and v11.Part1 then
                        v5[v9.Name] = {
                            Joint = v11, 
                            Attachment0 = v11.Part0[v9.Name], 
                            Attachment1 = v11.Part1[v9.Name]
                        };
                    end;
                end;
            end;
        end;
    end;
    return v5;
end;
local v13 = {};
local l_Descendants_0 = script.Dummy:GetDescendants();
for v15 = 1, #l_Descendants_0 do
    if l_Descendants_0[v15]:IsA("Attachment") then
        if v13[l_Descendants_0[v15].Parent.Name] == nil then
            v13[l_Descendants_0[v15].Parent.Name] = {};
        end;
        table.insert(v13[l_Descendants_0[v15].Parent.Name], l_Descendants_0[v15]);
    end;
end;
return function(v16) --[[ Line: 62 ]]
    -- upvalues: v13 (copy), v12 (copy), l_buildConstraints_0 (copy), l_buildCollisionFilters_0 (copy), l_CollectionService_0 (copy)
    local l_Parent_0 = v16.Parent;
    if l_Parent_0:FindFirstChild("RagdollConstraints") then
        return;
    else
        v16.BreakJointsOnDeath = false;
        local l_HumanoidRootPart_0 = l_Parent_0:FindFirstChild("HumanoidRootPart");
        if l_HumanoidRootPart_0 then
            l_HumanoidRootPart_0.CanCollide = false;
        end;
        for v19, v20 in pairs(v13) do
            local l_l_Parent_0_FirstChild_0 = l_Parent_0:FindFirstChild(v19);
            if l_Parent_0:FindFirstChild(v19) then
                for v22 = 1, #v20 do
                    if l_l_Parent_0_FirstChild_0 and l_l_Parent_0_FirstChild_0:FindFirstChild(v20[v22].Name) == nil then
                        v20[v22]:Clone().Parent = l_l_Parent_0_FirstChild_0;
                    end;
                end;
            end;
        end;
        local v23 = v12(l_Parent_0);
        local v24 = l_buildConstraints_0(v23);
        l_buildCollisionFilters_0(v23, l_Parent_0.PrimaryPart).Parent = v24;
        v24.Parent = l_Parent_0;
        l_CollectionService_0:AddTag(v16, "Ragdoll");
        return;
    end;
end;