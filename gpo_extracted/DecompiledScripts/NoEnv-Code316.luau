local v0 = Color3.new(0.12156862745098039, 0.12156862745098039, 0.12156862745098039);
local v1 = v0:lerp(Color3.new(1, 1, 1), 0.1);
local v2 = Color3.new(0.10588235294117647, 0.16470588235294117, 0.20784313725490197);
local v3 = UDim2.new(0, 5, 0, 5);
local v4 = UDim2.new(0, 0, 0, 0);
local v5 = Color3.new(1, 1, 1);
local v6 = UDim2.new(1, -10, 1, -10);
local v7 = Color3.fromRGB(178, 178, 178);
local v8 = {
    Horizontal = "rbxassetid://1243146213", 
    Vertical = "rbxassetid://1243145985", 
    LeftCorner = "rbxassetid://1243145459", 
    RightCorner = "rbxassetid://1243145350", 
    TopRight = "rbxassetid://1243145459", 
    TopLeft = "rbxassetid://1243145350"
};
local v9 = nil;
local v10 = nil;
local v11 = nil;
local v12 = nil;
local v13 = nil;
local v14 = nil;
local v15 = nil;
local v16 = nil;
local v17 = nil;
local v18 = nil;
local v19 = nil;
local v20 = nil;
local v21 = nil;
local v22 = nil;
client = nil;
Pcall = nil;
Routine = nil;
service = nil;
GetEnv = nil;
local function v24(v23) --[[ Line: 148 ]] --[[ Name: isGui ]]
    return v23:IsA("GuiObject");
end;
return function(v25, v26) --[[ Line: 153 ]]
    -- upvalues: v10 (ref), v16 (ref), v9 (ref), v2 (copy), v4 (copy), v0 (copy), v7 (copy), v5 (copy), v6 (copy), v3 (copy), v1 (copy), v24 (copy), v22 (ref), v12 (ref), v14 (ref), v13 (ref), v17 (ref), v11 (ref), v20 (ref), v21 (ref), v18 (ref), v15 (ref), v8 (copy), v19 (ref)
    if v26 then
        setfenv(1, v26);
    end;
    local l_LocalPlayer_0 = service.Players.LocalPlayer;
    local l_l_LocalPlayer_0_Mouse_0 = l_LocalPlayer_0:GetMouse();
    local l_UserInputService_0 = service.UserInputService;
    local _ = v25.gIndex;
    local l_gTable_0 = v25.gTable;
    local l_BindEvent_0 = l_gTable_0.BindEvent;
    local l_Object_0 = l_gTable_0.Object;
    local l_Name_0 = v25.Name;
    local l_Icon_0 = v25.Icon;
    local l_Size_0 = v25.Size;
    local l_Menu_0 = v25.Menu;
    local l_Title_0 = v25.Title;
    local l_Ready_0 = v25.Ready;
    local l_Walls_0 = v25.Walls;
    local l_NoHide_0 = v25.NoHide;
    local l_NoClose_0 = v25.NoClose;
    local l_OnReady_0 = v25.OnReady;
    local l_OnClose_0 = v25.OnClose;
    local l_OnResize_0 = v25.OnResize;
    local l_OnRefresh_0 = v25.OnRefresh;
    local l_OnMinimize_0 = v25.OnMinimize;
    local _ = v25.ContextMenu;
    local l_ResetOnSpawn_0 = v25.ResetOnSpawn;
    local l_CanKeepAlive_0 = v25.CanKeepAlive;
    local l_IconClicked_0 = v25.IconClicked;
    local v52 = v25.SizeLocked or v25.SizeLock;
    local l_CanvasSize_0 = v25.CanvasSize;
    local l_Position_0 = v25.Position;
    local v55 = v25.Content or v25.Children;
    local v56 = v25.MinSize or {
        150, 
        50
    };
    local v57 = v25.MaxSize or {
        math.huge, 
        math.huge
    };
    local l_Icon_1 = l_l_LocalPlayer_0_Mouse_0.Icon;
    local v59 = false;
    local v60 = false;
    local v61 = false;
    local l_CheckProperty_0 = service.CheckProperty;
    local v63 = {};
    local v64 = nil;
    local v65 = nil;
    local v66 = nil;
    local v67 = nil;
    local v68 = nil;
    local l_Drag_0 = l_Object_0.Drag;
    local l_Close_0 = l_Drag_0.Close;
    local l_Hide_0 = l_Drag_0.Hide;
    local l_Icon_2 = l_Drag_0.Icon;
    local l_Title_1 = l_Drag_0.Title;
    local l_Refresh_0 = l_Drag_0.Refresh;
    local l_Spinner_0 = l_Refresh_0.Spinner;
    local l_Main_0 = l_Drag_0.Main;
    local l_Desc_0 = l_Object_0.Desc;
    local l_ScrollingFrame_0 = l_Object_0.Drag.Main.ScrollingFrame;
    local l_LeftResizeIcon_0 = l_Main_0.LeftResizeIcon;
    local l_RightResizeIcon_0 = l_Main_0.RightResizeIcon;
    local l_RightCorner_0 = l_Main_0.RightCorner;
    local l_LeftCorner_0 = l_Main_0.LeftCorner;
    local l_RightSide_0 = l_Main_0.RightSide;
    local l_LeftSide_0 = l_Main_0.LeftSide;
    local l_TopRight_0 = l_Main_0.TopRight;
    local l_TopLeft_0 = l_Main_0.TopLeft;
    local l_Bottom_0 = l_Main_0.Bottom;
    local l_Top_0 = l_Main_0.Top;
    v10 = function(v89, v90, v91, v92) --[[ Line: 225 ]] --[[ Name: Expand ]]
        -- upvalues: v64 (ref), l_Object_0 (copy)
        local l_Label_0 = v90:FindFirstChild("Label");
        if l_Label_0 then
            v89.MouseLeave:Connect(function(_, _) --[[ Line: 229 ]]
                -- upvalues: v64 (ref), v89 (copy), v90 (copy)
                if v64 == v89 then
                    v90.Visible = false;
                end;
            end);
            v89.MouseMoved:Connect(function(v96, v97) --[[ Line: 235 ]]
                -- upvalues: v64 (ref), v89 (copy), v91 (copy), l_Label_0 (copy), v92 (copy), l_Object_0 (ref), v90 (copy)
                v64 = v89;
                local v98 = v91 or v89.Desc.Value;
                l_Label_0.Text = v98;
                l_Label_0.RichText = v92;
                l_Label_0.TextScaled = v92;
                local l_ContentText_0 = l_Label_0.ContentText;
                local l_TextSize_0 = service.TextService:GetTextSize(l_ContentText_0, l_Label_0.TextSize, l_Label_0.Font, Vector2.new(400, math.huge));
                local v101 = l_TextSize_0.X + 10;
                local v102 = l_TextSize_0.Y + 10;
                local v103 = v96 + 6 + v101 < l_Object_0.AbsoluteSize.X and v96 + 6 or v96 - 6 - v101;
                local v104 = v97 - 6 - v102 > 0 and v97 - 6 - v102 or v97;
                v90.Size = UDim2.fromOffset(v101, v102);
                v90.Position = UDim2.fromOffset(v103, v104);
                v90.Visible = v98 ~= "";
            end);
        end;
    end;
    v16 = function(v105) --[[ Line: 259 ]] --[[ Name: getNextPos ]]
        -- upvalues: l_CheckProperty_0 (copy)
        local v106 = nil;
        local v107 = nil;
        for _, v109 in ipairs(v105:GetChildren()) do
            if l_CheckProperty_0(v109, "Size") then
                if not v106 or v109.AbsolutePosition.X + v109.AbsoluteSize.X > v106.AbsolutePosition.X + v106.AbsoluteSize.X then
                    v106 = v109;
                end;
                if not v107 or v109.AbsolutePosition.Y + v109.AbsoluteSize.Y > v106.AbsolutePosition.Y + v106.AbsoluteSize.Y then
                    v107 = v109;
                end;
            end;
        end;
        return not (v106 and v107) and UDim2.new(0, 0, 0, 0) or UDim2.new(v106.Position.X.Scale, v106.Position.X.Offset + v106.AbsoluteSize.X, v107.Position.Y.Scale, v107.Position.Y.Offset + v107.AbsoluteSize.Y);
    end;
    v66 = function(v110, v111) --[[ Line: 276 ]] --[[ Name: LoadChildren ]]
        -- upvalues: v68 (ref), v9 (ref)
        if v111 then
            local v112 = v111.RunWhenDone and v68(v111.RunWhenDone, v110);
            for v113, v114 in pairs(v111) do
                if type(v114) == "table" then
                    if not v114.Parent then
                        v114.Parent = v110;
                    end;
                    v9(v114.Class or v114.ClassName or v113, v114);
                elseif type(v114) == "function" or type(v114) == "string" and not v112 then
                    v112 = v68(v114, v110);
                end;
            end;
            if v112 then
                v112(v110);
            end;
        end;
    end;
    v67 = function() --[[ Line: 294 ]] --[[ Name: BringToFront ]]
        -- upvalues: l_LocalPlayer_0 (copy), l_Object_0 (copy)
        for _, v116 in ipairs(l_LocalPlayer_0.PlayerGui:GetChildren()) do
            if v116:FindFirstChild("__ADONIS_WINDOW") then
                v116.DisplayOrder = 100;
            end;
        end;
        l_Object_0.DisplayOrder = 101;
    end;
    v65 = function(v117) --[[ Line: 304 ]] --[[ Name: addTitleButton ]]
        -- upvalues: l_Hide_0 (copy), l_Close_0 (copy), l_Drag_0 (copy), v9 (ref)
        local v118 = nil;
        local l_l_Hide_0_0 = l_Hide_0;
        local v120 = l_Hide_0.AbsolutePosition.X + l_Hide_0.AbsoluteSize.X - l_Close_0.AbsolutePosition.X;
        local l_l_Close_0_0 = l_Close_0;
        for _, v123 in ipairs(l_Drag_0:GetChildren()) do
            if v123:IsA("TextButton") and v123.Visible and v123.AbsolutePosition.X < l_l_Close_0_0.AbsolutePosition.X then
                l_l_Close_0_0 = v123;
            end;
        end;
        local v124 = v117.Size or l_l_Hide_0_0.Size;
        local v125 = l_l_Close_0_0.Position.X.Offset - (v124.X.Offset - v120);
        v118 = UDim2.new(l_l_Close_0_0.Position.X.Scale, v125, l_l_Hide_0_0.Position.Y.Scale, l_l_Hide_0_0.Position.Y.Offset);
        v117.Name = "__TITLEBUTTON";
        v117.Size = v124;
        v117.Parent = l_Drag_0;
        v117.ZIndex = v117.ZIndex or l_l_Hide_0_0.ZIndex;
        v117.Position = v117.Position or v118;
        v117.TextSize = v117.TextSize or l_l_Hide_0_0.TextSize;
        v117.TextColor3 = v117.TextColor3 or l_l_Hide_0_0.TextColor3;
        v117.TextScaled = v117.TextScaled or l_l_Hide_0_0.TextScaled;
        v117.TextScaled = v117.TextScaled or l_l_Hide_0_0.TextScaled;
        v117.TextWrapped = v117.TextWrapped or l_l_Hide_0_0.TextWrapped;
        v117.TextStrokeColor3 = v117.TextStrokeColor3 or l_l_Hide_0_0.TextStrokeColor3;
        v117.TextTransparency = v117.TextTransparency or l_l_Hide_0_0.TextTransparency;
        v117.TextStrokeTransparency = v117.TextStrokeTransparency or l_l_Hide_0_0.TextStrokeTransparency;
        v117.BackgroundTransparency = v117.BackgroundTransparency or l_l_Hide_0_0.BackgroundTransparency;
        v117.BackgroundColor3 = v117.BackgroundColor3 or l_l_Hide_0_0.BackgroundColor3;
        v117.BorderSizePixel = v117.BorderSizePixel or l_l_Hide_0_0.BorderSizePixel;
        v117.Font = v117.Font or l_l_Hide_0_0.Font;
        return v9("TextButton", v117);
    end;
    v68 = function(v126, v127) --[[ Line: 347 ]] --[[ Name: functionify ]]
        if type(v126) == "string" then
            if v127 then
                local v128 = GetEnv();
                v128.Object = v127;
                return client.Core.LoadCode(v126, v128);
            else
                return client.Core.LoadCode(v126);
            end;
        else
            return v126;
        end;
    end;
    v9 = function(v129, v130, v131) --[[ Line: 361 ]] --[[ Name: create ]]
        -- upvalues: v63 (copy), l_CheckProperty_0 (copy), v2 (ref), v4 (ref), v0 (ref), v7 (ref), v5 (ref), v6 (ref), v3 (ref), v68 (ref), l_BindEvent_0 (copy), v10 (ref), l_Desc_0 (copy), l_l_LocalPlayer_0_Mouse_0 (copy), v9 (ref), l_Object_0 (copy), v16 (ref), v1 (ref), v24 (ref), v66 (ref), v22 (ref)
        local v132 = v130 or {};
        local v133 = v132.Class or v132.ClassName or v129;
        local v134 = v131 or v63[v133] and v63[v133]:Clone() or service.New(v133);
        local v135 = v132.Parent or v134.Parent;
        if v130 then
            v132.Parent = nil;
            if v132.Class or v132.ClassName then
                v132.Class = nil;
                v132.ClassName = nil;
            end;
            if not v132.BorderColor3 and l_CheckProperty_0(v134, "BorderColor3") then
                v134.BorderColor3 = v2;
            end;
            if not v132.CanvasSize and l_CheckProperty_0(v134, "CanvasSize") then
                v134.CanvasSize = v4;
            end;
            if not v132.BorderSizePixel and l_CheckProperty_0(v134, "BorderSizePixel") then
                v134.BorderSizePixel = 0;
            end;
            if not v132.BackgroundColor3 and l_CheckProperty_0(v134, "BackgroundColor3") then
                v134.BackgroundColor3 = v0;
            end;
            if not v132.PlaceholderColor3 and l_CheckProperty_0(v134, "PlaceholderColor3") then
                v134.PlaceholderColor3 = v7;
            end;
            if not v132.Transparency and not v132.BackgroundTransparency and l_CheckProperty_0(v134, "Transparency") and l_CheckProperty_0(v134, "BackgroundTransparency") then
                v134.BackgroundTransparency = 0;
            elseif v132.Transparency and l_CheckProperty_0(v134, "BackgroundTransparency") then
                v134.BackgroundTransparency = v132.Transparency;
            end;
            if not v132.TextColor3 and not v132.TextColor and l_CheckProperty_0(v134, "TextColor3") then
                v134.TextColor3 = v5;
            elseif v132.TextColor then
                v134.TextColor3 = v132.TextColor;
            end;
            if not v132.Font and l_CheckProperty_0(v134, "Font") then
                v132.Font = "SourceSans";
            end;
            if not v132.TextSize and l_CheckProperty_0(v134, "TextSize") then
                v132.TextSize = 16;
            end;
            if not v132.BottomImage and not v132.MidImage and not v132.TopImage and v133 == "ScrollingFrame" then
                v134.BottomImage = "http://roblox.com/asset?id=158348114";
                v134.MidImage = "http://roblox.com/asset?id=158348114";
                v134.TopImage = "http://roblox.com/asset?id=158348114";
            end;
            if not v132.Size and l_CheckProperty_0(v134, "Size") then
                v134.Size = v6;
            end;
            if not v132.Position and l_CheckProperty_0(v134, "Position") then
                v134.Position = v3;
            end;
            if not v132.ZIndex and l_CheckProperty_0(v134, "ZIndex") then
                v134.ZIndex = 2;
                if v135 and l_CheckProperty_0(v135, "ZIndex") then
                    v134.ZIndex = v135.ZIndex;
                end;
            end;
            if v132.TextChanged and v133 == "TextBox" then
                local v136 = v68(v132.TextChanged, v134);
                local l_v136_0 = v136 --[[ copy: 7 -> 45 ]];
                v134.FocusLost:Connect(function(v138) --[[ Line: 438 ]]
                    -- upvalues: l_v136_0 (copy), v134 (copy)
                    l_v136_0(v134.Text, v138, v134);
                end);
            end;
            if (v132.OnClicked or v132.OnClick) and (v133 == "TextButton" or v133 == "ImageButton") then
                local v139 = false;
                local l_Debounce_0 = v132.Debounce;
                local v141 = v68(v132.OnClicked or v132.OnClick, v134);
                local l_l_Debounce_0_0 = l_Debounce_0 --[[ copy: 8 -> 43 ]];
                local l_v141_0 = v141 --[[ copy: 9 -> 44 ]];
                do
                    local l_v139_0 = v139;
                    v134.MouseButton1Down:Connect(function() --[[ Line: 447 ]]
                        -- upvalues: l_v139_0 (ref), l_l_Debounce_0_0 (copy), l_v141_0 (copy), v134 (copy)
                        if not l_v139_0 then
                            if l_l_Debounce_0_0 then
                                l_v139_0 = true;
                            end;
                            l_v141_0(v134);
                            l_v139_0 = false;
                        end;
                    end);
                end;
            end;
            if v132.Events then
                for v145, v146 in pairs(v132.Events) do
                    local v147 = v68(v146, v134);
                    l_BindEvent_0(v134[v145], function(...) --[[ Line: 463 ]]
                        -- upvalues: v147 (copy)
                        v147(...);
                    end);
                end;
            end;
            if v132.Visible == nil then
                v132.Visible = true;
            end;
            if v132.LabelProps then
                v132.LabelProperties = v132.LabelProps;
            end;
        end;
        if v133 == "Entry" then
            local l_Text_0 = v134.Text;
            local l_Dots_0 = v134.Dots;
            local l_Desc_1 = v134.Desc;
            local v151 = v132.RichText or l_Text_0.RichText;
            l_Text_0.ZIndex = v132.ZIndex or v134.ZIndex;
            l_Dots_0.ZIndex = v132.ZIndex or v134.ZIndex;
            if v132.Text then
                l_Text_0.Text = v132.Text;
                l_Text_0.Visible = true;
                v132.Text = nil;
            end;
            if v132.Desc or v132.ToolTip then
                l_Desc_1.Value = v132.Desc or v132.ToolTip;
                v132.Desc = nil;
            end;
            v10(v134, l_Desc_0, nil, v151);
        elseif v132.ToolTip then
            v10(v134, l_Desc_0, v132.ToolTip, v132.RichText);
        end;
        if v133 == "ButtonEntry" then
            local l_Button_0 = v134.Button;
            local v153 = false;
            local v154 = v68(v132.OnClicked, l_Button_0);
            local l_v154_0 = v154 --[[ copy: 9 -> 41 ]];
            local l_l_Button_0_0 = l_Button_0 --[[ copy: 7 -> 42 ]];
            do
                local l_v153_0 = v153;
                v134:SetSpecial("DoClick", function() --[[ Line: 510 ]]
                    -- upvalues: l_v153_0 (ref), l_v154_0 (copy), l_l_Button_0_0 (copy)
                    if not l_v153_0 then
                        l_v153_0 = true;
                        if l_v154_0 then
                            l_v154_0(l_l_Button_0_0);
                        end;
                        l_v153_0 = false;
                    end;
                end);
                v134.Text = v132.Text or v134.Text;
                l_Button_0.ZIndex = v132.ZIndex or v134.ZIndex;
                l_Button_0.MouseButton1Down:Connect(v134.DoClick);
            end;
        end;
        if v133 == "Boolean" then
            local l_Enabled_0 = v132.Enabled;
            local v159 = false;
            local v160 = v68(v132.OnToggle, v134);
            local l_v160_0 = v160 --[[ copy: 9 -> 39 ]];
            do
                local l_l_Enabled_0_0, l_v159_0 = l_Enabled_0, v159;
                local function v165(v164) --[[ Line: 529 ]] --[[ Name: toggle ]]
                    -- upvalues: l_v159_0 (ref), l_l_Enabled_0_0 (ref), v134 (copy), l_v160_0 (copy)
                    if not l_v159_0 then
                        l_v159_0 = true;
                        if v164 ~= nil and v164 or v164 == nil and l_l_Enabled_0_0 then
                            l_l_Enabled_0_0 = false;
                            v134.Text = "Disabled";
                        elseif v164 ~= nil and v164 == false or v164 == nil and not l_l_Enabled_0_0 then
                            l_l_Enabled_0_0 = true;
                            v134.Text = "Enabled";
                        end;
                        if l_v160_0 then
                            l_v160_0(l_l_Enabled_0_0, v134);
                        end;
                        l_v159_0 = false;
                    end;
                end;
                v134.Text = l_l_Enabled_0_0 and "Enabled" or "Disabled";
                local l_v165_0 = v165 --[[ copy: 10 -> 40 ]];
                v134.MouseButton1Down:Connect(function() --[[ Line: 549 ]]
                    -- upvalues: l_v160_0 (copy), l_v165_0 (copy)
                    if l_v160_0 then
                        l_v165_0();
                    end;
                end);
                v134:SetSpecial("Toggle", function(_, v168) --[[ Line: 555 ]]
                    -- upvalues: l_v165_0 (copy)
                    l_v165_0(v168);
                end);
            end;
        end;
        if v133 == "StringEntry" then
            local l_Box_0 = v134.Box;
            local v170 = nil;
            v134.Text = v132.Text or v134.Text;
            l_Box_0.ZIndex = v132.ZIndex or v134.ZIndex;
            if v132.BoxText then
                l_Box_0.Text = v132.BoxText;
            end;
            if v132.BoxProperties then
                for v171, v172 in pairs(v132.BoxProperties) do
                    if l_CheckProperty_0(l_Box_0, v171) then
                        l_Box_0[v171] = v172;
                    end;
                end;
            end;
            do
                local l_v170_0 = v170;
                if v132.TextChanged then
                    local v174 = v68(v132.TextChanged, l_Box_0);
                    local l_v174_0 = v174 --[[ copy: 9 -> 37 ]];
                    local l_l_Box_0_0 = l_Box_0 --[[ copy: 7 -> 38 ]];
                    l_Box_0.Changed:Connect(function(v177) --[[ Line: 579 ]]
                        -- upvalues: l_v170_0 (ref), l_v174_0 (copy), l_l_Box_0_0 (copy)
                        if v177 == "Text" and not l_v170_0 then
                            l_v174_0(l_l_Box_0_0.Text);
                        end;
                    end);
                    l_Box_0.FocusLost:Connect(function(v178) --[[ Line: 585 ]]
                        -- upvalues: l_v174_0 (copy), l_l_Box_0_0 (copy), l_v170_0 (ref)
                        local v179 = l_v174_0(l_l_Box_0_0.Text, true, v178);
                        if v179 then
                            l_v170_0 = true;
                            l_l_Box_0_0.Text = v179;
                            l_v170_0 = false;
                        end;
                    end);
                end;
                local l_l_Box_0_1 = l_Box_0 --[[ copy: 7 -> 36 ]];
                v134:SetSpecial("SetValue", function(_, v182) --[[ Line: 595 ]]
                    -- upvalues: l_l_Box_0_1 (copy)
                    l_l_Box_0_1.Text = v182;
                end);
            end;
        end;
        if v133 == "Slider" then
            local l_Percentage_0 = v134.Percentage;
            local l_Slider_0 = v134.Slider;
            local l_SliderBar_0 = v134.SliderBar;
            local l_Drag_1 = v134.Drag;
            local v187 = false;
            local v188 = 0;
            local v189 = v68(v132.OnSlide, v134);
            l_SliderBar_0.ZIndex = v132.ZIndex or v134.ZIndex;
            l_Slider_0.ZIndex = l_SliderBar_0.ZIndex + 1;
            l_Drag_1.ZIndex = l_Slider_0.ZIndex + 1;
            l_Drag_1.Active = true;
            if v132.Value then
                l_Slider_0.Position = UDim2.new(0.5, -10, 0.5, -10);
                l_Drag_1.Position = l_Slider_0.Position;
            end;
            local l_l_Slider_0_0 = l_Slider_0 --[[ copy: 8 -> 32 ]];
            local l_l_Drag_1_0 = l_Drag_1 --[[ copy: 10 -> 33 ]];
            local l_l_Percentage_0_0 = l_Percentage_0 --[[ copy: 7 -> 34 ]];
            local l_v189_0 = v189 --[[ copy: 13 -> 35 ]];
            do
                local l_v187_0, l_v188_0 = v187, v188;
                l_SliderBar_0.InputBegan:Connect(function(v196) --[[ Line: 618 ]]
                    -- upvalues: l_v187_0 (ref), l_v188_0 (ref), v134 (copy), l_l_Slider_0_0 (copy), l_l_Drag_1_0 (copy), l_l_Percentage_0_0 (copy), l_v189_0 (copy)
                    if not l_v187_0 and (v196.UserInputType == Enum.UserInputType.MouseButton1 or v196.UserInputType == Enum.UserInputType.Touch) then
                        l_v188_0 = (v196.Position.X - v134.AbsolutePosition.X) / v134.AbsoluteSize.X;
                        if l_v188_0 < 0 then
                            l_v188_0 = 0;
                        elseif l_v188_0 > 1 then
                            l_v188_0 = 1;
                        end;
                        l_l_Slider_0_0.Position = UDim2.new(l_v188_0, -10, 0.5, -10);
                        l_l_Drag_1_0.Position = l_l_Slider_0_0.Position;
                        l_l_Percentage_0_0.Value = l_v188_0;
                        if l_v189_0 then
                            l_v189_0(l_v188_0);
                        end;
                    end;
                end);
                l_Drag_1.DragBegin:Connect(function() --[[ Line: 638 ]]
                    -- upvalues: l_v187_0 (ref)
                    l_v187_0 = true;
                end);
                l_Drag_1.DragStopped:Connect(function() --[[ Line: 642 ]]
                    -- upvalues: l_v187_0 (ref), l_l_Drag_1_0 (copy), l_l_Slider_0_0 (copy)
                    l_v187_0 = false;
                    l_l_Drag_1_0.Position = l_l_Slider_0_0.Position;
                end);
                l_Drag_1.Changed:Connect(function() --[[ Line: 647 ]]
                    -- upvalues: l_v187_0 (ref), l_v188_0 (ref), l_l_LocalPlayer_0_Mouse_0 (ref), v134 (copy), l_l_Slider_0_0 (copy), l_l_Percentage_0_0 (copy), l_v189_0 (copy)
                    if l_v187_0 then
                        l_v188_0 = (l_l_LocalPlayer_0_Mouse_0.X - v134.AbsolutePosition.X) / v134.AbsoluteSize.X;
                        if l_v188_0 < 0 then
                            l_v188_0 = 0;
                        elseif l_v188_0 > 1 then
                            l_v188_0 = 1;
                        end;
                        l_l_Slider_0_0.Position = UDim2.new(l_v188_0, -10, 0.5, -10);
                        l_l_Percentage_0_0.Value = l_v188_0;
                        if l_v189_0 then
                            l_v189_0(l_v188_0);
                        end;
                    end;
                end);
                v134:SetSpecial("SetValue", function(_, v198) --[[ Line: 666 ]]
                    -- upvalues: l_v188_0 (ref), l_l_Percentage_0_0 (copy), l_l_Slider_0_0 (copy), l_l_Drag_1_0 (copy)
                    if v198 and tonumber(v198) then
                        l_v188_0 = tonumber(v198);
                        l_l_Percentage_0_0.Value = l_v188_0;
                        l_l_Slider_0_0.Position = UDim2.new(l_v188_0, -10, 0.5, -10);
                        l_l_Drag_1_0.Position = l_l_Slider_0_0.Position;
                    end;
                end);
            end;
        end;
        if v133 == "Dropdown" then
            local l_Menu_1 = v134.Menu;
            local l_Down_0 = v134.Down;
            local l_dSelected_0 = v134.dSelected;
            local l_Options_0 = v132.Options;
            local v203 = v132.Selected or v132.Selection;
            local v204 = v68(v132.OnSelection or v132.OnSelect or function() --[[ Line: 682 ]]

            end);
            local l_TextProperties_0 = v132.TextProperties;
            local v206 = v9("ScrollingFrame", {
                Parent = l_Menu_1, 
                Size = UDim2.fromScale(1, 1), 
                Position = UDim2.new(), 
                BackgroundTransparency = 1, 
                ZIndex = 100
            });
            l_Menu_1.ZIndex = v206.ZIndex;
            l_Menu_1.Parent = l_Object_0;
            l_Menu_1.Visible = false;
            l_Menu_1.Size = UDim2.new(0, v134.AbsoluteSize.X, 0, 100);
            l_Menu_1.BackgroundColor3 = v132.BackgroundColor3 or v134.BackgroundColor3;
            if v132.TextAlignment then
                l_dSelected_0.TextXAlignment = v132.TextAlignment;
                l_dSelected_0.Position = UDim2.fromOffset(30, 0);
            end;
            if v132.NoArrow then
                l_Down_0.Visible = false;
            end;
            v134:SetSpecial("MenuContainer", l_Menu_1);
            local l_l_Menu_1_0 = l_Menu_1 --[[ copy: 7 -> 27 ]];
            local l_l_Down_0_0 = l_Down_0 --[[ copy: 8 -> 28 ]];
            local l_l_dSelected_0_0 = l_dSelected_0 --[[ copy: 9 -> 29 ]];
            local l_l_Options_0_0 = l_Options_0 --[[ copy: 10 -> 30 ]];
            v134.Changed:Connect(function(v211) --[[ Line: 709 ]]
                -- upvalues: l_l_Menu_1_0 (copy), v134 (copy), l_l_Down_0_0 (copy), v132 (copy), l_l_dSelected_0_0 (copy), l_l_Options_0_0 (copy), v206 (copy)
                if v211 == "AbsolutePosition" and l_l_Menu_1_0.Visible then
                    l_l_Menu_1_0.Position = UDim2.fromOffset(v134.AbsolutePosition.X, v134.AbsolutePosition.Y + v134.AbsoluteSize.Y);
                    return;
                else
                    if v211 == "AbsoluteSize" or v211 == "Parent" then
                        l_l_Down_0_0.Size = UDim2.new(0, v134.AbsoluteSize.Y, 1, 0);
                        if v132.TextAlignment == "Right" then
                            l_l_Down_0_0.Position = UDim2.new(0, 0, 0.5, -(l_l_Down_0_0.AbsoluteSize.X / 2));
                            l_l_dSelected_0_0.Position = UDim2.fromOffset(v134.AbsoluteSize.Y, 0);
                        else
                            l_l_Down_0_0.Position = UDim2.new(1, -l_l_Down_0_0.AbsoluteSize.X, 0.5, -(l_l_Down_0_0.AbsoluteSize.X / 2));
                        end;
                        l_l_dSelected_0_0.Size = UDim2.new(1, -l_l_Down_0_0.AbsoluteSize.X, 1, 0);
                        if l_l_Options_0_0 and #l_l_Options_0_0 <= 6 then
                            l_l_Menu_1_0.Size = UDim2.fromOffset(v134.AbsoluteSize.X, #l_l_Options_0_0 * 30);
                            return;
                        else
                            l_l_Menu_1_0.Size = UDim2.fromOffset(v134.AbsoluteSize.X, 180);
                            v206:ResizeCanvas(false, true);
                        end;
                    end;
                    return;
                end;
            end);
            l_dSelected_0.ZIndex = v134.ZIndex;
            l_Down_0.ZIndex = v134.ZIndex;
            if l_TextProperties_0 then
                for v212, v213 in pairs(l_TextProperties_0) do
                    l_dSelected_0[v212] = v213;
                end;
            end;
            if l_Options_0 then
                for v214, v215 in pairs(l_Options_0) do
                    local v216 = v206:Add("TextButton", {
                        Text = ("  %*"):format(v215), 
                        Size = UDim2.new(1, -10, 0, 30), 
                        Position = UDim2.new(0, 5, 0, 30 * (v214 - 1)), 
                        ZIndex = l_Menu_1.ZIndex, 
                        BackgroundTransparency = 1, 
                        OnClick = function() --[[ Line: 749 ]] --[[ Name: OnClick ]]
                            -- upvalues: l_dSelected_0 (copy), v215 (copy), v204 (copy), v134 (copy), l_Menu_1 (copy)
                            l_dSelected_0.Text = v215;
                            v204(v215, v134);
                            l_Menu_1.Visible = false;
                        end
                    });
                    if l_TextProperties_0 then
                        for v217, v218 in pairs(l_TextProperties_0) do
                            v216[v217] = v218;
                        end;
                    end;
                end;
                if v203 then
                    l_dSelected_0.Text = v203;
                else
                    l_dSelected_0.Text = "No Selection";
                end;
                local l_l_Menu_1_1 = l_Menu_1 --[[ copy: 7 -> 31 ]];
                local function v220() --[[ Line: 769 ]] --[[ Name: showMenu ]]
                    -- upvalues: l_l_Menu_1_1 (copy), v134 (copy)
                    l_l_Menu_1_1.Position = UDim2.fromOffset(v134.AbsolutePosition.X, v134.AbsolutePosition.Y + v134.AbsoluteSize.Y);
                    l_l_Menu_1_1.Visible = not l_l_Menu_1_1.Visible;
                end;
                l_dSelected_0.MouseButton1Down:Connect(v220);
                l_Down_0.MouseButton1Down:Connect(v220);
            end;
        end;
        if v133 == "TabFrame" then
            local v221 = {};
            local v222 = v9("ScrollingFrame", nil, v134.Buttons);
            local l_Frames_0 = v134.Frames;
            local v224 = 0;
            local _ = v132.ButtonSize or 60;
            v134.BackgroundTransparency = v132.BackgroundTransparency or 1;
            v222.ZIndex = v132.ZIndex or v134.ZIndex;
            l_Frames_0.ZIndex = v222.ZIndex;
            v134:SetSpecial("GetTab", function(_, v227) --[[ Line: 790 ]]
                -- upvalues: l_Frames_0 (copy)
                return l_Frames_0:FindFirstChild(v227);
            end);
            local l_v221_0 = v221 --[[ copy: 7 -> 26 ]];
            do
                local l_v224_0 = v224;
                v134:SetSpecial("NewTab", function(_, v231, v232) --[[ Line: 794 ]]
                    -- upvalues: v16 (ref), v222 (copy), v9 (ref), v1 (ref), l_v221_0 (copy), v24 (ref), l_Frames_0 (copy), l_v224_0 (ref)
                    local v233 = v232 or {};
                    local v234 = v16(v222);
                    local l_TextSize_1 = service.TextService:GetTextSize(v233.Text or v231, 16, "SourceSans", v222.AbsoluteSize);
                    local _ = v233.TextTransparency;
                    local v237 = false;
                    local v238 = v9("ScrollingFrame", {
                        Name = v231, 
                        Size = UDim2.fromScale(1, 1), 
                        Position = UDim2.new(), 
                        BorderSizePixel = 0, 
                        BackgroundTransparency = v233.FrameTransparency or v233.Transparency, 
                        BackgroundColor3 = v233.Color or v1, 
                        ZIndex = v222.ZIndex, 
                        Visible = false
                    });
                    local v239 = v9("TextButton", {
                        Name = v231, 
                        Text = v233.Text or v231, 
                        Size = UDim2.new(0, l_TextSize_1.X + 20, 1, 0), 
                        ZIndex = v222.ZIndex, 
                        Position = UDim2.new(0, v234.X.Offset > 0 and v234.X.Offset + 5 or 0, 0, 0), 
                        TextColor3 = v233.TextColor, 
                        BackgroundTransparency = 0.7, 
                        TextTransparency = v233.TextTransparency, 
                        BackgroundColor3 = v233.Color or v1, 
                        BorderSizePixel = 0
                    });
                    v238:SetSpecial("FocusTab", function() --[[ Line: 826 ]]
                        -- upvalues: l_v221_0 (ref), v24 (ref), l_Frames_0 (ref), v239 (copy), v233 (copy), v238 (copy)
                        for _, v241 in ipairs(l_v221_0) do
                            if v24(v241) then
                                v241.BackgroundTransparency = v241:IsDisabled() and 0.9 or 0.7;
                                v241.TextTransparency = v241:IsDisabled() and 0.9 or 0.7;
                            end;
                        end;
                        for _, v243 in ipairs(l_Frames_0:GetChildren()) do
                            if v24(v243) then
                                v243.Visible = false;
                            end;
                        end;
                        v239.BackgroundTransparency = v233.Transparency or 0;
                        v239.TextTransparency = v233.TextTransparency or 0;
                        v238.Visible = true;
                        if v233.OnFocus then
                            v233.OnFocus(true);
                        end;
                    end);
                    if l_v224_0 == 0 then
                        v238.Visible = true;
                        v239.BackgroundTransparency = v233.Transparency or 0;
                    end;
                    v239.MouseButton1Down:Connect(function() --[[ Line: 854 ]]
                        -- upvalues: v237 (ref), v238 (copy)
                        if not v237 then
                            v238:FocusTab();
                        end;
                    end);
                    v239.Parent = v222;
                    v238.Parent = l_Frames_0;
                    v222:ResizeCanvas(true, false);
                    v238:SetSpecial("Disable", function() --[[ Line: 864 ]]
                        -- upvalues: v237 (ref), v239 (copy)
                        v237 = true;
                        v239.BackgroundTransparency = 0.9;
                        v239.TextTransparency = 0.9;
                    end);
                    v238:SetSpecial("Enable", function() --[[ Line: 870 ]]
                        -- upvalues: v237 (ref), v239 (copy), v233 (copy)
                        v237 = false;
                        v239.BackgroundTransparency = 0.7;
                        v239.TextTransparency = v233.TextTransparency or 0;
                    end);
                    v239:SetSpecial("IsDisabled", function() --[[ Line: 876 ]]
                        -- upvalues: v237 (ref)
                        return v237;
                    end);
                    table.insert(l_v221_0, v239);
                    l_v224_0 = l_v224_0 + 1;
                    return v238, v239;
                end);
            end;
        end;
        if v133 == "ScrollingFrame" then
            local v244 = false;
            if not v132.ScrollBarThickness then
                v132.ScrollBarThickness = 4;
            end;
            do
                local l_v244_0 = v244;
                v134:SetSpecial("GenerateList", function(v246, v247, v248, v249) --[[ Line: 894 ]]
                    -- upvalues: l_v244_0 (ref), v134 (copy), v132 (copy), v9 (ref), l_CheckProperty_0 (ref)
                    local v250 = v247 or v246;
                    local v251 = {};
                    local v252 = v248 or {};
                    l_v244_0 = v251;
                    v134:ClearAllChildren();
                    v134.AutomaticCanvasSize = "Y";
                    local v253 = service.New("UIListLayout", {
                        Parent = v134, 
                        Name = "LayoutOrder", 
                        FillDirection = v132.Layout_FillDirection or "Vertical", 
                        VerticalAlignment = v132.Layout_VerticalAlignment or "Top", 
                        HorizontalAlignment = v132.Layout_HorizontalAlignment or "Left"
                    });
                    local v254 = 0;
                    for v255, v256 in pairs(v250) do
                        local l_v256_0 = v256;
                        local v258 = nil;
                        local v259 = nil;
                        local v260 = nil;
                        if type(v256) == "table" then
                            l_v256_0 = v256.Text;
                            v258 = v256.Desc;
                            v259 = v256.Color;
                            if v256.RichTextAllowed or v252.RichTextAllowed then
                                v260 = true;
                            end;
                        end;
                        local v261 = nil;
                        v261 = if not not v256.TextSelectable or v252.TextSelectable then v9("TextBox", {
                            Text = (" %*"):format(l_v256_0), 
                            ToolTip = v258, 
                            AutomaticSize = if not v252.ySize then Enum.AutomaticSize.Y else nil, 
                            Size = UDim2.new(1, -5, 0, v252.ySize or 20), 
                            Visible = true, 
                            BackgroundTransparency = 1, 
                            Font = "Arial", 
                            TextSize = 14, 
                            TextStrokeTransparency = 0.8, 
                            TextXAlignment = "Left", 
                            Position = UDim2.new(0, 0, 0, v254 * (v252.ySize or 20)), 
                            RichText = v260 or false, 
                            TextEditable = false, 
                            ClearTextOnFocus = false
                        }) else v9("TextLabel", {
                            Text = (" %*"):format(l_v256_0), 
                            ToolTip = v258, 
                            AutomaticSize = if not v252.ySize then Enum.AutomaticSize.Y else nil, 
                            Size = UDim2.new(1, -5, 0, v252.ySize or 20), 
                            Visible = true, 
                            BackgroundTransparency = 1, 
                            Font = "Arial", 
                            TextSize = 14, 
                            TextStrokeTransparency = 0.8, 
                            TextXAlignment = "Left", 
                            Position = UDim2.new(0, 0, 0, v254 * (v252.ySize or 20)), 
                            RichText = v260 or false
                        });
                        if v259 then
                            v261.TextColor3 = v259;
                        end;
                        if v248 then
                            for v262, v263 in pairs(v252) do
                                if l_CheckProperty_0(v261, v262) then
                                    v261[v262] = v263;
                                end;
                            end;
                        end;
                        if l_v244_0 == v251 then
                            v261.Parent = v134;
                            v254 = v254 + 1;
                            if v132.Delay then
                                if type(v132.Delay) == "number" then
                                    wait(v132.Delay);
                                elseif v255 % 100 == 0 then
                                    wait(0.1);
                                end;
                            end;
                        else
                            v261:Destroy();
                            break;
                        end;
                    end;
                    if v249 then
                        v134.CanvasPosition = Vector2.new(0, v253.AbsoluteContentSize.Y);
                    end;
                    l_v244_0 = nil;
                end);
                v134:SetSpecial("ResizeCanvas", function(_, v265, v266, v267, v268, _, _, v271) --[[ Line: 1002 ]]
                    -- upvalues: v132 (copy), v134 (copy)
                    local v272 = v132.xPadding or 5;
                    local v273 = v132.yPadding or 5;
                    local v274 = 0;
                    local v275 = 0;
                    if not v265 and not v266 then
                        v265 = false;
                        v266 = true;
                    end;
                    for v276, v277 in ipairs(v134:GetChildren()) do
                        if v277:IsA("GuiObject") then
                            if v266 then
                                v277.Size = UDim2.new(v277.Size.X.Scale, v277.Size.X.Offset, 0, v277.AbsoluteSize.Y);
                                v277.Position = UDim2.new(v277.Position.X.Scale, v277.Position.X.Offset, 0, v277.AbsolutePosition.Y - v134.AbsolutePosition.Y);
                            end;
                            if v265 then
                                v277.Size = UDim2.new(0, v277.AbsoluteSize.X, v277.Size.Y.Scale, v277.Size.Y.Offset);
                                v277.Position = UDim2.new(0, v277.AbsolutePosition.X - v134.AbsolutePosition.X, v277.Position.Y.Scale, v277.Position.Y.Offset);
                            end;
                            local v278 = v277.Position.Y.Offset + v277.Size.Y.Offset;
                            local v279 = v277.Position.X.Offset + v277.Size.X.Offset;
                            v274 = math.max(v274, v278);
                            v275 = math.max(v275, v279);
                            if v271 and v276 % v271 == 0 then
                                wait(0.016666666666666666);
                            end;
                        end;
                    end;
                    if v266 then
                        v134.CanvasSize = UDim2.new(v134.CanvasSize.X.Scale, v134.CanvasSize.X.Offset, 0, v274 + v273);
                    end;
                    if v265 then
                        v134.CanvasSize = UDim2.new(0, v275 + v272, v134.CanvasSize.Y.Scale, v134.CanvasSize.Y.Offset);
                    end;
                    if v267 then
                        v134.CanvasPosition = Vector2.new(v275 + v272 - v134.AbsoluteSize.X, v134.CanvasPosition.Y);
                    end;
                    if v268 then
                        v134.CanvasPosition = Vector2.new(v134.CanvasPosition.X, v274 + v273 - v134.AbsoluteSize.Y);
                    end;
                end);
                if v132.List then
                    v134:GenerateList(v132.List);
                    v132.List = nil;
                end;
            end;
        end;
        v66(v134, v132.Content or v132.Children);
        v132.Children = nil;
        v132.Content = nil;
        for v280, v281 in pairs(v132) do
            if l_CheckProperty_0(v134, v280) then
                v134[v280] = v281;
            end;
        end;
        v134.Parent = v135;
        return v22(v134, v132, v133), v132;
    end;
    v22 = function(v282, v283, _) --[[ Line: 1067 ]] --[[ Name: apiIfy ]]
        -- upvalues: v9 (ref), v22 (ref)
        local v285 = service.Wrap(v282);
        v282:SetSpecial("Object", v282);
        v282:SetSpecial("SetPosition", function(_, v287) --[[ Line: 1070 ]]
            -- upvalues: v282 (copy)
            v282.Position = v287;
        end);
        v282:SetSpecial("SetSize", function(_, v289) --[[ Line: 1071 ]]
            -- upvalues: v282 (copy)
            v282.Size = v289;
        end);
        v282:SetSpecial("Add", function(v290, v291, v292) --[[ Line: 1072 ]]
            -- upvalues: v9 (ref), v282 (copy), v22 (ref)
            if not v292 then
                v292 = v291;
                v291 = v290;
            end;
            local v293 = v9(v291, v292);
            v293.Parent = v282;
            return v22(v293, v292, v291);
        end);
        v282:SetSpecial("Copy", function(_, v295, v296) --[[ Line: 1079 ]]
            -- upvalues: v283 (copy), v9 (ref), v282 (copy), v22 (ref)
            local v297 = {};
            local v298 = nil;
            for v299, v300 in pairs(v283) do
                v297[v299] = v300;
            end;
            for v301, v302 in pairs(v296) do
                v297[v301] = v302;
            end;
            v298 = v9(v295 or v283.Class or v282.ClassName, v297);
            v298.Parent = v296.Parent or v282.Parent;
            return v22(v298, v283, v295);
        end);
        return v285;
    end;
    v12 = function() --[[ Line: 1099 ]] --[[ Name: doClose ]]
        -- upvalues: v59 (ref), l_OnClose_0 (copy), l_gTable_0 (copy)
        if not v59 then
            v59 = true;
            if l_OnClose_0 then
                local _, l_result_0 = pcall(l_OnClose_0);
                if l_result_0 then
                    warn(l_result_0);
                end;
            end;
            l_gTable_0:Destroy();
        end;
    end;
    v14 = function() --[[ Line: 1114 ]] --[[ Name: isVisible ]]
        -- upvalues: l_Main_0 (copy)
        return l_Main_0.Visible;
    end;
    local l_TextLabel_0 = l_Hide_0:FindFirstChild("TextLabel");
    v11 = function(v306) --[[ Line: 1119 ]] --[[ Name: doHide ]]
        -- upvalues: l_Hide_0 (copy), l_Main_0 (copy), v13 (ref), l_Drag_0 (copy), l_TextLabel_0 (copy), l_gTable_0 (copy), l_OnMinimize_0 (copy), l_Walls_0 (copy), v17 (ref)
        local l_LineHeight_0 = l_Hide_0.LineHeight;
        if v306 or v306 == nil and l_Main_0.Visible then
            v13 = l_Drag_0.Size;
            l_Main_0.Visible = false;
            l_Drag_0.BackgroundTransparency = l_Main_0.BackgroundTransparency;
            l_Drag_0.BackgroundColor3 = l_Main_0.BackgroundColor3;
            l_Drag_0.Size = UDim2.new(0, 200, l_Drag_0.Size.Y.Scale, l_Drag_0.Size.Y.Offset);
            if l_TextLabel_0 then
                l_TextLabel_0.Text = "+";
            else
                l_Hide_0.Text = "+";
            end;
            l_Hide_0.LineHeight = l_LineHeight_0;
            l_gTable_0.Minimized = true;
        elseif v306 == false or v306 == nil and not l_Main_0.Visible then
            l_Main_0.Visible = true;
            l_Drag_0.BackgroundTransparency = 1;
            l_Drag_0.Size = v13 or l_Drag_0.Size;
            if l_TextLabel_0 then
                l_TextLabel_0.Text = "-";
            else
                l_Hide_0.Text = "-";
            end;
            l_Hide_0.LineHeight = l_LineHeight_0;
            l_gTable_0.Minimized = false;
        end;
        if l_OnMinimize_0 then
            l_OnMinimize_0(l_Main_0.Visible);
        end;
        if l_Walls_0 then
            v17();
        end;
    end;
    v20 = function(v308, v309, v310) --[[ Line: 1160 ]] --[[ Name: isInFrame ]]
        if v310.AbsolutePosition.X < v308 and v308 < v310.AbsolutePosition.X + v310.AbsoluteSize.X and v310.AbsolutePosition.Y < v309 and v309 < v310.AbsolutePosition.Y + v310.AbsoluteSize.Y then
            return true;
        else
            return false;
        end;
    end;
    v17 = function() --[[ Line: 1168 ]] --[[ Name: wallPosition ]]
        -- upvalues: l_gTable_0 (copy), l_Drag_0 (copy), l_Object_0 (copy), l_Main_0 (copy)
        if l_gTable_0.Active then
            local l_X_0 = l_Drag_0.AbsolutePosition.X;
            local l_Y_0 = l_Drag_0.AbsolutePosition.Y;
            local l_X_1 = l_Drag_0.AbsoluteSize.X;
            local l_X_2 = l_Object_0.AbsoluteSize.X;
            local l_Y_1 = l_Object_0.AbsoluteSize.Y;
            local v316 = l_Main_0.Visible and l_Main_0.AbsoluteSize.Y or l_Drag_0.AbsoluteSize.Y;
            if l_X_0 < 0 then
                l_Drag_0.Position = UDim2.new(0, 0, l_Drag_0.Position.Y.Scale, l_Drag_0.Position.Y.Offset);
            end;
            if l_Y_0 < 0 then
                l_Drag_0.Position = UDim2.new(l_Drag_0.Position.X.Scale, l_Drag_0.Position.X.Offset, 0, 0);
            end;
            if l_X_2 < l_X_0 + l_X_1 then
                l_Drag_0.Position = UDim2.new(0, l_Object_0.AbsoluteSize.X - l_Drag_0.AbsoluteSize.X, l_Drag_0.Position.Y.Scale, l_Drag_0.Position.Y.Offset);
            end;
            if l_Y_1 < l_Y_0 + v316 then
                l_Drag_0.Position = UDim2.new(l_Drag_0.Position.X.Scale, l_Drag_0.Position.X.Offset, 0, l_Object_0.AbsoluteSize.Y - v316);
            end;
        end;
    end;
    v21 = function(v317) --[[ Line: 1192 ]] --[[ Name: setSize ]]
        -- upvalues: l_Drag_0 (copy), l_Main_0 (copy)
        if v317 and type(v317) == "table" then
            if v317[1] < 50 then
                v317[1] = 50;
            end;
            if v317[2] < 50 then
                v317[2] = 50;
            end;
            l_Drag_0.Size = UDim2.new(0, v317[1], l_Drag_0.Size.Y.Scale, l_Drag_0.Size.Y.Offset);
            l_Main_0.Size = UDim2.new(1, 0, 0, v317[2]);
        end;
    end;
    v18 = function(v318) --[[ Line: 1202 ]] --[[ Name: setPosition ]]
        -- upvalues: l_Drag_0 (copy), l_Size_0 (copy), l_Main_0 (copy)
        if v318 and typeof(v318) == "UDim2" then
            l_Drag_0.Position = v318;
            return;
        elseif v318 and type(v318) == "table" then
            l_Drag_0.Position = UDim2.new(0, v318[1], 0, v318[2]);
            return;
        else
            if l_Size_0 and not v318 then
                l_Drag_0.Position = UDim2.new(0.5, -l_Drag_0.AbsoluteSize.X / 2, 0.5, -l_Main_0.AbsoluteSize.Y / 2);
            end;
            return;
        end;
    end;
    if l_Name_0 then
        l_gTable_0.Name = l_Name_0;
        if v25.AllowMultiple ~= nil and v25.AllowMultiple == false then
            local v319, _ = client.UI.Get(l_Name_0, l_Object_0, true);
            if v319 then
                v12();
                return nil;
            end;
        end;
    end;
    if l_Size_0 then
        v21(l_Size_0);
    end;
    if l_Position_0 then
        v18(l_Position_0);
    end;
    if l_Title_0 then
        l_Title_1.Text = l_Title_0;
    end;
    if l_CanKeepAlive_0 or not l_ResetOnSpawn_0 then
        l_gTable_0.CanKeepAlive = true;
        l_Object_0.ResetOnSpawn = false;
    elseif l_ResetOnSpawn_0 then
        l_gTable_0.CanKeepAlive = false;
        l_Object_0.ResetOnSpawn = true;
    end;
    if l_Icon_0 then

    end;
    if l_CanvasSize_0 then
        l_ScrollingFrame_0.CanvasSize = l_CanvasSize_0;
    end;
    if l_NoClose_0 then
        l_Close_0.Visible = false;
        l_Refresh_0.Position = l_Hide_0.Position;
        l_Hide_0.Position = l_Close_0.Position;
    end;
    if l_NoHide_0 then
        l_Hide_0.Visible = false;
        l_Refresh_0.Position = l_Hide_0.Position;
    end;
    if l_Walls_0 then
        l_Drag_0.DragStopped:Connect(function() --[[ Line: 1267 ]]
            -- upvalues: v17 (ref)
            v17();
        end);
    end;
    if l_OnRefresh_0 then
        local v321 = false;
        v15 = function() --[[ Line: 1274 ]] --[[ Name: DoRefresh ]]
            -- upvalues: v61 (ref), l_gTable_0 (copy), l_Spinner_0 (copy), l_OnRefresh_0 (copy)
            if not v61 then
                local v322 = false;
                v61 = true;
                do
                    local l_v322_0 = v322;
                    spawn(function() --[[ Line: 1279 ]]
                        -- upvalues: l_gTable_0 (ref), l_v322_0 (ref), l_Spinner_0 (ref)
                        while l_gTable_0.Active and not l_v322_0 do
                            for v324 = 0, 180, 10 do
                                l_Spinner_0.Rotation = -v324;
                                wait(0.016666666666666666);
                            end;
                        end;
                    end);
                    l_OnRefresh_0();
                    wait(1);
                    l_v322_0 = true;
                    v61 = false;
                end;
            end;
        end;
        do
            local l_v321_0 = v321;
            l_Refresh_0.MouseButton1Down:Connect(function() --[[ Line: 1295 ]]
                -- upvalues: l_v321_0 (ref), v15 (ref)
                if not l_v321_0 then
                    l_v321_0 = true;
                    v15();
                    l_v321_0 = false;
                end;
            end);
            l_Title_1.Size = UDim2.new(1, -130, l_Title_1.Size.Y.Scale, l_Title_1.Size.Y.Offset);
        end;
    else
        l_Refresh_0.Visible = false;
    end;
    if l_IconClicked_0 then
        l_Icon_2.MouseButton1Down(function() --[[ Line: 1309 ]]
            -- upvalues: l_IconClicked_0 (copy), v25 (copy), l_Object_0 (copy), l_Icon_2 (copy)
            l_IconClicked_0(v25, l_Object_0, l_Icon_2);
        end);
    end;
    if l_Menu_0 then
        v25.Menu.Text = "";
        v25.Menu.Parent = l_Main_0;
        v25.Menu.Size = UDim2.new(1, -10, 0, 25);
        v25.Menu.Position = UDim2.new(0, 5, 0, 25);
        l_ScrollingFrame_0.Size = UDim2.new(1, -10, 1, -55);
        l_ScrollingFrame_0.Position = UDim2.new(0, 5, 0, 50);
        v25.Menu.BackgroundColor3 = Color3.fromRGB(216, 216, 216);
        v25.Menu.BorderSizePixel = 0;
        v9("TextLabel", v25.Menu);
    end;
    if not v52 then
        local l_X_3 = l_Drag_0.AbsolutePosition.X;
        local l_Y_2 = l_Drag_0.AbsolutePosition.Y;
        local l_X_4 = l_Drag_0.AbsoluteSize.X;
        local l_Y_3 = l_Drag_0.AbsoluteSize.Y;
        local _ = client.Variables;
        local v331 = nil;
        local v332 = nil;
        local v333 = nil;
        do
            local l_l_X_3_0, l_l_Y_2_0, l_l_X_4_0, l_l_Y_3_0, l_v331_0, l_v332_0, l_v333_0 = l_X_3, l_Y_2, l_X_4, l_Y_3, v331, v332, v333;
            local function _(v341) --[[ Line: 1336 ]] --[[ Name: readify ]]
                -- upvalues: l_v333_0 (ref)
                v341.MouseEnter:Connect(function() --[[ Line: 1337 ]]
                    -- upvalues: l_v333_0 (ref), v341 (copy)
                    l_v333_0 = v341;
                end);
                v341.MouseLeave:Connect(function() --[[ Line: 1341 ]]
                    -- upvalues: l_v333_0 (ref), v341 (copy)
                    if l_v333_0 == v341 then
                        l_v333_0 = nil;
                    end;
                end);
            end;
            v19 = function(v343, v344) --[[ Line: 1361 ]] --[[ Name: checkMouse ]]
                -- upvalues: l_gTable_0 (copy), l_Main_0 (copy), v20 (ref), l_Drag_0 (copy), l_ScrollingFrame_0 (copy), l_v332_0 (ref), l_v331_0 (ref), l_TopRight_0 (copy), v8 (ref), l_TopLeft_0 (copy), l_RightCorner_0 (copy), l_LeftCorner_0 (copy), l_RightSide_0 (copy), l_LeftSide_0 (copy), l_Bottom_0 (copy), l_Top_0 (copy), l_l_LocalPlayer_0_Mouse_0 (copy), l_Icon_1 (ref)
                if l_gTable_0.Active and l_Main_0.Visible then
                    if v20(v343, v344, l_Drag_0) or v20(v343, v344, l_ScrollingFrame_0) then
                        l_v332_0 = nil;
                        l_v331_0 = nil;
                    elseif v20(v343, v344, l_TopRight_0) then
                        l_v332_0 = "TopRight";
                        l_v331_0 = v8.TopRight;
                    elseif v20(v343, v344, l_TopLeft_0) then
                        l_v332_0 = "TopLeft";
                        l_v331_0 = v8.TopLeft;
                    elseif v20(v343, v344, l_RightCorner_0) then
                        l_v332_0 = "RightCorner";
                        l_v331_0 = v8.RightCorner;
                    elseif v20(v343, v344, l_LeftCorner_0) then
                        l_v332_0 = "LeftCorner";
                        l_v331_0 = v8.LeftCorner;
                    elseif v20(v343, v344, l_RightSide_0) then
                        l_v332_0 = "RightSide";
                        l_v331_0 = v8.Horizontal;
                    elseif v20(v343, v344, l_LeftSide_0) then
                        l_v332_0 = "LeftSide";
                        l_v331_0 = v8.Horizontal;
                    elseif v20(v343, v344, l_Bottom_0) then
                        l_v332_0 = "Bottom";
                        l_v331_0 = v8.Vertical;
                    elseif v20(v343, v344, l_Top_0) then
                        l_v332_0 = "Top";
                        l_v331_0 = v8.Vertical;
                    else
                        l_v332_0 = nil;
                        l_v331_0 = nil;
                    end;
                else
                    l_v332_0 = nil;
                end;
                if not client.Variables.MouseLockedBy or client.Variables.MouseLockedBy == l_gTable_0 then
                    if l_v332_0 and l_v331_0 then
                        l_l_LocalPlayer_0_Mouse_0.Icon = l_v331_0;
                        client.Variables.MouseLockedBy = l_gTable_0;
                        return;
                    elseif client.Variables.MouseLockedBy == l_gTable_0 then
                        l_l_LocalPlayer_0_Mouse_0.Icon = l_Icon_1;
                        client.Variables.MouseLockedBy = nil;
                    end;
                end;
            end;
            local function v347(v345, v346) --[[ Line: 1409 ]] --[[ Name: inputStart ]]
                -- upvalues: v19 (ref), l_gTable_0 (copy), l_v332_0 (ref), v60 (ref), v20 (ref), l_ScrollingFrame_0 (copy), l_Drag_0 (copy), l_l_X_3_0 (ref), l_l_Y_2_0 (ref), l_l_X_4_0 (ref), l_l_Y_3_0 (ref), l_Main_0 (copy)
                v19(v345, v346);
                if l_gTable_0.Active and l_v332_0 and not v60 and not v20(v345, v346, l_ScrollingFrame_0) and not v20(v345, v346, l_Drag_0) then
                    v60 = l_v332_0;
                    l_l_X_3_0 = l_Drag_0.AbsolutePosition.X;
                    l_l_Y_2_0 = l_Drag_0.AbsolutePosition.Y;
                    l_l_X_4_0 = l_Drag_0.AbsoluteSize.X;
                    l_l_Y_3_0 = l_Main_0.AbsoluteSize.Y;
                end;
            end;
            local function v348() --[[ Line: 1420 ]] --[[ Name: inputEnd ]]
                -- upvalues: l_gTable_0 (copy), v60 (ref), l_OnResize_0 (copy), l_Drag_0 (copy), l_Main_0 (copy), l_l_LocalPlayer_0_Mouse_0 (copy), l_Icon_1 (ref)
                if l_gTable_0.Active then
                    if v60 and l_OnResize_0 then
                        l_OnResize_0(UDim2.new(l_Drag_0.Size.X.Scale, l_Drag_0.Size.X.Offset, l_Main_0.Size.Y.Scale, l_Main_0.Size.Y.Offset));
                    end;
                    v60 = nil;
                    l_l_LocalPlayer_0_Mouse_0.Icon = l_Icon_1;
                end;
            end;
            local function v358(v349, v350) --[[ Line: 1435 ]] --[[ Name: inputMoved ]]
                -- upvalues: l_gTable_0 (copy), l_l_LocalPlayer_0_Mouse_0 (copy), v8 (ref), l_Icon_1 (ref), v60 (ref), l_Drag_0 (copy), l_l_X_4_0 (ref), l_l_Y_3_0 (ref), l_l_X_3_0 (ref), l_l_Y_2_0 (ref), v56 (copy), v57 (copy), l_Main_0 (copy), l_Title_1 (copy), v19 (ref)
                if l_gTable_0.Active then
                    if l_l_LocalPlayer_0_Mouse_0.Icon ~= v8.TopRight and l_l_LocalPlayer_0_Mouse_0.Icon ~= v8.TopLeft and l_l_LocalPlayer_0_Mouse_0.Icon ~= v8.RightCorner and l_l_LocalPlayer_0_Mouse_0.Icon ~= v8.LeftCorner and l_l_LocalPlayer_0_Mouse_0.Icon ~= v8.Horizontal and l_l_LocalPlayer_0_Mouse_0.Icon ~= v8.Vertical then
                        l_Icon_1 = l_l_LocalPlayer_0_Mouse_0.Icon;
                    end;
                    if v60 then
                        local v351 = false;
                        local v352 = false;
                        local l_Position_1 = l_Drag_0.Position;
                        local l_v349_0 = v349;
                        local l_v350_0 = v350;
                        local l_l_l_X_4_0_0 = l_l_X_4_0;
                        local l_l_l_Y_3_0_0 = l_l_Y_3_0;
                        if v60 == "TopRight" then
                            l_l_l_X_4_0_0 = l_v349_0 - l_l_X_3_0 + 3;
                            l_l_l_Y_3_0_0 = l_l_Y_2_0 - l_v350_0 + l_l_Y_3_0 - 1;
                            v352 = true;
                        elseif v60 == "TopLeft" then
                            l_l_l_X_4_0_0 = l_l_X_3_0 - l_v349_0 + l_l_X_4_0 - 1;
                            l_l_l_Y_3_0_0 = l_l_Y_2_0 - l_v350_0 + l_l_Y_3_0 - 1;
                            v352 = true;
                            v351 = true;
                        elseif v60 == "RightCorner" then
                            l_l_l_X_4_0_0 = l_v349_0 - l_l_X_3_0 + 3;
                            l_l_l_Y_3_0_0 = l_v350_0 - l_l_Y_2_0 + 3;
                        elseif v60 == "LeftCorner" then
                            l_l_l_X_4_0_0 = l_l_X_3_0 - l_v349_0 + l_l_X_4_0 + 3;
                            l_l_l_Y_3_0_0 = l_v350_0 - l_l_Y_2_0 + 3;
                            v351 = true;
                        elseif v60 == "LeftSide" then
                            l_l_l_X_4_0_0 = l_l_X_3_0 - l_v349_0 + l_l_X_4_0 + 3;
                            l_l_l_Y_3_0_0 = l_l_Y_3_0;
                            v351 = true;
                        elseif v60 == "RightSide" then
                            l_l_l_X_4_0_0 = l_v349_0 - l_l_X_3_0 + 3;
                            l_l_l_Y_3_0_0 = l_l_Y_3_0;
                        elseif v60 == "Bottom" then
                            l_l_l_X_4_0_0 = l_l_X_4_0;
                            l_l_l_Y_3_0_0 = l_v350_0 - l_l_Y_2_0 + 3;
                        elseif v60 == "Top" then
                            l_l_l_X_4_0_0 = l_l_X_4_0;
                            l_l_l_Y_3_0_0 = l_l_Y_2_0 - l_v350_0 + l_l_Y_3_0 - 1;
                            v352 = true;
                        end;
                        if l_l_l_X_4_0_0 < v56[1] then
                            l_l_l_X_4_0_0 = v56[1];
                        end;
                        if l_l_l_Y_3_0_0 < v56[2] then
                            l_l_l_Y_3_0_0 = v56[2];
                        end;
                        if v57[1] < l_l_l_X_4_0_0 then
                            l_l_l_X_4_0_0 = v57[1];
                        end;
                        if v57[2] < l_l_l_Y_3_0_0 then
                            l_l_l_Y_3_0_0 = v57[2];
                        end;
                        if v351 then
                            l_Position_1 = UDim2.new(0, l_l_X_3_0 + l_l_X_4_0 - l_l_l_X_4_0_0, l_Position_1.Y.Scale, l_Position_1.Y.Offset);
                        end;
                        if v352 then
                            l_Position_1 = UDim2.new(l_Position_1.X.Scale, l_Position_1.X.Offset, 0, l_l_Y_2_0 + l_l_Y_3_0 - l_l_l_Y_3_0_0);
                        end;
                        l_Drag_0.Position = l_Position_1;
                        l_Drag_0.Size = UDim2.new(0, l_l_l_X_4_0_0, l_Drag_0.Size.Y.Scale, l_Drag_0.Size.Y.Offset);
                        l_Main_0.Size = UDim2.new(l_Main_0.Size.X.Scale, l_Main_0.Size.X.Offset, 0, l_l_l_Y_3_0_0);
                        if not l_Title_1.TextFits then
                            l_Title_1.Visible = false;
                            return;
                        else
                            l_Title_1.Visible = true;
                            return;
                        end;
                    else
                        v19(v349, v350);
                    end;
                end;
            end;
            l_BindEvent_0(l_UserInputService_0.InputBegan, function(v359, v360) --[[ Line: 1510 ]]
                -- upvalues: v347 (copy)
                if not v360 and (v359.UserInputType == Enum.UserInputType.MouseButton1 or v359.UserInputType == Enum.UserInputType.Touch) then
                    local l_Position_2 = v359.Position;
                    v347(l_Position_2.X, l_Position_2.Y);
                end;
            end);
            l_BindEvent_0(l_UserInputService_0.InputChanged, function(v362, _) --[[ Line: 1517 ]]
                -- upvalues: v358 (copy)
                if v362.UserInputType == Enum.UserInputType.MouseMovement or v362.UserInputType == Enum.UserInputType.Touch then
                    local l_Position_3 = v362.Position;
                    v358(l_Position_3.X, l_Position_3.Y);
                end;
            end);
            l_BindEvent_0(l_UserInputService_0.InputEnded, function(v365, _) --[[ Line: 1524 ]]
                -- upvalues: v348 (copy)
                if v365.UserInputType == Enum.UserInputType.MouseButton1 or v365.UserInputType == Enum.UserInputType.Touch then
                    v348();
                end;
            end);
        end;
    else
        l_LeftResizeIcon_0.Visible = false;
        l_RightResizeIcon_0.Visible = false;
    end;
    l_Close_0.MouseButton1Down:Connect(v12);
    l_Hide_0.MouseButton1Down:Connect(function() --[[ Line: 1561 ]]
        -- upvalues: v11 (ref)
        v11();
    end);
    l_gTable_0.CustomDestroy = function() --[[ Line: 1562 ]]
        -- upvalues: l_gTable_0 (copy), l_l_LocalPlayer_0_Mouse_0 (copy), l_Icon_1 (ref), v59 (ref), l_OnClose_0 (copy), l_Object_0 (copy)
        if client.Variables.MouseLockedBy == l_gTable_0 then
            l_l_LocalPlayer_0_Mouse_0.Icon = l_Icon_1;
            client.Variables.MouseLockedBy = nil;
        end;
        if not v59 then
            v59 = true;
            if l_OnClose_0 then
                l_OnClose_0();
            end;
        end;
        service.UnWrap(l_Object_0):Destroy();
    end;
    for _, v368 in ipairs(l_Object_0:GetChildren()) do
        if v368.Name ~= "Desc" and v368.Name ~= "Drag" then
            v63[v368.Name] = v368;
            v368.Parent = nil;
        end;
    end;
    local v369 = Instance.new("BoolValue", l_Object_0);
    local v370 = false;
    local v371 = nil;
    local v372 = nil;
    v369.Name = "__ADONIS_WINDOW";
    l_BindEvent_0(l_Main_0.InputBegan, function(v373) --[[ Line: 1594 ]]
        -- upvalues: l_gTable_0 (copy), v67 (ref)
        if l_gTable_0.Active and (v373.UserInputType == Enum.UserInputType.MouseButton1 or v373.UserInputType == Enum.UserInputType.Touch) then
            v67();
        end;
    end);
    do
        local l_v370_0, l_v371_0, l_v372_0 = v370, v371, v372;
        l_BindEvent_0(l_Drag_0.InputBegan, function(v377) --[[ Line: 1600 ]]
            -- upvalues: l_gTable_0 (copy), l_v372_0 (ref), v67 (ref)
            if l_gTable_0.Active then
                l_v372_0 = true;
                if v377.UserInputType == Enum.UserInputType.MouseButton1 or v377.UserInputType == Enum.UserInputType.Touch then
                    v67();
                end;
            end;
        end);
        l_BindEvent_0(l_Drag_0.InputChanged, function(_) --[[ Line: 1610 ]]
            -- upvalues: l_gTable_0 (copy), l_v372_0 (ref)
            if l_gTable_0.Active then
                l_v372_0 = true;
            end;
        end);
        l_BindEvent_0(l_Drag_0.InputEnded, function(_) --[[ Line: 1616 ]]
            -- upvalues: l_v372_0 (ref)
            l_v372_0 = false;
        end);
        l_BindEvent_0(l_UserInputService_0.InputBegan, function(v380) --[[ Line: 1620 ]]
            -- upvalues: l_v372_0 (ref), l_Object_0 (copy), l_v370_0 (ref), v67 (ref), l_v371_0 (ref), l_Drag_0 (copy)
            if l_v372_0 and l_Object_0.DisplayOrder == 101 and not l_v370_0 and (v380.UserInputType == Enum.UserInputType.MouseButton1 or v380.UserInputType == Enum.UserInputType.Touch) then
                l_v370_0 = true;
                v67();
                l_v371_0 = Vector2.new(l_Drag_0.AbsolutePosition.X - v380.Position.X, l_Drag_0.AbsolutePosition.Y - v380.Position.Y);
            end;
        end);
        l_BindEvent_0(l_UserInputService_0.InputChanged, function(v381) --[[ Line: 1628 ]]
            -- upvalues: l_v370_0 (ref), l_Drag_0 (copy), l_v371_0 (ref)
            if l_v370_0 and (v381.UserInputType == Enum.UserInputType.MouseMovement or v381.UserInputType == Enum.UserInputType.Touch) then
                l_Drag_0.Position = UDim2.fromOffset(l_v371_0.X + v381.Position.X, l_v371_0.Y + v381.Position.Y);
            end;
        end);
        l_BindEvent_0(l_UserInputService_0.InputEnded, function(v382) --[[ Line: 1634 ]]
            -- upvalues: l_v370_0 (ref)
            if v382.UserInputType == Enum.UserInputType.MouseButton1 or v382.UserInputType == Enum.UserInputType.Touch then
                l_v370_0 = false;
            end;
        end);
    end;
    v369 = v22(l_ScrollingFrame_0, v25);
    v370 = v369:GetMetatable();
    v371 = v370.__newindex;
    v372 = v370.__index;
    v9("ScrollingFrame", nil, l_ScrollingFrame_0);
    v66(v369, v55);
    v369:SetSpecial("gTable", l_gTable_0);
    v369:SetSpecial("Window", l_Object_0);
    v369:SetSpecial("Main", l_Main_0);
    v369:SetSpecial("Title", l_Title_1);
    v369:SetSpecial("Dragger", l_Drag_0);
    v369:SetSpecial("Destroy", v12);
    v369:SetSpecial("Close", v12);
    v369:SetSpecial("Object", l_ScrollingFrame_0);
    v369:SetSpecial("Refresh", v15);
    v369:SetSpecial("AddTitleButton", function(v383, v384) --[[ Line: 1659 ]]
        -- upvalues: v65 (ref)
        if type(v383) == "table" and not v384 then
            v384 = v383;
        end;
        return v65(v384);
    end);
    v369:SetSpecial("Ready", function() --[[ Line: 1660 ]]
        -- upvalues: l_OnReady_0 (copy), l_gTable_0 (copy), v67 (ref)
        if l_OnReady_0 then
            l_OnReady_0();
        end;
        l_gTable_0.Ready();
        v67();
    end);
    v369:SetSpecial("BindEvent", function(_, ...) --[[ Line: 1661 ]]
        -- upvalues: l_BindEvent_0 (copy)
        return l_BindEvent_0(...);
    end);
    v369:SetSpecial("Hide", function(_, v387) --[[ Line: 1662 ]]
        -- upvalues: v11 (ref)
        v11(v387);
    end);
    v369:SetSpecial("SetTitle", function(_, v389) --[[ Line: 1663 ]]
        -- upvalues: l_Title_1 (copy)
        l_Title_1.Text = v389;
    end);
    v369:SetSpecial("SetPosition", function(_, v391) --[[ Line: 1664 ]]
        -- upvalues: v18 (ref)
        v18(v391);
    end);
    v369:SetSpecial("SetSize", function(_, v393) --[[ Line: 1665 ]]
        -- upvalues: v21 (ref)
        v21(v393);
    end);
    v369:SetSpecial("GetPosition", function() --[[ Line: 1666 ]]
        -- upvalues: l_Drag_0 (copy)
        return l_Drag_0.AbsolutePosition;
    end);
    v369:SetSpecial("GetSize", function() --[[ Line: 1667 ]]
        -- upvalues: l_Main_0 (copy)
        return l_Main_0.AbsoluteSize;
    end);
    v369:SetSpecial("IsVisible", v14);
    v369:SetSpecial("IsClosed", v59);
    v370.__index = function(v394, v395) --[[ Line: 1671 ]]
        -- upvalues: v14 (ref), v59 (ref), v372 (copy)
        if v395 == "IsVisible" then
            return v14();
        elseif v395 == "Closed" then
            return v59;
        else
            return v372(v394, v395);
        end;
    end;
    v21(l_Size_0);
    v18(l_Position_0);
    if l_Ready_0 then
        l_gTable_0:Ready();
        v67();
    end;
    return v369, l_Object_0;
end;