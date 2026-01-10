local l_select_0 = select;
local function v6(v1, v2, ...)
    local v3, v4 = {
        ...
    }, l_select_0("#", ...);
    for v5 = v2, v2 + v4 - 1 do
        v1[v5] = v3[v5 - v2 + 1];
    end;
end;
local v7 = nil;
local v8 = nil;
local v9 = nil;
client = v7;
service = v8;
Routine = v9;
v7 = function(v10) --[[ Line: 3 ]] --[[ Name: boolToStr ]]
    if v10 then
        return "Yes";
    else
        return "No";
    end;
end;
return function(v11, v12) --[[ Line: 7 ]]
    -- upvalues: v7 (copy)
    if v12 then
        setfenv(1, v12);
    end;
    local l_client_0 = client;
    local l_Service_0 = l_client_0.Service;
    local l_Routine_0 = Routine;
    local l_Target_0 = v11.Target;
    local v17 = l_client_0.UI.Make("Window", {
        Name = ("Profile_%*"):format(l_Target_0.UserId), 
        Title = ("Profile (@%*)"):format(l_Target_0.Name), 
        Icon = l_client_0.MatIcons["Account circle"], 
        Size = {
            400, 
            400
        }, 
        AllowMultiple = false
    });
    local v18 = v17:Add("TabFrame", {
        Size = UDim2.new(1, -10, 1, -10), 
        Position = UDim2.new(0, 5, 0, 5)
    });
    local v19 = v18:NewTab("General", {
        Text = "General"
    });
    local v20 = v18:NewTab("Friends", {
        Text = "Friends"
    });
    local v21 = v18:NewTab("Groups", {
        Text = "Groups"
    });
    local v22 = v18:NewTab("Game", {
        Text = "Game"
    });
    local v23 = l_Target_0:IsFriendsWith(l_Service_0.Players.LocalPlayer.UserId);
    if l_Target_0 ~= l_Service_0.Players.LocalPlayer then
        v17:AddTitleButton({
            Text = "", 
            ToolTip = v23 and "Unfriend" or "Add friend", 
            OnClick = v23 and function() --[[ Line: 53 ]]
                -- upvalues: l_Service_0 (copy), l_Target_0 (copy)
                l_Service_0.StarterGui:SetCore("PromptUnfriend", l_Target_0);
            end or function() --[[ Line: 56 ]]
                -- upvalues: l_Service_0 (copy), l_Target_0 (copy)
                l_Service_0.StarterGui:SetCore("PromptSendFriendRequest", l_Target_0);
            end
        }):Add("ImageLabel", {
            Size = UDim2.new(0, 20, 0, 20), 
            Position = UDim2.new(0, 5, 0, 0), 
            Image = v23 and l_client_0.MatIcons["Person remove"] or l_client_0.MatIcons["Person add"], 
            BackgroundTransparency = 1
        });
    end;
    v17:AddTitleButton({
        Text = "", 
        ToolTip = "View avatar", 
        OnClick = function() --[[ Line: 69 ]] --[[ Name: OnClick ]]
            -- upvalues: l_Service_0 (copy), l_Target_0 (copy)
            l_Service_0.GuiService:InspectPlayerFromUserId(l_Target_0.UserId);
        end
    }):Add("ImageLabel", {
        Size = UDim2.new(0, 18, 0, 18), 
        Position = UDim2.new(0, 6, 0, 1), 
        Image = l_client_0.MatIcons["Person search"], 
        BackgroundTransparency = 1
    });
    v19:Add("ImageLabel", {
        Size = UDim2.new(0, 120, 0, 120), 
        Position = UDim2.new(0, 5, 0, 5), 
        Image = l_Service_0.Players:GetUserThumbnailAsync(l_Target_0.UserId, Enum.ThumbnailType.AvatarBust, Enum.ThumbnailSize.Size150x150)
    });
    for v24, v25 in ipairs({
        {
            "Display Name", 
            l_Target_0.DisplayName, 
            "The player's custom display name"
        }, 
        {
            "Username", 
            l_Target_0.Name, 
            "The player's unique Roblox username"
        }, 
        {
            "User ID", 
            l_Target_0.UserId, 
            "The player's unique Roblox user ID"
        }, 
        {
            "Acc. Age", 
            ("%* days (%* years)"):format(l_Target_0.AccountAge, (string.format("%.2f", l_Target_0.AccountAge / 365))), 
            "How long the player has been registered on Roblox"
        }
    }) do
        v19:Add("TextLabel", {
            Text = ("  %*: "):format(v25[1]), 
            ToolTip = v25[3], 
            BackgroundTransparency = v24 % 2 == 0 and 0 or 0.2, 
            Size = UDim2.new(1, -135, 0, 30), 
            Position = UDim2.new(0, 130, 0, 30 * (v24 - 1) + 5), 
            TextXAlignment = "Left"
        }):Add("TextLabel", {
            Text = v25[2], 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 120, 1, 0), 
            Position = UDim2.new(1, -130, 0, 0), 
            TextXAlignment = "Right"
        });
    end;
    for v26, v27 in ipairs({
        {
            "Membership", 
            l_Target_0.MembershipType.Name, 
            "The player's Roblox membership type (Premium)"
        }, 
        {
            "Can Chat", 
            v11.CanChatGet[1] and v7(v11.CanChatGet[2]) or "[Error]", 
            "Does the player's account settings allow them to chat?"
        }, 
        {
            "Safe Chat Enabled", 
            v11.SafeChat, 
            "[Admins Only] Does the player have safe chat applied?"
        }, 
        {
            "Mail Verified", 
            v11.MailVerified, 
            "[Admins Only] Does the player have verified their mail?"
        }, 
        {
            "Phone/ID Verified", 
            v11.IDVerified, 
            "[Admins Only] Does the player have verified their non-VoIP phone / ID?"
        }
    }) do
        v19:Add("TextLabel", {
            Text = ("  %*: "):format(v27[1]), 
            ToolTip = v27[3], 
            BackgroundTransparency = v26 % 2 == 0 and 0 or 0.2, 
            Size = UDim2.new(1, -10, 0, 30), 
            Position = UDim2.new(0, 5, 0, 30 * (v26 - 1) + 130), 
            TextXAlignment = "Left"
        }):Add("TextLabel", {
            Text = v27[2], 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 120, 1, 0), 
            Position = UDim2.new(1, -130, 0, 0), 
            TextXAlignment = "Right"
        });
    end;
    local v28 = 0;
    local l_ipairs_0 = ipairs;
    local v30 = {};
    local v31 = {
        v11.IsServerOwner, 
        "Private Server Owner", 
        l_client_0.MatIcons.Grade, 
        "User owns the current private server"
    };
    local v32 = {
        v11.IsDonor, 
        "Adonis Donor", 
        "rbxassetid://6877822142", 
        "User has purchased the Adonis donation pass/shirt"
    };
    local v33 = {
        l_Target_0:GetRankInGroup(886423) == 10, 
        "Adonis Open-Source Contributor", 
        "rbxassetid://6878433601", 
        "User has contributed to the Adonis admin system (see credit list)"
    };
    local v34 = {
        l_Target_0:GetRankInGroup(886423) >= 12, 
        "Adonis Developer", 
        "rbxassetid://6878433601", 
        "User is an official developer of the Adonis admin system (see credit list)"
    };
    local v35 = {};
    local v36 = true;
    if l_Target_0.UserId ~= 1237666 then
        v36 = l_Target_0.UserId == 698712377;
    end;
    local v37 = "Adonis Creator [Sceleratis/Davey_Bones]";
    local v38 = "rbxassetid://6878433601";
    local v39 = "You're looking at the creator of the Adonis admin system!";
    v6(v35, 1, v36, v37, v38, v39);
    v36 = {
        l_Target_0:IsInGroup(1200769) or l_Target_0:IsInGroup(2868472), 
        "Roblox Staff", 
        "rbxassetid://6811962259", 
        "User is an official Roblox employee (!)"
    };
    v37 = {
        l_Target_0:IsInGroup(3514227), 
        "DevForum Member", 
        "rbxassetid://6383940476", 
        "User is a member of the Roblox Developer Forum"
    };
    v6(v30, 1, v31, v32, v33, v34, v35, v36, v37);
    for _, v41 in l_ipairs_0(v30) do
        if v41[1] then
            v19:Add("TextLabel", {
                Size = UDim2.new(1, -10, 0, 30), 
                Position = UDim2.new(0, 5, 0, v28 * 32 + 285), 
                BackgroundTransparency = 0.4, 
                Text = v41[2], 
                ToolTip = v41[4]
            }):Add("ImageLabel", {
                Image = v41[3], 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 24, 0, 24), 
                Position = UDim2.new(0, 4, 0, 3)
            });
            v28 = v28 + 1;
        end;
    end;
    v19:ResizeCanvas(false, true, false, false, 5, 5);
    v17:Ready();
    v28 = function(v42) --[[ Line: 164 ]] --[[ Name: iterPageItems ]]
        return coroutine.wrap(function() --[[ Line: 165 ]]
            -- upvalues: v42 (copy)
            local v43 = 1;
            while true do
                for _, v45 in ipairs(v42:GetCurrentPage()) do
                    coroutine.yield(v45, v43);
                end;
                if not v42.IsFinished then
                    v42:AdvanceToNextPageAsync();
                    v43 = v43 + 1;
                else
                    break;
                end;
            end;
        end);
    end;
    l_ipairs_0 = l_Service_0.Players:GetFriendsAsync(l_Target_0.UserId);
    v30 = {};
    local v46 = {};
    v31 = 0;
    v32 = 0;
    local l_v28_0 = v28 --[[ copy: 13 -> 26 ]];
    local l_l_ipairs_0_0 = l_ipairs_0 --[[ copy: 14 -> 27 ]];
    local l_v30_0 = v30 --[[ copy: 15 -> 28 ]];
    local l_v46_0 = v46 --[[ copy: 16 -> 29 ]];
    do
        local l_v31_0, l_v32_0 = v31, v32;
        l_Routine_0(function() --[[ Line: 187 ]]
            -- upvalues: l_v28_0 (copy), l_l_ipairs_0_0 (copy), l_v30_0 (copy), l_v46_0 (copy), l_v32_0 (ref), l_v31_0 (ref), v20 (copy), l_client_0 (copy), l_Routine_0 (copy), l_Service_0 (copy)
            for v53, _ in l_v28_0(l_l_ipairs_0_0) do
                table.insert(l_v30_0, v53.Username);
                l_v46_0[v53.Username] = {
                    id = v53.Id, 
                    displayName = v53.DisplayName, 
                    isOnline = v53.IsOnline
                };
                if v53.IsOnline then
                    l_v32_0 = l_v32_0 + 1;
                end;
                l_v31_0 = l_v31_0 + 1;
            end;
            table.sort(l_v30_0);
            local v55 = v20:Add("TextBox", {
                Size = UDim2.new(1, -10, 0, 25), 
                Position = UDim2.new(0, 5, 0, 5), 
                BackgroundTransparency = 0.5, 
                PlaceholderText = ("Search %d friends (%d online)"):format(l_v31_0, l_v32_0), 
                Text = "", 
                TextStrokeTransparency = 0.8
            });
            v55:Add("ImageLabel", {
                Image = l_client_0.MatIcons.Search, 
                Position = UDim2.new(1, -21, 0, 3), 
                Size = UDim2.new(0, 18, 0, 18), 
                ImageTransparency = 0.2, 
                BackgroundTransparency = 1
            });
            local v56 = v20:Add("ScrollingFrame", {
                List = {}, 
                ScrollBarThickness = 2, 
                BackgroundTransparency = 1, 
                Position = UDim2.new(0, 5, 0, 35), 
                Size = UDim2.new(1, -10, 1, -40)
            });
            local function v63() --[[ Line: 225 ]] --[[ Name: getList ]]
                -- upvalues: v56 (copy), l_v30_0 (ref), l_v46_0 (ref), v55 (copy), l_Routine_0 (ref), l_Service_0 (ref)
                v56:ClearAllChildren();
                local v57 = 1;
                for _, v59 in ipairs(l_v30_0) do
                    local v60 = l_v46_0[v59];
                    if v59:sub(1, #v55.Text):lower() == v55.Text:lower() or v60.displayName:sub(1, #v55.Text):lower() == v55.Text:lower() then
                        local v61 = "";
                        v61 = if v59 == v60.displayName then v59 else ("%* (@%*)"):format(v60.displayName, v59);
                        local v62 = v56:Add("TextLabel", {
                            Text = ("             %*"):format(v61), 
                            ToolTip = ("User ID: %*"):format(v60.id), 
                            BackgroundTransparency = (v57 - 1) % 2 == 0 and 0 or 0.2, 
                            Size = UDim2.new(1, 0, 0, 30), 
                            Position = UDim2.new(0, 0, 0, (v57 - 1) * 30), 
                            TextXAlignment = "Left"
                        });
                        if v60.isOnline then
                            v62:Add("TextLabel", {
                                Text = "Online", 
                                BackgroundTransparency = 1, 
                                Size = UDim2.new(0, 120, 1, 0), 
                                Position = UDim2.new(1, -130, 0, 0), 
                                TextXAlignment = "Right"
                            });
                        end;
                        l_Routine_0(function() --[[ Line: 254 ]]
                            -- upvalues: v62 (copy), l_Service_0 (ref), v60 (copy)
                            v62:Add("ImageLabel", {
                                Image = l_Service_0.Players:GetUserThumbnailAsync(v60.id, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48), 
                                BackgroundTransparency = 1, 
                                Size = UDim2.new(0, 30, 0, 30), 
                                Position = UDim2.new(0, 0, 0, 0)
                            });
                        end);
                        v57 = v57 + 1;
                    end;
                end;
                v56:ResizeCanvas(false, true, false, false, 5, 5);
            end;
            v55:GetPropertyChangedSignal("Text"):Connect(v63);
            v63();
        end);
    end;
    v28 = {};
    l_ipairs_0 = {};
    v30 = 0;
    v46 = 0;
    v31 = pairs;
    v32 = l_Service_0.GroupService:GetGroupsAsync(l_Target_0.UserId) or {};
    for _, v65 in v31(v32) do
        l_Routine_0(l_Service_0.ContentProvider.PreloadAsync, l_Service_0.ContentProvider, {
            v65.EmblemUrl
        });
        table.insert(v28, v65.Name);
        l_ipairs_0[v65.Name] = v65;
        v30 = v30 + 1;
        if v65.Rank == 255 then
            v46 = v46 + 1;
        end;
    end;
    table.sort(v28);
    v31 = v21:Add("TextBox", {
        Size = UDim2.new(1, -10, 0, 25), 
        Position = UDim2.new(0, 5, 0, 5), 
        BackgroundTransparency = 0.5, 
        PlaceholderText = ("Search %d group%s (%d owned)"):format(v30, v30 ~= 1 and "s" or "", v46), 
        Text = "", 
        TextStrokeTransparency = 0.8
    });
    v31:Add("ImageLabel", {
        Image = l_client_0.MatIcons.Search, 
        Position = UDim2.new(1, -21, 0, 3), 
        Size = UDim2.new(0, 18, 0, 18), 
        ImageTransparency = 0.2, 
        BackgroundTransparency = 1
    });
    v32 = v21:Add("ScrollingFrame", {
        List = {}, 
        ScrollBarThickness = 2, 
        BackgroundTransparency = 1, 
        Position = UDim2.new(0, 5, 0, 35), 
        Size = UDim2.new(1, -10, 1, -40)
    });
    local l_v32_1 = v32 --[[ copy: 18 -> 30 ]];
    local l_v28_1 = v28 --[[ copy: 13 -> 31 ]];
    local l_l_ipairs_0_1 = l_ipairs_0 --[[ copy: 14 -> 32 ]];
    v33 = function() --[[ Line: 320 ]] --[[ Name: getList ]]
        -- upvalues: l_v32_1 (copy), l_v28_1 (copy), l_l_ipairs_0_1 (copy), v31 (copy), l_Routine_0 (copy)
        l_v32_1:ClearAllChildren();
        local v69 = 1;
        for _, v71 in ipairs(l_v28_1) do
            local v72 = l_l_ipairs_0_1[v71];
            if v71:sub(1, #v31.Text):lower() == v31.Text:lower() or v72.Role:sub(1, #v31.Text):lower() == v31.Text:lower() then
                local v73 = l_v32_1:Add("TextLabel", {
                    Text = "", 
                    ToolTip = string.format("%sID: %d | Rank: %d%s", v72.IsPrimary and "Primary Group | " or "", v72.Id, v72.Rank, v72.Rank == 255 and " (Owner)" or ""), 
                    BackgroundTransparency = (v69 - 1) % 2 == 0 and 0 or 0.2, 
                    Size = UDim2.new(1, -10, 0, 30), 
                    Position = UDim2.new(0, 5, 0, (v69 - 1) * 30), 
                    TextXAlignment = "Left"
                });
                local v74 = v73:Add("TextLabel", {
                    Text = v72.Role, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, 0, 1, 0), 
                    Position = UDim2.new(1, -10, 0, 0), 
                    ClipsDescendants = false, 
                    TextXAlignment = "Right"
                });
                local v75 = v73:Add("TextLabel", {
                    Text = v71, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, -50 - v74.TextBounds.X, 1, 0), 
                    Position = UDim2.new(0, 36, 0, 0), 
                    TextXAlignment = "Left", 
                    TextTruncate = "AtEnd"
                });
                if v72.IsPrimary and v72.Rank >= 255 then
                    v75.TextColor3 = Color3.fromRGB(85, 255, 127);
                elseif v72.IsPrimary then
                    v75.TextColor3 = Color3.fromRGB(170, 255, 255);
                elseif v72.Rank >= 255 then
                    v75.TextColor3 = Color3.new(1, 1, 0.5);
                end;
                l_Routine_0(function() --[[ Line: 357 ]]
                    -- upvalues: v73 (copy), v72 (copy)
                    v73:Add("ImageLabel", {
                        Image = v72.EmblemUrl, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(0, 30, 0, 30), 
                        Position = UDim2.new(0, 0, 0, 0)
                    });
                end);
                v69 = v69 + 1;
            end;
        end;
        l_v32_1:ResizeCanvas(false, true, false, false, 5, 5);
    end;
    v31:GetPropertyChangedSignal("Text"):Connect(v33);
    v33();
    if v11.GameData then
        v28 = {
            {
                "Admin Level", 
                v11.GameData.AdminLevel, 
                "The player's Adonis rank"
            }, 
            {
                "Muted", 
                v7(v11.GameData.IsMuted), 
                "Is the player muted? (IGNORES TRELLO MUTELIST)"
            }, 
            {
                "Auto Jump Enabled", 
                v7(l_Target_0.AutoJumpEnabled), 
                "Does the player have auto jump enabled?"
            }, 
            {
                "Camera Max Zoom Distance", 
                l_Target_0.CameraMaxZoomDistance, 
                "How far in studs the player can zoom out their camera"
            }, 
            {
                "Camera Min Zoom Distance", 
                l_Target_0.CameraMinZoomDistance, 
                "How close in studs the player can zoom in their camera"
            }, 
            {
                "Accelerometer Enabled", 
                v7(v11.GameData.AccelerometerEnabled), 
                "Whether the user\226\128\153s device has an accelerometer"
            }, 
            {
                "Gamepad Enabled", 
                v7(v11.GameData.GamepadEnabled), 
                "Whether the user's device has an available gamepad"
            }, 
            {
                "Gyroscope Enabled", 
                v7(v11.GameData.GyroscopeEnabled), 
                "Whether the user\226\128\153s device has a gyroscope"
            }, 
            {
                "Keyboard Enabled", 
                v7(v11.GameData.KeyboardEnabled), 
                "Whether the user\226\128\153s device has a keyboard available"
            }, 
            {
                "Mouse Delta Sensitivity", 
                v11.GameData.MouseDeltaSensitivity, 
                "The scale of the delta (change) output of the user\226\128\153s Mouse"
            }, 
            {
                "Mouse Enabled", 
                v7(v11.GameData.MouseEnabled), 
                "Whether the user\226\128\153s device has a mouse available"
            }, 
            {
                "Render Resolution", 
                v11.GameData.Resolution, 
                "The render resolution on user's current device. May not reflect real resolution on high-DPI devices."
            }, 
            {
                "Touch Enabled", 
                v7(v11.GameData.TouchEnabled), 
                "Whether the user\226\128\153s current device has a touch-screen available"
            }, 
            {
                "VR Enabled", 
                v7(v11.GameData.VREnabled), 
                "Whether the user is using a virtual reality headset"
            }, 
            {
                "Source Place ID", 
                v11.GameData.SourcePlaceId, 
                "The ID of the place from which the player was teleported to this game, if applicable"
            }
        };
        l_ipairs_0 = 1;
        for _, v77 in ipairs(v28) do
            v34 = v22:Add("TextLabel", {
                Text = ("  %*: "):format(v77[1]), 
                ToolTip = v77[3], 
                BackgroundTransparency = l_ipairs_0 % 2 == 0 and 0 or 0.2, 
                Size = UDim2.new(1, -10, 0, 25), 
                Position = UDim2.new(0, 5, 0, (l_ipairs_0 - 1) * 25 + 5), 
                TextXAlignment = "Left"
            }):Add("TextLabel", {
                Text = v77[2], 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 120, 1, 0), 
                Position = UDim2.new(1, -130, 0, 0), 
                TextXAlignment = "Right"
            });
            l_ipairs_0 = l_ipairs_0 + 1;
        end;
        v22:Add("TextButton", {
            Text = "View Tools", 
            ToolTip = string.format("%sviewtools%s%s", v11.CmdPrefix, v11.CmdSplitKey, l_Target_0.Name), 
            BackgroundTransparency = l_ipairs_0 % 2 == 0 and 0 or 0.2, 
            Size = UDim2.new(1, -10, 0, 30), 
            Position = UDim2.new(0, 5, 0, (l_ipairs_0 - 1) * 25 + 10), 
            OnClicked = function(v78) --[[ Line: 422 ]] --[[ Name: OnClicked ]]
                -- upvalues: l_client_0 (copy), v11 (copy), l_Target_0 (copy)
                if v78.Active then
                    v78.Active = false;
                    v78.AutoButtonColor = false;
                    l_client_0.Remote.Send("ProcessCommand", string.format("%sviewtools%s%s", v11.CmdPrefix, v11.CmdSplitKey, l_Target_0.Name));
                    wait(2);
                    v78.AutoButtonColor = true;
                    v78.Active = true;
                end;
            end
        });
        v22:ResizeCanvas(false, true, false, false, 5, 5);
        return;
    else
        v22:Disable();
        return;
    end;
end;