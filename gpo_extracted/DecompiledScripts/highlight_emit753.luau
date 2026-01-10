local l_Debris_0 = game:GetService("Debris");
local l_TweenService_0 = game:GetService("TweenService");
local _ = game:GetService("RunService");
return {
    tweenHighlight = function(v3, v4, v5, v6, v7, v8, v9) --[[ Line: 7 ]]
        -- upvalues: l_TweenService_0 (copy), l_Debris_0 (copy)
        local v10 = v6 or 1;
        local l_Highlight_0 = Instance.new("Highlight");
        l_Highlight_0.Adornee = v3;
        l_Highlight_0.DepthMode = v7 or Enum.HighlightDepthMode.Occluded;
        l_Highlight_0.FillColor = v4 or Color3.new(1, 1, 1);
        l_Highlight_0.OutlineColor = v5 or Color3.new(1, 1, 1);
        l_Highlight_0.OutlineTransparency = 0;
        local v12 = nil;
        local v13 = nil;
        if v8 == "Out" then
            v12 = 1;
            v13 = 0;
        else
            v12 = v9 or 0;
            v13 = 1;
        end;
        l_Highlight_0.FillTransparency = v12;
        l_Highlight_0.OutlineTransparency = v12;
        l_Highlight_0.Parent = v3;
        local v14 = TweenInfo.new(v10, Enum.EasingStyle.Sine, Enum.EasingDirection.Out);
        local v15 = {
            FillTransparency = v13, 
            OutlineTransparency = v13
        };
        l_TweenService_0:Create(l_Highlight_0, v14, v15):Play();
        l_Debris_0:AddItem(l_Highlight_0, v10);
        return l_Highlight_0;
    end, 
    pulseHighlight = function(v16, v17, v18, v19, v20, v21, v22, v23) --[[ Line: 53 ]]
        -- upvalues: l_TweenService_0 (copy), l_Debris_0 (copy)
        local l_Highlight_1 = Instance.new("Highlight");
        l_Highlight_1.Adornee = v16;
        l_Highlight_1.DepthMode = v20 or Enum.HighlightDepthMode.Occluded;
        l_Highlight_1.FillColor = v17 or Color3.new(1, 1, 1);
        l_Highlight_1.OutlineColor = v18 or Color3.new(1, 1, 1);
        local v25 = v19 or 0.5;
        local v26 = v22 or 0;
        local v27 = v23 or 1;
        l_Highlight_1.FillTransparency = v26;
        l_Highlight_1.OutlineTransparency = v26;
        l_Highlight_1.Parent = v16;
        local v28 = TweenInfo.new(v25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out);
        local v29 = TweenInfo.new(v25, Enum.EasingStyle.Sine, Enum.EasingDirection.In);
        local v30 = {
            FillTransparency = v27, 
            OutlineTransparency = v27
        };
        local v31 = {
            FillTransparency = v26, 
            OutlineTransparency = v26
        };
        local v32 = l_TweenService_0:Create(l_Highlight_1, v28, v30);
        local v33 = l_TweenService_0:Create(l_Highlight_1, v29, v31);
        local v34 = 0;
        local v35 = v21 or 0;
        local function v36() --[[ Line: 90 ]] --[[ Name: doPulse ]]
            -- upvalues: l_Highlight_1 (copy), v32 (copy), v33 (copy), v34 (ref), v35 (copy), v36 (copy), l_Debris_0 (ref)
            if not l_Highlight_1 or not l_Highlight_1.Parent then
                return;
            else
                v32:Play();
                v32.Completed:Wait();
                if not l_Highlight_1 or not l_Highlight_1.Parent then
                    return;
                else
                    v33:Play();
                    v33.Completed:Wait();
                    v34 = v34 + 1;
                    if v35 == 0 or v34 < v35 then
                        task.spawn(v36);
                        return;
                    else
                        l_Debris_0:AddItem(l_Highlight_1, 0.1);
                        return;
                    end;
                end;
            end;
        end;
        task.spawn(v36);
        return l_Highlight_1;
    end, 
    flashHighlight = function(v37, v38, v39, v40, v41, v42, v43) --[[ Line: 114 ]]
        -- upvalues: l_TweenService_0 (copy), l_Debris_0 (copy)
        local l_Highlight_2 = Instance.new("Highlight");
        l_Highlight_2.Adornee = v37;
        l_Highlight_2.DepthMode = v42 or Enum.HighlightDepthMode.Occluded;
        l_Highlight_2.FillColor = v38 or Color3.new(1, 1, 1);
        l_Highlight_2.OutlineColor = v39 or Color3.new(1, 1, 1);
        l_Highlight_2.FillTransparency = v43;
        l_Highlight_2.OutlineTransparency = v43;
        l_Highlight_2.Parent = v37;
        local v45 = v41 or 0.1;
        local v46 = v40 or 1;
        local v47 = TweenInfo.new(v45 / 2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
        local v48 = TweenInfo.new(v45 / 2, Enum.EasingStyle.Quad, Enum.EasingDirection.In);
        local v49 = {
            FillTransparency = v43, 
            OutlineTransparency = v43
        };
        local v50 = {
            FillTransparency = 1, 
            OutlineTransparency = 1
        };
        local v51 = l_TweenService_0:Create(l_Highlight_2, v47, v49);
        local v52 = l_TweenService_0:Create(l_Highlight_2, v48, v50);
        local v53 = os.clock();
        local function v54() --[[ Line: 147 ]] --[[ Name: doFlash ]]
            -- upvalues: l_Highlight_2 (copy), v53 (copy), v46 (copy), l_Debris_0 (ref), v51 (copy), v52 (copy), v54 (copy)
            if not l_Highlight_2 or not l_Highlight_2.Parent then
                return;
            elseif os.clock() - v53 >= v46 then
                l_Debris_0:AddItem(l_Highlight_2, 0.1);
                return;
            else
                v51:Play();
                v51.Completed:Wait();
                if not l_Highlight_2 or not l_Highlight_2.Parent then
                    return;
                else
                    v52:Play();
                    v52.Completed:Wait();
                    task.spawn(v54);
                    return;
                end;
            end;
        end;
        task.spawn(v54);
        l_Debris_0:AddItem(l_Highlight_2, v46 + 0.5);
        return l_Highlight_2;
    end
};