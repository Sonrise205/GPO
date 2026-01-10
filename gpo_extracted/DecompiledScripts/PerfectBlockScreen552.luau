return {
    start = function(_) --[[ Line: 3 ]] --[[ Name: start ]]
        local v1 = script.ColorCorrection:Clone();
        v1.TintColor = Color3.fromRGB(255, 255, 255);
        v1.Contrast = 0;
        v1.Saturation = 0;
        v1.Parent = workspace.CurrentCamera;
        _G.tween(v1, {
            0.25, 
            Enum.EasingStyle.Quad, 
            Enum.EasingDirection.Out, 
            0, 
            false, 
            0
        }, {
            Saturation = script.ColorCorrection.Saturation, 
            TintColor = script.ColorCorrection.TintColor, 
            Contrast = script.ColorCorrection.Contrast
        });
        task.wait(2);
        _G.tween(v1, {
            0.25, 
            Enum.EasingStyle.Quad, 
            Enum.EasingDirection.Out, 
            0, 
            false, 
            0
        }, {
            Saturation = 0, 
            TintColor = Color3.fromRGB(255, 255, 255), 
            Contrast = 0
        });
        _G.destroy(v1, 0.25);
    end
};