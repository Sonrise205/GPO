client = nil;
Pcall = nil;
Routine = nil;
service = nil;
gTable = nil;
return function(_, v1) --[[ Line: 9 ]]
    if v1 then
        setfenv(1, v1);
    end;
    local _ = service.PlayerGui;
    local l_LocalPlayer_0 = service.Players.LocalPlayer;
    client.Variables.PlayerListEnabled = false;
    service.StarterGui:SetCoreGuiEnabled("PlayerList", false);
    local l_Parent_0 = script.Parent.Parent;
    local l_Drag_0 = l_Parent_0.Drag;
    local l_Frame_0 = l_Parent_0.Drag.Frame;
    local l_Dragger_0 = l_Parent_0.Drag.Frame.Dragger;
    local l_List_0 = l_Parent_0.Drag.Frame.List;
    local l_Entry_0 = l_Parent_0.Entry;
    local l_FakeDragger_0 = l_Parent_0.Drag.Frame.FakeDragger;
    local v11 = nil;
    gTable:Ready();
    local v12 = {
        ["1237666"] = 355277187, 
        ["39958537"] = 116524268, 
        ["66136675"] = 355858707, 
        ["102761590"] = 355858707, 
        ["6087802"] = 355858707, 
        ["33869774"] = 355858707, 
        ["60557514"] = 355858707, 
        ["28606349"] = 99727663, 
        ["64362264"] = 48094325, 
        ["39259729"] = 356709818, 
        ["68591528"] = 397876352
    };
    local l_Mouse_0 = service.Players.LocalPlayer:GetMouse();
    local l_X_0 = l_Drag_0.AbsoluteSize.X;
    local l_Y_0 = l_Frame_0.AbsoluteSize.Y;
    local v16 = nil;
    local l_l_X_0_0 = l_X_0;
    local l_l_Y_0_0 = l_Y_0;
    local l_Offset_0 = l_Drag_0.Position.X.Offset;
    local v20 = false;
    local v21 = false;
    local function v23() --[[ Line: 52 ]] --[[ Name: checkStats ]]
        -- upvalues: l_LocalPlayer_0 (copy), v21 (ref), l_X_0 (ref), l_l_X_0_0 (ref), l_Drag_0 (copy)
        local l_leaderstats_0 = l_LocalPlayer_0:FindFirstChild("leaderstats");
        if l_leaderstats_0 and not v21 then
            l_X_0 = (#l_leaderstats_0:GetChildren() - 1) * 70 + 210;
            l_l_X_0_0 = l_X_0;
            l_Drag_0.Size = UDim2.new(0, l_X_0, 0, 30);
            l_Drag_0.Position = UDim2.new(1, -l_X_0, 0, 0);
        end;
        if l_leaderstats_0 then
            return true;
        else
            return false;
        end;
    end;
    local function v24() --[[ Line: 68 ]] --[[ Name: fadeIn ]]
        -- upvalues: l_Frame_0 (copy), l_List_0 (copy), l_FakeDragger_0 (copy)
        l_Frame_0.BackgroundTransparency = 0;
        l_List_0.BackgroundTransparency = 0;
        l_FakeDragger_0.Visible = true;
    end;
    local function v25() --[[ Line: 74 ]] --[[ Name: fadeOut ]]
        -- upvalues: l_Frame_0 (copy), l_List_0 (copy), l_FakeDragger_0 (copy)
        l_Frame_0.BackgroundTransparency = 0.7;
        l_List_0.BackgroundTransparency = 1;
        l_FakeDragger_0.Visible = false;
    end;
    local function v71() --[[ Line: 80 ]] --[[ Name: populate ]]
        -- upvalues: l_List_0 (copy), v23 (copy), v11 (ref), l_Entry_0 (copy), l_LocalPlayer_0 (copy), l_Drag_0 (copy), v12 (copy), v21 (ref), l_Y_0 (ref), l_l_Y_0_0 (ref), l_Frame_0 (copy), l_X_0 (ref)
        l_List_0:ClearAllChildren();
        v23();
        local v26 = {
            Neutral = {
                Color = BrickColor.White(), 
                Players = {}, 
                Stats = {}, 
                StatNames = {}
            }
        };
        local v27 = 0;
        local v28 = 0;
        local v29 = {};
        local v30 = {};
        for _, v32 in service.Teams:GetChildren() do
            v26[v32.Name] = {
                Color = v32.TeamColor, 
                Players = {}, 
                Stats = {}, 
                StatNames = {}
            };
        end;
        for _, v34 in service.Players:GetPlayers() do
            local v35 = false;
            local v36 = nil;
            if not v34.Neutral then
                for _, v38 in v26 do
                    if v38.Color == v34.TeamColor then
                        v35 = true;
                        v36 = v38;
                        table.insert(v38.Players, v34);
                    end;
                end;
            end;
            if not v35 then
                v36 = v26.Neutral;
                table.insert(v26.Neutral.Players, v34);
            end;
            local l_leaderstats_1 = v34:FindFirstChild("leaderstats");
            if l_leaderstats_1 then
                for _, v41 in l_leaderstats_1:GetChildren() do
                    if v36.Stats[v41.Name] and tonumber(v36.Stats[v41.Name]) and v41:IsA("IntValue") and tonumber(v41.Value) then
                        v36.Stats[v41.Name] = v36.Stats[v41.Name] + tonumber(v41.Value);
                    elseif not v36.Stats[v41.Name] and v41:IsA("IntValue") then
                        table.insert(v36.Stats, v41.Value);
                        v36.Stats[v41.Name] = v41.Value;
                    else
                        v36.Stats[v41.Name] = "";
                    end;
                    table.insert(v36.StatNames, v41.Name);
                    if not v30[v41.Name] then
                        table.insert(v29, v41.Name);
                        v30[v41.Name] = true;
                    end;
                end;
            end;
            v27 = v27 + 1;
        end;
        if v11 then
            v11:Destroy();
        end;
        v11 = l_Entry_0:Clone();
        v11.Visible = true;
        v11.Position = UDim2.new(0, 0, 0, 0);
        local l_Nameb_0 = v11:FindFirstChild("Nameb");
        if l_Nameb_0 then
            l_Nameb_0.Text = l_LocalPlayer_0.Name;
        end;
        local l_ImageLabel_0 = v11:FindFirstChild("ImageLabel");
        if l_ImageLabel_0 then
            l_ImageLabel_0.Visible = false;
        end;
        local l_Stats_0 = v11:FindFirstChild("Stats");
        if l_Stats_0 then
            l_Stats_0.Visible = true;
            local l_Stat_0 = v11.Stat;
            for v46, v47 in v29 do
                local v48 = l_Stat_0:Clone();
                v48.Visible = true;
                v48.Parent = l_Stats_0;
                v48.Text = v47;
                v48.Position = UDim2.new(0, (v46 - 1) * 70, 0, 0);
            end;
        end;
        v11.Parent = l_Drag_0;
        if #v26.Neutral.Players == 0 then
            v26.Neutral = nil;
        end;
        for v49, v50 in v26 do
            if #v26 > 1 then
                local v51 = l_Entry_0:Clone();
                v51.Visible = true;
                v51.Position = UDim2.new(0, 0, 0, v28 * 25);
                v51.Nameb.Text = v49;
                v51.BackgroundTransparency = 0.5;
                v51.BackgroundColor3 = v50.Color.Color;
                v51.ImageLabel.Visible = false;
                v51.Parent = l_List_0;
                if string.len(v49) > 15 then
                    v51.Nameb.TextScaled = true;
                end;
                if #v50.StatNames > 0 then
                    v51.Stats.Visible = true;
                    v51.Stats.Size = UDim2.new(0, (#v50.Stats - 1) * 70, 1, 0);
                    local l_Stat_1 = v51.Stat;
                    for _, v54 in v50.StatNames do
                        local v55 = l_Stat_1:Clone();
                        v55.Parent = v51.Stats;
                        v55.Visible = true;
                        local v56 = v50.Stats[v54];
                        if v56 and type(v56) == "number" then
                            v55.Text = v56;
                        else
                            v55.Text = "";
                        end;
                        v55.Position = UDim2.new(0, (#v51.Stats:GetChildren() - 1) * 70, 0, 0);
                    end;
                else
                    v51.Stats.Visible = false;
                end;
                v28 = v28 + 1;
            end;
            for _, v58 in v50.Players do
                local v59 = l_Entry_0:Clone();
                v59.Visible = true;
                v59.Position = UDim2.new(0, 0, 0, v28 * 25);
                local l_ImageLabel_1 = v59:FindFirstChild("ImageLabel");
                local l_Stats_1 = v59:FindFirstChild("Stats");
                local l_Nameb_1 = v59:FindFirstChild("Nameb");
                local l_Stat_2 = v59:FindFirstChild("Stat");
                if l_Nameb_1 then
                    l_Nameb_1.Text = v58.Name;
                end;
                v59.Parent = l_List_0;
                if string.len(v58.Name) > 15 then
                    l_Nameb_1.TextScaled = true;
                end;
                local v64 = v12[tostring(v58.UserId)];
                if l_ImageLabel_1 then
                    if v64 then
                        l_ImageLabel_1.Image = ("http://www.roblox.com/asset/?id=%*"):format(v64);
                        l_ImageLabel_1.Visible = true;
                    elseif v58.UserId == game.CreatorId then
                        l_ImageLabel_1.Image = "rbxasset://textures/ui/icon_placeowner.png";
                        l_ImageLabel_1.Visible = true;
                    elseif v58:IsInGroup(1200769) then
                        l_ImageLabel_1.Image = "http://www.roblox.com/asset/?id=99727663";
                        l_ImageLabel_1.Visible = true;
                    elseif l_LocalPlayer_0:IsFriendsWith(v58.UserId) and v58 ~= l_LocalPlayer_0 then
                        l_ImageLabel_1.Image = "http://www.roblox.com/asset/?id=99749771";
                        l_ImageLabel_1.Visible = true;
                    elseif v58.MembershipType == Enum.MembershipType.BuildersClub then
                        l_ImageLabel_1.Image = "rbxasset://textures/ui/TinyBcIcon.png";
                        l_ImageLabel_1.Visible = true;
                    elseif v58.MembershipType == Enum.MembershipType.TurboBuildersClub then
                        l_ImageLabel_1.Image = "rbxasset://textures/ui/TinyTbcIcon.png";
                        l_ImageLabel_1.Visible = true;
                    elseif v58.MembershipType == Enum.MembershipType.OutrageousBuildersClub then
                        l_ImageLabel_1.Image = "rbxasset://textures/ui/TinyObcIcon.png";
                        l_ImageLabel_1.Visible = true;
                    else
                        l_ImageLabel_1.Visible = false;
                    end;
                end;
                local l_leaderstats_2 = v58:FindFirstChild("leaderstats");
                if l_leaderstats_2 and l_Stats_1 and l_Stat_2 then
                    l_leaderstats_2 = l_leaderstats_2:GetChildren();
                    l_Stats_1.Visible = true;
                    for _, v67 in l_leaderstats_2 do
                        local v68 = l_Stat_2:Clone();
                        v68.Visible = true;
                        v68.Parent = l_Stats_1;
                        v68.Text = v67.Value;
                        v68.Position = UDim2.new(0, (#l_Stats_1:GetChildren() - 1) * 70, 0, 0);
                    end;
                elseif l_Stats_1 then
                    l_Stats_1.Visible = false;
                end;
                v28 = v28 + 1;
            end;
        end;
        if not v21 then
            local l_v28_0 = v28;
            if l_v28_0 > 10 then
                l_v28_0 = 10;
            end;
            local v70 = l_v28_0 * 25 + 30;
            l_Y_0 = v70;
            l_l_Y_0_0 = v70;
            l_Frame_0.Size = UDim2.new(0, l_X_0, 0, v70);
        end;
        l_List_0.CanvasSize = UDim2.new(0, 0, 0, v28 * 20);
    end;
    l_Drag_0.Position = UDim2.new(1, -l_X_0, 0, 0);
    v25();
    l_Frame_0.MouseEnter:Connect(function() --[[ Line: 297 ]]
        -- upvalues: v24 (copy)
        v24();
    end);
    l_Frame_0.MouseLeave:Connect(function() --[[ Line: 301 ]]
        -- upvalues: v25 (copy)
        v25();
    end);
    service.UserInputService.InputBegan:Connect(function(v72) --[[ Line: 305 ]]
        -- upvalues: l_Drag_0 (copy)
        if not service.UserInputService:GetFocusedTextBox() and v72.UserInputType == Enum.UserInputType.Keyboard and v72.KeyCode == Enum.KeyCode.Tab then
            if l_Drag_0.Visible then
                l_Drag_0.Visible = false;
                return;
            else
                l_Drag_0.Visible = true;
            end;
        end;
    end);
    l_Mouse_0.Move:Connect(function(_, _) --[[ Line: 316 ]]
        -- upvalues: v20 (ref), v16 (ref), l_Offset_0 (ref), l_Dragger_0 (copy), l_X_0 (ref), l_l_X_0_0 (ref), l_Y_0 (ref), l_l_Y_0_0 (ref), l_Frame_0 (copy), l_Drag_0 (copy)
        if v20 then
            v16 = l_Offset_0 + l_Dragger_0.Position.X.Offset;
            l_X_0 = l_l_X_0_0 - l_Dragger_0.Position.X.Offset;
            l_Y_0 = l_l_Y_0_0 + (l_Dragger_0.Position.Y.Offset + 20);
            if l_X_0 < 100 then
                l_X_0 = 100;
            end;
            if l_Y_0 < 50 then
                l_Y_0 = 50;
            end;
            l_Frame_0.Size = UDim2.new(1, 0, 0, l_Y_0);
            l_Drag_0.Size = UDim2.new(0, l_X_0, 0, 30);
            if l_X_0 > 100 then
                l_Drag_0.Position = UDim2.new(l_Drag_0.Position.X.Scale, v16, l_Drag_0.Position.Y.Scale, l_Drag_0.Position.Y.Offset);
            end;
        end;
    end);
    l_Dragger_0.DragBegin:Connect(function(_) --[[ Line: 339 ]]
        -- upvalues: l_Offset_0 (ref), l_Drag_0 (copy), v20 (ref), v21 (ref)
        l_Offset_0 = l_Drag_0.Position.X.Offset;
        v20 = true;
        v21 = true;
    end);
    l_Dragger_0.DragStopped:Connect(function(_, _) --[[ Line: 345 ]]
        -- upvalues: v20 (ref), l_X_0 (ref), l_Y_0 (ref), v16 (ref), l_Drag_0 (copy), l_Frame_0 (copy), l_l_X_0_0 (ref), l_l_Y_0_0 (ref), l_Offset_0 (ref), l_Dragger_0 (copy)
        v20 = false;
        local l_X_1 = l_Drag_0.AbsoluteSize.X;
        local l_Y_1 = l_Frame_0.AbsoluteSize.Y;
        local v80 = nil;
        l_X_0 = l_X_1;
        l_Y_0 = l_Y_1;
        v16 = v80;
        l_X_1 = l_X_0;
        l_Y_1 = l_Y_0;
        v80 = l_Drag_0.Position.X.Offset;
        l_l_X_0_0 = l_X_1;
        l_l_Y_0_0 = l_Y_1;
        l_Offset_0 = v80;
        l_Dragger_0.Position = UDim2.new(0, 0, 1, -20);
    end);
    while wait(0.5) do
        v71();
    end;
end;