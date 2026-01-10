local l_CollectionService_0 = game:GetService("CollectionService");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local v3 = {
    [Enum.HumanoidStateType.Physics] = true
};
local v4 = {};
local function v15(v5, v6) --[[ Line: 15 ]] --[[ Name: setRagdollEnabled ]]
    local l_Parent_0 = v5.Parent;
    if not l_Parent_0 then
        return;
    else
        local v8 = l_Parent_0:WaitForChild("RagdollConstraints", 0.5);
        if not v8 then
            return;
        else
            for _, v10 in ipairs(v8:GetChildren()) do
                if v10:IsA("Constraint") then
                    local l_Attachment1_0 = v10.Attachment1;
                    if not l_Attachment1_0 then
                        for v12 = 1, 6 do
                            l_Attachment1_0 = v10.Attachment1;
                            if not l_Attachment1_0 then
                                task.wait(v12 * 0.1);
                            else
                                break;
                            end;
                        end;
                        if not l_Attachment1_0 then
                            continue;
                        end;
                    end;
                    local l_Value_0 = v10.RigidJoint.Value;
                    local v14 = not v6 and l_Attachment1_0.Parent or nil;
                    if l_Value_0 ~= nil and l_Value_0.Part1 ~= v14 then
                        l_Value_0.Part1 = v14;
                    end;
                end;
            end;
            if v6 == true then
                v5:SetAttribute("isRagdolled", true);
                return;
            else
                if v5:GetAttribute("forcedRagdoll") == nil then
                    v5:SetAttribute("isRagdolled", nil);
                end;
                return;
            end;
        end;
    end;
end;
local function _(v16) --[[ Line: 69 ]] --[[ Name: hasRagdollOwnership ]]
    -- upvalues: l_RunService_0 (copy), l_Players_0 (copy)
    if l_RunService_0:IsServer() then
        return true;
    else
        return l_Players_0:GetPlayerFromCharacter(v16.Parent) == l_Players_0.LocalPlayer;
    end;
end;
local function v24(v18) --[[ Line: 81 ]] --[[ Name: ragdollAdded ]]
    -- upvalues: v4 (copy), v3 (copy), l_RunService_0 (copy), l_Players_0 (copy), v15 (copy)
    v4[v18] = v18.StateChanged:Connect(function(_, v20) --[[ Line: 82 ]]
        -- upvalues: v3 (ref), v18 (copy), l_RunService_0 (ref), l_Players_0 (ref), v15 (ref)
        local v21 = v3[v20];
        local l_v18_0 = v18;
        if l_RunService_0:IsServer() and true or l_Players_0:GetPlayerFromCharacter(l_v18_0.Parent) == l_Players_0.LocalPlayer then
            if v21 == true then
                v15(v18, true);
                return;
            else
                v15(v18, false);
            end;
        end;
    end);
    if _G.Ragdolls ~= nil then
        _G.Ragdolls[v18] = function(v23) --[[ Line: 94 ]]
            -- upvalues: v15 (ref), v18 (copy)
            if v23 == true then
                v15(v18, true);
                return;
            else
                v15(v18, false);
                return;
            end;
        end;
    end;
end;
local function v26(v25) --[[ Line: 104 ]] --[[ Name: ragdollRemoved ]]
    -- upvalues: v4 (copy)
    v4[v25]:Disconnect();
    v4[v25] = nil;
    if _G.Ragdolls then
        _G.Ragdolls[v25] = nil;
    end;
end;
l_CollectionService_0:GetInstanceAddedSignal("Ragdoll"):Connect(v24);
l_CollectionService_0:GetInstanceRemovedSignal("Ragdoll"):Connect(v26);
for _, v28 in ipairs(l_CollectionService_0:GetTagged("Ragdoll")) do
    v24(v28);
end;
return nil;