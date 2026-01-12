local l_RagdollHandler_0 = game:GetService("ReplicatedStorage"):WaitForChild("RagdollHandler");
require(l_RagdollHandler_0);
_G.Ragdolls = {};
local _ = require(game.ReplicatedStorage:WaitForChild("buildRagdoll"));
local v2 = false;
_G.forceRagdoll = function(v3, v4) --[[ Line: 10 ]]
    -- upvalues: v2 (ref)
    local l_Humanoid_0 = v3:FindFirstChild("Humanoid");
    if l_Humanoid_0 == nil then
        return;
    else
        if v4 == false then
            l_Humanoid_0:ChangeState(Enum.HumanoidStateType.GettingUp);
            l_Humanoid_0.AutoRotate = true;
            v2 = true;
        end;
        return;
    end;
end;
game.ReplicatedStorage.Events.Ragdoll.OnClientEvent:Connect(function(v6, v7) --[[ Line: 22 ]]
    -- upvalues: v2 (ref)
    if v6 == nil or v6 and v6:findFirstChild("HumanoidRootPart") == nil then
        return;
    else
        local l_Humanoid_1 = v6:FindFirstChild("Humanoid");
        if l_Humanoid_1 then
            if v7 == true then
                v2 = false;
                if v6.PrimaryPart.Anchored == true then
                    l_Humanoid_1:ChangeState(Enum.HumanoidStateType.GettingUp);
                    l_Humanoid_1.AutoRotate = true;
                    return;
                else
                    repeat
                        task.wait();
                        l_Humanoid_1.AutoRotate = false;
                        l_Humanoid_1:ChangeState(Enum.HumanoidStateType.Physics);
                    until v2 == true;
                    l_Humanoid_1:ChangeState(Enum.HumanoidStateType.GettingUp);
                    l_Humanoid_1.AutoRotate = true;
                    return;
                end;
            else
                l_Humanoid_1:ChangeState(Enum.HumanoidStateType.GettingUp);
                l_Humanoid_1.AutoRotate = true;
                v2 = true;
            end;
        end;
        return;
    end;
end);