local v0 = nil;
local v1 = nil;
client = v0;
service = v1;
return function(v2, v3) --[[ Line: 3 ]]
    if v3 then
        setfenv(1, v3);
    end;
    local v4 = nil;
    local v5 = nil;
    local v6 = client.UI.Make("Window", {
        Name = "ToolPanel", 
        Title = "Tools Panel", 
        Icon = client.MatIcons["Inventory 2"], 
        Size = {
            400, 
            290
        }, 
        MinSize = {
            300, 
            200
        }, 
        OnRefresh = function() --[[ Line: 16 ]] --[[ Name: OnRefresh ]]
            -- upvalues: v2 (ref), v5 (ref), v4 (ref)
            v2 = client.Remote.Get("UpdateList", "ToolList");
            v5();
            v4();
        end
    });
    local v7 = v6:Add("TabFrame", {
        Size = UDim2.new(1, -10, 1, -10), 
        Position = UDim2.new(0, 5, 0, 5)
    });
    local v8 = v7:NewTab("Storage", {
        Text = "Storage"
    });
    local l_v8_0 = v8 --[[ copy: 6 -> 8 ]];
    v4 = function() --[[ Line: 33 ]] --[[ Name: generateStorage ]]
        -- upvalues: l_v8_0 (copy), v2 (ref)
        l_v8_0:ClearAllChildren();
        local v10 = l_v8_0:Add("ScrollingFrame", {
            Size = UDim2.new(1, -10, 1, -10), 
            Position = UDim2.new(0, 5, 0, 5)
        });
        table.sort(v2.Tools);
        local v11 = 0;
        for _, v13 in ipairs(v2.Tools) do
            v10:Add("TextLabel", {
                Size = UDim2.new(1, -10, 0, 30), 
                Position = UDim2.fromOffset(5, v11 * 30), 
                BackgroundTransparency = 1, 
                TextXAlignment = "Left", 
                Text = ("  %*"):format(v13)
            }):Add("TextButton", {
                Size = UDim2.new(0, 80, 1, -4), 
                Position = UDim2.new(1, -82, 0, 2), 
                Text = "Spawn", 
                OnClick = function(v14) --[[ Line: 51 ]] --[[ Name: OnClick ]]
                    -- upvalues: v2 (ref), v13 (copy)
                    if v14.Active then
                        v14.Active = false;
                        v14.AutoButtonColor = false;
                        v14.Text = ". . .";
                        local l_Backpack_0 = service.Players.LocalPlayer:FindFirstChildOfClass("Backpack");
                        task.defer(function() --[[ Line: 57 ]]
                            -- upvalues: l_Backpack_0 (copy), v14 (copy)
                            if l_Backpack_0 then
                                l_Backpack_0.ChildAdded:Wait();
                            end;
                            v14.Active = true;
                            v14.AutoButtonColor = true;
                            v14.Text = "Spawn";
                        end);
                        client.Remote.Send("ProcessCommand", (("%*give%*%*me%*%*"):format(v2.Prefix, v2.SplitKey, v2.SpecialPrefix, v2.SplitKey, v13)));
                    end;
                end
            });
            v11 = v11 + 1;
        end;
        v10:ResizeCanvas(false, true, false, false, 5, 0);
    end;
    v4();
    v8 = v7:NewTab("Added", {
        Text = "Added"
    });
    v8:Add("TextLabel", {
        Size = UDim2.new(1, -10, 0, 50), 
        Position = UDim2.fromOffset(5, 5), 
        TextWrapped = true, 
        Text = ("Here is a list of tools saved in the server via the %*addtool command. They can be distributed normally using %*give."):format(v2.Prefix, v2.Prefix)
    }):Add("UIPadding", {
        PaddingLeft = UDim.new(0, 5), 
        PaddingRight = UDim.new(0, 5), 
        PaddingTop = UDim.new(0, 5), 
        PaddingBottom = UDim.new(0, 5)
    });
    local v16 = v8:Add("ScrollingFrame", {
        Size = UDim2.new(1, -10, 1, -65), 
        Position = UDim2.fromOffset(5, 60)
    });
    v5 = function() --[[ Line: 92 ]] --[[ Name: generateAdded ]]
        -- upvalues: v16 (copy), v2 (ref), v5 (ref)
        local v17 = 0;
        v16:ClearAllChildren();
        v16.CanvasPosition = Vector2.new(0, 0);
        for _, v19 in ipairs(v2.SavedTools) do
            v16:Add("TextLabel", {
                Size = UDim2.new(1, -10, 0, 30), 
                Position = UDim2.fromOffset(5, v17 * 30), 
                BackgroundTransparency = 1, 
                TextXAlignment = "Left", 
                Text = ("  %*"):format(v19.ToolName), 
                ToolTip = ("Added by: %*"):format(v19.AddedBy)
            }):Add("TextButton", {
                Size = UDim2.new(0, 80, 1, -4), 
                Position = UDim2.new(1, -82, 0, 2), 
                Text = "Spawn", 
                OnClick = function(v20) --[[ Line: 108 ]] --[[ Name: OnClick ]]
                    -- upvalues: v2 (ref), v19 (copy)
                    if v20.Active then
                        v20.Active = false;
                        v20.AutoButtonColor = false;
                        v20.Text = ". . .";
                        local l_Backpack_1 = service.Players.LocalPlayer:FindFirstChildOfClass("Backpack");
                        task.defer(function() --[[ Line: 114 ]]
                            -- upvalues: l_Backpack_1 (copy), v20 (copy)
                            if l_Backpack_1 then
                                l_Backpack_1.ChildAdded:Wait();
                            end;
                            v20.Active = true;
                            v20.AutoButtonColor = true;
                            v20.Text = "Spawn";
                        end);
                        client.Remote.Send("ProcessCommand", (("%*give%*%*me%*%*"):format(v2.Prefix, v2.SplitKey, v2.SpecialPrefix, v2.SplitKey, v19.ToolName)));
                    end;
                end
            });
            v17 = v17 + 1;
        end;
        if v17 > 0 then
            local v26 = v16:Add("TextButton", {
                Size = UDim2.new(1, -10, 0, 25), 
                Position = UDim2.fromOffset(5, v17 * 30 + 5), 
                Text = string.format("Clear %d saved tool%s", v17, v17 == 1 and "" or "s"), 
                OnClick = function(v22) --[[ Line: 132 ]] --[[ Name: OnClick ]]
                    -- upvalues: v2 (ref), v5 (ref)
                    if v22.Active then
                        v22.Active = false;
                        v22.AutoButtonColor = false;
                        v22.Text = ". . .";
                        local l_PlayerGui_0 = service.Players.LocalPlayer:FindFirstChildOfClass("PlayerGui");
                        local v24 = false;
                        do
                            local l_v24_0 = v24;
                            task.defer(function() --[[ Line: 139 ]]
                                -- upvalues: l_PlayerGui_0 (copy), l_v24_0 (ref), v2 (ref), v5 (ref)
                                if l_PlayerGui_0 then
                                    l_PlayerGui_0.ChildAdded:Wait();
                                end;
                                if not l_v24_0 then
                                    l_v24_0 = true;
                                    v2 = client.Remote.Get("UpdateList", "ToolList");
                                    v5();
                                end;
                            end);
                            client.Remote.Send("ProcessCommand", (("%*clearaddedtools"):format(v2.Prefix)));
                            wait(1);
                            if not l_v24_0 then
                                l_v24_0 = true;
                                v2 = client.Remote.Get("UpdateList", "ToolList");
                                v5();
                            end;
                        end;
                    end;
                end
            });
            v26.BackgroundColor3 = v26.BackgroundColor3:lerp(Color3.new(1, 1, 1), 0.03);
        end;
        v16:ResizeCanvas(false, true, false, false, 5, 0);
    end;
    v5();
    spawn(function() --[[ Line: 164 ]]
        -- upvalues: v7 (copy), v2 (ref)
        local v27 = v7:NewTab("Inventories", {
            Text = "Inventory Monitor"
        });
        local v28 = nil;
        local v29 = {};
        local v30 = v27:Add("ScrollingFrame", {
            Size = UDim2.new(1, -195, 1, -10), 
            Position = UDim2.new(0, 5, 0, 5)
        });
        v30.BackgroundColor3 = v30.BackgroundColor3:lerp(Color3.new(1, 1, 1), 0.05);
        v30.Visible = false;
        local v31 = v27:Add("ScrollingFrame", {
            Size = UDim2.new(0, 180, 1, -10), 
            Position = UDim2.new(1, -185, 0, 5)
        });
        v31:Add("UIListLayout", {
            SortOrder = Enum.SortOrder.Name
        });
        local function v32() --[[ Line: 182 ]] --[[ Name: displayInv ]]
            -- upvalues: v28 (ref), v29 (copy), v30 (copy), v32 (copy), v2 (ref)
            if not v28 then
                return;
            else
                local l_Backpack_2 = v28:FindFirstChildOfClass("Backpack");
                for _, v35 in pairs(v29) do
                    if v35 then
                        v35:Disconnect();
                    end;
                end;
                v30:ClearAllChildren();
                if not l_Backpack_2 then
                    v30:Add("TextLabel", {
                        Text = "This player has no backpack(!)", 
                        Size = UDim2.new(1, -10, 0, 26), 
                        Position = UDim2.new(0, 5, 0, 0), 
                        BackgroundTransparency = 1
                    });
                    v30:ResizeCanvas(false, true, false, false, 5, 0);
                    return;
                else
                    table.insert(v29, l_Backpack_2.ChildAdded:Connect(v32));
                    table.insert(v29, l_Backpack_2.ChildRemoved:Connect(v32));
                    table.insert(v29, v28.CharacterAdded:Connect(v32));
                    local l_Character_0 = v28.Character;
                    local l_l_Backpack_2_Children_0 = l_Backpack_2:GetChildren();
                    if l_Character_0 then
                        for _, v39 in ipairs(l_Character_0:GetChildren()) do
                            table.insert(l_l_Backpack_2_Children_0, v39);
                        end;
                    end;
                    local v40 = 0;
                    for _, v42 in ipairs(l_l_Backpack_2_Children_0) do
                        if v42 and v42:IsA("BackpackItem") then
                            v30:Add("TextLabel", {
                                Text = (" %*"):format(v42.Name), 
                                ToolTip = ("Class: %*%*"):format(v42.ClassName, v42.ToolTip ~= "" and (" | ToolTip: %*"):format(v42.ToolTip) or ""), 
                                TextXAlignment = "Left", 
                                TextColor3 = v42.Parent == l_Character_0 and Color3.fromRGB(170, 255, 255) or Color3.new(1, 1, 1), 
                                Size = UDim2.new(1, -10, 0, 26), 
                                Position = UDim2.new(0, 5, 0, v40 * 26), 
                                BackgroundTransparency = 1
                            }):Add("ImageButton", {
                                Image = client.MatIcons.Clear, 
                                Size = UDim2.new(0, 20, 0, 20), 
                                Position = UDim2.new(1, -20, 0, 3), 
                                OnClick = function(v43) --[[ Line: 218 ]] --[[ Name: OnClick ]]
                                    -- upvalues: v2 (ref), v28 (ref), v42 (copy)
                                    if v43.Active then
                                        v43.Active = false;
                                        v43.AutoButtonColor = false;
                                        v43.Image = client.MatIcons["Hourglass empty"];
                                        client.Remote.Send("ProcessCommand", string.format("%sremovetool%s%s%s%s%s", v2.Prefix, v2.SplitKey, v2.SpecialPrefix, v28.Name, v2.SplitKey, v42.Name));
                                        if v43 then
                                            v43.Image = client.MatIcons.Clear;
                                            v43.AutoButtonColor = true;
                                            v43.Active = true;
                                        end;
                                    end;
                                end
                            });
                            v40 = v40 + 1;
                        end;
                    end;
                    if v40 > 0 then
                        v30:Add("TextButton", {
                            Text = "Remove All Tools", 
                            Size = UDim2.new(1, -10, 0, 26), 
                            Position = UDim2.new(0, 5, 0, v40 * 26 + 5), 
                            OnClick = function(v44) --[[ Line: 240 ]] --[[ Name: OnClick ]]
                                -- upvalues: v2 (ref), v28 (ref)
                                if v44.Active then
                                    v44.Active = false;
                                    v44.AutoButtonColor = false;
                                    v44.Text = ". . .";
                                    client.Remote.Send("ProcessCommand", string.format("%sremovetools%s%s%s", v2.Prefix, v2.SplitKey, v2.SpecialPrefix, v28.Name));
                                    wait(2);
                                    if v44 then
                                        v44.Text = "Remove All Tools";
                                        v44.AutoButtonColor = true;
                                        v44.Active = true;
                                    end;
                                end;
                            end
                        });
                    else
                        v30:Add("TextLabel", {
                            Text = "This player has no tools.", 
                            Size = UDim2.new(1, -10, 0, 26), 
                            Position = UDim2.new(0, 5, 0, 0), 
                            BackgroundTransparency = 1
                        });
                    end;
                    v30:ResizeCanvas(false, true, false, false, 5, 0);
                    return;
                end;
            end;
        end;
        local function v63(v45) --[[ Line: 266 ]] --[[ Name: addPlr ]]
            -- upvalues: v31 (copy), v28 (ref), v30 (copy), v29 (copy), v32 (copy)
            if v31:FindFirstChild(v45.Name) or not v45 or not v45.Parent then
                return;
            else
                local l_Backpack_3 = v45:FindFirstChildOfClass("Backpack");
                local v54 = v31:Add("TextButton", {
                    Size = UDim2.new(1, 0, 0, 35), 
                    Text = ("  %*"):format(v45.Name), 
                    ToolTip = service.FormatPlayer(v45), 
                    TextXAlignment = "Left", 
                    OnClick = function(v47) --[[ Line: 274 ]] --[[ Name: OnClick ]]
                        -- upvalues: v28 (ref), v45 (copy), v30 (ref), v29 (ref), v32 (ref), v31 (ref)
                        if v47.Active then
                            v47.Active = false;
                            v47.AutoButtonColor = false;
                            v28 = v45;
                            v30.Visible = true;
                            for _, v49 in pairs(v29) do
                                if v49 then
                                    v49:Disconnect();
                                end;
                            end;
                            v32();
                            v47.TextColor3 = Color3.fromRGB(170, 255, 255);
                            for _, v51 in ipairs(v31:GetChildren()) do
                                if v51:IsA("TextButton") and v51 ~= v47 then
                                    v51.AutoButtonColor = true;
                                    v51.TextColor3 = Color3.new(1, 1, 1);
                                end;
                            end;
                            return;
                        else
                            v28 = nil;
                            v30.Visible = false;
                            for _, v53 in pairs(v29) do
                                if v53 then
                                    v53:Disconnect();
                                end;
                            end;
                            v47.AutoButtonColor = true;
                            v47.Active = true;
                            v47.TextColor3 = Color3.new(1, 1, 1);
                            return;
                        end;
                    end
                });
                v54:Add("ImageLabel", {
                    AnchorPoint = Vector2.new(1, 0.5), 
                    Size = UDim2.new(0, 16, 0, 16), 
                    Position = UDim2.new(1, -5, 0.5, 0), 
                    BackgroundTransparency = 1, 
                    Image = client.MatIcons.Build
                });
                local v55 = v54:Add("TextLabel", {
                    AnchorPoint = Vector2.new(1, 0.5), 
                    Size = UDim2.new(0, 30, 0, 20), 
                    Position = UDim2.new(1, -25, 0.5, 0), 
                    Text = "", 
                    TextXAlignment = "Right", 
                    BackgroundTransparency = 1
                });
                local function v62() --[[ Line: 314 ]] --[[ Name: countTools ]]
                    -- upvalues: v45 (copy), v55 (copy)
                    local l_Backpack_4 = v45:FindFirstChildOfClass("Backpack");
                    if not l_Backpack_4 then
                        v55.Text = "?";
                        return;
                    else
                        local v57 = 0;
                        for _, v59 in ipairs(l_Backpack_4:GetChildren()) do
                            if v59:IsA("BackpackItem") then
                                v57 = v57 + 1;
                            end;
                        end;
                        if v45.Character then
                            for _, v61 in ipairs(v45.Character:GetChildren()) do
                                if v61:IsA("BackpackItem") then
                                    v57 = v57 + 1;
                                end;
                            end;
                        end;
                        v55.Text = v57;
                        return;
                    end;
                end;
                if l_Backpack_3 then
                    l_Backpack_3.ChildAdded:Connect(v62);
                    l_Backpack_3.ChildRemoved:Connect(v62);
                end;
                v45.CharacterAdded:Connect(v62);
                v62();
                v31:ResizeCanvas(false, true, false, false, 5, 0);
                return;
            end;
        end;
        service.Players.PlayerAdded:Connect(v63);
        for _, v65 in ipairs(service.Players:GetPlayers()) do
            v63(v65);
        end;
        service.Players.PlayerRemoving:Connect(function(v66) --[[ Line: 341 ]]
            -- upvalues: v28 (ref), v30 (copy), v31 (copy)
            if v28 == v66 then
                v28 = nil;
                v30:ClearAllChildren();
            end;
            if v31:FindFirstChild(v66.Name) then
                v30[v66.Name]:Destroy();
            end;
        end);
    end);
    spawn(function() --[[ Line: 350 ]]
        -- upvalues: v7 (copy), v2 (ref)
        local v67 = v7:NewTab("Gear", {
            Text = "Insert Gear"
        });
        local v68 = nil;
        local v69 = nil;
        v67:Add("UIPadding", {
            PaddingLeft = UDim.new(0, 5), 
            PaddingRight = UDim.new(0, 5), 
            PaddingTop = UDim.new(0, 5), 
            PaddingBottom = UDim.new(0, 5)
        });
        v67:Add("TextLabel", {
            BackgroundTransparency = 1, 
            Text = "Gear ID:", 
            TextXAlignment = "Left", 
            Size = UDim2.new(0, 60, 0, 25), 
            Position = UDim2.new(0, 0, 0, 0)
        });
        local v70 = v67:Add("TextBox", {
            Text = "", 
            Size = UDim2.new(1, -90, 0, 25), 
            Position = UDim2.new(0, 60, 0, 0), 
            ClearTextOnFocus = false
        });
        local v72 = v67:Add("TextButton", {
            Size = UDim2.new(0, 130, 0, 30), 
            Position = UDim2.new(1, -130, 1, -30), 
            Text = "Spawn", 
            TextTransparency = 0.4, 
            AutoButtonColor = false, 
            OnClick = function(v71) --[[ Line: 382 ]] --[[ Name: OnClick ]]
                -- upvalues: v68 (ref), v69 (ref), v2 (ref)
                if v71.Active and v68 then
                    if v69 == 19 then
                        v71.Active = false;
                        v71.AutoButtonColor = false;
                        v71.Text = ". . .";
                        client.Remote.Send("ProcessCommand", string.format("%sgear%s%sme%s%s", v2.Prefix, v2.SplitKey, v2.SpecialPrefix, v2.SplitKey, v68));
                        wait(2);
                        if v71 then
                            v71.Text = "Spawn";
                            v71.AutoButtonColor = true;
                            v71.Active = true;
                            return;
                        end;
                    else
                        client.UI.Make("Output", {
                            Message = "Selected asset is not a valid gear."
                        });
                    end;
                end;
            end
        });
        local function v85(v73) --[[ Line: 402 ]] --[[ Name: load ]]
            -- upvalues: v67 (copy), v68 (ref), v69 (ref), v72 (copy)
            for _, v75 in ipairs(v67:GetChildren()) do
                if v75.Name == "Info" then
                    v75:Destroy();
                end;
            end;
            if not v73 then
                local v76 = nil;
                local v77 = nil;
                v68 = v76;
                v69 = v77;
                v72.TextTransparency = 0.4;
                v72.AutoButtonColor = false;
                return;
            else
                v72.TextTransparency = 0;
                v72.AutoButtonColor = true;
                local l_status_0, l_result_0 = pcall(service.MarketplaceService.GetProductInfo, service.MarketplaceService, v73, Enum.InfoType.Asset);
                if not l_status_0 then
                    v67:Add("TextLabel", {
                        Name = "Info", 
                        Text = "  Error: Invalid asset ID", 
                        Size = UDim2.new(1, 0, 0, 30), 
                        Position = UDim2.fromOffset(0, 30), 
                        TextXAlignment = "Left"
                    });
                    local v80 = nil;
                    local v81 = nil;
                    v68 = v80;
                    v69 = v81;
                    v72.TextTransparency = 0.4;
                    v72.AutoButtonColor = false;
                    return;
                else
                    v69 = l_result_0.AssetTypeId;
                    v68 = v73;
                    for v82, v83 in ipairs({
                        {
                            "Name", 
                            l_result_0.Name
                        }, 
                        {
                            "Creator", 
                            l_result_0.Creator.Name
                        }, 
                        {
                            "Price", 
                            l_result_0.PriceInRobux
                        }, 
                        {
                            "For sale", 
                            l_result_0.IsForSale and "Yes" or "No"
                        }, 
                        {
                            "Limited", 
                            l_result_0.IsLimited and "Yes" or "No"
                        }, 
                        {
                            "Limited Unique", 
                            l_result_0.IsLimitedUnique and "Yes" or "No"
                        }
                    }) do
                        v67:Add("TextLabel", {
                            Name = "Info", 
                            Text = ("  %*: "):format(v83[1]), 
                            BackgroundTransparency = v82 % 2 == 0 and 0 or 0.2, 
                            Size = UDim2.new(1, -135, 0, 30), 
                            Position = UDim2.new(0, 0, 0, 30 * (v82 - 1) + 30), 
                            TextXAlignment = "Left"
                        }):Add("TextLabel", {
                            Text = v83[2], 
                            BackgroundTransparency = 1, 
                            Size = UDim2.new(0, 120, 1, 0), 
                            Position = UDim2.new(1, -130, 0, 0), 
                            TextXAlignment = "Right"
                        });
                    end;
                    local v84 = v67:Add("TextLabel", {
                        Name = "Info", 
                        Text = l_result_0.Description, 
                        TextScaled = true, 
                        TextWrapped = true, 
                        Size = UDim2.new(0, 130, 1, -65), 
                        Position = UDim2.new(1, -130, 0, 30)
                    });
                    v84:Add("UIPadding", {
                        PaddingLeft = UDim.new(0, 5), 
                        PaddingRight = UDim.new(0, 5), 
                        PaddingTop = UDim.new(0, 5), 
                        PaddingBottom = UDim.new(0, 5)
                    });
                    v84:Add("UITextSizeConstraint", {
                        MaxTextSize = 18, 
                        MinTextSize = 8
                    });
                    return;
                end;
            end;
        end;
        local _ = v67:Add("TextButton", {
            Text = ">", 
            Size = UDim2.new(0, 25, 0, 25), 
            Position = UDim2.new(1, -25, 0, 0), 
            OnClick = function(v86) --[[ Line: 471 ]] --[[ Name: OnClick ]]
                -- upvalues: v85 (copy), v70 (copy)
                if v86.Active then
                    v86.Active = false;
                    v86.AutoButtonColor = false;
                    v85((tonumber(v70.Text)));
                    v86.AutoButtonColor = true;
                    v86.Active = true;
                end;
            end
        });
        v70:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 482 ]]
            -- upvalues: v70 (copy)
            if #v70.Text > 18 then
                v70.Text = v70.Text:sub(1, 18);
            end;
        end);
        v70.FocusLost:Connect(function(v88) --[[ Line: 485 ]]
            -- upvalues: v70 (copy), v85 (copy)
            v70.Text = tonumber(v70.Text) or "";
            if v88 then
                v85((tonumber(v70.Text)));
            end;
        end);
    end);
    v6:Ready();
end;