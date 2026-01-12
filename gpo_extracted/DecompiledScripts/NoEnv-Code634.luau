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
local v23 = nil;
local v24 = nil;
local v25 = nil;
local v26 = nil;
local v27 = nil;
local v28 = nil;
local v29 = nil;
client = v25;
Pcall = v26;
Routine = v27;
service = v28;
GetEnv = v29;
v25 = function(v30) --[[ Line: 149 ]] --[[ Name: isGui ]]
    return v30:IsA("GuiObject");
end;
return function(v31, v32) --[[ Line: 154 ]]
    -- upvalues: v10 (ref), v16 (ref), v9 (ref), v2 (copy), v4 (copy), v0 (copy), v7 (copy), v5 (copy), v6 (copy), v3 (copy), v1 (copy), v25 (copy), v24 (ref), v12 (ref), v14 (ref), v13 (ref), v17 (ref), v11 (ref), v20 (ref), v21 (ref), v18 (ref), v22 (ref), v23 (ref), v15 (ref), v8 (copy), v19 (ref)
    if v32 then
        setfenv(1, v32);
    end;
    local l_LocalPlayer_0 = service.Players.LocalPlayer;
    local l_l_LocalPlayer_0_Mouse_0 = l_LocalPlayer_0:GetMouse();
    local l_UserInputService_0 = service.UserInputService;
    local _ = v31.gIndex;
    local l_gTable_0 = v31.gTable;
    local l_BindEvent_0 = l_gTable_0.BindEvent;
    local l_Object_0 = l_gTable_0.Object;
    local l_Name_0 = v31.Name;
    local l_Icon_0 = v31.Icon;
    local l_Size_0 = v31.Size;
    local l_Menu_0 = v31.Menu;
    local l_Title_0 = v31.Title;
    local l_Ready_0 = v31.Ready;
    local l_Walls_0 = v31.Walls;
    local l_NoHide_0 = v31.NoHide;
    local l_NoClose_0 = v31.NoClose;
    local l_NoDrag_0 = v31.NoDrag;
    local l_OnReady_0 = v31.OnReady;
    local l_OnClose_0 = v31.OnClose;
    local l_OnResize_0 = v31.OnResize;
    local l_OnRefresh_0 = v31.OnRefresh;
    local l_OnMinimize_0 = v31.OnMinimize;
    local _ = v31.ContextMenu;
    local l_ResetOnSpawn_0 = v31.ResetOnSpawn;
    local l_CanKeepAlive_0 = v31.CanKeepAlive;
    local l_IconClicked_0 = v31.IconClicked;
    local v59 = v31.SizeLocked or v31.SizeLock;
    local l_CanvasSize_0 = v31.CanvasSize;
    local l_Position_0 = v31.Position;
    local v62 = v31.Content or v31.Children;
    local v63 = v31.MinSize or {
        150, 
        50
    };
    local v64 = v31.MaxSize or {
        math.huge, 
        math.huge
    };
    local l_Icon_1 = l_l_LocalPlayer_0_Mouse_0.Icon;
    local v66 = false;
    local v67 = false;
    local v68 = false;
    local l_CheckProperty_0 = service.CheckProperty;
    local v70 = {};
    local v71 = nil;
    local v72 = nil;
    local v73 = nil;
    local v74 = nil;
    local v75 = nil;
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
    v10 = function(v96, v97, v98, v99) --[[ Line: 226 ]] --[[ Name: Expand ]]
        -- upvalues: v71 (ref), l_Object_0 (copy)
        local l_Label_0 = v97:FindFirstChild("Label");
        if l_Label_0 then
            v96.MouseLeave:Connect(function(_, _) --[[ Line: 230 ]]
                -- upvalues: v71 (ref), v96 (copy), v97 (copy)
                if v71 == v96 then
                    v97.Visible = false;
                end;
            end);
            v96.MouseMoved:Connect(function(v103, v104) --[[ Line: 236 ]]
                -- upvalues: v71 (ref), v96 (copy), v98 (copy), l_Label_0 (copy), v99 (copy), l_Object_0 (ref), v97 (copy)
                v71 = v96;
                local v105 = v98 or v96.Desc.Value;
                l_Label_0.Text = v105;
                l_Label_0.RichText = v99;
                l_Label_0.TextScaled = v99;
                local l_ContentText_0 = l_Label_0.ContentText;
                local l_TextSize_0 = service.TextService:GetTextSize(l_ContentText_0, l_Label_0.TextSize, l_Label_0.Font, Vector2.new(400, math.huge));
                local v108 = l_TextSize_0.X + 10;
                local v109 = l_TextSize_0.Y + 10;
                local v110 = v103 + 6 + v108 < l_Object_0.AbsoluteSize.X and v103 + 6 or v103 - 6 - v108;
                local v111 = v104 - 6 - v109 > 0 and v104 - 6 - v109 or v104;
                v97.Size = UDim2.fromOffset(v108, v109);
                v97.Position = UDim2.fromOffset(v110, v111);
                v97.Visible = v105 ~= "";
            end);
        end;
    end;
    v16 = function(v112) --[[ Line: 260 ]] --[[ Name: getNextPos ]]
        -- upvalues: l_CheckProperty_0 (copy)
        local v113 = nil;
        local v114 = nil;
        for _, v116 in ipairs(v112:GetChildren()) do
            if l_CheckProperty_0(v116, "Size") then
                if not v113 or v116.AbsolutePosition.X + v116.AbsoluteSize.X > v113.AbsolutePosition.X + v113.AbsoluteSize.X then
                    v113 = v116;
                end;
                if not v114 or v116.AbsolutePosition.Y + v116.AbsoluteSize.Y > v113.AbsolutePosition.Y + v113.AbsoluteSize.Y then
                    v114 = v116;
                end;
            end;
        end;
        return not (v113 and v114) and UDim2.new(0, 0, 0, 0) or UDim2.new(v113.Position.X.Scale, v113.Position.X.Offset + v113.AbsoluteSize.X, v114.Position.Y.Scale, v114.Position.Y.Offset + v114.AbsoluteSize.Y);
    end;
    v73 = function(v117, v118) --[[ Line: 277 ]] --[[ Name: LoadChildren ]]
        -- upvalues: v75 (ref), v9 (ref)
        if v118 then
            local v119 = v118.RunWhenDone and v75(v118.RunWhenDone, v117);
            for v120, v121 in pairs(v118) do
                if type(v121) == "table" then
                    if not v121.Parent then
                        v121.Parent = v117;
                    end;
                    v9(v121.Class or v121.ClassName or v120, v121);
                elseif type(v121) == "function" or type(v121) == "string" and not v119 then
                    v119 = v75(v121, v117);
                end;
            end;
            if v119 then
                v119(v117);
            end;
        end;
    end;
    v74 = function() --[[ Line: 295 ]] --[[ Name: BringToFront ]]
        -- upvalues: l_LocalPlayer_0 (copy), l_Object_0 (copy)
        for _, v123 in ipairs(l_LocalPlayer_0.PlayerGui:GetChildren()) do
            if v123:FindFirstChild("__ADONIS_WINDOW") then
                v123.DisplayOrder = 100;
            end;
        end;
        l_Object_0.DisplayOrder = 101;
    end;
    v72 = function(v124) --[[ Line: 305 ]] --[[ Name: addTitleButton ]]
        -- upvalues: l_Hide_0 (copy), l_Close_0 (copy), l_Drag_0 (copy), v9 (ref)
        local v125 = nil;
        local l_l_Hide_0_0 = l_Hide_0;
        local v127 = l_Hide_0.AbsolutePosition.X + l_Hide_0.AbsoluteSize.X - l_Close_0.AbsolutePosition.X;
        local l_l_Close_0_0 = l_Close_0;
        for _, v130 in ipairs(l_Drag_0:GetChildren()) do
            if v130:IsA("TextButton") and v130.Visible and v130.AbsolutePosition.X < l_l_Close_0_0.AbsolutePosition.X then
                l_l_Close_0_0 = v130;
            end;
        end;
        local v131 = v124.Size or l_l_Hide_0_0.Size;
        local v132 = l_l_Close_0_0.Position.X.Offset - (v131.X.Offset - v127);
        v125 = UDim2.new(l_l_Close_0_0.Position.X.Scale, v132, l_l_Hide_0_0.Position.Y.Scale, l_l_Hide_0_0.Position.Y.Offset);
        v124.Name = "__TITLEBUTTON";
        v124.Size = v131;
        v124.Parent = l_Drag_0;
        v124.ZIndex = v124.ZIndex or l_l_Hide_0_0.ZIndex;
        v124.Position = v124.Position or v125;
        v124.TextSize = v124.TextSize or l_l_Hide_0_0.TextSize;
        v124.TextColor3 = v124.TextColor3 or l_l_Hide_0_0.TextColor3;
        v124.TextScaled = v124.TextScaled or l_l_Hide_0_0.TextScaled;
        v124.TextScaled = v124.TextScaled or l_l_Hide_0_0.TextScaled;
        v124.TextWrapped = v124.TextWrapped or l_l_Hide_0_0.TextWrapped;
        v124.TextStrokeColor3 = v124.TextStrokeColor3 or l_l_Hide_0_0.TextStrokeColor3;
        v124.TextTransparency = v124.TextTransparency or l_l_Hide_0_0.TextTransparency;
        v124.TextStrokeTransparency = v124.TextStrokeTransparency or l_l_Hide_0_0.TextStrokeTransparency;
        v124.BackgroundTransparency = v124.BackgroundTransparency or l_l_Hide_0_0.BackgroundTransparency;
        v124.BackgroundColor3 = v124.BackgroundColor3 or l_l_Hide_0_0.BackgroundColor3;
        v124.BorderSizePixel = v124.BorderSizePixel or l_l_Hide_0_0.BorderSizePixel;
        v124.Font = v124.Font or l_l_Hide_0_0.Font;
        return v9("TextButton", v124);
    end;
    v75 = function(v133, v134) --[[ Line: 348 ]] --[[ Name: functionify ]]
        if type(v133) == "string" then
            if v134 then
                local v135 = GetEnv();
                v135.Object = v134;
                return client.Core.LoadCode(v133, v135);
            else
                return client.Core.LoadCode(v133);
            end;
        else
            return v133;
        end;
    end;
    v9 = function(v136, v137, v138) --[[ Line: 362 ]] --[[ Name: create ]]
        -- upvalues: v70 (copy), l_CheckProperty_0 (copy), v2 (ref), v4 (ref), v0 (ref), v7 (ref), v5 (ref), v6 (ref), v3 (ref), v75 (ref), l_BindEvent_0 (copy), v10 (ref), l_Desc_0 (copy), l_l_LocalPlayer_0_Mouse_0 (copy), v9 (ref), l_Object_0 (copy), v16 (ref), v1 (ref), v25 (ref), v73 (ref), v24 (ref)
        local v139 = v137 or {};
        local v140 = v139.Class or v139.ClassName or v136;
        local v141 = v138 or v70[v140] and v70[v140]:Clone() or service.New(v140);
        local v142 = v139.Parent or v141.Parent;
        if v137 then
            v139.Parent = nil;
            if v139.Class or v139.ClassName then
                v139.Class = nil;
                v139.ClassName = nil;
            end;
            if not v139.BorderColor3 and l_CheckProperty_0(v141, "BorderColor3") then
                v141.BorderColor3 = v2;
            end;
            if not v139.CanvasSize and l_CheckProperty_0(v141, "CanvasSize") then
                v141.CanvasSize = v4;
            end;
            if not v139.BorderSizePixel and l_CheckProperty_0(v141, "BorderSizePixel") then
                v141.BorderSizePixel = 0;
            end;
            if not v139.BackgroundColor3 and l_CheckProperty_0(v141, "BackgroundColor3") then
                v141.BackgroundColor3 = v0;
            end;
            if not v139.PlaceholderColor3 and l_CheckProperty_0(v141, "PlaceholderColor3") then
                v141.PlaceholderColor3 = v7;
            end;
            if not v139.Transparency and not v139.BackgroundTransparency and l_CheckProperty_0(v141, "Transparency") and l_CheckProperty_0(v141, "BackgroundTransparency") then
                v141.BackgroundTransparency = 0;
            elseif v139.Transparency and l_CheckProperty_0(v141, "BackgroundTransparency") then
                v141.BackgroundTransparency = v139.Transparency;
            end;
            if not v139.TextColor3 and not v139.TextColor and l_CheckProperty_0(v141, "TextColor3") then
                v141.TextColor3 = v5;
            elseif v139.TextColor then
                v141.TextColor3 = v139.TextColor;
            end;
            if not v139.Font and l_CheckProperty_0(v141, "Font") then
                v139.Font = "SourceSans";
            end;
            if not v139.TextSize and l_CheckProperty_0(v141, "TextSize") then
                v139.TextSize = 16;
            end;
            if not v139.BottomImage and not v139.MidImage and not v139.TopImage and v140 == "ScrollingFrame" then
                v141.BottomImage = "http://roblox.com/asset?id=158348114";
                v141.MidImage = "http://roblox.com/asset?id=158348114";
                v141.TopImage = "http://roblox.com/asset?id=158348114";
            end;
            if not v139.Size and l_CheckProperty_0(v141, "Size") then
                v141.Size = v6;
            end;
            if not v139.Position and l_CheckProperty_0(v141, "Position") then
                v141.Position = v3;
            end;
            if not v139.ZIndex and l_CheckProperty_0(v141, "ZIndex") then
                v141.ZIndex = 2;
                if v142 and l_CheckProperty_0(v142, "ZIndex") then
                    v141.ZIndex = v142.ZIndex;
                end;
            end;
            if v139.TextChanged and v140 == "TextBox" then
                local v143 = v75(v139.TextChanged, v141);
                local l_v143_0 = v143 --[[ copy: 7 -> 45 ]];
                v141.FocusLost:Connect(function(v145) --[[ Line: 439 ]]
                    -- upvalues: l_v143_0 (copy), v141 (copy)
                    l_v143_0(v141.Text, v145, v141);
                end);
            end;
            if (v139.OnClicked or v139.OnClick) and (v140 == "TextButton" or v140 == "ImageButton") then
                local v146 = false;
                local l_Debounce_0 = v139.Debounce;
                local v148 = v75(v139.OnClicked or v139.OnClick, v141);
                local l_l_Debounce_0_0 = l_Debounce_0 --[[ copy: 8 -> 43 ]];
                local l_v148_0 = v148 --[[ copy: 9 -> 44 ]];
                do
                    local l_v146_0 = v146;
                    v141.MouseButton1Down:Connect(function() --[[ Line: 448 ]]
                        -- upvalues: l_v146_0 (ref), l_l_Debounce_0_0 (copy), l_v148_0 (copy), v141 (copy)
                        if not l_v146_0 then
                            if l_l_Debounce_0_0 then
                                l_v146_0 = true;
                            end;
                            l_v148_0(v141);
                            l_v146_0 = false;
                        end;
                    end);
                end;
            end;
            if v139.Events then
                for v152, v153 in pairs(v139.Events) do
                    local v154 = v75(v153, v141);
                    l_BindEvent_0(v141[v152], function(...) --[[ Line: 464 ]]
                        -- upvalues: v154 (copy)
                        v154(...);
                    end);
                end;
            end;
            if v139.Visible == nil then
                v139.Visible = true;
            end;
            if v139.LabelProps then
                v139.LabelProperties = v139.LabelProps;
            end;
        end;
        if v140 == "Entry" then
            local l_Text_0 = v141.Text;
            local l_Dots_0 = v141.Dots;
            local l_Desc_1 = v141.Desc;
            local v158 = v139.RichText or l_Text_0.RichText;
            l_Text_0.ZIndex = v139.ZIndex or v141.ZIndex;
            l_Dots_0.ZIndex = v139.ZIndex or v141.ZIndex;
            if v139.Text then
                l_Text_0.Text = v139.Text;
                l_Text_0.Visible = true;
                v139.Text = nil;
            end;
            if v139.Desc or v139.ToolTip then
                l_Desc_1.Value = v139.Desc or v139.ToolTip;
                v139.Desc = nil;
            end;
            v10(v141, l_Desc_0, nil, v158);
        elseif v139.ToolTip then
            v10(v141, l_Desc_0, v139.ToolTip, v139.RichText);
        end;
        if v140 == "ButtonEntry" then
            local l_Button_0 = v141.Button;
            local v160 = false;
            local v161 = v75(v139.OnClicked, l_Button_0);
            local l_v161_0 = v161 --[[ copy: 9 -> 41 ]];
            local l_l_Button_0_0 = l_Button_0 --[[ copy: 7 -> 42 ]];
            do
                local l_v160_0 = v160;
                v141:SetSpecial("DoClick", function() --[[ Line: 511 ]]
                    -- upvalues: l_v160_0 (ref), l_v161_0 (copy), l_l_Button_0_0 (copy)
                    if not l_v160_0 then
                        l_v160_0 = true;
                        if l_v161_0 then
                            l_v161_0(l_l_Button_0_0);
                        end;
                        l_v160_0 = false;
                    end;
                end);
                v141.Text = v139.Text or v141.Text;
                l_Button_0.ZIndex = v139.ZIndex or v141.ZIndex;
                l_Button_0.MouseButton1Down:Connect(v141.DoClick);
            end;
        end;
        if v140 == "Boolean" then
            local l_Enabled_0 = v139.Enabled;
            local v166 = false;
            local v167 = v75(v139.OnToggle, v141);
            local l_v167_0 = v167 --[[ copy: 9 -> 39 ]];
            do
                local l_l_Enabled_0_0, l_v166_0 = l_Enabled_0, v166;
                local function v172(v171) --[[ Line: 530 ]] --[[ Name: toggle ]]
                    -- upvalues: l_v166_0 (ref), l_l_Enabled_0_0 (ref), v141 (copy), l_v167_0 (copy)
                    if not l_v166_0 then
                        l_v166_0 = true;
                        if v171 ~= nil and v171 or v171 == nil and l_l_Enabled_0_0 then
                            l_l_Enabled_0_0 = false;
                            v141.Text = "Disabled";
                        elseif v171 ~= nil and v171 == false or v171 == nil and not l_l_Enabled_0_0 then
                            l_l_Enabled_0_0 = true;
                            v141.Text = "Enabled";
                        end;
                        if l_v167_0 then
                            l_v167_0(l_l_Enabled_0_0, v141);
                        end;
                        l_v166_0 = false;
                    end;
                end;
                v141.Text = l_l_Enabled_0_0 and "Enabled" or "Disabled";
                local l_v172_0 = v172 --[[ copy: 10 -> 40 ]];
                v141.MouseButton1Down:Connect(function() --[[ Line: 550 ]]
                    -- upvalues: l_v167_0 (copy), l_v172_0 (copy)
                    if l_v167_0 then
                        l_v172_0();
                    end;
                end);
                v141:SetSpecial("Toggle", function(_, v175) --[[ Line: 556 ]]
                    -- upvalues: l_v172_0 (copy)
                    l_v172_0(v175);
                end);
            end;
        end;
        if v140 == "StringEntry" then
            local l_Box_0 = v141.Box;
            local v177 = nil;
            v141.Text = v139.Text or v141.Text;
            l_Box_0.ZIndex = v139.ZIndex or v141.ZIndex;
            if v139.BoxText then
                l_Box_0.Text = v139.BoxText;
            end;
            if v139.BoxProperties then
                for v178, v179 in pairs(v139.BoxProperties) do
                    if l_CheckProperty_0(l_Box_0, v178) then
                        l_Box_0[v178] = v179;
                    end;
                end;
            end;
            do
                local l_v177_0 = v177;
                if v139.TextChanged then
                    local v181 = v75(v139.TextChanged, l_Box_0);
                    local l_v181_0 = v181 --[[ copy: 9 -> 37 ]];
                    local l_l_Box_0_0 = l_Box_0 --[[ copy: 7 -> 38 ]];
                    l_Box_0.Changed:Connect(function(v184) --[[ Line: 580 ]]
                        -- upvalues: l_v177_0 (ref), l_v181_0 (copy), l_l_Box_0_0 (copy)
                        if v184 == "Text" and not l_v177_0 then
                            l_v181_0(l_l_Box_0_0.Text);
                        end;
                    end);
                    l_Box_0.FocusLost:Connect(function(v185) --[[ Line: 586 ]]
                        -- upvalues: l_v181_0 (copy), l_l_Box_0_0 (copy), l_v177_0 (ref)
                        local v186 = l_v181_0(l_l_Box_0_0.Text, true, v185);
                        if v186 then
                            l_v177_0 = true;
                            l_l_Box_0_0.Text = v186;
                            l_v177_0 = false;
                        end;
                    end);
                end;
                local l_l_Box_0_1 = l_Box_0 --[[ copy: 7 -> 36 ]];
                v141:SetSpecial("SetValue", function(_, v189) --[[ Line: 596 ]]
                    -- upvalues: l_l_Box_0_1 (copy)
                    l_l_Box_0_1.Text = v189;
                end);
            end;
        end;
        if v140 == "Slider" then
            local l_Percentage_0 = v141.Percentage;
            local l_Slider_0 = v141.Slider;
            local l_SliderBar_0 = v141.SliderBar;
            local l_Drag_1 = v141.Drag;
            local v194 = false;
            local v195 = 0;
            local v196 = v75(v139.OnSlide, v141);
            l_SliderBar_0.ZIndex = v139.ZIndex or v141.ZIndex;
            l_Slider_0.ZIndex = l_SliderBar_0.ZIndex + 1;
            l_Drag_1.ZIndex = l_Slider_0.ZIndex + 1;
            l_Drag_1.Active = true;
            if v139.Value then
                l_Slider_0.Position = UDim2.new(0.5, -10, 0.5, -10);
                l_Drag_1.Position = l_Slider_0.Position;
            end;
            local l_l_Slider_0_0 = l_Slider_0 --[[ copy: 8 -> 32 ]];
            local l_l_Drag_1_0 = l_Drag_1 --[[ copy: 10 -> 33 ]];
            local l_l_Percentage_0_0 = l_Percentage_0 --[[ copy: 7 -> 34 ]];
            local l_v196_0 = v196 --[[ copy: 13 -> 35 ]];
            do
                local l_v194_0, l_v195_0 = v194, v195;
                l_SliderBar_0.InputBegan:Connect(function(v203) --[[ Line: 619 ]]
                    -- upvalues: l_v194_0 (ref), l_v195_0 (ref), v141 (copy), l_l_Slider_0_0 (copy), l_l_Drag_1_0 (copy), l_l_Percentage_0_0 (copy), l_v196_0 (copy)
                    if not l_v194_0 and (v203.UserInputType == Enum.UserInputType.MouseButton1 or v203.UserInputType == Enum.UserInputType.Touch) then
                        l_v195_0 = (v203.Position.X - v141.AbsolutePosition.X) / v141.AbsoluteSize.X;
                        if l_v195_0 < 0 then
                            l_v195_0 = 0;
                        elseif l_v195_0 > 1 then
                            l_v195_0 = 1;
                        end;
                        l_l_Slider_0_0.Position = UDim2.new(l_v195_0, -10, 0.5, -10);
                        l_l_Drag_1_0.Position = l_l_Slider_0_0.Position;
                        l_l_Percentage_0_0.Value = l_v195_0;
                        if l_v196_0 then
                            l_v196_0(l_v195_0);
                        end;
                    end;
                end);
                l_Drag_1.DragBegin:Connect(function() --[[ Line: 639 ]]
                    -- upvalues: l_v194_0 (ref)
                    l_v194_0 = true;
                end);
                l_Drag_1.DragStopped:Connect(function() --[[ Line: 643 ]]
                    -- upvalues: l_v194_0 (ref), l_l_Drag_1_0 (copy), l_l_Slider_0_0 (copy)
                    l_v194_0 = false;
                    l_l_Drag_1_0.Position = l_l_Slider_0_0.Position;
                end);
                l_Drag_1.Changed:Connect(function() --[[ Line: 648 ]]
                    -- upvalues: l_v194_0 (ref), l_v195_0 (ref), l_l_LocalPlayer_0_Mouse_0 (ref), v141 (copy), l_l_Slider_0_0 (copy), l_l_Percentage_0_0 (copy), l_v196_0 (copy)
                    if l_v194_0 then
                        l_v195_0 = (l_l_LocalPlayer_0_Mouse_0.X - v141.AbsolutePosition.X) / v141.AbsoluteSize.X;
                        if l_v195_0 < 0 then
                            l_v195_0 = 0;
                        elseif l_v195_0 > 1 then
                            l_v195_0 = 1;
                        end;
                        l_l_Slider_0_0.Position = UDim2.new(l_v195_0, -10, 0.5, -10);
                        l_l_Percentage_0_0.Value = l_v195_0;
                        if l_v196_0 then
                            l_v196_0(l_v195_0);
                        end;
                    end;
                end);
                v141:SetSpecial("SetValue", function(_, v205) --[[ Line: 667 ]]
                    -- upvalues: l_v195_0 (ref), l_l_Percentage_0_0 (copy), l_l_Slider_0_0 (copy), l_l_Drag_1_0 (copy)
                    if v205 and tonumber(v205) then
                        l_v195_0 = tonumber(v205);
                        l_l_Percentage_0_0.Value = l_v195_0;
                        l_l_Slider_0_0.Position = UDim2.new(l_v195_0, -10, 0.5, -10);
                        l_l_Drag_1_0.Position = l_l_Slider_0_0.Position;
                    end;
                end);
            end;
        end;
        if v140 == "Dropdown" then
            local l_Menu_1 = v141.Menu;
            local l_Down_0 = v141.Down;
            local l_dSelected_0 = v141.dSelected;
            local l_Options_0 = v139.Options;
            local v210 = v139.Selected or v139.Selection;
            local v211 = v75(v139.OnSelection or v139.OnSelect or function() --[[ Line: 683 ]]

            end);
            local l_TextProperties_0 = v139.TextProperties;
            local v213 = v9("ScrollingFrame", {
                Parent = l_Menu_1, 
                Size = UDim2.fromScale(1, 1), 
                Position = UDim2.new(), 
                BackgroundTransparency = 1, 
                ZIndex = 100
            });
            l_Menu_1.ZIndex = v213.ZIndex;
            l_Menu_1.Parent = l_Object_0;
            l_Menu_1.Visible = false;
            l_Menu_1.Size = UDim2.new(0, v141.AbsoluteSize.X, 0, 100);
            l_Menu_1.BackgroundColor3 = v139.BackgroundColor3 or v141.BackgroundColor3;
            if v139.TextAlignment then
                l_dSelected_0.TextXAlignment = v139.TextAlignment;
                l_dSelected_0.Position = UDim2.fromOffset(30, 0);
            end;
            if v139.NoArrow then
                l_Down_0.Visible = false;
            end;
            v141:SetSpecial("MenuContainer", l_Menu_1);
            local l_l_Menu_1_0 = l_Menu_1 --[[ copy: 7 -> 27 ]];
            local l_l_Down_0_0 = l_Down_0 --[[ copy: 8 -> 28 ]];
            local l_l_dSelected_0_0 = l_dSelected_0 --[[ copy: 9 -> 29 ]];
            local l_l_Options_0_0 = l_Options_0 --[[ copy: 10 -> 30 ]];
            v141.Changed:Connect(function(v218) --[[ Line: 710 ]]
                -- upvalues: l_l_Menu_1_0 (copy), v141 (copy), l_l_Down_0_0 (copy), v139 (copy), l_l_dSelected_0_0 (copy), l_l_Options_0_0 (copy), v213 (copy)
                if v218 == "AbsolutePosition" and l_l_Menu_1_0.Visible then
                    l_l_Menu_1_0.Position = UDim2.fromOffset(v141.AbsolutePosition.X, v141.AbsolutePosition.Y + v141.AbsoluteSize.Y);
                    return;
                else
                    if v218 == "AbsoluteSize" or v218 == "Parent" then
                        l_l_Down_0_0.Size = UDim2.new(0, v141.AbsoluteSize.Y, 1, 0);
                        if v139.TextAlignment == "Right" then
                            l_l_Down_0_0.Position = UDim2.new(0, 0, 0.5, -(l_l_Down_0_0.AbsoluteSize.X / 2));
                            l_l_dSelected_0_0.Position = UDim2.fromOffset(v141.AbsoluteSize.Y, 0);
                        else
                            l_l_Down_0_0.Position = UDim2.new(1, -l_l_Down_0_0.AbsoluteSize.X, 0.5, -(l_l_Down_0_0.AbsoluteSize.X / 2));
                        end;
                        l_l_dSelected_0_0.Size = UDim2.new(1, -l_l_Down_0_0.AbsoluteSize.X, 1, 0);
                        if l_l_Options_0_0 and #l_l_Options_0_0 <= 6 then
                            l_l_Menu_1_0.Size = UDim2.fromOffset(v141.AbsoluteSize.X, #l_l_Options_0_0 * 30);
                            return;
                        else
                            l_l_Menu_1_0.Size = UDim2.fromOffset(v141.AbsoluteSize.X, 180);
                            v213:ResizeCanvas(false, true);
                        end;
                    end;
                    return;
                end;
            end);
            l_dSelected_0.ZIndex = v141.ZIndex;
            l_Down_0.ZIndex = v141.ZIndex;
            if l_TextProperties_0 then
                for v219, v220 in pairs(l_TextProperties_0) do
                    l_dSelected_0[v219] = v220;
                end;
            end;
            if l_Options_0 then
                for v221, v222 in pairs(l_Options_0) do
                    local v223 = v213:Add("TextButton", {
                        Text = ("  %*"):format(v222), 
                        Size = UDim2.new(1, -10, 0, 30), 
                        Position = UDim2.new(0, 5, 0, 30 * (v221 - 1)), 
                        ZIndex = l_Menu_1.ZIndex, 
                        BackgroundTransparency = 1, 
                        OnClick = function() --[[ Line: 750 ]] --[[ Name: OnClick ]]
                            -- upvalues: l_dSelected_0 (copy), v222 (copy), v211 (copy), v141 (copy), l_Menu_1 (copy)
                            l_dSelected_0.Text = v222;
                            v211(v222, v141);
                            l_Menu_1.Visible = false;
                        end
                    });
                    if l_TextProperties_0 then
                        for v224, v225 in pairs(l_TextProperties_0) do
                            v223[v224] = v225;
                        end;
                    end;
                end;
                if v210 then
                    l_dSelected_0.Text = v210;
                else
                    l_dSelected_0.Text = "No Selection";
                end;
                local l_l_Menu_1_1 = l_Menu_1 --[[ copy: 7 -> 31 ]];
                local function v227() --[[ Line: 770 ]] --[[ Name: showMenu ]]
                    -- upvalues: l_l_Menu_1_1 (copy), v141 (copy)
                    l_l_Menu_1_1.Position = UDim2.fromOffset(v141.AbsolutePosition.X, v141.AbsolutePosition.Y + v141.AbsoluteSize.Y);
                    l_l_Menu_1_1.Visible = not l_l_Menu_1_1.Visible;
                end;
                l_dSelected_0.MouseButton1Down:Connect(v227);
                l_Down_0.MouseButton1Down:Connect(v227);
            end;
        end;
        if v140 == "TabFrame" then
            local v228 = {};
            local v229 = v9("ScrollingFrame", nil, v141.Buttons);
            local l_Frames_0 = v141.Frames;
            local v231 = 0;
            local _ = v139.ButtonSize or 60;
            v141.BackgroundTransparency = v139.BackgroundTransparency or 1;
            v229.ZIndex = v139.ZIndex or v141.ZIndex;
            l_Frames_0.ZIndex = v229.ZIndex;
            v141:SetSpecial("GetTab", function(_, v234) --[[ Line: 791 ]]
                -- upvalues: l_Frames_0 (copy)
                return l_Frames_0:FindFirstChild(v234);
            end);
            local l_v228_0 = v228 --[[ copy: 7 -> 26 ]];
            do
                local l_v231_0 = v231;
                v141:SetSpecial("NewTab", function(_, v238, v239) --[[ Line: 795 ]]
                    -- upvalues: v16 (ref), v229 (copy), v9 (ref), v1 (ref), l_v228_0 (copy), v25 (ref), l_Frames_0 (copy), l_v231_0 (ref)
                    local v240 = v239 or {};
                    local v241 = v16(v229);
                    local l_TextSize_1 = service.TextService:GetTextSize(v240.Text or v238, 16, "SourceSans", v229.AbsoluteSize);
                    local _ = v240.TextTransparency;
                    local v244 = false;
                    local v245 = v9("ScrollingFrame", {
                        Name = v238, 
                        Size = UDim2.fromScale(1, 1), 
                        Position = UDim2.new(), 
                        BorderSizePixel = 0, 
                        BackgroundTransparency = v240.FrameTransparency or v240.Transparency, 
                        BackgroundColor3 = v240.Color or v1, 
                        ZIndex = v229.ZIndex, 
                        Visible = false
                    });
                    local v246 = v9("TextButton", {
                        Name = v238, 
                        Text = v240.Text or v238, 
                        Size = UDim2.new(0, l_TextSize_1.X + 20, 1, 0), 
                        ZIndex = v229.ZIndex, 
                        Position = UDim2.new(0, v241.X.Offset > 0 and v241.X.Offset + 5 or 0, 0, 0), 
                        TextColor3 = v240.TextColor, 
                        BackgroundTransparency = 0.7, 
                        TextTransparency = v240.TextTransparency, 
                        BackgroundColor3 = v240.Color or v1, 
                        BorderSizePixel = 0
                    });
                    v245:SetSpecial("FocusTab", function() --[[ Line: 827 ]]
                        -- upvalues: l_v228_0 (ref), v25 (ref), l_Frames_0 (ref), v246 (copy), v240 (copy), v245 (copy)
                        for _, v248 in ipairs(l_v228_0) do
                            if v25(v248) then
                                v248.BackgroundTransparency = v248:IsDisabled() and 0.9 or 0.7;
                                v248.TextTransparency = v248:IsDisabled() and 0.9 or 0.7;
                            end;
                        end;
                        for _, v250 in ipairs(l_Frames_0:GetChildren()) do
                            if v25(v250) then
                                v250.Visible = false;
                            end;
                        end;
                        v246.BackgroundTransparency = v240.Transparency or 0;
                        v246.TextTransparency = v240.TextTransparency or 0;
                        v245.Visible = true;
                        if v240.OnFocus then
                            v240.OnFocus(true);
                        end;
                    end);
                    if l_v231_0 == 0 then
                        v245.Visible = true;
                        v246.BackgroundTransparency = v240.Transparency or 0;
                    end;
                    v246.MouseButton1Down:Connect(function() --[[ Line: 855 ]]
                        -- upvalues: v244 (ref), v245 (copy)
                        if not v244 then
                            v245:FocusTab();
                        end;
                    end);
                    v246.Parent = v229;
                    v245.Parent = l_Frames_0;
                    v229:ResizeCanvas(true, false);
                    v245:SetSpecial("Disable", function() --[[ Line: 865 ]]
                        -- upvalues: v244 (ref), v246 (copy)
                        v244 = true;
                        v246.BackgroundTransparency = 0.9;
                        v246.TextTransparency = 0.9;
                    end);
                    v245:SetSpecial("Enable", function() --[[ Line: 871 ]]
                        -- upvalues: v244 (ref), v246 (copy), v240 (copy)
                        v244 = false;
                        v246.BackgroundTransparency = 0.7;
                        v246.TextTransparency = v240.TextTransparency or 0;
                    end);
                    v246:SetSpecial("IsDisabled", function() --[[ Line: 877 ]]
                        -- upvalues: v244 (ref)
                        return v244;
                    end);
                    table.insert(l_v228_0, v246);
                    l_v231_0 = l_v231_0 + 1;
                    return v245, v246;
                end);
            end;
        end;
        if v140 == "ScrollingFrame" then
            local v251 = false;
            if not v139.ScrollBarThickness then
                v139.ScrollBarThickness = 4;
            end;
            do
                local l_v251_0 = v251;
                v141:SetSpecial("GenerateList", function(v253, v254, v255, v256) --[[ Line: 895 ]]
                    -- upvalues: l_v251_0 (ref), v141 (copy), v139 (copy), v9 (ref), l_CheckProperty_0 (ref)
                    local v257 = v254 or v253;
                    local v258 = {};
                    local v259 = v255 or {};
                    l_v251_0 = v258;
                    v141:ClearAllChildren();
                    v141.AutomaticCanvasSize = "Y";
                    local v260 = service.New("UIListLayout", {
                        Parent = v141, 
                        Name = "LayoutOrder", 
                        FillDirection = v139.Layout_FillDirection or "Vertical", 
                        VerticalAlignment = v139.Layout_VerticalAlignment or "Top", 
                        HorizontalAlignment = v139.Layout_HorizontalAlignment or "Left"
                    });
                    local v261 = 0;
                    for v262, v263 in pairs(v257) do
                        local l_v263_0 = v263;
                        local v265 = nil;
                        local v266 = nil;
                        local v267 = nil;
                        local v268 = nil;
                        if type(v263) == "table" then
                            l_v263_0 = v263.Text;
                            v265 = v263.Desc;
                            v266 = v263.Color;
                            v268 = v263.OnClick;
                            if v263.RichTextAllowed or v259.RichTextAllowed then
                                v267 = true;
                            end;
                        end;
                        local v269 = nil;
                        v269 = if not not v263.TextSelectable or v259.TextSelectable then v9("TextBox", {
                            Text = (" %*"):format(l_v263_0), 
                            ToolTip = v265, 
                            AutomaticSize = if not v259.ySize then Enum.AutomaticSize.Y else nil, 
                            Size = UDim2.new(1, -5, 0, v259.ySize or 20), 
                            Visible = true, 
                            BackgroundTransparency = 1, 
                            Font = "Arial", 
                            TextSize = 14, 
                            TextStrokeTransparency = 0.8, 
                            TextXAlignment = "Left", 
                            Position = UDim2.new(0, 0, 0, v261 * (v259.ySize or 20)), 
                            RichText = v267 or false, 
                            TextEditable = false, 
                            ClearTextOnFocus = false
                        }) else v9(v268 and "TextButton" or "TextLabel", {
                            Text = (" %*"):format(l_v263_0), 
                            ToolTip = v265, 
                            AutomaticSize = if not v259.ySize then Enum.AutomaticSize.Y else nil, 
                            Size = UDim2.new(1, -5, 0, v259.ySize or 20), 
                            Visible = true, 
                            BackgroundTransparency = 1, 
                            Font = "Arial", 
                            TextSize = 14, 
                            TextStrokeTransparency = 0.8, 
                            TextXAlignment = "Left", 
                            Position = UDim2.new(0, 0, 0, v261 * (v259.ySize or 20)), 
                            RichText = v267 or false, 
                            OnClick = v268
                        });
                        if v266 then
                            v269.TextColor3 = v266;
                        end;
                        if v255 then
                            for v270, v271 in pairs(v259) do
                                if l_CheckProperty_0(v269, v270) then
                                    v269[v270] = v271;
                                end;
                            end;
                        end;
                        if l_v251_0 == v258 then
                            v269.Parent = v141;
                            v261 = v261 + 1;
                            if v139.Delay then
                                if type(v139.Delay) == "number" then
                                    wait(v139.Delay);
                                elseif v262 % 100 == 0 then
                                    wait(0.1);
                                end;
                            end;
                        else
                            v269:Destroy();
                            break;
                        end;
                    end;
                    if v256 then
                        v141.CanvasPosition = Vector2.new(0, v260.AbsoluteContentSize.Y);
                    end;
                    l_v251_0 = nil;
                end);
                v141:SetSpecial("ResizeCanvas", function(_, v273, v274, v275, v276, _, _, v279) --[[ Line: 1006 ]]
                    -- upvalues: v139 (copy), v141 (copy)
                    local v280 = v139.xPadding or 5;
                    local v281 = v139.yPadding or 5;
                    local v282 = 0;
                    local v283 = 0;
                    if not v273 and not v274 then
                        v273 = false;
                        v274 = true;
                    end;
                    for v284, v285 in ipairs(v141:GetChildren()) do
                        if v285:IsA("GuiObject") then
                            if v274 then
                                v285.Size = UDim2.new(v285.Size.X.Scale, v285.Size.X.Offset, 0, v285.AbsoluteSize.Y);
                                v285.Position = UDim2.new(v285.Position.X.Scale, v285.Position.X.Offset, 0, v285.AbsolutePosition.Y - v141.AbsolutePosition.Y);
                            end;
                            if v273 then
                                v285.Size = UDim2.new(0, v285.AbsoluteSize.X, v285.Size.Y.Scale, v285.Size.Y.Offset);
                                v285.Position = UDim2.new(0, v285.AbsolutePosition.X - v141.AbsolutePosition.X, v285.Position.Y.Scale, v285.Position.Y.Offset);
                            end;
                            local v286 = v285.Position.Y.Offset + v285.Size.Y.Offset;
                            local v287 = v285.Position.X.Offset + v285.Size.X.Offset;
                            v282 = math.max(v282, v286);
                            v283 = math.max(v283, v287);
                            if v279 and v284 % v279 == 0 then
                                wait(0.016666666666666666);
                            end;
                        end;
                    end;
                    if v274 then
                        v141.CanvasSize = UDim2.new(v141.CanvasSize.X.Scale, v141.CanvasSize.X.Offset, 0, v282 + v281);
                    end;
                    if v273 then
                        v141.CanvasSize = UDim2.new(0, v283 + v280, v141.CanvasSize.Y.Scale, v141.CanvasSize.Y.Offset);
                    end;
                    if v275 then
                        v141.CanvasPosition = Vector2.new(v283 + v280 - v141.AbsoluteSize.X, v141.CanvasPosition.Y);
                    end;
                    if v276 then
                        v141.CanvasPosition = Vector2.new(v141.CanvasPosition.X, v282 + v281 - v141.AbsoluteSize.Y);
                    end;
                end);
                if v139.List then
                    v141:GenerateList(v139.List);
                    v139.List = nil;
                end;
            end;
        end;
        v73(v141, v139.Content or v139.Children);
        v139.Children = nil;
        v139.Content = nil;
        for v288, v289 in pairs(v139) do
            if l_CheckProperty_0(v141, v288) then
                v141[v288] = v289;
            end;
        end;
        v141.Parent = v142;
        return v24(v141, v139, v140), v139;
    end;
    v24 = function(v290, v291, _) --[[ Line: 1071 ]] --[[ Name: apiIfy ]]
        -- upvalues: v9 (ref), v24 (ref)
        local v293 = service.Wrap(v290);
        v290:SetSpecial("Object", v290);
        v290:SetSpecial("SetPosition", function(_, v295) --[[ Line: 1074 ]]
            -- upvalues: v290 (copy)
            v290.Position = v295;
        end);
        v290:SetSpecial("SetSize", function(_, v297) --[[ Line: 1075 ]]
            -- upvalues: v290 (copy)
            v290.Size = v297;
        end);
        v290:SetSpecial("Add", function(v298, v299, v300) --[[ Line: 1076 ]]
            -- upvalues: v9 (ref), v290 (copy), v24 (ref)
            if not v300 then
                v300 = v299;
                v299 = v298;
            end;
            local v301 = v9(v299, v300);
            v301.Parent = v290;
            return v24(v301, v300, v299);
        end);
        v290:SetSpecial("Copy", function(_, v303, v304) --[[ Line: 1083 ]]
            -- upvalues: v291 (copy), v9 (ref), v290 (copy), v24 (ref)
            local v305 = {};
            local v306 = nil;
            for v307, v308 in pairs(v291) do
                v305[v307] = v308;
            end;
            for v309, v310 in pairs(v304) do
                v305[v309] = v310;
            end;
            v306 = v9(v303 or v291.Class or v290.ClassName, v305);
            v306.Parent = v304.Parent or v290.Parent;
            return v24(v306, v291, v303);
        end);
        return v293;
    end;
    v12 = function() --[[ Line: 1103 ]] --[[ Name: doClose ]]
        -- upvalues: v66 (ref), l_OnClose_0 (copy), l_gTable_0 (copy)
        if not v66 then
            v66 = true;
            if l_OnClose_0 then
                local _, l_result_0 = pcall(l_OnClose_0);
                if l_result_0 then
                    warn(l_result_0);
                end;
            end;
            l_gTable_0:Destroy();
        end;
    end;
    v14 = function() --[[ Line: 1118 ]] --[[ Name: isVisible ]]
        -- upvalues: l_Main_0 (copy)
        return l_Main_0.Visible;
    end;
    local l_TextLabel_0 = l_Hide_0:FindFirstChild("TextLabel");
    v11 = function(v314) --[[ Line: 1123 ]] --[[ Name: doHide ]]
        -- upvalues: l_Hide_0 (copy), l_Main_0 (copy), v13 (ref), l_Drag_0 (copy), l_TextLabel_0 (copy), l_gTable_0 (copy), l_OnMinimize_0 (copy), l_Walls_0 (copy), v17 (ref)
        local l_LineHeight_0 = l_Hide_0.LineHeight;
        if v314 or v314 == nil and l_Main_0.Visible then
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
        elseif v314 == false or v314 == nil and not l_Main_0.Visible then
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
    v20 = function(v316, v317, v318) --[[ Line: 1164 ]] --[[ Name: isInFrame ]]
        if v318.AbsolutePosition.X < v316 and v316 < v318.AbsolutePosition.X + v318.AbsoluteSize.X and v318.AbsolutePosition.Y < v317 and v317 < v318.AbsolutePosition.Y + v318.AbsoluteSize.Y then
            return true;
        else
            return false;
        end;
    end;
    v17 = function() --[[ Line: 1172 ]] --[[ Name: wallPosition ]]
        -- upvalues: l_gTable_0 (copy), l_Drag_0 (copy), l_Object_0 (copy), l_Main_0 (copy)
        if l_gTable_0.Active then
            local l_X_0 = l_Drag_0.AbsolutePosition.X;
            local l_Y_0 = l_Drag_0.AbsolutePosition.Y;
            local l_X_1 = l_Drag_0.AbsoluteSize.X;
            local l_X_2 = l_Object_0.AbsoluteSize.X;
            local l_Y_1 = l_Object_0.AbsoluteSize.Y;
            local v324 = l_Main_0.Visible and l_Main_0.AbsoluteSize.Y or l_Drag_0.AbsoluteSize.Y;
            if l_X_0 < 0 then
                l_Drag_0.Position = UDim2.new(0, 0, l_Drag_0.Position.Y.Scale, l_Drag_0.Position.Y.Offset);
            end;
            if l_Y_0 < 0 then
                l_Drag_0.Position = UDim2.new(l_Drag_0.Position.X.Scale, l_Drag_0.Position.X.Offset, 0, 0);
            end;
            if l_X_2 < l_X_0 + l_X_1 then
                l_Drag_0.Position = UDim2.new(0, l_Object_0.AbsoluteSize.X - l_Drag_0.AbsoluteSize.X, l_Drag_0.Position.Y.Scale, l_Drag_0.Position.Y.Offset);
            end;
            if l_Y_1 < l_Y_0 + v324 then
                l_Drag_0.Position = UDim2.new(l_Drag_0.Position.X.Scale, l_Drag_0.Position.X.Offset, 0, l_Object_0.AbsoluteSize.Y - v324);
            end;
        end;
    end;
    v21 = function(v325) --[[ Line: 1196 ]] --[[ Name: setSize ]]
        -- upvalues: l_Drag_0 (copy), l_Main_0 (copy)
        if v325 and type(v325) == "table" then
            if v325[1] < 50 then
                v325[1] = 50;
            end;
            if v325[2] < 50 then
                v325[2] = 50;
            end;
            l_Drag_0.Size = UDim2.new(0, v325[1], l_Drag_0.Size.Y.Scale, l_Drag_0.Size.Y.Offset);
            l_Main_0.Size = UDim2.new(1, 0, 0, v325[2]);
        end;
    end;
    v18 = function(v326) --[[ Line: 1206 ]] --[[ Name: setPosition ]]
        -- upvalues: l_Drag_0 (copy), l_Size_0 (copy), l_Main_0 (copy)
        if v326 and typeof(v326) == "UDim2" then
            l_Drag_0.Position = v326;
            return;
        elseif v326 and type(v326) == "table" then
            l_Drag_0.Position = UDim2.new(0, v326[1], 0, v326[2]);
            return;
        else
            if l_Size_0 and not v326 then
                l_Drag_0.Position = UDim2.new(0.5, -l_Drag_0.AbsoluteSize.X / 2, 0.5, -l_Main_0.AbsoluteSize.Y / 2);
            end;
            return;
        end;
    end;
    v22 = function(v327) --[[ Line: 1216 ]] --[[ Name: setMinSize ]]
        -- upvalues: v63 (ref)
        if v327 and type(v327) == "table" then
            v63 = v327;
        end;
    end;
    v23 = function(v328) --[[ Line: 1222 ]] --[[ Name: setMaxSize ]]
        -- upvalues: v64 (ref)
        if v328 and type(v328) == "table" then
            v64 = v328;
        end;
    end;
    if l_Name_0 then
        l_gTable_0.Name = l_Name_0;
        if v31.AllowMultiple ~= nil and v31.AllowMultiple == false then
            local v329, _ = client.UI.Get(l_Name_0, l_Object_0, true);
            if v329 then
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
        l_Icon_2.Visible = true;
        l_Icon_2.Image = l_Icon_0;
        l_Icon_2.Size = UDim2.new(0, 16, 0, 16);
        l_Icon_2.Position = UDim2.new(0, 6, 0, 5);
        l_Icon_2.ImageTransparency = 0;
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
        l_Drag_0.DragStopped:Connect(function() --[[ Line: 1283 ]]
            -- upvalues: v17 (ref)
            v17();
        end);
    end;
    if l_OnRefresh_0 then
        local v331 = false;
        v15 = function() --[[ Line: 1290 ]] --[[ Name: DoRefresh ]]
            -- upvalues: v68 (ref), l_gTable_0 (copy), l_Spinner_0 (copy), l_OnRefresh_0 (copy)
            if not v68 then
                local v332 = false;
                v68 = true;
                do
                    local l_v332_0 = v332;
                    spawn(function() --[[ Line: 1295 ]]
                        -- upvalues: l_gTable_0 (ref), l_v332_0 (ref), l_Spinner_0 (ref)
                        while l_gTable_0.Active and not l_v332_0 do
                            for v334 = 0, 180, 10 do
                                l_Spinner_0.Rotation = -v334;
                                wait(0.016666666666666666);
                            end;
                        end;
                    end);
                    l_OnRefresh_0();
                    wait(1);
                    l_v332_0 = true;
                    v68 = false;
                end;
            end;
        end;
        do
            local l_v331_0 = v331;
            l_Refresh_0.MouseButton1Down:Connect(function() --[[ Line: 1311 ]]
                -- upvalues: l_v331_0 (ref), v15 (ref)
                if not l_v331_0 then
                    l_v331_0 = true;
                    v15();
                    l_v331_0 = false;
                end;
            end);
            l_Title_1.Size = UDim2.new(1, -130, l_Title_1.Size.Y.Scale, l_Title_1.Size.Y.Offset);
        end;
    else
        l_Refresh_0.Visible = false;
    end;
    if l_IconClicked_0 then
        l_Icon_2.MouseButton1Down(function() --[[ Line: 1325 ]]
            -- upvalues: l_IconClicked_0 (copy), v31 (copy), l_Object_0 (copy), l_Icon_2 (copy)
            l_IconClicked_0(v31, l_Object_0, l_Icon_2);
        end);
    end;
    if l_Menu_0 then
        v31.Menu.Text = "";
        v31.Menu.Parent = l_Main_0;
        v31.Menu.Size = UDim2.new(1, -10, 0, 25);
        v31.Menu.Position = UDim2.new(0, 5, 0, 25);
        l_ScrollingFrame_0.Size = UDim2.new(1, -10, 1, -55);
        l_ScrollingFrame_0.Position = UDim2.new(0, 5, 0, 50);
        v31.Menu.BackgroundColor3 = Color3.fromRGB(216, 216, 216);
        v31.Menu.BorderSizePixel = 0;
        v9("TextLabel", v31.Menu);
    end;
    if not v59 then
        local l_X_3 = l_Drag_0.AbsolutePosition.X;
        local l_Y_2 = l_Drag_0.AbsolutePosition.Y;
        local l_X_4 = l_Drag_0.AbsoluteSize.X;
        local l_Y_3 = l_Drag_0.AbsoluteSize.Y;
        local _ = client.Variables;
        local v341 = nil;
        local v342 = nil;
        local v343 = nil;
        do
            local l_l_X_3_0, l_l_Y_2_0, l_l_X_4_0, l_l_Y_3_0, l_v341_0, l_v342_0, l_v343_0 = l_X_3, l_Y_2, l_X_4, l_Y_3, v341, v342, v343;
            local function _(v351) --[[ Line: 1352 ]] --[[ Name: readify ]]
                -- upvalues: l_v343_0 (ref)
                v351.MouseEnter:Connect(function() --[[ Line: 1353 ]]
                    -- upvalues: l_v343_0 (ref), v351 (copy)
                    l_v343_0 = v351;
                end);
                v351.MouseLeave:Connect(function() --[[ Line: 1357 ]]
                    -- upvalues: l_v343_0 (ref), v351 (copy)
                    if l_v343_0 == v351 then
                        l_v343_0 = nil;
                    end;
                end);
            end;
            v19 = function(v353, v354) --[[ Line: 1377 ]] --[[ Name: checkMouse ]]
                -- upvalues: l_gTable_0 (copy), l_Main_0 (copy), v20 (ref), l_Drag_0 (copy), l_ScrollingFrame_0 (copy), l_v342_0 (ref), l_v341_0 (ref), l_TopRight_0 (copy), v8 (ref), l_TopLeft_0 (copy), l_RightCorner_0 (copy), l_LeftCorner_0 (copy), l_RightSide_0 (copy), l_LeftSide_0 (copy), l_Bottom_0 (copy), l_Top_0 (copy), l_l_LocalPlayer_0_Mouse_0 (copy), l_Icon_1 (ref)
                if l_gTable_0.Active and l_Main_0.Visible then
                    if v20(v353, v354, l_Drag_0) or v20(v353, v354, l_ScrollingFrame_0) then
                        l_v342_0 = nil;
                        l_v341_0 = nil;
                    elseif v20(v353, v354, l_TopRight_0) then
                        l_v342_0 = "TopRight";
                        l_v341_0 = v8.TopRight;
                    elseif v20(v353, v354, l_TopLeft_0) then
                        l_v342_0 = "TopLeft";
                        l_v341_0 = v8.TopLeft;
                    elseif v20(v353, v354, l_RightCorner_0) then
                        l_v342_0 = "RightCorner";
                        l_v341_0 = v8.RightCorner;
                    elseif v20(v353, v354, l_LeftCorner_0) then
                        l_v342_0 = "LeftCorner";
                        l_v341_0 = v8.LeftCorner;
                    elseif v20(v353, v354, l_RightSide_0) then
                        l_v342_0 = "RightSide";
                        l_v341_0 = v8.Horizontal;
                    elseif v20(v353, v354, l_LeftSide_0) then
                        l_v342_0 = "LeftSide";
                        l_v341_0 = v8.Horizontal;
                    elseif v20(v353, v354, l_Bottom_0) then
                        l_v342_0 = "Bottom";
                        l_v341_0 = v8.Vertical;
                    elseif v20(v353, v354, l_Top_0) then
                        l_v342_0 = "Top";
                        l_v341_0 = v8.Vertical;
                    else
                        l_v342_0 = nil;
                        l_v341_0 = nil;
                    end;
                else
                    l_v342_0 = nil;
                end;
                if not client.Variables.MouseLockedBy or client.Variables.MouseLockedBy == l_gTable_0 then
                    if l_v342_0 and l_v341_0 then
                        l_l_LocalPlayer_0_Mouse_0.Icon = l_v341_0;
                        client.Variables.MouseLockedBy = l_gTable_0;
                        return;
                    elseif client.Variables.MouseLockedBy == l_gTable_0 then
                        l_l_LocalPlayer_0_Mouse_0.Icon = l_Icon_1;
                        client.Variables.MouseLockedBy = nil;
                    end;
                end;
            end;
            local function v357(v355, v356) --[[ Line: 1425 ]] --[[ Name: inputStart ]]
                -- upvalues: v19 (ref), l_gTable_0 (copy), l_v342_0 (ref), v67 (ref), v20 (ref), l_ScrollingFrame_0 (copy), l_Drag_0 (copy), l_l_X_3_0 (ref), l_l_Y_2_0 (ref), l_l_X_4_0 (ref), l_l_Y_3_0 (ref), l_Main_0 (copy)
                v19(v355, v356);
                if l_gTable_0.Active and l_v342_0 and not v67 and not v20(v355, v356, l_ScrollingFrame_0) and not v20(v355, v356, l_Drag_0) then
                    v67 = l_v342_0;
                    l_l_X_3_0 = l_Drag_0.AbsolutePosition.X;
                    l_l_Y_2_0 = l_Drag_0.AbsolutePosition.Y;
                    l_l_X_4_0 = l_Drag_0.AbsoluteSize.X;
                    l_l_Y_3_0 = l_Main_0.AbsoluteSize.Y;
                end;
            end;
            local function v358() --[[ Line: 1436 ]] --[[ Name: inputEnd ]]
                -- upvalues: l_gTable_0 (copy), v67 (ref), l_OnResize_0 (copy), l_Drag_0 (copy), l_Main_0 (copy), l_l_LocalPlayer_0_Mouse_0 (copy), l_Icon_1 (ref)
                if l_gTable_0.Active then
                    if v67 and l_OnResize_0 then
                        l_OnResize_0(UDim2.new(l_Drag_0.Size.X.Scale, l_Drag_0.Size.X.Offset, l_Main_0.Size.Y.Scale, l_Main_0.Size.Y.Offset));
                    end;
                    v67 = nil;
                    l_l_LocalPlayer_0_Mouse_0.Icon = l_Icon_1;
                end;
            end;
            local function v368(v359, v360) --[[ Line: 1451 ]] --[[ Name: inputMoved ]]
                -- upvalues: l_gTable_0 (copy), l_l_LocalPlayer_0_Mouse_0 (copy), v8 (ref), l_Icon_1 (ref), v67 (ref), l_Drag_0 (copy), l_l_X_4_0 (ref), l_l_Y_3_0 (ref), l_l_X_3_0 (ref), l_l_Y_2_0 (ref), v63 (ref), v64 (ref), l_Main_0 (copy), l_Title_1 (copy), v19 (ref)
                if l_gTable_0.Active then
                    if l_l_LocalPlayer_0_Mouse_0.Icon ~= v8.TopRight and l_l_LocalPlayer_0_Mouse_0.Icon ~= v8.TopLeft and l_l_LocalPlayer_0_Mouse_0.Icon ~= v8.RightCorner and l_l_LocalPlayer_0_Mouse_0.Icon ~= v8.LeftCorner and l_l_LocalPlayer_0_Mouse_0.Icon ~= v8.Horizontal and l_l_LocalPlayer_0_Mouse_0.Icon ~= v8.Vertical then
                        l_Icon_1 = l_l_LocalPlayer_0_Mouse_0.Icon;
                    end;
                    if v67 then
                        local v361 = false;
                        local v362 = false;
                        local l_Position_1 = l_Drag_0.Position;
                        local l_v359_0 = v359;
                        local l_v360_0 = v360;
                        local l_l_l_X_4_0_0 = l_l_X_4_0;
                        local l_l_l_Y_3_0_0 = l_l_Y_3_0;
                        if v67 == "TopRight" then
                            l_l_l_X_4_0_0 = l_v359_0 - l_l_X_3_0 + 3;
                            l_l_l_Y_3_0_0 = l_l_Y_2_0 - l_v360_0 + l_l_Y_3_0 - 1;
                            v362 = true;
                        elseif v67 == "TopLeft" then
                            l_l_l_X_4_0_0 = l_l_X_3_0 - l_v359_0 + l_l_X_4_0 - 1;
                            l_l_l_Y_3_0_0 = l_l_Y_2_0 - l_v360_0 + l_l_Y_3_0 - 1;
                            v362 = true;
                            v361 = true;
                        elseif v67 == "RightCorner" then
                            l_l_l_X_4_0_0 = l_v359_0 - l_l_X_3_0 + 3;
                            l_l_l_Y_3_0_0 = l_v360_0 - l_l_Y_2_0 + 3;
                        elseif v67 == "LeftCorner" then
                            l_l_l_X_4_0_0 = l_l_X_3_0 - l_v359_0 + l_l_X_4_0 + 3;
                            l_l_l_Y_3_0_0 = l_v360_0 - l_l_Y_2_0 + 3;
                            v361 = true;
                        elseif v67 == "LeftSide" then
                            l_l_l_X_4_0_0 = l_l_X_3_0 - l_v359_0 + l_l_X_4_0 + 3;
                            l_l_l_Y_3_0_0 = l_l_Y_3_0;
                            v361 = true;
                        elseif v67 == "RightSide" then
                            l_l_l_X_4_0_0 = l_v359_0 - l_l_X_3_0 + 3;
                            l_l_l_Y_3_0_0 = l_l_Y_3_0;
                        elseif v67 == "Bottom" then
                            l_l_l_X_4_0_0 = l_l_X_4_0;
                            l_l_l_Y_3_0_0 = l_v360_0 - l_l_Y_2_0 + 3;
                        elseif v67 == "Top" then
                            l_l_l_X_4_0_0 = l_l_X_4_0;
                            l_l_l_Y_3_0_0 = l_l_Y_2_0 - l_v360_0 + l_l_Y_3_0 - 1;
                            v362 = true;
                        end;
                        if l_l_l_X_4_0_0 < v63[1] then
                            l_l_l_X_4_0_0 = v63[1];
                        end;
                        if l_l_l_Y_3_0_0 < v63[2] then
                            l_l_l_Y_3_0_0 = v63[2];
                        end;
                        if v64[1] < l_l_l_X_4_0_0 then
                            l_l_l_X_4_0_0 = v64[1];
                        end;
                        if v64[2] < l_l_l_Y_3_0_0 then
                            l_l_l_Y_3_0_0 = v64[2];
                        end;
                        if v361 then
                            l_Position_1 = UDim2.new(0, l_l_X_3_0 + l_l_X_4_0 - l_l_l_X_4_0_0, l_Position_1.Y.Scale, l_Position_1.Y.Offset);
                        end;
                        if v362 then
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
                        v19(v359, v360);
                    end;
                end;
            end;
            l_BindEvent_0(l_UserInputService_0.InputBegan, function(v369, v370) --[[ Line: 1526 ]]
                -- upvalues: v357 (copy)
                if not v370 and (v369.UserInputType == Enum.UserInputType.MouseButton1 or v369.UserInputType == Enum.UserInputType.Touch) then
                    local l_Position_2 = v369.Position;
                    v357(l_Position_2.X, l_Position_2.Y);
                end;
            end);
            l_BindEvent_0(l_UserInputService_0.InputChanged, function(v372, _) --[[ Line: 1533 ]]
                -- upvalues: v368 (copy)
                if v372.UserInputType == Enum.UserInputType.MouseMovement or v372.UserInputType == Enum.UserInputType.Touch then
                    local l_Position_3 = v372.Position;
                    v368(l_Position_3.X, l_Position_3.Y);
                end;
            end);
            l_BindEvent_0(l_UserInputService_0.InputEnded, function(v375, _) --[[ Line: 1540 ]]
                -- upvalues: v358 (copy)
                if v375.UserInputType == Enum.UserInputType.MouseButton1 or v375.UserInputType == Enum.UserInputType.Touch then
                    v358();
                end;
            end);
        end;
    else
        l_LeftResizeIcon_0.Visible = false;
        l_RightResizeIcon_0.Visible = false;
    end;
    l_Close_0.MouseButton1Down:Connect(v12);
    l_Hide_0.MouseButton1Down:Connect(function() --[[ Line: 1577 ]]
        -- upvalues: v11 (ref)
        v11();
    end);
    l_gTable_0.CustomDestroy = function() --[[ Line: 1578 ]]
        -- upvalues: l_gTable_0 (copy), l_l_LocalPlayer_0_Mouse_0 (copy), l_Icon_1 (ref), v66 (ref), l_OnClose_0 (copy), l_Object_0 (copy)
        if client.Variables.MouseLockedBy == l_gTable_0 then
            l_l_LocalPlayer_0_Mouse_0.Icon = l_Icon_1;
            client.Variables.MouseLockedBy = nil;
        end;
        if not v66 then
            v66 = true;
            if l_OnClose_0 then
                l_OnClose_0();
            end;
        end;
        service.UnWrap(l_Object_0):Destroy();
    end;
    for _, v378 in ipairs(l_Object_0:GetChildren()) do
        if v378.Name ~= "Desc" and v378.Name ~= "Drag" then
            v70[v378.Name] = v378;
            v378.Parent = nil;
        end;
    end;
    local v379 = Instance.new("BoolValue", l_Object_0);
    local v380 = false;
    local v381 = nil;
    local v382 = nil;
    v379.Name = "__ADONIS_WINDOW";
    l_BindEvent_0(l_Main_0.InputBegan, function(v383) --[[ Line: 1610 ]]
        -- upvalues: l_gTable_0 (copy), v74 (ref)
        if l_gTable_0.Active and (v383.UserInputType == Enum.UserInputType.MouseButton1 or v383.UserInputType == Enum.UserInputType.Touch) then
            v74();
        end;
    end);
    do
        local l_v380_0, l_v381_0, l_v382_0 = v380, v381, v382;
        l_BindEvent_0(l_Drag_0.InputBegan, function(v387) --[[ Line: 1616 ]]
            -- upvalues: l_gTable_0 (copy), l_v382_0 (ref), v74 (ref)
            if l_gTable_0.Active then
                l_v382_0 = true;
                if v387.UserInputType == Enum.UserInputType.MouseButton1 or v387.UserInputType == Enum.UserInputType.Touch then
                    v74();
                end;
            end;
        end);
        l_BindEvent_0(l_Drag_0.InputChanged, function(_) --[[ Line: 1626 ]]
            -- upvalues: l_gTable_0 (copy), l_v382_0 (ref)
            if l_gTable_0.Active then
                l_v382_0 = true;
            end;
        end);
        l_BindEvent_0(l_Drag_0.InputEnded, function(_) --[[ Line: 1632 ]]
            -- upvalues: l_v382_0 (ref)
            l_v382_0 = false;
        end);
        l_BindEvent_0(l_UserInputService_0.InputBegan, function(v390) --[[ Line: 1636 ]]
            -- upvalues: l_v382_0 (ref), l_Object_0 (copy), l_v380_0 (ref), l_NoDrag_0 (copy), v74 (ref), l_v381_0 (ref), l_Drag_0 (copy)
            if l_v382_0 and l_Object_0.DisplayOrder == 101 and not l_v380_0 and (v390.UserInputType == Enum.UserInputType.MouseButton1 or v390.UserInputType == Enum.UserInputType.Touch) and not l_NoDrag_0 then
                l_v380_0 = true;
                v74();
                l_v381_0 = Vector2.new(l_Drag_0.AbsolutePosition.X - v390.Position.X, l_Drag_0.AbsolutePosition.Y - v390.Position.Y);
            end;
        end);
        l_BindEvent_0(l_UserInputService_0.InputChanged, function(v391) --[[ Line: 1646 ]]
            -- upvalues: l_v380_0 (ref), l_Drag_0 (copy), l_v381_0 (ref)
            if l_v380_0 and (v391.UserInputType == Enum.UserInputType.MouseMovement or v391.UserInputType == Enum.UserInputType.Touch) then
                l_Drag_0.Position = UDim2.fromOffset(l_v381_0.X + v391.Position.X, l_v381_0.Y + v391.Position.Y);
            end;
        end);
        l_BindEvent_0(l_UserInputService_0.InputEnded, function(v392) --[[ Line: 1652 ]]
            -- upvalues: l_v380_0 (ref)
            if v392.UserInputType == Enum.UserInputType.MouseButton1 or v392.UserInputType == Enum.UserInputType.Touch then
                l_v380_0 = false;
            end;
        end);
    end;
    v379 = v24(l_ScrollingFrame_0, v31);
    v380 = v379:GetMetatable();
    v381 = v380.__newindex;
    v382 = v380.__index;
    v9("ScrollingFrame", nil, l_ScrollingFrame_0);
    v73(v379, v62);
    v379:SetSpecial("gTable", l_gTable_0);
    v379:SetSpecial("Window", l_Object_0);
    v379:SetSpecial("Main", l_Main_0);
    v379:SetSpecial("Title", l_Title_1);
    v379:SetSpecial("Dragger", l_Drag_0);
    v379:SetSpecial("Destroy", v12);
    v379:SetSpecial("Close", v12);
    v379:SetSpecial("Object", l_ScrollingFrame_0);
    v379:SetSpecial("Refresh", v15);
    v379:SetSpecial("AddTitleButton", function(v393, v394) --[[ Line: 1677 ]]
        -- upvalues: v72 (ref)
        if type(v393) == "table" and not v394 then
            v394 = v393;
        end;
        return v72(v394);
    end);
    v379:SetSpecial("Ready", function() --[[ Line: 1678 ]]
        -- upvalues: l_OnReady_0 (copy), l_gTable_0 (copy), v74 (ref)
        if l_OnReady_0 then
            l_OnReady_0();
        end;
        l_gTable_0.Ready();
        v74();
    end);
    v379:SetSpecial("BindEvent", function(_, ...) --[[ Line: 1679 ]]
        -- upvalues: l_BindEvent_0 (copy)
        return l_BindEvent_0(...);
    end);
    v379:SetSpecial("Hide", function(_, v397) --[[ Line: 1680 ]]
        -- upvalues: v11 (ref)
        v11(v397);
    end);
    v379:SetSpecial("SetTitle", function(_, v399) --[[ Line: 1681 ]]
        -- upvalues: l_Title_1 (copy)
        l_Title_1.Text = v399;
    end);
    v379:SetSpecial("SetPosition", function(_, v401) --[[ Line: 1682 ]]
        -- upvalues: v18 (ref)
        v18(v401);
    end);
    v379:SetSpecial("SetSize", function(_, v403) --[[ Line: 1683 ]]
        -- upvalues: v21 (ref)
        v21(v403);
    end);
    v379:SetSpecial("SetMinSize", function(_, v405) --[[ Line: 1684 ]]
        -- upvalues: v22 (ref)
        v22(v405);
    end);
    v379:SetSpecial("SetMaxSize", function(_, v407) --[[ Line: 1685 ]]
        -- upvalues: v23 (ref)
        v23(v407);
    end);
    v379:SetSpecial("GetPosition", function() --[[ Line: 1686 ]]
        -- upvalues: l_Drag_0 (copy)
        return l_Drag_0.AbsolutePosition;
    end);
    v379:SetSpecial("GetSize", function() --[[ Line: 1687 ]]
        -- upvalues: l_Main_0 (copy)
        return l_Main_0.AbsoluteSize;
    end);
    v379:SetSpecial("IsVisible", v14);
    v379:SetSpecial("IsClosed", v66);
    v380.__index = function(v408, v409) --[[ Line: 1691 ]]
        -- upvalues: v14 (ref), v66 (ref), v382 (copy)
        if v409 == "IsVisible" then
            return v14();
        elseif v409 == "Closed" then
            return v66;
        else
            return v382(v408, v409);
        end;
    end;
    v21(l_Size_0);
    v18(l_Position_0);
    if l_Ready_0 then
        l_gTable_0:Ready();
        v74();
    end;
    return v379, l_Object_0;
end;