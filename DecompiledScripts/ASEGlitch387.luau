local v0 = {};
local l_TweenService_0 = game:GetService("TweenService");
local v2 = Random.new();
v0.start = function(_, v4, v5) --[[ Line: 5 ]] --[[ Name: start ]]
    -- upvalues: v2 (copy), l_TweenService_0 (copy)
    if v4 == nil then
        return;
    else
        local v6 = v2:NextNumber(0.05, 0.15);
        local v7 = script["Dark_Gold.002"]:Clone();
        v7.Color = v5;
        v7.Size = v4.Size;
        v7.CastShadow = false;
        v7.Transparency = v2:NextNumber(0.85, 0.9);
        local l_Weld_0 = Instance.new("Weld");
        l_Weld_0.Part0 = v4;
        l_Weld_0.Part1 = v7;
        l_Weld_0.Parent = v7;
        v7.Parent = workspace.Effects;
        l_TweenService_0:Create(l_Weld_0, TweenInfo.new(v6 / v2:NextNumber(1.25, 2), Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
            C1 = CFrame.new(v2:NextNumber(-0.15, 0.15), v2:NextNumber(-0.15, 0.15), v2:NextNumber(-0.15, 0.15))
        }):Play();
        l_TweenService_0:Create(v7, TweenInfo.new(v6, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
            Transparency = 1
        }):Play();
        task.delay(v6, v7.Destroy, v7);
        return;
    end;
end;
return v0;