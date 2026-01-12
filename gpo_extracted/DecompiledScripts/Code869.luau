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
local function v24(v23) --[[ Line: 147 ]] --[[ Name: isGui ]]
    return v23:IsA("GuiObject");
end;
return function(v25, v26) --[[ Line: 152 ]]
    -- upvalues: v9 (ref), v10 (ref), v16 (ref), v2 (copy), v4 (copy), v0 (copy), v7 (copy), v5 (copy), v6 (copy), v3 (copy), v1 (copy), v24 (copy), v22 (ref), v12 (ref), v14 (ref), v13 (ref), v17 (ref), v11 (ref), v20 (ref), v21 (ref), v18 (ref), v15 (ref), v8 (copy), v19 (ref)
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
    local function v91(v89) --[[ Line: 224 ]] --[[ Name: RippleEffect ]]
        -- upvalues: v9 (ref)
        task.spawn(function() --[[ Line: 225 ]]
            -- upvalues: v89 (copy), v9 (ref)
            v89.ClipsDescendants = true;
            local v90 = v9("ImageLabel", {
                Parent = v89, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BorderSizePixel = 0, 
                ZIndex = v89.ZIndex + 1, 
                BackgroundTransparency = 0.5, 
                ImageTransparency = 0.8, 
                Image = "rbxasset://textures/whiteCircle.png", 
                Position = UDim2.new(0.5, 0, 0.5, 0)
            });
            v90:TweenSize(UDim2.new(0, v89.AbsoluteSize.X * 2.5, 0, v89.AbsoluteSize.X * 2.5), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.2);
            task.wait(0.2);
            v90:Destroy();
        end);
    end;
    local v92 = service.New("Sound");
    v92.Parent = l_Object_0.Drag;
    v92.Volume = 0.4;
    v92.SoundId = "rbxassetid://6706935653";
    l_Main_0.DescendantAdded:Connect(function(v93) --[[ Line: 248 ]]
        if v93:IsA("TextButton") and not v93:FindFirstChildOfClass("UIGradient") then
            Instance.new("UIGradient", v93).Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)), 
                ColorSequenceKeypoint.new(1, Color3.fromRGB(80, 80, 80))
            });
        end;
    end);
    v10 = function(v94, v95, v96) --[[ Line: 263 ]] --[[ Name: Expand ]]
        -- upvalues: v64 (ref)
        local l_Label_0 = v95:FindFirstChild("Label");
        if l_Label_0 then
            v94.MouseLeave:Connect(function(_, _) --[[ Line: 267 ]]
                -- upvalues: v64 (ref), v94 (copy), v95 (copy)
                if v64 == v94 then
                    v95.Visible = false;
                end;
            end);
            v94.MouseMoved:Connect(function(v100, v101) --[[ Line: 273 ]]
                -- upvalues: v64 (ref), v94 (copy), v96 (copy), l_Label_0 (copy), v95 (copy)
                v64 = v94;
                local v102 = v96 or v94.Desc.Value;
                l_Label_0.Text = v102;
                local _ = l_Label_0.ContentText;
                local v104 = 500;
                local l_X_0 = service.TextService:GetTextSize(v102 or v94.Desc.Value, l_Label_0.TextSize, l_Label_0.Font, Vector2.new(1000, 1000)).X;
                local v106 = math.floor(l_X_0 / 500) + 1;
                if v106 < 1 then
                    v106 = 1;
                end;
                if l_X_0 < 500 then
                    v104 = l_X_0;
                end;
                v95.Size = UDim2.new(0, v104 + 10, 0, v106 * 20 + 10);
                v95.Position = UDim2.new(0, v100 + 6, 0, v101 - 40 - (v106 * 20 + 10));
                v95.Visible = v102 ~= "";
            end);
        end;
    end;
    v16 = function(v107) --[[ Line: 295 ]] --[[ Name: getNextPos ]]
        -- upvalues: l_CheckProperty_0 (copy)
        local v108 = nil;
        local v109 = nil;
        for _, v111 in v107:GetChildren() do
            if l_CheckProperty_0(v111, "Size") then
                if not v108 or v111.AbsolutePosition.X + v111.AbsoluteSize.X > v108.AbsolutePosition.X + v108.AbsoluteSize.X then
                    v108 = v111;
                end;
                if not v109 or v111.AbsolutePosition.Y + v111.AbsoluteSize.Y > v108.AbsolutePosition.Y + v108.AbsoluteSize.Y then
                    v109 = v111;
                end;
            end;
        end;
        return not (v108 and v109) and UDim2.new(0, 0, 0, 0) or UDim2.new(v108.Position.X.Scale, v108.Position.X.Offset + v108.AbsoluteSize.X, v109.Position.Y.Scale, v109.Position.Y.Offset + v109.AbsoluteSize.Y);
    end;
    v66 = function(v112, v113) --[[ Line: 312 ]] --[[ Name: LoadChildren ]]
        -- upvalues: v68 (ref), v9 (ref)
        if v113 then
            local v114 = v113.RunWhenDone and v68(v113.RunWhenDone, v112);
            for v115, v116 in v113 do
                if type(v116) == "table" then
                    if not v116.Parent then
                        v116.Parent = v112;
                    end;
                    v9(v116.Class or v116.ClassName or v115, v116);
                elseif type(v116) == "function" or type(v116) == "string" and not v114 then
                    v114 = v68(v116, v112);
                end;
            end;
            if v114 then
                v114(v112);
            end;
        end;
    end;
    v67 = function() --[[ Line: 330 ]] --[[ Name: BringToFront ]]
        -- upvalues: l_LocalPlayer_0 (copy), l_Object_0 (copy)
        for _, v118 in ipairs(l_LocalPlayer_0.PlayerGui:GetChildren()) do
            if v118:FindFirstChild("__ADONIS_WINDOW") then
                v118.DisplayOrder = 100;
            end;
        end;
        l_Object_0.DisplayOrder = 101;
    end;
    v65 = function(v119) --[[ Line: 340 ]] --[[ Name: addTitleButton ]]
        -- upvalues: l_Hide_0 (copy), l_Close_0 (copy), l_Refresh_0 (copy), l_Drag_0 (copy), v9 (ref), v91 (copy)
        local v120 = 1;
        local v121 = nil;
        local l_l_Hide_0_0 = l_Hide_0;
        if l_Hide_0.Visible then
            v120 = v120 + 1;
        end;
        if l_Close_0.Visible then
            v120 = v120 + 1;
        end;
        if l_Refresh_0.Visible then
            v120 = v120 + 1;
        end;
        v121 = UDim2.new(1, -(v120 * 30 + 5 + (v120 - 1)), 0, 3);
        v119.Position = v119.Position or v121;
        v119.Size = v119.Size or l_l_Hide_0_0.Size;
        v119.BackgroundColor3 = v119.BackgroundColor3 or l_l_Hide_0_0.BackgroundColor3;
        v119.BackgroundTransparency = v119.BackgroundTransparency or l_l_Hide_0_0.BackgroundTransparency;
        v119.BorderSizePixel = v119.BorderSizePixel or l_l_Hide_0_0.BorderSizePixel;
        v119.ZIndex = v119.ZIndex or l_l_Hide_0_0.ZIndex;
        v119.TextColor3 = v119.TextColor3 or l_l_Hide_0_0.TextColor3;
        v119.TextScaled = v119.TextScaled or l_l_Hide_0_0.TextScaled;
        v119.TextStrokeColor3 = v119.TextStrokeColor3 or l_l_Hide_0_0.TextStrokeColor3;
        v119.TextSize = v119.TextSize or l_l_Hide_0_0.TextSize;
        v119.TextTransparency = v119.TextTransparency or l_l_Hide_0_0.TextTransparency;
        v119.TextStrokeTransparency = v119.TextStrokeTransparency or l_l_Hide_0_0.TextStrokeTransparency;
        v119.TextScaled = v119.TextScaled or l_l_Hide_0_0.TextScaled;
        v119.TextWrapped = v119.TextWrapped or l_l_Hide_0_0.TextWrapped;
        v119.Font = v119.Font or l_l_Hide_0_0.Font;
        v119.Parent = l_Drag_0;
        local v123 = v9("TextButton", v119);
        v9("UICorner", {
            CornerRadius = UDim.new(0, 4), 
            Parent = v123
        });
        v123.MouseButton1Down:Connect(function() --[[ Line: 381 ]]
            -- upvalues: v91 (ref), v123 (copy)
            v91(v123);
        end);
        return v123;
    end;
    v68 = function(v124, v125) --[[ Line: 385 ]] --[[ Name: functionify ]]
        if type(v124) == "string" then
            if v125 then
                local v126 = GetEnv();
                v126.Object = v125;
                return client.Core.LoadCode(v124, v126);
            else
                return client.Core.LoadCode(v124);
            end;
        else
            return v124;
        end;
    end;
    v9 = function(v127, v128, v129) --[[ Line: 399 ]] --[[ Name: create ]]
        -- upvalues: v63 (copy), l_CheckProperty_0 (copy), v2 (ref), v4 (ref), v0 (ref), v7 (ref), v5 (ref), v6 (ref), v3 (ref), v68 (ref), v91 (copy), l_BindEvent_0 (copy), v10 (ref), l_Desc_0 (copy), v92 (copy), l_l_LocalPlayer_0_Mouse_0 (copy), v9 (ref), l_Object_0 (copy), v16 (ref), v1 (ref), v24 (ref), v66 (ref), v22 (ref)
        local v130 = v128 or {};
        local v131 = v130.Class or v130.ClassName or v127;
        local v132 = v129 or v63[v131] and v63[v131]:Clone() or service.New(v131);
        local v133 = v130.Parent or v132.Parent;
        if v128 then
            v130.Parent = nil;
            if v130.Class or v130.ClassName then
                v130.Class = nil;
                v130.ClassName = nil;
            end;
            if not v130.BorderColor3 and l_CheckProperty_0(v132, "BorderColor3") then
                v132.BorderColor3 = v2;
            end;
            if not v130.CanvasSize and l_CheckProperty_0(v132, "CanvasSize") then
                v132.CanvasSize = v4;
            end;
            if not v130.BorderSizePixel and l_CheckProperty_0(v132, "BorderSizePixel") then
                v132.BorderSizePixel = 0;
            end;
            if not v130.BackgroundColor3 and l_CheckProperty_0(v132, "BackgroundColor3") then
                v132.BackgroundColor3 = v0;
            end;
            if not v130.PlaceholderColor3 and l_CheckProperty_0(v132, "PlaceholderColor3") then
                v132.PlaceholderColor3 = v7;
            end;
            if not v130.Transparency and not v130.BackgroundTransparency and l_CheckProperty_0(v132, "Transparency") then
                v132.BackgroundTransparency = 0;
            elseif v130.Transparency then
                v132.BackgroundTransparency = v130.Transparency;
            end;
            if not v130.TextColor3 and not v130.TextColor and l_CheckProperty_0(v132, "TextColor3") then
                v132.TextColor3 = v5;
            elseif v130.TextColor then
                v132.TextColor3 = v130.TextColor;
            end;
            if not v130.Font and l_CheckProperty_0(v132, "Font") then
                v130.Font = "SourceSans";
            end;
            if not v130.TextSize and l_CheckProperty_0(v132, "TextSize") then
                v130.TextSize = 16;
            end;
            if not v130.BottomImage and not v130.MidImage and not v130.TopImage and v131 == "ScrollingFrame" then
                v132.BottomImage = "http://roblox.com/asset?id=158348114";
                v132.MidImage = "http://roblox.com/asset?id=158348114";
                v132.TopImage = "http://roblox.com/asset?id=158348114";
            end;
            if not v130.Size and l_CheckProperty_0(v132, "Size") then
                v132.Size = v6;
            end;
            if not v130.Position and l_CheckProperty_0(v132, "Position") then
                v132.Position = v3;
            end;
            if not v130.ZIndex and l_CheckProperty_0(v132, "ZIndex") then
                v132.ZIndex = 2;
                if v133 and l_CheckProperty_0(v133, "ZIndex") then
                    v132.ZIndex = v133.ZIndex;
                end;
            end;
            if v130.TextChanged and v131 == "TextBox" then
                local v134 = v68(v130.TextChanged, v132);
                local l_v134_0 = v134 --[[ copy: 7 -> 46 ]];
                v132.FocusLost:Connect(function(v136) --[[ Line: 476 ]]
                    -- upvalues: l_v134_0 (copy), v132 (copy)
                    l_v134_0(v132.Text, v136, v132);
                end);
            end;
            if (v130.OnClicked or v130.OnClick) and (v131 == "TextButton" or v131 == "ImageButton") then
                local v137 = false;
                local l_Debounce_0 = v130.Debounce;
                local v139 = v68(v130.OnClicked or v130.OnClick, v132);
                local l_l_Debounce_0_0 = l_Debounce_0 --[[ copy: 8 -> 44 ]];
                local l_v139_0 = v139 --[[ copy: 9 -> 45 ]];
                do
                    local l_v137_0 = v137;
                    v132.MouseButton1Down:Connect(function() --[[ Line: 485 ]]
                        -- upvalues: l_v137_0 (ref), l_l_Debounce_0_0 (copy), v91 (ref), v132 (copy), l_v139_0 (copy)
                        if not l_v137_0 then
                            if l_l_Debounce_0_0 then
                                l_v137_0 = true;
                            end;
                            v91(v132);
                            l_v139_0(v132);
                            l_v137_0 = false;
                        end;
                    end);
                end;
            end;
            if v130.Events then
                for v143, v144 in v130.Events do
                    local v145 = v68(v144, v132);
                    l_BindEvent_0(v132[v143], function(...) --[[ Line: 502 ]]
                        -- upvalues: v145 (copy)
                        v145(...);
                    end);
                end;
            end;
            if v130.Visible == nil then
                v130.Visible = true;
            end;
            if v130.LabelProps then
                v130.LabelProperties = v130.LabelProps;
            end;
        end;
        if v131 == "Entry" then
            local l_Text_0 = v132.Text;
            local l_Dots_0 = v132.Dots;
            local _ = v132.Desc;
            l_Text_0.ZIndex = v130.ZIndex or v132.ZIndex;
            l_Dots_0.ZIndex = v130.ZIndex or v132.ZIndex;
            if v130.Text then
                v132.Text.Text = v130.Text;
                v132.Text.Visible = true;
                v130.Text = nil;
            end;
            if v130.Desc or v130.ToolTip then
                v132.Desc.Value = v130.Desc or v130.ToolTip;
                v130.Desc = nil;
            end;
            v10(v132, l_Desc_0);
        elseif v130.ToolTip then
            v10(v132, l_Desc_0, v130.ToolTip);
        end;
        if v131 == "ButtonEntry" then
            local l_Button_0 = v132.Button;
            local v150 = false;
            local v151 = v68(v130.OnClicked, l_Button_0);
            local l_v151_0 = v151 --[[ copy: 9 -> 42 ]];
            local l_l_Button_0_0 = l_Button_0 --[[ copy: 7 -> 43 ]];
            do
                local l_v150_0 = v150;
                v132:SetSpecial("DoClick", function() --[[ Line: 548 ]]
                    -- upvalues: l_v150_0 (ref), l_v151_0 (copy), l_l_Button_0_0 (copy)
                    if not l_v150_0 then
                        l_v150_0 = true;
                        if l_v151_0 then
                            l_v151_0(l_l_Button_0_0);
                        end;
                        l_v150_0 = false;
                    end;
                end);
                v132.Text = v130.Text or v132.Text;
                l_Button_0.ZIndex = v130.ZIndex or v132.ZIndex;
                l_Button_0.MouseButton1Down:Connect(function() --[[ Line: 560 ]]
                    -- upvalues: v92 (ref), v91 (ref), v132 (copy)
                    v92:Play();
                    v91(v132);
                    v132.DoClick();
                end);
            end;
        end;
        if v131 == "Boolean" then
            local l_Enabled_0 = v130.Enabled;
            local v156 = false;
            local v157 = v68(v130.OnToggle, v132);
            local l_v157_0 = v157 --[[ copy: 9 -> 40 ]];
            do
                local l_l_Enabled_0_0, l_v156_0 = l_Enabled_0, v156;
                local function v162(v161) --[[ Line: 571 ]] --[[ Name: toggle ]]
                    -- upvalues: l_v156_0 (ref), l_l_Enabled_0_0 (ref), v132 (copy), l_v157_0 (copy)
                    if not l_v156_0 then
                        l_v156_0 = true;
                        if v161 ~= nil and v161 or v161 == nil and l_l_Enabled_0_0 then
                            l_l_Enabled_0_0 = false;
                            v132.Text = "Disabled";
                        elseif v161 ~= nil and v161 == false or v161 == nil and not l_l_Enabled_0_0 then
                            l_l_Enabled_0_0 = true;
                            v132.Text = "Enabled";
                        end;
                        if l_v157_0 then
                            l_v157_0(l_l_Enabled_0_0, v132);
                        end;
                        l_v156_0 = false;
                    end;
                end;
                v132.Text = l_l_Enabled_0_0 and "Enabled" or "Disabled";
                local l_v162_0 = v162 --[[ copy: 10 -> 41 ]];
                v132.MouseButton1Down:Connect(function() --[[ Line: 591 ]]
                    -- upvalues: l_v157_0 (copy), v92 (ref), v91 (ref), v132 (copy), l_v162_0 (copy)
                    if l_v157_0 then
                        v92:Play();
                        v91(v132);
                        l_v162_0();
                    end;
                end);
                v132:SetSpecial("Toggle", function(_, v165) --[[ Line: 599 ]]
                    -- upvalues: l_v162_0 (copy)
                    l_v162_0(v165);
                end);
            end;
        end;
        if v131 == "StringEntry" then
            local l_Box_0 = v132.Box;
            local v167 = nil;
            v132.Text = v130.Text or v132.Text;
            l_Box_0.ZIndex = v130.ZIndex or v132.ZIndex;
            if v130.BoxText then
                l_Box_0.Text = v130.BoxText;
            end;
            if v130.BoxProperties then
                for v168, v169 in v130.BoxProperties do
                    if l_CheckProperty_0(l_Box_0, v168) then
                        l_Box_0[v168] = v169;
                    end;
                end;
            end;
            do
                local l_v167_0 = v167;
                if v130.TextChanged then
                    local v171 = v68(v130.TextChanged, l_Box_0);
                    local l_v171_0 = v171 --[[ copy: 9 -> 38 ]];
                    local l_l_Box_0_0 = l_Box_0 --[[ copy: 7 -> 39 ]];
                    l_Box_0.Changed:Connect(function(v174) --[[ Line: 623 ]]
                        -- upvalues: l_v167_0 (ref), l_v171_0 (copy), l_l_Box_0_0 (copy)
                        if v174 == "Text" and not l_v167_0 then
                            l_v171_0(l_l_Box_0_0.Text);
                        end;
                    end);
                    l_Box_0.FocusLost:Connect(function(v175) --[[ Line: 629 ]]
                        -- upvalues: l_v171_0 (copy), l_l_Box_0_0 (copy), l_v167_0 (ref)
                        local v176 = l_v171_0(l_l_Box_0_0.Text, true, v175);
                        if v176 then
                            l_v167_0 = true;
                            l_l_Box_0_0.Text = v176;
                            l_v167_0 = false;
                        end;
                    end);
                end;
                local l_l_Box_0_1 = l_Box_0 --[[ copy: 7 -> 37 ]];
                v132:SetSpecial("SetValue", function(_, v179) --[[ Line: 639 ]]
                    -- upvalues: l_l_Box_0_1 (copy)
                    l_l_Box_0_1.Text = v179;
                end);
            end;
        end;
        if v131 == "Slider" then
            local l_Percentage_0 = v132.Percentage;
            local l_Slider_0 = v132.Slider;
            local l_SliderBar_0 = v132.SliderBar;
            local l_Drag_1 = v132.Drag;
            local v184 = false;
            local v185 = 0;
            local v186 = v68(v130.OnSlide, v132);
            l_SliderBar_0.ZIndex = v130.ZIndex or v132.ZIndex;
            l_Slider_0.ZIndex = l_SliderBar_0.ZIndex + 1;
            l_Drag_1.ZIndex = l_Slider_0.ZIndex + 1;
            l_Drag_1.Active = true;
            if v130.Value then
                l_Slider_0.Position = UDim2.new(0.5, -10, 0.5, -10);
                l_Drag_1.Position = l_Slider_0.Position;
            end;
            local l_l_Slider_0_0 = l_Slider_0 --[[ copy: 8 -> 33 ]];
            local l_l_Drag_1_0 = l_Drag_1 --[[ copy: 10 -> 34 ]];
            local l_l_Percentage_0_0 = l_Percentage_0 --[[ copy: 7 -> 35 ]];
            local l_v186_0 = v186 --[[ copy: 13 -> 36 ]];
            do
                local l_v184_0, l_v185_0 = v184, v185;
                l_SliderBar_0.InputBegan:Connect(function(v193) --[[ Line: 662 ]]
                    -- upvalues: l_v184_0 (ref), l_v185_0 (ref), v132 (copy), l_l_Slider_0_0 (copy), l_l_Drag_1_0 (copy), l_l_Percentage_0_0 (copy), l_v186_0 (copy)
                    if not l_v184_0 and (v193.UserInputType == Enum.UserInputType.MouseButton1 or v193.UserInputType == Enum.UserInputType.Touch) then
                        l_v185_0 = (v193.Position.X - v132.AbsolutePosition.X) / v132.AbsoluteSize.X;
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
                l_Drag_1.DragBegin:Connect(function() --[[ Line: 682 ]]
                    -- upvalues: l_v184_0 (ref)
                    l_v184_0 = true;
                end);
                l_Drag_1.DragStopped:Connect(function() --[[ Line: 686 ]]
                    -- upvalues: l_v184_0 (ref), l_l_Drag_1_0 (copy), l_l_Slider_0_0 (copy)
                    l_v184_0 = false;
                    l_l_Drag_1_0.Position = l_l_Slider_0_0.Position;
                end);
                l_Drag_1.Changed:Connect(function() --[[ Line: 691 ]]
                    -- upvalues: l_v184_0 (ref), l_v185_0 (ref), l_l_LocalPlayer_0_Mouse_0 (ref), v132 (copy), l_l_Slider_0_0 (copy), l_l_Percentage_0_0 (copy), l_v186_0 (copy)
                    if l_v184_0 then
                        l_v185_0 = (l_l_LocalPlayer_0_Mouse_0.X - v132.AbsolutePosition.X) / v132.AbsoluteSize.X;
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
                v132:SetSpecial("SetValue", function(_, v195) --[[ Line: 710 ]]
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
        if v131 == "Dropdown" then
            local l_Menu_1 = v132.Menu;
            local l_Down_0 = v132.Down;
            local l_dSelected_0 = v132.dSelected;
            local l_Options_0 = v130.Options;
            local v200 = v130.Selected or v130.Selection;
            local v201 = v68(v130.OnSelection or v130.OnSelect or function() --[[ Line: 726 ]]

            end);
            local l_TextProperties_0 = v130.TextProperties;
            local v203 = v9("ScrollingFrame", {
                Parent = l_Menu_1, 
                Size = UDim2.new(1, 0, 1, 0), 
                Position = UDim2.new(0, 0, 0, 0), 
                BackgroundTransparency = 1, 
                ZIndex = 100
            });
            l_Menu_1.ZIndex = v203.ZIndex;
            l_Menu_1.Parent = l_Object_0;
            l_Menu_1.Visible = false;
            l_Menu_1.Size = UDim2.new(0, v132.AbsoluteSize.X, 0, 100);
            l_Menu_1.BackgroundColor3 = v130.BackgroundColor3 or v132.BackgroundColor3;
            if v130.TextAlignment then
                l_dSelected_0.TextXAlignment = v130.TextAlignment;
                l_dSelected_0.Position = UDim2.new(0, 30, 0, 0);
            end;
            if v130.NoArrow then
                l_Down_0.Visible = false;
            end;
            v132:SetSpecial("MenuContainer", l_Menu_1);
            local l_l_Menu_1_0 = l_Menu_1 --[[ copy: 7 -> 27 ]];
            local l_l_Down_0_0 = l_Down_0 --[[ copy: 8 -> 28 ]];
            local l_l_dSelected_0_0 = l_dSelected_0 --[[ copy: 9 -> 29 ]];
            local l_l_Options_0_0 = l_Options_0 --[[ copy: 10 -> 30 ]];
            v132.Changed:Connect(function(v208) --[[ Line: 753 ]]
                -- upvalues: l_l_Menu_1_0 (copy), v132 (copy), l_l_Down_0_0 (copy), v130 (copy), l_l_dSelected_0_0 (copy), l_l_Options_0_0 (copy), v203 (copy)
                if v208 == "AbsolutePosition" and l_l_Menu_1_0.Visible then
                    l_l_Menu_1_0.Position = UDim2.new(0, v132.AbsolutePosition.X, 0, v132.AbsolutePosition.Y + v132.AbsoluteSize.Y);
                    return;
                else
                    if v208 == "AbsoluteSize" or v208 == "Parent" then
                        l_l_Down_0_0.Size = UDim2.new(0, v132.AbsoluteSize.Y, 1, 0);
                        if v130.TextAlignment == "Right" then
                            l_l_Down_0_0.Position = UDim2.new(0, 0, 0.5, -(l_l_Down_0_0.AbsoluteSize.X / 2));
                            l_l_dSelected_0_0.Position = UDim2.new(0, v132.AbsoluteSize.Y, 0, 0);
                        else
                            l_l_Down_0_0.Position = UDim2.new(1, -l_l_Down_0_0.AbsoluteSize.X, 0.5, -(l_l_Down_0_0.AbsoluteSize.X / 2));
                        end;
                        l_l_dSelected_0_0.Size = UDim2.new(1, -l_l_Down_0_0.AbsoluteSize.X, 1, 0);
                        if l_l_Options_0_0 and #l_l_Options_0_0 <= 6 then
                            l_l_Menu_1_0.Size = UDim2.new(0, v132.AbsoluteSize.X, 0, #l_l_Options_0_0 * 30);
                            return;
                        else
                            l_l_Menu_1_0.Size = UDim2.new(0, v132.AbsoluteSize.X, 0, 180);
                            v203:ResizeCanvas(false, true);
                        end;
                    end;
                    return;
                end;
            end);
            l_dSelected_0.ZIndex = v132.ZIndex;
            l_Down_0.ZIndex = v132.ZIndex;
            if l_TextProperties_0 then
                for v209, v210 in l_TextProperties_0 do
                    l_dSelected_0[v209] = v210;
                end;
            end;
            if l_Options_0 then
                for v211, v212 in l_Options_0 do
                    local v213 = v203:Add("TextButton", {
                        Text = ("  %*"):format(v212), 
                        Size = UDim2.new(1, -10, 0, 30), 
                        Position = UDim2.new(0, 5, 0, 30 * (v211 - 1)), 
                        ZIndex = l_Menu_1.ZIndex, 
                        BackgroundTransparency = 1, 
                        OnClick = function() --[[ Line: 793 ]] --[[ Name: OnClick ]]
                            -- upvalues: l_dSelected_0 (copy), v212 (copy), v201 (copy), v132 (copy), l_Menu_1 (copy)
                            l_dSelected_0.Text = v212;
                            v201(v212, v132);
                            l_Menu_1.Visible = false;
                        end
                    });
                    if l_TextProperties_0 then
                        for v214, v215 in l_TextProperties_0 do
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
                local function v217() --[[ Line: 813 ]] --[[ Name: showMenu ]]
                    -- upvalues: l_l_Menu_1_1 (copy), v132 (copy)
                    l_l_Menu_1_1.Position = UDim2.new(0, v132.AbsolutePosition.X, 0, v132.AbsolutePosition.Y + v132.AbsoluteSize.Y);
                    l_l_Menu_1_1.Visible = not l_l_Menu_1_1.Visible;
                end;
                local l_l_dSelected_0_1 = l_dSelected_0 --[[ copy: 9 -> 32 ]];
                l_dSelected_0.MouseButton1Down:Connect(function() --[[ Line: 818 ]]
                    -- upvalues: v92 (ref), v91 (ref), l_l_dSelected_0_1 (copy), v217 (copy)
                    v92:Play();
                    v91(l_l_dSelected_0_1);
                    v217();
                end);
                l_Down_0.MouseButton1Down:Connect(function() --[[ Line: 819 ]]
                    -- upvalues: v91 (ref), l_l_dSelected_0_1 (copy), v217 (copy)
                    v91(l_l_dSelected_0_1);
                    v217();
                end);
            end;
        end;
        if v131 == "TabFrame" then
            local v219 = {};
            local v220 = v9("ScrollingFrame", nil, v132.Buttons);
            local l_Frames_0 = v132.Frames;
            local v222 = 0;
            local _ = v130.ButtonSize or 60;
            v132.BackgroundTransparency = v130.BackgroundTransparency or 1;
            v220.ZIndex = v130.ZIndex or v132.ZIndex;
            l_Frames_0.ZIndex = v220.ZIndex;
            v132:SetSpecial("GetTab", function(_, v225) --[[ Line: 834 ]]
                -- upvalues: l_Frames_0 (copy)
                return l_Frames_0:FindFirstChild(v225);
            end);
            local l_v219_0 = v219 --[[ copy: 7 -> 26 ]];
            do
                local l_v222_0 = v222;
                v132:SetSpecial("NewTab", function(_, v229, v230) --[[ Line: 838 ]]
                    -- upvalues: v16 (ref), v220 (copy), v9 (ref), v1 (ref), l_v219_0 (copy), v24 (ref), l_Frames_0 (copy), l_v222_0 (ref)
                    local v231 = v230 or {};
                    local v232 = v16(v220);
                    local l_TextSize_0 = service.TextService:GetTextSize(v231.Text or v229, 16, "SourceSans", v220.AbsoluteSize);
                    local _ = v231.TextTransparency;
                    local v235 = false;
                    local v236 = v9("ScrollingFrame", {
                        Name = v229, 
                        Size = UDim2.new(1, 0, 1, 0), 
                        Position = UDim2.new(0, 0, 0, 0), 
                        BorderSizePixel = 0, 
                        BackgroundTransparency = v231.FrameTransparency or v231.Transparency, 
                        BackgroundColor3 = v231.Color or v1, 
                        ZIndex = v220.ZIndex, 
                        Visible = false
                    });
                    local v237 = v9("TextButton", {
                        Name = v229, 
                        Text = v231.Text or v229, 
                        Size = UDim2.new(0, l_TextSize_0.X + 20, 1, 0), 
                        ZIndex = v220.ZIndex, 
                        Position = UDim2.new(0, v232.X.Offset > 0 and v232.X.Offset + 5 or 0, 0, 0), 
                        TextColor3 = v231.TextColor, 
                        BackgroundTransparency = 0.7, 
                        TextTransparency = v231.TextTransparency, 
                        BackgroundColor3 = v231.Color or v1, 
                        BorderSizePixel = 0
                    });
                    v236:SetSpecial("FocusTab", function() --[[ Line: 870 ]]
                        -- upvalues: l_v219_0 (ref), v24 (ref), l_Frames_0 (ref), v237 (copy), v231 (copy), v236 (copy)
                        for _, v239 in l_v219_0 do
                            if v24(v239) then
                                v239.BackgroundTransparency = v239:IsDisabled() and 0.9 or 0.7;
                                v239.TextTransparency = v239:IsDisabled() and 0.9 or 0.7;
                            end;
                        end;
                        for _, v241 in l_Frames_0:GetChildren() do
                            if v24(v241) then
                                v241.Visible = false;
                            end;
                        end;
                        v237.BackgroundTransparency = v231.Transparency or 0;
                        v237.TextTransparency = v231.TextTransparency or 0;
                        v236.Visible = true;
                        if v231.OnFocus then
                            v231.OnFocus(true);
                        end;
                    end);
                    if l_v222_0 == 0 then
                        v236.Visible = true;
                        v237.BackgroundTransparency = v231.Transparency or 0;
                    end;
                    v237.MouseButton1Down:Connect(function() --[[ Line: 898 ]]
                        -- upvalues: v235 (ref), v236 (copy)
                        if not v235 then
                            v236:FocusTab();
                        end;
                    end);
                    v237.Parent = v220;
                    v236.Parent = l_Frames_0;
                    v220:ResizeCanvas(true, false);
                    v236:SetSpecial("Disable", function() --[[ Line: 908 ]]
                        -- upvalues: v235 (ref), v237 (copy)
                        v235 = true;
                        v237.BackgroundTransparency = 0.9;
                        v237.TextTransparency = 0.9;
                    end);
                    v236:SetSpecial("Enable", function() --[[ Line: 914 ]]
                        -- upvalues: v235 (ref), v237 (copy), v231 (copy)
                        v235 = false;
                        v237.BackgroundTransparency = 0.7;
                        v237.TextTransparency = v231.TextTransparency or 0;
                    end);
                    v237:SetSpecial("IsDisabled", function() --[[ Line: 920 ]]
                        -- upvalues: v235 (ref)
                        return v235;
                    end);
                    table.insert(l_v219_0, v237);
                    l_v222_0 = l_v222_0 + 1;
                    return v236, v237;
                end);
            end;
        end;
        if v131 == "ScrollingFrame" then
            local v242 = false;
            if not v130.ScrollBarThickness then
                v130.ScrollBarThickness = 4;
            end;
            do
                local l_v242_0 = v242;
                v132:SetSpecial("GenerateList", function(v244, v245, v246, v247) --[[ Line: 938 ]]
                    -- upvalues: l_v242_0 (ref), v132 (copy), v9 (ref), l_CheckProperty_0 (ref), v130 (copy)
                    local v248 = v245 or v244;
                    local v249 = {};
                    local v250 = v246 or {};
                    l_v242_0 = v249;
                    v132:ClearAllChildren();
                    local v251 = 0;
                    for v252, v253 in v248 do
                        local l_v253_0 = v253;
                        local v255 = nil;
                        local v256 = nil;
                        local v257 = nil;
                        if type(v253) == "table" then
                            l_v253_0 = v253.Text;
                            v255 = v253.Desc;
                            v256 = v253.Color;
                            if v253.RichTextAllowed or v250.RichTextAllowed then
                                v257 = true;
                            end;
                        end;
                        local v258 = v9("TextLabel", {
                            Text = (" %*"):format(l_v253_0), 
                            ToolTip = v255, 
                            Size = UDim2.new(1, -5, 0, v250.ySize or 20), 
                            Visible = true, 
                            BackgroundTransparency = 1, 
                            Font = "SourceSans", 
                            TextSize = 18, 
                            TextStrokeTransparency = 0.8, 
                            TextXAlignment = "Left", 
                            Position = UDim2.new(0, 0, 0, v251 * (v250.ySize or 20)), 
                            RichText = v257 or false
                        });
                        if v256 then
                            v258.TextColor3 = v256;
                        end;
                        if v246 then
                            for v259, v260 in v250 do
                                if l_CheckProperty_0(v258, v259) then
                                    v258[v259] = v260;
                                end;
                            end;
                        end;
                        if l_v242_0 == v249 then
                            v258.Parent = v132;
                            v251 = v251 + 1;
                            if v130.Delay then
                                if type(v130.Delay) == "number" then
                                    task.wait(v130.Delay);
                                elseif v252 % 100 == 0 then
                                    task.wait(0.1);
                                end;
                            end;
                        else
                            v258:Destroy();
                            break;
                        end;
                    end;
                    v132:ResizeCanvas(false, true, false, v247, 5, 5, 50);
                    l_v242_0 = nil;
                end);
                v132:SetSpecial("ResizeCanvas", function(_, v262, v263, v264, v265, _, _, v268) --[[ Line: 1011 ]]
                    -- upvalues: v130 (copy), v132 (copy)
                    local v269 = v130.xPadding or 5;
                    local v270 = v130.yPadding or 5;
                    local v271 = 0;
                    local v272 = 0;
                    if not v262 and not v263 then
                        v262 = false;
                        v263 = true;
                    end;
                    for v273, v274 in v132:GetChildren() do
                        if v274:IsA("GuiObject") then
                            if v263 then
                                v274.Size = UDim2.new(v274.Size.X.Scale, v274.Size.X.Offset, 0, v274.AbsoluteSize.Y);
                                v274.Position = UDim2.new(v274.Position.X.Scale, v274.Position.X.Offset, 0, v274.AbsolutePosition.Y - v132.AbsolutePosition.Y);
                            end;
                            if v262 then
                                v274.Size = UDim2.new(0, v274.AbsoluteSize.X, v274.Size.Y.Scale, v274.Size.Y.Offset);
                                v274.Position = UDim2.new(0, v274.AbsolutePosition.X - v132.AbsolutePosition.X, v274.Position.Y.Scale, v274.Position.Y.Offset);
                            end;
                            local v275 = v274.Position.Y.Offset + v274.Size.Y.Offset;
                            local v276 = v274.Position.X.Offset + v274.Size.X.Offset;
                            v271 = math.max(v271, v275);
                            v272 = math.max(v272, v276);
                            if v268 and v273 % v268 == 0 then
                                task.wait(0.016666666666666666);
                            end;
                        end;
                    end;
                    if v263 then
                        v132.CanvasSize = UDim2.new(v132.CanvasSize.X.Scale, v132.CanvasSize.X.Offset, 0, v271 + v270);
                    end;
                    if v262 then
                        v132.CanvasSize = UDim2.new(0, v272 + v269, v132.CanvasSize.Y.Scale, v132.CanvasSize.Y.Offset);
                    end;
                    if v264 then
                        v132.CanvasPosition = Vector2.new(v272 + v269 - v132.AbsoluteSize.X, v132.CanvasPosition.Y);
                    end;
                    if v265 then
                        v132.CanvasPosition = Vector2.new(v132.CanvasPosition.X, v271 + v270 - v132.AbsoluteSize.Y);
                    end;
                end);
                if v130.List then
                    v132:GenerateList(v130.List);
                    v130.List = nil;
                end;
            end;
        end;
        v66(v132, v130.Content or v130.Children);
        v130.Children = nil;
        v130.Content = nil;
        for v277, v278 in v130 do
            if l_CheckProperty_0(v132, v277) then
                v132[v277] = v278;
            end;
        end;
        v132.Parent = v133;
        return v22(v132, v130, v131), v130;
    end;
    v22 = function(v279, v280, _) --[[ Line: 1076 ]] --[[ Name: apiIfy ]]
        -- upvalues: v9 (ref), v22 (ref)
        local v282 = service.Wrap(v279);
        v279:SetSpecial("Object", v279);
        v279:SetSpecial("SetPosition", function(_, v284) --[[ Line: 1079 ]]
            -- upvalues: v279 (copy)
            v279.Position = v284;
        end);
        v279:SetSpecial("SetSize", function(_, v286) --[[ Line: 1080 ]]
            -- upvalues: v279 (copy)
            v279.Size = v286;
        end);
        v279:SetSpecial("Add", function(v287, v288, v289) --[[ Line: 1081 ]]
            -- upvalues: v9 (ref), v279 (copy), v22 (ref)
            if not v289 then
                v289 = v288;
                v288 = v287;
            end;
            local v290 = v9(v288, v289);
            v290.Parent = v279;
            return v22(v290, v289, v288);
        end);
        v279:SetSpecial("Copy", function(_, v292, v293) --[[ Line: 1088 ]]
            -- upvalues: v280 (copy), v9 (ref), v279 (copy), v22 (ref)
            local v294 = {};
            local v295 = nil;
            for v296, v297 in v280 do
                v294[v296] = v297;
            end;
            for v298, v299 in v293 do
                v294[v298] = v299;
            end;
            v295 = v9(v292 or v280.Class or v279.ClassName, v294);
            v295.Parent = v293.Parent or v279.Parent;
            return v22(v295, v280, v292);
        end);
        return v282;
    end;
    v12 = function() --[[ Line: 1108 ]] --[[ Name: doClose ]]
        -- upvalues: v59 (ref), l_Drag_0 (copy), l_Main_0 (copy), l_gTable_0 (copy)
        if not v59 then
            v59 = true;
            for _, v301 in l_Drag_0:GetChildren() do
                if v301 ~= l_Main_0 then
                    v301:Destroy();
                end;
            end;
            l_Drag_0:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.15);
            l_Main_0.ClipsDescendants = true;
            l_Main_0:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.15);
            task.wait(0.12);
            l_gTable_0:Destroy();
        end;
    end;
    v14 = function() --[[ Line: 1124 ]] --[[ Name: isVisible ]]
        -- upvalues: l_Main_0 (copy)
        return l_Main_0.Visible;
    end;
    local l_TextLabel_0 = l_Hide_0:FindFirstChild("TextLabel");
    v11 = function(v303) --[[ Line: 1129 ]] --[[ Name: doHide ]]
        -- upvalues: l_Hide_0 (copy), l_Main_0 (copy), v13 (ref), l_Drag_0 (copy), l_TextLabel_0 (copy), l_gTable_0 (copy), l_OnMinimize_0 (copy), l_Walls_0 (copy), v17 (ref)
        local l_LineHeight_0 = l_Hide_0.LineHeight;
        if v303 or v303 == nil and l_Main_0.Visible then
            v13 = l_Drag_0.Size;
            l_Main_0.Visible = false;
            l_Main_0.Glass.Parent = l_Drag_0;
            l_Drag_0.BackgroundTransparency = l_Main_0.BackgroundTransparency;
            l_Drag_0.BackgroundColor3 = l_Main_0.BackgroundColor3;
            l_Drag_0.Size = UDim2.new(0, 200, l_Drag_0.Size.Y.Scale, l_Drag_0.Size.Y.Offset);
            if l_TextLabel_0 then
                l_TextLabel_0.Icon.Image = "rbxassetid://3523249191";
            else
                l_Hide_0.Icon.Image = "rbxassetid://3523249191";
            end;
            l_Hide_0.LineHeight = l_LineHeight_0;
            l_gTable_0.Minimized = true;
        elseif v303 == false or v303 == nil and not l_Main_0.Visible then
            l_Main_0.Visible = true;
            l_Drag_0.Glass.Parent = l_Main_0;
            l_Drag_0.BackgroundTransparency = 1;
            l_Drag_0.Size = v13 or l_Drag_0.Size;
            if l_TextLabel_0 then
                l_TextLabel_0.Icon.Image = "rbxassetid://3523250728";
            else
                l_Hide_0.Icon.Image = "rbxassetid://3523250728";
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
    v20 = function(v305, v306, v307) --[[ Line: 1172 ]] --[[ Name: isInFrame ]]
        if v307.AbsolutePosition.X < v305 and v305 < v307.AbsolutePosition.X + v307.AbsoluteSize.X and v307.AbsolutePosition.Y < v306 and v306 < v307.AbsolutePosition.Y + v307.AbsoluteSize.Y then
            return true;
        else
            return false;
        end;
    end;
    v17 = function() --[[ Line: 1180 ]] --[[ Name: wallPosition ]]
        -- upvalues: l_gTable_0 (copy), l_Drag_0 (copy), l_Object_0 (copy), l_Main_0 (copy)
        if l_gTable_0.Active then
            local l_X_1 = l_Drag_0.AbsolutePosition.X;
            local l_Y_0 = l_Drag_0.AbsolutePosition.Y;
            local l_X_2 = l_Drag_0.AbsoluteSize.X;
            local l_X_3 = l_Object_0.AbsoluteSize.X;
            local l_Y_1 = l_Object_0.AbsoluteSize.Y;
            local v313 = l_Main_0.Visible and l_Main_0.AbsoluteSize.Y or l_Drag_0.AbsoluteSize.Y;
            if l_X_1 < 0 then
                l_Drag_0.Position = UDim2.new(0, 0, l_Drag_0.Position.Y.Scale, l_Drag_0.Position.Y.Offset);
            end;
            if l_Y_0 < 0 then
                l_Drag_0.Position = UDim2.new(l_Drag_0.Position.X.Scale, l_Drag_0.Position.X.Offset, 0, 0);
            end;
            if l_X_3 < l_X_1 + l_X_2 then
                l_Drag_0.Position = UDim2.new(0, l_Object_0.AbsoluteSize.X - l_Drag_0.AbsoluteSize.X, l_Drag_0.Position.Y.Scale, l_Drag_0.Position.Y.Offset);
            end;
            if l_Y_1 < l_Y_0 + v313 then
                l_Drag_0.Position = UDim2.new(l_Drag_0.Position.X.Scale, l_Drag_0.Position.X.Offset, 0, l_Object_0.AbsoluteSize.Y - v313);
            end;
        end;
    end;
    v21 = function(v314) --[[ Line: 1204 ]] --[[ Name: setSize ]]
        -- upvalues: l_Drag_0 (copy), l_Main_0 (copy)
        if v314 and type(v314) == "table" then
            if v314[1] < 50 then
                v314[1] = 50;
            end;
            if v314[2] < 50 then
                v314[2] = 50;
            end;
            l_Drag_0.Size = UDim2.new(0, v314[1], l_Drag_0.Size.Y.Scale, l_Drag_0.Size.Y.Offset);
            l_Main_0.Size = UDim2.new(1, 0, 0, v314[2]);
        end;
    end;
    v18 = function(v315) --[[ Line: 1214 ]] --[[ Name: setPosition ]]
        -- upvalues: l_Drag_0 (copy), l_Size_0 (copy), l_Main_0 (copy)
        if v315 and typeof(v315) == "UDim2" then
            l_Drag_0.Position = v315;
            return;
        elseif v315 and type(v315) == "table" then
            l_Drag_0.Position = UDim2.new(0, v315[1], 0, v315[2]);
            return;
        else
            if l_Size_0 and not v315 then
                l_Drag_0.Position = UDim2.new(0.5, -l_Drag_0.AbsoluteSize.X / 2, 0.5, -l_Main_0.AbsoluteSize.Y / 2);
            end;
            return;
        end;
    end;
    if l_Name_0 then
        l_gTable_0.Name = l_Name_0;
        if v25.AllowMultiple ~= nil and v25.AllowMultiple == false then
            local v316, _ = client.UI.Get(l_Name_0, l_Object_0, true);
            if v316 then
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
        l_Drag_0.DragStopped:Connect(function() --[[ Line: 1276 ]]
            -- upvalues: v17 (ref)
            v17();
        end);
    end;
    if l_OnRefresh_0 then
        local v318 = false;
        v15 = function() --[[ Line: 1283 ]] --[[ Name: DoRefresh ]]
            -- upvalues: v61 (ref), l_gTable_0 (copy), l_Spinner_0 (copy), l_OnRefresh_0 (copy)
            if not v61 then
                local v319 = false;
                v61 = true;
                do
                    local l_v319_0 = v319;
                    task.spawn(function() --[[ Line: 1288 ]]
                        -- upvalues: l_gTable_0 (ref), l_v319_0 (ref), l_Spinner_0 (ref)
                        while l_gTable_0.Active and not l_v319_0 do
                            for v321 = 0, 180, 10 do
                                l_Spinner_0.Rotation = -v321;
                                task.wait(0.016666666666666666);
                            end;
                        end;
                    end);
                    l_OnRefresh_0();
                    task.wait(1);
                    l_v319_0 = true;
                    v61 = false;
                end;
            end;
        end;
        do
            local l_v318_0 = v318;
            l_Refresh_0.MouseButton1Down:Connect(function() --[[ Line: 1304 ]]
                -- upvalues: v92 (copy), v91 (copy), l_Refresh_0 (copy), l_v318_0 (ref), v15 (ref)
                v92:Play();
                v91(l_Refresh_0);
                if not l_v318_0 then
                    l_v318_0 = true;
                    v15();
                    l_v318_0 = false;
                end;
            end);
            l_Title_1.Size = UDim2.new(1, -130, l_Title_1.Size.Y.Scale, l_Title_1.Size.Y.Offset);
        end;
    else
        l_Refresh_0.Visible = false;
    end;
    if l_IconClicked_0 then
        l_Icon_2.MouseButton1Down(function() --[[ Line: 1320 ]]
            -- upvalues: v92 (copy), v91 (copy), l_Icon_2 (copy), l_IconClicked_0 (copy), v25 (copy), l_Object_0 (copy)
            v92:Play();
            v91(l_Icon_2);
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
        local l_X_4 = l_Drag_0.AbsolutePosition.X;
        local l_Y_2 = l_Drag_0.AbsolutePosition.Y;
        local l_X_5 = l_Drag_0.AbsoluteSize.X;
        local l_Y_3 = l_Drag_0.AbsoluteSize.Y;
        local _ = client.Variables;
        local v328 = nil;
        local v329 = nil;
        local v330 = nil;
        do
            local l_l_X_4_0, l_l_Y_2_0, l_l_X_5_0, l_l_Y_3_0, l_v328_0, l_v329_0, l_v330_0 = l_X_4, l_Y_2, l_X_5, l_Y_3, v328, v329, v330;
            local function _(v338) --[[ Line: 1349 ]] --[[ Name: readify ]]
                -- upvalues: l_v330_0 (ref)
                v338.MouseEnter:Connect(function() --[[ Line: 1350 ]]
                    -- upvalues: l_v330_0 (ref), v338 (copy)
                    l_v330_0 = v338;
                end);
                v338.MouseLeave:Connect(function() --[[ Line: 1354 ]]
                    -- upvalues: l_v330_0 (ref), v338 (copy)
                    if l_v330_0 == v338 then
                        l_v330_0 = nil;
                    end;
                end);
            end;
            v19 = function(v340, v341) --[[ Line: 1374 ]] --[[ Name: checkMouse ]]
                -- upvalues: l_gTable_0 (copy), l_Main_0 (copy), v20 (ref), l_Drag_0 (copy), l_ScrollingFrame_0 (copy), l_v329_0 (ref), l_v328_0 (ref), l_TopRight_0 (copy), v8 (ref), l_TopLeft_0 (copy), l_RightCorner_0 (copy), l_LeftCorner_0 (copy), l_RightSide_0 (copy), l_LeftSide_0 (copy), l_Bottom_0 (copy), l_Top_0 (copy), l_l_LocalPlayer_0_Mouse_0 (copy), l_Icon_1 (ref)
                if l_gTable_0.Active and l_Main_0.Visible then
                    if v20(v340, v341, l_Drag_0) or v20(v340, v341, l_ScrollingFrame_0) then
                        l_v329_0 = nil;
                        l_v328_0 = nil;
                    elseif v20(v340, v341, l_TopRight_0) then
                        l_v329_0 = "TopRight";
                        l_v328_0 = v8.TopRight;
                    elseif v20(v340, v341, l_TopLeft_0) then
                        l_v329_0 = "TopLeft";
                        l_v328_0 = v8.TopLeft;
                    elseif v20(v340, v341, l_RightCorner_0) then
                        l_v329_0 = "RightCorner";
                        l_v328_0 = v8.RightCorner;
                    elseif v20(v340, v341, l_LeftCorner_0) then
                        l_v329_0 = "LeftCorner";
                        l_v328_0 = v8.LeftCorner;
                    elseif v20(v340, v341, l_RightSide_0) then
                        l_v329_0 = "RightSide";
                        l_v328_0 = v8.Horizontal;
                    elseif v20(v340, v341, l_LeftSide_0) then
                        l_v329_0 = "LeftSide";
                        l_v328_0 = v8.Horizontal;
                    elseif v20(v340, v341, l_Bottom_0) then
                        l_v329_0 = "Bottom";
                        l_v328_0 = v8.Vertical;
                    elseif v20(v340, v341, l_Top_0) then
                        l_v329_0 = "Top";
                        l_v328_0 = v8.Vertical;
                    else
                        l_v329_0 = nil;
                        l_v328_0 = nil;
                    end;
                else
                    l_v329_0 = nil;
                end;
                if not client.Variables.MouseLockedBy or client.Variables.MouseLockedBy == l_gTable_0 then
                    if l_v329_0 and l_v328_0 then
                        l_l_LocalPlayer_0_Mouse_0.Icon = l_v328_0;
                        client.Variables.MouseLockedBy = l_gTable_0;
                        return;
                    elseif client.Variables.MouseLockedBy == l_gTable_0 then
                        l_l_LocalPlayer_0_Mouse_0.Icon = l_Icon_1;
                        client.Variables.MouseLockedBy = nil;
                    end;
                end;
            end;
            local function v344(v342, v343) --[[ Line: 1422 ]] --[[ Name: inputStart ]]
                -- upvalues: v19 (ref), l_gTable_0 (copy), l_v329_0 (ref), v60 (ref), v20 (ref), l_ScrollingFrame_0 (copy), l_Drag_0 (copy), l_l_X_4_0 (ref), l_l_Y_2_0 (ref), l_l_X_5_0 (ref), l_l_Y_3_0 (ref), l_Main_0 (copy)
                v19(v342, v343);
                if l_gTable_0.Active and l_v329_0 and not v60 and not v20(v342, v343, l_ScrollingFrame_0) and not v20(v342, v343, l_Drag_0) then
                    v60 = l_v329_0;
                    l_l_X_4_0 = l_Drag_0.AbsolutePosition.X;
                    l_l_Y_2_0 = l_Drag_0.AbsolutePosition.Y;
                    l_l_X_5_0 = l_Drag_0.AbsoluteSize.X;
                    l_l_Y_3_0 = l_Main_0.AbsoluteSize.Y;
                end;
            end;
            local function v345() --[[ Line: 1433 ]] --[[ Name: inputEnd ]]
                -- upvalues: l_gTable_0 (copy), v60 (ref), l_OnResize_0 (copy), l_Drag_0 (copy), l_Main_0 (copy), l_l_LocalPlayer_0_Mouse_0 (copy), l_Icon_1 (ref)
                if l_gTable_0.Active then
                    if v60 and l_OnResize_0 then
                        l_OnResize_0(UDim2.new(l_Drag_0.Size.X.Scale, l_Drag_0.Size.X.Offset, l_Main_0.Size.Y.Scale, l_Main_0.Size.Y.Offset));
                    end;
                    v60 = nil;
                    l_l_LocalPlayer_0_Mouse_0.Icon = l_Icon_1;
                end;
            end;
            local function v355(v346, v347) --[[ Line: 1448 ]] --[[ Name: inputMoved ]]
                -- upvalues: l_gTable_0 (copy), l_l_LocalPlayer_0_Mouse_0 (copy), v8 (ref), l_Icon_1 (ref), v60 (ref), l_Drag_0 (copy), l_l_X_5_0 (ref), l_l_Y_3_0 (ref), l_l_X_4_0 (ref), l_l_Y_2_0 (ref), v56 (copy), v57 (copy), l_Main_0 (copy), l_Title_1 (copy), v19 (ref)
                if l_gTable_0.Active then
                    if l_l_LocalPlayer_0_Mouse_0.Icon ~= v8.TopRight and l_l_LocalPlayer_0_Mouse_0.Icon ~= v8.TopLeft and l_l_LocalPlayer_0_Mouse_0.Icon ~= v8.RightCorner and l_l_LocalPlayer_0_Mouse_0.Icon ~= v8.LeftCorner and l_l_LocalPlayer_0_Mouse_0.Icon ~= v8.Horizontal and l_l_LocalPlayer_0_Mouse_0.Icon ~= v8.Vertical then
                        l_Icon_1 = l_l_LocalPlayer_0_Mouse_0.Icon;
                    end;
                    if v60 then
                        local v348 = false;
                        local v349 = false;
                        local l_Position_1 = l_Drag_0.Position;
                        local l_v346_0 = v346;
                        local l_v347_0 = v347;
                        local l_l_l_X_5_0_0 = l_l_X_5_0;
                        local l_l_l_Y_3_0_0 = l_l_Y_3_0;
                        if v60 == "TopRight" then
                            l_l_l_X_5_0_0 = l_v346_0 - l_l_X_4_0 + 3;
                            l_l_l_Y_3_0_0 = l_l_Y_2_0 - l_v347_0 + l_l_Y_3_0 - 1;
                            v349 = true;
                        elseif v60 == "TopLeft" then
                            l_l_l_X_5_0_0 = l_l_X_4_0 - l_v346_0 + l_l_X_5_0 - 1;
                            l_l_l_Y_3_0_0 = l_l_Y_2_0 - l_v347_0 + l_l_Y_3_0 - 1;
                            v349 = true;
                            v348 = true;
                        elseif v60 == "RightCorner" then
                            l_l_l_X_5_0_0 = l_v346_0 - l_l_X_4_0 + 3;
                            l_l_l_Y_3_0_0 = l_v347_0 - l_l_Y_2_0 + 3;
                        elseif v60 == "LeftCorner" then
                            l_l_l_X_5_0_0 = l_l_X_4_0 - l_v346_0 + l_l_X_5_0 + 3;
                            l_l_l_Y_3_0_0 = l_v347_0 - l_l_Y_2_0 + 3;
                            v348 = true;
                        elseif v60 == "LeftSide" then
                            l_l_l_X_5_0_0 = l_l_X_4_0 - l_v346_0 + l_l_X_5_0 + 3;
                            l_l_l_Y_3_0_0 = l_l_Y_3_0;
                            v348 = true;
                        elseif v60 == "RightSide" then
                            l_l_l_X_5_0_0 = l_v346_0 - l_l_X_4_0 + 3;
                            l_l_l_Y_3_0_0 = l_l_Y_3_0;
                        elseif v60 == "Bottom" then
                            l_l_l_X_5_0_0 = l_l_X_5_0;
                            l_l_l_Y_3_0_0 = l_v347_0 - l_l_Y_2_0 + 3;
                        elseif v60 == "Top" then
                            l_l_l_X_5_0_0 = l_l_X_5_0;
                            l_l_l_Y_3_0_0 = l_l_Y_2_0 - l_v347_0 + l_l_Y_3_0 - 1;
                            v349 = true;
                        end;
                        if l_l_l_X_5_0_0 < v56[1] then
                            l_l_l_X_5_0_0 = v56[1];
                        end;
                        if l_l_l_Y_3_0_0 < v56[2] then
                            l_l_l_Y_3_0_0 = v56[2];
                        end;
                        if v57[1] < l_l_l_X_5_0_0 then
                            l_l_l_X_5_0_0 = v57[1];
                        end;
                        if v57[2] < l_l_l_Y_3_0_0 then
                            l_l_l_Y_3_0_0 = v57[2];
                        end;
                        if v348 then
                            l_Position_1 = UDim2.new(0, l_l_X_4_0 + l_l_X_5_0 - l_l_l_X_5_0_0, l_Position_1.Y.Scale, l_Position_1.Y.Offset);
                        end;
                        if v349 then
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
                        v19(v346, v347);
                    end;
                end;
            end;
            l_BindEvent_0(l_UserInputService_0.InputBegan, function(v356, v357) --[[ Line: 1523 ]]
                -- upvalues: v344 (copy)
                if not v357 and (v356.UserInputType == Enum.UserInputType.MouseButton1 or v356.UserInputType == Enum.UserInputType.Touch) then
                    local l_Position_2 = v356.Position;
                    v344(l_Position_2.X, l_Position_2.Y);
                end;
            end);
            l_BindEvent_0(l_UserInputService_0.InputChanged, function(v359, _) --[[ Line: 1530 ]]
                -- upvalues: v355 (copy)
                if v359.UserInputType == Enum.UserInputType.MouseMovement or v359.UserInputType == Enum.UserInputType.Touch then
                    local l_Position_3 = v359.Position;
                    v355(l_Position_3.X, l_Position_3.Y);
                end;
            end);
            l_BindEvent_0(l_UserInputService_0.InputEnded, function(v362, _) --[[ Line: 1537 ]]
                -- upvalues: v345 (copy)
                if v362.UserInputType == Enum.UserInputType.MouseButton1 or v362.UserInputType == Enum.UserInputType.Touch then
                    v345();
                end;
            end);
        end;
    else
        l_LeftResizeIcon_0.Visible = false;
        l_RightResizeIcon_0.Visible = false;
    end;
    l_Close_0.MouseButton1Click:Connect(function() --[[ Line: 1573 ]]
        -- upvalues: v92 (copy), v12 (ref)
        v92:Play();
        v12();
    end);
    l_Hide_0.MouseButton1Click:Connect(function() --[[ Line: 1574 ]]
        -- upvalues: v92 (copy), v11 (ref)
        v92:Play();
        v11();
    end);
    l_Close_0.MouseButton1Down:Connect(function() --[[ Line: 1576 ]]
        -- upvalues: v91 (copy), l_Close_0 (copy)
        v91(l_Close_0);
    end);
    l_Hide_0.MouseButton1Down:Connect(function() --[[ Line: 1577 ]]
        -- upvalues: v91 (copy), l_Hide_0 (copy)
        v91(l_Hide_0);
    end);
    l_gTable_0.CustomDestroy = function() --[[ Line: 1579 ]]
        -- upvalues: l_Object_0 (copy), l_gTable_0 (copy), l_l_LocalPlayer_0_Mouse_0 (copy), l_Icon_1 (ref), v59 (ref), l_OnClose_0 (copy)
        service.UnWrap(l_Object_0):Destroy();
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
    end;
    for _, v365 in l_Object_0:GetChildren() do
        if v365.Name ~= "Desc" and v365.Name ~= "Drag" then
            v63[v365.Name] = v365;
            v365.Parent = nil;
        end;
    end;
    local v366 = Instance.new("BoolValue", l_Object_0);
    local v367 = false;
    local v368 = nil;
    local v369 = nil;
    v366.Name = "__ADONIS_WINDOW";
    l_BindEvent_0(l_Main_0.InputBegan, function(v370) --[[ Line: 1610 ]]
        -- upvalues: l_gTable_0 (copy), v67 (ref)
        if l_gTable_0.Active and (v370.UserInputType == Enum.UserInputType.MouseButton1 or v370.UserInputType == Enum.UserInputType.Touch) then
            v67();
        end;
    end);
    do
        local l_v367_0, l_v368_0, l_v369_0 = v367, v368, v369;
        l_BindEvent_0(l_Drag_0.InputBegan, function(v374) --[[ Line: 1616 ]]
            -- upvalues: l_gTable_0 (copy), l_v369_0 (ref), v67 (ref)
            if l_gTable_0.Active then
                l_v369_0 = true;
                if v374.UserInputType == Enum.UserInputType.MouseButton1 or v374.UserInputType == Enum.UserInputType.Touch then
                    v67();
                end;
            end;
        end);
        l_BindEvent_0(l_Drag_0.InputChanged, function(_) --[[ Line: 1626 ]]
            -- upvalues: l_gTable_0 (copy), l_v369_0 (ref)
            if l_gTable_0.Active then
                l_v369_0 = true;
            end;
        end);
        l_BindEvent_0(l_Drag_0.InputEnded, function(_) --[[ Line: 1632 ]]
            -- upvalues: l_v369_0 (ref)
            l_v369_0 = false;
        end);
        l_BindEvent_0(l_UserInputService_0.InputBegan, function(v377) --[[ Line: 1636 ]]
            -- upvalues: l_v369_0 (ref), l_Object_0 (copy), l_v367_0 (ref), v67 (ref), l_v368_0 (ref), l_Drag_0 (copy)
            if l_v369_0 and l_Object_0.DisplayOrder == 101 and not l_v367_0 and (v377.UserInputType == Enum.UserInputType.MouseButton1 or v377.UserInputType == Enum.UserInputType.Touch) then
                l_v367_0 = true;
                v67();
                l_v368_0 = Vector2.new(l_Drag_0.AbsolutePosition.X - v377.Position.X, l_Drag_0.AbsolutePosition.Y - v377.Position.Y);
            end;
        end);
        l_BindEvent_0(l_UserInputService_0.InputChanged, function(v378) --[[ Line: 1644 ]]
            -- upvalues: l_v367_0 (ref), l_Drag_0 (copy), l_v368_0 (ref)
            if l_v367_0 and (v378.UserInputType == Enum.UserInputType.MouseMovement or v378.UserInputType == Enum.UserInputType.Touch) then
                l_Drag_0.Position = UDim2.new(0, l_v368_0.X + v378.Position.X, 0, l_v368_0.Y + v378.Position.Y);
            end;
        end);
        l_BindEvent_0(l_UserInputService_0.InputEnded, function(v379) --[[ Line: 1650 ]]
            -- upvalues: l_v367_0 (ref)
            if v379.UserInputType == Enum.UserInputType.MouseButton1 or v379.UserInputType == Enum.UserInputType.Touch then
                l_v367_0 = false;
            end;
        end);
    end;
    v366 = v22(l_ScrollingFrame_0, v25);
    v367 = v366:GetMetatable();
    v368 = v367.__newindex;
    v369 = v367.__index;
    v9("ScrollingFrame", nil, l_ScrollingFrame_0);
    v66(v366, v55);
    v366:SetSpecial("gTable", l_gTable_0);
    v366:SetSpecial("Window", l_Object_0);
    v366:SetSpecial("Main", l_Main_0);
    v366:SetSpecial("Title", l_Title_1);
    v366:SetSpecial("Dragger", l_Drag_0);
    v366:SetSpecial("Destroy", v12);
    v366:SetSpecial("Close", v12);
    v366:SetSpecial("Object", l_ScrollingFrame_0);
    v366:SetSpecial("Refresh", v15);
    v366:SetSpecial("AddTitleButton", function(v380, v381) --[[ Line: 1675 ]]
        -- upvalues: v65 (ref)
        if type(v380) == "table" and not v381 then
            v381 = v380;
        end;
        return v65(v381);
    end);
    v366:SetSpecial("Ready", function() --[[ Line: 1676 ]]
        -- upvalues: l_OnReady_0 (copy), l_gTable_0 (copy), v67 (ref)
        if l_OnReady_0 then
            l_OnReady_0();
        end;
        l_gTable_0.Ready();
        v67();
    end);
    v366:SetSpecial("BindEvent", function(_, ...) --[[ Line: 1677 ]]
        -- upvalues: l_BindEvent_0 (copy)
        return l_BindEvent_0(...);
    end);
    v366:SetSpecial("Hide", function(_, v384) --[[ Line: 1678 ]]
        -- upvalues: v11 (ref)
        v11(v384);
    end);
    v366:SetSpecial("SetTitle", function(_, v386) --[[ Line: 1679 ]]
        -- upvalues: l_Title_1 (copy)
        l_Title_1.Text = v386;
    end);
    v366:SetSpecial("SetPosition", function(_, v388) --[[ Line: 1680 ]]
        -- upvalues: v18 (ref)
        v18(v388);
    end);
    v366:SetSpecial("SetSize", function(_, v390) --[[ Line: 1681 ]]
        -- upvalues: v21 (ref)
        v21(v390);
    end);
    v366:SetSpecial("GetPosition", function() --[[ Line: 1682 ]]
        -- upvalues: l_Drag_0 (copy)
        return l_Drag_0.AbsolutePosition;
    end);
    v366:SetSpecial("GetSize", function() --[[ Line: 1683 ]]
        -- upvalues: l_Main_0 (copy)
        return l_Main_0.AbsoluteSize;
    end);
    v366:SetSpecial("IsVisible", v14);
    v366:SetSpecial("IsClosed", v59);
    v367.__index = function(v391, v392) --[[ Line: 1687 ]]
        -- upvalues: v14 (ref), v59 (ref), v369 (copy)
        if v392 == "IsVisible" then
            return v14();
        elseif v392 == "Closed" then
            return v59;
        else
            return v369(v391, v392);
        end;
    end;
    v21(l_Size_0);
    v18(l_Position_0);
    if l_Ready_0 then
        l_gTable_0:Ready();
        v67();
    end;
    return v366, l_Object_0;
end;