local l_UserInputService_0 = game:GetService("UserInputService");
local l_ProximityPromptService_0 = game:GetService("ProximityPromptService");
local l_TweenService_0 = game:GetService("TweenService");
local l_TextService_0 = game:GetService("TextService");
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local v5 = require(game.ReplicatedStorage.Modules.Shared.Signals.GoodSignal);
local l_PlayerGui_0 = l_LocalPlayer_0:WaitForChild("PlayerGui");
local _ = require(game.ReplicatedStorage:WaitForChild("Modules"):WaitForChild("ToolDesc"));
local v8 = {
    [Enum.KeyCode.ButtonX] = "rbxasset://textures/ui/Controls/xboxX.png", 
    [Enum.KeyCode.ButtonY] = "rbxasset://textures/ui/Controls/xboxY.png", 
    [Enum.KeyCode.ButtonA] = "rbxasset://textures/ui/Controls/xboxA.png", 
    [Enum.KeyCode.ButtonB] = "rbxasset://textures/ui/Controls/xboxB.png", 
    [Enum.KeyCode.DPadLeft] = "rbxasset://textures/ui/Controls/dpadLeft.png", 
    [Enum.KeyCode.DPadRight] = "rbxasset://textures/ui/Controls/dpadRight.png", 
    [Enum.KeyCode.DPadUp] = "rbxasset://textures/ui/Controls/dpadUp.png", 
    [Enum.KeyCode.DPadDown] = "rbxasset://textures/ui/Controls/dpadDown.png", 
    [Enum.KeyCode.ButtonSelect] = "rbxasset://textures/ui/Controls/xboxmenu.png", 
    [Enum.KeyCode.ButtonL1] = "rbxasset://textures/ui/Controls/xboxLS.png", 
    [Enum.KeyCode.ButtonR1] = "rbxasset://textures/ui/Controls/xboxRS.png"
};
local v9 = {
    [Enum.KeyCode.Backspace] = "rbxasset://textures/ui/Controls/backspace.png", 
    [Enum.KeyCode.Return] = "rbxasset://textures/ui/Controls/return.png", 
    [Enum.KeyCode.LeftShift] = "rbxasset://textures/ui/Controls/shift.png", 
    [Enum.KeyCode.RightShift] = "rbxasset://textures/ui/Controls/shift.png", 
    [Enum.KeyCode.Tab] = "rbxasset://textures/ui/Controls/tab.png"
};
local v10 = {
    ["'"] = "rbxasset://textures/ui/Controls/apostrophe.png", 
    [","] = "rbxasset://textures/ui/Controls/comma.png", 
    ["`"] = "rbxasset://textures/ui/Controls/graveaccent.png", 
    ["."] = "rbxasset://textures/ui/Controls/period.png", 
    [" "] = "rbxasset://textures/ui/Controls/spacebar.png"
};
local v11 = {
    [Enum.KeyCode.LeftControl] = "Ctrl", 
    [Enum.KeyCode.RightControl] = "Ctrl", 
    [Enum.KeyCode.LeftAlt] = "Alt", 
    [Enum.KeyCode.RightAlt] = "Alt", 
    [Enum.KeyCode.F1] = "F1", 
    [Enum.KeyCode.F2] = "F2", 
    [Enum.KeyCode.F3] = "F3", 
    [Enum.KeyCode.F4] = "F4", 
    [Enum.KeyCode.F5] = "F5", 
    [Enum.KeyCode.F6] = "F6", 
    [Enum.KeyCode.F7] = "F7", 
    [Enum.KeyCode.F8] = "F8", 
    [Enum.KeyCode.F9] = "F9", 
    [Enum.KeyCode.F10] = "F10", 
    [Enum.KeyCode.F11] = "F11", 
    [Enum.KeyCode.F12] = "F12"
};
local function _() --[[ Line: 60 ]] --[[ Name: getScreenGui ]]
    -- upvalues: l_PlayerGui_0 (copy)
    local l_ProximityPrompts_0 = l_PlayerGui_0:FindFirstChild("ProximityPrompts");
    if l_ProximityPrompts_0 == nil then
        l_ProximityPrompts_0 = Instance.new("ScreenGui");
        l_ProximityPrompts_0.Name = "ProximityPrompts";
        l_ProximityPrompts_0.ResetOnSpawn = false;
        l_ProximityPrompts_0.Parent = l_PlayerGui_0;
    end;
    return l_ProximityPrompts_0;
end;
local function _(v14) --[[ Line: 71 ]] --[[ Name: setUpCircularProgressBar ]]
    local l_UIGradient_0 = v14.LeftGradient.ProgressBarImage.UIGradient;
    local l_UIGradient_1 = v14.RightGradient.ProgressBarImage.UIGradient;
    v14.Progress.Changed:Connect(function(v17) --[[ Line: 76 ]]
        -- upvalues: l_UIGradient_0 (copy), l_UIGradient_1 (copy)
        local v18 = math.clamp(v17 * 360, 0, 360);
        l_UIGradient_0.Rotation = math.clamp(v18, 180, 360);
        l_UIGradient_1.Rotation = math.clamp(v18, 0, 180);
    end);
end;
local function v152(v20, v21, v22) --[[ Line: 83 ]] --[[ Name: createPrompt ]]
    -- upvalues: l_TweenService_0 (copy), v8 (copy), l_UserInputService_0 (copy), v9 (copy), v10 (copy), v11 (copy), l_TextService_0 (copy)
    local v23 = {};
    local v24 = {};
    local v25 = {};
    local v26 = {};
    local v27 = TweenInfo.new(v20.HoldDuration, Enum.EasingStyle.Linear, Enum.EasingDirection.Out);
    local _ = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
    local v29 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
    local v30 = TweenInfo.new(0.06, Enum.EasingStyle.Linear, Enum.EasingDirection.Out);
    local v31 = TweenInfo.new(0, Enum.EasingStyle.Linear, Enum.EasingDirection.Out);
    local v32 = nil;
    local l_v20_Attribute_0 = v20:GetAttribute("Theme");
    if l_v20_Attribute_0 then
        local l_script_FirstChild_0 = script:FindFirstChild(l_v20_Attribute_0);
        if l_script_FirstChild_0 then
            v32 = l_script_FirstChild_0:Clone();
        end;
    end;
    if v32 == nil then
        v32 = script.Default:Clone();
    end;
    v32.Enabled = true;
    local l_PromptFrame_0 = v32.PromptFrame;
    local l_InputFrame_0 = l_PromptFrame_0.InputFrame;
    local l_ActionText_0 = l_PromptFrame_0.ActionText;
    local l_ObjectText_0 = l_PromptFrame_0.ObjectText;
    local l_BackgroundTransparency_0 = l_PromptFrame_0.BackgroundTransparency;
    local l_ImageTransparency_0 = l_PromptFrame_0.ImageTransparency;
    l_PromptFrame_0.BackgroundTransparency = 1;
    l_PromptFrame_0.ImageTransparency = 1;
    table.insert(v23, l_TweenService_0:Create(l_PromptFrame_0, v29, {
        Size = UDim2.fromScale(0.5, 1), 
        BackgroundTransparency = 1, 
        ImageTransparency = 1
    }));
    table.insert(v24, l_TweenService_0:Create(l_PromptFrame_0, v29, {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = l_BackgroundTransparency_0, 
        ImageTransparency = l_ImageTransparency_0
    }));
    table.insert(v25, l_TweenService_0:Create(l_PromptFrame_0, v29, {
        Size = UDim2.fromScale(0.5, 1), 
        BackgroundTransparency = 1, 
        ImageTransparency = 1
    }));
    table.insert(v26, l_TweenService_0:Create(l_PromptFrame_0, v29, {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = l_BackgroundTransparency_0, 
        ImageTransparency = l_ImageTransparency_0
    }));
    local function v43(v41) --[[ Line: 126 ]] --[[ Name: setupUIStrokeTweens ]]
        -- upvalues: v23 (copy), l_TweenService_0 (ref), v29 (copy), v24 (copy), v25 (copy), v26 (copy)
        local l_Transparency_0 = v41.Transparency;
        v41.Transparency = 1;
        table.insert(v23, l_TweenService_0:Create(v41, v29, {
            Transparency = 1
        }));
        table.insert(v24, l_TweenService_0:Create(v41, v29, {
            Transparency = l_Transparency_0
        }));
        table.insert(v25, l_TweenService_0:Create(v41, v29, {
            Transparency = 1
        }));
        table.insert(v26, l_TweenService_0:Create(v41, v29, {
            Transparency = l_Transparency_0
        }));
    end;
    local function v46(v44) --[[ Line: 135 ]] --[[ Name: setupGUIObjectTweens ]]
        -- upvalues: v23 (copy), l_TweenService_0 (ref), v29 (copy), v24 (copy), v25 (copy), v26 (copy)
        local l_BackgroundTransparency_1 = v44.BackgroundTransparency;
        v44.BackgroundTransparency = 1;
        table.insert(v23, l_TweenService_0:Create(v44, v29, {
            BackgroundTransparency = 1
        }));
        table.insert(v24, l_TweenService_0:Create(v44, v29, {
            BackgroundTransparency = l_BackgroundTransparency_1
        }));
        table.insert(v25, l_TweenService_0:Create(v44, v29, {
            BackgroundTransparency = 1
        }));
        table.insert(v26, l_TweenService_0:Create(v44, v29, {
            BackgroundTransparency = l_BackgroundTransparency_1
        }));
    end;
    local function v50(v47) --[[ Line: 144 ]] --[[ Name: setupTextLabelTweens ]]
        -- upvalues: v23 (copy), l_TweenService_0 (ref), v29 (copy), v24 (copy), v25 (copy), v26 (copy)
        local l_TextTransparency_0 = v47.TextTransparency;
        local l_TextStrokeTransparency_0 = v47.TextStrokeTransparency;
        v47.TextTransparency = 1;
        v47.TextStrokeTransparency = 1;
        table.insert(v23, l_TweenService_0:Create(v47, v29, {
            TextTransparency = 1, 
            TextStrokeTransparency = 1
        }));
        table.insert(v24, l_TweenService_0:Create(v47, v29, {
            TextTransparency = l_TextTransparency_0, 
            TextStrokeTransparency = l_TextStrokeTransparency_0
        }));
        table.insert(v25, l_TweenService_0:Create(v47, v29, {
            TextTransparency = 1, 
            TextStrokeTransparency = 1
        }));
        table.insert(v26, l_TweenService_0:Create(v47, v29, {
            TextTransparency = l_TextTransparency_0, 
            TextStrokeTransparency = l_TextStrokeTransparency_0
        }));
    end;
    local function v53(v51) --[[ Line: 155 ]] --[[ Name: setupImageLabelTweens ]]
        -- upvalues: v23 (copy), l_TweenService_0 (ref), v29 (copy), v24 (copy), v25 (copy), v26 (copy)
        local l_ImageTransparency_1 = v51.ImageTransparency;
        v51.ImageTransparency = 1;
        table.insert(v23, l_TweenService_0:Create(v51, v29, {
            ImageTransparency = 1
        }));
        table.insert(v24, l_TweenService_0:Create(v51, v29, {
            ImageTransparency = l_ImageTransparency_1
        }));
        table.insert(v25, l_TweenService_0:Create(v51, v29, {
            ImageTransparency = 1
        }));
        table.insert(v26, l_TweenService_0:Create(v51, v29, {
            ImageTransparency = l_ImageTransparency_1
        }));
    end;
    local function v54(v55) --[[ Line: 164 ]] --[[ Name: setupUnexpectedChildTweens ]]
        -- upvalues: v43 (copy), v46 (copy), v50 (copy), v53 (copy), v54 (copy)
        if v55:IsA("UIStroke") then
            v43(v55);
        elseif not v55:IsA("UIGradient") and v55:IsA("GuiObject") then
            v46(v55);
            if v55:IsA("TextLabel") then
                v50(v55);
            elseif v55:IsA("ImageLabel") then
                v53(v55);
            end;
        end;
        for _, v57 in pairs(v55:GetChildren()) do
            v54(v57);
        end;
    end;
    local v58 = {
        [l_InputFrame_0] = false, 
        [l_ActionText_0] = true, 
        [l_ObjectText_0] = true
    };
    for _, v60 in pairs(l_PromptFrame_0:GetChildren()) do
        if v58[v60] == nil then
            v54(v60);
        elseif v58[v60] == true then
            for _, v62 in pairs(v60:GetChildren()) do
                v54(v62);
            end;
        end;
    end;
    local l_Frame_0 = l_InputFrame_0.Frame;
    local l_UIScale_0 = l_Frame_0.UIScale;
    local v65 = v21 == Enum.ProximityPromptInputType.Touch and 1.6 or 1.33;
    table.insert(v23, l_TweenService_0:Create(l_UIScale_0, v29, {
        Scale = v65
    }));
    table.insert(v24, l_TweenService_0:Create(l_UIScale_0, v29, {
        Scale = 1
    }));
    v50(l_ActionText_0);
    v50(l_ObjectText_0);
    local l_ButtonFrame_0 = l_Frame_0.ButtonFrame;
    (function() --[[ Line: 211 ]] --[[ Name: setupButtonFrameTweens ]]
        -- upvalues: l_ButtonFrame_0 (copy), v25 (copy), l_TweenService_0 (ref), v30 (copy), v26 (copy)
        local l_BackgroundTransparency_2 = l_ButtonFrame_0.BackgroundTransparency;
        local l_ImageTransparency_2 = l_ButtonFrame_0.ImageTransparency;
        table.insert(v25, l_TweenService_0:Create(l_ButtonFrame_0, v30, {
            BackgroundTransparency = 1, 
            ImageTransparency = 1
        }));
        table.insert(v26, l_TweenService_0:Create(l_ButtonFrame_0, v30, {
            BackgroundTransparency = l_BackgroundTransparency_2, 
            ImageTransparency = l_ImageTransparency_2
        }));
        for _, v70 in pairs(l_ButtonFrame_0:getChildren()) do
            if v70:IsA("UIStroke") then
                local l_Transparency_1 = v70.Transparency;
                table.insert(v25, l_TweenService_0:Create(v70, v30, {
                    Transparency = 1
                }));
                table.insert(v26, l_TweenService_0:Create(v70, v30, {
                    Transparency = l_Transparency_1
                }));
            end;
        end;
    end)();
    local l_ButtonImage_0 = l_Frame_0.ButtonImage;
    local l_ButtonText_0 = l_Frame_0.ButtonText;
    local l_ButtonTextImage_0 = l_Frame_0.ButtonTextImage;
    local function v81() --[[ Line: 233 ]] --[[ Name: setupButtonTextTweens ]]
        -- upvalues: l_ButtonText_0 (copy), v25 (copy), l_TweenService_0 (ref), v30 (copy), v26 (copy)
        local l_TextTransparency_1 = l_ButtonText_0.TextTransparency;
        local l_TextStrokeTransparency_1 = l_ButtonText_0.TextStrokeTransparency;
        local l_BackgroundTransparency_3 = l_ButtonText_0.BackgroundTransparency;
        l_ButtonText_0.BackgroundTransparency = 1;
        l_ButtonText_0.TextStrokeTransparency = 1;
        l_ButtonText_0.TextTransparency = 1;
        table.insert(v25, l_TweenService_0:Create(l_ButtonText_0, v30, {
            TextTransparency = 1, 
            TextStrokeTransparency = 1, 
            BackgroundTransparency = 1
        }));
        table.insert(v26, l_TweenService_0:Create(l_ButtonText_0, v30, {
            TextTransparency = l_TextTransparency_1, 
            TextStrokeTransparency = l_TextStrokeTransparency_1, 
            BackgroundTransparency = l_BackgroundTransparency_3
        }));
        for _, v79 in pairs(l_ButtonText_0:getChildren()) do
            if v79:IsA("UIStroke") then
                local l_Transparency_2 = v79.Transparency;
                table.insert(v25, l_TweenService_0:Create(v79, v30, {
                    Transparency = 1
                }));
                table.insert(v26, l_TweenService_0:Create(v79, v30, {
                    Transparency = l_Transparency_2
                }));
            end;
        end;
    end;
    local function v84() --[[ Line: 253 ]] --[[ Name: setupButtonImageTweens ]]
        -- upvalues: l_ButtonImage_0 (copy), v25 (copy), l_TweenService_0 (ref), v30 (copy), v26 (copy)
        local l_ImageTransparency_3 = l_ButtonImage_0.ImageTransparency;
        local l_BackgroundTransparency_4 = l_ButtonImage_0.BackgroundTransparency;
        l_ButtonImage_0.BackgroundTransparency = 1;
        l_ButtonImage_0.ImageTransparency = 1;
        table.insert(v25, l_TweenService_0:Create(l_ButtonImage_0, v30, {
            ImageTransparency = 1, 
            BackgroundTransparency = 1
        }));
        table.insert(v26, l_TweenService_0:Create(l_ButtonImage_0, v30, {
            ImageTransparency = l_ImageTransparency_3, 
            BackgroundTransparency = l_BackgroundTransparency_4
        }));
    end;
    local function v87() --[[ Line: 262 ]] --[[ Name: setupIconTweens ]]
        -- upvalues: l_ButtonTextImage_0 (copy), v25 (copy), l_TweenService_0 (ref), v30 (copy), v26 (copy)
        local l_BackgroundTransparency_5 = l_ButtonTextImage_0.BackgroundTransparency;
        local l_ImageTransparency_4 = l_ButtonTextImage_0.ImageTransparency;
        l_ButtonTextImage_0.BackgroundTransparency = 1;
        l_ButtonTextImage_0.ImageTransparency = 1;
        table.insert(v25, l_TweenService_0:Create(l_ButtonTextImage_0, v30, {
            ImageTransparency = 1, 
            BackgroundTransparency = 1
        }));
        table.insert(v26, l_TweenService_0:Create(l_ButtonTextImage_0, v30, {
            ImageTransparency = l_ImageTransparency_4, 
            BackgroundTransparency = l_BackgroundTransparency_5
        }));
    end;
    if v21 == Enum.ProximityPromptInputType.Gamepad then
        if v8[v20.GamepadKeyCode] then
            v87();
            l_ButtonTextImage_0.Image = v8[v20.GamepadKeyCode];
            l_ButtonText_0.Visible = false;
            l_ButtonImage_0.Visible = false;
            l_ButtonTextImage_0.Visible = true;
        end;
    elseif v21 == Enum.ProximityPromptInputType.Touch then
        v84();
        l_ButtonImage_0.Image = "rbxasset://textures/ui/Controls/TouchTapIcon.png";
        l_ButtonText_0.Visible = false;
        l_ButtonTextImage_0.Visible = false;
        l_ButtonImage_0.Visible = true;
    else
        v84();
        l_ButtonImage_0.Visible = true;
        local l_l_UserInputService_0_StringForKeyCode_0 = l_UserInputService_0:GetStringForKeyCode(v20.KeyboardKeyCode);
        local v89 = v9[v20.KeyboardKeyCode];
        if v89 == nil then
            v89 = v10[l_l_UserInputService_0_StringForKeyCode_0];
        end;
        if v89 == nil then
            local v90 = v11[v20.KeyboardKeyCode];
            if v90 then
                l_l_UserInputService_0_StringForKeyCode_0 = v90;
            end;
        end;
        if v89 then
            v87();
            l_ButtonTextImage_0.Image = v89;
            l_ButtonText_0.Visible = false;
            l_ButtonTextImage_0.Visible = true;
        elseif l_l_UserInputService_0_StringForKeyCode_0 ~= nil and l_l_UserInputService_0_StringForKeyCode_0 ~= "" then
            if string.len(l_l_UserInputService_0_StringForKeyCode_0) > 2 then
                l_ButtonText_0.TextSize = math.round(l_ButtonText_0.TextSize * 6 / 7);
            end;
            v81();
            l_ButtonText_0.Text = l_l_UserInputService_0_StringForKeyCode_0;
            l_ButtonTextImage_0.Visible = false;
            l_ButtonText_0.Visible = true;
        else
            error("ProximityPrompt '" .. v20.Name .. "' has an unsupported keycode for rendering UI: " .. tostring(v20.KeyboardKeyCode));
        end;
    end;
    if v21 == Enum.ProximityPromptInputType.Touch or v20.ClickablePrompt then
        local l_TextButton_0 = v32.TextButton;
        local v92 = false;
        do
            local l_v92_0 = v92;
            l_TextButton_0.InputBegan:Connect(function(v94) --[[ Line: 336 ]]
                -- upvalues: v20 (copy), l_v92_0 (ref)
                if (v94.UserInputType == Enum.UserInputType.Touch or v94.UserInputType == Enum.UserInputType.MouseButton1) and v94.UserInputState ~= Enum.UserInputState.Change then
                    v20:InputHoldBegin();
                    l_v92_0 = true;
                end;
            end);
            l_TextButton_0.InputEnded:Connect(function(v95) --[[ Line: 343 ]]
                -- upvalues: l_v92_0 (ref), v20 (copy)
                if (v95.UserInputType == Enum.UserInputType.Touch or v95.UserInputType == Enum.UserInputType.MouseButton1) and l_v92_0 then
                    l_v92_0 = false;
                    v20:InputHoldEnd();
                end;
            end);
            v32.Active = true;
        end;
    end;
    if v20.HoldDuration > 0 then
        local l_ProgressBar_0 = l_Frame_0.ProgressBar;
        local l_UIGradient_2 = l_ProgressBar_0.LeftGradient.ProgressBarImage.UIGradient;
        local l_UIGradient_3 = l_ProgressBar_0.RightGradient.ProgressBarImage.UIGradient;
        local l_l_UIGradient_2_0 = l_UIGradient_2 --[[ copy: 38 -> 50 ]];
        local l_l_UIGradient_3_0 = l_UIGradient_3 --[[ copy: 39 -> 51 ]];
        l_ProgressBar_0.Progress.Changed:Connect(function(v101) --[[ Line: 76 ]]
            -- upvalues: l_l_UIGradient_2_0 (copy), l_l_UIGradient_3_0 (copy)
            local v102 = math.clamp(v101 * 360, 0, 360);
            l_l_UIGradient_2_0.Rotation = math.clamp(v102, 180, 360);
            l_l_UIGradient_3_0.Rotation = math.clamp(v102, 0, 180);
        end);
        table.insert(v23, l_TweenService_0:Create(l_ProgressBar_0.Progress, v27, {
            Value = 1
        }));
        table.insert(v24, l_TweenService_0:Create(l_ProgressBar_0.Progress, v31, {
            Value = 0
        }));
    end;
    local v103 = nil;
    local v104 = nil;
    local v105 = nil;
    local v106 = nil;
    if v20.HoldDuration > 0 then
        v103 = v20.PromptButtonHoldBegan:Connect(function() --[[ Line: 368 ]]
            -- upvalues: v23 (copy)
            for _, v108 in ipairs(v23) do
                v108:Play();
            end;
        end);
        v104 = v20.PromptButtonHoldEnded:Connect(function() --[[ Line: 374 ]]
            -- upvalues: v24 (copy)
            for _, v110 in ipairs(v24) do
                v110:Play();
            end;
        end);
    end;
    v105 = v20.Triggered:Connect(function() --[[ Line: 381 ]]
        -- upvalues: v25 (copy)
        for _, v112 in ipairs(v25) do
            v112:Play();
        end;
    end);
    v106 = v20.TriggerEnded:Connect(function() --[[ Line: 387 ]]
        -- upvalues: v26 (copy)
        for _, v114 in ipairs(v26) do
            v114:Play();
        end;
    end);
    local function _(v115) --[[ Line: 392 ]] --[[ Name: removeTags ]]
        return (v115:gsub("(\\?)<[^<>]->", {
            [""] = ""
        }));
    end;
    local _ = function(v117, v118, v119) --[[ Line: 396 ]] --[[ Name: returnFontSize ]]
        -- upvalues: l_TextService_0 (ref)
        local v120 = nil;
        local _, _ = pcall(function() --[[ Line: 399 ]]
            -- upvalues: v117 (copy), v119 (copy), v118 (copy), v120 (ref), l_TextService_0 (ref)
            local l_GetTextBoundsParams_0 = Instance.new("GetTextBoundsParams");
            l_GetTextBoundsParams_0.Text = v117;
            l_GetTextBoundsParams_0.Font = Font.new(textLabel.FontFace.Family);
            l_GetTextBoundsParams_0.Size = v119;
            l_GetTextBoundsParams_0.Width = v118;
            v120 = l_TextService_0:GetTextBoundsAsync(l_GetTextBoundsParams_0).X;
        end);
        if v120 == nil then
            v120 = l_TextService_0:GetTextSize(v117, v118, Enum.Font.SourceSans, v119);
        end;
        return v120;
    end;
    local function v145() --[[ Line: 418 ]] --[[ Name: updateUIFromPrompt ]]
        -- upvalues: l_PromptFrame_0 (copy), v20 (copy), l_ActionText_0 (copy), l_TextService_0 (ref), l_ObjectText_0 (copy), v32 (ref)
        l_PromptFrame_0.ActionText2.Text = v20.ActionText;
        l_PromptFrame_0.ObjectText2.Text = v20.ObjectText;
        local v125 = v20.ActionText:gsub("(\\?)<[^<>]->", {
            [""] = ""
        });
        local l_TextSize_0 = l_ActionText_0.TextSize;
        local v127 = Vector2.new(1000, 1000);
        local v128 = nil;
        local l_v125_0 = v125 --[[ copy: 1 -> 8 ]];
        local l_v127_0 = v127 --[[ copy: 3 -> 9 ]];
        local l_l_TextSize_0_0 = l_TextSize_0 --[[ copy: 2 -> 10 ]];
        local v132;
        do
            local l_v128_0 = v128;
            local _, _ = pcall(function() --[[ Line: 399 ]]
                -- upvalues: l_v125_0 (copy), l_v127_0 (copy), l_l_TextSize_0_0 (copy), l_v128_0 (ref), l_TextService_0 (ref)
                local l_GetTextBoundsParams_1 = Instance.new("GetTextBoundsParams");
                l_GetTextBoundsParams_1.Text = l_v125_0;
                l_GetTextBoundsParams_1.Font = Font.new(textLabel.FontFace.Family);
                l_GetTextBoundsParams_1.Size = l_v127_0;
                l_GetTextBoundsParams_1.Width = l_l_TextSize_0_0;
                l_v128_0 = l_TextService_0:GetTextBoundsAsync(l_GetTextBoundsParams_1).X;
            end);
            if l_v128_0 == nil then
                l_v128_0 = l_TextService_0:GetTextSize(v125, l_TextSize_0, Enum.Font.SourceSans, v127);
            end;
            v132 = l_v128_0;
        end;
        l_TextSize_0 = v20.ObjectText:gsub("(\\?)<[^<>]->", {
            [""] = ""
        });
        v127 = l_ObjectText_0.TextSize;
        v128 = Vector2.new(1000, 1000);
        local v137 = nil;
        local l_l_TextSize_0_1 = l_TextSize_0 --[[ copy: 2 -> 11 ]];
        local l_v128_1 = v128 --[[ copy: 4 -> 12 ]];
        local l_v127_1 = v127 --[[ copy: 3 -> 13 ]];
        do
            local l_v137_0 = v137;
            local _, _ = pcall(function() --[[ Line: 399 ]]
                -- upvalues: l_l_TextSize_0_1 (copy), l_v128_1 (copy), l_v127_1 (copy), l_v137_0 (ref), l_TextService_0 (ref)
                local l_GetTextBoundsParams_2 = Instance.new("GetTextBoundsParams");
                l_GetTextBoundsParams_2.Text = l_l_TextSize_0_1;
                l_GetTextBoundsParams_2.Font = Font.new(textLabel.FontFace.Family);
                l_GetTextBoundsParams_2.Size = l_v128_1;
                l_GetTextBoundsParams_2.Width = l_v127_1;
                l_v137_0 = l_TextService_0:GetTextBoundsAsync(l_GetTextBoundsParams_2).X;
            end);
            if l_v137_0 == nil then
                l_v137_0 = l_TextService_0:GetTextSize(l_TextSize_0, v127, Enum.Font.SourceSans, v128);
            end;
            v125 = l_v137_0;
        end;
        l_TextSize_0 = math.max(v132.X, v125.X);
        v127 = 72;
        if v20.ActionText ~= nil and v20.ActionText ~= "" or v20.ObjectText ~= nil and v20.ObjectText ~= "" then
            v127 = l_TextSize_0 + 72 + 24;
        end;
        v128 = 0;
        if v20.ObjectText ~= nil and v20.ObjectText ~= "" then
            v128 = 9;
        end;
        l_ActionText_0.Position = UDim2.new(0.5, 72 - v127 / 2, 0, v128);
        l_ObjectText_0.Position = UDim2.new(0.5, 72 - v127 / 2, 0, -10);
        l_ActionText_0.Text = v20.ActionText;
        l_ObjectText_0.Text = v20.ObjectText;
        l_ActionText_0.AutoLocalize = v20.AutoLocalize;
        l_ActionText_0.RootLocalizationTable = v20.RootLocalizationTable;
        l_ObjectText_0.AutoLocalize = v20.AutoLocalize;
        l_ObjectText_0.RootLocalizationTable = v20.RootLocalizationTable;
        v32.Size = UDim2.fromOffset(v127, 72);
        v32.SizeOffset = Vector2.new(v20.UIOffset.X / v32.Size.Width.Offset, v20.UIOffset.Y / v32.Size.Height.Offset);
        if _G.displayRareItem ~= nil then
            v137 = v20.ObjectText;
            if v20:GetAttribute("itemName") then
                v137 = v20:GetAttribute("itemName");
            end;
            _G.displayRareItem(v137, l_ObjectText_0.UIGradient);
        end;
    end;
    local v146 = v20.Changed:Connect(v145);
    v145();
    local l_Parent_0 = v20.Parent;
    v32.Adornee = l_Parent_0;
    v32.Parent = v22;
    for _, v149 in ipairs(v26) do
        v149:Play();
    end;
    return function() --[[ Line: 471 ]] --[[ Name: cleanup ]]
        -- upvalues: v103 (ref), v104 (ref), v105 (ref), v106 (ref), v146 (copy), v25 (copy), v32 (ref)
        if v103 then
            v103:Disconnect();
        end;
        if v104 then
            v104:Disconnect();
        end;
        v105:Disconnect();
        v106:Disconnect();
        v146:Disconnect();
        for _, v151 in ipairs(v25) do
            v151:Play();
        end;
        task.wait(0.2);
        v32:Destroy();
    end;
end;
local function _() --[[ Line: 496 ]] --[[ Name: onLoad ]]
    -- upvalues: l_ProximityPromptService_0 (copy), l_PlayerGui_0 (copy), v152 (copy), v5 (copy)
    l_ProximityPromptService_0.PromptShown:Connect(function(v153, v154) --[[ Line: 497 ]]
        -- upvalues: l_PlayerGui_0 (ref), v152 (ref), v5 (ref)
        v153.Style = Enum.ProximityPromptStyle.Custom;
        local l_ProximityPrompts_1 = l_PlayerGui_0:FindFirstChild("ProximityPrompts");
        if l_ProximityPrompts_1 == nil then
            l_ProximityPrompts_1 = Instance.new("ScreenGui");
            l_ProximityPrompts_1.Name = "ProximityPrompts";
            l_ProximityPrompts_1.ResetOnSpawn = false;
            l_ProximityPrompts_1.Parent = l_PlayerGui_0;
        end;
        l_ProximityPrompts_1 = v152(v153, v154, l_ProximityPrompts_1);
        local v156 = v5.new();
        local v157 = {};
        table.insert(v157, task.spawn(function() --[[ Line: 510 ]]
            -- upvalues: v153 (copy), v156 (copy)
            v153.PromptHidden:Wait();
            v156:Fire();
        end));
        table.insert(v157, task.spawn(function() --[[ Line: 515 ]]
            -- upvalues: v153 (copy), v156 (copy)
            v153.Destroying:Wait();
            v156:Fire();
        end));
        v156:Wait();
        v156:DisconnectAll();
        for v158 = 1, #v157 do
            pcall(function() --[[ Line: 525 ]]
                -- upvalues: v157 (copy), v158 (copy)
                task.cancel(v157[v158]);
            end);
        end;
        l_ProximityPrompts_1();
    end);
end;
l_ProximityPromptService_0.PromptShown:Connect(function(v160, v161) --[[ Line: 497 ]]
    -- upvalues: l_PlayerGui_0 (copy), v152 (copy), v5 (copy)
    v160.Style = Enum.ProximityPromptStyle.Custom;
    local l_ProximityPrompts_2 = l_PlayerGui_0:FindFirstChild("ProximityPrompts");
    if l_ProximityPrompts_2 == nil then
        l_ProximityPrompts_2 = Instance.new("ScreenGui");
        l_ProximityPrompts_2.Name = "ProximityPrompts";
        l_ProximityPrompts_2.ResetOnSpawn = false;
        l_ProximityPrompts_2.Parent = l_PlayerGui_0;
    end;
    l_ProximityPrompts_2 = v152(v160, v161, l_ProximityPrompts_2);
    local v163 = v5.new();
    local v164 = {};
    table.insert(v164, task.spawn(function() --[[ Line: 510 ]]
        -- upvalues: v160 (copy), v163 (copy)
        v160.PromptHidden:Wait();
        v163:Fire();
    end));
    table.insert(v164, task.spawn(function() --[[ Line: 515 ]]
        -- upvalues: v160 (copy), v163 (copy)
        v160.Destroying:Wait();
        v163:Fire();
    end));
    v163:Wait();
    v163:DisconnectAll();
    for v165 = 1, #v164 do
        pcall(function() --[[ Line: 525 ]]
            -- upvalues: v164 (copy), v165 (copy)
            task.cancel(v164[v165]);
        end);
    end;
    l_ProximityPrompts_2();
end);