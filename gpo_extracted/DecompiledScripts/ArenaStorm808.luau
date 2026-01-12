local v0 = {};
local v1 = nil;
local v2 = false;
v0.start = function(_, v4) --[[ Line: 5 ]] --[[ Name: start ]]
    -- upvalues: v1 (ref), v2 (ref)
    if v4 == true then
        if v1 == nil then
            v1 = script.ColorCorrection:Clone();
            v1.TintColor = Color3.fromRGB(255, 255, 255);
            v1.Contrast = 0;
            v1.Parent = workspace.CurrentCamera;
        end;
        if v2 ~= true then
            v2 = true;
            _G.tween(v1, {
                0.25, 
                "Quad", 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                TintColor = script.ColorCorrection.TintColor, 
                Contrast = 1
            });
            script.looped:Play();
            script.enter:Play();
            return;
        end;
    elseif v2 ~= false and v1 ~= nil then
        v2 = false;
        _G.tween(v1, {
            0.25, 
            "Quad", 
            Enum.EasingDirection.Out, 
            0, 
            false, 
            0
        }, {
            TintColor = Color3.fromRGB(255, 255, 255), 
            Contrast = 0
        });
        script.looped:Stop();
        script.exit:Play();
    end;
end;
return v0;