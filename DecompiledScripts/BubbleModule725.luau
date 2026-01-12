local l_TweenService_0 = game:GetService("TweenService");
return {
    start = function(_, v2, v3, v4, v5, v6, v7) --[[ Line: 9 ]] --[[ Name: start ]]
        -- upvalues: l_TweenService_0 (copy)
        if _G.checkRenderDistance(v2.Position) == false then
            return;
        else
            if workspace.Effects:FindFirstChild("bubbleFolder") == nil then
                local l_Model_0 = Instance.new("Model");
                l_Model_0.Name = "bubbleFolder";
                local l_Highlight_0 = Instance.new("Highlight");
                l_Highlight_0.Enabled = false;
                l_Highlight_0.Parent = l_Model_0;
                l_Model_0.Parent = workspace.Effects;
            end;
            if v3 == nil then
                v3 = Color3.fromRGB(255, 255, 255);
            end;
            local v10 = script.Mesh:Clone();
            v10.CFrame = v2;
            v10.Size = v4;
            v10.Transparency = v5;
            v10.Color = v3;
            v10.Parent = workspace.Effects:FindFirstChild("bubbleFolder");
            _G.destroy(v10, v7);
            local v11 = TweenInfo.new(v7, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0);
            local v12 = {
                Transparency = 1, 
                Size = v6
            };
            l_TweenService_0:Create(v10, v11, v12):Play();
            return;
        end;
    end
};