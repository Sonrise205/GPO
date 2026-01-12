local v0 = nil;
local v1 = nil;
local v2 = nil;
local v3 = nil;
client = v0;
Pcall = v1;
Routine = v2;
service = v3;
v0 = function(v4, v5) --[[ Line: 4 ]] --[[ Name: Expand ]]
    v4.MouseLeave:Connect(function(_, _) --[[ Line: 5 ]]
        -- upvalues: v5 (copy)
        v5.Visible = false;
    end);
    v4.MouseMoved:Connect(function(v8, v9) --[[ Line: 9 ]]
        -- upvalues: v5 (copy), v4 (copy)
        v5.Label.Text = v4.Desc.Value;
        v5.Size = UDim2.new(0, 10000, 0, 10000);
        local l_X_0 = v5.Label.TextBounds.X;
        local v11 = math.floor(l_X_0 / 500) + 1;
        if v11 < 1 then
            v11 = 1;
        end;
        local v12 = 500;
        if l_X_0 < 500 then
            v12 = l_X_0;
        end;
        v5.Visible = true;
        v5.Size = UDim2.new(0, v12 + 5, 0, v11 * 20 + 5);
        v5.Position = UDim2.new(0, v8, 0, v9 - 40 - (v11 * 20 + 5));
    end);
end;
return function(v13, v14) --[[ Line: 25 ]]
    -- upvalues: v0 (copy)
    if v14 then
        setfenv(1, v14);
    end;
    local l_gTable_0 = v13.gTable;
    local l_Object_0 = l_gTable_0.Object;
    local l_Drag_0 = l_Object_0.Drag;
    local l_Main_0 = l_Object_0.Drag.Main;
    local l_Close_0 = l_Object_0.Drag.Close;
    local l_Hide_0 = l_Object_0.Drag.Hide;
    local _ = l_Object_0.Drag.Search;
    local l_ClientTab_0 = l_Object_0.Drag.Main.ClientTab;
    local l_ServerTab_0 = l_Object_0.Drag.Main.ServerTab;
    local l_Dragger_0 = l_Object_0.Drag.Main.Dragger;
    local l_Client_0 = l_Object_0.Drag.Main.Client;
    local l_Server_0 = l_Object_0.Drag.Main.Server;
    local l_Title_0 = l_Object_0.Drag.Title;
    local l_Entry_0 = l_Object_0.Entry;
    local l_Desc_0 = l_Object_0.Desc;
    local l_Mouse_0 = service.Players.LocalPlayer:GetMouse();
    local l_X_1 = l_Drag_0.AbsoluteSize.X;
    local l_Y_0 = l_Main_0.AbsoluteSize.Y;
    local v33 = false;
    local l_l_X_1_0 = l_X_1;
    local l_l_Y_0_0 = l_Y_0;
    local v36 = "";
    local function v37() --[[ Line: 53 ]] --[[ Name: openClient ]]
        -- upvalues: l_Server_0 (copy), l_Client_0 (copy), l_ClientTab_0 (copy), l_ServerTab_0 (copy)
        l_Server_0.Visible = false;
        l_Client_0.Visible = true;
        l_ClientTab_0.BackgroundTransparency = 0;
        l_ServerTab_0.BackgroundTransparency = 0.5;
    end;
    local function v38() --[[ Line: 60 ]] --[[ Name: openServer ]]
        -- upvalues: l_Server_0 (copy), l_Client_0 (copy), l_ClientTab_0 (copy), l_ServerTab_0 (copy)
        l_Server_0.Visible = true;
        l_Client_0.Visible = false;
        l_ClientTab_0.BackgroundTransparency = 0.5;
        l_ServerTab_0.BackgroundTransparency = 0;
    end;
    local v39 = nil;
    v39 = function() --[[ Line: 67 ]]
        -- upvalues: l_Client_0 (copy), l_Entry_0 (copy), v39 (ref), v0 (ref), l_Desc_0 (copy)
        local v40 = service.GetTasks();
        l_Client_0:ClearAllChildren();
        local v41 = 0;
        for _, v43 in pairs(v40) do
            local v44 = l_Entry_0:Clone();
            local l_Frame_0 = v44.Frame;
            local v46 = v43:Status();
            v44.Parent = l_Client_0;
            v44.Visible = true;
            v44.Desc.Value = v43.Name;
            v44.Position = UDim2.new(0, 0, 0, v41 * 20);
            l_Frame_0.Text.Text = tostring(v43.Function);
            l_Frame_0.Status.Text = v46;
            if v46 == "suspended" then
                l_Frame_0.Resume.Text = "Resume";
            elseif v46 == "normal" or v46 == "running" then
                l_Frame_0.Resume.Text = "Suspend";
            end;
            l_Frame_0.Resume.MouseButton1Down:Connect(function() --[[ Line: 91 ]]
                -- upvalues: l_Frame_0 (copy), v43 (copy), v39 (ref)
                if l_Frame_0.Resume.Text == "Resume" and v43:Status() == "Suspended" then
                    v43:Resume();
                else
                    v43:Pause();
                end;
                wait(0.5);
                v39();
            end);
            l_Frame_0.Kill.MouseButton1Down:Connect(function() --[[ Line: 101 ]]
                -- upvalues: v43 (copy), v39 (ref)
                v43:Kill();
                wait(0.5);
                v39();
            end);
            l_Frame_0.Stop.MouseButton1Down:Connect(function() --[[ Line: 107 ]]
                -- upvalues: v43 (copy), v39 (ref)
                v43:Stop();
                wait(0.5);
                v39();
            end);
            v0(v44, l_Desc_0);
            v41 = v41 + 1;
        end;
        l_Client_0.CanvasSize = UDim2.new(0, 0, 0, 0);
    end;
    l_ServerTab_0.MouseButton1Down:Connect(v38);
    l_ClientTab_0.MouseButton1Down:Connect(v37);
    l_Close_0.MouseButton1Click:Connect(function() --[[ Line: 123 ]]
        -- upvalues: l_Drag_0 (copy), l_gTable_0 (copy)
        l_Drag_0.Draggable = false;
        l_Drag_0:TweenPosition(UDim2.new(l_Drag_0.Position.X.Scale, l_Drag_0.Position.X.Offset, 1, 0), "Out", "Sine", 0.5, true);
        wait(0.5);
        l_gTable_0:Destroy();
    end);
    l_Drag_0.BackgroundColor3 = l_Main_0.BackgroundColor3;
    l_Hide_0.MouseButton1Click:Connect(function() --[[ Line: 132 ]]
        -- upvalues: l_Main_0 (copy), l_Drag_0 (copy), l_Hide_0 (copy)
        if l_Main_0.Visible then
            l_Main_0.Visible = false;
            l_Drag_0.BackgroundTransparency = l_Main_0.BackgroundTransparency;
            l_Hide_0.Text = "+";
            return;
        else
            l_Main_0.Visible = true;
            l_Drag_0.BackgroundTransparency = 1;
            l_Hide_0.Text = "-";
            return;
        end;
    end);
    l_Mouse_0.Move:Connect(function(_, _) --[[ Line: 144 ]]
        -- upvalues: v33 (ref), l_X_1 (ref), l_l_X_1_0 (ref), l_Dragger_0 (copy), l_Y_0 (ref), l_l_Y_0_0 (ref), l_Drag_0 (copy), l_Main_0 (copy), v36 (ref), l_Title_0 (copy)
        if v33 then
            l_X_1 = l_l_X_1_0 + (l_Dragger_0.Position.X.Offset + 20);
            l_Y_0 = l_l_Y_0_0 + (l_Dragger_0.Position.Y.Offset + 20);
            if l_X_1 < 200 then
                l_X_1 = 200;
            end;
            if l_Y_0 < 200 then
                l_Y_0 = 200;
            end;
            l_Drag_0.Size = UDim2.new(0, l_X_1, 0, 30);
            l_Main_0.Size = UDim2.new(1, 0, 0, l_Y_0);
            if l_X_1 < 220 then
                if v36 == "" then
                    v36 = l_Title_0.Text;
                end;
                l_Title_0.Text = "";
                return;
            elseif v36 ~= "" then
                l_Title_0.Text = v36;
                v36 = "";
            end;
        end;
    end);
    l_Dragger_0.DragBegin:Connect(function(_) --[[ Line: 166 ]]
        -- upvalues: v33 (ref)
        v33 = true;
    end);
    l_Dragger_0.DragStopped:Connect(function(_, _) --[[ Line: 170 ]]
        -- upvalues: v33 (ref), l_l_X_1_0 (ref), l_X_1 (ref), l_l_Y_0_0 (ref), l_Y_0 (ref), l_Dragger_0 (copy)
        v33 = false;
        l_l_X_1_0 = l_X_1;
        l_l_Y_0_0 = l_Y_0;
        l_Dragger_0.Position = UDim2.new(1, -20, 1, -20);
    end);
    l_gTable_0:Ready();
    while wait(1) do
        v39();
    end;
end;