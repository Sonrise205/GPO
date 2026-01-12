local v0 = Color3.new(0.12156862745098039, 0.12156862745098039, 0.12156862745098039);
local v1 = Color3.new(0.10588235294117647, 0.16470588235294117, 0.20784313725490197);
local v2 = UDim2.new(0, 5, 0, 5);
local v3 = UDim2.new(0, 0, 0, 0);
local v4 = Color3.new(1, 1, 1);
local v5 = UDim2.new(1, -10, 1, -10);
local v6 = Color3.fromRGB(178, 178, 178);
local v7 = {
    Horizontal = "rbxassetid://1243146213", 
    Vertical = "rbxassetid://1243145985", 
    LeftCorner = "rbxassetid://1243145459", 
    RightCorner = "rbxassetid://1243145350", 
    TopRight = "rbxassetid://1243145459", 
    TopLeft = "rbxassetid://1243145350"
};
local v8 = nil;
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
client = nil;
Pcall = nil;
Routine = nil;
service = nil;
GetEnv = nil;
local function v23(v22) --[[ Line: 146 ]] --[[ Name: isGui ]]
    return v22:IsA("GuiObject");
end;
return function(v24, v25) --[[ Line: 151 ]]
    -- upvalues: v9 (ref), v15 (ref), v8 (ref), v1 (copy), v3 (copy), v0 (copy), v6 (copy), v4 (copy), v5 (copy), v2 (copy), v23 (copy), v21 (ref), v11 (ref), v13 (ref), v12 (ref), v16 (ref), v10 (ref), v19 (ref), v20 (ref), v17 (ref), v14 (ref), v7 (copy), v18 (ref)
    if v25 then
        setfenv(1, v25);
    end;
    local l_LocalPlayer_0 = service.Players.LocalPlayer;
    local l_l_LocalPlayer_0_Mouse_0 = l_LocalPlayer_0:GetMouse();
    local l_UserInputService_0 = service.UserInputService;
    local _ = v24.gIndex;
    local l_gTable_0 = v24.gTable;
    local l_BindEvent_0 = l_gTable_0.BindEvent;
    local l_Object_0 = l_gTable_0.Object;
    local l_Name_0 = v24.Name;
    local l_Icon_0 = v24.Icon;
    local l_Size_0 = v24.Size;
    local l_Menu_0 = v24.Menu;
    local l_Title_0 = v24.Title;
    local l_Ready_0 = v24.Ready;
    local l_Walls_0 = v24.Walls;
    local l_NoHide_0 = v24.NoHide;
    local l_NoClose_0 = v24.NoClose;
    local l_OnReady_0 = v24.OnReady;
    local l_OnClose_0 = v24.OnClose;
    local l_OnResize_0 = v24.OnResize;
    local l_OnRefresh_0 = v24.OnRefresh;
    local l_OnMinimize_0 = v24.OnMinimize;
    local _ = v24.ContextMenu;
    local l_ResetOnSpawn_0 = v24.ResetOnSpawn;
    local l_CanKeepAlive_0 = v24.CanKeepAlive;
    local l_IconClicked_0 = v24.IconClicked;
    local v51 = v24.SizeLocked or v24.SizeLock;
    local l_CanvasSize_0 = v24.CanvasSize;
    local l_Position_0 = v24.Position;
    local v54 = v24.Content or v24.Children;
    local v55 = v24.MinSize or {
        150, 
        50
    };
    local v56 = v24.MaxSize or {
        math.huge, 
        math.huge
    };
    local l_Icon_1 = l_l_LocalPlayer_0_Mouse_0.Icon;
    local v58 = false;
    local v59 = false;
    local v60 = false;
    local l_CheckProperty_0 = service.CheckProperty;
    local v62 = {};
    local v63 = nil;
    local v64 = nil;
    local v65 = nil;
    local v66 = nil;
    local v67 = nil;
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
    v9 = function(v88, v89, v90) --[[ Line: 223 ]] --[[ Name: Expand ]]
        -- upvalues: v63 (ref)
        local l_Label_0 = v89:FindFirstChild("Label");
        if l_Label_0 then
            v88.MouseLeave:Connect(function(_, _) --[[ Line: 227 ]]
                -- upvalues: v63 (ref), v88 (copy), v89 (copy)
                if v63 == v88 then
                    v89.Visible = false;
                end;
            end);
            v88.MouseMoved:Connect(function(v94, v95) --[[ Line: 233 ]]
                -- upvalues: v63 (ref), v88 (copy), v90 (copy), l_Label_0 (copy), v89 (copy)
                v63 = v88;
                local v96 = v90 or v88.Desc.Value;
                l_Label_0.Text = v96;
                local _ = l_Label_0.ContentText;
                local v98 = 500;
                local l_X_0 = service.TextService:GetTextSize(v96 or v88.Desc.Value, l_Label_0.TextSize, l_Label_0.Font, Vector2.new(1000, 1000)).X;
                local v100 = math.floor(l_X_0 / 500) + 1;
                if v100 < 1 then
                    v100 = 1;
                end;
                if l_X_0 < 500 then
                    v98 = l_X_0;
                end;
                v89.Size = UDim2.new(0, v98 + 10, 0, v100 * 20 + 10);
                v89.Position = UDim2.new(0, v94 + 6, 0, v95 - 40 - (v100 * 20 + 10));
                v89.Visible = v96 ~= "";
            end);
        end;
    end;
    v15 = function(v101) --[[ Line: 255 ]] --[[ Name: getNextPos ]]
        -- upvalues: l_CheckProperty_0 (copy)
        local v102 = nil;
        local v103 = nil;
        for _, v105 in next, v101:GetChildren() do
            if l_CheckProperty_0(v105, "Size") then
                if not v102 or v105.AbsolutePosition.X + v105.AbsoluteSize.X > v102.AbsolutePosition.X + v102.AbsoluteSize.X then
                    v102 = v105;
                end;
                if not v103 or v105.AbsolutePosition.Y + v105.AbsoluteSize.Y > v102.AbsolutePosition.Y + v102.AbsoluteSize.Y then
                    v103 = v105;
                end;
            end;
        end;
        return not (v102 and v103) and UDim2.new(0, 0, 0, 0) or UDim2.new(v102.Position.X.Scale, v102.Position.X.Offset + v102.AbsoluteSize.X, v103.Position.Y.Scale, v103.Position.Y.Offset + v103.AbsoluteSize.Y);
    end;
    v65 = function(v106, v107) --[[ Line: 272 ]] --[[ Name: LoadChildren ]]
        -- upvalues: v67 (ref), v8 (ref)
        if v107 then
            local v108 = v107.RunWhenDone and v67(v107.RunWhenDone, v106);
            for v109, v110 in next, v107 do
                if type(v110) == "table" then
                    if not v110.Parent then
                        v110.Parent = v106;
                    end;
                    v8(v110.Class or v110.ClassName or v109, v110);
                elseif type(v110) == "function" or type(v110) == "string" and not v108 then
                    v108 = v67(v110, v106);
                end;
            end;
            if v108 then
                v108(v106);
            end;
        end;
    end;
    v66 = function() --[[ Line: 290 ]] --[[ Name: BringToFront ]]
        -- upvalues: l_LocalPlayer_0 (copy), l_Object_0 (copy)
        for _, v112 in ipairs(l_LocalPlayer_0.PlayerGui:GetChildren()) do
            if v112:FindFirstChild("__ADONIS_WINDOW") then
                v112.DisplayOrder = 100;
            end;
        end;
        l_Object_0.DisplayOrder = 101;
    end;
    v64 = function(v113) --[[ Line: 300 ]] --[[ Name: addTitleButton ]]
        -- upvalues: l_Hide_0 (copy), l_Close_0 (copy), l_Refresh_0 (copy), l_Drag_0 (copy), v8 (ref)
        local v114 = 1;
        local v115 = nil;
        local l_l_Hide_0_0 = l_Hide_0;
        if l_Hide_0.Visible then
            v114 = v114 + 1;
        end;
        if l_Close_0.Visible then
            v114 = v114 + 1;
        end;
        if l_Refresh_0.Visible then
            v114 = v114 + 1;
        end;
        v115 = UDim2.new(1, -(v114 * 30 + 5 + (v114 - 1)), 0, 0);
        v113.Position = v113.Position or v115;
        v113.Size = v113.Size or l_l_Hide_0_0.Size;
        v113.BackgroundColor3 = v113.BackgroundColor3 or l_l_Hide_0_0.BackgroundColor3;
        v113.BackgroundTransparency = v113.BackgroundTransparency or l_l_Hide_0_0.BackgroundTransparency;
        v113.BorderSizePixel = v113.BorderSizePixel or l_l_Hide_0_0.BorderSizePixel;
        v113.ZIndex = v113.ZIndex or l_l_Hide_0_0.ZIndex;
        v113.TextColor3 = v113.TextColor3 or l_l_Hide_0_0.TextColor3;
        v113.TextScaled = v113.TextScaled or l_l_Hide_0_0.TextScaled;
        v113.TextStrokeColor3 = v113.TextStrokeColor3 or l_l_Hide_0_0.TextStrokeColor3;
        v113.TextSize = v113.TextSize or l_l_Hide_0_0.TextSize;
        v113.TextTransparency = v113.TextTransparency or l_l_Hide_0_0.TextTransparency;
        v113.TextStrokeTransparency = v113.TextStrokeTransparency or l_l_Hide_0_0.TextStrokeTransparency;
        v113.TextScaled = v113.TextScaled or l_l_Hide_0_0.TextScaled;
        v113.TextWrapped = v113.TextWrapped or l_l_Hide_0_0.TextWrapped;
        v113.Font = v113.Font or l_l_Hide_0_0.Font;
        v113.Parent = l_Drag_0;
        return v8("TextButton", v113);
    end;
    v67 = function(v117, v118) --[[ Line: 341 ]] --[[ Name: functionify ]]
        if type(v117) == "string" then
            if v118 then
                local v119 = GetEnv();
                v119.Object = v118;
                return client.Core.LoadCode(v117, v119);
            else
                return client.Core.LoadCode(v117);
            end;
        else
            return v117;
        end;
    end;
    v8 = function(v120, v121, v122) --[[ Line: 355 ]] --[[ Name: create ]]
        -- upvalues: v62 (copy), l_CheckProperty_0 (copy), v1 (ref), v3 (ref), v0 (ref), v6 (ref), v4 (ref), v5 (ref), v2 (ref), v67 (ref), l_BindEvent_0 (copy), v9 (ref), l_Desc_0 (copy), l_l_LocalPlayer_0_Mouse_0 (copy), v8 (ref), l_Object_0 (copy), v15 (ref), v23 (ref), v65 (ref), v21 (ref)
        local v123 = v121 or {};
        local v124 = v123.Class or v123.ClassName or v120;
        local v125 = v122 or v62[v124] and v62[v124]:Clone() or service.New(v124);
        local v126 = v123.Parent or v125.Parent;
        if v121 then
            v123.Parent = nil;
            if v123.Class or v123.ClassName then
                v123.Class = nil;
                v123.ClassName = nil;
            end;
            if not v123.BorderColor3 and l_CheckProperty_0(v125, "BorderColor3") then
                v125.BorderColor3 = v1;
            end;
            if not v123.CanvasSize and l_CheckProperty_0(v125, "CanvasSize") then
                v125.CanvasSize = v3;
            end;
            if not v123.BorderSizePixel and l_CheckProperty_0(v125, "BorderSizePixel") then
                v125.BorderSizePixel = 0;
            end;
            if not v123.BackgroundColor3 and l_CheckProperty_0(v125, "BackgroundColor3") then
                v125.BackgroundColor3 = v0;
            end;
            if not v123.PlaceholderColor3 and l_CheckProperty_0(v125, "PlaceholderColor3") then
                v125.PlaceholderColor3 = v6;
            end;
            if not v123.Transparency and not v123.BackgroundTransparency and l_CheckProperty_0(v125, "Transparency") then
                v125.BackgroundTransparency = 0;
            elseif v123.Transparency then
                v125.BackgroundTransparency = v123.Transparency;
            end;
            if not v123.TextColor3 and not v123.TextColor and l_CheckProperty_0(v125, "TextColor3") then
                v125.TextColor3 = v4;
            elseif v123.TextColor then
                v125.TextColor3 = v123.TextColor;
            end;
            if not v123.Font and l_CheckProperty_0(v125, "Font") then
                v123.Font = "SourceSans";
            end;
            if not v123.TextSize and l_CheckProperty_0(v125, "TextSize") then
                v123.TextSize = 16;
            end;
            if not v123.BottomImage and not v123.MidImage and not v123.TopImage and v124 == "ScrollingFrame" then
                v125.BottomImage = "http://roblox.com/asset?id=158348114";
                v125.MidImage = "http://roblox.com/asset?id=158348114";
                v125.TopImage = "http://roblox.com/asset?id=158348114";
            end;
            if not v123.Size and l_CheckProperty_0(v125, "Size") then
                v125.Size = v5;
            end;
            if not v123.Position and l_CheckProperty_0(v125, "Position") then
                v125.Position = v2;
            end;
            if not v123.ZIndex and l_CheckProperty_0(v125, "ZIndex") then
                v125.ZIndex = 2;
                if v126 and l_CheckProperty_0(v126, "ZIndex") then
                    v125.ZIndex = v126.ZIndex;
                end;
            end;
            if v123.TextChanged and v124 == "TextBox" then
                local v127 = v67(v123.TextChanged, v125);
                local l_v127_0 = v127 --[[ copy: 7 -> 45 ]];
                v125.FocusLost:Connect(function(v129) --[[ Line: 432 ]]
                    -- upvalues: l_v127_0 (copy), v125 (copy)
                    l_v127_0(v125.Text, v129, v125);
                end);
            end;
            if (v123.OnClicked or v123.OnClick) and (v124 == "TextButton" or v124 == "ImageButton") then
                local v130 = false;
                local l_Debounce_0 = v123.Debounce;
                local v132 = v67(v123.OnClicked or v123.OnClick, v125);
                local l_l_Debounce_0_0 = l_Debounce_0 --[[ copy: 8 -> 43 ]];
                local l_v132_0 = v132 --[[ copy: 9 -> 44 ]];
                do
                    local l_v130_0 = v130;
                    v125.MouseButton1Down:Connect(function() --[[ Line: 441 ]]
                        -- upvalues: l_v130_0 (ref), l_l_Debounce_0_0 (copy), l_v132_0 (copy), v125 (copy)
                        if not l_v130_0 then
                            if l_l_Debounce_0_0 then
                                l_v130_0 = true;
                            end;
                            l_v132_0(v125);
                            l_v130_0 = false;
                        end;
                    end);
                end;
            end;
            if v123.Events then
                for v136, v137 in pairs(v123.Events) do
                    local v138 = v67(v137, v125);
                    l_BindEvent_0(v125[v136], function(...) --[[ Line: 457 ]]
                        -- upvalues: v138 (copy)
                        v138(...);
                    end);
                end;
            end;
            if v123.Visible == nil then
                v123.Visible = true;
            end;
            if v123.LabelProps then
                v123.LabelProperties = v123.LabelProps;
            end;
        end;
        if v124 == "Entry" then
            local l_Text_0 = v125.Text;
            local l_Dots_0 = v125.Dots;
            local _ = v125.Desc;
            l_Text_0.ZIndex = v123.ZIndex or v125.ZIndex;
            l_Dots_0.ZIndex = v123.ZIndex or v125.ZIndex;
            if v123.Text then
                v125.Text.Text = v123.Text;
                v125.Text.Visible = true;
                v123.Text = nil;
            end;
            if v123.Desc or v123.ToolTip then
                v125.Desc.Value = v123.Desc or v123.ToolTip;
                v123.Desc = nil;
            end;
            v9(v125, l_Desc_0);
        elseif v123.ToolTip then
            v9(v125, l_Desc_0, v123.ToolTip);
        end;
        if v124 == "ButtonEntry" then
            local l_Button_0 = v125.Button;
            local v143 = false;
            local v144 = v67(v123.OnClicked, l_Button_0);
            local l_v144_0 = v144 --[[ copy: 9 -> 41 ]];
            local l_l_Button_0_0 = l_Button_0 --[[ copy: 7 -> 42 ]];
            do
                local l_v143_0 = v143;
                v125:SetSpecial("DoClick", function() --[[ Line: 503 ]]
                    -- upvalues: l_v143_0 (ref), l_v144_0 (copy), l_l_Button_0_0 (copy)
                    if not l_v143_0 then
                        l_v143_0 = true;
                        if l_v144_0 then
                            l_v144_0(l_l_Button_0_0);
                        end;
                        l_v143_0 = false;
                    end;
                end);
                v125.Text = v123.Text or v125.Text;
                l_Button_0.ZIndex = v123.ZIndex or v125.ZIndex;
                l_Button_0.MouseButton1Down:Connect(v125.DoClick);
            end;
        end;
        if v124 == "Boolean" then
            local l_Enabled_0 = v123.Enabled;
            local v149 = false;
            local v150 = v67(v123.OnToggle, v125);
            local l_v150_0 = v150 --[[ copy: 9 -> 39 ]];
            do
                local l_l_Enabled_0_0, l_v149_0 = l_Enabled_0, v149;
                local function v155(v154) --[[ Line: 522 ]] --[[ Name: toggle ]]
                    -- upvalues: l_v149_0 (ref), l_l_Enabled_0_0 (ref), v125 (copy), l_v150_0 (copy)
                    if not l_v149_0 then
                        l_v149_0 = true;
                        if v154 ~= nil and v154 or v154 == nil and l_l_Enabled_0_0 then
                            l_l_Enabled_0_0 = false;
                            v125.Text = "Disabled";
                        elseif v154 ~= nil and v154 == false or v154 == nil and not l_l_Enabled_0_0 then
                            l_l_Enabled_0_0 = true;
                            v125.Text = "Enabled";
                        end;
                        if l_v150_0 then
                            l_v150_0(l_l_Enabled_0_0, v125);
                        end;
                        l_v149_0 = false;
                    end;
                end;
                v125.Text = l_l_Enabled_0_0 and "Enabled" or "Disabled";
                local l_v155_0 = v155 --[[ copy: 10 -> 40 ]];
                v125.MouseButton1Down:Connect(function() --[[ Line: 542 ]]
                    -- upvalues: l_v150_0 (copy), l_v155_0 (copy)
                    if l_v150_0 then
                        l_v155_0();
                    end;
                end);
                v125:SetSpecial("Toggle", function(_, v158) --[[ Line: 548 ]]
                    -- upvalues: l_v155_0 (copy)
                    l_v155_0(v158);
                end);
            end;
        end;
        if v124 == "StringEntry" then
            local l_Box_0 = v125.Box;
            local v160 = nil;
            v125.Text = v123.Text or v125.Text;
            l_Box_0.ZIndex = v123.ZIndex or v125.ZIndex;
            if v123.BoxText then
                l_Box_0.Text = v123.BoxText;
            end;
            if v123.BoxProperties then
                for v161, v162 in next, v123.BoxProperties do
                    if l_CheckProperty_0(l_Box_0, v161) then
                        l_Box_0[v161] = v162;
                    end;
                end;
            end;
            do
                local l_v160_0 = v160;
                if v123.TextChanged then
                    local v164 = v67(v123.TextChanged, l_Box_0);
                    local l_v164_0 = v164 --[[ copy: 9 -> 37 ]];
                    local l_l_Box_0_0 = l_Box_0 --[[ copy: 7 -> 38 ]];
                    l_Box_0.Changed:Connect(function(v167) --[[ Line: 572 ]]
                        -- upvalues: l_v160_0 (ref), l_v164_0 (copy), l_l_Box_0_0 (copy)
                        if v167 == "Text" and not l_v160_0 then
                            l_v164_0(l_l_Box_0_0.Text);
                        end;
                    end);
                    l_Box_0.FocusLost:Connect(function(v168) --[[ Line: 578 ]]
                        -- upvalues: l_v164_0 (copy), l_l_Box_0_0 (copy), l_v160_0 (ref)
                        local v169 = l_v164_0(l_l_Box_0_0.Text, true, v168);
                        if v169 then
                            l_v160_0 = true;
                            l_l_Box_0_0.Text = v169;
                            l_v160_0 = false;
                        end;
                    end);
                end;
                local l_l_Box_0_1 = l_Box_0 --[[ copy: 7 -> 36 ]];
                v125:SetSpecial("SetValue", function(_, v172) --[[ Line: 588 ]]
                    -- upvalues: l_l_Box_0_1 (copy)
                    l_l_Box_0_1.Text = v172;
                end);
            end;
        end;
        if v124 == "Slider" then
            local l_Percentage_0 = v125.Percentage;
            local l_Slider_0 = v125.Slider;
            local l_SliderBar_0 = v125.SliderBar;
            local l_Drag_1 = v125.Drag;
            local v177 = false;
            local v178 = 0;
            local v179 = v67(v123.OnSlide, v125);
            l_SliderBar_0.ZIndex = v123.ZIndex or v125.ZIndex;
            l_Slider_0.ZIndex = l_SliderBar_0.ZIndex + 1;
            l_Drag_1.ZIndex = l_Slider_0.ZIndex + 1;
            l_Drag_1.Active = true;
            if v123.Value then
                l_Slider_0.Position = UDim2.new(0.5, -10, 0.5, -10);
                l_Drag_1.Position = l_Slider_0.Position;
            end;
            local l_l_Slider_0_0 = l_Slider_0 --[[ copy: 8 -> 32 ]];
            local l_l_Drag_1_0 = l_Drag_1 --[[ copy: 10 -> 33 ]];
            local l_l_Percentage_0_0 = l_Percentage_0 --[[ copy: 7 -> 34 ]];
            local l_v179_0 = v179 --[[ copy: 13 -> 35 ]];
            do
                local l_v177_0, l_v178_0 = v177, v178;
                l_SliderBar_0.InputBegan:Connect(function(v186) --[[ Line: 611 ]]
                    -- upvalues: l_v177_0 (ref), l_v178_0 (ref), v125 (copy), l_l_Slider_0_0 (copy), l_l_Drag_1_0 (copy), l_l_Percentage_0_0 (copy), l_v179_0 (copy)
                    if not l_v177_0 and (v186.UserInputType == Enum.UserInputType.MouseButton1 or v186.UserInputType == Enum.UserInputType.Touch) then
                        l_v178_0 = (v186.Position.X - v125.AbsolutePosition.X) / v125.AbsoluteSize.X;
                        if l_v178_0 < 0 then
                            l_v178_0 = 0;
                        elseif l_v178_0 > 1 then
                            l_v178_0 = 1;
                        end;
                        l_l_Slider_0_0.Position = UDim2.new(l_v178_0, -10, 0.5, -10);
                        l_l_Drag_1_0.Position = l_l_Slider_0_0.Position;
                        l_l_Percentage_0_0.Value = l_v178_0;
                        if l_v179_0 then
                            l_v179_0(l_v178_0);
                        end;
                    end;
                end);
                l_Drag_1.DragBegin:Connect(function() --[[ Line: 631 ]]
                    -- upvalues: l_v177_0 (ref)
                    l_v177_0 = true;
                end);
                l_Drag_1.DragStopped:Connect(function() --[[ Line: 635 ]]
                    -- upvalues: l_v177_0 (ref), l_l_Drag_1_0 (copy), l_l_Slider_0_0 (copy)
                    l_v177_0 = false;
                    l_l_Drag_1_0.Position = l_l_Slider_0_0.Position;
                end);
                l_Drag_1.Changed:Connect(function() --[[ Line: 640 ]]
                    -- upvalues: l_v177_0 (ref), l_v178_0 (ref), l_l_LocalPlayer_0_Mouse_0 (ref), v125 (copy), l_l_Slider_0_0 (copy), l_l_Percentage_0_0 (copy), l_v179_0 (copy)
                    if l_v177_0 then
                        l_v178_0 = (l_l_LocalPlayer_0_Mouse_0.X - v125.AbsolutePosition.X) / v125.AbsoluteSize.X;
                        if l_v178_0 < 0 then
                            l_v178_0 = 0;
                        elseif l_v178_0 > 1 then
                            l_v178_0 = 1;
                        end;
                        l_l_Slider_0_0.Position = UDim2.new(l_v178_0, -10, 0.5, -10);
                        l_l_Percentage_0_0.Value = l_v178_0;
                        if l_v179_0 then
                            l_v179_0(l_v178_0);
                        end;
                    end;
                end);
                v125:SetSpecial("SetValue", function(_, v188) --[[ Line: 659 ]]
                    -- upvalues: l_v178_0 (ref), l_l_Percentage_0_0 (copy), l_l_Slider_0_0 (copy), l_l_Drag_1_0 (copy)
                    if v188 and tonumber(v188) then
                        l_v178_0 = tonumber(v188);
                        l_l_Percentage_0_0.Value = l_v178_0;
                        l_l_Slider_0_0.Position = UDim2.new(l_v178_0, -10, 0.5, -10);
                        l_l_Drag_1_0.Position = l_l_Slider_0_0.Position;
                    end;
                end);
            end;
        end;
        if v124 == "Dropdown" then
            local l_Menu_1 = v125.Menu;
            local l_Down_0 = v125.Down;
            local l_dSelected_0 = v125.dSelected;
            local l_Options_0 = v123.Options;
            local v193 = v123.Selected or v123.Selection;
            local v194 = v67(v123.OnSelection or v123.OnSelect or function() --[[ Line: 675 ]]

            end);
            local l_TextProperties_0 = v123.TextProperties;
            local v196 = v8("ScrollingFrame", {
                Parent = l_Menu_1, 
                Size = UDim2.new(1, 0, 1, 0), 
                Position = UDim2.new(0, 0, 0, 0), 
                BackgroundTransparency = 1, 
                ZIndex = 100
            });
            l_Menu_1.ZIndex = v196.ZIndex;
            l_Menu_1.Parent = l_Object_0;
            l_Menu_1.Visible = false;
            l_Menu_1.Size = UDim2.new(0, v125.AbsoluteSize.X, 0, 100);
            l_Menu_1.BackgroundColor3 = v123.BackgroundColor3 or v125.BackgroundColor3;
            if v123.TextAlignment then
                l_dSelected_0.TextXAlignment = v123.TextAlignment;
                l_dSelected_0.Position = UDim2.new(0, 30, 0, 0);
            end;
            if v123.NoArrow then
                l_Down_0.Visible = false;
            end;
            v125:SetSpecial("MenuContainer", l_Menu_1);
            local l_l_Menu_1_0 = l_Menu_1 --[[ copy: 7 -> 27 ]];
            local l_l_Down_0_0 = l_Down_0 --[[ copy: 8 -> 28 ]];
            local l_l_dSelected_0_0 = l_dSelected_0 --[[ copy: 9 -> 29 ]];
            local l_l_Options_0_0 = l_Options_0 --[[ copy: 10 -> 30 ]];
            v125.Changed:Connect(function(v201) --[[ Line: 702 ]]
                -- upvalues: l_l_Menu_1_0 (copy), v125 (copy), l_l_Down_0_0 (copy), v123 (copy), l_l_dSelected_0_0 (copy), l_l_Options_0_0 (copy), v196 (copy)
                if v201 == "AbsolutePosition" and l_l_Menu_1_0.Visible then
                    l_l_Menu_1_0.Position = UDim2.new(0, v125.AbsolutePosition.X, 0, v125.AbsolutePosition.Y + v125.AbsoluteSize.Y);
                    return;
                else
                    if v201 == "AbsoluteSize" or v201 == "Parent" then
                        l_l_Down_0_0.Size = UDim2.new(0, v125.AbsoluteSize.Y, 1, 0);
                        if v123.TextAlignment == "Right" then
                            l_l_Down_0_0.Position = UDim2.new(0, 0, 0.5, -(l_l_Down_0_0.AbsoluteSize.X / 2));
                            l_l_dSelected_0_0.Position = UDim2.new(0, v125.AbsoluteSize.Y, 0, 0);
                        else
                            l_l_Down_0_0.Position = UDim2.new(1, -l_l_Down_0_0.AbsoluteSize.X, 0.5, -(l_l_Down_0_0.AbsoluteSize.X / 2));
                        end;
                        l_l_dSelected_0_0.Size = UDim2.new(1, -l_l_Down_0_0.AbsoluteSize.X, 1, 0);
                        if l_l_Options_0_0 and #l_l_Options_0_0 <= 6 then
                            l_l_Menu_1_0.Size = UDim2.new(0, v125.AbsoluteSize.X, 0, #l_l_Options_0_0 * 30);
                            return;
                        else
                            l_l_Menu_1_0.Size = UDim2.new(0, v125.AbsoluteSize.X, 0, 180);
                            v196:ResizeCanvas(false, true);
                        end;
                    end;
                    return;
                end;
            end);
            l_dSelected_0.ZIndex = v125.ZIndex;
            l_Down_0.ZIndex = v125.ZIndex;
            if l_TextProperties_0 then
                for v202, v203 in next, l_TextProperties_0 do
                    l_dSelected_0[v202] = v203;
                end;
            end;
            if l_Options_0 then
                for v204, v205 in next, l_Options_0 do
                    local v206 = v196:Add("TextButton", {
                        Text = ("  %*"):format(v205), 
                        Size = UDim2.new(1, -10, 0, 30), 
                        Position = UDim2.new(0, 5, 0, 30 * (v204 - 1)), 
                        ZIndex = l_Menu_1.ZIndex, 
                        BackgroundTransparency = 1, 
                        OnClick = function() --[[ Line: 742 ]] --[[ Name: OnClick ]]
                            -- upvalues: l_dSelected_0 (copy), v205 (copy), v194 (copy), v125 (copy), l_Menu_1 (copy)
                            l_dSelected_0.Text = v205;
                            v194(v205, v125);
                            l_Menu_1.Visible = false;
                        end
                    });
                    if l_TextProperties_0 then
                        for v207, v208 in next, l_TextProperties_0 do
                            v206[v207] = v208;
                        end;
                    end;
                end;
                if v193 then
                    l_dSelected_0.Text = v193;
                else
                    l_dSelected_0.Text = "No Selection";
                end;
                local l_l_Menu_1_1 = l_Menu_1 --[[ copy: 7 -> 31 ]];
                l_dSelected_0.MouseButton1Down:Connect(function() --[[ Line: 762 ]]
                    -- upvalues: l_l_Menu_1_1 (copy), v125 (copy)
                    l_l_Menu_1_1.Position = UDim2.new(0, v125.AbsolutePosition.X, 0, v125.AbsolutePosition.Y + v125.AbsoluteSize.Y);
                    l_l_Menu_1_1.Visible = not l_l_Menu_1_1.Visible;
                end);
            end;
        end;
        if v124 == "TabFrame" then
            local v210 = v8("ScrollingFrame", nil, v125.Buttons);
            local l_Frames_0 = v125.Frames;
            local v212 = 0;
            local _ = v123.ButtonSize or 60;
            v125.BackgroundTransparency = v123.BackgroundTransparency or 1;
            v210.ZIndex = v123.ZIndex or v125.ZIndex;
            l_Frames_0.ZIndex = v210.ZIndex;
            v125:SetSpecial("GetTab", function(_, v215) --[[ Line: 779 ]]
                -- upvalues: l_Frames_0 (copy)
                return l_Frames_0:FindFirstChild(v215);
            end);
            local l_v210_0 = v210 --[[ copy: 7 -> 26 ]];
            do
                local l_v212_0 = v212;
                v125:SetSpecial("NewTab", function(_, v219, v220) --[[ Line: 783 ]]
                    -- upvalues: v15 (ref), l_v210_0 (copy), v8 (ref), v0 (ref), v23 (ref), l_Frames_0 (copy), l_v212_0 (ref)
                    local v221 = v220 or {};
                    local v222 = v15(l_v210_0);
                    local l_TextSize_0 = service.TextService:GetTextSize(v221.Text or v219, 16, "SourceSans", l_v210_0.AbsoluteSize);
                    local _ = v221.TextTransparency;
                    local v225 = false;
                    local v226 = v8("ScrollingFrame", {
                        Name = v219, 
                        Size = UDim2.new(1, 0, 1, 0), 
                        Position = UDim2.new(0, 0, 0, 0), 
                        BorderSizePixel = 0, 
                        BackgroundTransparency = v221.FrameTransparency or v221.Transparency, 
                        BackgroundColor3 = v221.Color or v0:lerp(Color3.new(1, 1, 1), 0.2), 
                        ZIndex = l_v210_0.ZIndex, 
                        Visible = false
                    });
                    local v227 = v8("TextButton", {
                        Name = v219, 
                        Text = v221.Text or v219, 
                        Size = UDim2.new(0, l_TextSize_0.X + 20, 1, 0), 
                        ZIndex = l_v210_0.ZIndex, 
                        Position = UDim2.new(0, v222.X.Offset > 0 and v222.X.Offset + 5 or 0, 0, 0), 
                        TextColor3 = v221.TextColor, 
                        BackgroundTransparency = 0.7, 
                        TextTransparency = v221.TextTransparency, 
                        BackgroundColor3 = v221.Color or v0:lerp(Color3.new(1, 1, 1), 0.2), 
                        BorderSizePixel = 0
                    });
                    v226:SetSpecial("FocusTab", function() --[[ Line: 815 ]]
                        -- upvalues: l_v210_0 (ref), v23 (ref), l_Frames_0 (ref), v227 (copy), v221 (copy), v226 (copy)
                        for _, v229 in next, l_v210_0:GetChildren() do
                            if v23(v229) then
                                v229.BackgroundTransparency = 0.7;
                                v229.TextTransparency = 0.7;
                            end;
                        end;
                        for _, v231 in next, l_Frames_0:GetChildren() do
                            if v23(v231) then
                                v231.Visible = false;
                            end;
                        end;
                        v227.BackgroundTransparency = v221.Transparency or 0;
                        v227.TextTransparency = v221.TextTransparency or 0;
                        v226.Visible = true;
                        if v221.OnFocus then
                            v221.OnFocus(true);
                        end;
                    end);
                    if l_v212_0 == 0 then
                        v226.Visible = true;
                        v227.BackgroundTransparency = v221.Transparency or 0;
                    end;
                    v227.MouseButton1Down:Connect(function() --[[ Line: 831 ]]
                        -- upvalues: v225 (ref), v226 (copy)
                        if not v225 then
                            v226:FocusTab();
                        end;
                    end);
                    v227.Parent = l_v210_0;
                    v226.Parent = l_Frames_0;
                    l_v210_0:ResizeCanvas(true, false);
                    v226:SetSpecial("Disable", function() --[[ Line: 841 ]]
                        -- upvalues: v225 (ref), v227 (copy)
                        v225 = true;
                        v227.BackgroundTransparency = 0.9;
                        v227.TextTransparency = 0.9;
                    end);
                    v226:SetSpecial("Enable", function() --[[ Line: 847 ]]
                        -- upvalues: v225 (ref), v227 (copy), v221 (copy)
                        v225 = false;
                        v227.BackgroundTransparency = 0.7;
                        v227.TextTransparency = v221.TextTransparency or 0;
                    end);
                    l_v212_0 = l_v212_0 + 1;
                    return v226, v227;
                end);
            end;
        end;
        if v124 == "ScrollingFrame" then
            local v232 = false;
            if not v123.ScrollBarThickness then
                v123.ScrollBarThickness = 4;
            end;
            do
                local l_v232_0 = v232;
                v125:SetSpecial("GenerateList", function(v234, v235, v236, v237) --[[ Line: 865 ]]
                    -- upvalues: l_v232_0 (ref), v125 (copy), v8 (ref), l_CheckProperty_0 (ref), v123 (copy)
                    local v238 = v235 or v234;
                    local v239 = {};
                    local v240 = v236 or {};
                    l_v232_0 = v239;
                    v125:ClearAllChildren();
                    local v241 = 0;
                    for v242, v243 in next, v238 do
                        local l_v243_0 = v243;
                        local v245 = nil;
                        local v246 = nil;
                        local v247 = nil;
                        if type(v243) == "table" then
                            l_v243_0 = v243.Text;
                            v245 = v243.Desc;
                            v246 = v243.Color;
                            if v243.RichTextAllowed or v240.RichTextAllowed then
                                v247 = true;
                            end;
                        end;
                        local v248 = v8("TextLabel", {
                            Text = (" %*"):format(l_v243_0), 
                            ToolTip = v245, 
                            Size = UDim2.new(1, -5, 0, v240.ySize or 20), 
                            Visible = true, 
                            BackgroundTransparency = 1, 
                            Font = "Arial", 
                            TextSize = 14, 
                            TextStrokeTransparency = 0.8, 
                            TextXAlignment = "Left", 
                            Position = UDim2.new(0, 0, 0, v241 * (v240.ySize or 20)), 
                            RichText = v247 or false
                        });
                        if v246 then
                            v248.TextColor3 = v246;
                        end;
                        if v236 then
                            for v249, v250 in next, v240 do
                                if l_CheckProperty_0(v248, v249) then
                                    v248[v249] = v250;
                                end;
                            end;
                        end;
                        if l_v232_0 == v239 then
                            v248.Parent = v125;
                            v241 = v241 + 1;
                            if v123.Delay then
                                if type(v123.Delay) == "number" then
                                    wait(v123.Delay);
                                elseif v242 % 100 == 0 then
                                    wait(0.1);
                                end;
                            end;
                        else
                            v248:Destroy();
                            break;
                        end;
                    end;
                    v125:ResizeCanvas(false, true, false, v237, 5, 5, 50);
                    l_v232_0 = nil;
                end);
                v125:SetSpecial("ResizeCanvas", function(_, v252, v253, v254, v255, _, _, v258) --[[ Line: 938 ]]
                    -- upvalues: v123 (copy), v125 (copy)
                    local v259 = v123.xPadding or 5;
                    local v260 = v123.yPadding or 5;
                    local v261 = 0;
                    local v262 = 0;
                    if not v252 and not v253 then
                        v252 = false;
                        v253 = true;
                    end;
                    for v263, v264 in next, v125:GetChildren() do
                        if v264:IsA("GuiObject") then
                            if v253 then
                                v264.Size = UDim2.new(v264.Size.X.Scale, v264.Size.X.Offset, 0, v264.AbsoluteSize.Y);
                                v264.Position = UDim2.new(v264.Position.X.Scale, v264.Position.X.Offset, 0, v264.AbsolutePosition.Y - v125.AbsolutePosition.Y);
                            end;
                            if v252 then
                                v264.Size = UDim2.new(0, v264.AbsoluteSize.X, v264.Size.Y.Scale, v264.Size.Y.Offset);
                                v264.Position = UDim2.new(0, v264.AbsolutePosition.X - v125.AbsolutePosition.X, v264.Position.Y.Scale, v264.Position.Y.Offset);
                            end;
                            local v265 = v264.Position.Y.Offset + v264.Size.Y.Offset;
                            local v266 = v264.Position.X.Offset + v264.Size.X.Offset;
                            v261 = math.max(v261, v265);
                            v262 = math.max(v262, v266);
                            if v258 and v263 % v258 == 0 then
                                wait(0.016666666666666666);
                            end;
                        end;
                    end;
                    if v253 then
                        v125.CanvasSize = UDim2.new(v125.CanvasSize.X.Scale, v125.CanvasSize.X.Offset, 0, v261 + v260);
                    end;
                    if v252 then
                        v125.CanvasSize = UDim2.new(0, v262 + v259, v125.CanvasSize.Y.Scale, v125.CanvasSize.Y.Offset);
                    end;
                    if v254 then
                        v125.CanvasPosition = Vector2.new(v262 + v259 - v125.AbsoluteSize.X, v125.CanvasPosition.Y);
                    end;
                    if v255 then
                        v125.CanvasPosition = Vector2.new(v125.CanvasPosition.X, v261 + v260 - v125.AbsoluteSize.Y);
                    end;
                end);
                if v123.List then
                    v125:GenerateList(v123.List);
                    v123.List = nil;
                end;
            end;
        end;
        v65(v125, v123.Content or v123.Children);
        v123.Children = nil;
        v123.Content = nil;
        for v267, v268 in next, v123 do
            if l_CheckProperty_0(v125, v267) then
                v125[v267] = v268;
            end;
        end;
        v125.Parent = v126;
        return v21(v125, v123, v124), v123;
    end;
    v21 = function(v269, v270, _) --[[ Line: 1003 ]] --[[ Name: apiIfy ]]
        -- upvalues: v8 (ref), v21 (ref)
        local v272 = service.Wrap(v269);
        v269:SetSpecial("Object", v269);
        v269:SetSpecial("SetPosition", function(_, v274) --[[ Line: 1006 ]]
            -- upvalues: v269 (copy)
            v269.Position = v274;
        end);
        v269:SetSpecial("SetSize", function(_, v276) --[[ Line: 1007 ]]
            -- upvalues: v269 (copy)
            v269.Size = v276;
        end);
        v269:SetSpecial("Add", function(v277, v278, v279) --[[ Line: 1008 ]]
            -- upvalues: v8 (ref), v269 (copy), v21 (ref)
            if not v279 then
                v279 = v278;
                v278 = v277;
            end;
            local v280 = v8(v278, v279);
            v280.Parent = v269;
            return v21(v280, v279, v278);
        end);
        v269:SetSpecial("Copy", function(_, v282, v283) --[[ Line: 1015 ]]
            -- upvalues: v270 (copy), v8 (ref), v269 (copy), v21 (ref)
            local v284 = {};
            local v285 = nil;
            for v286, v287 in next, v270 do
                v284[v286] = v287;
            end;
            for v288, v289 in next, v283 do
                v284[v288] = v289;
            end;
            v285 = v8(v282 or v270.Class or v269.ClassName, v284);
            v285.Parent = v283.Parent or v269.Parent;
            return v21(v285, v270, v282);
        end);
        return v272;
    end;
    v11 = function() --[[ Line: 1035 ]] --[[ Name: doClose ]]
        -- upvalues: v58 (ref), l_OnClose_0 (copy), l_gTable_0 (copy)
        if not v58 then
            v58 = true;
            print(l_OnClose_0);
            if l_OnClose_0 then
                l_OnClose_0();
            end;
            l_gTable_0:Destroy();
        end;
    end;
    v13 = function() --[[ Line: 1044 ]] --[[ Name: isVisible ]]
        -- upvalues: l_Main_0 (copy)
        return l_Main_0.Visible;
    end;
    local l_TextLabel_0 = l_Hide_0:FindFirstChild("TextLabel");
    v10 = function(v291) --[[ Line: 1049 ]] --[[ Name: doHide ]]
        -- upvalues: l_Hide_0 (copy), l_Main_0 (copy), v12 (ref), l_Drag_0 (copy), l_TextLabel_0 (copy), l_gTable_0 (copy), l_OnMinimize_0 (copy), l_Walls_0 (copy), v16 (ref)
        local l_LineHeight_0 = l_Hide_0.LineHeight;
        if v291 or v291 == nil and l_Main_0.Visible then
            v12 = l_Drag_0.Size;
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
        elseif v291 == false or v291 == nil and not l_Main_0.Visible then
            l_Main_0.Visible = true;
            l_Drag_0.BackgroundTransparency = 1;
            l_Drag_0.Size = v12 or l_Drag_0.Size;
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
            v16();
        end;
    end;
    v19 = function(v293, v294, v295) --[[ Line: 1090 ]] --[[ Name: isInFrame ]]
        if v295.AbsolutePosition.X < v293 and v293 < v295.AbsolutePosition.X + v295.AbsoluteSize.X and v295.AbsolutePosition.Y < v294 and v294 < v295.AbsolutePosition.Y + v295.AbsoluteSize.Y then
            return true;
        else
            return false;
        end;
    end;
    v16 = function() --[[ Line: 1098 ]] --[[ Name: wallPosition ]]
        -- upvalues: l_gTable_0 (copy), l_Drag_0 (copy), l_Object_0 (copy), l_Main_0 (copy)
        if l_gTable_0.Active then
            local l_X_1 = l_Drag_0.AbsolutePosition.X;
            local l_Y_0 = l_Drag_0.AbsolutePosition.Y;
            local l_X_2 = l_Drag_0.AbsoluteSize.X;
            local l_X_3 = l_Object_0.AbsoluteSize.X;
            local l_Y_1 = l_Object_0.AbsoluteSize.Y;
            local v301 = l_Main_0.Visible and l_Main_0.AbsoluteSize.Y or l_Drag_0.AbsoluteSize.Y;
            if l_X_1 < 0 then
                l_Drag_0.Position = UDim2.new(0, 0, l_Drag_0.Position.Y.Scale, l_Drag_0.Position.Y.Offset);
            end;
            if l_Y_0 < 0 then
                l_Drag_0.Position = UDim2.new(l_Drag_0.Position.X.Scale, l_Drag_0.Position.X.Offset, 0, 0);
            end;
            if l_X_3 < l_X_1 + l_X_2 then
                l_Drag_0.Position = UDim2.new(0, l_Object_0.AbsoluteSize.X - l_Drag_0.AbsoluteSize.X, l_Drag_0.Position.Y.Scale, l_Drag_0.Position.Y.Offset);
            end;
            if l_Y_1 < l_Y_0 + v301 then
                l_Drag_0.Position = UDim2.new(l_Drag_0.Position.X.Scale, l_Drag_0.Position.X.Offset, 0, l_Object_0.AbsoluteSize.Y - v301);
            end;
        end;
    end;
    v20 = function(v302) --[[ Line: 1122 ]] --[[ Name: setSize ]]
        -- upvalues: l_Drag_0 (copy), l_Main_0 (copy)
        if v302 and type(v302) == "table" then
            if v302[1] < 50 then
                v302[1] = 50;
            end;
            if v302[2] < 50 then
                v302[2] = 50;
            end;
            l_Drag_0.Size = UDim2.new(0, v302[1], l_Drag_0.Size.Y.Scale, l_Drag_0.Size.Y.Offset);
            l_Main_0.Size = UDim2.new(1, 0, 0, v302[2]);
        end;
    end;
    v17 = function(v303) --[[ Line: 1132 ]] --[[ Name: setPosition ]]
        -- upvalues: l_Drag_0 (copy), l_Size_0 (copy), l_Main_0 (copy)
        if v303 and typeof(v303) == "UDim2" then
            l_Drag_0.Position = v303;
            return;
        elseif v303 and type(v303) == "table" then
            l_Drag_0.Position = UDim2.new(0, v303[1], 0, v303[2]);
            return;
        else
            if l_Size_0 and not v303 then
                l_Drag_0.Position = UDim2.new(0.5, -l_Drag_0.AbsoluteSize.X / 2, 0.5, -l_Main_0.AbsoluteSize.Y / 2);
            end;
            return;
        end;
    end;
    if l_Name_0 then
        l_gTable_0.Name = l_Name_0;
        if v24.AllowMultiple ~= nil and v24.AllowMultiple == false then
            local v304, _ = client.UI.Get(l_Name_0, l_Object_0, true);
            if v304 then
                v11();
                return nil;
            end;
        end;
    end;
    if l_Size_0 then
        v20(l_Size_0);
    end;
    if l_Position_0 then
        v17(l_Position_0);
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
        l_Drag_0.DragStopped:Connect(function() --[[ Line: 1194 ]]
            -- upvalues: v16 (ref)
            v16();
        end);
    end;
    if l_OnRefresh_0 then
        local v306 = false;
        v14 = function() --[[ Line: 1201 ]] --[[ Name: DoRefresh ]]
            -- upvalues: v60 (ref), l_gTable_0 (copy), l_Spinner_0 (copy), l_OnRefresh_0 (copy)
            if not v60 then
                local v307 = false;
                v60 = true;
                do
                    local l_v307_0 = v307;
                    spawn(function() --[[ Line: 1206 ]]
                        -- upvalues: l_gTable_0 (ref), l_v307_0 (ref), l_Spinner_0 (ref)
                        while l_gTable_0.Active and not l_v307_0 do
                            for v309 = 0, 180, 10 do
                                l_Spinner_0.Rotation = -v309;
                                wait(0.016666666666666666);
                            end;
                        end;
                    end);
                    l_OnRefresh_0();
                    wait(1);
                    l_v307_0 = true;
                    v60 = false;
                end;
            end;
        end;
        do
            local l_v306_0 = v306;
            l_Refresh_0.MouseButton1Down:Connect(function() --[[ Line: 1222 ]]
                -- upvalues: l_v306_0 (ref), v14 (ref)
                if not l_v306_0 then
                    l_v306_0 = true;
                    v14();
                    l_v306_0 = false;
                end;
            end);
            l_Title_1.Size = UDim2.new(1, -130, l_Title_1.Size.Y.Scale, l_Title_1.Size.Y.Offset);
        end;
    else
        l_Refresh_0.Visible = false;
    end;
    if l_IconClicked_0 then
        l_Icon_2.MouseButton1Down(function() --[[ Line: 1236 ]]
            -- upvalues: l_IconClicked_0 (copy), v24 (copy), l_Object_0 (copy), l_Icon_2 (copy)
            l_IconClicked_0(v24, l_Object_0, l_Icon_2);
        end);
    end;
    if l_Menu_0 then
        v24.Menu.Text = "";
        v24.Menu.Parent = l_Main_0;
        v24.Menu.Size = UDim2.new(1, -10, 0, 25);
        v24.Menu.Position = UDim2.new(0, 5, 0, 25);
        l_ScrollingFrame_0.Size = UDim2.new(1, -10, 1, -55);
        l_ScrollingFrame_0.Position = UDim2.new(0, 5, 0, 50);
        v24.Menu.BackgroundColor3 = Color3.fromRGB(216, 216, 216);
        v24.Menu.BorderSizePixel = 0;
        v8("TextLabel", v24.Menu);
    end;
    if not v51 then
        local l_X_4 = l_Drag_0.AbsolutePosition.X;
        local l_Y_2 = l_Drag_0.AbsolutePosition.Y;
        local l_X_5 = l_Drag_0.AbsoluteSize.X;
        local l_Y_3 = l_Drag_0.AbsoluteSize.Y;
        local _ = client.Variables;
        local v316 = nil;
        local v317 = nil;
        local v318 = nil;
        do
            local l_l_X_4_0, l_l_Y_2_0, l_l_X_5_0, l_l_Y_3_0, l_v316_0, l_v317_0, l_v318_0 = l_X_4, l_Y_2, l_X_5, l_Y_3, v316, v317, v318;
            local function _(v326) --[[ Line: 1263 ]] --[[ Name: readify ]]
                -- upvalues: l_v318_0 (ref)
                v326.MouseEnter:Connect(function() --[[ Line: 1264 ]]
                    -- upvalues: l_v318_0 (ref), v326 (copy)
                    l_v318_0 = v326;
                end);
                v326.MouseLeave:Connect(function() --[[ Line: 1268 ]]
                    -- upvalues: l_v318_0 (ref), v326 (copy)
                    if l_v318_0 == v326 then
                        l_v318_0 = nil;
                    end;
                end);
            end;
            v18 = function(v328, v329) --[[ Line: 1288 ]] --[[ Name: checkMouse ]]
                -- upvalues: l_gTable_0 (copy), l_Main_0 (copy), v19 (ref), l_Drag_0 (copy), l_ScrollingFrame_0 (copy), l_v317_0 (ref), l_v316_0 (ref), l_TopRight_0 (copy), v7 (ref), l_TopLeft_0 (copy), l_RightCorner_0 (copy), l_LeftCorner_0 (copy), l_RightSide_0 (copy), l_LeftSide_0 (copy), l_Bottom_0 (copy), l_Top_0 (copy), l_l_LocalPlayer_0_Mouse_0 (copy), l_Icon_1 (ref)
                if l_gTable_0.Active and l_Main_0.Visible then
                    if v19(v328, v329, l_Drag_0) or v19(v328, v329, l_ScrollingFrame_0) then
                        l_v317_0 = nil;
                        l_v316_0 = nil;
                    elseif v19(v328, v329, l_TopRight_0) then
                        l_v317_0 = "TopRight";
                        l_v316_0 = v7.TopRight;
                    elseif v19(v328, v329, l_TopLeft_0) then
                        l_v317_0 = "TopLeft";
                        l_v316_0 = v7.TopLeft;
                    elseif v19(v328, v329, l_RightCorner_0) then
                        l_v317_0 = "RightCorner";
                        l_v316_0 = v7.RightCorner;
                    elseif v19(v328, v329, l_LeftCorner_0) then
                        l_v317_0 = "LeftCorner";
                        l_v316_0 = v7.LeftCorner;
                    elseif v19(v328, v329, l_RightSide_0) then
                        l_v317_0 = "RightSide";
                        l_v316_0 = v7.Horizontal;
                    elseif v19(v328, v329, l_LeftSide_0) then
                        l_v317_0 = "LeftSide";
                        l_v316_0 = v7.Horizontal;
                    elseif v19(v328, v329, l_Bottom_0) then
                        l_v317_0 = "Bottom";
                        l_v316_0 = v7.Vertical;
                    elseif v19(v328, v329, l_Top_0) then
                        l_v317_0 = "Top";
                        l_v316_0 = v7.Vertical;
                    else
                        l_v317_0 = nil;
                        l_v316_0 = nil;
                    end;
                else
                    l_v317_0 = nil;
                end;
                if not client.Variables.MouseLockedBy or client.Variables.MouseLockedBy == l_gTable_0 then
                    if l_v317_0 and l_v316_0 then
                        l_l_LocalPlayer_0_Mouse_0.Icon = l_v316_0;
                        client.Variables.MouseLockedBy = l_gTable_0;
                        return;
                    elseif client.Variables.MouseLockedBy == l_gTable_0 then
                        l_l_LocalPlayer_0_Mouse_0.Icon = l_Icon_1;
                        client.Variables.MouseLockedBy = nil;
                    end;
                end;
            end;
            local function v332(v330, v331) --[[ Line: 1336 ]] --[[ Name: inputStart ]]
                -- upvalues: v18 (ref), l_gTable_0 (copy), l_v317_0 (ref), v59 (ref), v19 (ref), l_ScrollingFrame_0 (copy), l_Drag_0 (copy), l_l_X_4_0 (ref), l_l_Y_2_0 (ref), l_l_X_5_0 (ref), l_l_Y_3_0 (ref), l_Main_0 (copy)
                v18(v330, v331);
                if l_gTable_0.Active and l_v317_0 and not v59 and not v19(v330, v331, l_ScrollingFrame_0) and not v19(v330, v331, l_Drag_0) then
                    v59 = l_v317_0;
                    l_l_X_4_0 = l_Drag_0.AbsolutePosition.X;
                    l_l_Y_2_0 = l_Drag_0.AbsolutePosition.Y;
                    l_l_X_5_0 = l_Drag_0.AbsoluteSize.X;
                    l_l_Y_3_0 = l_Main_0.AbsoluteSize.Y;
                end;
            end;
            local function v333() --[[ Line: 1347 ]] --[[ Name: inputEnd ]]
                -- upvalues: l_gTable_0 (copy), v59 (ref), l_OnResize_0 (copy), l_Drag_0 (copy), l_Main_0 (copy), l_l_LocalPlayer_0_Mouse_0 (copy), l_Icon_1 (ref)
                if l_gTable_0.Active then
                    if v59 and l_OnResize_0 then
                        l_OnResize_0(UDim2.new(l_Drag_0.Size.X.Scale, l_Drag_0.Size.X.Offset, l_Main_0.Size.Y.Scale, l_Main_0.Size.Y.Offset));
                    end;
                    v59 = nil;
                    l_l_LocalPlayer_0_Mouse_0.Icon = l_Icon_1;
                end;
            end;
            local function v343(v334, v335) --[[ Line: 1362 ]] --[[ Name: inputMoved ]]
                -- upvalues: l_gTable_0 (copy), l_l_LocalPlayer_0_Mouse_0 (copy), v7 (ref), l_Icon_1 (ref), v59 (ref), l_Drag_0 (copy), l_l_X_5_0 (ref), l_l_Y_3_0 (ref), l_l_X_4_0 (ref), l_l_Y_2_0 (ref), v55 (copy), v56 (copy), l_Main_0 (copy), l_Title_1 (copy), v18 (ref)
                if l_gTable_0.Active then
                    if l_l_LocalPlayer_0_Mouse_0.Icon ~= v7.TopRight and l_l_LocalPlayer_0_Mouse_0.Icon ~= v7.TopLeft and l_l_LocalPlayer_0_Mouse_0.Icon ~= v7.RightCorner and l_l_LocalPlayer_0_Mouse_0.Icon ~= v7.LeftCorner and l_l_LocalPlayer_0_Mouse_0.Icon ~= v7.Horizontal and l_l_LocalPlayer_0_Mouse_0.Icon ~= v7.Vertical then
                        l_Icon_1 = l_l_LocalPlayer_0_Mouse_0.Icon;
                    end;
                    if v59 then
                        local v336 = false;
                        local v337 = false;
                        local l_Position_1 = l_Drag_0.Position;
                        local l_v334_0 = v334;
                        local l_v335_0 = v335;
                        local l_l_l_X_5_0_0 = l_l_X_5_0;
                        local l_l_l_Y_3_0_0 = l_l_Y_3_0;
                        if v59 == "TopRight" then
                            l_l_l_X_5_0_0 = l_v334_0 - l_l_X_4_0 + 3;
                            l_l_l_Y_3_0_0 = l_l_Y_2_0 - l_v335_0 + l_l_Y_3_0 - 1;
                            v337 = true;
                        elseif v59 == "TopLeft" then
                            l_l_l_X_5_0_0 = l_l_X_4_0 - l_v334_0 + l_l_X_5_0 - 1;
                            l_l_l_Y_3_0_0 = l_l_Y_2_0 - l_v335_0 + l_l_Y_3_0 - 1;
                            v337 = true;
                            v336 = true;
                        elseif v59 == "RightCorner" then
                            l_l_l_X_5_0_0 = l_v334_0 - l_l_X_4_0 + 3;
                            l_l_l_Y_3_0_0 = l_v335_0 - l_l_Y_2_0 + 3;
                        elseif v59 == "LeftCorner" then
                            l_l_l_X_5_0_0 = l_l_X_4_0 - l_v334_0 + l_l_X_5_0 + 3;
                            l_l_l_Y_3_0_0 = l_v335_0 - l_l_Y_2_0 + 3;
                            v336 = true;
                        elseif v59 == "LeftSide" then
                            l_l_l_X_5_0_0 = l_l_X_4_0 - l_v334_0 + l_l_X_5_0 + 3;
                            l_l_l_Y_3_0_0 = l_l_Y_3_0;
                            v336 = true;
                        elseif v59 == "RightSide" then
                            l_l_l_X_5_0_0 = l_v334_0 - l_l_X_4_0 + 3;
                            l_l_l_Y_3_0_0 = l_l_Y_3_0;
                        elseif v59 == "Bottom" then
                            l_l_l_X_5_0_0 = l_l_X_5_0;
                            l_l_l_Y_3_0_0 = l_v335_0 - l_l_Y_2_0 + 3;
                        elseif v59 == "Top" then
                            l_l_l_X_5_0_0 = l_l_X_5_0;
                            l_l_l_Y_3_0_0 = l_l_Y_2_0 - l_v335_0 + l_l_Y_3_0 - 1;
                            v337 = true;
                        end;
                        if l_l_l_X_5_0_0 < v55[1] then
                            l_l_l_X_5_0_0 = v55[1];
                        end;
                        if l_l_l_Y_3_0_0 < v55[2] then
                            l_l_l_Y_3_0_0 = v55[2];
                        end;
                        if v56[1] < l_l_l_X_5_0_0 then
                            l_l_l_X_5_0_0 = v56[1];
                        end;
                        if v56[2] < l_l_l_Y_3_0_0 then
                            l_l_l_Y_3_0_0 = v56[2];
                        end;
                        if v336 then
                            l_Position_1 = UDim2.new(0, l_l_X_4_0 + l_l_X_5_0 - l_l_l_X_5_0_0, l_Position_1.Y.Scale, l_Position_1.Y.Offset);
                        end;
                        if v337 then
                            l_Position_1 = UDim2.new(l_Position_1.X.Scale, l_Position_1.X.Offset, 0, l_l_Y_2_0 + l_l_Y_3_0 - l_l_l_Y_3_0_0);
                        end;
                        l_Drag_0.Position = l_Position_1;
                        l_Drag_0.Size = UDim2.new(0, l_l_l_X_5_0_0, l_Drag_0.Size.Y.Scale, l_Drag_0.Size.Y.Offset);
                        l_Main_0.Size = UDim2.new(l_Main_0.Size.X.Scale, l_Main_0.Size.X.Offset, 0, l_l_l_Y_3_0_0);
                        if not l_Title_1.TextFits then
                            l_Title_1.Visible = false;
                            return;
                        else
                            l_Title_1.Visible = true;
                            return;
                        end;
                    else
                        v18(v334, v335);
                    end;
                end;
            end;
            l_BindEvent_0(l_UserInputService_0.InputBegan, function(v344, v345) --[[ Line: 1437 ]]
                -- upvalues: v332 (copy)
                if not v345 and (v344.UserInputType == Enum.UserInputType.MouseButton1 or v344.UserInputType == Enum.UserInputType.Touch) then
                    local l_Position_2 = v344.Position;
                    v332(l_Position_2.X, l_Position_2.Y);
                end;
            end);
            l_BindEvent_0(l_UserInputService_0.InputChanged, function(v347, _) --[[ Line: 1444 ]]
                -- upvalues: v343 (copy)
                if v347.UserInputType == Enum.UserInputType.MouseMovement or v347.UserInputType == Enum.UserInputType.Touch then
                    local l_Position_3 = v347.Position;
                    v343(l_Position_3.X, l_Position_3.Y);
                end;
            end);
            l_BindEvent_0(l_UserInputService_0.InputEnded, function(v350, _) --[[ Line: 1451 ]]
                -- upvalues: v333 (copy)
                if v350.UserInputType == Enum.UserInputType.MouseButton1 or v350.UserInputType == Enum.UserInputType.Touch then
                    v333();
                end;
            end);
        end;
    else
        l_LeftResizeIcon_0.Visible = false;
        l_RightResizeIcon_0.Visible = false;
    end;
    l_Close_0.MouseButton1Down:Connect(v11);
    l_Hide_0.MouseButton1Down:Connect(function() --[[ Line: 1488 ]]
        -- upvalues: v10 (ref)
        v10();
    end);
    l_gTable_0.CustomDestroy = function() --[[ Line: 1489 ]]
        -- upvalues: l_Object_0 (copy), l_gTable_0 (copy), l_l_LocalPlayer_0_Mouse_0 (copy), l_Icon_1 (ref), v58 (ref), l_OnClose_0 (copy)
        service.UnWrap(l_Object_0):Destroy();
        if client.Variables.MouseLockedBy == l_gTable_0 then
            l_l_LocalPlayer_0_Mouse_0.Icon = l_Icon_1;
            client.Variables.MouseLockedBy = nil;
        end;
        if not v58 then
            v58 = true;
            if l_OnClose_0 then
                l_OnClose_0();
            end;
        end;
    end;
    for _, v353 in next, l_Object_0:GetChildren() do
        if v353.Name ~= "Desc" and v353.Name ~= "Drag" then
            v62[v353.Name] = v353;
            v353.Parent = nil;
        end;
    end;
    local v354 = Instance.new("BoolValue", l_Object_0);
    local v355 = false;
    local v356 = nil;
    local v357 = nil;
    v354.Name = "__ADONIS_WINDOW";
    l_BindEvent_0(l_Main_0.InputBegan, function(v358) --[[ Line: 1520 ]]
        -- upvalues: l_gTable_0 (copy), v66 (ref)
        if l_gTable_0.Active and (v358.UserInputType == Enum.UserInputType.MouseButton1 or v358.UserInputType == Enum.UserInputType.Touch) then
            v66();
        end;
    end);
    do
        local l_v355_0, l_v356_0, l_v357_0 = v355, v356, v357;
        l_BindEvent_0(l_Drag_0.InputBegan, function(v362) --[[ Line: 1526 ]]
            -- upvalues: l_gTable_0 (copy), l_v357_0 (ref), v66 (ref)
            if l_gTable_0.Active then
                l_v357_0 = true;
                if v362.UserInputType == Enum.UserInputType.MouseButton1 or v362.UserInputType == Enum.UserInputType.Touch then
                    v66();
                end;
            end;
        end);
        l_BindEvent_0(l_Drag_0.InputChanged, function(_) --[[ Line: 1536 ]]
            -- upvalues: l_gTable_0 (copy), l_v357_0 (ref)
            if l_gTable_0.Active then
                l_v357_0 = true;
            end;
        end);
        l_BindEvent_0(l_Drag_0.InputEnded, function(_) --[[ Line: 1542 ]]
            -- upvalues: l_v357_0 (ref)
            l_v357_0 = false;
        end);
        l_BindEvent_0(l_UserInputService_0.InputBegan, function(v365) --[[ Line: 1546 ]]
            -- upvalues: l_v357_0 (ref), l_Object_0 (copy), l_v355_0 (ref), v66 (ref), l_v356_0 (ref), l_Drag_0 (copy)
            if l_v357_0 and l_Object_0.DisplayOrder == 101 and not l_v355_0 and (v365.UserInputType == Enum.UserInputType.MouseButton1 or v365.UserInputType == Enum.UserInputType.Touch) then
                l_v355_0 = true;
                v66();
                l_v356_0 = Vector2.new(l_Drag_0.AbsolutePosition.X - v365.Position.X, l_Drag_0.AbsolutePosition.Y - v365.Position.Y);
            end;
        end);
        l_BindEvent_0(l_UserInputService_0.InputChanged, function(v366) --[[ Line: 1554 ]]
            -- upvalues: l_v355_0 (ref), l_Drag_0 (copy), l_v356_0 (ref)
            if l_v355_0 and (v366.UserInputType == Enum.UserInputType.MouseMovement or v366.UserInputType == Enum.UserInputType.Touch) then
                l_Drag_0.Position = UDim2.new(0, l_v356_0.X + v366.Position.X, 0, l_v356_0.Y + v366.Position.Y);
            end;
        end);
        l_BindEvent_0(l_UserInputService_0.InputEnded, function(v367) --[[ Line: 1560 ]]
            -- upvalues: l_v355_0 (ref)
            if v367.UserInputType == Enum.UserInputType.MouseButton1 or v367.UserInputType == Enum.UserInputType.Touch then
                l_v355_0 = false;
            end;
        end);
    end;
    v354 = v21(l_ScrollingFrame_0, v24);
    v355 = v354:GetMetatable();
    v356 = v355.__newindex;
    v357 = v355.__index;
    v8("ScrollingFrame", nil, l_ScrollingFrame_0);
    v65(v354, v54);
    v354:SetSpecial("gTable", l_gTable_0);
    v354:SetSpecial("Window", l_Object_0);
    v354:SetSpecial("Main", l_Main_0);
    v354:SetSpecial("Title", l_Title_1);
    v354:SetSpecial("Dragger", l_Drag_0);
    v354:SetSpecial("Destroy", v11);
    v354:SetSpecial("Close", v11);
    v354:SetSpecial("Object", l_ScrollingFrame_0);
    v354:SetSpecial("Refresh", v14);
    v354:SetSpecial("AddTitleButton", function(v368, v369) --[[ Line: 1585 ]]
        -- upvalues: v64 (ref)
        if type(v368) == "table" and not v369 then
            v369 = v368;
        end;
        return v64(v369);
    end);
    v354:SetSpecial("Ready", function() --[[ Line: 1586 ]]
        -- upvalues: l_OnReady_0 (copy), l_gTable_0 (copy), v66 (ref)
        if l_OnReady_0 then
            l_OnReady_0();
        end;
        l_gTable_0.Ready();
        v66();
    end);
    v354:SetSpecial("BindEvent", function(_, ...) --[[ Line: 1587 ]]
        -- upvalues: l_BindEvent_0 (copy)
        return l_BindEvent_0(...);
    end);
    v354:SetSpecial("Hide", function(_, v372) --[[ Line: 1588 ]]
        -- upvalues: v10 (ref)
        v10(v372);
    end);
    v354:SetSpecial("SetTitle", function(_, v374) --[[ Line: 1589 ]]
        -- upvalues: l_Title_1 (copy)
        l_Title_1.Text = v374;
    end);
    v354:SetSpecial("SetPosition", function(_, v376) --[[ Line: 1590 ]]
        -- upvalues: v17 (ref)
        v17(v376);
    end);
    v354:SetSpecial("SetSize", function(_, v378) --[[ Line: 1591 ]]
        -- upvalues: v20 (ref)
        v20(v378);
    end);
    v354:SetSpecial("GetPosition", function() --[[ Line: 1592 ]]
        -- upvalues: l_Drag_0 (copy)
        return l_Drag_0.AbsolutePosition;
    end);
    v354:SetSpecial("GetSize", function() --[[ Line: 1593 ]]
        -- upvalues: l_Main_0 (copy)
        return l_Main_0.AbsoluteSize;
    end);
    v354:SetSpecial("IsVisible", v13);
    v354:SetSpecial("IsClosed", v58);
    v355.__index = function(v379, v380) --[[ Line: 1597 ]]
        -- upvalues: v13 (ref), v58 (ref), v357 (copy)
        if v380 == "IsVisible" then
            return v13();
        elseif v380 == "Closed" then
            return v58;
        else
            return v357(v379, v380);
        end;
    end;
    v20(l_Size_0);
    v17(l_Position_0);
    if l_Ready_0 then
        l_gTable_0:Ready();
        v66();
    end;
    return v354, l_Object_0;
end;