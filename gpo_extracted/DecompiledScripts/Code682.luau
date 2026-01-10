local v0 = nil;
local v1 = nil;
local v2 = nil;
local v3 = nil;
local v4 = nil;
client = v0;
Pcall = v1;
Routine = v2;
service = v3;
gTable = v4;
return function(v5, v6) --[[ Line: 9 ]]
    if v6 then
        setfenv(1, v6);
    end;
    local l_client_0 = client;
    local _ = Pcall;
    local l_Routine_0 = Routine;
    local l_service_0 = service;
    local l_gTable_0 = gTable;
    local l_Parent_0 = script.Parent.Parent;
    local l_Mouse_0 = l_service_0.Player:GetMouse();
    local _ = l_service_0.PlayerGui;
    local l_StoredChats_0 = l_client_0.Variables.StoredChats;
    local l_Desc_0 = l_Parent_0.Desc;
    local l_KeepChat_0 = v5.KeepChat;
    local function v27(v18, v19) --[[ Line: 27 ]] --[[ Name: Expand ]]
        v18.MouseLeave:Connect(function(_, _) --[[ Line: 28 ]]
            -- upvalues: v19 (copy)
            v19.Visible = false;
        end);
        v18.MouseMoved:Connect(function(v22, v23) --[[ Line: 32 ]]
            -- upvalues: v19 (copy), v18 (copy)
            v19.Text = v18.Desc.Value;
            v19.Size = UDim2.new(0, 10000, 0, 10000);
            local l_X_0 = v19.TextBounds.X;
            local v25 = math.floor(l_X_0 / 500) + 1;
            if v25 < 1 then
                v25 = 1;
            end;
            local v26 = 500;
            if l_X_0 < 500 then
                v26 = l_X_0;
            end;
            v19.Visible = true;
            v19.Size = UDim2.new(0, v26 + 10, 0, v25 * 20);
            v19.Position = UDim2.new(0, v22, 0, v23 - 40 - v25 * 20);
        end);
    end;
    local function v52() --[[ Line: 51 ]] --[[ Name: UpdateChat ]]
        -- upvalues: l_Parent_0 (copy), l_StoredChats_0 (ref), l_service_0 (copy), v27 (copy), l_Desc_0 (copy)
        if l_Parent_0 then
            local l_Global_0 = l_Parent_0.Drag.Frame.Frame.Global;
            local l_Team_0 = l_Parent_0.Drag.Frame.Frame.Team;
            local l_Local_0 = l_Parent_0.Drag.Frame.Frame.Local;
            local l_Admins_0 = l_Parent_0.Drag.Frame.Frame.Admins;
            local l_Cross_0 = l_Parent_0.Drag.Frame.Frame.Cross;
            local l_Entry_0 = l_Parent_0.Entry;
            local l_BoundTest_0 = l_Parent_0.BoundTest;
            l_Global_0:ClearAllChildren();
            l_Team_0:ClearAllChildren();
            l_Local_0:ClearAllChildren();
            l_Admins_0:ClearAllChildren();
            l_Cross_0:ClearAllChildren();
            local v35 = 0;
            local v36 = 0;
            local v37 = 0;
            local v38 = 0;
            local v39 = 0;
            for _, v41 in l_StoredChats_0 do
                local v42 = l_Entry_0:Clone();
                v42.Message.Text = l_service_0.MaxLen(v41.Message, 100);
                v42.Desc.Value = v41.Message;
                v27(v42, l_Desc_0);
                if not string.match(v41.Player, "%S") then
                    v42.Nameb.Text = v41.Player;
                else
                    v42.Nameb.Text = ("[%*]: "):format(v41.Player);
                end;
                v42.Visible = true;
                v42.Nameb.Font = "SourceSansBold";
                local v43 = v41.Color or BrickColor.White();
                v42.Nameb.TextColor3 = v43.Color;
                l_BoundTest_0.Text = ("[%*]: "):format(v41.Player);
                local v44 = l_BoundTest_0.TextBounds.X + 5;
                if v44 > 100 then
                    v44 = 100;
                end;
                l_BoundTest_0.Text = v41.Message;
                local l_X_1 = l_BoundTest_0.TextBounds.X;
                v42.Message.Position = UDim2.new(0, v44, 0, 0);
                v42.Message.Size = UDim2.new(1, -(v44 + 10), 1, 0);
                v42.Nameb.Size = UDim2.new(0, v44, 0, 20);
                v42.Visible = false;
                v42.Parent = l_Global_0;
                local v46 = math.floor((l_X_1 + v44) / v42.AbsoluteSize.X) + 1;
                if v46 < 1 then
                    v46 = 1;
                end;
                if v46 > 3 then
                    v46 = 3;
                end;
                v42.Parent = nil;
                v42.Visible = true;
                v42.Size = UDim2.new(1, 0, 0, v46 * 20);
                if v41.Private then
                    v42.Nameb.TextColor3 = Color3.new(0.58823529411765, 0.22352941176471, 0.69019607843137);
                end;
                if v41.Mode == "Global" then
                    v42.Position = UDim2.new(0, 0, 0, v35 * 20);
                    v35 = v35 + 1;
                    if v46 > 1 then
                        v35 = v35 + v46 - 1;
                    end;
                    v42.Parent = l_Global_0;
                elseif v41.Mode == "Team" then
                    v42.Position = UDim2.new(0, 0, 0, v36 * 20);
                    v36 = v36 + 1;
                    if v46 > 1 then
                        v36 = v36 + v46 - 1;
                    end;
                    v42.Parent = l_Team_0;
                elseif v41.Mode == "Local" then
                    v42.Position = UDim2.new(0, 0, 0, v37 * 20);
                    v37 = v37 + 1;
                    if v46 > 1 then
                        v37 = v37 + v46 - 1;
                    end;
                    v42.Parent = l_Local_0;
                elseif v41.Mode == "Admins" then
                    v42.Position = UDim2.new(0, 0, 0, v38 * 20);
                    v38 = v38 + 1;
                    if v46 > 1 then
                        v38 = v38 + v46 - 1;
                    end;
                    v42.Parent = l_Admins_0;
                elseif v41.Mode == "Cross" then
                    v42.Position = UDim2.new(0, 0, 0, v39 * 20);
                    v39 = v39 + 1;
                    if v46 > 1 then
                        v39 = v39 + v46 - 1;
                    end;
                    v42.Parent = l_Cross_0;
                end;
            end;
            l_Global_0.CanvasSize = UDim2.new(0, 0, 0, v35 * 20);
            l_Team_0.CanvasSize = UDim2.new(0, 0, 0, v36 * 20);
            l_Local_0.CanvasSize = UDim2.new(0, 0, 0, v37 * 20);
            l_Admins_0.CanvasSize = UDim2.new(0, 0, 0, v38 * 20);
            l_Cross_0.CanvasSize = UDim2.new(0, 0, 0, v39 * 20);
            local v47 = v35 * 20 - l_Global_0.AbsoluteWindowSize.Y;
            local v48 = v36 * 20 - l_Team_0.AbsoluteWindowSize.Y;
            local v49 = v37 * 20 - l_Local_0.AbsoluteWindowSize.Y;
            local v50 = v38 * 20 - l_Admins_0.AbsoluteWindowSize.Y;
            local v51 = v39 * 20 - l_Cross_0.AbsoluteWindowSize.Y;
            if v47 < 0 then
                v47 = 0;
            end;
            if v48 < 0 then
                v48 = 0;
            end;
            if v49 < 0 then
                v49 = 0;
            end;
            if v50 < 0 then
                v50 = 0;
            end;
            if v51 < 0 then
                v51 = 0;
            end;
            l_Global_0.CanvasPosition = Vector2.new(0, v47);
            l_Team_0.CanvasPosition = Vector2.new(0, v48);
            l_Local_0.CanvasPosition = Vector2.new(0, v49);
            l_Admins_0.CanvasPosition = Vector2.new(0, v50);
            l_Cross_0.CanvasPosition = Vector2.new(0, v51);
        end;
    end;
    if not l_StoredChats_0 then
        l_client_0.Variables.StoredChats = {};
        l_StoredChats_0 = l_client_0.Variables.StoredChats;
    end;
    l_gTable_0:Ready();
    local l_Bubble_0 = l_Parent_0.Bubble;
    local l_Toggle_0 = l_Parent_0.Toggle;
    local l_Drag_0 = l_Parent_0.Drag;
    local l_Frame_0 = l_Parent_0.Drag.Frame;
    local l_Frame_1 = l_Parent_0.Drag.Frame.Frame;
    local l_Chat_0 = l_Parent_0.Drag.Frame.Chat;
    local l_Global_1 = l_Parent_0.Drag.Frame.Frame.Global;
    local l_Team_1 = l_Parent_0.Drag.Frame.Frame.Team;
    local l_Local_1 = l_Parent_0.Drag.Frame.Frame.Local;
    local l_Admins_1 = l_Parent_0.Drag.Frame.Frame.Admins;
    local l_Cross_1 = l_Parent_0.Drag.Frame.Frame.Cross;
    local l_Global_2 = l_Parent_0.Drag.Frame.Global;
    local l_Team_2 = l_Parent_0.Drag.Frame.Team;
    local l_Local_2 = l_Parent_0.Drag.Frame.Local;
    local l_Admins_2 = l_Parent_0.Drag.Frame.Admins;
    local l_Cross_2 = l_Parent_0.Drag.Frame.Cross;
    if not l_KeepChat_0 then
        l_client_0.Variables.CustomChat = true;
        l_client_0.Variables.ChatEnabled = false;
        l_service_0.StarterGui:SetCoreGuiEnabled("Chat", false);
    else
        l_Drag_0.Position = UDim2.new(0, 10, 1, -180);
    end;
    local l_Dragger_0 = l_Parent_0.Drag.Frame.Dragger;
    local l_FakeDragger_0 = l_Parent_0.Drag.Frame.FakeDragger;
    local v71 = false;
    local v72 = "Global";
    local v73 = 0;
    local v74 = 0;
    local v75 = l_client_0.Remote.Get("CheckAdmin");
    if not v75 then
        l_Admins_2.BackgroundTransparency = 0.8;
        l_Admins_2.TextTransparency = 0.8;
        l_Cross_2.BackgroundTransparency = 0.8;
        l_Cross_2.TextTransparency = 0.8;
    end;
    if l_client_0.UI.Get("HelpButton") then
        l_Toggle_0.Position = UDim2.new(1, -90, 1, -45);
    end;
    local function v76() --[[ Line: 254 ]] --[[ Name: openGlobal ]]
        -- upvalues: l_Global_1 (copy), l_Team_1 (copy), l_Local_1 (copy), l_Admins_1 (copy), l_Cross_1 (copy), l_Global_2 (copy), v72 (ref), l_Team_2 (copy), l_Local_2 (copy), v75 (ref), l_Admins_2 (copy), l_Cross_2 (copy)
        l_Global_1.Visible = true;
        l_Team_1.Visible = false;
        l_Local_1.Visible = false;
        l_Admins_1.Visible = false;
        l_Cross_1.Visible = false;
        l_Global_2.Text = "Global";
        v72 = "Global";
        l_Global_2.BackgroundTransparency = 0;
        l_Team_2.BackgroundTransparency = 0.5;
        l_Local_2.BackgroundTransparency = 0.5;
        if v75 then
            l_Admins_2.BackgroundTransparency = 0.5;
            l_Admins_2.TextTransparency = 0;
            l_Cross_2.BackgroundTransparency = 0.5;
            l_Cross_2.TextTransparency = 0;
            return;
        else
            l_Admins_2.BackgroundTransparency = 0.8;
            l_Admins_2.TextTransparency = 0.8;
            l_Cross_2.BackgroundTransparency = 0.8;
            l_Cross_2.TextTransparency = 0.8;
            return;
        end;
    end;
    local function v77() --[[ Line: 280 ]] --[[ Name: openTeam ]]
        -- upvalues: l_Global_1 (copy), l_Team_1 (copy), l_Local_1 (copy), l_Admins_1 (copy), l_Cross_1 (copy), l_Team_2 (copy), v72 (ref), l_Global_2 (copy), l_Local_2 (copy), l_Admins_2 (copy), v75 (ref), l_Cross_2 (copy)
        l_Global_1.Visible = false;
        l_Team_1.Visible = true;
        l_Local_1.Visible = false;
        l_Admins_1.Visible = false;
        l_Cross_1.Visible = false;
        l_Team_2.Text = "Team";
        v72 = "Team";
        l_Global_2.BackgroundTransparency = 0.5;
        l_Team_2.BackgroundTransparency = 0;
        l_Local_2.BackgroundTransparency = 0.5;
        l_Admins_2.BackgroundTransparency = 0.5;
        if v75 then
            l_Admins_2.BackgroundTransparency = 0.5;
            l_Admins_2.TextTransparency = 0;
            l_Cross_2.BackgroundTransparency = 0.5;
            l_Cross_2.TextTransparency = 0;
            return;
        else
            l_Admins_2.BackgroundTransparency = 0.8;
            l_Admins_2.TextTransparency = 0.8;
            l_Cross_2.BackgroundTransparency = 0.8;
            l_Cross_2.TextTransparency = 0.8;
            return;
        end;
    end;
    local function v78() --[[ Line: 307 ]] --[[ Name: openLocal ]]
        -- upvalues: l_Global_1 (copy), l_Team_1 (copy), l_Local_1 (copy), l_Admins_1 (copy), l_Cross_1 (copy), l_Local_2 (copy), v72 (ref), l_Global_2 (copy), l_Team_2 (copy), l_Admins_2 (copy), v75 (ref), l_Cross_2 (copy)
        l_Global_1.Visible = false;
        l_Team_1.Visible = false;
        l_Local_1.Visible = true;
        l_Admins_1.Visible = false;
        l_Cross_1.Visible = false;
        l_Local_2.Text = "Local";
        v72 = "Local";
        l_Global_2.BackgroundTransparency = 0.5;
        l_Team_2.BackgroundTransparency = 0.5;
        l_Local_2.BackgroundTransparency = 0;
        l_Admins_2.BackgroundTransparency = 0.5;
        if v75 then
            l_Admins_2.BackgroundTransparency = 0.5;
            l_Admins_2.TextTransparency = 0;
            l_Cross_2.BackgroundTransparency = 0.5;
            l_Cross_2.TextTransparency = 0;
            return;
        else
            l_Admins_2.BackgroundTransparency = 0.8;
            l_Admins_2.TextTransparency = 0.8;
            l_Cross_2.BackgroundTransparency = 0.8;
            l_Cross_2.TextTransparency = 0.8;
            return;
        end;
    end;
    local function v79() --[[ Line: 334 ]] --[[ Name: openAdmins ]]
        -- upvalues: l_Global_1 (copy), l_Team_1 (copy), l_Local_1 (copy), l_Admins_1 (copy), l_Cross_1 (copy), l_Admins_2 (copy), v72 (ref), l_Global_2 (copy), l_Team_2 (copy), l_Local_2 (copy), v75 (ref), l_Cross_2 (copy)
        l_Global_1.Visible = false;
        l_Team_1.Visible = false;
        l_Local_1.Visible = false;
        l_Admins_1.Visible = true;
        l_Cross_1.Visible = false;
        l_Admins_2.Text = "Admins";
        v72 = "Admins";
        l_Global_2.BackgroundTransparency = 0.5;
        l_Team_2.BackgroundTransparency = 0.5;
        l_Local_2.BackgroundTransparency = 0.5;
        if v75 then
            l_Admins_2.BackgroundTransparency = 0;
            l_Admins_2.TextTransparency = 0;
            l_Cross_2.BackgroundTransparency = 0.5;
            l_Cross_2.TextTransparency = 0;
            return;
        else
            l_Admins_2.BackgroundTransparency = 0.8;
            l_Admins_2.TextTransparency = 0.8;
            l_Cross_2.BackgroundTransparency = 0.8;
            l_Cross_2.TextTransparency = 0.8;
            return;
        end;
    end;
    local function v80() --[[ Line: 360 ]] --[[ Name: openCross ]]
        -- upvalues: l_Global_1 (copy), l_Team_1 (copy), l_Local_1 (copy), l_Admins_1 (copy), l_Cross_1 (copy), l_Cross_2 (copy), v72 (ref), l_Global_2 (copy), l_Team_2 (copy), l_Local_2 (copy), v75 (ref), l_Admins_2 (copy)
        l_Global_1.Visible = false;
        l_Team_1.Visible = false;
        l_Local_1.Visible = false;
        l_Admins_1.Visible = false;
        l_Cross_1.Visible = true;
        l_Cross_2.Text = "Cross";
        v72 = "Cross";
        l_Global_2.BackgroundTransparency = 0.5;
        l_Team_2.BackgroundTransparency = 0.5;
        l_Local_2.BackgroundTransparency = 0.5;
        if v75 then
            l_Admins_2.BackgroundTransparency = 0.5;
            l_Admins_2.TextTransparency = 0;
            l_Cross_2.BackgroundTransparency = 0;
            l_Cross_2.TextTransparency = 0;
            return;
        else
            l_Admins_2.BackgroundTransparency = 0.8;
            l_Admins_2.TextTransparency = 0.8;
            l_Cross_2.BackgroundTransparency = 0.8;
            l_Cross_2.TextTransparency = 0.8;
            return;
        end;
    end;
    local function v81() --[[ Line: 386 ]] --[[ Name: fadeIn ]]
        -- upvalues: l_Frame_0 (copy), l_Frame_1 (copy), l_Chat_0 (copy), l_FakeDragger_0 (copy)
        l_Frame_0.BackgroundTransparency = 0;
        l_Frame_1.BackgroundTransparency = 0;
        l_Chat_0.BackgroundTransparency = 0;
        l_FakeDragger_0.Visible = true;
    end;
    local function v82() --[[ Line: 403 ]] --[[ Name: fadeOut ]]
        -- upvalues: l_Frame_0 (copy), l_Frame_1 (copy), l_Chat_0 (copy), l_FakeDragger_0 (copy)
        l_Frame_0.BackgroundTransparency = 0.7;
        l_Frame_1.BackgroundTransparency = 1;
        l_Chat_0.BackgroundTransparency = 1;
        l_FakeDragger_0.Visible = false;
    end;
    v82();
    l_Frame_0.MouseEnter:Connect(function() --[[ Line: 422 ]]
        -- upvalues: v81 (copy)
        v81();
    end);
    l_Frame_0.MouseLeave:Connect(function() --[[ Line: 426 ]]
        -- upvalues: v71 (ref), v82 (copy)
        if not v71 then
            v82();
        end;
    end);
    l_Toggle_0.MouseButton1Click:Connect(function() --[[ Line: 432 ]]
        -- upvalues: l_Drag_0 (copy), l_Toggle_0 (copy)
        if l_Drag_0.Visible then
            l_Drag_0.Visible = false;
            l_Toggle_0.Image = "rbxassetid://417301749";
            return;
        else
            l_Drag_0.Visible = true;
            l_Toggle_0.Image = "rbxassetid://417301773";
            return;
        end;
    end);
    l_Global_2.MouseButton1Click:Connect(function() --[[ Line: 442 ]]
        -- upvalues: v76 (copy)
        v76();
    end);
    l_Team_2.MouseButton1Click:Connect(function() --[[ Line: 446 ]]
        -- upvalues: v77 (copy)
        v77();
    end);
    l_Local_2.MouseButton1Click:Connect(function() --[[ Line: 450 ]]
        -- upvalues: v78 (copy)
        v78();
    end);
    l_Admins_2.MouseButton1Click:Connect(function() --[[ Line: 454 ]]
        -- upvalues: v75 (ref), v74 (ref), l_client_0 (copy), v79 (copy), l_Admins_2 (copy)
        if v75 or os.clock() - v74 > 5 then
            v75 = l_client_0.Remote.Get("CheckAdmin");
            if v75 then
                v79();
            else
                l_Admins_2.BackgroundTransparency = 0.8;
                l_Admins_2.TextTransparency = 0.8;
            end;
            v74 = os.clock();
        end;
    end);
    l_Cross_2.MouseButton1Click:Connect(function() --[[ Line: 467 ]]
        -- upvalues: v75 (ref), v74 (ref), l_client_0 (copy), v80 (copy), l_Cross_2 (copy)
        if v75 or os.clock() - v74 > 5 then
            v75 = l_client_0.Remote.Get("CheckAdmin");
            if v75 then
                v80();
            else
                l_Cross_2.BackgroundTransparency = 0.8;
                l_Cross_2.TextTransparency = 0.8;
            end;
            v74 = os.clock();
        end;
    end);
    l_Chat_0.FocusLost:Connect(function(v83) --[[ Line: 480 ]]
        -- upvalues: v71 (ref), l_client_0 (copy), l_Chat_0 (copy), v72 (ref), v73 (ref), v82 (copy)
        v71 = false;
        if v83 and not l_client_0.Variables.Muted then
            if l_Chat_0.Text ~= "" and (v72 ~= "Cross" and os.clock() - v73 >= 0.5 or v72 == "Cross" and os.clock() - v73 >= 10) then
                if not l_client_0.Variables.Muted then
                    l_client_0.Remote.Send("ProcessCustomChat", l_Chat_0.Text, v72);
                    v73 = os.clock();
                end;
            elseif (v72 == "Cross" or os.clock() - v73 < 0.5) and (v72 ~= "Cross" or os.clock() - v73 < 10) then
                local v84 = nil;
                v84 = string.sub(tostring(if v72 == "Cross" then 10 - (os.clock() - v73) else 0.5 - (os.clock() - v73)), 1, 3);
                l_client_0.Handlers.ChatHandler("SpamBot", ("Sending too fast! Please wait %* seconds."):format(v84), "System");
            end;
            l_Chat_0.Text = "Click here or press the '/' key to chat";
            v82();
            if v72 ~= "Cross" then
                v73 = os.clock();
            end;
        end;
    end);
    l_Chat_0.Focused:Connect(function() --[[ Line: 506 ]]
        -- upvalues: v71 (ref), l_Chat_0 (copy), v81 (copy)
        v71 = true;
        if l_Chat_0.Text == "Click here or press the '/' key to chat" then
            l_Chat_0.Text = "";
        end;
        v81();
    end);
    if not l_KeepChat_0 then
        l_service_0.UserInputService.InputBegan:Connect(function(v85) --[[ Line: 515 ]]
            -- upvalues: l_service_0 (copy), l_Chat_0 (copy)
            if not l_service_0.UserInputService:GetFocusedTextBox() and v85.UserInputType == Enum.UserInputType.Keyboard and v85.KeyCode == Enum.KeyCode.Slash then
                if l_Chat_0.Text == "Click here or press the '/' key to chat" then
                    l_Chat_0.Text = "";
                end;
                l_service_0.RunService.RenderStepped:Wait();
                l_Chat_0:CaptureFocus();
            end;
        end);
    end;
    local v86 = false;
    local l_X_2 = l_Drag_0.AbsoluteSize.X;
    local l_Y_0 = l_Frame_0.AbsoluteSize.Y;
    local l_l_X_2_0 = l_X_2;
    local l_l_Y_0_0 = l_Y_0;
    l_Mouse_0.Move:Connect(function(_, _) --[[ Line: 531 ]]
        -- upvalues: v86 (ref), l_X_2 (ref), l_l_X_2_0 (ref), l_Dragger_0 (copy), l_Y_0 (ref), l_l_Y_0_0 (ref), l_Frame_0 (copy), l_Drag_0 (copy)
        if v86 then
            l_X_2 = math.clamp(l_l_X_2_0 + (l_Dragger_0.Position.X.Offset + 20), 1, 260);
            l_Y_0 = math.clamp(l_l_Y_0_0 + (l_Dragger_0.Position.Y.Offset + 20), 1, 100);
            l_Frame_0.Size = UDim2.new(1, 0, 0, l_Y_0);
            l_Drag_0.Size = UDim2.new(0, l_X_2, 0, 30);
        end;
    end);
    l_Dragger_0.DragBegin:Connect(function(_) --[[ Line: 540 ]]
        -- upvalues: v86 (ref)
        v86 = true;
    end);
    l_Dragger_0.DragStopped:Connect(function(_, _) --[[ Line: 543 ]]
        -- upvalues: v86 (ref), l_l_X_2_0 (ref), l_X_2 (ref), l_l_Y_0_0 (ref), l_Y_0 (ref), l_Dragger_0 (copy), v52 (copy)
        v86 = false;
        l_l_X_2_0 = l_X_2;
        l_l_Y_0_0 = l_Y_0;
        l_Dragger_0.Position = UDim2.new(1, -20, 1, -20);
        v52();
    end);
    v52();
    l_client_0.Handlers.RemoveCustomChat = function() --[[ Line: 562 ]]
        -- upvalues: l_Parent_0 (copy), l_client_0 (copy), l_service_0 (copy)
        local l_l_Parent_0_0 = l_Parent_0;
        if l_l_Parent_0_0 then
            l_l_Parent_0_0:Destroy();
            l_client_0.Variables.ChatEnabled = true;
            l_service_0.StarterGui:SetCoreGuiEnabled("Chat", true);
        end;
    end;
    l_client_0.Handlers.ChatHandler = function(v97, v98, v99) --[[ Line: 571 ]]
        -- upvalues: l_Parent_0 (copy), l_StoredChats_0 (ref), l_Local_1 (copy), l_Local_2 (copy), l_Team_1 (copy), l_Team_2 (copy), l_Admins_1 (copy), l_Admins_2 (copy), l_Cross_1 (copy), l_Cross_2 (copy), l_Global_1 (copy), l_Global_2 (copy), v52 (copy), l_KeepChat_0 (copy), l_service_0 (copy), l_Bubble_0 (copy), l_Routine_0 (copy)
        if not v98 then
            return;
        elseif string.sub(v98, 1, 2) == "/e" then
            return;
        else
            if l_Parent_0 then
                local v100 = nil;
                v100 = if v97 and type(v97) == "userdata" then v97 else {
                    Name = tostring(v97 or "System"), 
                    TeamColor = BrickColor.White()
                };
                if #v98 > 150 then
                    v98 = ("%*..."):format((string.sub(v98, 1, 150)));
                end;
                if v99 then
                    if v99 == "Private" or v99 == "System" then
                        table.insert(l_StoredChats_0, {
                            Color = v100.TeamColor or BrickColor.White(), 
                            Player = v100.Name, 
                            Message = v98, 
                            Mode = "Global", 
                            Private = true
                        });
                        table.insert(l_StoredChats_0, {
                            Color = v100.TeamColor or BrickColor.White(), 
                            Player = v100.Name, 
                            Message = v98, 
                            Mode = "Team", 
                            Private = true
                        });
                        table.insert(l_StoredChats_0, {
                            Color = v100.TeamColor or BrickColor.White(), 
                            Player = v100.Name, 
                            Message = v98, 
                            Mode = "Local", 
                            Private = true
                        });
                        table.insert(l_StoredChats_0, {
                            Color = v100.TeamColor or BrickColor.White(), 
                            Player = v100.Name, 
                            Message = v98, 
                            Mode = "Admins", 
                            Private = true
                        });
                        table.insert(l_StoredChats_0, {
                            Color = v100.TeamColor or BrickColor.White(), 
                            Player = v100.Name, 
                            Message = v98, 
                            Mode = "Cross", 
                            Private = true
                        });
                    else
                        local l_Name_0 = v100.Name;
                        table.insert(l_StoredChats_0, {
                            Color = v100.TeamColor or BrickColor.White(), 
                            Player = l_Name_0, 
                            Message = v98, 
                            Mode = v99
                        });
                    end;
                else
                    local l_Name_1 = v100.Name;
                    table.insert(l_StoredChats_0, {
                        Color = v100.TeamColor or BrickColor.White(), 
                        Player = l_Name_1, 
                        Message = v98, 
                        Mode = "Global"
                    });
                end;
                if v99 == "Local" then
                    if not l_Local_1.Visible then
                        l_Local_2.Text = "Local*";
                    end;
                elseif v99 == "Team" then
                    if not l_Team_1.Visible then
                        l_Team_2.Text = "Team*";
                    end;
                elseif v99 == "Admins" then
                    if not l_Admins_1.Visible then
                        l_Admins_2.Text = "Admins*";
                    end;
                elseif v99 == "Cross" then
                    if not l_Cross_1.Visible then
                        l_Cross_2.Text = "Cross*";
                    end;
                elseif not l_Global_1.Visible then
                    l_Global_2.Text = "Global*";
                end;
                if #l_StoredChats_0 >= 50 then
                    table.remove(l_StoredChats_0, 1);
                end;
                v52();
                if not l_KeepChat_0 and v100 and type(v100) == "userdata" then
                    local l_Head_0 = v100.Character:FindFirstChild("Head");
                    if l_Head_0 then
                        local l_FirstChild_0 = l_service_0.LocalContainer():FindFirstChild((("%*Bubbles"):format(v100.Name)));
                        if not l_FirstChild_0 then
                            l_FirstChild_0 = Instance.new("BillboardGui", l_service_0.LocalContainer());
                            l_FirstChild_0.Name = ("%*Bubbles"):format(v100.Name);
                            l_FirstChild_0.StudsOffset = Vector3.new(0, 2, 0);
                            l_FirstChild_0.SizeOffset = Vector2.new(0, 0.5);
                            l_FirstChild_0.Size = UDim2.new(0, 200, 0, 150);
                        end;
                        l_FirstChild_0.Adornee = l_Head_0;
                        local v105 = l_Bubble_0:Clone();
                        v105.TextLabel.Text = v98;
                        v105.Parent = l_FirstChild_0;
                        local v106 = v105.TextLabel.TextBounds.X + 40;
                        if v106 > 400 then
                            v106 = 400;
                        end;
                        v105.Size = UDim2.new(0, v106, 0, 50);
                        if #l_FirstChild_0:GetChildren() > 3 then
                            l_FirstChild_0:GetChildren()[1]:Destroy();
                        end;
                        for v107, v108 in l_FirstChild_0:GetChildren() do
                            local v109 = v108.TextLabel.TextBounds.X + 40;
                            if v109 > 400 then
                                v109 = 400;
                            end;
                            v108.Position = UDim2.new(0.5, -v109 / 2, 1, -(math.abs(v107 - 1 - #l_FirstChild_0:GetChildren()) * 50));
                        end;
                        local l_CurrentCamera_0 = workspace.CurrentCamera;
                        local l_Character_0 = v100.Character;
                        local l_Head_1 = l_Character_0:FindFirstChild("Head");
                        l_Routine_0(function() --[[ Line: 722 ]]
                            -- upvalues: l_Head_1 (copy), l_CurrentCamera_0 (copy), v105 (copy), l_Character_0 (copy)
                            while l_Head_1 do
                                if (l_Head_1.Position - l_CurrentCamera_0.CFrame.p).Magnitude <= 50 then
                                    v105.Visible = true;
                                else
                                    v105.Visible = false;
                                end;
                                task.wait(0.1);
                                if not v105.Parent or not v105 or not l_Head_1 or not l_Head_1.Parent or not l_Character_0 then
                                    break;
                                end;
                            end;
                        end);
                        task.wait(10);
                        if v105 then
                            v105:Destroy();
                        end;
                    end;
                end;
            end;
            return;
        end;
    end;
    local l_FocusedTextBox_0 = l_service_0.UserInputService:GetFocusedTextBox();
    if l_FocusedTextBox_0 then
        l_FocusedTextBox_0:ReleaseFocus();
    end;
end;