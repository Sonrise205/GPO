local l_UIGradient_0 = script.Parent.UIGradient;
local v1 = game:GetService("TweenService"):Create(l_UIGradient_0, TweenInfo.new(2, Enum.EasingStyle.Circular, Enum.EasingDirection.Out), {
    Offset = Vector2.new(1.25, 0)
});
local v2 = Vector2.new(-1.25, 0);
l_UIGradient_0.Offset = v2;
local function v3() --[[ Line: 14 ]] --[[ Name: animate ]]
    -- upvalues: v1 (copy), l_UIGradient_0 (copy), v2 (copy), v3 (copy)
    v1:Play();
    v1.Completed:Wait();
    l_UIGradient_0.Offset = v2;
    v1:Play();
    v1.Completed:Wait();
    l_UIGradient_0.Offset = v2;
    task.wait(0);
    v3();
end;
v3();