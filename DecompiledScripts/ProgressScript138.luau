game:GetService("RunService").RenderStepped:Connect(function() --[[ Line: 4 ]]
    if script.Parent.Value > 100 then
        script.Parent.Value = 0;
    end;
    local v0 = math.clamp(script.Parent.Value * 3.6, 0, 360);
    script.ImageColor.Value = Color3.fromRGB(255, 0, 0):Lerp(Color3.fromRGB(85, 255, 127), script.Parent.Value / 100);
    print(script.ImageColor.Value);
    local l_ImageLabel_0 = script.Parent.Parent.Frame1.ImageLabel;
    local l_ImageLabel_1 = script.Parent.Parent.Frame2.ImageLabel;
    l_ImageLabel_0.UIGradient.Rotation = script.FlipProgress.Value == false and math.clamp(v0, 180, 360) or 180 - math.clamp(v0, 0, 180);
    l_ImageLabel_1.UIGradient.Rotation = script.FlipProgress.Value == false and math.clamp(v0, 0, 180) or 180 - math.clamp(v0, 180, 360);
    l_ImageLabel_0.ImageColor3 = script.ImageColor.Value;
    l_ImageLabel_1.ImageColor3 = script.ImageColor.Value;
    l_ImageLabel_0.ImageTransparency = script.ImageTrans.Value;
    l_ImageLabel_1.ImageTransparency = script.ImageTrans.Value;
    l_ImageLabel_0.Image = "rbxassetid://" .. script.ImageId.Value;
    l_ImageLabel_1.Image = "rbxassetid://" .. script.ImageId.Value;
    if script.MissingPartType.Value == "Color" then
        l_ImageLabel_0.UIGradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, script.ColorOfPercentPart.Value), 
            ColorSequenceKeypoint.new(0.5, script.ColorOfPercentPart.Value), 
            ColorSequenceKeypoint.new(0.501, script.ColorOfMissingPart.Value), 
            ColorSequenceKeypoint.new(1, script.ColorOfMissingPart.Value)
        });
        l_ImageLabel_1.UIGradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, script.ColorOfPercentPart.Value), 
            ColorSequenceKeypoint.new(0.5, script.ColorOfPercentPart.Value), 
            ColorSequenceKeypoint.new(0.501, script.ColorOfMissingPart.Value), 
            ColorSequenceKeypoint.new(1, script.ColorOfMissingPart.Value)
        });
        l_ImageLabel_0.UIGradient.Transparency = NumberSequence.new(0);
        l_ImageLabel_1.UIGradient.Transparency = NumberSequence.new(0);
        return;
    elseif script.MissingPartType.Value == "Trans" then
        l_ImageLabel_0.UIGradient.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, script.TransOfPercentPart.Value), 
            NumberSequenceKeypoint.new(0.5, script.TransOfPercentPart.Value), 
            NumberSequenceKeypoint.new(0.501, script.TransOfMissingPart.Value), 
            NumberSequenceKeypoint.new(1, script.TransOfMissingPart.Value)
        });
        l_ImageLabel_1.UIGradient.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, script.TransOfPercentPart.Value), 
            NumberSequenceKeypoint.new(0.5, script.TransOfPercentPart.Value), 
            NumberSequenceKeypoint.new(0.501, script.TransOfMissingPart.Value), 
            NumberSequenceKeypoint.new(1, script.TransOfMissingPart.Value)
        });
        l_ImageLabel_0.UIGradient.Color = ColorSequence.new(Color3.new(1, 1, 1));
        l_ImageLabel_1.UIGradient.Color = ColorSequence.new(Color3.new(1, 1, 1));
        return;
    elseif script.MissingPartType.Value == "TransAndColor" then
        l_ImageLabel_0.UIGradient.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, script.TransOfPercentPart.Value), 
            NumberSequenceKeypoint.new(0.5, script.TransOfPercentPart.Value), 
            NumberSequenceKeypoint.new(0.501, script.TransOfMissingPart.Value), 
            NumberSequenceKeypoint.new(1, script.TransOfMissingPart.Value)
        });
        l_ImageLabel_1.UIGradient.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, script.TransOfPercentPart.Value), 
            NumberSequenceKeypoint.new(0.5, script.TransOfPercentPart.Value), 
            NumberSequenceKeypoint.new(0.501, script.TransOfMissingPart.Value), 
            NumberSequenceKeypoint.new(1, script.TransOfMissingPart.Value)
        });
        l_ImageLabel_0.UIGradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, script.ColorOfPercentPart.Value), 
            ColorSequenceKeypoint.new(0.5, script.ColorOfPercentPart.Value), 
            ColorSequenceKeypoint.new(0.501, script.ColorOfMissingPart.Value), 
            ColorSequenceKeypoint.new(1, script.ColorOfMissingPart.Value)
        });
        l_ImageLabel_1.UIGradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, script.ColorOfPercentPart.Value), 
            ColorSequenceKeypoint.new(0.5, script.ColorOfPercentPart.Value), 
            ColorSequenceKeypoint.new(0.501, script.ColorOfMissingPart.Value), 
            ColorSequenceKeypoint.new(1, script.ColorOfMissingPart.Value)
        });
        return;
    else
        script.MissingPartType.Value = "Trans";
        error("Unknown Type. Only 3 available: \226\128\156Trans\226\128\157, \226\128\156Color\226\128\157 and \226\128\156TransAndColor\226\128\157, changing to \226\128\156Trans\226\128\157.");
        return;
    end;
end);