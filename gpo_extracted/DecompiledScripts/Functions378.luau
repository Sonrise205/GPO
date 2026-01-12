client = nil;
service = nil;
Pcall = nil;
Routine = nil;
GetEnv = nil;
origEnv = nil;
logError = nil;
return function(v0, v1) --[[ Line: 11 ]]
    local v2 = v1(nil, {
        script = script
    });
    setfenv(1, v2);
    local _ = _G;
    local l_game_0 = game;
    local _ = script;
    local l_getfenv_0 = getfenv;
    local _ = setfenv;
    local l_workspace_0 = workspace;
    local _ = getmetatable;
    local _ = setmetatable;
    local _ = loadstring;
    local _ = coroutine;
    local _ = rawequal;
    local _ = typeof;
    local l_print_0 = print;
    local l_math_0 = math;
    local _ = warn;
    local l_error_0 = error;
    local l_pcall_0 = pcall;
    local _ = xpcall;
    local _ = select;
    local _ = rawset;
    local _ = rawget;
    local _ = ipairs;
    local _ = pairs;
    local _ = next;
    local _ = Rect;
    local _ = Axes;
    local l_os_0 = os;
    local l_time_0 = time;
    local _ = Faces;
    local _ = unpack;
    local l_string_0 = string;
    local l_Color3_0 = Color3;
    local _ = newproxy;
    local l_tostring_0 = tostring;
    local l_tonumber_0 = tonumber;
    local l_Instance_0 = Instance;
    local _ = TweenInfo;
    local l_BrickColor_0 = BrickColor;
    local _ = NumberRange;
    local _ = ColorSequence;
    local _ = NumberSequence;
    local _ = ColorSequenceKeypoint;
    local _ = NumberSequenceKeypoint;
    local _ = PhysicalProperties;
    local _ = Region3int16;
    local _ = Vector3int16;
    local _ = require;
    local l_table_0 = table;
    local l_type_0 = type;
    local _ = wait;
    local l_Enum_0 = Enum;
    local _ = UDim;
    local l_UDim2_0 = UDim2;
    local _ = Vector2;
    local l_Vector3_0 = Vector3;
    local _ = Region3;
    local l_CFrame_0 = CFrame;
    local _ = Ray;
    local _ = delay;
    local l_Service_0 = v0.Service;
    local l_Client_0 = v0.Client;
    local v64 = nil;
    local v65 = nil;
    local v66 = nil;
    local v67 = nil;
    local v68 = nil;
    local v69 = nil;
    local v70 = nil;
    local function v71() --[[ Line: 40 ]] --[[ Name: Init ]]
        -- upvalues: v69 (ref), l_Client_0 (copy), v64 (ref), v65 (ref), v70 (ref), v66 (ref), v67 (ref), v68 (ref)
        v69 = l_Client_0.UI;
        v64 = l_Client_0.Anti;
        v65 = l_Client_0.Core;
        v70 = l_Client_0.Variables;
        v66 = l_Client_0.Functions;
        v67 = l_Client_0.Process;
        v68 = l_Client_0.Remote;
        v66.Init = nil;
    end;
    local function v72() --[[ Line: 52 ]] --[[ Name: RunLast ]]
        -- upvalues: v66 (ref)
        v66.RunLast = nil;
    end;
    l_getfenv_0().client = nil;
    l_getfenv_0().service = nil;
    l_getfenv_0().script = nil;
    l_Client_0.Functions = {
        Init = v71, 
        RunLast = v72, 
        Kill = l_Client_0.Kill, 
        ESPFaces = {
            "Front", 
            "Back", 
            "Top", 
            "Bottom", 
            "Left", 
            "Right"
        }, 
        ESPify = function(v73, v74) --[[ Line: 97 ]] --[[ Name: ESPify ]]
            -- upvalues: l_Service_0 (copy), l_Vector3_0 (copy), l_UDim2_0 (copy), l_Color3_0 (copy), l_string_0 (copy), l_math_0 (copy), v66 (ref), v70 (ref), l_table_0 (copy)
            local l_Debris_0 = l_Service_0.Debris;
            local l_New_0 = l_Service_0.New;
            local v77 = l_Service_0.UnWrap(l_Service_0.Player);
            for _, v79 in v73:GetChildren() do
                if v79:IsA("BasePart") then
                    if v79.Name == "Head" and not v79:FindFirstChild("__ADONIS_NAMETAG") then
                        local l_PlayerFromCharacter_0 = l_Service_0.Players:GetPlayerFromCharacter(v79.Parent);
                        if l_PlayerFromCharacter_0 then
                            local v81 = l_New_0("BillboardGui", {
                                Name = "__ADONIS_NAMETAG", 
                                AlwaysOnTop = true, 
                                StudsOffset = l_Vector3_0.new(0, 2, 0), 
                                Size = l_UDim2_0.new(0, 100, 0, 40), 
                                Adornee = v79
                            }, true);
                            local v82 = l_New_0("TextLabel", {
                                BackgroundTransparency = 1, 
                                TextColor3 = l_Color3_0.new(1, 1, 1), 
                                TextStrokeTransparency = 0, 
                                Text = l_string_0.format("%s (@%s)\n> %s <", l_PlayerFromCharacter_0.DisplayName, l_PlayerFromCharacter_0.Name, "0"), 
                                Size = l_UDim2_0.new(1, 0, 1, 0), 
                                TextScaled = true, 
                                TextWrapped = true, 
                                Parent = v81
                            }, true);
                            v81.Parent = v79;
                            if l_PlayerFromCharacter_0 ~= v77 then
                                spawn(function() --[[ Line: 130 ]]
                                    -- upvalues: v79 (copy), v77 (copy), v82 (copy), l_string_0 (ref), l_PlayerFromCharacter_0 (copy), l_math_0 (ref), v81 (copy)
                                    while v79 do
                                        local v83 = v77:DistanceFromCharacter(v79.CFrame.Position);
                                        v82.Text = l_string_0.format("%s (@%s)\n> %s <", l_PlayerFromCharacter_0.DisplayName, l_PlayerFromCharacter_0.Name, v83 and l_math_0.floor(v83) or "N/A");
                                        task.wait();
                                        if not v79 or not v81 or not v82 then
                                            break;
                                        end;
                                    end;
                                end);
                            end;
                        end;
                    end;
                    for _, v85 in v66.ESPFaces do
                        local v86 = l_New_0("SurfaceGui", {
                            AlwaysOnTop = true, 
                            ResetOnSpawn = false, 
                            Face = v85, 
                            Adornee = v79
                        }, true);
                        l_New_0("Frame", {
                            Size = l_UDim2_0.new(1, 0, 1, 0), 
                            BackgroundColor3 = v74, 
                            Parent = v86
                        }, true);
                        v86.Parent = v79;
                        local v87 = nil;
                        do
                            local l_v87_0 = v87;
                            l_v87_0 = v86.AncestryChanged:Connect(function(v89, v90) --[[ Line: 162 ]]
                                -- upvalues: v86 (copy), l_v87_0 (ref), l_Debris_0 (copy), v70 (ref), l_table_0 (ref)
                                if v89 == v86 and v90 == nil then
                                    l_v87_0:Disconnect();
                                    l_Debris_0:AddItem(v86, 0);
                                    for v91, v92 in v70.ESPObjects do
                                        if v92 == v86 then
                                            l_table_0.remove(v70.ESPObjects, v91);
                                            return;
                                        end;
                                    end;
                                end;
                            end);
                            v70.ESPObjects[v86] = v79;
                        end;
                    end;
                end;
            end;
        end, 
        CharacterESP = function(v93, v94, v95) --[[ Line: 181 ]] --[[ Name: CharacterESP ]]
            -- upvalues: l_Color3_0 (copy), l_Service_0 (copy), v70 (ref), l_workspace_0 (copy), v66 (ref)
            v95 = v95 or l_Color3_0.new(1, 0, 0.917647);
            local l_Debris_1 = l_Service_0.Debris;
            local l_UnWrap_0 = l_Service_0.UnWrap;
            if v70.ESPEvent then
                v70.ESPEvent:Disconnect();
                v70.ESPEvent = nil;
            end;
            for v98 in v70.ESPObjects do
                if not v93 or not v94 or v94 and v98:IsDescendantOf(v94) then
                    local v99 = v98.Parent and v98.Parent:FindFirstChild("__ADONIS_NAMETAG");
                    if v99 then
                        v99:Destroy();
                    end;
                    l_Debris_1:AddItem(v98, 0);
                    v70.ESPObjects[v98] = nil;
                end;
            end;
            if v93 == true then
                if not v94 then
                    v70.ESPEvent = l_workspace_0.ChildAdded:Connect(function(v100) --[[ Line: 206 ]]
                        -- upvalues: l_Service_0 (ref), v66 (ref), l_UnWrap_0 (copy), v95 (ref)
                        task.wait();
                        local v101 = false;
                        if v100.ClassName == "Model" then
                            v101 = l_Service_0.Players:GetPlayerFromCharacter(v100);
                        end;
                        if v101 then
                            task.spawn(v66.ESPify, l_UnWrap_0(v100), v95);
                        end;
                    end);
                    for _, v103 in l_Service_0.Players:GetPlayers() do
                        if v103.Character then
                            task.spawn(v66.ESPify, l_UnWrap_0(v103.Character), v95);
                        end;
                    end;
                else
                    v66.ESPify(l_UnWrap_0(v94), v95);
                end;
            end;
        end, 
        SetView = function(v104) --[[ Line: 227 ]] --[[ Name: SetView ]]
            -- upvalues: l_workspace_0 (copy), l_Enum_0 (copy), l_Service_0 (copy)
            local l_CurrentCamera_0 = l_workspace_0.CurrentCamera;
            if v104 == "reset" then
                l_CurrentCamera_0.CameraType = l_Enum_0.CameraType.Custom;
                l_CurrentCamera_0.CameraSubject = l_Service_0.Player.Character:FindFirstChildOfClass("Humanoid");
                l_CurrentCamera_0.FieldOfView = 70;
                return;
            else
                l_CurrentCamera_0.CameraSubject = v104;
                return;
            end;
        end, 
        AddAlias = function(v106, v107) --[[ Line: 239 ]] --[[ Name: AddAlias ]]
            -- upvalues: v70 (ref), l_string_0 (copy), v68 (ref), v69 (ref), l_Client_0 (copy)
            v70.Aliases[l_string_0.lower(v106)] = v107;
            v68.Get("UpdateAliases", v70.Aliases);
            task.defer(v69.MakeGui, "Notification", {
                Time = 4, 
                Icon = l_Client_0.MatIcons["Add circle"], 
                Title = "Notification", 
                Message = l_string_0.format("Alias \"%s\" added", l_string_0.lower(v106))
            });
        end, 
        RemoveAlias = function(v108) --[[ Line: 250 ]] --[[ Name: RemoveAlias ]]
            -- upvalues: v70 (ref), l_string_0 (copy), v68 (ref), v69 (ref), l_Client_0 (copy)
            if v70.Aliases[l_string_0.lower(v108)] then
                v70.Aliases[l_string_0.lower(v108)] = nil;
                v68.Get("UpdateAliases", v70.Aliases);
                task.defer(v69.MakeGui, "Notification", {
                    Time = 4, 
                    Icon = l_Client_0.MatIcons.Delete, 
                    Title = "Notification", 
                    Message = l_string_0.format("Alias \"%s\" removed", l_string_0.lower(v108))
                });
                return;
            else
                task.defer(v69.MakeGui, "Notification", {
                    Time = 3, 
                    Icon = l_Client_0.MatIcons.Help, 
                    Title = "Error", 
                    Message = l_string_0.format("Alias \"%s\" not found", l_string_0.lower(v108))
                });
                return;
            end;
        end, 
        Playlist = function() --[[ Line: 270 ]] --[[ Name: Playlist ]]
            -- upvalues: v68 (ref)
            return v68.Get("Playlist");
        end, 
        UpdatePlaylist = function(v109) --[[ Line: 274 ]] --[[ Name: UpdatePlaylist ]]
            -- upvalues: v68 (ref)
            v68.Get("UpdatePlaylist", v109);
        end, 
        Dizzy = function(v110) --[[ Line: 278 ]] --[[ Name: Dizzy ]]
            -- upvalues: l_Service_0 (copy), l_workspace_0 (copy), l_time_0 (copy), l_math_0 (copy), l_CFrame_0 (copy)
            l_Service_0.StopLoop("DizzyLoop");
            if v110 then
                local l_CurrentCamera_1 = l_workspace_0.CurrentCamera;
                local v112 = l_time_0();
                local v113 = 0;
                do
                    local l_v112_0, l_v113_0 = v112, v113;
                    l_Service_0.StartLoop("DizzyLoop", "RenderStepped", function() --[[ Line: 285 ]]
                        -- upvalues: l_time_0 (ref), l_v112_0 (ref), l_v113_0 (ref), l_math_0 (ref), v110 (copy), l_CurrentCamera_1 (copy), l_CFrame_0 (ref)
                        local v116 = l_time_0() - l_v112_0;
                        l_v113_0 = l_v113_0 - l_math_0.rad(v110 * v116);
                        local l_l_CurrentCamera_1_0 = l_CurrentCamera_1;
                        l_l_CurrentCamera_1_0.CFrame = l_l_CurrentCamera_1_0.CFrame * l_CFrame_0.Angles(0, 0, l_v113_0);
                        l_v112_0 = l_time_0();
                    end);
                end;
            end;
        end, 
        Base64Encode = function(v118) --[[ Line: 300 ]] --[[ Name: Base64Encode ]]
            -- upvalues: l_math_0 (copy), l_string_0 (copy), l_table_0 (copy)
            local l_floor_0 = l_math_0.floor;
            local _ = l_string_0.char;
            local v121 = 0;
            local v122 = #v118;
            local v123 = l_table_0.create(l_math_0.ceil(v122 / 0.75));
            for v124 = 1, v122 - 2, 3 do
                local v125, v126, v127 = v118:byte(v124, v124 + 3);
                local v128 = v127 + v126 * 256 + v125 * 256 * 256;
                local v129 = v128 % 64 + 1;
                v128 = l_floor_0(v128 / 64);
                local v130 = v128 % 64 + 1;
                v128 = l_floor_0(v128 / 64);
                local v131 = v128 % 64 + 1;
                local v132 = l_floor_0(v128 / 64) % 64 + 1;
                v123[v121 + 1] = ("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"):sub(v132, v132);
                v123[v121 + 2] = ("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"):sub(v131, v131);
                v123[v121 + 3] = ("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"):sub(v130, v130);
                v123[v121 + 4] = ("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"):sub(v129, v129);
                v121 = v121 + 4;
            end;
            local v133 = v122 % 3;
            if v133 == 2 then
                local v134, v135 = v118:byte(-2, -1);
                local v136 = v135 * 4 + v134 * 4 * 256;
                local v137 = v136 % 64 + 1;
                v136 = l_floor_0(v136 / 64);
                local v138 = v136 % 64 + 1;
                local v139 = l_floor_0(v136 / 64) % 64 + 1;
                v123[v121 + 1] = ("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"):sub(v139, v139);
                v123[v121 + 2] = ("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"):sub(v138, v138);
                v123[v121 + 3] = ("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"):sub(v137, v137);
                v123[v121 + 4] = "=";
            elseif v133 == 1 then
                local v140 = v118:byte(-1, -1) * 16;
                local v141 = v140 % 64 + 1;
                local v142 = l_floor_0(v140 / 64) % 64 + 1;
                v123[v121 + 1] = ("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"):sub(v142, v142);
                v123[v121 + 2] = ("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"):sub(v141, v141);
                v123[v121 + 3] = "=";
                v123[v121 + 4] = "=";
            end;
            return l_table_0.concat(v123, "");
        end, 
        Base64Decode = function(v143) --[[ Line: 368 ]] --[[ Name: Base64Decode ]]
            -- upvalues: l_math_0 (copy), l_string_0 (copy), l_table_0 (copy), l_error_0 (copy)
            local l_floor_1 = l_math_0.floor;
            local l_char_1 = l_string_0.char;
            local v146 = 0;
            local v147 = #v143;
            local v148 = l_table_0.create(l_math_0.ceil(v147 * 0.75));
            local v149 = 0;
            local v150 = 0;
            local v151 = {};
            for v152 = 1, 64 do
                v151[("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"):sub(v152, v152)] = v152 - 1;
            end;
            for v153 = 1, v147 do
                local v154 = v151[v143:sub(v153, v153)];
                if v154 then
                    v149 = v149 * 64 + v154;
                    v150 = v150 + 1;
                end;
                if v150 == 4 then
                    local v155 = v149 % 256;
                    v149 = l_floor_1(v149 / 256);
                    local v156 = v149 % 256;
                    local v157 = l_floor_1(v149 / 256) % 256;
                    v148[v146 + 1] = l_char_1(v157);
                    v148[v146 + 2] = l_char_1(v156);
                    v148[v146 + 3] = l_char_1(v155);
                    v146 = v146 + 3;
                    v150 = 0;
                    v149 = 0;
                end;
            end;
            if v150 == 3 then
                v149 = l_floor_1(v149 * 64 / 256);
                local v158 = v149 % 256;
                local v159 = l_floor_1(v149 / 256) % 256;
                v148[v146 + 1] = l_char_1(v159);
                v148[v146 + 2] = l_char_1(v158);
            elseif v150 == 2 then
                local v160 = l_floor_1(l_floor_1(v149 * 64 / 256) * 64 / 256) % 256;
                v148[v146 + 1] = l_char_1(v160);
            elseif v150 == 1 then
                l_error_0("Base64 has invalid length");
            end;
            return l_table_0.concat(v148, "");
        end, 
        GetGuiData = function(_) --[[ Line: 434 ]] --[[ Name: GetGuiData ]]
            -- upvalues: l_pcall_0 (copy), l_table_0 (copy), l_Service_0 (copy)
            local v162 = {
                "AbsolutePosition", 
                "AutomaticCanvasSize", 
                "BottomImage", 
                "AbsoluteSize", 
                "AnchorPoint", 
                "CornerRadius", 
                "CanvasSize", 
                "CanvasPosition", 
                "ClassName", 
                "ElasticBehavior", 
                "Name", 
                "Parent", 
                "Archivable", 
                "SelectionImageObject", 
                "Active", 
                "BackgroundColor3", 
                "BackgroundTransparency", 
                "BorderColor3", 
                "BorderSizePixel", 
                "Position", 
                "Rotation", 
                "RichText", 
                "Selectable", 
                "HorizontalScrollBarPosition", 
                "Size", 
                "Enabled", 
                "Active", 
                "SizeConstraint", 
                "Style", 
                "ScrollBarThickness", 
                "ScrollBarImageTransparency", 
                "ScrollingEnabled", 
                "ScrollingDirection", 
                "ScrollBarImageColor", 
                "Visible", 
                "ZIndex", 
                "ClipsDescendants", 
                "Draggable", 
                "NextSelectionDown", 
                "NextSelectionLeft", 
                "NextSelectionRight", 
                "NextSelectionUp", 
                "PlaceholderColor3", 
                "PlaceholderText", 
                "AutoButtonColor", 
                "Modal", 
                "MidImage", 
                "Image", 
                "ImageColor3", 
                "ImageRectOffset", 
                "ImageRectSize", 
                "ImageTransparency", 
                "ScaleType", 
                "SliceCenter", 
                "Text", 
                "TopImage", 
                "TextColor3", 
                "TextDirection", 
                "Font", 
                "TextScaled", 
                "TextSize", 
                "TextStrokeColor3", 
                "TextStrokeTransparency", 
                "TextTransparency", 
                "TextTuncate", 
                "TextWrapped", 
                "TextXAlignment", 
                "TextYAlignment", 
                "VerticalScrollBarInset", 
                "VerticalScrollBarPosition", 
                "AspectRatio", 
                "AspectType", 
                "DominantAxis", 
                "Offset", 
                "Transparency", 
                "CellPadding", 
                "CellSize", 
                "Padding", 
                "PaddingBottom", 
                "PaddingLeft", 
                "PaddingRight", 
                "PaddingTop", 
                "Animated", 
                "Circular", 
                "EasingDirection", 
                "EasingStyle", 
                "TweenTime", 
                "FillDirection", 
                "SortOrder", 
                "VerticalAlignment", 
                "GamepadInputEnabled", 
                "ScrollWheelInputEnabled", 
                "TouchInputEnabled", 
                "Scale", 
                "MaxSize", 
                "MinSize", 
                "ApplyStrokeMode", 
                "Color", 
                "LineJoinMode", 
                "Thickness", 
                "FillEmptySpaceColumns", 
                "FillEmptySpaceRow", 
                "MajorAxis", 
                "HorizontalAlignment", 
                "MaxTextSize", 
                "MinTextSize", 
                "GroupColor3", 
                "GroupTransparency", 
                "SelectionImageObject", 
                "Looped", 
                "Playing", 
                "TimePosition", 
                "Video", 
                "Volume", 
                "LayoutOrder", 
                "Ambient", 
                "LightColor", 
                "LightDirection", 
                "CurrentCamera", 
                "AutomaticSize", 
                "AutoLocalize", 
                "RootLocalizationTable"
            };
            local v163 = {
                "ScreenGui", 
                "GuiMain", 
                "Frame", 
                "CanvasGroup", 
                "TextButton", 
                "TextLabel", 
                "ImageButton", 
                "ImageLabel", 
                "ScrollingFrame", 
                "TextBox", 
                "BillboardGui", 
                "SurfaceGui", 
                "UICorner", 
                "UIAspectRatioConstraint", 
                "UIGradient", 
                "UIGridLayout", 
                "UIListLayout", 
                "UIPadding", 
                "UIPageLayout", 
                "UIScale", 
                "UISizeConstraint", 
                "UIStroke", 
                "UITableLayout", 
                "UITextSizeConstraint", 
                "VideoFrame", 
                "ViewportFrame"
            };
            local v164 = {
                Properties = {
                    Name = "ViewGuis", 
                    ClassName = "Folder"
                }, 
                Children = {}
            };
            local v165 = nil;
            v165 = function(v166, v167) --[[ Line: 597 ]]
                -- upvalues: v163 (copy), v162 (copy), l_pcall_0 (ref), v165 (ref), l_table_0 (ref)
                local v168 = false;
                for _, v170 in v163 do
                    if v167:IsA(v170) then
                        v168 = true;
                    end;
                end;
                if v168 then
                    local v171 = {
                        Properties = {}, 
                        Children = {}
                    };
                    for _, v173 in v162 do
                        l_pcall_0(function() --[[ Line: 613 ]]
                            -- upvalues: v171 (copy), v173 (copy), v167 (copy)
                            v171.Properties[v173] = v167[v173];
                        end);
                    end;
                    for _, v175 in v167:GetChildren() do
                        v165(v171, v175);
                    end;
                    l_table_0.insert(v166.Children, v171);
                end;
            end;
            for _, v177 in l_Service_0.PlayerGui:GetChildren() do
                l_pcall_0(v165, v164, v177);
            end;
            return v164;
        end, 
        LoadGuiData = function(v178) --[[ Line: 630 ]] --[[ Name: LoadGuiData ]]
            -- upvalues: l_Service_0 (copy), l_pcall_0 (copy), l_Instance_0 (copy), v69 (ref), v70 (ref)
            local v179 = nil;
            v179 = function(v180) --[[ Line: 631 ]]
                -- upvalues: l_Service_0 (ref), l_pcall_0 (ref), v179 (ref)
                local l_Properties_0 = v180.Properties;
                local l_Children_0 = v180.Children;
                local v183 = l_Service_0.New(l_Properties_0.ClassName);
                for v184, v185 in l_Properties_0 do
                    l_pcall_0(function() --[[ Line: 637 ]]
                        -- upvalues: v183 (copy), v184 (copy), v185 (copy)
                        v183[v184] = v185;
                    end);
                end;
                for _, v187 in l_Children_0 do
                    l_pcall_0(function() --[[ Line: 643 ]]
                        -- upvalues: v179 (ref), v187 (copy), v183 (copy)
                        local v188 = v179(v187);
                        if v188 then
                            v188.Parent = v183;
                        end;
                    end);
                end;
                return v183;
            end;
            local v189 = l_Instance_0.new("Folder");
            for _, v191 in l_Service_0.PlayerGui:GetChildren() do
                if not v69.Get(v191) then
                    v191.Parent = v189;
                end;
            end;
            v70.GuiViewFolder = v189;
            local v192 = l_Service_0.New("Folder", {
                Parent = l_Service_0.PlayerGui, 
                Name = "LoadedGuis"
            });
            for _, v194 in v178.Children do
                l_pcall_0(function() --[[ Line: 662 ]]
                    -- upvalues: v179 (ref), v194 (copy), v192 (copy)
                    local v195 = v179(v194);
                    if v195 then
                        v195.Parent = v192;
                    end;
                end);
            end;
        end, 
        UnLoadGuiData = function() --[[ Line: 671 ]] --[[ Name: UnLoadGuiData ]]
            -- upvalues: l_Service_0 (copy), v70 (ref)
            for _, v197 in l_Service_0.PlayerGui:GetChildren() do
                if v197.Name == "LoadedGuis" then
                    v197:Destroy();
                end;
            end;
            if v70.GuiViewFolder then
                for _, v199 in v70.GuiViewFolder:GetChildren() do
                    v199.Parent = l_Service_0.PlayerGui;
                end;
                v70.GuiViewFolder:Destroy();
                v70.GuiViewFolder = nil;
            end;
        end, 
        GetParticleContainer = function(v200) --[[ Line: 687 ]] --[[ Name: GetParticleContainer ]]
            -- upvalues: l_Service_0 (copy)
            if v200 then
                for _, v202 in l_Service_0.LocalContainer():GetChildren() do
                    if v202.Name == ("%*PARTICLES"):format((v200:GetFullName())) and v202:FindFirstChild("_OBJECT").Value == v200 then
                        return v202;
                    end;
                end;
            end;
        end, 
        NewParticle = function(v203, v204, v205) --[[ Line: 700 ]] --[[ Name: NewParticle ]]
            -- upvalues: v70 (ref), l_Service_0 (copy), l_table_0 (copy), l_pcall_0 (copy)
            local v206 = nil;
            local v207 = nil;
            v205.Parent = v203;
            v205.Enabled = v70.ParticlesEnabled;
            v206 = l_Service_0.New(v204, v205);
            v207 = l_Service_0.HttpService:GenerateGUID(false);
            v70.Particles[v207] = v206;
            l_table_0.insert(v70.Particles, v206);
            v206.Changed:Connect(function() --[[ Line: 713 ]]
                -- upvalues: v206 (ref), v203 (copy), l_pcall_0 (ref), v70 (ref), v207 (ref)
                if not v206 or not v206.Parent or v206.Parent ~= v203 then
                    l_pcall_0(function() --[[ Line: 715 ]]
                        -- upvalues: v206 (ref)
                        v206:Destroy();
                    end);
                    v70.Particles[v207] = nil;
                end;
            end);
        end, 
        RemoveParticle = function(v208, v209) --[[ Line: 721 ]] --[[ Name: RemoveParticle ]]
            -- upvalues: v70 (ref)
            for v210, v211 in v70.Particles do
                if v211.Parent == v208 and v211.Name == v209 then
                    v211:Destroy();
                    v70.Particles[v210] = nil;
                end;
            end;
        end, 
        EnableParticles = function(v212) --[[ Line: 730 ]] --[[ Name: EnableParticles ]]
            -- upvalues: v70 (ref)
            for _, v214 in v70.Particles do
                if v212 then
                    v214.Enabled = true;
                else
                    v214.Enabled = false;
                end;
            end;
        end, 
        NewLocal = function(v215, v216, v217) --[[ Line: 740 ]] --[[ Name: NewLocal ]]
            -- upvalues: l_Service_0 (copy), l_workspace_0 (copy)
            local v218 = l_Service_0.New(v215);
            for v219, v220 in v216 do
                v218[v219] = v220;
            end;
            if not v217 or v217 == "LocalContainer" then
                v218.Parent = l_Service_0.LocalContainer();
                return;
            elseif v217 == "Camera" then
                v218.Parent = l_workspace_0.CurrentCamera;
                return;
            else
                if v217 == "PlayerGui" then
                    v218.Parent = l_Service_0.PlayerGui;
                end;
                return;
            end;
        end, 
        MakeLocal = function(v221, v222, v223) --[[ Line: 755 ]] --[[ Name: MakeLocal ]]
            -- upvalues: l_Service_0 (copy), l_workspace_0 (copy)
            if v221 then
                local l_v221_0 = v221;
                if v223 then
                    l_v221_0 = l_v221_0:Clone();
                end;
                if not v222 or v222 == "LocalContainer" then
                    l_v221_0.Parent = l_Service_0.LocalContainer();
                    return;
                elseif v222 == "Camera" then
                    l_v221_0.Parent = l_workspace_0.CurrentCamera;
                    return;
                elseif v222 == "PlayerGui" then
                    l_v221_0.Parent = l_Service_0.PlayerGui;
                end;
            end;
        end, 
        MoveLocal = function(v225, v226, v227) --[[ Line: 769 ]] --[[ Name: MoveLocal ]]
            -- upvalues: l_Service_0 (copy), l_workspace_0 (copy)
            local v228 = nil;
            if not v226 or v226 == "LocalContainer" then
                v228 = l_Service_0.LocalContainer();
            elseif v226 == "Camera" then
                v228 = l_workspace_0.CurrentCamera;
            elseif v226 == "PlayerGui" then
                v228 = l_Service_0.PlayerGui;
            end;
            for _, v230 in v228:GetChildren() do
                if v230.Name == v225 or v230 == v230 then
                    v230.Parent = v227;
                end;
            end;
        end, 
        RemoveLocal = function(v231, v232, v233) --[[ Line: 785 ]] --[[ Name: RemoveLocal ]]
            -- upvalues: l_Service_0 (copy), l_workspace_0 (copy), l_string_0 (copy)
            local v234 = nil;
            if not v232 or v232 == "LocalContainer" then
                v234 = l_Service_0.LocalContainer();
            elseif v232 == "Camera" then
                v234 = l_workspace_0.CurrentCamera;
            elseif v232 == "PlayerGui" then
                v234 = l_Service_0.PlayerGui;
            end;
            for _, v236 in v234:GetChildren() do
                if v233 and l_string_0.match(v236.Name, v231) or v236.Name == v231 or v231 == v236 then
                    v236:Destroy();
                end;
            end;
        end, 
        NewCape = function(v237) --[[ Line: 802 ]] --[[ Name: NewCape ]]
            -- upvalues: l_tonumber_0 (copy), v66 (ref), l_Service_0 (copy), l_Vector3_0 (copy), l_BrickColor_0 (copy), l_CFrame_0 (copy), l_math_0 (copy), v70 (ref)
            local l_Parent_0 = v237.Parent;
            if not l_Parent_0 then
                return;
            else
                local v239 = v237.Material or "Neon";
                local v240 = v237.Color or "White";
                local v241 = v237.Reflectance or 0;
                local v242 = l_tonumber_0(v237.Decal or "");
                local v243 = l_Parent_0:FindFirstChild("Torso") or l_Parent_0:FindFirstChild("UpperTorso") or l_Parent_0:FindFirstChild("HumanoidRootPart");
                if not v243 or not v243:IsA("BasePart") then
                    return;
                else
                    v66.RemoveCape(l_Parent_0);
                    local v244 = v243.Name == "UpperTorso";
                    local v245 = l_Service_0.New("Part", {
                        Parent = l_Parent_0, 
                        Name = "ADONIS_CAPE", 
                        Anchored = false, 
                        CanCollide = false, 
                        Massless = true, 
                        CanQuery = false, 
                        Size = l_Vector3_0.new(2, 4, 0.1), 
                        Position = v243.Position, 
                        BrickColor = l_BrickColor_0.new(v240), 
                        Transparency = 0, 
                        Reflectance = v241, 
                        Material = v239, 
                        TopSurface = 0, 
                        BottomSurface = 0
                    });
                    l_Service_0.New("BlockMesh", {
                        Parent = v245, 
                        Scale = l_Vector3_0.new(0.9, 0.87, 0.1)
                    });
                    local v246 = l_Service_0.New("Motor", {
                        Parent = v245, 
                        Part0 = v245, 
                        Part1 = v243, 
                        MaxVelocity = 0.1, 
                        C0 = l_CFrame_0.new(0, 1.75, 0) * l_CFrame_0.Angles(0, l_math_0.rad(90), 0), 
                        C1 = l_CFrame_0.new(0, 1 - (v244 and 0.2 or 0), v243.Size.Z / 2) * l_CFrame_0.Angles(0, l_math_0.rad(90), 0)
                    });
                    local v247 = if v242 and v242 ~= 0 then l_Service_0.New("Decal", {
                        Parent = v245, 
                        Name = "Decal", 
                        Face = 2, 
                        Texture = ("rbxassetid://%*"):format(v242), 
                        Transparency = 0
                    }) else nil;
                    local v248 = {
                        Part = v245, 
                        Motor = v246, 
                        Enabled = true, 
                        Parent = l_Parent_0, 
                        Torso = v243, 
                        Decal = v247, 
                        Data = v237, 
                        Wave = true, 
                        isR15 = v244
                    };
                    v70.Capes[l_Service_0.HttpService:GenerateGUID(false)] = v248;
                    local l_PlayerFromCharacter_1 = l_Service_0.Players:GetPlayerFromCharacter(l_Parent_0);
                    if l_PlayerFromCharacter_1 and l_PlayerFromCharacter_1 == l_Service_0.Player then
                        v248.isPlayer = true;
                    end;
                    if not v70.CapesEnabled then
                        l_PlayerFromCharacter_1.Transparency = 1;
                        if v247 then
                            v247.Transparency = 1;
                        end;
                        v248.Enabled = false;
                    end;
                    v66.MoveCapes();
                    return;
                end;
            end;
        end, 
        RemoveCape = function(v250) --[[ Line: 890 ]] --[[ Name: RemoveCape ]]
            -- upvalues: v70 (ref), l_pcall_0 (copy)
            for v251, v252 in v70.Capes do
                if v252.Parent == v250 or not v252.Parent or not v252.Parent.Parent then
                    l_pcall_0(v252.Part.Destroy, v252.Part);
                    v70.Capes[v251] = nil;
                end;
            end;
        end, 
        HideCapes = function(v253) --[[ Line: 899 ]] --[[ Name: HideCapes ]]
            -- upvalues: v70 (ref), l_pcall_0 (copy)
            for v254, v255 in v70.Capes do
                local l_Torso_0 = v255.Torso;
                local l_Parent_1 = v255.Parent;
                local l_Part_0 = v255.Part;
                local _ = v255.Motor;
                local _ = v255.Wave;
                local l_Decal_0 = v255.Decal;
                if l_Parent_1 and l_Parent_1.Parent and l_Torso_0 and l_Torso_0.Parent and l_Part_0 and l_Part_0.Parent then
                    if not v253 then
                        l_Part_0.Transparency = 0;
                        if l_Decal_0 then
                            l_Decal_0.Transparency = 0;
                        end;
                        v255.Enabled = true;
                    else
                        l_Part_0.Transparency = 1;
                        if l_Decal_0 then
                            l_Decal_0.Transparency = 1;
                        end;
                        v255.Enabled = false;
                    end;
                else
                    l_pcall_0(l_Part_0.Destroy, l_Part_0);
                    v70.Capes[v254] = nil;
                end;
            end;
        end, 
        MoveCapes = function() --[[ Line: 931 ]] --[[ Name: MoveCapes ]]
            -- upvalues: l_Service_0 (copy), v70 (ref), l_math_0 (copy), l_pcall_0 (copy)
            l_Service_0.StopLoop("CapeMover");
            l_Service_0.StartLoop("CapeMover", 0.1, function() --[[ Line: 933 ]]
                -- upvalues: l_Service_0 (ref), v70 (ref), l_math_0 (ref), l_pcall_0 (ref)
                if l_Service_0.CountTable(v70.Capes) == 0 or not v70.CapesEnabled then
                    l_Service_0.StopLoop("CapeMover");
                    return;
                else
                    for v262, v263 in v70.Capes do
                        local l_Torso_1 = v263.Torso;
                        local l_Parent_2 = v263.Parent;
                        local l_isPlayer_0 = v263.isPlayer;
                        local _ = v263.isR15;
                        local l_Part_1 = v263.Part;
                        local l_Motor_1 = v263.Motor;
                        local l_Wave_1 = v263.Wave;
                        local l_Decal_1 = v263.Decal;
                        if l_Parent_2 and l_Parent_2.Parent and l_Torso_1 and l_Torso_1.Parent and l_Part_1 and l_Part_1.Parent then
                            if v263.Enabled and v70.CapesEnabled then
                                l_Part_1.Transparency = 0;
                                if l_Decal_1 then
                                    l_Decal_1.Transparency = 0;
                                end;
                                local v272 = 0.1;
                                if l_Wave_1 then
                                    if l_Torso_1.AssemblyLinearVelocity.Magnitude > 1 then
                                        v272 = v272 + (l_Torso_1.AssemblyLinearVelocity.Magnitude / 10 * 0.05 + 0.05);
                                    end;
                                    v263.Wave = false;
                                else
                                    v263.Wave = true;
                                end;
                                v272 = v272 + l_math_0.min(l_Torso_1.AssemblyLinearVelocity.Magnitude / 11, 0.8);
                                l_Motor_1.MaxVelocity = l_math_0.min(l_Torso_1.AssemblyLinearVelocity.Magnitude / 111, 0.04) + 0.002;
                                if l_isPlayer_0 then
                                    l_Motor_1.DesiredAngle = -v272;
                                else
                                    l_Motor_1.CurrentAngle = -v272;
                                end;
                                if l_Motor_1.CurrentAngle < -0.2 and l_Motor_1.DesiredAngle > -0.2 then
                                    l_Motor_1.MaxVelocity = 0.04;
                                end;
                            else
                                l_Part_1.Transparency = 1;
                                if l_Decal_1 then
                                    l_Decal_1.Transparency = 1;
                                end;
                            end;
                        else
                            l_pcall_0(l_Part_1.Destroy, l_Part_1);
                            v70.Capes[v262] = nil;
                        end;
                    end;
                    return;
                end;
            end, true);
        end, 
        ClearAllInstances = function() --[[ Line: 989 ]] --[[ Name: ClearAllInstances ]]
            -- upvalues: l_Service_0 (copy), l_table_0 (copy)
            local v273 = l_Service_0.GetAdonisObjects();
            for v274 in v273 do
                v274:Destroy();
            end;
            l_table_0.clear(v273);
        end, 
        PlayAnimation = function(v275) --[[ Line: 997 ]] --[[ Name: PlayAnimation ]]
            -- upvalues: l_Service_0 (copy)
            if v275 == 0 then
                return;
            else
                local l_Character_0 = l_Service_0.Player.Character;
                local v277 = l_Character_0 and l_Character_0:FindFirstChildOfClass("Humanoid");
                local v278 = v277 and v277:FindFirstChildOfClass("Animator") or v277 and v277:WaitForChild("Animator", 9000000000);
                if not v278 then
                    return;
                else
                    for _, v280 in v278:GetPlayingAnimationTracks() do
                        v280:Stop();
                    end;
                    v278:LoadAnimation((l_Service_0.New("Animation", {
                        AnimationId = ("rbxassetid://%*"):format(v275), 
                        Name = "ADONIS_Animation"
                    }))):Play();
                    return;
                end;
            end;
        end, 
        StopAnimation = function() --[[ Line: 1014 ]] --[[ Name: StopAnimation ]]
            -- upvalues: l_Service_0 (copy)
            local l_Character_1 = l_Service_0.Player.Character;
            local v282 = l_Character_1 and l_Character_1:FindFirstChildOfClass("Humanoid");
            local v283 = v282 and v282:FindFirstChildOfClass("Animator") or v282 and v282:WaitForChild("Animator", 9000000000);
            if not v283 then
                return;
            else
                for _, v285 in v283:GetPlayingAnimationTracks() do
                    if v285.Name == "ADONIS_Animation" then
                        v285:Stop();
                    end;
                end;
                return;
            end;
        end, 
        SetLighting = function(v286, v287) --[[ Line: 1024 ]] --[[ Name: SetLighting ]]
            -- upvalues: l_Service_0 (copy), v70 (ref)
            if l_Service_0.Lighting[v286] ~= nil then
                l_Service_0.Lighting[v286] = v287;
                v70.LightingSettings[v286] = v287;
            end;
        end, 
        ChatMessage = function(v288, v289, v290, v291) --[[ Line: 1031 ]] --[[ Name: ChatMessage ]]
            -- upvalues: l_Service_0 (copy), v66 (ref)
            local v292 = {
                Text = v288
            };
            if v289 then
                v292.Color = v289;
            end;
            if v290 then
                v292.Font = v290;
            end;
            if v291 then
                v292.Size = v291;
            end;
            l_Service_0.StarterGui:SetCore("ChatMakeSystemMessage", v292);
            if v66.SendToChat then
                v66.SendToChat({
                    Name = "::Adonis::"
                }, v288, "Private");
            end;
        end, 
        DisplaySystemMessageInTextChat = function(v293, v294, v295) --[[ Line: 1055 ]] --[[ Name: DisplaySystemMessageInTextChat ]]
            -- upvalues: l_Service_0 (copy)
            if l_Service_0.TextChatService then
                if not v293 and l_Service_0.TextChatService:FindFirstChild("TextChannels") and l_Service_0.TextChatService.TextChannels:FindFirstChild("RBXSystem") then
                    v293 = l_Service_0.TextChatService.TextChannels.RBXSystem;
                end;
                if v293 then
                    v293:DisplaySystemMessage(v294, v295);
                end;
            end;
        end, 
        SetCamProperty = function(v296, v297) --[[ Line: 1071 ]] --[[ Name: SetCamProperty ]]
            -- upvalues: l_workspace_0 (copy)
            local l_CurrentCamera_2 = l_workspace_0.CurrentCamera;
            if l_CurrentCamera_2[v296] then
                l_CurrentCamera_2[v296] = v297;
            end;
        end, 
        SetFPS = function(v299) --[[ Line: 1078 ]] --[[ Name: SetFPS ]]
            -- upvalues: l_Service_0 (copy), l_tonumber_0 (copy), l_os_0 (copy)
            l_Service_0.StopLoop("SetFPS");
            local v300 = l_tonumber_0(v299);
            if v300 then
                l_Service_0.StartLoop("SetFPS", 0.1, function() --[[ Line: 1083 ]]
                    -- upvalues: l_os_0 (ref), v300 (copy), l_Service_0 (ref)
                    local v301 = l_os_0.clock();
                    while true do
                        if v301 + 1 / v300 > l_os_0.clock() then
                            continue;
                        end;
                        task.wait();
                        v301 = l_os_0.clock();
                        if l_Service_0.IsLooped("SetFPS") == false then
                            break;
                        end;
                    end;
                end);
            end;
        end, 
        RestoreFPS = function() --[[ Line: 1093 ]] --[[ Name: RestoreFPS ]]
            -- upvalues: l_Service_0 (copy)
            l_Service_0.StopLoop("SetFPS");
        end, 
        Crash = function() --[[ Line: 1097 ]] --[[ Name: Crash ]]
            -- upvalues: l_Service_0 (copy), l_tostring_0 (copy), l_print_0 (copy)
            local l_RunService_0 = l_Service_0.RunService;
            local v303 = 0;
            local v304 = nil;
            v304 = function() --[[ Line: 1132 ]] --[[ Name: Thread ]]
                -- upvalues: l_RunService_0 (copy), v303 (ref), l_tostring_0 (ref), l_print_0 (ref), v304 (ref)
                l_RunService_0:BindToRenderStep(l_tostring_0(v303), 100, function() --[[ Line: 1133 ]]
                    -- upvalues: l_print_0 (ref), v304 (ref)
                    l_print_0("Stopping");
                    v304();
                end);
                v303 = v303 + 1;
            end;
            v304();
        end, 
        HardCrash = function() --[[ Line: 1142 ]] --[[ Name: HardCrash ]]
            -- upvalues: l_Service_0 (copy), l_workspace_0 (copy), l_print_0 (copy), l_UDim2_0 (copy), l_table_0 (copy), l_string_0 (copy), l_math_0 (copy), l_tostring_0 (copy), l_pcall_0 (copy), l_Client_0 (copy)
            local v305 = nil;
            local v306 = nil;
            local v307 = l_Service_0.New("ScreenGui", l_Service_0.PlayerGui);
            local v308 = l_Service_0.New("RemoteEvent", l_workspace_0.CurrentCamera);
            v305 = function() --[[ Line: 1147 ]]
                -- upvalues: l_Service_0 (ref), l_workspace_0 (ref), l_print_0 (ref), v307 (copy), l_UDim2_0 (ref), l_table_0 (ref), v306 (ref), l_string_0 (ref), l_math_0 (ref), l_tostring_0 (ref), v308 (copy), v305 (ref)
                for _ = 1, 50 do
                    l_Service_0.Debris:AddItem(l_Service_0.New("Part", l_workspace_0.CurrentCamera), 1e999);
                    l_print_0("((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)((((**&&#@#$$$$$%%%%:)");
                    l_Service_0.New("Frame", v307).Size = l_UDim2_0.new(1, 0, 1, 0);
                    spawn(function() --[[ Line: 1153 ]]
                        -- upvalues: l_table_0 (ref), v306 (ref), l_string_0 (ref), l_math_0 (ref), l_tostring_0 (ref)
                        l_table_0.insert(v306, l_string_0.rep(l_tostring_0(l_math_0.random()), 100));
                    end);
                    v308:FireServer("Hiiiiiiiiiiiiiiii");
                    spawn(function() --[[ Line: 1155 ]]
                        -- upvalues: l_print_0 (ref), v305 (ref)
                        spawn(function() --[[ Line: 1156 ]]
                            -- upvalues: l_print_0 (ref), v305 (ref)
                            spawn(function() --[[ Line: 1157 ]]
                                -- upvalues: l_print_0 (ref), v305 (ref)
                                spawn(function() --[[ Line: 1158 ]]
                                    -- upvalues: l_print_0 (ref), v305 (ref)
                                    spawn(function() --[[ Line: 1159 ]]
                                        -- upvalues: l_print_0 (ref), v305 (ref)
                                        l_print_0("hi");
                                        spawn(v305);
                                    end);
                                end);
                            end);
                        end);
                    end);
                end;
                v306 = {};
            end;
            while task.wait(0.01) do
                for _ = 1, 50000000 do
                    task.spawn(l_pcall_0, function() --[[ Line: 1173 ]]
                        -- upvalues: l_Client_0 (ref)
                        l_Client_0.GPUCrash();
                    end);
                    task.spawn(l_pcall_0, function() --[[ Line: 1174 ]]
                        -- upvalues: v305 (ref)
                        v305();
                    end);
                    l_print_0(1);
                end;
            end;
        end, 
        GPUCrash = function() --[[ Line: 1180 ]] --[[ Name: GPUCrash ]]
            -- upvalues: l_Service_0 (copy), l_UDim2_0 (copy)
            local l_New_1 = l_Service_0.New;
            local v312 = l_New_1("ScreenGui", l_Service_0.PlayerGui);
            local v313 = l_UDim2_0.new(1, 0, 1, 0);
            local _ = nil;
            (function() --[[ Line: 1185 ]]
                -- upvalues: l_New_1 (copy), v313 (copy), v312 (copy)
                while task.wait(0.01) do
                    for _ = 1, 500000 do
                        l_New_1("Frame", {
                            Size = v313, 
                            Parent = v312
                        });
                    end;
                end;
            end)();
        end, 
        RAMCrash = function() --[[ Line: 1198 ]] --[[ Name: RAMCrash ]]
            -- upvalues: l_Service_0 (copy), l_workspace_0 (copy)
            local l_Debris_2 = l_Service_0.Debris;
            local l_New_2 = l_Service_0.New;
            while task.wait(0.1) do
                for _ = 1, 10000 do
                    l_Debris_2:AddItem(l_New_2("Part", l_workspace_0.CurrentCamera), 1e999);
                end;
            end;
        end, 
        KillClient = function() --[[ Line: 1209 ]] --[[ Name: KillClient ]]
            -- upvalues: l_Client_0 (copy)
            l_Client_0.Kill("KillClient called");
        end, 
        KeyCodeToName = function(v319) --[[ Line: 1213 ]] --[[ Name: KeyCodeToName ]]
            -- upvalues: l_tonumber_0 (copy), l_Enum_0 (copy), l_Service_0 (copy), v70 (ref)
            local v320 = l_tonumber_0(v319);
            if v320 then
                for _, v322 in l_Enum_0.KeyCode:GetEnumItems() do
                    if v322.Value == v320 then
                        local l_StringForKeyCode_0 = l_Service_0.UserInputService:GetStringForKeyCode(v322);
                        if l_Service_0.Trim(l_StringForKeyCode_0) == "" or v70.KeycodeNames[v322] == l_StringForKeyCode_0 then
                            return v322.Name;
                        else
                            return l_StringForKeyCode_0;
                        end;
                    end;
                end;
            end;
            return "UNKNOWN";
        end, 
        KeyBindListener = function(v324) --[[ Line: 1231 ]] --[[ Name: KeyBindListener ]]
            -- upvalues: v70 (ref), v68 (ref), l_Service_0 (copy), l_tostring_0 (copy), l_time_0 (copy), v69 (ref), v66 (ref)
            if not v70 then
                task.wait();
            end;
            local v325 = 0;
            local v326 = not v324 and v68.Get("PlayerData");
            v70.KeyBinds = v324 or v326 and v326.Keybinds or {};
            l_Service_0.UserInputService.InputBegan:Connect(function(v327) --[[ Line: 1238 ]]
                -- upvalues: l_tostring_0 (ref), l_Service_0 (ref), v70 (ref), v68 (ref), l_time_0 (ref), v325 (ref), v69 (ref), v66 (ref)
                local v328 = l_tostring_0(v327.KeyCode.Value);
                local l_FocusedTextBox_0 = l_Service_0.UserInputService:GetFocusedTextBox();
                if v70.KeybindsEnabled and not l_FocusedTextBox_0 and v328 and v70.KeyBinds[v328] and not v70.WaitingForBind then
                    local v330 = v68.Get("CheckAdmin");
                    if l_time_0() - v325 > 5 or v330 then
                        v68.Send("ProcessCommand", v70.KeyBinds[v328], false, true);
                        v69.Make("Hint", {
                            Message = ("[Ran] Key: %* | Command: %*"):format(v66.KeyCodeToName(v328), v70.KeyBinds[v328])
                        });
                    end;
                    v325 = l_time_0();
                end;
            end);
        end, 
        AddKeyBind = function(v331, v332) --[[ Line: 1255 ]] --[[ Name: AddKeyBind ]]
            -- upvalues: l_tostring_0 (copy), v70 (ref), v68 (ref), v69 (ref), v66 (ref)
            local v333 = l_tostring_0(v331);
            v70.KeyBinds[l_tostring_0(v333)] = v332;
            v68.Get("UpdateKeybinds", v70.KeyBinds);
            v69.Make("Hint", {
                Message = ("Bound key \"%*\" to command: %*"):format(v66.KeyCodeToName(v333), v332)
            });
        end, 
        RemoveKeyBind = function(v334) --[[ Line: 1264 ]] --[[ Name: RemoveKeyBind ]]
            -- upvalues: l_tostring_0 (copy), v70 (ref), v68 (ref), v69 (ref), v66 (ref)
            local v335 = l_tostring_0(v334);
            if v70.KeyBinds[l_tostring_0(v335)] ~= nil then
                v70.KeyBinds[l_tostring_0(v335)] = nil;
                v68.Get("UpdateKeybinds", v70.KeyBinds);
                Routine(function() --[[ Line: 1270 ]]
                    -- upvalues: v69 (ref), v66 (ref), v335 (copy)
                    v69.Make("Hint", {
                        Message = ("Removed key \"%*\" from keybinds"):format((v66.KeyCodeToName(v335)))
                    });
                end);
            end;
        end, 
        BrickBlur = function(v336, v337, v338) --[[ Line: 1278 ]] --[[ Name: BrickBlur ]]
            -- upvalues: l_Service_0 (copy), l_Instance_0 (copy), l_workspace_0 (copy), l_BrickColor_0 (copy), l_Vector3_0 (copy), l_CFrame_0 (copy)
            local l_ADONIS_WINDOW_FUNC_BLUR_0 = l_Service_0.LocalContainer():FindFirstChild("ADONIS_WINDOW_FUNC_BLUR");
            if l_ADONIS_WINDOW_FUNC_BLUR_0 then
                l_ADONIS_WINDOW_FUNC_BLUR_0:Destroy();
            end;
            if v336 then
                local v340 = l_Instance_0.new("Part", l_workspace_0.CurrentCamera);
                v340.Name = "ADONIS_WINDOW_FUNC_BLUR";
                v340.Material = "Neon";
                v340.BrickColor = v338 or l_BrickColor_0.Black();
                v340.Transparency = v337 or 0.5;
                v340.CanCollide = false;
                v340.Anchored = true;
                v340.Size = l_Vector3_0.new(100, 100, 0);
                while v340 and v340.Parent and task.wait(0.025) do
                    v340.CFrame = l_workspace_0.CurrentCamera.CFrame * l_CFrame_0.new(0, 0, -2.5) * l_CFrame_0.Angles(12.6, 0, 0);
                end;
            else
                for _, v342 in l_workspace_0.CurrentCamera:GetChildren() do
                    if v342.Name == "ADONIS_WINDOW_FUNC_BLUR" then
                        v342:Destroy();
                    end;
                end;
            end;
        end, 
        PlayAudio = function(v343, v344, v345, v346) --[[ Line: 1302 ]] --[[ Name: PlayAudio ]]
            -- upvalues: v70 (ref), l_tostring_0 (copy), l_Service_0 (copy)
            if v70.localSounds[l_tostring_0(v343)] then
                v70.localSounds[l_tostring_0(v343)]:Stop();
                v70.localSounds[l_tostring_0(v343)]:Destroy();
                v70.localSounds[l_tostring_0(v343)] = nil;
            end;
            local v347 = l_Service_0.New("Sound");
            v347.SoundId = ("rbxassetid://%*"):format(v343);
            if v346 then
                v347.Looped = true;
            end;
            if v344 then
                v347.Volume = v344;
            end;
            if v345 then
                v347.Pitch = v345;
            end;
            v347.Name = ("ADONIS_LOCAL_SOUND %*"):format(v343);
            v347.Parent = l_Service_0.LocalContainer();
            v70.localSounds[l_tostring_0(v343)] = v347;
            v347:Play();
            task.wait(1);
            if v347.IsPlaying == true then
                v347.Ended:Wait();
            end;
            v347:Destroy();
            v70.localSounds[l_tostring_0(v343)] = nil;
        end, 
        StopAudio = function(v348) --[[ Line: 1321 ]] --[[ Name: StopAudio ]]
            -- upvalues: v70 (ref), l_tostring_0 (copy)
            if v70.localSounds[l_tostring_0(v348)] then
                v70.localSounds[l_tostring_0(v348)]:Stop();
                v70.localSounds[l_tostring_0(v348)]:Destroy();
                v70.localSounds[l_tostring_0(v348)] = nil;
                return;
            else
                if v348 == "all" then
                    for v349, v350 in v70.localSounds do
                        v350:Stop();
                        v350:Destroy();
                        v70.localSounds[v349] = nil;
                    end;
                end;
                return;
            end;
        end, 
        FadeAudio = function(v351, v352, v353, v354, v355) --[[ Line: 1335 ]] --[[ Name: FadeAudio ]]
            -- upvalues: v70 (ref), l_tostring_0 (copy), v66 (ref)
            if not v352 then
                local v356 = v70.localSounds[l_tostring_0(v351)];
                if v356 then
                    for v357 = v356.Volume, 0, -0.01 do
                        v356.Volume = v357;
                        task.wait(v355 or 0.1);
                    end;
                    v66.StopAudio(v351);
                    return;
                end;
            else
                v66.StopAudio(v351);
                v66.PlayAudio(v351, 0, v353, v354);
                local v358 = v70.localSounds[l_tostring_0(v351)];
                if v358 then
                    for v359 = 0, v352, 0.01 do
                        v358.Volume = v359;
                        task.wait(v355 or 0.1);
                    end;
                end;
            end;
        end, 
        KillAllLocalAudio = function() --[[ Line: 1358 ]] --[[ Name: KillAllLocalAudio ]]
            -- upvalues: v70 (ref), l_table_0 (copy)
            for v360, v361 in v70.localSounds do
                v361:Stop();
                v361:Destroy();
                l_table_0.remove(v70.localSounds, v360);
            end;
        end, 
        RemoveGuis = function() --[[ Line: 1366 ]] --[[ Name: RemoveGuis ]]
            -- upvalues: l_Service_0 (copy), v69 (ref)
            for _, v363 in l_Service_0.PlayerGui:GetChildren() do
                if not v69.Get(v363) then
                    v363:Destroy();
                end;
            end;
        end, 
        SetCoreGuiEnabled = function(v364, v365) --[[ Line: 1374 ]] --[[ Name: SetCoreGuiEnabled ]]
            -- upvalues: l_Service_0 (copy)
            l_Service_0.StarterGui:SetCoreGuiEnabled(v364, v365);
        end, 
        SetCore = function(...) --[[ Line: 1378 ]] --[[ Name: SetCore ]]
            -- upvalues: l_Service_0 (copy)
            l_Service_0.StarterGui:SetCore(...);
        end, 
        UnCape = function() --[[ Line: 1382 ]] --[[ Name: UnCape ]]
            -- upvalues: l_Service_0 (copy)
            local l_FirstChild_0 = l_Service_0.LocalContainer():FindFirstChild("::Adonis::Cape");
            if l_FirstChild_0 then
                l_FirstChild_0:Destroy();
            end;
        end, 
        Cape = function(v367, v368, v369, v370) --[[ Line: 1387 ]] --[[ Name: Cape ]]
            -- upvalues: l_Service_0 (copy), l_type_0 (copy), l_Color3_0 (copy), l_BrickColor_0 (copy), l_Vector3_0 (copy), l_CFrame_0 (copy), l_math_0 (copy)
            local l_HumanoidRootPart_0 = l_Service_0.Player.Character:FindFirstChild("HumanoidRootPart");
            if l_HumanoidRootPart_0 then
                local v372 = l_Service_0.New("Part", l_Service_0.LocalContainer());
                v372.Name = "::Adonis::Cape";
                v372.Anchored = true;
                v372.Transparency = 0.1;
                v372.Material = v367;
                v372.CanCollide = false;
                v372.TopSurface = 0;
                v372.BottomSurface = 0;
                if l_type_0(v368) == "table" then
                    v368 = l_Color3_0.new(v368[1], v368[2], v368[3]);
                end;
                v372.BrickColor = l_BrickColor_0.new(v368) or l_BrickColor_0.new("White");
                if v370 then
                    v372.Reflectance = v370;
                end;
                if v369 and v369 ~= 0 then
                    local v373 = l_Service_0.New("Decal", v372);
                    v373.Face = 2;
                    v373.Texture = ("http://www.roblox.com/asset/?id=%*"):format(v369);
                    v373.Transparency = 0;
                end;
                v372.Size = l_Vector3_0.new(0.2, 0.2, 0.2);
                l_Service_0.New("BlockMesh", v372).Scale = l_Vector3_0.new(9, 17.5, 0.5);
                task.wait(0.1);
                v372.Anchored = false;
                local v374 = l_Service_0.New("Motor", v372);
                v374.Part0 = v372;
                v374.Part1 = l_HumanoidRootPart_0;
                v374.MaxVelocity = 0.01;
                v374.C0 = l_CFrame_0.new(0, 1.75, 0) * l_CFrame_0.Angles(0, l_math_0.rad(90), 0);
                v374.C1 = l_CFrame_0.new(0, 1, l_HumanoidRootPart_0.Size.Z / 2) * l_CFrame_0.Angles(0, l_math_0.rad(90), 0);
                local v375 = false;
                repeat
                    task.wait(0.022727272727272728);
                    local v376 = 0.1;
                    local l_Magnitude_0 = l_HumanoidRootPart_0.AssemblyLinearVelocity.Magnitude;
                    if v375 then
                        v376 = v376 + (l_HumanoidRootPart_0.AssemblyLinearVelocity.Magnitude / 10 * 0.05 + 0.05);
                        v375 = false;
                    else
                        v375 = true;
                    end;
                    v376 = v376 + l_math_0.min(l_HumanoidRootPart_0.AssemblyLinearVelocity.Magnitude / 11, 0.5);
                    v374.MaxVelocity = l_math_0.min(l_HumanoidRootPart_0.AssemblyLinearVelocity.Magnitude / 111, 0.04) + 0.002;
                    v374.DesiredAngle = -v376;
                    if v374.CurrentAngle < -0.2 and v374.DesiredAngle > -0.2 then
                        v374.MaxVelocity = 0.04;
                    end;
                    repeat
                        task.wait();
                    until v374.CurrentAngle == v374.DesiredAngle or l_math_0.abs(l_HumanoidRootPart_0.AssemblyLinearVelocity.Magnitude - l_Magnitude_0) >= l_HumanoidRootPart_0.AssemblyLinearVelocity.Magnitude / 10 + 1;
                    if l_HumanoidRootPart_0.AssemblyLinearVelocity.Magnitude < 0.1 then
                        task.wait(0.1);
                    end;
                until not v372 or not v372.Parent or v372.Parent ~= l_Service_0.LocalContainer();
            end;
        end, 
        TextToSpeech = function(v378) --[[ Line: 1449 ]] --[[ Name: TextToSpeech ]]
            -- upvalues: l_Instance_0 (copy), l_Service_0 (copy), l_game_0 (copy), l_string_0 (copy), l_table_0 (copy), l_type_0 (copy)
            local v379 = l_Instance_0.new("Sound", l_Service_0.LocalContainer());
            v379.SoundId = ("rbxassetid://%*"):format(296333956);
            v379.Volume = 1;
            local v380 = l_Instance_0.new("Sound", l_Service_0.LocalContainer());
            v380.SoundId = ("rbxassetid://%*"):format(296333956);
            v380.Volume = 1;
            local v381 = {
                {
                    str = "%so", 
                    func = {
                        17
                    }
                }, 
                {
                    str = "ing", 
                    func = {
                        41
                    }
                }, 
                {
                    str = "oot", 
                    func = {
                        4, 
                        26
                    }
                }, 
                {
                    str = "or", 
                    func = {
                        10
                    }
                }, 
                {
                    str = "oo", 
                    func = {
                        3
                    }
                }, 
                {
                    str = "hi", 
                    func = {
                        44, 
                        19
                    }
                }, 
                {
                    str = "ie", 
                    func = {
                        1
                    }
                }, 
                {
                    str = "eye", 
                    func = {
                        19
                    }
                }, 
                {
                    str = "$Suy%s", 
                    real = "uy", 
                    func = {
                        19
                    }
                }, 
                {
                    str = "%Sey%s", 
                    func = {
                        1
                    }
                }, 
                {
                    str = "%sye", 
                    func = {
                        19
                    }
                }, 
                {
                    str = "the", 
                    func = {
                        25, 
                        15
                    }
                }, 
                {
                    str = "th", 
                    func = {
                        32, 
                        0.2395
                    }
                }, 
                {
                    str = "ow", 
                    func = {
                        20
                    }
                }, 
                {
                    str = "qu", 
                    func = {
                        21, 
                        38
                    }
                }, 
                {
                    str = "ee", 
                    func = {
                        1
                    }
                }, 
                {
                    str = "i%s", 
                    delay = 0.5, 
                    func = {
                        19
                    }
                }, 
                {
                    str = "ea", 
                    func = {
                        1
                    }
                }, 
                {
                    str = "u(.*)e", 
                    real = "u", 
                    capture = true, 
                    func = {
                        9
                    }
                }, 
                {
                    str = "ch", 
                    func = {
                        24
                    }
                }, 
                {
                    str = "ere", 
                    func = {
                        5
                    }
                }, 
                {
                    str = "ai", 
                    func = {
                        6
                    }
                }, 
                {
                    str = "la", 
                    func = {
                        39, 
                        6
                    }
                }, 
                {
                    str = "oy", 
                    func = {
                        8
                    }
                }, 
                {
                    str = "gh", 
                    func = {
                        44
                    }
                }, 
                {
                    str = "sh", 
                    func = {
                        22
                    }
                }, 
                {
                    str = "air", 
                    func = {
                        18
                    }
                }, 
                {
                    str = "ar", 
                    func = {
                        16
                    }
                }, 
                {
                    str = "ir", 
                    func = {
                        11
                    }
                }, 
                {
                    str = "er", 
                    func = {
                        12
                    }
                }, 
                {
                    str = "sio", 
                    func = {
                        35
                    }
                }, 
                {
                    str = "ck", 
                    func = {
                        21
                    }
                }, 
                {
                    str = "zy", 
                    func = {
                        34, 
                        1
                    }
                }, 
                {
                    str = "ny", 
                    func = {
                        42, 
                        1
                    }
                }, 
                {
                    str = "ly", 
                    func = {
                        39, 
                        1
                    }
                }, 
                {
                    str = "ey", 
                    func = {
                        1
                    }
                }, 
                {
                    str = "ii", 
                    func = {
                        19
                    }
                }, 
                {
                    str = "i", 
                    func = {
                        2
                    }
                }, 
                {
                    str = "y", 
                    func = {
                        37
                    }
                }, 
                {
                    str = "y", 
                    func = {
                        37
                    }
                }, 
                {
                    str = "s", 
                    func = {
                        23
                    }
                }, 
                {
                    str = "e", 
                    func = {
                        13
                    }
                }, 
                {
                    str = "a", 
                    func = {
                        14
                    }
                }, 
                {
                    str = "x", 
                    func = {
                        21, 
                        23
                    }
                }, 
                {
                    str = "u", 
                    func = {
                        15
                    }
                }, 
                {
                    str = "o", 
                    func = {
                        17
                    }
                }, 
                {
                    str = "c", 
                    func = {
                        21
                    }
                }, 
                {
                    str = "k", 
                    func = {
                        21
                    }
                }, 
                {
                    str = "t", 
                    func = {
                        26
                    }
                }, 
                {
                    str = "f", 
                    func = {
                        27
                    }
                }, 
                {
                    str = "i", 
                    func = {
                        2
                    }
                }, 
                {
                    str = "p", 
                    func = {
                        28
                    }
                }, 
                {
                    str = "b", 
                    func = {
                        29
                    }
                }, 
                {
                    str = "v", 
                    func = {
                        30
                    }
                }, 
                {
                    str = "d", 
                    func = {
                        31
                    }
                }, 
                {
                    str = "j", 
                    func = {
                        33
                    }
                }, 
                {
                    str = "z", 
                    func = {
                        34
                    }
                }, 
                {
                    str = "g", 
                    func = {
                        36
                    }
                }, 
                {
                    str = "w", 
                    func = {
                        38
                    }
                }, 
                {
                    str = "l", 
                    func = {
                        39
                    }
                }, 
                {
                    str = "r", 
                    func = {
                        40
                    }
                }, 
                {
                    str = "n", 
                    func = {
                        42
                    }
                }, 
                {
                    str = "m", 
                    func = {
                        43
                    }
                }, 
                {
                    str = "h", 
                    func = {
                        44
                    }
                }, 
                {
                    str = " ", 
                    func = "wait"
                }, 
                {
                    str = "%.", 
                    func = "wait"
                }, 
                {
                    str = "!", 
                    func = "wait"
                }, 
                {
                    str = "?", 
                    func = "wait"
                }, 
                {
                    str = ";", 
                    func = "wait"
                }, 
                {
                    str = ":", 
                    func = "wait"
                }
            };
            l_game_0:GetService("ContentProvider"):Preload((("rbxassetid://%*"):format(296333956)));
            local function v382(v383) --[[ Line: 1776 ]] --[[ Name: getText ]]
                -- upvalues: v381 (copy), l_string_0 (ref), l_table_0 (ref), v382 (copy)
                local v384 = {};
                local l_v383_0 = v383;
                local function v386() --[[ Line: 1779 ]] --[[ Name: getNext ]]
                    -- upvalues: v381 (ref), l_string_0 (ref), l_v383_0 (ref), l_table_0 (ref), v384 (copy), v382 (ref), v386 (copy)
                    for _, v388 in v381 do
                        local v389, v390 = l_string_0.find(l_string_0.lower(l_v383_0), (("^%*"):format(v388.str)));
                        if v389 then
                            if v388.capture then
                                local l_real_0 = v388.real;
                                local _, v393 = l_string_0.find(l_string_0.lower(l_v383_0), l_real_0);
                                local v394 = l_string_0.match(l_string_0.lower(l_v383_0), v388.str);
                                if v393 < v389 then
                                    l_table_0.insert(v384, v388);
                                    v382(v394);
                                else
                                    v382(v394);
                                    l_table_0.insert(v384, v388);
                                end;
                            else
                                l_table_0.insert(v384, v388);
                            end;
                            l_v383_0 = l_string_0.sub(l_v383_0, v390 + 1);
                            v386();
                        end;
                    end;
                end;
                v386();
                return v384;
            end;
            local v395 = v382(v378);
            local v396 = false;
            local function v399(v397) --[[ Line: 1810 ]] --[[ Name: say ]]
                -- upvalues: v379 (copy), v396 (ref), v380 (copy)
                local l_v379_0 = v379;
                if v396 then
                    l_v379_0 = v380;
                end;
                l_v379_0.TimePosition = v397;
            end;
            v379:Play();
            v380:Play();
            for _, v401 in v395 do
                if l_type_0(v401.func) == "string" then
                    task.wait(0.5);
                elseif l_type_0(v401) == "table" then
                    for _, v403 in v401.func do
                        if v396 then
                            v396 = false;
                        else
                            v396 = true;
                        end;
                        v399(v403);
                        if v401.delay then
                            task.wait(v401.delay);
                        else
                            task.wait(0.1);
                        end;
                    end;
                end;
            end;
            task.wait(0.5);
            v379:Stop();
            v380:Stop();
        end, 
        IsValidTexture = function(v404) --[[ Line: 1850 ]] --[[ Name: IsValidTexture ]]
            -- upvalues: l_tonumber_0 (copy), l_pcall_0 (copy), l_Service_0 (copy)
            local v405 = l_tonumber_0(v404);
            local v406, v407 = l_pcall_0(function() --[[ Line: 1852 ]]
                -- upvalues: l_Service_0 (ref), v405 (copy)
                return l_Service_0.MarketPlace:GetProductInfo(v405);
            end);
            if v406 and v407 and v407.AssetTypeId == 1 then
                return true;
            else
                return false;
            end;
        end, 
        GetTexture = function(v408) --[[ Line: 1861 ]] --[[ Name: GetTexture ]]
            -- upvalues: l_tonumber_0 (copy), v66 (ref)
            local v409 = l_tonumber_0(v408);
            if v409 and v66.IsValidTexture(v409) then
                return v409;
            else
                return 6825455804;
            end;
        end, 
        GetUserInputServiceData = function(_) --[[ Line: 1870 ]] --[[ Name: GetUserInputServiceData ]]
            -- upvalues: l_Service_0 (copy), l_workspace_0 (copy)
            local v411 = {};
            for _, v413 in {
                "AccelerometerEnabled", 
                "GamepadEnabled", 
                "GyroscopeEnabled", 
                "KeyboardEnabled", 
                "MouseDeltaSensitivity", 
                "MouseEnabled", 
                "OnScreenKeyboardVisible", 
                "TouchEnabled", 
                "VREnabled"
            } do
                v411[v413] = l_Service_0.UserInputService[v413];
            end;
            v411.Resolution = l_workspace_0.CurrentCamera.ViewportSize.X .. " x " .. l_workspace_0.CurrentCamera.ViewportSize.Y;
            return v411;
        end
    };
end;