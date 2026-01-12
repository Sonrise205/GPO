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
local function v23(v22) --[[ Line: 145 ]] --[[ Name: isGui ]]
    return v22:IsA("GuiObject");
end;
return function(v24, v25) --[[ Line: 150 ]]
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
    v9 = function(v87, v88, v89) --[[ Line: 220 ]] --[[ Name: Expand ]]
        -- upvalues: v63 (ref), l_Object_0 (copy)
        local l_Label_0 = v88:FindFirstChild("Label");
        if l_Label_0 then
            if not v88:FindFirstChildOfClass("UICorner") then
                service.New("UICorner", {
                    CornerRadius = UDim.new(0, 5), 
                    Parent = v88
                });
            end;
            v87.MouseLeave:Connect(function(_, _) --[[ Line: 231 ]]
                -- upvalues: v63 (ref), v87 (copy), v88 (copy)
                if v63 == v87 then
                    v88.Visible = false;
                end;
            end);
            v87.MouseMoved:Connect(function(v93, v94) --[[ Line: 237 ]]
                -- upvalues: v63 (ref), v87 (copy), v89 (copy), l_Label_0 (copy), l_Object_0 (ref), v88 (copy)
                v63 = v87;
                local v95 = v89 or v87.Desc.Value;
                l_Label_0.Text = v95;
                l_Label_0.Font = Enum.Font.Gotham;
                l_Label_0.TextSize = 15;
                l_Label_0.TextStrokeTransparency = 1;
                local v96 = nil;
                local l_ContentText_0 = l_Label_0.ContentText;
                v96 = if string.match(v95, "^(<b>).+(</b>)$") then Enum.Font.GothamBold else l_Label_0.Font;
                local l_TextSize_0 = service.TextService:GetTextSize(l_ContentText_0, 15, v96, Vector2.new(400, math.huge));
                local v99 = l_TextSize_0.X + 10;
                local v100 = l_TextSize_0.Y + 10;
                local v101 = v93 + 6 + v99 < l_Object_0.AbsoluteSize.X and v93 + 6 or v93 - 6 - v99;
                local v102 = v94 - 6 - v100 > 0 and v94 - 6 - v100 or v94;
                v88.Size = UDim2.fromOffset(v99, v100);
                v88.Position = UDim2.fromOffset(v101, v102);
                v88.Visible = v95 ~= "";
            end);
        end;
    end;
    v15 = function(v103) --[[ Line: 269 ]] --[[ Name: getNextPos ]]
        -- upvalues: l_CheckProperty_0 (copy)
        local v104 = nil;
        local v105 = nil;
        for _, v107 in next, v103:GetChildren() do
            if l_CheckProperty_0(v107, "Size") then
                if not v104 or v107.AbsolutePosition.X + v107.AbsoluteSize.X > v104.AbsolutePosition.X + v104.AbsoluteSize.X then
                    v104 = v107;
                end;
                if not v105 or v107.AbsolutePosition.Y + v107.AbsoluteSize.Y > v104.AbsolutePosition.Y + v104.AbsoluteSize.Y then
                    v105 = v107;
                end;
            end;
        end;
        return not (v104 and v105) and UDim2.new(0, 0, 0, 0) or UDim2.new(v104.Position.X.Scale, v104.Position.X.Offset + v104.AbsoluteSize.X, v105.Position.Y.Scale, v105.Position.Y.Offset + v105.AbsoluteSize.Y);
    end;
    v65 = function(v108, v109) --[[ Line: 286 ]] --[[ Name: LoadChildren ]]
        -- upvalues: v8 (ref)
        if v109 then
            local v110 = v109.RunWhenDone and functionify(v109.RunWhenDone, v108);
            for v111, v112 in next, v109 do
                if type(v112) == "table" then
                    if not v112.Parent then
                        v112.Parent = v108;
                    end;
                    v8(v112.Class or v112.ClassName or v111, v112);
                elseif type(v112) == "function" or type(v112) == "string" and not v110 then
                    v110 = functionify(v112, v108);
                end;
            end;
            if v110 then
                v110(v108);
            end;
        end;
    end;
    v66 = function() --[[ Line: 304 ]] --[[ Name: BringToFront ]]
        -- upvalues: l_LocalPlayer_0 (copy), l_Object_0 (copy)
        for _, v114 in ipairs(l_LocalPlayer_0.PlayerGui:GetChildren()) do
            if v114:FindFirstChild("__ADONIS_WINDOW") then
                v114.DisplayOrder = 100;
            end;
        end;
        l_Object_0.DisplayOrder = 101;
    end;
    v64 = function(v115) --[[ Line: 314 ]] --[[ Name: addTitleButton ]]
        -- upvalues: l_Hide_0 (copy), l_Close_0 (copy), l_Refresh_0 (copy), l_Drag_0 (copy), v8 (ref)
        local v116 = 1;
        local v117 = nil;
        local l_l_Hide_0_0 = l_Hide_0;
        if l_Hide_0.Visible then
            v116 = v116 + 1;
        end;
        if l_Close_0.Visible then
            v116 = v116 + 1;
        end;
        if l_Refresh_0.Visible then
            v116 = v116 + 1;
        end;
        v117 = UDim2.new(1, -(v116 * 30 + 5 + (v116 - 1)), 0, 0);
        v115.Position = v115.Position or v117;
        v115.Size = v115.Size or l_l_Hide_0_0.Size;
        v115.BackgroundColor3 = v115.BackgroundColor3 or l_l_Hide_0_0.BackgroundColor3;
        v115.BackgroundTransparency = v115.BackgroundTransparency or l_l_Hide_0_0.BackgroundTransparency;
        v115.BorderSizePixel = v115.BorderSizePixel or l_l_Hide_0_0.BorderSizePixel;
        v115.ZIndex = v115.ZIndex or l_l_Hide_0_0.ZIndex;
        v115.TextColor3 = v115.TextColor3 or l_l_Hide_0_0.TextColor3;
        v115.TextScaled = v115.TextScaled or l_l_Hide_0_0.TextScaled;
        v115.TextStrokeColor3 = v115.TextStrokeColor3 or l_l_Hide_0_0.TextStrokeColor3;
        v115.TextSize = v115.TextSize or l_l_Hide_0_0.TextSize;
        v115.TextTransparency = v115.TextTransparency or l_l_Hide_0_0.TextTransparency;
        v115.TextStrokeTransparency = v115.TextStrokeTransparency or l_l_Hide_0_0.TextStrokeTransparency;
        v115.TextScaled = v115.TextScaled or l_l_Hide_0_0.TextScaled;
        v115.TextWrapped = v115.TextWrapped or l_l_Hide_0_0.TextWrapped;
        v115.Font = Enum.Font.Gotham;
        v115.Parent = l_Drag_0;
        local v119 = v8("TextButton", v115);
        local l_UICorner_0 = v119:FindFirstChildOfClass("UICorner");
        if not l_UICorner_0 then
            service.New("UICorner", {
                CornerRadius = UDim.new(0.2, 0), 
                Parent = v119
            });
            return v119;
        else
            l_UICorner_0.CornerRadius = UDim.new(0.2, 0);
            return v119;
        end;
    end;
    functionify = function(v121, v122) --[[ Line: 369 ]] --[[ Name: functionify ]]
        if type(v121) == "string" then
            if v122 then
                local v123 = GetEnv();
                v123.Object = v122;
                return client.Core.LoadCode(v121, v123);
            else
                return client.Core.LoadCode(v121);
            end;
        else
            return v121;
        end;
    end;
    v8 = function(v124, v125, v126) --[[ Line: 383 ]] --[[ Name: create ]]
        -- upvalues: v62 (copy), l_CheckProperty_0 (copy), v1 (ref), v3 (ref), v0 (ref), v6 (ref), v4 (ref), v5 (ref), v2 (ref), l_BindEvent_0 (copy), v9 (ref), l_Desc_0 (copy), l_l_LocalPlayer_0_Mouse_0 (copy), v8 (ref), l_Object_0 (copy), v15 (ref), v23 (ref), v65 (ref), v21 (ref)
        local v127 = v125 or {};
        local v128 = v127.Class or v127.ClassName or v124;
        local v129 = v126 or v62[v128] and v62[v128]:Clone() or service.New(v128);
        local v130 = v127.Parent or v129.Parent;
        if v125 then
            v127.Parent = nil;
            if v127.Class or v127.ClassName then
                v127.Class = nil;
                v127.ClassName = nil;
            end;
            if not v127.BorderColor3 and l_CheckProperty_0(v129, "BorderColor3") then
                v129.BorderColor3 = v1;
            end;
            if not v127.CanvasSize and l_CheckProperty_0(v129, "CanvasSize") then
                v129.CanvasSize = v3;
            end;
            if not v127.BorderSizePixel and l_CheckProperty_0(v129, "BorderSizePixel") then
                v129.BorderSizePixel = 0;
            end;
            if not v127.BackgroundColor3 and l_CheckProperty_0(v129, "BackgroundColor3") then
                v129.BackgroundColor3 = v0;
            end;
            if not v127.PlaceholderColor3 and l_CheckProperty_0(v129, "PlaceholderColor3") then
                v129.PlaceholderColor3 = v6;
            end;
            if not v127.Transparency and not v127.BackgroundTransparency and l_CheckProperty_0(v129, "Transparency") then
                v129.BackgroundTransparency = 0;
            elseif v127.Transparency then
                v129.BackgroundTransparency = v127.Transparency;
            end;
            if not v127.TextColor3 and not v127.TextColor and l_CheckProperty_0(v129, "TextColor3") then
                v129.TextColor3 = v4;
            elseif v127.TextColor then
                v129.TextColor3 = v127.TextColor;
            end;
            if not v127.Font and l_CheckProperty_0(v129, "Font") then
                v127.Font = "Gotham";
            end;
            if not v127.TextSize and l_CheckProperty_0(v129, "TextSize") then
                v127.TextSize = 15;
            end;
            if not v127.BottomImage and not v127.MidImage and not v127.TopImage and v128 == "ScrollingFrame" then
                v129.BottomImage = "http://roblox.com/asset?id=158348114";
                v129.MidImage = "http://roblox.com/asset?id=158348114";
                v129.TopImage = "http://roblox.com/asset?id=158348114";
            end;
            if not v127.Size and l_CheckProperty_0(v129, "Size") then
                v129.Size = v5;
            end;
            if not v127.Position and l_CheckProperty_0(v129, "Position") then
                v129.Position = v2;
            end;
            if not v127.ZIndex and l_CheckProperty_0(v129, "ZIndex") then
                v129.ZIndex = 2;
                if v130 and l_CheckProperty_0(v130, "ZIndex") then
                    v129.ZIndex = v130.ZIndex;
                end;
            end;
            if not v127.ClearTextOnFocus and v128 == "TextBox" then
                v129.ClearTextOnFocus = false;
            end;
            if v127.TextChanged and v128 == "TextBox" then
                local v131 = functionify(v127.TextChanged, v129);
                local l_v131_0 = v131 --[[ copy: 7 -> 45 ]];
                v129.FocusLost:Connect(function(v133) --[[ Line: 463 ]]
                    -- upvalues: l_v131_0 (copy), v129 (copy)
                    l_v131_0(v129.Text, v133, v129);
                end);
            end;
            if (v128 == "TextButton" or v128 == "TextLabel") and not v127.TextTruncate then
                v127.TextTruncate = Enum.TextTruncate.AtEnd;
            end;
            if (v127.OnClicked or v127.OnClick) and (v128 == "TextButton" or v128 == "ImageButton") then
                local v134 = false;
                local l_Debounce_0 = v127.Debounce;
                local v136 = functionify(v127.OnClicked or v127.OnClick, v129);
                local l_l_Debounce_0_0 = l_Debounce_0 --[[ copy: 8 -> 43 ]];
                local l_v136_0 = v136 --[[ copy: 9 -> 44 ]];
                do
                    local l_v134_0 = v134;
                    v129.MouseButton1Down:Connect(function() --[[ Line: 479 ]]
                        -- upvalues: l_v134_0 (ref), l_l_Debounce_0_0 (copy), l_v136_0 (copy), v129 (copy)
                        if not l_v134_0 then
                            if l_l_Debounce_0_0 then
                                l_v134_0 = true;
                            end;
                            l_v136_0(v129);
                            l_v134_0 = false;
                        end;
                    end);
                end;
            end;
            if v127.Events then
                for v140, v141 in pairs(v127.Events) do
                    local v142 = functionify(v141, v129);
                    l_BindEvent_0(v129[v140], function(...) --[[ Line: 495 ]]
                        -- upvalues: v142 (copy)
                        v142(...);
                    end);
                end;
            end;
            if v127.Visible == nil then
                v127.Visible = true;
            end;
            if v127.LabelProps then
                v127.LabelProperties = v127.LabelProps;
            end;
        end;
        if v128 == "Entry" then
            local l_Text_0 = v129.Text;
            local l_Dots_0 = v129.Dots;
            local _ = v129.Desc;
            l_Text_0.ZIndex = v127.ZIndex or v129.ZIndex;
            l_Dots_0.ZIndex = v127.ZIndex or v129.ZIndex;
            if v127.Text then
                v129.Text.Text = v127.Text;
                v129.Text.Visible = true;
                v127.Text = nil;
            end;
            if v127.Desc or v127.ToolTip then
                v129.Desc.Value = v127.Desc or v127.ToolTip;
                v127.Desc = nil;
            end;
            v9(v129, l_Desc_0);
        elseif v127.ToolTip then
            v9(v129, l_Desc_0, v127.ToolTip);
        end;
        if v128 == "ButtonEntry" then
            local l_Button_0 = v129.Button;
            local v147 = false;
            local v148 = functionify(v127.OnClicked, l_Button_0);
            local l_v148_0 = v148 --[[ copy: 9 -> 41 ]];
            local l_l_Button_0_0 = l_Button_0 --[[ copy: 7 -> 42 ]];
            do
                local l_v147_0 = v147;
                v129:SetSpecial("DoClick", function() --[[ Line: 541 ]]
                    -- upvalues: l_v147_0 (ref), l_v148_0 (copy), l_l_Button_0_0 (copy)
                    if not l_v147_0 then
                        l_v147_0 = true;
                        if l_v148_0 then
                            l_v148_0(l_l_Button_0_0);
                        end;
                        l_v147_0 = false;
                    end;
                end);
                v129.Text = v127.Text or v129.Text;
                l_Button_0.ZIndex = v127.ZIndex or v129.ZIndex;
                l_Button_0.MouseButton1Down:Connect(v129.DoClick);
            end;
        end;
        if v128 == "Boolean" then
            local l_Enabled_0 = v127.Enabled;
            local v153 = false;
            local v154 = functionify(v127.OnToggle, v129);
            local l_v154_0 = v154 --[[ copy: 9 -> 39 ]];
            do
                local l_l_Enabled_0_0, l_v153_0 = l_Enabled_0, v153;
                local function v159(v158) --[[ Line: 560 ]] --[[ Name: toggle ]]
                    -- upvalues: l_v153_0 (ref), l_l_Enabled_0_0 (ref), v129 (copy), l_v154_0 (copy)
                    if not l_v153_0 then
                        l_v153_0 = true;
                        if v158 ~= nil and v158 or v158 == nil and l_l_Enabled_0_0 then
                            l_l_Enabled_0_0 = false;
                            v129.Text = "Disabled";
                            v129.TextColor3 = Color3.fromRGB(243, 64, 10);
                        elseif v158 ~= nil and v158 == false or v158 == nil and not l_l_Enabled_0_0 then
                            l_l_Enabled_0_0 = true;
                            v129.Text = "Enabled";
                            v129.TextColor3 = Color3.fromRGB(40, 243, 97);
                        end;
                        if l_v154_0 then
                            l_v154_0(l_l_Enabled_0_0, v129);
                        end;
                        l_v153_0 = false;
                    end;
                end;
                v129.Text = l_l_Enabled_0_0 and "Enabled" or "Disabled";
                v129.TextColor3 = l_l_Enabled_0_0 and Color3.fromRGB(40, 243, 97) or Color3.fromRGB(243, 64, 10);
                local l_v159_0 = v159 --[[ copy: 10 -> 40 ]];
                v129.MouseButton1Down:Connect(function() --[[ Line: 583 ]]
                    -- upvalues: l_v154_0 (copy), l_v159_0 (copy)
                    if l_v154_0 then
                        l_v159_0();
                    end;
                end);
                v129:SetSpecial("Toggle", function(_, v162) --[[ Line: 589 ]]
                    -- upvalues: l_v159_0 (copy)
                    l_v159_0(v162);
                end);
            end;
        end;
        if v128 == "TextString" then
            local l_Text_1 = v127.Text;
            local l_ColorText_0 = v127.ColorText;
            local _ = functionify(v127.OnToggle, v129);
            v129.Text = l_Text_1;
            v129.TextColor3 = l_ColorText_0;
        end;
        if v128 == "StringEntry" then
            local l_Box_0 = v129.Box;
            local v167 = nil;
            v129.Text = v127.Text or v129.Text;
            l_Box_0.ZIndex = v127.ZIndex or v129.ZIndex;
            if v127.BoxText then
                l_Box_0.Text = v127.BoxText;
            end;
            if v127.BoxProperties then
                for v168, v169 in next, v127.BoxProperties do
                    if l_CheckProperty_0(l_Box_0, v168) then
                        l_Box_0[v168] = v169;
                    end;
                end;
            end;
            do
                local l_v167_0 = v167;
                if v127.TextChanged then
                    local v171 = functionify(v127.TextChanged, l_Box_0);
                    local l_v171_0 = v171 --[[ copy: 9 -> 37 ]];
                    local l_l_Box_0_0 = l_Box_0 --[[ copy: 7 -> 38 ]];
                    l_Box_0.Changed:Connect(function(v174) --[[ Line: 621 ]]
                        -- upvalues: l_v167_0 (ref), l_v171_0 (copy), l_l_Box_0_0 (copy)
                        if v174 == "Text" and not l_v167_0 then
                            l_v171_0(l_l_Box_0_0.Text);
                        end;
                    end);
                    l_Box_0.FocusLost:Connect(function(v175) --[[ Line: 627 ]]
                        -- upvalues: l_v171_0 (copy), l_l_Box_0_0 (copy), l_v167_0 (ref)
                        local v176 = l_v171_0(l_l_Box_0_0.Text, true, v175);
                        if v176 then
                            l_v167_0 = true;
                            l_l_Box_0_0.Text = v176;
                            l_v167_0 = false;
                        end;
                    end);
                end;
                local l_l_Box_0_1 = l_Box_0 --[[ copy: 7 -> 36 ]];
                v129:SetSpecial("SetValue", function(_, v179) --[[ Line: 637 ]]
                    -- upvalues: l_l_Box_0_1 (copy)
                    l_l_Box_0_1.Text = v179;
                end);
            end;
        end;
        if v128 == "Slider" then
            local l_Percentage_0 = v129.Percentage;
            local l_Slider_0 = v129.Slider;
            local l_SliderBar_0 = v129.SliderBar;
            local l_Drag_1 = v129.Drag;
            local v184 = false;
            local v185 = 0;
            local v186 = functionify(v127.OnSlide, v129);
            l_SliderBar_0.ZIndex = v127.ZIndex or v129.ZIndex;
            l_Slider_0.ZIndex = l_SliderBar_0.ZIndex + 1;
            l_Drag_1.ZIndex = l_Slider_0.ZIndex + 1;
            l_Drag_1.Active = true;
            if v127.Value then
                l_Slider_0.Position = UDim2.new(0.5, -10, 0.5, -10);
                l_Drag_1.Position = l_Slider_0.Position;
            end;
            local l_l_Slider_0_0 = l_Slider_0 --[[ copy: 8 -> 32 ]];
            local l_l_Drag_1_0 = l_Drag_1 --[[ copy: 10 -> 33 ]];
            local l_l_Percentage_0_0 = l_Percentage_0 --[[ copy: 7 -> 34 ]];
            local l_v186_0 = v186 --[[ copy: 13 -> 35 ]];
            do
                local l_v184_0, l_v185_0 = v184, v185;
                l_SliderBar_0.InputBegan:Connect(function(v193) --[[ Line: 660 ]]
                    -- upvalues: l_v184_0 (ref), l_v185_0 (ref), v129 (copy), l_l_Slider_0_0 (copy), l_l_Drag_1_0 (copy), l_l_Percentage_0_0 (copy), l_v186_0 (copy)
                    if not l_v184_0 and (v193.UserInputType == Enum.UserInputType.MouseButton1 or v193.UserInputType == Enum.UserInputType.Touch) then
                        l_v185_0 = (v193.Position.X - v129.AbsolutePosition.X) / v129.AbsoluteSize.X;
                        if l_v185_0 < 0 then
                            l_v185_0 = 0;
                        elseif l_v185_0 > 1 then
                            l_v185_0 = 1;
                        end;
                        l_l_Slider_0_0.Position = UDim2.new(l_v185_0, -10, 0.5, -10);
                        l_l_Drag_1_0.Position = l_l_Slider_0_0.Position;
                        l_l_Percentage_0_0.Value = l_v185_0;
                        if l_v186_0 then
                            l_v186_0(l_v185_0);
                        end;
                    end;
                end);
                l_Drag_1.DragBegin:Connect(function() --[[ Line: 680 ]]
                    -- upvalues: l_v184_0 (ref)
                    l_v184_0 = true;
                end);
                l_Drag_1.DragStopped:Connect(function() --[[ Line: 684 ]]
                    -- upvalues: l_v184_0 (ref), l_l_Drag_1_0 (copy), l_l_Slider_0_0 (copy)
                    l_v184_0 = false;
                    l_l_Drag_1_0.Position = l_l_Slider_0_0.Position;
                end);
                l_Drag_1.Changed:Connect(function() --[[ Line: 689 ]]
                    -- upvalues: l_v184_0 (ref), l_v185_0 (ref), l_l_LocalPlayer_0_Mouse_0 (ref), v129 (copy), l_l_Slider_0_0 (copy), l_l_Percentage_0_0 (copy), l_v186_0 (copy)
                    if l_v184_0 then
                        l_v185_0 = (l_l_LocalPlayer_0_Mouse_0.X - v129.AbsolutePosition.X) / v129.AbsoluteSize.X;
                        if l_v185_0 < 0 then
                            l_v185_0 = 0;
                        elseif l_v185_0 > 1 then
                            l_v185_0 = 1;
                        end;
                        l_l_Slider_0_0.Position = UDim2.new(l_v185_0, -10, 0.5, -10);
                        l_l_Percentage_0_0.Value = l_v185_0;
                        if l_v186_0 then
                            l_v186_0(l_v185_0);
                        end;
                    end;
                end);
                v129:SetSpecial("SetValue", function(_, v195) --[[ Line: 708 ]]
                    -- upvalues: l_v185_0 (ref), l_l_Percentage_0_0 (copy), l_l_Slider_0_0 (copy), l_l_Drag_1_0 (copy)
                    if v195 and tonumber(v195) then
                        l_v185_0 = tonumber(v195);
                        l_l_Percentage_0_0.Value = l_v185_0;
                        l_l_Slider_0_0.Position = UDim2.new(l_v185_0, -10, 0.5, -10);
                        l_l_Drag_1_0.Position = l_l_Slider_0_0.Position;
                    end;
                end);
            end;
        end;
        if v128 == "Dropdown" then
            local l_Menu_1 = v129.Menu;
            local l_Down_0 = v129.Down;
            local l_dSelected_0 = v129.dSelected;
            local l_Options_0 = v127.Options;
            local v200 = v127.Selected or v127.Selection;
            local v201 = functionify(v127.OnSelection or v127.OnSelect or function() --[[ Line: 724 ]]

            end);
            local l_TextProperties_0 = v127.TextProperties;
            local v203 = v8("ScrollingFrame", {
                Parent = l_Menu_1, 
                Size = UDim2.new(1, 0, 1, 0), 
                Position = UDim2.new(0, 0, 0, 0), 
                BackgroundTransparency = 1, 
                ZIndex = 100
            });
            l_Menu_1.ZIndex = v203.ZIndex;
            l_Menu_1.Parent = l_Object_0;
            l_Menu_1.Visible = false;
            l_Menu_1.Size = UDim2.new(0, v129.AbsoluteSize.X, 0, 100);
            l_Menu_1.BackgroundColor3 = v127.BackgroundColor3 or v129.BackgroundColor3;
            if v127.TextAlignment then
                l_dSelected_0.TextXAlignment = v127.TextAlignment;
                l_dSelected_0.Position = UDim2.new(0, 30, 0, 0);
            end;
            if v127.NoArrow then
                l_Down_0.Visible = false;
            end;
            v129:SetSpecial("MenuContainer", l_Menu_1);
            local l_l_Menu_1_0 = l_Menu_1 --[[ copy: 7 -> 27 ]];
            local l_l_Down_0_0 = l_Down_0 --[[ copy: 8 -> 28 ]];
            local l_l_dSelected_0_0 = l_dSelected_0 --[[ copy: 9 -> 29 ]];
            local l_l_Options_0_0 = l_Options_0 --[[ copy: 10 -> 30 ]];
            v129.Changed:Connect(function(v208) --[[ Line: 751 ]]
                -- upvalues: l_l_Menu_1_0 (copy), v129 (copy), l_l_Down_0_0 (copy), v127 (copy), l_l_dSelected_0_0 (copy), l_l_Options_0_0 (copy), v203 (copy)
                if v208 == "AbsolutePosition" and l_l_Menu_1_0.Visible then
                    l_l_Menu_1_0.Position = UDim2.new(0, v129.AbsolutePosition.X, 0, v129.AbsolutePosition.Y + v129.AbsoluteSize.Y);
                    return;
                else
                    if v208 == "AbsoluteSize" or v208 == "Parent" then
                        l_l_Down_0_0.Size = UDim2.new(0, v129.AbsoluteSize.Y, 1, 0);
                        if v127.TextAlignment == "Right" then
                            l_l_Down_0_0.Position = UDim2.new(0, 0, 0.5, -(l_l_Down_0_0.AbsoluteSize.X / 2));
                            l_l_dSelected_0_0.Position = UDim2.new(0, v129.AbsoluteSize.Y, 0, 0);
                        else
                            l_l_Down_0_0.Position = UDim2.new(1, -l_l_Down_0_0.AbsoluteSize.X, 0.5, -(l_l_Down_0_0.AbsoluteSize.X / 2));
                        end;
                        l_l_dSelected_0_0.Size = UDim2.new(1, -l_l_Down_0_0.AbsoluteSize.X, 1, 0);
                        if l_l_Options_0_0 and #l_l_Options_0_0 <= 6 then
                            l_l_Menu_1_0.Size = UDim2.new(0, v129.AbsoluteSize.X, 0, #l_l_Options_0_0 * 30);
                            return;
                        else
                            l_l_Menu_1_0.Size = UDim2.new(0, v129.AbsoluteSize.X, 0, 180);
                            v203:ResizeCanvas(false, true);
                        end;
                    end;
                    return;
                end;
            end);
            l_dSelected_0.ZIndex = v129.ZIndex;
            l_Down_0.ZIndex = v129.ZIndex;
            if l_TextProperties_0 then
                for v209, v210 in next, l_TextProperties_0 do
                    l_dSelected_0[v209] = v210;
                end;
            end;
            if l_Options_0 then
                for v211, v212 in next, l_Options_0 do
                    local v213 = v203:Add("TextButton", {
                        Text = ("  %*"):format(v212), 
                        Size = UDim2.new(1, -10, 0, 30), 
                        Position = UDim2.new(0, 5, 0, 30 * (v211 - 1)), 
                        ZIndex = l_Menu_1.ZIndex, 
                        BackgroundTransparency = 1, 
                        OnClick = function() --[[ Line: 791 ]] --[[ Name: OnClick ]]
                            -- upvalues: l_dSelected_0 (copy), v212 (copy), v201 (copy), v129 (copy), l_Menu_1 (copy)
                            l_dSelected_0.Text = v212;
                            v201(v212, v129);
                            l_Menu_1.Visible = false;
                        end
                    });
                    if l_TextProperties_0 then
                        for v214, v215 in next, l_TextProperties_0 do
                            v213[v214] = v215;
                        end;
                    end;
                end;
                if v200 then
                    l_dSelected_0.Text = v200;
                else
                    l_dSelected_0.Text = "No Selection";
                end;
                local l_l_Menu_1_1 = l_Menu_1 --[[ copy: 7 -> 31 ]];
                l_dSelected_0.MouseButton1Down:Connect(function() --[[ Line: 811 ]]
                    -- upvalues: l_l_Menu_1_1 (copy), v129 (copy)
                    l_l_Menu_1_1.Position = UDim2.new(0, v129.AbsolutePosition.X, 0, v129.AbsolutePosition.Y + v129.AbsoluteSize.Y);
                    l_l_Menu_1_1.Visible = not l_l_Menu_1_1.Visible;
                end);
            end;
        end;
        if v128 == "TabFrame" then
            local v217 = v8("ScrollingFrame", nil, v129.Buttons);
            local l_Frames_0 = v129.Frames;
            local v219 = 0;
            local _ = v127.ButtonSize or 60;
            v129.BackgroundTransparency = v127.BackgroundTransparency or 1;
            v217.ZIndex = v127.ZIndex or v129.ZIndex;
            l_Frames_0.ZIndex = v217.ZIndex;
            v129:SetSpecial("GetTab", function(_, v222) --[[ Line: 828 ]]
                -- upvalues: l_Frames_0 (copy)
                return l_Frames_0:FindFirstChild(v222);
            end);
            local l_v217_0 = v217 --[[ copy: 7 -> 26 ]];
            do
                local l_v219_0 = v219;
                v129:SetSpecial("NewTab", function(_, v226, v227) --[[ Line: 832 ]]
                    -- upvalues: v15 (ref), l_v217_0 (copy), v8 (ref), v23 (ref), l_Frames_0 (copy), l_v219_0 (ref)
                    local v228 = v227 or {};
                    local v229 = v15(l_v217_0);
                    local l_TextSize_1 = service.TextService:GetTextSize(v228.Text or v226, 15, "Gotham", l_v217_0.AbsoluteSize);
                    local _ = v228.TextTransparency;
                    local v232 = false;
                    local v233 = v8("ScrollingFrame", {
                        Name = v226, 
                        Size = UDim2.new(1, 0, 1, 0), 
                        Position = UDim2.new(0, 0, 0, 0), 
                        BorderSizePixel = 0, 
                        BackgroundTransparency = v228.FrameTransparency or v228.Transparency, 
                        BackgroundColor3 = Color3.fromRGB(24, 24, 24), 
                        ZIndex = l_v217_0.ZIndex, 
                        Visible = false
                    });
                    local v234 = v8("TextButton", {
                        Name = v226, 
                        Text = v228.Text or v226, 
                        Size = UDim2.new(0, l_TextSize_1.X + 20, 1, 0), 
                        ZIndex = l_v217_0.ZIndex, 
                        Position = UDim2.new(0, v229.X.Offset > 0 and v229.X.Offset + 5 or 0, 0, 0), 
                        TextColor3 = v228.TextColor, 
                        Font = Enum.Font.Gotham, 
                        BackgroundTransparency = 0.7, 
                        TextTransparency = v228.TextTransparency, 
                        BackgroundColor3 = Color3.fromRGB(24, 24, 24), 
                        BorderSizePixel = 0
                    });
                    local l_UICorner_1 = Instance.new("UICorner");
                    l_UICorner_1.Parent = v234;
                    l_UICorner_1.CornerRadius = UDim.new(0.2, 0);
                    v233:SetSpecial("FocusTab", function() --[[ Line: 868 ]]
                        -- upvalues: l_v217_0 (ref), v23 (ref), l_Frames_0 (ref), v234 (copy), v228 (copy), v233 (copy)
                        for _, v237 in next, l_v217_0:GetChildren() do
                            if v23(v237) then
                                v237.BackgroundTransparency = 0.7;
                                v237.TextTransparency = 0.7;
                            end;
                        end;
                        for _, v239 in next, l_Frames_0:GetChildren() do
                            if v23(v239) then
                                v239.Visible = false;
                            end;
                        end;
                        v234.BackgroundTransparency = v228.Transparency or 0;
                        v234.TextTransparency = v228.TextTransparency or 0;
                        v233.Visible = true;
                        if v228.OnFocus then
                            v228.OnFocus(true);
                        end;
                    end);
                    local l_UICorner_2 = Instance.new("UICorner");
                    l_UICorner_2.Parent = v233;
                    l_UICorner_2.CornerRadius = UDim.new(0.2, 0);
                    if l_v219_0 == 0 then
                        v233.Visible = true;
                        v234.BackgroundTransparency = v228.Transparency or 0;
                    end;
                    v234.MouseButton1Down:Connect(function() --[[ Line: 886 ]]
                        -- upvalues: v232 (ref), v233 (copy)
                        if not v232 then
                            v233:FocusTab();
                        end;
                    end);
                    v234.Parent = l_v217_0;
                    v233.Parent = l_Frames_0;
                    l_v217_0:ResizeCanvas(true, false);
                    v233:SetSpecial("Disable", function() --[[ Line: 896 ]]
                        -- upvalues: v232 (ref), v234 (copy)
                        v232 = true;
                        v234.BackgroundTransparency = 0.9;
                        v234.TextTransparency = 0.9;
                    end);
                    v233:SetSpecial("Enable", function() --[[ Line: 902 ]]
                        -- upvalues: v232 (ref), v234 (copy), v228 (copy)
                        v232 = false;
                        v234.BackgroundTransparency = 0.7;
                        v234.TextTransparency = v228.TextTransparency or 0;
                    end);
                    l_v219_0 = l_v219_0 + 1;
                    return v233, v234;
                end);
            end;
        end;
        if v128 == "ScrollingFrame" then
            local v241 = false;
            if not v127.ScrollBarThickness then
                v127.ScrollBarThickness = 4;
            end;
            do
                local l_v241_0 = v241;
                v129:SetSpecial("GenerateList", function(v243, v244, v245, v246) --[[ Line: 920 ]]
                    -- upvalues: l_v241_0 (ref), v129 (copy), v8 (ref), l_CheckProperty_0 (ref), v127 (copy)
                    local v247 = v244 or v243;
                    local v248 = {};
                    local v249 = v245 or {};
                    l_v241_0 = v248;
                    v129:ClearAllChildren();
                    local v250 = 0;
                    for v251, v252 in next, v247 do
                        local l_v252_0 = v252;
                        local v254 = nil;
                        local v255 = nil;
                        local v256 = nil;
                        if type(v252) == "table" then
                            l_v252_0 = v252.Text;
                            v254 = v252.Desc;
                            v255 = v252.Color;
                            if v252.RichTextAllowed or v249.RichTextAllowed then
                                v256 = true;
                            end;
                        end;
                        local v257 = v8("TextLabel", {
                            Text = (" %*"):format(l_v252_0), 
                            ToolTip = v254, 
                            Size = UDim2.new(1, -5, 0, v249.ySize or 20), 
                            Visible = true, 
                            BackgroundTransparency = 1, 
                            Font = "Gotham", 
                            TextSize = 14, 
                            TextStrokeTransparency = 0.8, 
                            TextXAlignment = "Left", 
                            Position = UDim2.new(0, 0, 0, v250 * (v249.ySize or 20)), 
                            RichText = v256 or false
                        });
                        if v255 then
                            v257.TextColor3 = v255;
                        end;
                        if v245 then
                            for v258, v259 in next, v249 do
                                if l_CheckProperty_0(v257, v258) then
                                    v257[v258] = v259;
                                end;
                            end;
                        end;
                        if l_v241_0 == v248 then
                            v257.Parent = v129;
                            v250 = v250 + 1;
                            if v127.Delay then
                                if type(v127.Delay) == "number" then
                                    wait(v127.Delay);
                                elseif v251 % 100 == 0 then
                                    wait(0.1);
                                end;
                            end;
                        else
                            v257:Destroy();
                            break;
                        end;
                    end;
                    v129:ResizeCanvas(false, true, false, v246, 5, 5, 50);
                    l_v241_0 = nil;
                end);
                v129:SetSpecial("ResizeCanvas", function(_, v261, v262, v263, v264, _, _, v267) --[[ Line: 993 ]]
                    -- upvalues: v127 (copy), v129 (copy)
                    local v268 = v127.xPadding or 5;
                    local v269 = v127.yPadding or 5;
                    local v270 = 0;
                    local v271 = 0;
                    if not v261 and not v262 then
                        v261 = false;
                        v262 = true;
                    end;
                    for v272, v273 in next, v129:GetChildren() do
                        if v273:IsA("GuiObject") then
                            if v262 then
                                v273.Size = UDim2.new(v273.Size.X.Scale, v273.Size.X.Offset, 0, v273.AbsoluteSize.Y);
                                v273.Position = UDim2.new(v273.Position.X.Scale, v273.Position.X.Offset, 0, v273.AbsolutePosition.Y - v129.AbsolutePosition.Y);
                            end;
                            if v261 then
                                v273.Size = UDim2.new(0, v273.AbsoluteSize.X, v273.Size.Y.Scale, v273.Size.Y.Offset);
                                v273.Position = UDim2.new(0, v273.AbsolutePosition.X - v129.AbsolutePosition.X, v273.Position.Y.Scale, v273.Position.Y.Offset);
                            end;
                            local v274 = v273.Position.Y.Offset + v273.Size.Y.Offset;
                            local v275 = v273.Position.X.Offset + v273.Size.X.Offset;
                            v270 = math.max(v270, v274);
                            v271 = math.max(v271, v275);
                            if v267 and v272 % v267 == 0 then
                                wait(0.016666666666666666);
                            end;
                        end;
                    end;
                    if v262 then
                        v129.CanvasSize = UDim2.new(v129.CanvasSize.X.Scale, v129.CanvasSize.X.Offset, 0, v270 + v269);
                    end;
                    if v261 then
                        v129.CanvasSize = UDim2.new(0, v271 + v268, v129.CanvasSize.Y.Scale, v129.CanvasSize.Y.Offset);
                    end;
                    if v263 then
                        v129.CanvasPosition = Vector2.new(v271 + v268 - v129.AbsoluteSize.X, v129.CanvasPosition.Y);
                    end;
                    if v264 then
                        v129.CanvasPosition = Vector2.new(v129.CanvasPosition.X, v270 + v269 - v129.AbsoluteSize.Y);
                    end;
                end);
                if v127.List then
                    v129:GenerateList(v127.List);
                    v127.List = nil;
                end;
            end;
        end;
        v65(v129, v127.Content or v127.Children);
        v127.Children = nil;
        v127.Content = nil;
        for v276, v277 in next, v127 do
            if l_CheckProperty_0(v129, v276) then
                v129[v276] = v277;
            end;
        end;
        v129.Parent = v130;
        return v21(v129, v127, v128), v127;
    end;
    v21 = function(v278, v279, _) --[[ Line: 1058 ]] --[[ Name: apiIfy ]]
        -- upvalues: v8 (ref), v21 (ref)
        local v281 = service.Wrap(v278);
        v278:SetSpecial("Object", v278);
        v278:SetSpecial("SetPosition", function(_, v283) --[[ Line: 1061 ]]
            -- upvalues: v278 (copy)
            v278.Position = v283;
        end);
        v278:SetSpecial("SetSize", function(_, v285) --[[ Line: 1062 ]]
            -- upvalues: v278 (copy)
            v278.Size = v285;
        end);
        v278:SetSpecial("Add", function(v286, v287, v288) --[[ Line: 1063 ]]
            -- upvalues: v8 (ref), v278 (copy), v21 (ref)
            if not v288 then
                v288 = v287;
                v287 = v286;
            end;
            local v289 = v8(v287, v288);
            v289.Parent = v278;
            return v21(v289, v288, v287);
        end);
        v278:SetSpecial("Copy", function(_, v291, v292) --[[ Line: 1070 ]]
            -- upvalues: v279 (copy), v8 (ref), v278 (copy), v21 (ref)
            local v293 = {};
            local v294 = nil;
            for v295, v296 in next, v279 do
                v293[v295] = v296;
            end;
            for v297, v298 in next, v292 do
                v293[v297] = v298;
            end;
            v294 = v8(v291 or v279.Class or v278.ClassName, v293);
            v294.Parent = v292.Parent or v278.Parent;
            return v21(v294, v279, v291);
        end);
        return v281;
    end;
    v11 = function() --[[ Line: 1090 ]] --[[ Name: doClose ]]
        -- upvalues: v58 (ref), l_gTable_0 (copy)
        if not v58 then
            v58 = true;
            l_gTable_0:Destroy();
        end;
    end;
    v13 = function() --[[ Line: 1097 ]] --[[ Name: isVisible ]]
        -- upvalues: l_Main_0 (copy)
        return l_Main_0.Visible;
    end;
    v10 = function(v299) --[[ Line: 1101 ]] --[[ Name: doHide ]]
        -- upvalues: l_Hide_0 (copy), l_Main_0 (copy), v12 (ref), l_Drag_0 (copy), l_gTable_0 (copy), l_OnMinimize_0 (copy), l_Walls_0 (copy), v16 (ref)
        local l_LineHeight_0 = l_Hide_0.LineHeight;
        if v299 or v299 == nil and l_Main_0.Visible then
            v12 = l_Drag_0.Size;
            l_Main_0.Parent.Minimized.Visible = true;
            l_Main_0.Visible = false;
            l_Drag_0.BackgroundColor3 = l_Main_0.BackgroundColor3;
            l_Drag_0.Size = v12 or l_Drag_0.Size;
            l_Hide_0.Outer.Image = "rbxassetid://7472853084";
            l_Hide_0.LineHeight = l_LineHeight_0;
            l_gTable_0.Minimized = true;
        elseif v299 == false or v299 == nil and not l_Main_0.Visible then
            l_Main_0.Visible = true;
            l_Main_0.Parent.Minimized.Visible = false;
            l_Drag_0.Size = v12 or l_Drag_0.Size;
            l_Hide_0.Outer.Image = "rbxassetid://7462814901";
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
    v19 = function(v301, v302, v303) --[[ Line: 1132 ]] --[[ Name: isInFrame ]]
        if v303.AbsolutePosition.X < v301 and v301 < v303.AbsolutePosition.X + v303.AbsoluteSize.X and v303.AbsolutePosition.Y < v302 and v302 < v303.AbsolutePosition.Y + v303.AbsoluteSize.Y then
            return true;
        else
            return false;
        end;
    end;
    v16 = function() --[[ Line: 1140 ]] --[[ Name: wallPosition ]]
        -- upvalues: l_gTable_0 (copy), l_Drag_0 (copy), l_Object_0 (copy), l_Main_0 (copy)
        if l_gTable_0.Active then
            local l_X_0 = l_Drag_0.AbsolutePosition.X;
            local l_Y_0 = l_Drag_0.AbsolutePosition.Y;
            local l_X_1 = l_Drag_0.AbsoluteSize.X;
            local l_X_2 = l_Object_0.AbsoluteSize.X;
            local l_Y_1 = l_Object_0.AbsoluteSize.Y;
            local v309 = l_Main_0.Visible and l_Main_0.AbsoluteSize.Y or l_Drag_0.AbsoluteSize.Y;
            if l_X_0 < 0 then
                l_Drag_0.Position = UDim2.new(0, 0, l_Drag_0.Position.Y.Scale, l_Drag_0.Position.Y.Offset);
            end;
            if l_Y_0 < 0 then
                l_Drag_0.Position = UDim2.new(l_Drag_0.Position.X.Scale, l_Drag_0.Position.X.Offset, 0, 0);
            end;
            if l_X_2 < l_X_0 + l_X_1 then
                l_Drag_0.Position = UDim2.new(0, l_Object_0.AbsoluteSize.X - l_Drag_0.AbsoluteSize.X, l_Drag_0.Position.Y.Scale, l_Drag_0.Position.Y.Offset);
            end;
            if l_Y_1 < l_Y_0 + v309 then
                l_Drag_0.Position = UDim2.new(l_Drag_0.Position.X.Scale, l_Drag_0.Position.X.Offset, 0, l_Object_0.AbsoluteSize.Y - v309);
            end;
        end;
    end;
    v20 = function(v310) --[[ Line: 1164 ]] --[[ Name: setSize ]]
        -- upvalues: l_Drag_0 (copy), l_Main_0 (copy)
        if v310 and type(v310) == "table" then
            if v310[1] < 50 then
                v310[1] = 50;
            end;
            if v310[2] < 50 then
                v310[2] = 50;
            end;
            l_Drag_0.Size = UDim2.new(0, v310[1], 0, 25);
            l_Main_0.Size = UDim2.new(1, 0, 0, v310[2]);
        end;
    end;
    v17 = function(v311) --[[ Line: 1174 ]] --[[ Name: setPosition ]]
        -- upvalues: l_Drag_0 (copy), l_Size_0 (copy), l_Main_0 (copy)
        if v311 and typeof(v311) == "UDim2" then
            l_Drag_0.Position = v311;
            return;
        elseif v311 and type(v311) == "table" then
            l_Drag_0.Position = UDim2.new(0, v311[1], 0, v311[2]);
            return;
        else
            if l_Size_0 and not v311 then
                l_Drag_0.Position = UDim2.new(0.5, -l_Drag_0.AbsoluteSize.X / 2, 0.5, -l_Main_0.AbsoluteSize.Y / 2);
            end;
            return;
        end;
    end;
    if l_Name_0 then
        l_gTable_0.Name = l_Name_0;
        if v24.AllowMultiple ~= nil and v24.AllowMultiple == false then
            local v312, _ = client.UI.Get(l_Name_0, l_Object_0, true);
            if v312 then
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
        l_Drag_0.DragStopped:Connect(function() --[[ Line: 1236 ]]
            -- upvalues: v16 (ref)
            v16();
        end);
    end;
    if l_OnRefresh_0 then
        local v314 = false;
        v14 = function() --[[ Line: 1243 ]] --[[ Name: DoRefresh ]]
            -- upvalues: v60 (ref), l_gTable_0 (copy), l_Spinner_0 (copy), l_OnRefresh_0 (copy)
            if not v60 then
                local v315 = false;
                v60 = true;
                do
                    local l_v315_0 = v315;
                    task.spawn(function() --[[ Line: 1248 ]]
                        -- upvalues: l_gTable_0 (ref), l_v315_0 (ref), l_Spinner_0 (ref)
                        while l_gTable_0.Active and not l_v315_0 do
                            for v317 = 0, 180, 10 do
                                l_Spinner_0.Rotation = -v317;
                                wait(0.016666666666666666);
                            end;
                        end;
                    end);
                    l_OnRefresh_0();
                    wait(1);
                    l_v315_0 = true;
                    v60 = false;
                end;
            end;
        end;
        do
            local l_v314_0 = v314;
            l_Refresh_0.MouseButton1Down:Connect(function() --[[ Line: 1264 ]]
                -- upvalues: l_v314_0 (ref), v14 (ref)
                if not l_v314_0 then
                    l_v314_0 = true;
                    v14();
                    l_v314_0 = false;
                end;
            end);
            l_Title_1.Size = UDim2.new(1, -130, l_Title_1.Size.Y.Scale, l_Title_1.Size.Y.Offset);
        end;
    else
        l_Refresh_0.Visible = false;
    end;
    if l_IconClicked_0 then
        l_Icon_2.MouseButton1Down(function() --[[ Line: 1278 ]]
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
        local l_X_3 = l_Drag_0.AbsolutePosition.X;
        local l_Y_2 = l_Drag_0.AbsolutePosition.Y;
        local l_X_4 = l_Drag_0.AbsoluteSize.X;
        local l_Y_3 = l_Drag_0.AbsoluteSize.Y;
        local _ = client.Variables;
        local v324 = nil;
        local v325 = nil;
        local v326 = nil;
        do
            local l_l_X_3_0, l_l_Y_2_0, l_l_X_4_0, l_l_Y_3_0, l_v324_0, l_v325_0, l_v326_0 = l_X_3, l_Y_2, l_X_4, l_Y_3, v324, v325, v326;
            local function _(v334) --[[ Line: 1305 ]] --[[ Name: readify ]]
                -- upvalues: l_v326_0 (ref)
                v334.MouseEnter:Connect(function() --[[ Line: 1306 ]]
                    -- upvalues: l_v326_0 (ref), v334 (copy)
                    l_v326_0 = v334;
                end);
                v334.MouseLeave:Connect(function() --[[ Line: 1310 ]]
                    -- upvalues: l_v326_0 (ref), v334 (copy)
                    if l_v326_0 == v334 then
                        l_v326_0 = nil;
                    end;
                end);
            end;
            v18 = function(v336, v337) --[[ Line: 1330 ]] --[[ Name: checkMouse ]]
                -- upvalues: l_gTable_0 (copy), l_Main_0 (copy), v19 (ref), l_Drag_0 (copy), l_ScrollingFrame_0 (copy), l_v325_0 (ref), l_v324_0 (ref), l_TopRight_0 (copy), v7 (ref), l_TopLeft_0 (copy), l_RightCorner_0 (copy), l_LeftCorner_0 (copy), l_RightSide_0 (copy), l_LeftSide_0 (copy), l_Bottom_0 (copy), l_Top_0 (copy), l_l_LocalPlayer_0_Mouse_0 (copy), l_Icon_1 (ref)
                if l_gTable_0.Active and l_Main_0.Visible then
                    if v19(v336, v337, l_Drag_0) or v19(v336, v337, l_ScrollingFrame_0) then
                        l_v325_0 = nil;
                        l_v324_0 = nil;
                    elseif v19(v336, v337, l_TopRight_0) then
                        l_v325_0 = "TopRight";
                        l_v324_0 = v7.TopRight;
                    elseif v19(v336, v337, l_TopLeft_0) then
                        l_v325_0 = "TopLeft";
                        l_v324_0 = v7.TopLeft;
                    elseif v19(v336, v337, l_RightCorner_0) then
                        l_v325_0 = "RightCorner";
                        l_v324_0 = v7.RightCorner;
                    elseif v19(v336, v337, l_LeftCorner_0) then
                        l_v325_0 = "LeftCorner";
                        l_v324_0 = v7.LeftCorner;
                    elseif v19(v336, v337, l_RightSide_0) then
                        l_v325_0 = "RightSide";
                        l_v324_0 = v7.Horizontal;
                    elseif v19(v336, v337, l_LeftSide_0) then
                        l_v325_0 = "LeftSide";
                        l_v324_0 = v7.Horizontal;
                    elseif v19(v336, v337, l_Bottom_0) then
                        l_v325_0 = "Bottom";
                        l_v324_0 = v7.Vertical;
                    elseif v19(v336, v337, l_Top_0) then
                        l_v325_0 = "Top";
                        l_v324_0 = v7.Vertical;
                    else
                        l_v325_0 = nil;
                        l_v324_0 = nil;
                    end;
                else
                    l_v325_0 = nil;
                end;
                if not client.Variables.MouseLockedBy or client.Variables.MouseLockedBy == l_gTable_0 then
                    if l_v325_0 and l_v324_0 then
                        l_l_LocalPlayer_0_Mouse_0.Icon = l_v324_0;
                        client.Variables.MouseLockedBy = l_gTable_0;
                        return;
                    elseif client.Variables.MouseLockedBy == l_gTable_0 then
                        l_l_LocalPlayer_0_Mouse_0.Icon = l_Icon_1;
                        client.Variables.MouseLockedBy = nil;
                    end;
                end;
            end;
            local function v340(v338, v339) --[[ Line: 1378 ]] --[[ Name: inputStart ]]
                -- upvalues: v18 (ref), l_gTable_0 (copy), l_v325_0 (ref), v59 (ref), v19 (ref), l_ScrollingFrame_0 (copy), l_Drag_0 (copy), l_l_X_3_0 (ref), l_l_Y_2_0 (ref), l_l_X_4_0 (ref), l_l_Y_3_0 (ref), l_Main_0 (copy)
                v18(v338, v339);
                if l_gTable_0.Active and l_v325_0 and not v59 and not v19(v338, v339, l_ScrollingFrame_0) and not v19(v338, v339, l_Drag_0) then
                    v59 = l_v325_0;
                    l_l_X_3_0 = l_Drag_0.AbsolutePosition.X;
                    l_l_Y_2_0 = l_Drag_0.AbsolutePosition.Y;
                    l_l_X_4_0 = l_Drag_0.AbsoluteSize.X;
                    l_l_Y_3_0 = l_Main_0.AbsoluteSize.Y;
                end;
            end;
            local function v341() --[[ Line: 1389 ]] --[[ Name: inputEnd ]]
                -- upvalues: l_gTable_0 (copy), v59 (ref), l_OnResize_0 (copy), l_Drag_0 (copy), l_Main_0 (copy), l_l_LocalPlayer_0_Mouse_0 (copy), l_Icon_1 (ref)
                if l_gTable_0.Active then
                    if v59 and l_OnResize_0 then
                        l_OnResize_0(UDim2.new(l_Drag_0.Size.X.Scale, l_Drag_0.Size.X.Offset, l_Main_0.Size.Y.Scale, l_Main_0.Size.Y.Offset));
                    end;
                    v59 = nil;
                    l_l_LocalPlayer_0_Mouse_0.Icon = l_Icon_1;
                end;
            end;
            local function v351(v342, v343) --[[ Line: 1404 ]] --[[ Name: inputMoved ]]
                -- upvalues: l_gTable_0 (copy), l_l_LocalPlayer_0_Mouse_0 (copy), v7 (ref), l_Icon_1 (ref), v59 (ref), l_Drag_0 (copy), l_l_X_4_0 (ref), l_l_Y_3_0 (ref), l_l_X_3_0 (ref), l_l_Y_2_0 (ref), v55 (copy), v56 (copy), l_Main_0 (copy), l_Title_1 (copy), v18 (ref)
                if l_gTable_0.Active then
                    if l_l_LocalPlayer_0_Mouse_0.Icon ~= v7.TopRight and l_l_LocalPlayer_0_Mouse_0.Icon ~= v7.TopLeft and l_l_LocalPlayer_0_Mouse_0.Icon ~= v7.RightCorner and l_l_LocalPlayer_0_Mouse_0.Icon ~= v7.LeftCorner and l_l_LocalPlayer_0_Mouse_0.Icon ~= v7.Horizontal and l_l_LocalPlayer_0_Mouse_0.Icon ~= v7.Vertical then
                        l_Icon_1 = l_l_LocalPlayer_0_Mouse_0.Icon;
                    end;
                    if v59 then
                        local v344 = false;
                        local v345 = false;
                        local l_Position_1 = l_Drag_0.Position;
                        local l_v342_0 = v342;
                        local l_v343_0 = v343;
                        local l_l_l_X_4_0_0 = l_l_X_4_0;
                        local l_l_l_Y_3_0_0 = l_l_Y_3_0;
                        if v59 == "TopRight" then
                            l_l_l_X_4_0_0 = l_v342_0 - l_l_X_3_0 + 3;
                            l_l_l_Y_3_0_0 = l_l_Y_2_0 - l_v343_0 + l_l_Y_3_0 - 1;
                            v345 = true;
                        elseif v59 == "TopLeft" then
                            l_l_l_X_4_0_0 = l_l_X_3_0 - l_v342_0 + l_l_X_4_0 - 1;
                            l_l_l_Y_3_0_0 = l_l_Y_2_0 - l_v343_0 + l_l_Y_3_0 - 1;
                            v345 = true;
                            v344 = true;
                        elseif v59 == "RightCorner" then
                            l_l_l_X_4_0_0 = l_v342_0 - l_l_X_3_0 + 3;
                            l_l_l_Y_3_0_0 = l_v343_0 - l_l_Y_2_0 + 3;
                        elseif v59 == "LeftCorner" then
                            l_l_l_X_4_0_0 = l_l_X_3_0 - l_v342_0 + l_l_X_4_0 + 3;
                            l_l_l_Y_3_0_0 = l_v343_0 - l_l_Y_2_0 + 3;
                            v344 = true;
                        elseif v59 == "LeftSide" then
                            l_l_l_X_4_0_0 = l_l_X_3_0 - l_v342_0 + l_l_X_4_0 + 3;
                            l_l_l_Y_3_0_0 = l_l_Y_3_0;
                            v344 = true;
                        elseif v59 == "RightSide" then
                            l_l_l_X_4_0_0 = l_v342_0 - l_l_X_3_0 + 3;
                            l_l_l_Y_3_0_0 = l_l_Y_3_0;
                        elseif v59 == "Bottom" then
                            l_l_l_X_4_0_0 = l_l_X_4_0;
                            l_l_l_Y_3_0_0 = l_v343_0 - l_l_Y_2_0 + 3;
                        elseif v59 == "Top" then
                            l_l_l_X_4_0_0 = l_l_X_4_0;
                            l_l_l_Y_3_0_0 = l_l_Y_2_0 - l_v343_0 + l_l_Y_3_0 - 1;
                            v345 = true;
                        end;
                        if l_l_l_X_4_0_0 < v55[1] then
                            l_l_l_X_4_0_0 = v55[1];
                        end;
                        if l_l_l_Y_3_0_0 < v55[2] then
                            l_l_l_Y_3_0_0 = v55[2];
                        end;
                        if v56[1] < l_l_l_X_4_0_0 then
                            l_l_l_X_4_0_0 = v56[1];
                        end;
                        if v56[2] < l_l_l_Y_3_0_0 then
                            l_l_l_Y_3_0_0 = v56[2];
                        end;
                        if v344 then
                            l_Position_1 = UDim2.new(0, l_l_X_3_0 + l_l_X_4_0 - l_l_l_X_4_0_0, l_Position_1.Y.Scale, l_Position_1.Y.Offset);
                        end;
                        if v345 then
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
                        v18(v342, v343);
                    end;
                end;
            end;
            l_BindEvent_0(l_UserInputService_0.InputBegan, function(v352, v353) --[[ Line: 1479 ]]
                -- upvalues: v340 (copy)
                if not v353 and (v352.UserInputType == Enum.UserInputType.MouseButton1 or v352.UserInputType == Enum.UserInputType.Touch) then
                    local l_Position_2 = v352.Position;
                    v340(l_Position_2.X, l_Position_2.Y);
                end;
            end);
            l_BindEvent_0(l_UserInputService_0.InputChanged, function(v355, _) --[[ Line: 1486 ]]
                -- upvalues: v351 (copy)
                if v355.UserInputType == Enum.UserInputType.MouseMovement or v355.UserInputType == Enum.UserInputType.Touch then
                    local l_Position_3 = v355.Position;
                    v351(l_Position_3.X, l_Position_3.Y);
                end;
            end);
            l_BindEvent_0(l_UserInputService_0.InputEnded, function(v358, _) --[[ Line: 1493 ]]
                -- upvalues: v341 (copy)
                if v358.UserInputType == Enum.UserInputType.MouseButton1 or v358.UserInputType == Enum.UserInputType.Touch then
                    v341();
                end;
            end);
        end;
    else
        l_LeftResizeIcon_0.Visible = false;
        l_RightResizeIcon_0.Visible = false;
    end;
    l_Close_0.MouseButton1Down:Connect(v11);
    l_Hide_0.MouseButton1Down:Connect(function() --[[ Line: 1530 ]]
        -- upvalues: v10 (ref)
        v10();
    end);
    l_gTable_0.CustomDestroy = function() --[[ Line: 1531 ]]
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
    for _, v361 in next, l_Object_0:GetChildren() do
        if v361.Name ~= "Desc" and v361.Name ~= "Drag" then
            v62[v361.Name] = v361;
            v361.Parent = nil;
        end;
    end;
    local v362 = Instance.new("BoolValue", l_Object_0);
    local v363 = false;
    local v364 = nil;
    local v365 = nil;
    v362.Name = "__ADONIS_WINDOW";
    l_BindEvent_0(l_Main_0.InputBegan, function(v366) --[[ Line: 1562 ]]
        -- upvalues: l_gTable_0 (copy), v66 (ref)
        if l_gTable_0.Active and (v366.UserInputType == Enum.UserInputType.MouseButton1 or v366.UserInputType == Enum.UserInputType.Touch) then
            v66();
        end;
    end);
    do
        local l_v363_0, l_v364_0, l_v365_0 = v363, v364, v365;
        l_BindEvent_0(l_Drag_0.InputBegan, function(v370) --[[ Line: 1568 ]]
            -- upvalues: l_gTable_0 (copy), l_v365_0 (ref), v66 (ref)
            if l_gTable_0.Active then
                l_v365_0 = true;
                if v370.UserInputType == Enum.UserInputType.MouseButton1 or v370.UserInputType == Enum.UserInputType.Touch then
                    v66();
                end;
            end;
        end);
        l_BindEvent_0(l_Drag_0.InputChanged, function(_) --[[ Line: 1578 ]]
            -- upvalues: l_gTable_0 (copy), l_v365_0 (ref)
            if l_gTable_0.Active then
                l_v365_0 = true;
            end;
        end);
        l_BindEvent_0(l_Drag_0.InputEnded, function(_) --[[ Line: 1584 ]]
            -- upvalues: l_v365_0 (ref)
            l_v365_0 = false;
        end);
        l_BindEvent_0(l_UserInputService_0.InputBegan, function(v373) --[[ Line: 1588 ]]
            -- upvalues: l_v365_0 (ref), l_Object_0 (copy), l_v363_0 (ref), v66 (ref), l_v364_0 (ref), l_Drag_0 (copy)
            if l_v365_0 and l_Object_0.DisplayOrder == 101 and not l_v363_0 and (v373.UserInputType == Enum.UserInputType.MouseButton1 or v373.UserInputType == Enum.UserInputType.Touch) then
                l_v363_0 = true;
                v66();
                l_v364_0 = Vector2.new(l_Drag_0.AbsolutePosition.X - v373.Position.X, l_Drag_0.AbsolutePosition.Y - v373.Position.Y);
            end;
        end);
        l_BindEvent_0(l_UserInputService_0.InputChanged, function(v374) --[[ Line: 1596 ]]
            -- upvalues: l_v363_0 (ref), l_Drag_0 (copy), l_v364_0 (ref)
            if l_v363_0 and (v374.UserInputType == Enum.UserInputType.MouseMovement or v374.UserInputType == Enum.UserInputType.Touch) then
                l_Drag_0.Position = UDim2.new(0, l_v364_0.X + v374.Position.X, 0, l_v364_0.Y + v374.Position.Y);
            end;
        end);
        l_BindEvent_0(l_UserInputService_0.InputEnded, function(v375) --[[ Line: 1602 ]]
            -- upvalues: l_v363_0 (ref)
            if v375.UserInputType == Enum.UserInputType.MouseButton1 or v375.UserInputType == Enum.UserInputType.Touch then
                l_v363_0 = false;
            end;
        end);
    end;
    v362 = v21(l_ScrollingFrame_0, v24);
    v363 = v362:GetMetatable();
    v364 = v363.__newindex;
    v365 = v363.__index;
    v8("ScrollingFrame", nil, l_ScrollingFrame_0);
    v65(v362, v54);
    v362:SetSpecial("gTable", l_gTable_0);
    v362:SetSpecial("Window", l_Object_0);
    v362:SetSpecial("Main", l_Main_0);
    v362:SetSpecial("Title", l_Title_1);
    v362:SetSpecial("Dragger", l_Drag_0);
    v362:SetSpecial("Destroy", v11);
    v362:SetSpecial("Close", v11);
    v362:SetSpecial("Object", l_ScrollingFrame_0);
    v362:SetSpecial("Refresh", v14);
    v362:SetSpecial("AddTitleButton", function(v376, v377) --[[ Line: 1627 ]]
        -- upvalues: v64 (ref)
        if type(v376) == "table" and not v377 then
            v377 = v376;
        end;
        return v64(v377);
    end);
    v362:SetSpecial("Ready", function() --[[ Line: 1628 ]]
        -- upvalues: l_OnReady_0 (copy), l_gTable_0 (copy), v66 (ref)
        if l_OnReady_0 then
            l_OnReady_0();
        end;
        l_gTable_0.Ready();
        v66();
    end);
    v362:SetSpecial("BindEvent", function(_, ...) --[[ Line: 1629 ]]
        -- upvalues: l_BindEvent_0 (copy)
        return l_BindEvent_0(...);
    end);
    v362:SetSpecial("Hide", function(_, v380) --[[ Line: 1630 ]]
        -- upvalues: v10 (ref)
        v10(v380);
    end);
    v362:SetSpecial("SetTitle", function(_, v382) --[[ Line: 1631 ]]
        -- upvalues: l_Title_1 (copy)
        l_Title_1.Text = v382;
    end);
    v362:SetSpecial("SetPosition", function(_, v384) --[[ Line: 1632 ]]
        -- upvalues: v17 (ref)
        v17(v384);
    end);
    v362:SetSpecial("SetSize", function(_, v386) --[[ Line: 1633 ]]
        -- upvalues: v20 (ref)
        v20(v386);
    end);
    v362:SetSpecial("GetPosition", function() --[[ Line: 1634 ]]
        -- upvalues: l_Drag_0 (copy)
        return l_Drag_0.AbsolutePosition;
    end);
    v362:SetSpecial("GetSize", function() --[[ Line: 1635 ]]
        -- upvalues: l_Main_0 (copy)
        return l_Main_0.AbsoluteSize;
    end);
    v362:SetSpecial("IsVisible", v13);
    v362:SetSpecial("IsClosed", v58);
    v363.__index = function(v387, v388) --[[ Line: 1639 ]]
        -- upvalues: v13 (ref), v58 (ref), v365 (copy)
        if v388 == "IsVisible" then
            return v13();
        elseif v388 == "Closed" then
            return v58;
        else
            return v365(v387, v388);
        end;
    end;
    v20(l_Size_0);
    v17(l_Position_0);
    if l_Ready_0 then
        l_gTable_0:Ready();
        v66();
    end;
    return v362, l_Object_0;
end;