return {
    start = function(_, v1) --[[ Line: 4 ]] --[[ Name: start ]]
        local _ = tick();
        local v3 = script.Part:Clone();
        v3.Parent = workspace.Effects;
        _G.tween(v3, {
            0.25, 
            Enum.EasingStyle.Quad, 
            Enum.EasingDirection.Out, 
            0, 
            false, 
            0
        }, {
            Transparency = 1
        });
        repeat
            v3.CFrame = v1.CFrame * CFrame.new(0, 0, v3.Size.X / 2) * CFrame.Angles(0, -1.5707963267948966, 0);
            game["Run Service"].RenderStepped:Wait();
        until v1.Parent == nil;
        v3:Destroy();
    end
};