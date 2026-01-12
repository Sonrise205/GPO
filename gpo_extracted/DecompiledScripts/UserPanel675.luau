local v0 = {
    Admins = true, 
    HeadAdmins = true, 
    Moderators = true, 
    Banned = true, 
    Muted = true, 
    Blacklist = true, 
    Whitelist = true, 
    Permissions = true, 
    MusicList = false, 
    InsertList = false, 
    CapeList = false, 
    CustomRanks = false, 
    OnStartup = true, 
    OnJoin = true, 
    OnSpawn = true, 
    Allowed_API_Calls = false, 
    HideScript = false
};
local function v5(v1) --[[ Line: 26 ]] --[[ Name: tabToString ]]
    if type(v1) == "table" then
        local v2 = "";
        for v3, v4 in v1 do
            if #v2 > 0 then
                v2 = v2 .. "; ";
            end;
            v2 = v2 .. ("%*: %*"):format(v3, v4);
        end;
        return v2;
    else
        return (tostring(v1));
    end;
end;
return function(v6, v7) --[[ Line: 42 ]]
    -- upvalues: v0 (copy), v5 (copy)
    if v7 then
        setfenv(1, v7);
    end;
    local l_client_0 = v7.client;
    local l_service_0 = v7.service;
    local _ = v7.gui;
    local l_UI_0 = l_client_0.UI;
    local l_Remote_0 = l_client_0.Remote;
    local l_Variables_0 = l_client_0.Variables;
    local _ = l_client_0.Deps;
    local l_Functions_0 = l_client_0.Functions;
    local l_KeyCodeToName_0 = l_Functions_0.KeyCodeToName;
    local v17 = nil;
    local v18 = l_UI_0.Make("Window", {
        Name = "UserPanel", 
        Title = l_Variables_0.NightlyMode and "Adonis Nightly" or "Adonis", 
        Icon = l_Variables_0.NightlyMode and "rbxassetid://6877822142" or "rbxassetid://7681261289", 
        Size = {
            465, 
            325
        }, 
        AllowMultiple = false, 
        OnClose = function() --[[ Line: 65 ]] --[[ Name: OnClose ]]
            -- upvalues: l_Variables_0 (copy)
            l_Variables_0.WaitingForBind = false;
        end
    });
    local function v22(v19, v20) --[[ Line: 70 ]] --[[ Name: createPurchaseWindow ]]
        -- upvalues: l_UI_0 (copy), l_client_0 (copy)
        local v21 = l_UI_0.Make("Window", {
            Name = "Purchase window", 
            Title = ("Purchase %*"):format(v19 and "gamepass" or "asset"), 
            Icon = l_client_0.MatIcons["Shopping cart"], 
            AllowMultiple = false, 
            Size = {
                380, 
                160
            }, 
            SizeLocked = true
        });
        if v21 then
            v21:Add("TextLabel", {
                Size = UDim2.new(1, -20, 1, -55), 
                Position = UDim2.new(0.5, 0, 0, 10), 
                AnchorPoint = Vector2.new(0.5, 0), 
                ZIndex = 2, 
                TextScaled = true, 
                Text = "This game does not allow third party purchases. If you would like to purchase, please copy the link below and put it in your browser."
            });
            v21:Add("TextBox", {
                Size = UDim2.new(1, -20, 0, 30), 
                Position = UDim2.new(0.5, 0, 1, -10), 
                AnchorPoint = Vector2.new(0.5, 1), 
                ZIndex = 2, 
                ClearTextOnFocus = false, 
                TextEditable = false, 
                TextScaled = true, 
                Text = string.format("https://roblox.com/%s/%d/", v19 and "game-pass" or "library", v20)
            });
            v21:Ready();
        end;
    end;
    local function v31(v23, v24) --[[ Line: 105 ]] --[[ Name: promptPurchase ]]
        -- upvalues: l_Variables_0 (copy), v22 (copy), l_service_0 (copy)
        if l_Variables_0.AllowThirdPartyPurchases == false then
            v22(v23, v24);
            return;
        else
            local v25 = nil;
            local v26 = nil;
            v25 = l_service_0.LogService.MessageOut:Connect(function(v27, v28) --[[ Line: 111 ]]
                -- upvalues: l_Variables_0 (ref), v22 (ref), v23 (copy), v24 (copy)
                if v28 == Enum.MessageType.MessageWarning and string.find(v27, "AllowThirdPartySales has blocked the purchase prompt") then
                    l_Variables_0.AllowThirdPartyPurchases = false;
                    v22(v23, v24);
                end;
            end);
            v26 = l_service_0.MarketPlace[v23 and "PromptGamePassPurchaseFinished" or "PromptPurchaseFinished"]:Connect(function(v29, v30) --[[ Line: 118 ]]
                -- upvalues: l_service_0 (ref), v24 (copy), v25 (ref), v26 (ref)
                if v29 == l_service_0.Players.LocalPlayer and v30 == v24 then
                    v25:Disconnect();
                    v26:Disconnect();
                end;
            end);
            if v23 then
                l_service_0.MarketPlace:PromptGamePassPurchase(l_service_0.Players.LocalPlayer, v24);
            else
                l_service_0.MarketPlace:PromptPurchase(l_service_0.Players.LocalPlayer, v24);
            end;
            return;
        end;
    end;
    local function v60(v32, v33) --[[ Line: 133 ]] --[[ Name: showTable ]]
        -- upvalues: l_UI_0 (copy), v0 (ref), v5 (ref), l_Remote_0 (copy)
        local v34 = false;
        if type(v33) == "table" then
            v34 = v33;
        end;
        local v35 = v34 and v34[#v34 - 1] or v33;
        local v36 = v34 and table.concat(v34, ".") or v35;
        local v37 = l_UI_0.Make("Window", {
            Name = ("%*EditSettingsTable"):format(v36), 
            Title = if #v32 > 0 then ("%* (%*)"):format(v36, #v32) else v36, 
            Size = {
                320, 
                300
            }, 
            AllowMultiple = false
        });
        if v37 then
            local v38 = v37:Add("TextBox", {
                Size = UDim2.new(1, -10, 0, 20), 
                Position = UDim2.new(0, 5, 0, 5), 
                BackgroundTransparency = 0.5, 
                BorderSizePixel = 0, 
                TextColor3 = Color3.new(1, 1, 1), 
                Text = "", 
                PlaceholderText = "Search", 
                TextStrokeTransparency = 0.8
            });
            local v39 = v37:Add("ScrollingFrame", {
                Size = UDim2.new(1, -10, 1, -60), 
                Position = UDim2.new(0, 5, 0, 30), 
                BackgroundTransparency = 1
            });
            if v34 and v34[2] == "Ranks" or v0[v35] then
                local v40 = nil;
                local v41 = nil;
                do
                    local l_v40_0, l_v41_0 = v40, v41;
                    local function v50() --[[ Line: 169 ]] --[[ Name: showItems ]]
                        -- upvalues: l_v40_0 (ref), v39 (copy), v32 (copy), v5 (ref)
                        l_v40_0 = nil;
                        v39:ClearAllChildren();
                        local l_fromOffset_0 = UDim2.fromOffset;
                        local v45 = UDim2.new(1, 0, 0, 25);
                        local v46 = 0;
                        for v47 = 1, #v32 do
                            local v48 = v32[v47];
                            v39:Add("TextButton", {
                                Text = v5(v48), 
                                Size = v45, 
                                Position = l_fromOffset_0(0, v46 * 25), 
                                Visible = true, 
                                ZIndex = 100, 
                                OnClicked = function(v49) --[[ Line: 185 ]] --[[ Name: OnClicked ]]
                                    -- upvalues: l_v40_0 (ref), v47 (copy), v48 (copy)
                                    if l_v40_0 then
                                        l_v40_0.Button.BackgroundTransparency = 0;
                                    end;
                                    v49.BackgroundTransparency = 0.5;
                                    l_v40_0 = {
                                        Index = v47, 
                                        Value = v48, 
                                        Button = v49
                                    };
                                end
                            });
                            v46 = v46 + 1;
                        end;
                        v39:ResizeCanvas(false, true);
                    end;
                    v38:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 205 ]]
                        -- upvalues: v38 (copy), v39 (copy), v50 (copy)
                        if v38.Text ~= "" then
                            local v51 = 0;
                            local l_v39_Children_0 = v39:GetChildren();
                            for v53 = 1, #l_v39_Children_0 do
                                local v54 = l_v39_Children_0[v53];
                                if string.find(v54.Text, v38.Text) ~= nil then
                                    v54.Position = UDim2.new(0, 0, 0, v51 * 25);
                                    v54.Visible = true;
                                    v51 = v51 + 1;
                                else
                                    v54.Visible = false;
                                end;
                            end;
                            v39:ResizeCanvas(false, true);
                            return;
                        else
                            v50();
                            return;
                        end;
                    end);
                    local v55 = nil;
                    local v56 = nil;
                    v56 = v37:Add("Frame", {
                        Visible = false, 
                        Size = UDim2.new(0, 241, 0, 105), 
                        BackgroundColor3 = Color3.fromRGB(45, 45, 45), 
                        BorderColor3 = Color3.fromRGB(27, 42, 53), 
                        Position = UDim2.new(0.434, -100, 0.612, -100), 
                        ZIndex = 100, 
                        Children = {
                            {
                                Class = "TextLabel", 
                                Text = "Entry", 
                                Position = UDim2.new(0, 0, 0, 0), 
                                Size = UDim2.new(0, 241, 0, 34), 
                                BackgroundTransparency = 1, 
                                TextSize = 16, 
                                ZIndex = 100
                            }, 
                            {
                                Class = "TextButton", 
                                Text = "Add", 
                                Position = UDim2.new(0.479, 0, 1, -30), 
                                Size = UDim2.new(0.6, -20, 0, 20), 
                                BackgroundTransparency = 1, 
                                ZIndex = 100, 
                                OnClicked = function() --[[ Line: 252 ]] --[[ Name: OnClicked ]]
                                    -- upvalues: l_v41_0 (ref), v55 (ref), l_Remote_0 (ref), v34 (copy), v35 (copy), v32 (copy), v56 (ref), v50 (copy)
                                    if not l_v41_0 then
                                        l_v41_0 = true;
                                        if #v55.Text > 0 then
                                            l_Remote_0.Send("SaveTableAdd", v34 or v35, v55.Text);
                                            table.insert(v32, v55.Text);
                                        end;
                                        task.wait(0.5);
                                        v56.Visible = false;
                                        l_v41_0 = false;
                                        v50();
                                    end;
                                end
                            }, 
                            {
                                Class = "TextButton", 
                                Text = "Cancel", 
                                Position = UDim2.new(-0.041, 10, 1, -30), 
                                Size = UDim2.new(0.5, -20, 0, 20), 
                                BackgroundTransparency = 1, 
                                ZIndex = 100, 
                                OnClicked = function() --[[ Line: 273 ]] --[[ Name: OnClicked ]]
                                    -- upvalues: l_v41_0 (ref), v56 (ref)
                                    if not l_v41_0 then
                                        l_v41_0 = false;
                                        v56.Visible = false;
                                    end;
                                end
                            }
                        }
                    });
                    local v57 = "TextBox";
                    local v58 = {
                        Position = UDim2.new(0.043, 0, 0.324, 0), 
                        Size = UDim2.new(0.928, 0, 0.238, 0), 
                        Text = "", 
                        PlaceholderText = "Type entry here", 
                        TextScaled = true, 
                        TextWrapped = true, 
                        BackgroundColor3 = Color3.fromRGB(58, 58, 58), 
                        BackgroundTransparency = 0, 
                        ZIndex = 100
                    };
                    v55 = v56:Add(v57, v58);
                    v37:Add("TextButton", {
                        Text = "Remove", 
                        Position = UDim2.new(0, 5, 1, -25), 
                        Size = UDim2.new(0.5, -10, 0, 20), 
                        OnClicked = function(_) --[[ Line: 299 ]] --[[ Name: OnClicked ]]
                            -- upvalues: l_v40_0 (ref), l_v41_0 (ref), l_Remote_0 (ref), v34 (copy), v35 (copy), v32 (copy), v50 (copy)
                            if l_v40_0 and not l_v41_0 then
                                l_v41_0 = true;
                                l_Remote_0.Send("SaveTableRemove", v34 or v35, l_v40_0.Value);
                                table.remove(v32, l_v40_0.Index);
                                v50();
                                task.wait(0.5);
                                l_v41_0 = false;
                            end;
                        end
                    });
                    v37:Add("TextButton", {
                        Text = "Add", 
                        Position = UDim2.new(0.5, 0, 1, -25), 
                        Size = UDim2.new(0.5, -5, 0, 20), 
                        OnClicked = function() --[[ Line: 315 ]] --[[ Name: OnClicked ]]
                            -- upvalues: l_v41_0 (ref), v55 (ref), v56 (ref)
                            if not l_v41_0 then
                                v55.Text = "";
                                v56.Visible = true;
                            end;
                        end
                    });
                    v50();
                end;
            else
                v39:Add("TextLabel", {
                    Text = "Cannot edit this table in-game", 
                    Size = UDim2.new(1, 0, 0, 25), 
                    Position = UDim2.new(0, 0, 0, 0)
                });
            end;
            v37:Ready();
        end;
    end;
    if v18 then
        local v61 = ":";
        local v62 = nil;
        local v63 = nil;
        local v64 = nil;
        local v65 = v18:Add("TabFrame", {
            Size = UDim2.new(1, -10, 1, -10), 
            Position = UDim2.new(0, 5, 0, 5)
        });
        local v66 = v65:NewTab("Info", {
            Text = "Info"
        });
        local v67 = v65:NewTab("Donate", {
            Text = "Donate"
        });
        local v68 = v65:NewTab("Keybinds", {
            Text = "Keybinds"
        });
        local v69 = v65:NewTab("Aliases", {
            Text = "Aliases"
        });
        local v70 = v65:NewTab("Client", {
            Text = "Client"
        });
        local v71 = v65:NewTab("Game", {
            Text = "Game"
        });
        if v6.Tab then
            local v72 = string.lower(v6.Tab);
            if v72 == "donate" then
                v67:FocusTab();
            elseif v72 == "keybinds" then
                v68:FocusTab();
            elseif v72 == "aliases" then
                v69:FocusTab();
            elseif v72 == "client" then
                v70:FocusTab();
            elseif v72 == "settings" then
                v71:FocusTab();
            else
                v66:FocusTab();
            end;
        end;
        v66:Add("TextLabel", {
            Text = "Adonis is a frequently updated, community maintained, open source administration system created by Sceleratis (Davey_Bones). \n\nIts purpose is to assist in the\nadministration and moderation\nof Roblox game servers.\n\nFeel free to take and edit it on\nthe condition that existing credits remain.\nHave an idea? Let us know!", 
            TextWrapped = true, 
            Size = UDim2.new(1, -145, 1, -10), 
            Position = UDim2.new(0, 5, 0, 5)
        });
        do
            local l_v61_0, l_v62_0 = v61, v62;
            v66:Add("TextButton", {
                Text = "Commands", 
                Size = UDim2.new(0, 130, 0, 40), 
                Position = UDim2.new(1, -135, 0, 5), 
                BackgroundTransparency = 0.5, 
                Events = {
                    MouseButton1Down = function() --[[ Line: 402 ]] --[[ Name: MouseButton1Down ]]
                        -- upvalues: l_Remote_0 (copy), l_v61_0 (ref)
                        l_Remote_0.Send("ProcessCommand", (("%*cmds"):format(l_v61_0)));
                    end
                }
            });
            v66:Add("TextButton", {
                Text = "Changelog", 
                Size = UDim2.new(0, 130, 0, 40), 
                Position = UDim2.new(1, -135, 0, 50), 
                BackgroundTransparency = 0.5, 
                Events = {
                    MouseButton1Down = function() --[[ Line: 414 ]] --[[ Name: MouseButton1Down ]]
                        -- upvalues: l_UI_0 (copy), l_client_0 (copy)
                        l_UI_0.Make("List", {
                            Title = "Changelog", 
                            Table = l_client_0.FormattedChangelog, 
                            RichText = true, 
                            Size = {
                                500, 
                                400
                            }
                        });
                    end
                }
            });
            v66:Add("TextButton", {
                Text = "Credits", 
                Size = UDim2.new(0, 130, 0, 40), 
                Position = UDim2.new(1, -135, 0, 95), 
                BackgroundTransparency = 0.5, 
                Events = {
                    MouseButton1Down = function() --[[ Line: 431 ]] --[[ Name: MouseButton1Down ]]
                        -- upvalues: l_UI_0 (copy)
                        l_UI_0.Make("Credits", {});
                    end
                }
            });
            v66:Add("TextButton", {
                Text = "Get Loader", 
                Size = UDim2.new(0, 130, 0, 40), 
                Position = UDim2.new(1, -135, 0, 140), 
                BackgroundTransparency = 0.5, 
                Events = {
                    MouseButton1Down = function() --[[ Line: 443 ]] --[[ Name: MouseButton1Down ]]
                        -- upvalues: v31 (copy)
                        v31(false, 7510622625);
                    end
                }
            }):Add("ImageLabel", {
                BackgroundTransparency = 1, 
                Image = "rbxassetid://7346570801", 
                ImageTransparency = 0.2, 
                Size = UDim2.new(0, 18, 0, 18), 
                Position = UDim2.new(1, -22, 0, 4)
            });
            v66:Add("TextButton", {
                Text = "Get Source", 
                Size = UDim2.new(0, 130, 0, 40), 
                Position = UDim2.new(1, -135, 0, 185), 
                BackgroundTransparency = 0.5, 
                Events = {
                    MouseButton1Down = function() --[[ Line: 461 ]] --[[ Name: MouseButton1Down ]]
                        -- upvalues: v31 (copy)
                        v31(false, 7510592873);
                    end
                }
            }):Add("ImageLabel", {
                BackgroundTransparency = 1, 
                Image = "rbxassetid://7346570801", 
                ImageTransparency = 0.2, 
                Size = UDim2.new(0, 18, 0, 18), 
                Position = UDim2.new(1, -22, 0, 4)
            });
            local v75 = {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 14, 0, 14), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Image = "rbxassetid://69395121", 
                ImageTransparency = 0.1, 
                ZIndex = 10
            };
            local v76 = {
                v67:Add("ImageLabel", v75), 
                v68:Add("ImageLabel", v75), 
                v69:Add("ImageLabel", v75), 
                v70:Add("ImageLabel", v75), 
                v71:Add("ImageLabel", v75)
            };
            v17 = v18.gTable;
            v18:Ready();
            task.spawn(function() --[[ Line: 489 ]]
                -- upvalues: v76 (copy)
                local v77 = os.clock();
                while v76[1].Parent do
                    for _, v79 in v76 do
                        v79.Rotation = -(os.clock() - v77) / 0.016666666666666666 * 10;
                    end;
                    task.wait(0.016666666666666666);
                end;
            end);
            l_v62_0 = l_Remote_0.Get("PlayerData");
            v63 = l_Remote_0.Get("Setting", {
                "Prefix", 
                "SpecialPrefix", 
                "BatchKey", 
                "AnyPrefix", 
                "DonorCommands", 
                "DonorCapes"
            });
            v64 = l_Remote_0.Get("AllSettings");
            l_Variables_0.Aliases = l_v62_0.Aliases or {};
            l_v61_0 = v63.Prefix;
            for _, v81 in v76 do
                v81:Destroy();
            end;
            local l_Donor_0 = l_v62_0.Donor;
            local v83 = l_Donor_0 and l_Donor_0.Cape.Material;
            local v84 = l_Donor_0 and l_Donor_0.Cape.Image;
            local v85 = l_Donor_0 and l_Donor_0.Cape.Color;
            v85 = if type(v85) == "table" then Color3.new(unpack(v85, 1, 3)) else BrickColor.new(v85).Color;
            local v86 = v67:Add("TextLabel", {
                Text = " Donor Status: ", 
                Size = UDim2.new(1, -10, 0, 20), 
                Position = UDim2.new(0, 5, 0, 5), 
                BackgroundTransparency = 0.25, 
                TextXAlignment = "Left"
            }):Add("TextLabel", {
                Text = l_v62_0.isDonor and "Donated" or "Not a Donor", 
                Size = UDim2.new(0, 150, 1, 0), 
                Position = UDim2.new(1, -155, 0, 0), 
                BackgroundTransparency = 1, 
                TextXAlignment = "Right"
            });
            local l_v86_0 = v86 --[[ copy: 33 -> 50 ]];
            local function v88() --[[ Line: 537 ]] --[[ Name: updateStatus ]]
                -- upvalues: l_v86_0 (copy), l_Remote_0 (copy), l_v62_0 (ref)
                l_v86_0.Text = "Updating...";
                l_v86_0.Text = l_Remote_0.Get("UpdateDonor", l_v62_0.Donor);
                task.wait(0.5);
                l_v86_0.Text = "Donated";
            end;
            local l_v88_0 = v88 --[[ copy: 34 -> 51 ]];
            v67:Add("TextLabel", {
                Text = " Donor Cape: ", 
                Size = UDim2.new(1, -10, 0, 20), 
                Position = UDim2.new(0, 5, 0, 25), 
                BackgroundTransparency = 0.8, 
                TextXAlignment = "Left", 
                Children = {
                    {
                        Class = "Boolean", 
                        TextXAlignment = "Right", 
                        Size = UDim2.new(0, 150, 1, 0), 
                        Position = UDim2.new(1, -155, 0, 0), 
                        TextTransparency = l_v62_0.isDonor and 0 or 0.5, 
                        BackgroundTransparency = 1, 
                        Enabled = l_v62_0.isDonor and l_v62_0.Donor.Enabled, 
                        OnToggle = l_v62_0.isDonor and function(v90) --[[ Line: 559 ]]
                            -- upvalues: l_service_0 (copy), l_v62_0 (ref), l_v88_0 (copy)
                            l_service_0.Debounce("DonorStatusUpdate", function() --[[ Line: 560 ]]
                                -- upvalues: l_v62_0 (ref), v90 (copy), l_v88_0 (ref)
                                l_v62_0.Donor.Enabled = v90;
                                l_v88_0();
                            end);
                        end
                    }
                }
            });
            local l_l_Donor_0_0 = l_Donor_0 --[[ copy: 29 -> 52 ]];
            do
                local l_v84_0, l_v85_0 = v84, v85;
                v67:Add("TextLabel", {
                    Text = " Cape Color: ", 
                    Size = UDim2.new(1, -10, 0, 20), 
                    Position = UDim2.new(0, 5, 0, 45), 
                    BackgroundTransparency = 0.25, 
                    TextXAlignment = "Left", 
                    Children = {
                        {
                            Class = "TextButton", 
                            Text = "", 
                            Size = UDim2.new(0, 40, 1, -6), 
                            Position = UDim2.new(1, -45, 0, 3), 
                            BackgroundColor3 = l_v85_0, 
                            TextTransparency = l_v62_0.isDonor and 0 or 0.5, 
                            BackgroundTransparency = 0, 
                            BorderPixelSize = 1, 
                            BorderColor3 = Color3.fromRGB(100, 100, 100), 
                            OnClick = l_v62_0.isDonor and function(v94) --[[ Line: 586 ]]
                                -- upvalues: l_service_0 (copy), l_UI_0 (copy), l_v85_0 (ref), l_l_Donor_0_0 (copy), l_v88_0 (copy)
                                l_service_0.Debounce("DonorStatusUpdate", function() --[[ Line: 587 ]]
                                    -- upvalues: l_UI_0 (ref), l_v85_0 (ref), v94 (copy), l_l_Donor_0_0 (ref), l_v88_0 (ref)
                                    l_v85_0 = l_UI_0.Make("ColorPicker", {
                                        Color = l_v85_0
                                    }) or l_v85_0;
                                    v94.BackgroundColor3 = l_v85_0;
                                    l_l_Donor_0_0.Cape.Color = {
                                        l_v85_0.R, 
                                        l_v85_0.G, 
                                        l_v85_0.B
                                    };
                                    l_v88_0();
                                end);
                            end
                        }
                    }
                });
                v67:Add("TextLabel", {
                    Text = " Cape Material: ", 
                    Size = UDim2.new(1, -10, 0, 20), 
                    Position = UDim2.new(0, 5, 0, 65), 
                    BackgroundTransparency = 0.8, 
                    TextXAlignment = "Left", 
                    Children = {
                        {
                            Class = "Dropdown", 
                            Size = UDim2.new(0, 100, 1, 0), 
                            Position = UDim2.new(1, -105, 0, 0), 
                            BackgroundTransparency = 1, 
                            Selected = v83, 
                            TextAlignment = "Right", 
                            NoArrow = true, 
                            TextProperties = {
                                TextTransparency = l_v62_0.isDonor and 0 or 0.5
                            }, 
                            Options = l_v62_0.isDonor and {
                                "Brick", 
                                "Cobblestone", 
                                "Concrete", 
                                "CorrodedMetal", 
                                "DiamondPlate", 
                                "Fabric", 
                                "Foil", 
                                "ForceField", 
                                "Granite", 
                                "Grass", 
                                "Ice", 
                                "Marble", 
                                "Metal", 
                                "Neon", 
                                "Pebble", 
                                "Plastic", 
                                "Sand", 
                                "Slate", 
                                "SmoothPlastic", 
                                "Wood", 
                                "WoodPlanks", 
                                "Glass"
                            }, 
                            OnSelect = function(v95) --[[ Line: 646 ]] --[[ Name: OnSelect ]]
                                -- upvalues: l_service_0 (copy), l_l_Donor_0_0 (copy), l_v88_0 (copy)
                                l_service_0.Debounce("DonorStatusUpdate", function() --[[ Line: 647 ]]
                                    -- upvalues: l_l_Donor_0_0 (ref), v95 (copy), l_v88_0 (ref)
                                    l_l_Donor_0_0.Cape.Material = v95;
                                    l_v88_0();
                                end);
                            end
                        }
                    }
                });
                v67:Add("TextLabel", {
                    Text = " Cape Texture: ", 
                    Size = UDim2.new(1, -10, 0, 20), 
                    Position = UDim2.new(0, 5, 0, 85), 
                    BackgroundTransparency = 0.25, 
                    TextXAlignment = "Left", 
                    Children = {
                        {
                            Class = "TextButton", 
                            TextXAlignment = "Right", 
                            Text = l_v84_0 or 0, 
                            Size = UDim2.new(0, 100, 1, 0), 
                            Position = UDim2.new(1, -105, 0, 0), 
                            TextTransparency = l_v62_0.isDonor and 0 or 0.5, 
                            BackgroundTransparency = 1, 
                            OnClick = l_v62_0.isDonor and function(v96) --[[ Line: 671 ]]
                                -- upvalues: l_service_0 (copy), l_v84_0 (ref), l_UI_0 (copy), l_Functions_0 (copy), l_l_Donor_0_0 (copy), l_v88_0 (copy)
                                l_service_0.Debounce("DonorStatusUpdate", function() --[[ Line: 672 ]]
                                    -- upvalues: l_v84_0 (ref), l_UI_0 (ref), l_Functions_0 (ref), l_l_Donor_0_0 (ref), v96 (copy), l_v88_0 (ref)
                                    local l_l_v84_0_0 = l_v84_0;
                                    local v98 = false;
                                    local v99 = l_UI_0.Make("Window", {
                                        Name = "CapeTexture", 
                                        Title = "Texture Preview", 
                                        Size = {
                                            200, 
                                            250
                                        }, 
                                        Ready = true, 
                                        OnClose = function() --[[ Line: 680 ]] --[[ Name: OnClose ]]
                                            -- upvalues: v98 (ref)
                                            v98 = true;
                                        end
                                    });
                                    local v100 = v99:Add("ImageLabel", {
                                        BackgroundTransparency = 1, 
                                        Image = ("rbxassetid://%*"):format((l_Functions_0.GetTexture(l_v84_0))), 
                                        Size = UDim2.new(1, -10, 1, -80), 
                                        Position = UDim2.new(0, 5, 0, 35)
                                    });
                                    local v101 = 0;
                                    v99:Add("TextBox", {
                                        Text = l_v84_0, 
                                        Size = UDim2.new(1, -10, 0, 30), 
                                        Position = UDim2.new(0, 5, 0, 5), 
                                        TextChanged = function(v102, _, v104) --[[ Line: 697 ]] --[[ Name: TextChanged ]]
                                            -- upvalues: v101 (ref), l_l_v84_0_0 (ref), v100 (copy), l_Functions_0 (ref)
                                            local v105 = math.random();
                                            v101 = v105;
                                            delay(0.5, function() --[[ Line: 702 ]]
                                                -- upvalues: v101 (ref), v105 (copy), v102 (copy), l_l_v84_0_0 (ref), v100 (ref), l_Functions_0 (ref), v104 (copy)
                                                if v101 == v105 then
                                                    local v106 = tonumber(v102);
                                                    if v106 then
                                                        l_l_v84_0_0 = v106;
                                                        v100.Image = ("rbxassetid://%*"):format((l_Functions_0.GetTexture(v106)));
                                                        return;
                                                    else
                                                        v104.Text = l_l_v84_0_0;
                                                    end;
                                                end;
                                            end);
                                        end
                                    });
                                    v99:Add("TextButton", {
                                        Text = "Select", 
                                        Size = UDim2.new(1, -10, 0, 30), 
                                        Position = UDim2.new(0, 5, 1, -35), 
                                        OnClick = function(_) --[[ Line: 720 ]] --[[ Name: OnClick ]]
                                            -- upvalues: l_v84_0 (ref), l_l_v84_0_0 (ref), l_l_Donor_0_0 (ref), v96 (ref), v98 (ref), v99 (copy), l_v88_0 (ref)
                                            l_v84_0 = l_l_v84_0_0;
                                            l_l_Donor_0_0.Cape.Image = l_l_v84_0_0;
                                            v96.Text = l_l_v84_0_0;
                                            v98 = true;
                                            v99:Close();
                                            l_v88_0();
                                        end
                                    });
                                end);
                            end
                        }
                    }
                });
                local v108 = {
                    "Perks you get here: "
                };
                local v109 = {
                    "Customizable Cape (see above)", 
                    "Access to !cape", 
                    "Access to !uncape"
                };
                local v110 = {
                    "Access to !sparkles <BrickColor>", 
                    "Access to !unsparkles", 
                    "Access to !particle <textureID> <startColor3> <endColor3>", 
                    "Access to !unparticle", 
                    "Access to !fire <BrickColor>", 
                    "Access to !unfire", 
                    "Access to !light <BrickColor>", 
                    "Access to !unlight", 
                    "Access to !avataritem/!hat/!shirt/!pants <ID>", 
                    "Access to !myhats", 
                    "Access to !removehat <name>", 
                    "Access to !removehats", 
                    "Access to !neon <BrickColor>", 
                    "Access to !removetshirt"
                };
                if v63.DonorCapes then
                    for _, v112 in ipairs(v109) do
                        table.insert(v108, v112);
                    end;
                else
                    table.insert(v108, "Donor capes are disabled here");
                end;
                if v63.DonorCommands then
                    for _, v114 in ipairs(v110) do
                        table.insert(v108, v114);
                    end;
                else
                    table.insert(v108, "Donor commands are disabled here");
                end;
                v67:Add("ScrollingFrame", {
                    Size = UDim2.new(1, -145, 1, -115), 
                    Position = UDim2.new(0, 5, 0, 110)
                }):GenerateList(v108, {
                    TextXAlignment = "Left"
                });
                local v115 = v67:Add("Frame", {
                    Size = UDim2.new(0, 140, 1, -110), 
                    Position = UDim2.new(1, -140, 0, 105), 
                    BackgroundTransparency = 1
                });
                v115:Add("TextButton", {
                    Text = "Donate (Perks)", 
                    Size = UDim2.new(1, -10, 0, 40), 
                    Position = UDim2.new(0, 5, 0, 5), 
                    BackgroundTransparency = 0.5, 
                    BackgroundColor3 = Color3.fromRGB(231, 6, 141), 
                    OnClick = function() --[[ Line: 797 ]] --[[ Name: OnClick ]]
                        -- upvalues: v31 (copy)
                        v31(true, 1348327);
                    end
                });
                v115:Add("TextLabel", {
                    Text = "Extra (No Perks): ", 
                    TextXAlignment = "Left", 
                    Size = UDim2.new(1, 0, 0, 30), 
                    Position = UDim2.new(0, 5, 1, -80), 
                    BackgroundTransparency = 1
                });
                v115:Add("TextButton", {
                    Text = "50", 
                    Size = UDim2.new(0, 60, 0, 20), 
                    Position = UDim2.new(0, 5, 1, -50), 
                    BackgroundTransparency = 0.7, 
                    BackgroundColor3 = Color3.new(0, 1, 0):lerp(Color3.new(1, 0, 0), 0.1), 
                    OnClick = function() --[[ Line: 816 ]] --[[ Name: OnClick ]]
                        -- upvalues: v31 (copy)
                        v31(true, 5212076);
                    end
                });
                v115:Add("TextButton", {
                    Text = "100", 
                    Size = UDim2.new(0, 60, 0, 20), 
                    Position = UDim2.new(0.5, 5, 1, -50), 
                    BackgroundTransparency = 0.5, 
                    BackgroundColor3 = Color3.new(0, 1, 0):lerp(Color3.new(1, 0, 0), 0.3), 
                    OnClick = function() --[[ Line: 827 ]] --[[ Name: OnClick ]]
                        -- upvalues: v31 (copy)
                        v31(true, 5212077);
                    end
                });
                v115:Add("TextButton", {
                    Text = "500", 
                    Size = UDim2.new(0, 60, 0, 20), 
                    Position = UDim2.new(0, 5, 1, -25), 
                    BackgroundTransparency = 0.5, 
                    BackgroundColor3 = Color3.new(0, 1, 0):lerp(Color3.new(1, 0, 0), 0.6), 
                    OnClick = function() --[[ Line: 838 ]] --[[ Name: OnClick ]]
                        -- upvalues: v31 (copy)
                        v31(true, 5212081);
                    end
                });
                v115:Add("TextButton", {
                    Text = "1000", 
                    Size = UDim2.new(0, 60, 0, 20), 
                    Position = UDim2.new(0.5, 5, 1, -25), 
                    BackgroundTransparency = 0.5, 
                    BackgroundColor3 = Color3.new(0, 1, 0):lerp(Color3.new(1, 0, 0), 0.9), 
                    OnClick = function() --[[ Line: 849 ]] --[[ Name: OnClick ]]
                        -- upvalues: v31 (copy)
                        v31(true, 5212082);
                    end
                });
            end;
            l_Donor_0 = nil;
            v83 = nil;
            v84 = nil;
            v85 = nil;
            v86 = nil;
            v88 = false;
            local v116 = nil;
            local v117 = nil;
            local v118 = nil;
            local v119 = "";
            local v120 = false;
            local v121 = nil;
            local v122 = nil;
            local v123 = v68:Add("ScrollingFrame", {
                Size = UDim2.new(1, -10, 1, -60), 
                Position = UDim2.new(0, 5, 0, 30), 
                BackgroundTransparency = 0.5
            });
            local v124 = v68:Add("TextBox", {
                Size = UDim2.new(1, -10, 0, 20), 
                Position = UDim2.new(0, 5, 0, 5), 
                BackgroundTransparency = 0.5, 
                BorderSizePixel = 0, 
                TextColor3 = Color3.new(1, 1, 1), 
                Text = "", 
                PlaceholderText = "Search", 
                TextStrokeTransparency = 0.8
            });
            local l_v123_0 = v123 --[[ copy: 42 -> 53 ]];
            do
                local l_l_Donor_0_1, l_v83_0, l_v84_1, l_v85_1, l_v86_1, l_v88_1, l_v116_0, l_v117_0, l_v118_0, l_v119_0, l_v120_0, l_v121_0, l_v122_0 = l_Donor_0, v83, v84, v85, v86, v88, v116, v117, v118, v119, v120, v121, v122;
                local function v143() --[[ Line: 888 ]] --[[ Name: getBinds ]]
                    -- upvalues: l_v83_0 (ref), l_v123_0 (copy), l_Variables_0 (copy), l_KeyCodeToName_0 (copy), l_v88_1 (ref), l_v85_1 (ref), l_v84_1 (ref), l_v86_1 (ref)
                    local v139 = 0;
                    l_v83_0 = nil;
                    l_v123_0:ClearAllChildren();
                    for v140, v141 in l_Variables_0.KeyBinds do
                        l_v123_0:Add("TextButton", {
                            Text = ("Key: %* | Command: %*"):format(string.upper(l_KeyCodeToName_0(v140)), v141), 
                            Size = UDim2.new(1, 0, 0, 25), 
                            Position = UDim2.new(0, 0, 0, v139 * 25), 
                            OnClicked = function(v142) --[[ Line: 898 ]] --[[ Name: OnClicked ]]
                                -- upvalues: l_v83_0 (ref), l_v88_1 (ref), v140 (copy), v141 (copy), l_v85_1 (ref), l_v84_1 (ref), l_v86_1 (ref)
                                if l_v83_0 then
                                    l_v83_0.Button.BackgroundTransparency = 0;
                                    if l_v88_1 then
                                        l_v83_0.Button.AutoButtonColor = true;
                                    end;
                                end;
                                if not l_v83_0 or l_v83_0.Button ~= v142 then
                                    v142.BackgroundTransparency = 0.5;
                                    if l_v88_1 then
                                        v142.AutoButtonColor = false;
                                    end;
                                    l_v83_0 = {
                                        Key = v140, 
                                        Command = v141, 
                                        Button = v142
                                    };
                                    l_v85_1.TextTransparency = l_v84_1;
                                    l_v86_1.TextTransparency = l_v84_1;
                                    if l_v88_1 then
                                        l_v85_1.AutoButtonColor = true;
                                        l_v86_1.AutoButtonColor = true;
                                        return;
                                    end;
                                else
                                    l_v83_0 = nil;
                                    l_v85_1.TextTransparency = 0.5;
                                    l_v86_1.TextTransparency = 0.5;
                                    if l_v88_1 then
                                        l_v85_1.AutoButtonColor = false;
                                        l_v86_1.AutoButtonColor = false;
                                    end;
                                end;
                            end
                        });
                        v139 = v139 + 1;
                    end;
                    l_v123_0:ResizeCanvas(false, true);
                end;
                local l_v124_0 = v124 --[[ copy: 43 -> 54 ]];
                local l_v143_0 = v143 --[[ copy: 44 -> 55 ]];
                v124.Changed:Connect(function() --[[ Line: 937 ]]
                    -- upvalues: l_v124_0 (copy), l_v123_0 (copy), l_v143_0 (copy)
                    if l_v124_0.Text ~= "" then
                        local v146 = 0;
                        for _, v148 in pairs(l_v123_0:GetChildren()) do
                            if string.find(v148.Text, l_v124_0.Text) ~= nil then
                                v148.Visible = true;
                                v148.Position = UDim2.new(0, 0, 0, v146 * 25);
                                v146 = v146 + 1;
                            else
                                v148.Visible = false;
                            end;
                        end;
                        l_v123_0:ResizeCanvas(false, true);
                        return;
                    else
                        l_v143_0();
                        return;
                    end;
                end);
                local v149 = nil;
                v149 = v68:Add("Frame", {
                    Visible = false, 
                    Size = UDim2.new(0, 220, 0, 150), 
                    Position = UDim2.new(0.5, -100, 0.5, -100), 
                    Children = {
                        {
                            Class = "TextLabel", 
                            Text = "Command:", 
                            Position = UDim2.new(0, 0, 0, 10), 
                            Size = UDim2.new(1, 0, 0, 20), 
                            BackgroundTransparency = 1
                        }, 
                        {
                            Class = "TextLabel", 
                            Text = "Key:", 
                            Position = UDim2.new(0, 0, 0, 65), 
                            Size = UDim2.new(1, 0, 0, 20), 
                            BackgroundTransparency = 1
                        }, 
                        {
                            Class = "TextButton", 
                            Text = "Add", 
                            Position = UDim2.new(0.5, 0, 1, -30), 
                            Size = UDim2.new(0.5, -20, 0, 20), 
                            BackgroundTransparency = 1, 
                            OnClicked = function() --[[ Line: 981 ]] --[[ Name: OnClicked ]]
                                -- upvalues: l_v120_0 (ref), l_v116_0 (ref), l_v122_0 (ref), l_v117_0 (ref), l_Functions_0 (copy), l_v121_0 (ref), v149 (ref), l_v143_0 (copy)
                                l_v120_0 = true;
                                if l_v116_0 then
                                    l_v122_0.Text = "Saving...";
                                    if l_v117_0 then
                                        l_Functions_0.RemoveKeyBind(l_v117_0);
                                        l_v117_0 = nil;
                                    end;
                                    l_Functions_0.AddKeyBind(l_v116_0.Value, l_v121_0.Text);
                                    l_v116_0 = nil;
                                end;
                                v149.Visible = false;
                                l_v120_0 = false;
                                l_v143_0();
                            end
                        }, 
                        {
                            Class = "TextButton", 
                            Text = "Cancel", 
                            Position = UDim2.new(0, 10, 1, -30), 
                            Size = UDim2.new(0.5, -20, 0, 20), 
                            BackgroundTransparency = 1, 
                            OnClicked = function() --[[ Line: 1005 ]] --[[ Name: OnClicked ]]
                                -- upvalues: l_v120_0 (ref), l_l_Donor_0_1 (ref), l_v116_0 (ref), v149 (ref), l_Variables_0 (copy), l_v118_0 (ref)
                                if not l_v120_0 then
                                    l_l_Donor_0_1 = true;
                                    l_v116_0 = nil;
                                    l_v120_0 = false;
                                    v149.Visible = false;
                                    l_Variables_0.WaitingForBind = false;
                                    if l_v118_0 then
                                        l_v118_0:Disconnect();
                                        l_v118_0 = nil;
                                    end;
                                end;
                            end
                        }
                    }
                });
                local v150 = "TextBox";
                local v154 = {
                    Position = UDim2.new(0, 10, 0, 35), 
                    Size = UDim2.new(1, -20, 0, 20), 
                    ClearTextOnFocus = false, 
                    PlaceholderText = ("%*refresh"):format(l_v61_0), 
                    TextChanged = function(v151, _, _) --[[ Line: 1027 ]] --[[ Name: TextChanged ]]
                        -- upvalues: l_v119_0 (ref)
                        l_v119_0 = v151;
                    end
                };
                l_v121_0 = v149:Add(v150, v154);
                v150 = "TextButton";
                v154 = {
                    Text = "Click To Bind", 
                    Position = UDim2.new(0, 10, 0, 90), 
                    Size = UDim2.new(1, -20, 0, 20), 
                    OnClicked = function(v155) --[[ Line: 1036 ]] --[[ Name: OnClicked ]]
                        -- upvalues: l_l_Donor_0_1 (ref), l_Variables_0 (copy), l_v118_0 (ref), v18 (copy), l_service_0 (copy), l_v116_0 (ref), l_KeyCodeToName_0 (copy)
                        l_l_Donor_0_1 = false;
                        v155.Text = "Waiting...";
                        l_Variables_0.WaitingForBind = true;
                        l_v118_0 = v18:BindEvent(l_service_0.UserInputService.InputBegan, function(v156) --[[ Line: 1040 ]]
                            -- upvalues: l_service_0 (ref), l_l_Donor_0_1 (ref), l_v116_0 (ref), v155 (copy), l_KeyCodeToName_0 (ref), l_Variables_0 (ref), l_v118_0 (ref)
                            if not l_service_0.UserInputService:GetFocusedTextBox() and not l_l_Donor_0_1 and rawequal(v156.UserInputType, Enum.UserInputType.Keyboard) then
                                l_v116_0 = v156.KeyCode;
                                if l_v116_0 then
                                    v155.Text = string.upper(l_KeyCodeToName_0(l_v116_0.Value));
                                    l_Variables_0.WaitingForBind = false;
                                    if l_v118_0 then
                                        l_v118_0:Disconnect();
                                        l_v118_0 = nil;
                                    end;
                                end;
                            end;
                        end);
                    end
                };
                l_v122_0 = v149:Add(v150, v154);
                l_v121_0.BackgroundColor3 = l_v121_0.BackgroundColor3:lerp(Color3.new(1, 1, 1), 0.1);
                l_v122_0.BackgroundColor3 = l_v121_0.BackgroundColor3;
                v149.BackgroundColor3 = v149.BackgroundColor3:lerp(Color3.new(1, 1, 1), 0.05);
                l_v86_1 = v68:Add("TextButton", {
                    Text = "Remove", 
                    Position = UDim2.new(0, 5, 1, -25), 
                    Size = UDim2.new(0.3333333333333333, -6, 0, 20), 
                    OnClicked = function(_) --[[ Line: 1065 ]] --[[ Name: OnClicked ]]
                        -- upvalues: l_v83_0 (ref), l_v120_0 (ref), l_Functions_0 (copy), l_v85_1 (ref), l_v86_1 (ref), l_v88_1 (ref), l_v143_0 (copy)
                        if l_v83_0 and not l_v120_0 then
                            l_v120_0 = true;
                            l_Functions_0.RemoveKeyBind(l_v83_0.Key);
                            l_v83_0 = nil;
                            l_v85_1.TextTransparency = 0.5;
                            l_v86_1.TextTransparency = 0.5;
                            if l_v88_1 then
                                l_v85_1.AutoButtonColor = false;
                                l_v86_1.AutoButtonColor = false;
                            end;
                            l_v143_0();
                            l_v120_0 = false;
                        end;
                    end
                });
                l_v85_1 = v68:Add("TextButton", {
                    Text = "Edit", 
                    Position = UDim2.new(0.3333333333333333, 0, 1, -25), 
                    Size = UDim2.new(0.3333333333333333, -1, 0, 20), 
                    OnClicked = function(_) --[[ Line: 1086 ]] --[[ Name: OnClicked ]]
                        -- upvalues: l_v83_0 (ref), l_v120_0 (ref), l_v116_0 (ref), l_v117_0 (ref), l_v122_0 (ref), l_KeyCodeToName_0 (copy), l_v121_0 (ref), v149 (ref)
                        if l_v83_0 and not l_v120_0 then
                            l_v116_0 = nil;
                            l_v117_0 = l_v83_0.Key;
                            l_v122_0.Text = string.upper(l_KeyCodeToName_0(l_v83_0.Key));
                            l_v121_0.Text = l_v83_0.Command;
                            v149.Visible = true;
                        end;
                    end
                });
                l_v84_1 = l_v86_1.TextTransparency;
                if l_v86_1.AutoButtonColor then
                    l_v88_1 = true;
                    l_v86_1.AutoButtonColor = false;
                    l_v85_1.AutoButtonColor = false;
                end;
                l_v86_1.TextTransparency = 0.5;
                l_v85_1.TextTransparency = 0.5;
                v68:Add("TextButton", {
                    Text = "Add", 
                    Position = UDim2.new(0.6666666666666666, 0, 1, -25), 
                    Size = UDim2.new(0.3333333333333333, -5, 0, 20), 
                    OnClicked = function() --[[ Line: 1110 ]] --[[ Name: OnClicked ]]
                        -- upvalues: l_v120_0 (ref), l_v117_0 (ref), l_v116_0 (ref), l_v122_0 (ref), l_v121_0 (ref), v149 (ref)
                        if not l_v120_0 then
                            l_v117_0 = nil;
                            l_v116_0 = nil;
                            l_v122_0.Text = "Click To Bind";
                            l_v121_0.Text = "";
                            v149.Visible = true;
                        end;
                    end
                });
                v143();
            end;
            l_Donor_0 = nil;
            v83 = nil;
            v84 = nil;
            v85 = nil;
            v86 = nil;
            v88 = false;
            v116 = nil;
            v117 = nil;
            v118 = "";
            v119 = false;
            v120 = nil;
            v121 = nil;
            v122 = v69:Add("TextBox", {
                Size = UDim2.new(1, -10, 0, 20), 
                Position = UDim2.new(0, 5, 0, 5), 
                BackgroundTransparency = 0.5, 
                BorderSizePixel = 0, 
                TextColor3 = Color3.new(1, 1, 1), 
                Text = "", 
                PlaceholderText = "Search", 
                TextStrokeTransparency = 0.8
            });
            v123 = v69:Add("ScrollingFrame", {
                Size = UDim2.new(1, -10, 1, -60), 
                Position = UDim2.new(0, 5, 0, 30), 
                BackgroundTransparency = 0.5
            });
            do
                local l_l_Donor_0_2, l_v83_1, l_v84_2, l_v85_2, l_v86_2, l_v88_2, l_v116_1, l_v117_1, l_v118_1, l_v119_1, l_v120_1, l_v121_1 = l_Donor_0, v83, v84, v85, v86, v88, v116, v117, v118, v119, v120, v121;
                v124 = function() --[[ Line: 1156 ]] --[[ Name: getAliases ]]
                    -- upvalues: l_v83_1 (ref), v123 (copy), l_Variables_0 (copy), l_v88_2 (ref), l_v85_2 (ref), l_v84_2 (ref), l_v86_2 (ref)
                    local v171 = 0;
                    l_v83_1 = nil;
                    v123:ClearAllChildren();
                    for v172, v173 in l_Variables_0.Aliases do
                        v123:Add("TextButton", {
                            Text = ("Alias: %* | Command: %*"):format(v172, v173), 
                            Size = UDim2.new(1, 0, 0, 25), 
                            Position = UDim2.new(0, 0, 0, v171 * 25), 
                            OnClicked = function(v174) --[[ Line: 1166 ]] --[[ Name: OnClicked ]]
                                -- upvalues: l_v83_1 (ref), l_v88_2 (ref), v172 (copy), v173 (copy), l_v85_2 (ref), l_v84_2 (ref), l_v86_2 (ref)
                                if l_v83_1 then
                                    l_v83_1.Button.BackgroundTransparency = 0;
                                    if l_v88_2 then
                                        l_v83_1.Button.AutoButtonColor = true;
                                    end;
                                end;
                                if not l_v83_1 or l_v83_1.Button ~= v174 then
                                    v174.BackgroundTransparency = 0.5;
                                    if l_v88_2 then
                                        v174.AutoButtonColor = false;
                                    end;
                                    l_v83_1 = {
                                        Alias = v172, 
                                        Command = v173, 
                                        Button = v174
                                    };
                                    l_v85_2.TextTransparency = l_v84_2;
                                    l_v86_2.TextTransparency = l_v84_2;
                                    if l_v88_2 then
                                        l_v85_2.AutoButtonColor = true;
                                        l_v86_2.AutoButtonColor = true;
                                        return;
                                    end;
                                else
                                    l_v83_1 = nil;
                                    l_v85_2.TextTransparency = 0.5;
                                    l_v86_2.TextTransparency = 0.5;
                                    if l_v88_2 then
                                        l_v85_2.AutoButtonColor = false;
                                        l_v86_2.AutoButtonColor = false;
                                    end;
                                end;
                            end
                        });
                        v171 = v171 + 1;
                    end;
                    v123:ResizeCanvas(false, true);
                end;
                v122.Changed:Connect(function() --[[ Line: 1204 ]]
                    -- upvalues: v122 (copy), v123 (copy), v124 (copy)
                    if v122.Text ~= "" then
                        local v175 = 0;
                        for _, v177 in pairs(v123:GetChildren()) do
                            if string.find(v177.Text, v122.Text) ~= nil then
                                v177.Visible = true;
                                v177.Position = UDim2.new(0, 0, 0, v175 * 25);
                                v175 = v175 + 1;
                            else
                                v177.Visible = false;
                            end;
                        end;
                        v123:ResizeCanvas(false, true);
                        return;
                    else
                        v124();
                        return;
                    end;
                end);
                local v178 = nil;
                v178 = v69:Add("Frame", {
                    Visible = false, 
                    Size = UDim2.new(0, 200, 0, 150), 
                    Position = UDim2.new(0.5, -100, 0.5, -100), 
                    Children = {
                        {
                            Class = "TextLabel", 
                            Text = "Command:", 
                            Position = UDim2.new(0, 0, 0, 10), 
                            Size = UDim2.new(1, 0, 0, 20), 
                            BackgroundTransparency = 1
                        }, 
                        {
                            Class = "TextLabel", 
                            Text = "Alias:", 
                            Position = UDim2.new(0, 0, 0, 65), 
                            Size = UDim2.new(1, 0, 0, 20), 
                            BackgroundTransparency = 1
                        }, 
                        {
                            Class = "TextButton", 
                            Text = "Add", 
                            Position = UDim2.new(0.5, 0, 1, -30), 
                            Size = UDim2.new(0.5, -20, 0, 20), 
                            BackgroundTransparency = 1, 
                            OnClicked = function() --[[ Line: 1248 ]] --[[ Name: OnClicked ]]
                                -- upvalues: l_v121_1 (ref), l_v119_1 (ref), l_v120_1 (ref), l_v117_1 (ref), l_Functions_0 (copy), l_v116_1 (ref), v178 (ref), v124 (copy)
                                local l_Text_0 = l_v121_1.Text;
                                l_v119_1 = true;
                                if l_Text_0 ~= "" and l_v120_1.Text ~= "" then
                                    l_v121_1.Text = "Saving...";
                                    if l_v117_1 then
                                        l_Functions_0.RemoveAlias(l_v117_1);
                                        l_v117_1 = nil;
                                    end;
                                    l_Functions_0.AddAlias(l_Text_0, l_v120_1.Text);
                                    l_v116_1 = nil;
                                end;
                                v178.Visible = false;
                                l_v119_1 = false;
                                v124();
                            end
                        }, 
                        {
                            Class = "TextButton", 
                            Text = "Cancel", 
                            Position = UDim2.new(0, 10, 1, -30), 
                            Size = UDim2.new(0.5, -20, 0, 20), 
                            BackgroundTransparency = 1, 
                            OnClicked = function() --[[ Line: 1274 ]] --[[ Name: OnClicked ]]
                                -- upvalues: l_v119_1 (ref), l_l_Donor_0_2 (ref), l_v116_1 (ref), l_v117_1 (ref), v178 (ref)
                                if not l_v119_1 then
                                    l_l_Donor_0_2 = true;
                                    l_v116_1 = nil;
                                    l_v117_1 = nil;
                                    l_v119_1 = false;
                                    v178.Visible = false;
                                end;
                            end
                        }
                    }
                });
                local v180 = "TextBox";
                local v184 = {
                    Position = UDim2.new(0, 10, 0, 35), 
                    PlaceholderText = ("%*fly <arg1> | %*god <arg1>"):format(l_v61_0, l_v61_0), 
                    Size = UDim2.new(1, -20, 0, 20), 
                    ClearTextOnFocus = false, 
                    TextChanged = function(v181, _, _) --[[ Line: 1292 ]] --[[ Name: TextChanged ]]
                        -- upvalues: l_v118_1 (ref)
                        l_v118_1 = v181;
                    end
                };
                l_v120_1 = v178:Add(v180, v184);
                v180 = "TextBox";
                v184 = {
                    Text = "", 
                    PlaceholderText = ("%*flygod"):format(l_v61_0), 
                    ClearTextOnFocus = false, 
                    Position = UDim2.new(0, 10, 0, 90), 
                    Size = UDim2.new(1, -20, 0, 20)
                };
                l_v121_1 = v178:Add(v180, v184);
                l_v120_1.BackgroundColor3 = l_v120_1.BackgroundColor3:lerp(Color3.new(1, 1, 1), 0.1);
                l_v121_1.BackgroundColor3 = l_v120_1.BackgroundColor3;
                v178.BackgroundColor3 = v178.BackgroundColor3:lerp(Color3.new(1, 1, 1), 0.05);
                l_v86_2 = v69:Add("TextButton", {
                    Text = "Remove", 
                    Position = UDim2.new(0, 5, 1, -25), 
                    Size = UDim2.new(0.3333333333333333, -6, 0, 20), 
                    OnClicked = function(_) --[[ Line: 1313 ]] --[[ Name: OnClicked ]]
                        -- upvalues: l_v83_1 (ref), l_v119_1 (ref), l_Functions_0 (copy), l_v85_2 (ref), l_v86_2 (ref), l_v88_2 (ref), v124 (copy)
                        if l_v83_1 and not l_v119_1 then
                            l_v119_1 = true;
                            l_Functions_0.RemoveAlias(l_v83_1.Alias);
                            l_v83_1 = nil;
                            l_v85_2.TextTransparency = 0.5;
                            l_v86_2.TextTransparency = 0.5;
                            if l_v88_2 then
                                l_v85_2.AutoButtonColor = false;
                                l_v86_2.AutoButtonColor = false;
                            end;
                            v124();
                            l_v119_1 = false;
                        end;
                    end
                });
                l_v85_2 = v69:Add("TextButton", {
                    Text = "Edit", 
                    Position = UDim2.new(0.3333333333333333, 0, 1, -25), 
                    Size = UDim2.new(0.3333333333333333, -1, 0, 20), 
                    OnClicked = function(_) --[[ Line: 1334 ]] --[[ Name: OnClicked ]]
                        -- upvalues: l_v83_1 (ref), l_v119_1 (ref), l_v116_1 (ref), l_v117_1 (ref), l_v121_1 (ref), l_v120_1 (ref), v178 (ref)
                        if l_v83_1 and not l_v119_1 then
                            l_v116_1 = nil;
                            l_v117_1 = l_v83_1.Alias;
                            l_v121_1.Text = l_v117_1;
                            l_v120_1.Text = l_v83_1.Command;
                            v178.Visible = true;
                        end;
                    end
                });
                l_v84_2 = l_v86_2.TextTransparency;
                if l_v86_2.AutoButtonColor then
                    l_v88_2 = true;
                    l_v86_2.AutoButtonColor = false;
                    l_v85_2.AutoButtonColor = false;
                end;
                l_v86_2.TextTransparency = 0.5;
                l_v85_2.TextTransparency = 0.5;
                v69:Add("TextButton", {
                    Text = "Add", 
                    Position = UDim2.new(0.6666666666666666, 0, 1, -25), 
                    Size = UDim2.new(0.3333333333333333, -5, 0, 20), 
                    OnClicked = function() --[[ Line: 1358 ]] --[[ Name: OnClicked ]]
                        -- upvalues: l_v119_1 (ref), l_v116_1 (ref), l_v117_1 (ref), l_v121_1 (ref), l_v120_1 (ref), v178 (ref)
                        if not l_v119_1 then
                            l_v116_1 = nil;
                            l_v117_1 = nil;
                            l_v121_1.Text = "";
                            l_v120_1.Text = "";
                            v178.Visible = true;
                        end;
                    end
                });
                v124();
            end;
            l_Donor_0 = {
                {
                    Text = "Keybinds: ", 
                    Desc = "- Enables/Disables Keybinds", 
                    Entry = "Boolean", 
                    Value = l_Variables_0.KeybindsEnabled, 
                    Function = function(v187, v188) --[[ Line: 1380 ]] --[[ Name: Function ]]
                        -- upvalues: l_Variables_0 (copy), l_Remote_0 (copy)
                        l_Variables_0.KeybindsEnabled = v187;
                        local l_Text_1 = v188.Text;
                        v188.Text = "Saving..";
                        l_Remote_0.Get("UpdateClient", "KeybindsEnabled", v187);
                        v188.Text = l_Text_1;
                    end
                }, 
                {
                    Text = "UI Keep Alive: ", 
                    Desc = "- Prevents Adonis UI deletion on death", 
                    Entry = "Boolean", 
                    Value = l_Variables_0.UIKeepAlive, 
                    Function = function(v190, v191) --[[ Line: 1393 ]] --[[ Name: Function ]]
                        -- upvalues: l_Variables_0 (copy), l_Remote_0 (copy)
                        l_Variables_0.UIKeepAlive = v190;
                        local l_Text_2 = v191.Text;
                        v191.Text = "Saving..";
                        l_Remote_0.Get("UpdateClient", "UIKeepAlive", v190);
                        v191.Text = l_Text_2;
                    end
                }, 
                {
                    Text = "Particle Effects: ", 
                    Desc = "- Enables/Disables Adonis made particles", 
                    Entry = "Boolean", 
                    Value = l_Variables_0.ParticlesEnabled, 
                    Function = function(v193, v194) --[[ Line: 1406 ]] --[[ Name: Function ]]
                        -- upvalues: l_Variables_0 (copy), l_Functions_0 (copy), l_Remote_0 (copy)
                        l_Variables_0.ParticlesEnabled = v193;
                        if v193 then
                            l_Functions_0.EnableParticles(true);
                        else
                            l_Functions_0.EnableParticles(false);
                        end;
                        local l_Text_3 = v194.Text;
                        v194.Text = "Saving..";
                        l_Remote_0.Get("UpdateClient", "ParticlesEnabled", v193);
                        v194.Text = l_Text_3;
                    end
                }, 
                {
                    Text = "Capes: ", 
                    Desc = "- Allows you to disable all player capes locally", 
                    Entry = "Boolean", 
                    Value = l_Variables_0.CapesEnabled, 
                    Function = function(v196, v197) --[[ Line: 1426 ]] --[[ Name: Function ]]
                        -- upvalues: l_Variables_0 (copy), l_Functions_0 (copy), l_service_0 (copy), l_Remote_0 (copy)
                        l_Variables_0.CapesEnabled = v196;
                        if v196 then
                            l_Functions_0.HideCapes(false);
                        else
                            l_Functions_0.HideCapes(true);
                        end;
                        if v196 then
                            l_Functions_0.MoveCapes();
                        else
                            l_service_0.StopLoop("CapeMover");
                        end;
                        local l_Text_4 = v197.Text;
                        v197.Text = "Saving..";
                        l_Remote_0.Get("UpdateClient", "CapesEnabled", v196);
                        v197.Text = l_Text_4;
                    end
                }, 
                {
                    Text = "Hide Chat Commands: ", 
                    Desc = "- Hide your commands run from the chat from others", 
                    Entry = "Boolean", 
                    Setting = "HideChatCommands", 
                    Value = l_Variables_0.HideChatCommands or false, 
                    Function = function(v199, v200) --[[ Line: 1453 ]] --[[ Name: Function ]]
                        -- upvalues: l_Variables_0 (copy), l_Remote_0 (copy)
                        l_Variables_0.HideChatCommands = v199;
                        local l_Text_5 = v200.Text;
                        v200.Text = "Saving..";
                        l_Remote_0.Get("UpdateClient", "HideChatCommands", v199);
                        v200.Text = l_Text_5;
                    end
                }, 
                {
                    Text = "Console Key: ", 
                    Desc = "- Key used to open the console", 
                    Entry = "Keybind", 
                    Value = l_Functions_0.KeyCodeToName(Enum.KeyCode[l_Variables_0.CustomConsoleKey or l_Remote_0.Get("Setting", "ConsoleKeyCode") or "Unknown"].Value), 
                    Function = function(v202) --[[ Line: 1482 ]] --[[ Name: Function ]]
                        -- upvalues: l_service_0 (copy), l_Functions_0 (copy), l_Variables_0 (copy), l_Remote_0 (copy)
                        l_service_0.Debounce("CliSettingKeybinder", function() --[[ Line: 1483 ]]
                            -- upvalues: v202 (copy), l_service_0 (ref), l_Functions_0 (ref), l_Variables_0 (ref), l_Remote_0 (ref)
                            local v203 = nil;
                            local v204 = nil;
                            v202.Text = "Waiting...";
                            local v208 = l_service_0.UserInputService.InputBegan:Connect(function(v205) --[[ Line: 1486 ]]
                                -- upvalues: l_service_0 (ref), v203 (ref), v204 (ref), l_Functions_0 (ref)
                                if not l_service_0.UserInputService:GetFocusedTextBox() and rawequal(v205.UserInputType, Enum.UserInputType.Keyboard) then
                                    local l_Name_0 = v205.KeyCode.Name;
                                    local v207 = l_Functions_0.KeyCodeToName(v205.KeyCode.Value);
                                    v203 = l_Name_0;
                                    v204 = v207;
                                end;
                            end);
                            repeat
                                task.wait();
                            until v203;
                            l_Variables_0.CustomConsoleKey = v203;
                            v208:Disconnect();
                            v202.Text = "Saving..";
                            l_Remote_0.Get("UpdateClient", "CustomConsoleKey", l_Variables_0.CustomConsoleKey);
                            v202.Text = v204;
                        end);
                    end
                }, 
                {
                    Text = "Theme: ", 
                    Desc = "- Allows you to set the Adonis UI theme", 
                    Entry = "DropDown", 
                    Setting = "CustomTheme", 
                    Value = l_Variables_0.CustomTheme or "Game Theme", 
                    Options = (function() --[[ Line: 1509 ]]
                        -- upvalues: l_client_0 (copy)
                        local v209 = {
                            "Game Theme"
                        };
                        for _, v211 in ipairs(l_client_0.UIFolder:GetChildren()) do
                            local v212 = string.sub(v211.Name, 1, 5) == "NoEnv" and string.sub(v211.Name, 7) or v211.Name;
                            if v212 ~= "README" and v211:GetAttribute("Hidden") ~= true then
                                table.insert(v209, v212);
                            end;
                        end;
                        return v209;
                    end)(), 
                    Function = function(v213) --[[ Line: 1519 ]] --[[ Name: Function ]]
                        -- upvalues: l_Variables_0 (copy), l_Remote_0 (copy), v18 (copy), l_UI_0 (copy)
                        if v213 == "Game Theme" then
                            l_Variables_0.CustomTheme = nil;
                            l_Remote_0.Get("UpdateClient", "CustomTheme", nil);
                        else
                            l_Variables_0.CustomTheme = v213;
                            l_Remote_0.Get("UpdateClient", "CustomTheme", v213);
                        end;
                        task.delay(0.029, function() --[[ Line: 1527 ]]
                            -- upvalues: v18 (ref), l_UI_0 (ref)
                            v18:Close();
                            l_UI_0.Make("UserPanel", {
                                Tab = "Client"
                            });
                        end);
                    end
                }
            };
            v83 = 0;
            for v214, v215 in ipairs(l_Donor_0) do
                v117 = v70:Add("TextLabel", {
                    Text = ("  %*"):format(v215.Text), 
                    ToolTip = v215.Desc, 
                    TextXAlignment = "Left", 
                    Size = UDim2.new(1, -10, 0, 30), 
                    Position = UDim2.new(0, 5, 0, v83 * 30 + 5), 
                    BackgroundTransparency = v214 % 2 == 0 and 0 or 0.2
                });
                if v215.Entry == "Boolean" then
                    v117:Add("Boolean", {
                        Size = UDim2.new(0, 120, 1, 0), 
                        Position = UDim2.new(1, -120, 0, 0), 
                        Enabled = v215.Value, 
                        OnToggle = v215.Function, 
                        BackgroundTransparency = 1
                    });
                elseif v215.Entry == "Keybind" then
                    v117:Add("TextButton", {
                        Text = tostring(v215.Value), 
                        Size = UDim2.new(0, 120, 1, 0), 
                        Position = UDim2.new(1, -120, 0, 0), 
                        OnClick = v215.Function, 
                        BackgroundTransparency = 1
                    });
                elseif v215.Entry == "DropDown" then
                    v117:Add("Dropdown", {
                        Size = UDim2.new(0, 120, 1, 0), 
                        Position = UDim2.new(1, -120, 0, 0), 
                        Selected = v215.Value, 
                        OnSelect = v215.Function, 
                        Options = v215.Options, 
                        BackgroundTransparency = 1
                    });
                end;
                v83 = v83 + 1;
            end;
            v70:ResizeCanvas(false, true);
            if v64 then
                l_Donor_0 = v64.Settings;
                v83 = v64.Ranks;
                v84 = v64.Descs;
                v85 = v64.Order;
                v71:Add("TextLabel", {
                    Text = "  Clear all saved settings: ", 
                    ToolTip = "Clears all saved settings", 
                    BackgroundTransparency = 0.2, 
                    Size = UDim2.new(1, -10, 0, 30), 
                    Position = UDim2.new(0, 5, 0, 5), 
                    TextXAlignment = "Left", 
                    Children = {
                        TextButton = {
                            Text = "Clear", 
                            Size = UDim2.new(0, 100, 1, 0), 
                            Position = UDim2.new(1, -100, 0, 0), 
                            BackgroundTransparency = 1, 
                            OnClick = function() --[[ Line: 1614 ]] --[[ Name: OnClick ]]
                                -- upvalues: l_Remote_0 (copy)
                                l_Remote_0.Send("ClearSavedSettings");
                            end
                        }
                    }
                });
                v86 = 1;
                for _, v217 in v85 do
                    v86 = v86 + 1;
                    v120 = l_Donor_0[v217];
                    v121 = v84[v217];
                    if v217 ~= "" and (v217 ~= " " or v120 ~= nil) then
                        if v120 == nil then
                            v71:Add("TextLabel", {
                                Text = ("  %*: "):format(v217), 
                                ToolTip = v121, 
                                BackgroundTransparency = v86 % 2 == 0 and 0 or 0.2, 
                                Size = UDim2.new(1, -10, 0, 30), 
                                Position = UDim2.new(0, 5, 0, 30 * (v86 - 1) + 5), 
                                TextXAlignment = "Left", 
                                Children = {
                                    TextLabel = {
                                        Text = "Studio Only", 
                                        Size = UDim2.new(0, 100, 1, 0), 
                                        Position = UDim2.new(1, -100, 0, 0), 
                                        TextTransparency = 0.5, 
                                        BackgroundTransparency = 1
                                    }
                                }
                            });
                        elseif type(v120) == "table" then
                            if v217 == "Ranks" then
                                v86 = v86 - 1;
                                for v218, v219 in v120 do
                                    v86 = v86 + 1;
                                    if string.match(v218, "^[WebPanel]") or string.match(v218, "^[Trello]") or v219.Level >= 900 then
                                        v71:Add("TextLabel", {
                                            Text = ("  %*: "):format(v218), 
                                            ToolTip = ("Permission Level: %*"):format(v219.Level), 
                                            BackgroundTransparency = v86 % 2 == 0 and 0 or 0.2, 
                                            Size = UDim2.new(1, -10, 0, 30), 
                                            Position = UDim2.new(0, 5, 0, 30 * (v86 - 1) + 5), 
                                            TextXAlignment = "Left", 
                                            Children = {
                                                TextLabel = {
                                                    Text = "Studio Only", 
                                                    Size = UDim2.new(0, 100, 1, 0), 
                                                    Position = UDim2.new(1, -100, 0, 0), 
                                                    TextTransparency = 0.5, 
                                                    BackgroundTransparency = 1
                                                }
                                            }
                                        });
                                    else
                                        v71:Add("TextLabel", {
                                            Text = ("  %*: "):format(v218), 
                                            ToolTip = ("Permission Level: %*"):format(v219.Level), 
                                            BackgroundTransparency = v86 % 2 == 0 and 0 or 0.2, 
                                            Size = UDim2.new(1, -10, 0, 30), 
                                            Position = UDim2.new(0, 5, 0, 30 * (v86 - 1) + 5), 
                                            TextXAlignment = "Left", 
                                            Children = {
                                                TextButton = {
                                                    Text = "Open", 
                                                    Size = UDim2.new(0, 100, 1, 0), 
                                                    Position = UDim2.new(1, -100, 0, 0), 
                                                    BackgroundTransparency = 1, 
                                                    OnClick = function() --[[ Line: 1685 ]] --[[ Name: OnClick ]]
                                                        -- upvalues: v60 (copy), v219 (copy), v218 (copy)
                                                        v60(v219.Users, {
                                                            "Settings", 
                                                            "Ranks", 
                                                            v218, 
                                                            "Users"
                                                        });
                                                    end
                                                }
                                            }
                                        });
                                    end;
                                end;
                            elseif not v0[v217] then
                                v71:Add("TextLabel", {
                                    Text = ("  %*: "):format(v217), 
                                    ToolTip = v121, 
                                    BackgroundTransparency = v86 % 2 == 0 and 0 or 0.2, 
                                    Size = UDim2.new(1, -10, 0, 30), 
                                    Position = UDim2.new(0, 5, 0, 30 * (v86 - 1) + 5), 
                                    TextXAlignment = "Left", 
                                    Children = {
                                        TextLabel = {
                                            Text = "Studio Only", 
                                            Size = UDim2.new(0, 100, 1, 0), 
                                            Position = UDim2.new(1, -100, 0, 0), 
                                            TextTransparency = 0.5, 
                                            BackgroundTransparency = 1
                                        }
                                    }
                                });
                            else
                                v71:Add("TextLabel", {
                                    Text = ("  %*: "):format(v217), 
                                    ToolTip = v121, 
                                    BackgroundTransparency = v86 % 2 == 0 and 0 or 0.2, 
                                    Size = UDim2.new(1, -10, 0, 30), 
                                    Position = UDim2.new(0, 5, 0, 30 * (v86 - 1) + 5), 
                                    TextXAlignment = "Left", 
                                    Children = {
                                        TextButton = {
                                            Text = "Open", 
                                            Size = UDim2.new(0, 100, 1, 0), 
                                            Position = UDim2.new(1, -100, 0, 0), 
                                            BackgroundTransparency = 1, 
                                            OnClick = function() --[[ Line: 1725 ]] --[[ Name: OnClick ]]
                                                -- upvalues: v60 (copy), v120 (copy), v217 (copy)
                                                v60(v120, v217);
                                            end
                                        }
                                    }
                                });
                            end;
                        elseif type(v120) == "boolean" then
                            v71:Add("TextLabel", {
                                Text = ("  %*: "):format(v217), 
                                ToolTip = v121, 
                                BackgroundTransparency = v86 % 2 == 0 and 0 or 0.2, 
                                Size = UDim2.new(1, -10, 0, 30), 
                                Position = UDim2.new(0, 5, 0, 30 * (v86 - 1) + 5), 
                                TextXAlignment = "Left", 
                                Children = {
                                    Boolean = {
                                        Enabled = v120, 
                                        Size = UDim2.new(0, 100, 1, 0), 
                                        Position = UDim2.new(1, -100, 0, 0), 
                                        BackgroundTransparency = 1, 
                                        OnToggle = function(v220, _) --[[ Line: 1746 ]] --[[ Name: OnToggle ]]
                                            -- upvalues: l_Remote_0 (copy), v217 (copy)
                                            l_Remote_0.Send("SaveSetSetting", v217, v220);
                                        end
                                    }
                                }
                            });
                        elseif type(v120) == "string" or type(v120) == "number" then
                            v71:Add("TextLabel", {
                                Text = ("  %*: "):format(v217), 
                                ToolTip = v121, 
                                BackgroundTransparency = v86 % 2 == 0 and 0 or 0.2, 
                                Size = UDim2.new(1, -10, 0, 30), 
                                Position = UDim2.new(0, 5, 0, 30 * (v86 - 1) + 5), 
                                TextXAlignment = "Left", 
                                Children = {
                                    TextBox = {
                                        Text = v120, 
                                        Size = UDim2.new(0, 100, 1, 0), 
                                        Position = UDim2.new(1, -100, 0, 0), 
                                        BackgroundTransparency = 1, 
                                        TextChanged = function(v222, v223, _) --[[ Line: 1767 ]] --[[ Name: TextChanged ]]
                                            -- upvalues: l_Remote_0 (copy), v217 (copy)
                                            if v223 then
                                                l_Remote_0.Send("SaveSetSetting", v217, v222);
                                            end;
                                        end
                                    }
                                }
                            });
                        end;
                    end;
                end;
                v71:ResizeCanvas(false, true, false, false, 5, 5);
            else
                v71:Disable();
            end;
            v17 = v18.gTable;
            v18:Ready();
        end;
    end;
end;