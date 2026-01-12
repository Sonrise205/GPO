local l_CollectionService_0 = game:GetService("CollectionService");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local v3 = {
    [Enum.HumanoidStateType.Physics] = true
};
local v4 = {};
local v5 = {};
local function v16(v6, v7) --[[ Line: 16 ]] --[[ Name: snapToAttachments ]]
    local l_HumanoidRootPart_0 = v6:FindFirstChild("HumanoidRootPart");
    if not l_HumanoidRootPart_0 then
        return;
    else
        local _ = l_HumanoidRootPart_0.AssemblyLinearVelocity;
        for _, v11 in ipairs(v7:GetChildren()) do
            if v11:IsA("BallSocketConstraint") or v11:IsA("HingeConstraint") then
                local l_Attachment0_0 = v11.Attachment0;
                local l_Attachment1_0 = v11.Attachment1;
                if l_Attachment0_0 and l_Attachment1_0 and l_Attachment0_0.Parent and l_Attachment1_0.Parent then
                    local l_Parent_0 = l_Attachment0_0.Parent;
                    local l_Parent_1 = l_Attachment1_0.Parent;
                    if ((l_Parent_0.CFrame * l_Attachment0_0.CFrame).Position - (l_Parent_1.CFrame * l_Attachment1_0.CFrame).Position).Magnitude > 1 + l_Parent_1.Size.Y * 1.5 then
                        l_Parent_1.CFrame = l_Parent_0.CFrame * l_Attachment0_0.CFrame * l_Attachment1_0.CFrame:Inverse();
                    end;
                end;
            end;
        end;
        return;
    end;
end;
local function _(v17) --[[ Line: 50 ]] --[[ Name: hasRagdollOwnership ]]
    -- upvalues: l_RunService_0 (copy), l_Players_0 (copy)
    if l_RunService_0:IsServer() then
        return true;
    else
        return l_Players_0:GetPlayerFromCharacter(v17.Parent) == l_Players_0.LocalPlayer;
    end;
end;
local function v30(v19, v20) --[[ Line: 62 ]] --[[ Name: setRagdollEnabled ]]
    -- upvalues: l_RunService_0 (copy), l_Players_0 (copy), v5 (copy), v16 (copy)
    local l_Parent_2 = v19.Parent;
    if not l_Parent_2 then
        return;
    else
        local v22 = l_Parent_2:WaitForChild("RagdollConstraints", 0.5);
        if not v22 then
            return;
        else
            local v23 = l_RunService_0:IsServer() and true or l_Players_0:GetPlayerFromCharacter(v19.Parent) == l_Players_0.LocalPlayer;
            if l_RunService_0:IsServer() == true then
                v23 = v19:IsDescendantOf(workspace.NPCs) and true or false;
            end;
            if v20 then
                if not v5[v19] and v23 == true then
                    v5[v19] = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 86 ]]
                        -- upvalues: v19 (copy), v16 (ref), l_Parent_2 (copy), v22 (copy), v5 (ref)
                        if v19:IsDescendantOf(workspace) then
                            v16(l_Parent_2, v22);
                            return;
                        else
                            if v5[v19] then
                                v5[v19]:Disconnect();
                                v5[v19] = nil;
                            end;
                            return;
                        end;
                    end);
                end;
            elseif v5[v19] then
                v5[v19]:Disconnect();
                v5[v19] = nil;
            end;
            for _, v25 in ipairs(v22:GetChildren()) do
                if v25:IsA("Constraint") then
                    local l_Attachment1_1 = v25.Attachment1;
                    if not l_Attachment1_1 then
                        for v27 = 1, 6 do
                            l_Attachment1_1 = v25.Attachment1;
                            if not l_Attachment1_1 then
                                task.wait(v27 * 0.1);
                            else
                                break;
                            end;
                        end;
                        if not l_Attachment1_1 then
                            continue;
                        end;
                    end;
                    local l_Value_0 = v25.RigidJoint.Value;
                    local v29 = not v20 and l_Attachment1_1.Parent or nil;
                    if l_Value_0 ~= nil and l_Value_0.Part1 ~= v29 then
                        l_Value_0.Part1 = v29;
                    end;
                end;
            end;
            if v20 == true then
                v19:SetAttribute("isRagdolled", true);
                return;
            else
                if v19:GetAttribute("forcedRagdoll") == nil then
                    v19:SetAttribute("isRagdolled", nil);
                end;
                return;
            end;
        end;
    end;
end;
local function v37(v31) --[[ Line: 136 ]] --[[ Name: ragdollAdded ]]
    -- upvalues: v4 (copy), v3 (copy), l_RunService_0 (copy), l_Players_0 (copy), v30 (copy)
    v4[v31] = v31.StateChanged:Connect(function(_, v33) --[[ Line: 137 ]]
        -- upvalues: v3 (ref), v31 (copy), l_RunService_0 (ref), l_Players_0 (ref), v30 (ref)
        local v34 = v3[v33];
        local l_v31_0 = v31;
        if l_RunService_0:IsServer() and true or l_Players_0:GetPlayerFromCharacter(l_v31_0.Parent) == l_Players_0.LocalPlayer then
            if v34 == true then
                v30(v31, true);
                return;
            else
                v30(v31, false);
            end;
        end;
    end);
    if _G.Ragdolls ~= nil then
        _G.Ragdolls[v31] = function(v36) --[[ Line: 149 ]]
            -- upvalues: v30 (ref), v31 (copy)
            if v36 == true then
                v30(v31, true);
                return;
            else
                v30(v31, false);
                return;
            end;
        end;
    end;
end;
local function v39(v38) --[[ Line: 159 ]] --[[ Name: ragdollRemoved ]]
    -- upvalues: v4 (copy), v5 (copy)
    if v4[v38] then
        v4[v38]:Disconnect();
        v4[v38] = nil;
    end;
    if v5[v38] then
        v5[v38]:Disconnect();
        v5[v38] = nil;
    end;
    if _G.Ragdolls then
        _G.Ragdolls[v38] = nil;
    end;
end;
l_CollectionService_0:GetInstanceAddedSignal("Ragdoll"):Connect(v37);
l_CollectionService_0:GetInstanceRemovedSignal("Ragdoll"):Connect(v39);
for _, v41 in ipairs(l_CollectionService_0:GetTagged("Ragdoll")) do
    v37(v41);
end;
return nil;