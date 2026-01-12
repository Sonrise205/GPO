local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("Players");
local _ = require(script:WaitForChild("Spring"));
local v3 = Random.new();
local l_Parent_0 = script.Parent;
local l_RootPartWeld_0 = l_Parent_0:WaitForChild("HoverPetMiddlefake"):WaitForChild("RootPartWeld");
local l_l_RootPartWeld_0_Attribute_0 = l_RootPartWeld_0:GetAttribute("C0Origin");
local v7 = v3:NextNumber(0, 1000);
script.Parent:WaitForChild("AnimationController"):LoadAnimation(script:WaitForChild("Animation")):Play();
local l_CFrame_0 = l_Parent_0.PrimaryPart.CFrame;
local v9 = false;
local l_HumanoidRootPart_0 = l_Parent_0.Parent:WaitForChild("HumanoidRootPart");
l_l_RootPartWeld_0_Attribute_0 = l_l_RootPartWeld_0_Attribute_0.Rotation + l_l_RootPartWeld_0_Attribute_0.Position * (l_HumanoidRootPart_0.Size / Vector3.new(2, 2, 1, 0));
local function v17(v11) --[[ Line: 28 ]] --[[ Name: Update ]]
    -- upvalues: l_Parent_0 (copy), v9 (ref), v7 (copy), l_RootPartWeld_0 (copy), l_l_RootPartWeld_0_Attribute_0 (ref), l_CFrame_0 (ref)
    local l_CFrame_1 = l_Parent_0.PrimaryPart.CFrame;
    if (workspace.Camera.CFrame.Position - l_CFrame_1.Position).Magnitude <= 100 then
        v9 = true;
        local v13 = Vector3.new(0, 1, 0, 0) * math.sin(os.clock() * 2 + v7) * 0.5;
        local v14 = CFrame.Angles(math.sin(os.clock() * 2 + v7) * 0.25 - 0.5235987755982988, 0, 0);
        local v15 = l_RootPartWeld_0.Part0.CFrame * l_l_RootPartWeld_0_Attribute_0;
        local v16 = v15 * v14 + v13;
        if (v16.Position - l_CFrame_0.Position).Magnitude >= 100 then
            l_CFrame_0 = v16;
        else
            l_CFrame_0 = l_CFrame_0:Lerp(v16, v11 * 10);
        end;
        l_RootPartWeld_0.C0 = l_l_RootPartWeld_0_Attribute_0 * v15:ToObjectSpace(l_CFrame_0);
        return;
    else
        if v9 then
            v9 = false;
            l_RootPartWeld_0.C0 = l_l_RootPartWeld_0_Attribute_0;
        end;
        l_CFrame_0 = l_CFrame_1;
        return;
    end;
end;
l_RunService_0.Heartbeat:Connect(v17);
task.defer(function() --[[ Line: 59 ]]
    -- upvalues: l_Parent_0 (copy)
    l_Parent_0.Parent = workspace.Effects;
end);