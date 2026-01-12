local v0 = {};
local v1 = {
    Color = "TextColor3", 
    StrokeColor = "TextStrokeColor3", 
    ImageColor = "ImageColor3"
};
v0.ColorShortcuts = {};
v0.ColorShortcuts.White = Color3.new(1, 1, 1);
v0.ColorShortcuts.Black = Color3.fromRGB(50, 50, 50);
v0.ColorShortcuts.Red = Color3.new(1, 0.4, 0.4);
v0.ColorShortcuts.Green = Color3.new(0.4, 1, 0.4);
v0.ColorShortcuts.Purple = Color3.new(1, 0, 1);
v0.ColorShortcuts.Blue = Color3.new(0.55, 0.6, 1);
v0.ColorShortcuts.Cyan = Color3.new(0.4, 0.85, 1);
v0.ColorShortcuts.Orange = Color3.new(1, 0.5, 0.2);
v0.ColorShortcuts.Yellow = Color3.new(1, 0.9, 0.2);
v0.ColorShortcuts.ZBlue = Color3.new(0.160784, 1, 0.933333);
v0.ColorShortcuts.Arise = Color3.new(0.333333, 0.333333, 1);
v0.ColorShortcuts.Pink = Color3.new(1, 0.607843, 0.760784);
v0.ImageShortcuts = {};
v0.ImageShortcuts.Eggplant = 639588687;
v0.ImageShortcuts.Thinking = 955646496;
v0.ImageShortcuts.Sad = 947900188;
v0.ImageShortcuts.Happy = 414889555;
v0.ImageShortcuts.Despicable = 711674643;
local v2 = {
    ContainerHorizontalAlignment = "Left", 
    ContainerVerticalAlignment = "Top", 
    TextYAlignment = "Bottom", 
    TextScaled = true, 
    TextScaleRelativeTo = "Frame", 
    TextScale = 0.25, 
    TextSize = 20, 
    Font = script.t.Font, 
    FontFace = script.t.FontFace, 
    TextColor3 = "White", 
    TextStrokeColor3 = "Black", 
    TextTransparency = 0, 
    TextStrokeTransparency = 0, 
    BackgroundTransparency = 1, 
    TextWrapped = true, 
    BorderSizePixel = 0, 
    AutoLocalize = false, 
    ImageColor3 = "White", 
    ImageTransparency = 0, 
    ImageRectOffset = "0,0", 
    ImageRectSize = "0,0", 
    AnimateStepTime = 0, 
    AnimateStepGrouping = "Letter", 
    AnimateStepFrequency = 4, 
    AnimateYield = 0, 
    AnimateStyle = "SizeT", 
    AnimateStyleTime = 0.3, 
    AnimateStyleNumPeriods = 1, 
    AnimateStyleAmplitude = 0.5
};
local v3 = {
    TextYAlignment = "TextLabel", 
    TextScaled = "TextLabel", 
    TextWrapped = "TextLabel", 
    TextSize = "TextLabel", 
    Font = "TextLabel", 
    TextColor3 = "TextLabel", 
    TextStrokeColor3 = "TextLabel", 
    TextStrokeTransparency = "TextLabel", 
    TextTransparency = "TextLabel", 
    BackgroundTransparency = "GuiObject", 
    BorderSizePixel = "GuiObject", 
    ImageColor3 = "ImageLabel", 
    ImageTransparency = "ImageLabel", 
    ImageRectOffset = "ImageLabel", 
    ImageRectSize = "ImageLabel"
};
local v29 = {
    Appear = function(v4) --[[ Line: 252 ]] --[[ Name: Appear ]]
        v4.Visible = true;
    end, 
    SizeT = function(v5, _, _) --[[ Line: 256 ]] --[[ Name: SizeT ]]
        if v5.Name ~= "sized" and v5:IsA("TextLabel") then
            local l_TextSize_0 = v5.TextSize;
            v5.Visible = true;
            v5.Name = "sized";
            v5.TextSize = 0;
            _G.tween(v5, {
                0.25, 
                "EntranceExpressive", 
                Enum.EasingDirection.InOut, 
                0, 
                false, 
                0
            }, {
                TextSize = l_TextSize_0
            });
        end;
    end, 
    Fade = function(v9, v10, v11) --[[ Line: 267 ]] --[[ Name: Fade ]]
        v9.Visible = true;
        if v9:IsA("TextLabel") then
            v9.TextTransparency = 1 - v10 * (1 - v11.TextTransparency);
            return;
        else
            if v9:IsA("ImageLabel") then
                v9.ImageTransparency = 1 - v10 * (1 - v11.ImageTransparency);
            end;
            return;
        end;
    end, 
    Wiggle = function(v12, v13, v14) --[[ Line: 276 ]] --[[ Name: Wiggle ]]
        v12.Visible = true;
        local v15 = v14.InitialSize.Y.Offset * (1 - v13) * v14.AnimateStyleAmplitude;
        v12.Position = v14.InitialPosition + UDim2.new(0, 0, 0, math.sin(v13 * 3.141592653589793 * 2 * v14.AnimateStyleNumPeriods) * v15 / 2);
    end, 
    Swing = function(v16, v17, v18) --[[ Line: 282 ]] --[[ Name: Swing ]]
        v16.Visible = true;
        local v19 = 90 * (1 - v17) * v18.AnimateStyleAmplitude;
        v16.Rotation = math.sin(v17 * 3.141592653589793 * 2 * v18.AnimateStyleNumPeriods) * v19;
    end, 
    Spin = function(v20, v21, v22) --[[ Line: 288 ]] --[[ Name: Spin ]]
        v20.Visible = true;
        v20.Position = v22.InitialPosition + UDim2.new(0, v22.InitialSize.X.Offset / 2, 0, v22.InitialSize.Y.Offset / 2);
        v20.AnchorPoint = Vector2.new(0.5, 0.5);
        v20.Rotation = v21 * v22.AnimateStyleNumPeriods * 360;
    end, 
    Rainbow = function(v23, v24, v25) --[[ Line: 295 ]] --[[ Name: Rainbow ]]
        v23.Visible = true;
        local v26 = Color3.fromHSV(v24 * v25.AnimateStyleNumPeriods % 1, 1, 1);
        if v23:IsA("TextLabel") then
            local v27 = getColorFromString(v25.TextColor3);
            v23.TextColor3 = Color3.new(v26.r + v24 * (v27.r - v26.r), v26.g + v24 * (v27.g - v26.g), v26.b + v24 * (v27.b - v26.b));
            return;
        else
            local v28 = getColorFromString(v25.ImageColor3);
            v23.ImageColor3 = Color3.new(v26.r + v24 * (v28.r - v26.r), v26.g + v24 * (v28.g - v26.g), v26.b + v24 * (v28.b - v26.b));
            return;
        end;
    end
};
local l_TextService_0 = game:GetService("TextService");
local l_RunService_0 = game:GetService("RunService");
local v32 = 0;
getLayerCollector = function(v33) --[[ Line: 314 ]] --[[ Name: getLayerCollector ]]
    if not v33 then
        return nil;
    elseif v33:IsA("LayerCollector") then
        return v33;
    elseif v33 and v33.Parent then
        return getLayerCollector(v33.Parent);
    else
        return nil;
    end;
end;
shallowCopy = function(v34) --[[ Line: 326 ]] --[[ Name: shallowCopy ]]
    local v35 = {};
    for v36, v37 in pairs(v34) do
        v35[v36] = v37;
    end;
    return v35;
end;
getColorFromString = function(v38) --[[ Line: 334 ]] --[[ Name: getColorFromString ]]
    -- upvalues: v0 (copy)
    if v0.ColorShortcuts[v38] then
        return v0.ColorShortcuts[v38];
    else
        local v39, v40, v41 = v38:match("(%d+),(%d+),(%d+)");
        return Color3.new(v39 / 255, v40 / 255, v41 / 255);
    end;
end;
getVector2FromString = function(v42) --[[ Line: 343 ]] --[[ Name: getVector2FromString ]]
    local v43, v44 = v42:match("(%d+),(%d+)");
    return Vector2.new(v43, v44);
end;
setHorizontalAlignment = function(v45, v46) --[[ Line: 348 ]] --[[ Name: setHorizontalAlignment ]]
    if v46 == "Left" then
        v45.AnchorPoint = Vector2.new(0, 0);
        v45.Position = UDim2.new(0, 0, 0, 0);
        return;
    elseif v46 == "Center" then
        v45.AnchorPoint = Vector2.new(0.5, 0);
        v45.Position = UDim2.new(0.5, 0, 0, 0);
        return;
    else
        if v46 == "Right" then
            v45.AnchorPoint = Vector2.new(1, 0);
            v45.Position = UDim2.new(1, 0, 0, 0);
        end;
        return;
    end;
end;
v0.New = function(_, v48, v49, v50, v51, v52) --[[ Line: 361 ]] --[[ Name: New ]]
    -- upvalues: v1 (copy), v2 (copy), l_TextService_0 (copy), v0 (copy), v32 (ref), l_RunService_0 (copy), v29 (copy), v3 (copy)
    for _, v54 in pairs(v48:GetChildren()) do
        v54:Destroy();
    end;
    if v51 == nil then
        v51 = true;
    end;
    local v55 = {};
    local v56 = {};
    if v52 then
        v49 = v52.Text;
        v50 = v52.StartingProperties;
    end;
    local v57 = {};
    local v58 = {};
    local v59 = {};
    local v60 = 0;
    local v61 = false;
    local l_TextLabel_0 = Instance.new("TextLabel");
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    local v64 = getLayerCollector(v48);
    local v65 = nil;
    local v66 = nil;
    local v67 = nil;
    local v68 = nil;
    local v69 = nil;
    local v70 = nil;
    v66 = function(v71, v72) --[[ Line: 388 ]] --[[ Name: applyMarkup ]]
        -- upvalues: v1 (ref), v56 (copy), v55 (ref), v65 (ref), v57 (copy), v2 (ref), v69 (ref)
        v71 = v1[v71] or v71;
        if v72 == "/" and v56[v71] then
            v72 = v56[v71];
        end;
        if tonumber(v72) then
            v72 = tonumber(v72);
        elseif v72 == "false" or v72 == "true" then
            v72 = v72 == "true";
        end;
        v55[v71] = v72;
        if not v65(v71, v72) then
            if v71 == "ContainerHorizontalAlignment" and v57[#v57] then
                setHorizontalAlignment(v57[#v57].Container, v72);
            elseif not v2[v71] then
                if v71 == "Img" then
                    v69(v72);
                else
                    return false;
                end;
            end;
        end;
        return true;
    end;
    v65 = function(v73, v74, v75) --[[ Line: 419 ]] --[[ Name: applyProperty ]]
        -- upvalues: l_TextLabel_0 (copy), l_ImageLabel_0 (copy)
        local v76 = nil;
        local v77 = false;
        local v78 = v75 and {
            v75
        } or {
            l_TextLabel_0, 
            l_ImageLabel_0
        };
        for _, v80 in v78 do
            if pcall(function() --[[ Line: 423 ]]
                -- upvalues: v76 (ref), v80 (copy), v73 (copy)
                v76 = typeof(v80[v73]);
            end) then
                if v76 == "Color3" then
                    v80[v73] = getColorFromString(v74);
                elseif v76 == "Vector2" then
                    v80[v73] = getVector2FromString(v74);
                else
                    v80[v73] = v74;
                end;
                v77 = true;
            end;
            if v73 == "Rare" and script.Folder:FindFirstChild(v74) then
                local v81 = script.Folder:FindFirstChild(v74):Clone();
                v81.Parent = v80;
                v81.Name = "UIG";
                v77 = true;
            end;
            if v73 == "Rare" and v74 == "/" then
                if v80:FindFirstChild("UIG") then
                    v80.UIG:Destroy();
                end;
                v77 = true;
            end;
        end;
        return v77;
    end;
    for v82, v83 in pairs(v2) do
        v66(v82, v83);
        v56[v1[v82] or v82] = v55[v1[v82] or v82];
    end;
    local l_pairs_0 = pairs;
    local v85 = v50 or {};
    for v86, v87 in l_pairs_0(v85) do
        v66(v86, v87);
        v56[v1[v86] or v86] = v55[v1[v86] or v86];
    end;
    if v52 then
        v55 = v52.OverflowPickupProperties;
        for v88, v89 in pairs(v55) do
            v66(v88, v89);
        end;
    end;
    l_pairs_0 = function() --[[ Line: 466 ]] --[[ Name: getTextSize ]]
        -- upvalues: v55 (ref), v64 (copy), v48 (copy)
        if v55.TextScaled == true then
            local v90 = nil;
            if v55.TextScaleRelativeTo == "Screen" then
                v90 = v64.AbsoluteSize.Y;
            elseif v55.TextScaleRelativeTo == "Frame" then
                v90 = v48.AbsoluteSize.Y;
            end;
            return (math.min(v55.TextScale * v90, 100));
        else
            return v55.TextSize;
        end;
    end;
    v85 = 0;
    local function v97() --[[ Line: 482 ]] --[[ Name: newLine ]]
        -- upvalues: v57 (copy), v85 (ref), v51 (ref), v55 (ref), v64 (copy), v48 (copy), v61 (ref), v58 (copy), v60 (ref)
        local v91 = v57[#v57];
        if v91 then
            v85 = v85 + v91.Size.Y.Offset;
            if not v51 then
                local l_v85_0 = v85;
                local v93;
                if v55.TextScaled == true then
                    local v94 = nil;
                    if v55.TextScaleRelativeTo == "Screen" then
                        v94 = v64.AbsoluteSize.Y;
                    elseif v55.TextScaleRelativeTo == "Frame" then
                        v94 = v48.AbsoluteSize.Y;
                    end;
                    v93 = math.min(v55.TextScale * v94, 100);
                else
                    v93 = v55.TextSize;
                end;
                if l_v85_0 + v93 > v48.AbsoluteSize.Y then
                    v61 = true;
                    return;
                end;
            end;
        end;
        local l_Frame_0 = Instance.new("Frame");
        l_Frame_0.Name = string.format("Line%03d", #v57 + 1);
        l_Frame_0.Size = UDim2.new(0, 0, 0, 0);
        l_Frame_0.BackgroundTransparency = 1;
        local v96 = Instance.new("Frame", l_Frame_0);
        v96.Name = "Container";
        v96.Size = UDim2.new(0, 0, 0, 0);
        v96.BackgroundTransparency = 1;
        setHorizontalAlignment(v96, v55.ContainerHorizontalAlignment);
        l_Frame_0.Parent = v48;
        table.insert(v57, l_Frame_0);
        v58[#v57] = {};
        v60 = 0;
    end;
    v97();
    local function _(v98) --[[ Line: 508 ]] --[[ Name: addFrameProperties ]]
        -- upvalues: v59 (copy), v55 (ref)
        v59[v98] = shallowCopy(v55);
        v59[v98].InitialSize = v98.Size;
        v59[v98].InitialPosition = v98.Position;
        v59[v98].InitialAnchorPoint = v98.AnchorPoint;
    end;
    v67 = function(v100, v101, v102, v103) --[[ Line: 515 ]] --[[ Name: formatLabel ]]
        -- upvalues: v57 (copy), v55 (ref), v60 (ref), v48 (copy), v58 (copy), v97 (copy), v59 (copy)
        local v104 = v57[#v57];
        local v105 = tostring(v55.TextYAlignment);
        if v105 == "Top" then
            v100.Position = UDim2.new(0, v60, 0, 0);
            v100.AnchorPoint = Vector2.new(0, 0);
        elseif v105 == "Center" then
            v100.Position = UDim2.new(0, v60, 0.5, 0);
            v100.AnchorPoint = Vector2.new(0, 0.5);
        elseif v105 == "Bottom" then
            v100.Position = UDim2.new(0, v60, 1, 0);
            v100.AnchorPoint = Vector2.new(0, 1);
        end;
        v60 = v60 + v102;
        if v60 > v48.AbsoluteSize.X and v60 ~= v102 then
            v100:Destroy();
            local v106 = v58[#v57][#v58[#v57]];
            if v106:IsA("TextLabel") and v106.Text == " " then
                v104.Container.Size = UDim2.new(0, v60 - v102 - v106.Size.X.Offset, 1, 0);
                v106:Destroy();
                table.remove(v58[#v57]);
            end;
            v97();
            v103();
            return;
        else
            v100.Size = UDim2.new(0, v102, 0, v101);
            v104.Container.Size = UDim2.new(0, v60, 1, 0);
            v104.Size = UDim2.new(1, 0, 0, (math.max(v104.Size.Y.Offset, v101)));
            v100.Name = string.format("Group%03d", #v58[#v57] + 1);
            v100.Parent = v104.Container;
            table.insert(v58[#v57], v100);
            v59[v100] = shallowCopy(v55);
            v59[v100].InitialSize = v100.Size;
            v59[v100].InitialPosition = v100.Position;
            v59[v100].InitialAnchorPoint = v100.AnchorPoint;
            v55.AnimateYield = 0;
            return;
        end;
    end;
    v68 = function(v107) --[[ Line: 555 ]] --[[ Name: printText ]]
        -- upvalues: v97 (copy), v60 (ref), v55 (ref), v64 (copy), v48 (copy), l_TextLabel_0 (copy), l_TextService_0 (ref), v59 (copy), v67 (ref), v61 (ref), v68 (ref)
        if v107 == "\n" then
            v97();
            return;
        elseif v107 == " " and v60 == 0 then
            return;
        else
            local v108;
            if v55.TextScaled == true then
                local v109 = nil;
                if v55.TextScaleRelativeTo == "Screen" then
                    v109 = v64.AbsoluteSize.Y;
                elseif v55.TextScaleRelativeTo == "Frame" then
                    v109 = v48.AbsoluteSize.Y;
                end;
                v108 = math.min(v55.TextScale * v109, 100);
            else
                v108 = v55.TextSize;
            end;
            local function v115(v110) --[[ Line: 565 ]] --[[ Name: returnFontSize ]]
                -- upvalues: l_TextLabel_0 (ref), v108 (copy), v64 (ref), l_TextService_0 (ref)
                local v111 = nil;
                local _, _ = pcall(function() --[[ Line: 568 ]]
                    -- upvalues: v110 (copy), l_TextLabel_0 (ref), v108 (ref), v64 (ref), v111 (ref), l_TextService_0 (ref)
                    local l_GetTextBoundsParams_0 = Instance.new("GetTextBoundsParams");
                    l_GetTextBoundsParams_0.Text = v110;
                    if l_TextLabel_0.Font ~= Enum.Font.Unknown then
                        l_GetTextBoundsParams_0.Font = l_TextLabel_0.Font;
                    else
                        l_GetTextBoundsParams_0.Font = Font.new(l_TextLabel_0.FontFace.Family);
                    end;
                    l_GetTextBoundsParams_0.Size = v108;
                    l_GetTextBoundsParams_0.Width = Vector2.new(v64.AbsoluteSize.X, v108).X;
                    v111 = l_TextService_0:GetTextBoundsAsync(l_GetTextBoundsParams_0).X;
                end);
                if v111 == nil then
                    v111 = l_TextService_0:GetTextSize(v110, v108, Enum.Font.SourceSans, Vector2.new(v64.AbsoluteSize.X, v108)).X;
                end;
                return v111;
            end;
            local v116 = v115(v107);
            local v117 = l_TextLabel_0:Clone();
            v117.TextScaled = false;
            v117.TextSize = v108;
            v117.Text = v107;
            v117.TextTransparency = 1;
            v117.TextStrokeTransparency = 1;
            v117.TextWrapped = false;
            local v118 = 0;
            local v119 = 1;
            for v120, v121 in utf8.graphemes(v107) do
                local v122 = string.sub(v107, v120, v121);
                local v123 = v115(v122);
                local v124 = l_TextLabel_0:Clone();
                v124.Text = v122;
                v124.TextScaled = false;
                v124.TextWrapped = false;
                v124.TextSize = v108;
                v124.Position = UDim2.new(0, v118, 0, 0);
                v124.Size = UDim2.new(0, v123, 0, v108);
                v124.Name = string.format("Char%03d", v119);
                v124.Parent = v117;
                v124.Visible = false;
                v59[v124] = shallowCopy(v55);
                v59[v124].InitialSize = v124.Size;
                v59[v124].InitialPosition = v124.Position;
                v59[v124].InitialAnchorPoint = v124.AnchorPoint;
                v118 = v118 + v123;
                v119 = v119 + 1;
            end;
            v67(v117, v108, v116, function() --[[ Line: 622 ]]
                -- upvalues: v61 (ref), v68 (ref), v107 (copy)
                if not v61 then
                    v68(v107);
                end;
            end);
            return;
        end;
    end;
    v69 = function(v125) --[[ Line: 625 ]] --[[ Name: printImage ]]
        -- upvalues: v55 (ref), v64 (copy), v48 (copy), l_ImageLabel_0 (copy), v0 (ref), v67 (ref), v61 (ref), v69 (ref)
        local v126;
        if v55.TextScaled == true then
            local v127 = nil;
            if v55.TextScaleRelativeTo == "Screen" then
                v127 = v64.AbsoluteSize.Y;
            elseif v55.TextScaleRelativeTo == "Frame" then
                v127 = v48.AbsoluteSize.Y;
            end;
            v126 = math.min(v55.TextScale * v127, 100);
        else
            v126 = v55.TextSize;
        end;
        local v128 = l_ImageLabel_0:Clone();
        if v0.ImageShortcuts[v125] then
            v128.Image = typeof(v0.ImageShortcuts[v125]) == "number" and "rbxassetid://" .. v0.ImageShortcuts[v125] or v0.ImageShortcuts[v125];
        else
            v128.Image = "rbxassetid://" .. v125;
        end;
        v128.Size = UDim2.new(0, v126, 0, v126);
        v128.Visible = false;
        v67(v128, v126, v126, function() --[[ Line: 639 ]]
            -- upvalues: v61 (ref), v69 (ref), v125 (copy)
            if not v61 then
                v69(v125);
            end;
        end);
    end;
    v70 = function(v129) --[[ Line: 642 ]] --[[ Name: printSeries ]]
        -- upvalues: v66 (ref), v68 (ref)
        for _, v131 in pairs(v129) do
            local v132, v133 = string.match(v131, "<(.+)=(.+)>");
            if v132 and v133 then
                if not v66(v132, v133) then
                    warn("Could not apply markup: ", v131);
                end;
            else
                v68(v131);
            end;
        end;
    end;
    local v134 = 1;
    local v135 = #v49;
    local v136 = {};
    if v52 then
        v134 = v52.OverflowPickupIndex;
    end;
    while v134 and v134 <= v135 do
        local v137, v138 = string.find(v49, "<.->", v134);
        local v139, v140 = string.find(v49, "[ \t\n]", v134);
        local v141 = nil;
        local v142 = nil;
        local v143 = nil;
        if v137 and v138 and (not v139 or v137 < v139) then
            v141 = v137;
            v142 = v138;
        else
            v141 = v139 or v135 + 1;
            v142 = v140 or v135 + 1;
            v143 = true;
        end;
        local v144 = v134 < v141 and string.sub(v49, v134, v141 - 1) or nil;
        local v145 = v141 <= v135 and string.sub(v49, v141, v142) or nil;
        table.insert(v136, v144);
        if v143 then
            v70(v136);
            if not v61 then
                v70({
                    v145
                });
                if v61 then
                    v134 = v141;
                    break;
                else
                    v136 = {};
                end;
            else
                break;
            end;
        else
            table.insert(v136, v145);
        end;
        v134 = v142 + 1;
    end;
    if not v61 then
        v70(v136);
    end;
    local l_UIListLayout_0 = Instance.new("UIListLayout");
    l_UIListLayout_0.HorizontalAlignment = v55.ContainerHorizontalAlignment;
    l_UIListLayout_0.VerticalAlignment = v55.ContainerVerticalAlignment;
    l_UIListLayout_0.Parent = v48;
    local v147 = 0;
    local l_X_0 = v48.AbsoluteSize.X;
    local v149 = 0;
    for _, v151 in pairs(v57) do
        v147 = v147 + v151.Size.Y.Offset;
        local l_Container_0 = v151.Container;
        local v153 = nil;
        local v154 = nil;
        if l_Container_0.AnchorPoint.X == 0 then
            v153 = l_Container_0.Position.X.Offset;
            v154 = l_Container_0.Size.X.Offset;
        elseif l_Container_0.AnchorPoint.X == 0.5 then
            v153 = v151.AbsoluteSize.X / 2 - l_Container_0.Size.X.Offset / 2;
            v154 = v151.AbsoluteSize.X / 2 + l_Container_0.Size.X.Offset / 2;
        elseif l_Container_0.AnchorPoint.X == 1 then
            v153 = v151.AbsoluteSize.X - l_Container_0.Size.X.Offset;
            v154 = v151.AbsoluteSize.X;
        end;
        l_X_0 = math.min(l_X_0, v153);
        v149 = math.max(v149, v154);
    end;
    v32 = v32 + 1;
    local v155 = false;
    local v156 = false;
    local v157 = false;
    local v158 = "TextAnimation" .. v32;
    local v159 = {};
    local function v166() --[[ Line: 740 ]] --[[ Name: updateAnimations ]]
        -- upvalues: v156 (ref), v159 (ref), v155 (ref), l_RunService_0 (ref), v158 (copy), v29 (ref)
        if v156 and #v159 == 0 or v155 then
            v155 = true;
            l_RunService_0:UnbindFromRenderStep(v158);
            v159 = {};
            return;
        else
            local v160 = tick();
            for v161 = #v159, 1, -1 do
                local v162 = v159[v161];
                local l_Settings_0 = v162.Settings;
                local v164 = v29[l_Settings_0.AnimateStyle];
                if not v164 then
                    warn("No animation style found for: ", l_Settings_0.AnimateStyle, ", defaulting to Appear");
                    v164 = v29.Appear;
                end;
                local v165 = math.min((v160 - v162.Start) / l_Settings_0.AnimateStyleTime, 1);
                v164(v162.Char, v165, l_Settings_0);
                if v165 >= 1 then
                    table.remove(v159, v161);
                end;
            end;
            return;
        end;
    end;
    local function v170(v167) --[[ Line: 765 ]] --[[ Name: setFrameToDefault ]]
        -- upvalues: v59 (copy), v65 (ref)
        v167.Position = v59[v167].InitialPosition;
        v167.Size = v59[v167].InitialSize;
        v167.AnchorPoint = v59[v167].InitialAnchorPoint;
        for v168, v169 in pairs(v59[v167]) do
            v65(v168, v169, v167);
        end;
    end;
    local function v175(v171, v172) --[[ Line: 774 ]] --[[ Name: setGroupVisible ]]
        -- upvalues: v170 (copy)
        v171.Visible = v172;
        for _, v174 in pairs(v171:GetChildren()) do
            if v174:IsA("TextLabel") ~= false then
                v174.Visible = v172;
                if v172 then
                    v170(v174);
                end;
            end;
        end;
        if v172 and v171:IsA("ImageLabel") then
            v170(v171);
        end;
    end;
    local function v212(v176) --[[ Line: 790 ]] --[[ Name: animate ]]
        -- upvalues: v155 (ref), l_RunService_0 (ref), v158 (copy), v166 (copy), v58 (copy), v175 (copy), v159 (ref), v157 (ref), v59 (copy), v156 (ref), v55 (ref)
        v155 = false;
        l_RunService_0:BindToRenderStep(v158, Enum.RenderPriority.Last.Value, v166);
        local v177 = nil;
        local v178 = nil;
        local v179 = nil;
        local v180 = nil;
        for _, v182 in pairs(v58) do
            for _, v184 in pairs(v182) do
                v175(v184, false);
            end;
        end;
        local function _(v185, v186) --[[ Line: 806 ]] --[[ Name: animateCharacter ]]
            -- upvalues: v159 (ref)
            table.insert(v159, {
                Char = v185, 
                Settings = v186, 
                Start = tick()
            });
        end;
        local function v190() --[[ Line: 810 ]] --[[ Name: yield ]]
            -- upvalues: v157 (ref), v180 (ref), v179 (ref), v178 (ref)
            if not v157 and v180 % v179 == 0 and v178 >= 0 then
                local v188 = v178 > 0 and v178 or nil;
                local v189 = script.Typing:Clone();
                v189.Parent = script.Parent;
                v189.Name = "sfx";
                v189:Play();
                _G.destroy(v189, 0.2);
                task.wait(v188);
            end;
        end;
        for _, v192 in pairs(v58) do
            for _, v194 in pairs(v192) do
                local v195 = v59[v194];
                if v195.AnimateStepGrouping ~= v177 or v195.AnimateStepFrequency ~= v179 then
                    v180 = 0;
                end;
                v177 = v195.AnimateStepGrouping;
                v178 = v195.AnimateStepTime;
                v179 = v195.AnimateStepFrequency;
                if v195.AnimateYield > 0 then
                    wait(v195.AnimateYield);
                end;
                if v177 == "Word" or v177 == "All" then
                    if v194:IsA("TextLabel") then
                        v194.Visible = true;
                        for _, v197 in pairs(v194:GetChildren()) do
                            local v198 = v59[v197];
                            table.insert(v159, {
                                Char = v197, 
                                Settings = v198, 
                                Start = tick()
                            });
                        end;
                    else
                        table.insert(v159, {
                            Char = v194, 
                            Settings = v195, 
                            Start = tick()
                        });
                    end;
                    if v177 == "Word" then
                        v180 = v180 + 1;
                        v190();
                    end;
                elseif v177 == "Letter" then
                    if v194:IsA("TextLabel") then
                        v194.Visible = true;
                        local _ = v194.Text;
                        local v200 = 1;
                        while true do
                            local l_v194_FirstChild_0 = v194:FindFirstChild(string.format("Char%03d", v200));
                            if l_v194_FirstChild_0 then
                                local v202 = v59[l_v194_FirstChild_0];
                                table.insert(v159, {
                                    Char = l_v194_FirstChild_0, 
                                    Settings = v202, 
                                    Start = tick()
                                });
                                v180 = v180 + 1;
                                v190();
                                if v155 then
                                    return;
                                else
                                    v200 = v200 + 1;
                                end;
                            else
                                break;
                            end;
                        end;
                    else
                        table.insert(v159, {
                            Char = v194, 
                            Settings = v195, 
                            Start = tick()
                        });
                        v180 = v180 + 1;
                        v190();
                    end;
                else
                    warn("Invalid step grouping: ", v177);
                end;
                if v155 then
                    return;
                end;
            end;
        end;
        v156 = true;
        for _, v204 in pairs(v58) do
            local v205 = nil;
            for _, v207 in pairs(v204) do
                if v207:IsA("TextLabel") then
                    for _, v209 in v207:GetChildren() do
                        if not v209:IsA("UIGradient") then
                            v209:Destroy();
                        end;
                    end;
                    v207.TextTransparency = v55.TextTransparency or 0;
                    v207.TextScaled = v55.TextScaled or false;
                    v207.TextStrokeTransparency = v55.TextStrokeTransparency or 1;
                    v207.TextWrapped = v55.TextWrapped or false;
                    if v205 then
                        if v205.TextColor3 ~= v207.TextColor3 then
                            v205 = v207;
                        else
                            local l_UIG_0 = v205:FindFirstChild("UIG");
                            local l_UIG_1 = v207:FindFirstChild("UIG");
                            if not l_UIG_0 and l_UIG_1 or l_UIG_0 and not l_UIG_1 then
                                v205 = v207;
                            elseif l_UIG_0 and l_UIG_1 and l_UIG_0.Color ~= l_UIG_1.Color then
                                v205 = v207;
                            elseif v205.FontFace ~= v207.FontFace then
                                v205 = v207;
                            else
                                v205.Size = v205.Size + UDim2.new(v207.Size.Width, 0);
                                v205.Text = v205.Text .. v207.Text;
                                v207:Destroy();
                            end;
                        end;
                    else
                        v205 = v207;
                    end;
                end;
            end;
        end;
        if v176 then
            while #v159 > 0 do
                print(#v159);
                l_RunService_0.RenderStepped:Wait();
            end;
        end;
    end;
    local v213 = {
        Overflown = v61, 
        OverflowPickupIndex = v134, 
        StartingProperties = v50, 
        OverflowPickupProperties = v55, 
        Text = v49, 
        _textFrames = v58, 
        _frameProperties = v59
    };
    if v52 then
        v52.NextTextObject = v213;
    end;
    v213.ContentSize = Vector2.new(v149 - l_X_0, v147);
    v213.Animate = function(v214, v215) --[[ Line: 969 ]] --[[ Name: Animate ]]
        -- upvalues: v212 (copy)
        if v215 then
            v212();
        else
            coroutine.wrap(v212)();
        end;
        if v214.NextTextObject then
            v214.NextTextObject:Animate(v215);
        end;
    end;
    v213.Show = function(v216, v217) --[[ Line: 980 ]] --[[ Name: Show ]]
        -- upvalues: v157 (ref), v155 (ref), v58 (copy), v175 (copy)
        if v217 then
            v157 = true;
        else
            v155 = true;
            for _, v219 in pairs(v58) do
                for _, v221 in pairs(v219) do
                    v175(v221, true);
                end;
            end;
        end;
        if v216.NextTextObject then
            v216.NextTextObject:Show(v217);
        end;
    end;
    local function v228(v222, v223, v224) --[[ Line: 1041 ]] --[[ Name: applyPropertyFast ]]
        -- upvalues: v3 (ref), v0 (ref)
        if not v3[v222] or not v224:IsA(v3[v222]) then
            return;
        else
            v223 = string.gmatch(tostring(v223), "[^,]+");
            local v225 = v223();
            local v226 = v223();
            local v227 = v223();
            if v227 then
                v224[v222] = Color3.fromRGB(v225, v226, v227);
                return;
            elseif v0.ColorShortcuts[v225] ~= nil then
                v224[v222] = v0.ColorShortcuts[v225];
                return;
            elseif v226 then
                v224[v222] = Vector2.new(v225, v226);
                return;
            else
                pcall(function() --[[ Line: 1055 ]]
                    -- upvalues: v224 (copy), v222 (copy), v225 (copy)
                    v224[v222] = v225;
                end);
                return;
            end;
        end;
    end;
    local function v233(v229, v230) --[[ Line: 1061 ]] --[[ Name: setFrameToDefaultUsing ]]
        -- upvalues: v228 (copy)
        v229.Position = v230[v229].InitialPosition;
        v229.Size = v230[v229].InitialSize;
        v229.AnchorPoint = v230[v229].InitialAnchorPoint;
        for v231, v232 in pairs(v230[v229]) do
            v228(v231, v232, v229);
        end;
    end;
    v213.ShowFast = function(v234) --[[ Line: 1074 ]] --[[ Name: ShowFast ]]
        -- upvalues: v233 (copy), v58 (copy)
        local l_v234_0 = v234;
        local v236 = {
            n = 0
        };
        local v237 = {};
        local v238 = 1;
        local v239 = 1;
        repeat
            for v240, v241 in next, l_v234_0._frameProperties do
                v237[v240] = v241;
            end;
            while l_v234_0._textFrames[v238] do
                if l_v234_0._textFrames[v238][v239] then
                    v236.n = v236.n + 1;
                    v236[v236.n] = l_v234_0._textFrames[v238][v239];
                    v239 = v239 + 1;
                else
                    v239 = 1;
                    v238 = v238 + 1;
                end;
            end;
            l_v234_0 = l_v234_0.NextTextObject;
        until l_v234_0 == nil;
        v238 = 1;
        while v238 <= v236.n do
            if v236[v238] and game.IsA(v236[v238], "GuiObject") then
                v236[v238].Visible = true;
                if v236[v238]:IsA("ImageLabel") then
                    v233(v236[v238], v237);
                end;
                if v58[v238] then
                    v239 = v236[v238]:GetChildren();
                    local v242 = #v239;
                    for v243 = 1, v242 do
                        v236[v236.n + v243] = v239[v243];
                    end;
                    v236.n = v236.n + v242;
                else
                    v233(v236[v238], v237);
                end;
            end;
            v238 = v238 + 1;
        end;
    end;
    v213.Hide = function(v244) --[[ Line: 1135 ]] --[[ Name: Hide ]]
        -- upvalues: v155 (ref), v58 (copy), v175 (copy)
        v155 = true;
        for _, v246 in pairs(v58) do
            for _, v248 in pairs(v246) do
                v175(v248, false);
            end;
        end;
        if v244.NextTextObject then
            v244.NextTextObject:Hide();
        end;
    end;
    return v213;
end;
v0.ContinueOverflow = function(_, v250, v251) --[[ Line: 1151 ]] --[[ Name: ContinueOverflow ]]
    -- upvalues: v0 (copy)
    return v0:New(v250, nil, nil, false, v251);
end;
return v0;