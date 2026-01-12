local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_PlayerGui_0 = l_LocalPlayer_0:WaitForChild("PlayerGui");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local _ = l_Modules_0.Shared;
local v7 = require(l_Modules_0.Client.Notification);
local l_Events_0 = l_ReplicatedStorage_0:WaitForChild("Events");
local v9 = {
    Initialized = false
};
v9.Initialize = function(v10) --[[ Line: 18 ]] --[[ Name: Initialize ]]
    -- upvalues: v9 (copy), l_Events_0 (copy), l_PlayerGui_0 (copy), l_LocalPlayer_0 (copy), l_ReplicatedStorage_0 (copy), l_Players_0 (copy), v7 (copy), l_UserInputService_0 (copy)
    if v9.Initialized then
        return;
    else
        local l_PartySystem_0 = l_Events_0:WaitForChild("PartySystem");
        local _ = v10:GetStatsFolder();
        local v13 = l_PlayerGui_0:WaitForChild("Party", 360);
        local l_Main_0 = v13:WaitForChild("Main");
        local l_Input_0 = l_Main_0:WaitForChild("User"):WaitForChild("Input");
        local l_Invite_0 = l_Main_0:WaitForChild("Invite");
        local l_Kick_0 = l_Main_0:WaitForChild("Kick");
        local l_Leave_0 = l_Main_0:WaitForChild("Leave");
        local l_Find_0 = l_Main_0:WaitForChild("Find");
        local l_Announcement_0 = l_Main_0:WaitForChild("Announcement");
        local l_Party_0 = l_LocalPlayer_0:WaitForChild("Party");
        local l_tradingHUB_0 = l_ReplicatedStorage_0:FindFirstChild("tradingHUB");
        local l_reservedCode_0 = l_ReplicatedStorage_0:WaitForChild("reservedCode");
        if l_tradingHUB_0 then
            v13.Enabled = false;
            return;
        else
            local function v24() --[[ Line: 48 ]] --[[ Name: PartyObjectUpdated ]]
                -- upvalues: l_Kick_0 (copy), l_Party_0 (copy), l_LocalPlayer_0 (ref), l_Leave_0 (copy)
                l_Kick_0.Visible = l_Party_0.Value == l_LocalPlayer_0;
                l_Leave_0.Visible = l_Party_0.Value ~= nil;
            end;
            l_Kick_0.Visible = l_Party_0.Value == l_LocalPlayer_0;
            l_Leave_0.Visible = l_Party_0.Value ~= nil;
            l_Party_0:GetPropertyChangedSignal("Value"):Connect(v24);
            local function v29(v25) --[[ Line: 57 ]] --[[ Name: GetPlayerNameFromText ]]
                -- upvalues: l_Players_0 (ref), l_LocalPlayer_0 (ref)
                local l_l_Players_0_FirstChild_0 = l_Players_0:FindFirstChild(v25);
                if l_l_Players_0_FirstChild_0 and l_l_Players_0_FirstChild_0 ~= l_LocalPlayer_0 then
                    return l_l_Players_0_FirstChild_0.Name;
                else
                    for _, v28 in ipairs(l_Players_0:GetPlayers()) do
                        if v28 ~= l_LocalPlayer_0 and v28.Name:lower():sub(1, v25:len()) == v25:lower() then
                            return v28.Name;
                        end;
                    end;
                    return nil;
                end;
            end;
            local v30 = "";
            local v31 = nil;
            local v32 = nil;
            local function v34(v33) --[[ Line: 78 ]] --[[ Name: UpdateAnnouncement ]]
                -- upvalues: v32 (ref), l_Announcement_0 (copy)
                if v32 ~= nil and coroutine.status(v32) ~= "dead" then
                    task.cancel(v32);
                    v32 = nil;
                end;
                v32 = task.spawn(function() --[[ Line: 85 ]]
                    -- upvalues: l_Announcement_0 (ref), v33 (copy)
                    l_Announcement_0.Text = v33;
                    task.wait(0.2);
                    l_Announcement_0.Text = "";
                end);
            end;
            l_Input_0:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 92 ]]
                -- upvalues: l_Input_0 (copy), v30 (ref), l_Find_0 (copy), v31 (ref), v29 (copy)
                local l_Text_0 = l_Input_0.Text;
                if l_Text_0 == "" or l_Text_0 == v30 then
                    l_Find_0.Text = "";
                    return;
                else
                    v31 = nil;
                    local v36 = v29(l_Text_0);
                    if v36 == nil then
                        l_Find_0.Text = "Searching...";
                        return;
                    else
                        v31 = v36;
                        l_Find_0.Text = "Found: " .. v36;
                        l_Input_0.Text = v36:sub(1, l_Text_0:len());
                        v30 = v36;
                        return;
                    end;
                end;
            end);
            l_Input_0.FocusLost:Connect(function(_) --[[ Line: 114 ]]
                -- upvalues: v31 (ref), l_Input_0 (copy)
                if v31 then
                    l_Input_0.Text = v31;
                end;
            end);
            l_Players_0.PlayerRemoving:Connect(function(v38) --[[ Line: 120 ]]
                -- upvalues: v31 (ref), l_Input_0 (copy)
                if v38.Name == v31 then
                    l_Input_0.Text = "";
                    v31 = nil;
                end;
            end);
            l_Leave_0.MouseButton1Click:Connect(function() --[[ Line: 127 ]]
                -- upvalues: v10 (copy), l_PartySystem_0 (copy)
                v10.UIUtils.ButtonEffect();
                l_PartySystem_0:FireServer({
                    action = "leave"
                });
            end);
            l_Kick_0.MouseButton1Click:Connect(function() --[[ Line: 132 ]]
                -- upvalues: v10 (copy), v31 (ref), l_PartySystem_0 (copy), l_Players_0 (ref), v34 (copy)
                v10.UIUtils.ButtonEffect();
                if v31 then
                    l_PartySystem_0:FireServer({
                        action = "kick", 
                        ply = l_Players_0:FindFirstChild(v31)
                    });
                    return;
                else
                    v34("Player not found");
                    return;
                end;
            end);
            l_Invite_0.MouseButton1Click:Connect(function() --[[ Line: 141 ]]
                -- upvalues: v10 (copy), v31 (ref), l_PartySystem_0 (copy), l_Players_0 (ref), v34 (copy)
                v10.UIUtils.ButtonEffect();
                if v31 then
                    l_PartySystem_0:FireServer({
                        action = "invite", 
                        ply = l_Players_0:FindFirstChild(v31)
                    });
                    return;
                else
                    v34("Player not found");
                    return;
                end;
            end);
            local v39 = false;
            local v40 = "Close";
            local l_Size_0 = l_Main_0.Size;
            l_Main_0.Size = UDim2.new(0, 0, 0, 0);
            l_Main_0.Visible = false;
            local v42 = {
                Open = function() --[[ Line: 159 ]] --[[ Name: Open ]]
                    -- upvalues: l_Main_0 (copy), l_Size_0 (copy)
                    l_Main_0.Visible = true;
                    l_Main_0.Size = UDim2.new(l_Size_0.X.Scale / 2, 0, l_Size_0.Y.Scale / 2, 0);
                    l_Main_0:TweenSize(l_Size_0, "Out", "Quad", 0.25, true);
                end, 
                Close = function() --[[ Line: 165 ]] --[[ Name: Close ]]
                    -- upvalues: l_Main_0 (copy)
                    l_Main_0:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Quad", 0.25, true);
                    task.wait(0.25);
                    l_Main_0.Visible = false;
                end
            };
            v9.SetFrameState = function() --[[ Line: 173 ]] --[[ Name: SetFrameState ]]
                -- upvalues: l_reservedCode_0 (copy), v7 (ref), l_tradingHUB_0 (copy), v39 (ref), v40 (ref), v42 (copy)
                if l_reservedCode_0.Value == "arena" then
                    v7.DisplayMessage("Party ui disabled in this place!");
                    return;
                elseif l_tradingHUB_0 then
                    v7.DisplayMessage("Party ui disabled in this place!");
                    return;
                elseif v39 == true then
                    return;
                else
                    v39 = true;
                    v40 = v40 == "Close" and "Open" or "Close";
                    local v43 = v42[v40];
                    if v43 then
                        v43();
                    end;
                    v39 = false;
                    return;
                end;
            end;
            local function v50(v44) --[[ Line: 203 ]] --[[ Name: IsClickPositionValid ]]
                -- upvalues: v39 (ref), l_Main_0 (copy), l_reservedCode_0 (copy), v7 (ref), l_tradingHUB_0 (copy), v40 (ref), v42 (copy)
                if v39 == false then
                    local l_l_Main_0_0 = l_Main_0;
                    local l_Position_0 = v44.Position;
                    local l_AbsoluteSize_0 = l_l_Main_0_0.AbsoluteSize;
                    local l_AbsolutePosition_0 = l_l_Main_0_0.AbsolutePosition;
                    if l_Position_0.X > l_AbsolutePosition_0.X and l_Position_0.X < l_AbsolutePosition_0.X + l_AbsoluteSize_0.X and l_Position_0.Y > l_AbsolutePosition_0.Y and l_Position_0.Y < l_AbsolutePosition_0.Y + l_AbsoluteSize_0.Y then
                        return;
                    elseif l_reservedCode_0.Value == "arena" then
                        v7.DisplayMessage("Party ui disabled in this place!");
                        return;
                    elseif l_tradingHUB_0 then
                        v7.DisplayMessage("Party ui disabled in this place!");
                        return;
                    elseif v39 == true then
                        return;
                    else
                        v39 = true;
                        v40 = v40 == "Close" and "Open" or "Close";
                        local v49 = v42[v40];
                        if v49 then
                            v49();
                        end;
                        v39 = false;
                    end;
                end;
            end;
            local v51 = {
                [Enum.UserInputType.MouseButton1] = v50, 
                [Enum.UserInputType.Touch] = v50
            };
            local v52 = nil;
            l_Main_0:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 227 ]]
                -- upvalues: v52 (ref), l_Main_0 (copy), l_UserInputService_0 (ref), v51 (copy)
                if v52 then
                    v52:Disconnect();
                    v52 = nil;
                end;
                if l_Main_0.Visible == true and v52 == nil then
                    v52 = l_UserInputService_0.InputBegan:Connect(function(v53, v54) --[[ Line: 235 ]]
                        -- upvalues: v51 (ref)
                        if v54 then
                            return;
                        else
                            local l_UserInputType_0 = v53.UserInputType;
                            if v51[l_UserInputType_0] then
                                v51[l_UserInputType_0](v53);
                            end;
                            return;
                        end;
                    end);
                end;
            end);
            v9.Initialized = true;
            return;
        end;
    end;
end;
return v9;