local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ZiplineVFX_0 = l_ReplicatedStorage_0.Events.ZiplineVFX;
local v2 = {};
local l_Assets_0 = l_ReplicatedStorage_0.Modules["GPO Zipline"].Zipline.Assets;
local v4 = require(l_ReplicatedStorage_0.Modules.Utils.Cleaner);
l_ZiplineVFX_0.OnClientEvent:Connect(function(v5, v6, v7) --[[ Line: 12 ]]
    -- upvalues: v2 (copy), v4 (copy), l_Assets_0 (copy)
    if v6 then
        if v2[v5] then
            return;
        elseif v5.PrimaryPart == nil then
            return;
        else
            local v8 = v4.new();
            local v9 = l_Assets_0.VFX:Clone();
            v9.Anchored = false;
            if v7 < 0 then
                local v10 = l_Assets_0.ZiplineHandle:Clone();
                v10.PrimaryPart.Anchored = false;
                v10.Top.Rail.Anchored = false;
                local l_Weld_0 = Instance.new("Weld");
                l_Weld_0.C0 = CFrame.Angles(3.141592653589793, 0, 0);
                l_Weld_0.Part0 = v10.PrimaryPart;
                l_Weld_0.Part1 = v5.RightHand;
                l_Weld_0.Parent = v10;
                v9.CFrame = v10.Top.Rail.CFrame;
                local l_Weld_1 = Instance.new("Weld");
                l_Weld_1.Part0 = v9;
                l_Weld_1.Part1 = v10.Top.Rail;
                l_Weld_1.Parent = v10;
                v10.Parent = v5;
                v8:AddTask(v10);
            else
                local l_PrimaryPart_0 = v5.PrimaryPart;
                if not l_PrimaryPart_0 then
                    return;
                else
                    local v14 = v5.Humanoid.HipHeight + l_PrimaryPart_0.Size.Y * 0.5;
                    v9.CFrame = v5.HumanoidRootPart.CFrame * CFrame.new(0, -v14, 0);
                    local l_WeldConstraint_0 = Instance.new("WeldConstraint");
                    l_WeldConstraint_0.Part0 = v9;
                    l_WeldConstraint_0.Part1 = l_PrimaryPart_0;
                    l_WeldConstraint_0.Parent = v9;
                end;
            end;
            v9.Parent = v5;
            v8:AddTask(v9);
            v2[v5] = v8;
            return;
        end;
    else
        if v2[v5] then
            v2[v5]:Destroy();
            v2[v5] = nil;
        end;
        return;
    end;
end);