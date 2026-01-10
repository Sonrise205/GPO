local l_CollectionService_0 = game:GetService("CollectionService");
local l_TextService_0 = game:GetService("TextService");
local l_TweenService_0 = game:GetService("TweenService");
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local v4 = {};
getColor = function(v5, v6) --[[ Line: 10 ]]
    local v7 = v6[1];
    local v8 = v6[#v6];
    local v9 = 0.5;
    local l_Value_0 = v7.Value;
    for v11 = 1, #v6 - 1 do
        if v6[v11].Time <= v5 and v5 <= v6[v11 + 1].Time then
            v7 = v6[v11];
            v8 = v6[v11 + 1];
            v9 = (v5 - v7.Time) / (v8.Time - v7.Time);
            return (v7.Value:lerp(v8.Value, v9));
        end;
    end;
    return l_Value_0;
end;
local function v15(v12) --[[ Line: 28 ]] --[[ Name: EndDialogue ]]
    -- upvalues: l_TweenService_0 (copy)
    for _, v14 in v12:GetChildren() do
        if v14.Name == "letter" then
            v14:SetAttribute("Ending", true);
            l_TweenService_0:Create(v14, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                Position = v14.Position + UDim2.new(0, 0, 0, 50), 
                TextTransparency = 1, 
                TextStrokeTransparency = 1
            }):Play();
            game.Debris:AddItem(v14, 0.5);
        end;
    end;
end;
local function v54(v16, v17, v18, v19) --[[ Line: 42 ]] --[[ Name: CreateDialogue ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_CollectionService_0 (copy), l_TweenService_0 (copy), v15 (copy), l_TextService_0 (copy)
    v17 = v17 or l_LocalPlayer_0;
    local v20 = game.StarterGui:FindFirstChild(v17 .. "CUSTOM_DIALOGUE") or script.CUSTOM_DIALOGUE:Clone();
    local v21 = "";
    local v22 = 0;
    local v23 = 0;
    local v24 = 0;
    if v18 then
        v20.Holder.Template:FindFirstChild("Name").TextColor3 = v18.Color or Color3.new(1, 1, 1);
        v20.Holder.Template:FindFirstChild("Name").TextStrokeColor3 = v18.StrokeColor or Color3.new(0, 0, 0);
    end;
    if not v20:GetAttribute("Created") then
        local l_Template_0 = v20:WaitForChild("Holder"):WaitForChild("Template");
        local l_Holder_0 = v20.Holder;
        l_Holder_0.Position = l_Holder_0.Position - UDim2.new(0, 0, 0, #l_CollectionService_0:GetTagged("CUSTOM_DIALOGUE") * 100);
        l_Holder_0 = l_Template_0:WaitForChild("ImageLabel");
        l_Holder_0.Position = l_Holder_0.Position - UDim2.new(0, 0, 0, 100);
        l_Template_0:WaitForChild("ImageLabel").ImageTransparency = 1;
        l_Holder_0 = l_Template_0:WaitForChild("Name");
        l_Holder_0.Position = l_Holder_0.Position - UDim2.new(0, 0, 0, 100);
        l_Template_0:WaitForChild("Name").TextColor3 = Color3.new(0.2, 0.988235, 1);
        l_Template_0:WaitForChild("Name").TextTransparency = 1;
        l_Template_0:WaitForChild("Name").TextStrokeTransparency = 1;
        l_TweenService_0:Create(l_Template_0:WaitForChild("ImageLabel"), TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
            Position = l_Template_0:WaitForChild("ImageLabel").Position + UDim2.new(0, 0, 0, 100), 
            ImageTransparency = 0
        }):Play();
        l_TweenService_0:Create(l_Template_0:WaitForChild("Name"), TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
            Position = l_Template_0:WaitForChild("Name").Position + UDim2.new(0, 0, 0, 100), 
            TextTransparency = 0, 
            TextStrokeTransparency = 0
        }):Play();
        local l_l_Template_0_0 = l_Template_0 --[[ copy: 9 -> 26 ]];
        task.spawn(function() --[[ Line: 85 ]]
            -- upvalues: v20 (copy), v19 (copy), v15 (ref), l_TweenService_0 (ref), l_l_Template_0_0 (copy)
            v20:SetAttribute("Created", os.clock());
            repeat
                task.wait();
            until os.clock() - v20:GetAttribute("Created") > (v19 or 3) or not v20.Parent;
            v20.Name = "deleting";
            v15(v20.Holder.Template);
            l_TweenService_0:Create(l_l_Template_0_0:WaitForChild("ImageLabel"), TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
                Position = l_l_Template_0_0:WaitForChild("ImageLabel").Position - UDim2.new(0, 0, 0, 100), 
                ImageTransparency = 1
            }):Play();
            l_TweenService_0:Create(l_l_Template_0_0:WaitForChild("Name"), TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
                Position = l_l_Template_0_0:WaitForChild("Name").Position - UDim2.new(0, 0, 0, 100), 
                TextTransparency = 1, 
                TextStrokeTransparency = 1
            }):Play();
            task.delay(1, function() --[[ Line: 102 ]]
                -- upvalues: v20 (ref)
                v20:Destroy();
            end);
        end);
    else
        v20:SetAttribute("Created", os.clock());
    end;
    v20.Parent = game.StarterGui;
    v20.Enabled = true;
    v20.Name = v17 .. "CUSTOM_DIALOGUE";
    v20:AddTag("CUSTOM_DIALOGUE");
    v20:WaitForChild("Holder"):WaitForChild("Template"):WaitForChild("Name").Text = v17;
    for _, v29 in v16 do
        print(v29);
        v21 = v21 .. v29.Text;
    end;
    local v30 = false;
    for _, v32 in v16 do
        if v32.HigherUp then
            v30 = true;
            game:GetService("TweenService"):Create(v20.Holder, TweenInfo.new(0.2), {
                Position = UDim2.new(0.5, 0, 0.935, 0)
            }):Play();
        end;
    end;
    if not v30 and v20.Holder.Position ~= UDim2.new(0.5, 0, 1, 0) then
        game:GetService("TweenService"):Create(v20.Holder, TweenInfo.new(1), {
            Position = UDim2.new(0.5, 0, 1, 0)
        }):Play();
    end;
    v15(v20.Holder.Template);
    for _, v34 in v16 do
        local v35 = string.split(v34.Text, "");
        local v36 = v34.Bold and Enum.Font.SourceSansBold or v34.Italic and Enum.Font.SourceSansItalic or Enum.Font.SourceSans;
        for _, v38 in v35 do
            v22 = v22 + l_TextService_0:GetTextSize(v38, 25, v36, Vector2.new(100, 100)).X;
        end;
    end;
    for _, v40 in v16 do
        local v41 = string.split(v40.Text, "");
        local v42 = v40.Bold and Enum.Font.SourceSansBold or v40.Italic and Enum.Font.SourceSansItalic or Enum.Font.SourceSans;
        for _, v44 in v41 do
            local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v44, 25, v42, Vector2.new(100, 100));
            local l_TextLabel_0 = Instance.new("TextLabel");
            local l_v22_0 = v22;
            local l_v23_0 = v23;
            l_TextLabel_0.AnchorPoint = Vector2.new(0, 0.5);
            l_TextLabel_0.Position = UDim2.new(0.5, l_v23_0 - l_v22_0 / 2 // 1, 0.5, 10);
            l_TextLabel_0.Size = UDim2.new(0, l_l_TextService_0_TextSize_0.X, 0, l_l_TextService_0_TextSize_0.Y);
            l_TextLabel_0.Text = v44;
            l_TextLabel_0.Name = "letter";
            l_TextLabel_0.Font = v42;
            l_TextLabel_0.TextSize = 25;
            l_TextLabel_0.Parent = v20.Holder.Template;
            l_TextLabel_0.BackgroundTransparency = 1;
            l_TextLabel_0.TextStrokeColor3 = v40.TextStrokeColor;
            l_TextLabel_0.TextStrokeTransparency = 0;
            l_TextLabel_0.TextStrokeTransparency = 1;
            l_TextLabel_0.TextTransparency = 1;
            task.delay(v24, function() --[[ Line: 174 ]]
                -- upvalues: v40 (copy), l_TextLabel_0 (copy), l_v23_0 (copy), l_v22_0 (copy), v20 (copy)
                local v49 = os.clock();
                repeat
                    local v50 = math.min((os.clock() - v49) / 0.35, 1);
                    local v51 = math.min((os.clock() - v49) / v40.Shake.Lifetime, 1);
                    local v52 = not v40.Shake.Enabled and UDim2.new(0, 0, 0, 0) or UDim2.new(0, math.random(-v40.Shake.Intensity, v40.Shake.Intensity) * (1 - v51), 0, math.random(-v40.Shake.Intensity, v40.Shake.Intensity) * (1 - v51));
                    local v53 = 1 - (math.pow(v50 - 1, 3) * 2.70158 + 1 + math.pow(v50 - 1, 2) * 1.70158);
                    l_TextLabel_0.TextStrokeTransparency = (1 - v50) ^ 10;
                    l_TextLabel_0.TextTransparency = v53;
                    l_TextLabel_0.TextSize = v53 * 25 + 25;
                    l_TextLabel_0.TextColor3 = getColor(v50, v40.Color.Keypoints);
                    l_TextLabel_0.Position = UDim2.new(0.5, l_v23_0 - l_v22_0 / 2 // 1, 0.5, 0) + v52;
                    task.wait();
                until os.clock() - v49 > math.max(0.35, v40.Shake.Lifetime) or not l_TextLabel_0 or not l_TextLabel_0:IsDescendantOf(v20) or l_TextLabel_0:GetAttribute("Ending");
                if l_TextLabel_0 then
                    l_TextLabel_0.TextStrokeTransparency = 0;
                    l_TextLabel_0.TextTransparency = 0;
                    l_TextLabel_0.TextSize = 25;
                    l_TextLabel_0.TextColor3 = v40.Color.Keypoints[#v40.Color.Keypoints].Value;
                    l_TextLabel_0.Position = UDim2.new(0.5, l_v23_0 - l_v22_0 / 2 // 1, 0.5, 0);
                end;
            end);
            v24 = v24 + v40.TypeSpeed;
            v23 = v23 + l_l_TextService_0_TextSize_0.X;
        end;
    end;
end;
v4.Speak = function(v55, v56, v57) --[[ Line: 208 ]]
    -- upvalues: v54 (copy)
    v54(v56, v55, v57);
end;
return v4;