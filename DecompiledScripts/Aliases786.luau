local v0 = nil;
local v1 = nil;
client = v0;
service = v1;
return function(v2, v3) --[[ Line: 5 ]]
    if v3 then
        setfenv(1, v3);
    end;
    local v4 = nil;
    local v5 = client.UI.Make("Window", {
        Name = "Aliases", 
        Title = "Alias Editor", 
        Size = {
            420, 
            240
        }, 
        AllowMultiple = false
    });
    for v6, v7 in {
        Alias = "", 
        Args = {
            Names = {}, 
            Defaults = {}
        }, 
        Command = "", 
        Description = ""
    } do
        if not v2[v6] then
            v2[v6] = v7;
        end;
    end;
    if v5 then
        local v8 = v5:Add("ScrollingFrame", {
            BackgroundColor3 = Color3.fromRGB(31, 31, 31):lerp(Color3.new(1, 1, 1), 0.2), 
            Size = UDim2.new(1, -10, 1, -10), 
            Position = UDim2.new(0, 5, 0, 5)
        });
        local v9 = v8:Add("ScrollingFrame", {
            Size = UDim2.new(1, -10, 1, -35), 
            Position = UDim2.new(0, 5, 0, 5), 
            BackgroundTransparency = 0.5
        });
        local v10 = nil;
        local v11 = nil;
        local v12 = nil;
        local v13 = nil;
        local v14 = nil;
        do
            local l_v10_0, l_v11_0, l_v12_0, l_v13_0, l_v14_0 = v10, v11, v12, v13, v14;
            l_v14_0 = v5:Add("Frame", {
                Visible = false, 
                Size = UDim2.new(0, 200, 0, 150), 
                Position = UDim2.new(0.5, -100, 0.5, -75), 
                Children = {
                    {
                        Class = "TextLabel", 
                        Text = "Argument Name:", 
                        Position = UDim2.new(0, 0, 0, 10), 
                        Size = UDim2.new(1, 0, 0, 20), 
                        BackgroundTransparency = 1
                    }, 
                    {
                        Class = "TextLabel", 
                        Text = "Default:", 
                        Position = UDim2.new(0, 0, 0, 65), 
                        Size = UDim2.new(1, 0, 0, 20), 
                        BackgroundTransparency = 1
                    }, 
                    {
                        Class = "TextButton", 
                        Text = "Save", 
                        Position = UDim2.new(0.5, 0, 1, -30), 
                        Size = UDim2.new(0.5, -20, 0, 20), 
                        BackgroundTransparency = 1, 
                        OnClicked = function() --[[ Line: 71 ]] --[[ Name: OnClicked ]]
                            -- upvalues: l_v13_0 (ref), v2 (copy), l_v11_0 (ref), l_v12_0 (ref), l_v10_0 (ref), l_v14_0 (ref)
                            if l_v13_0 == 0 then
                                table.insert(v2.Args.Names, l_v11_0);
                                table.insert(v2.Args.Defaults, l_v12_0 or "");
                            else
                                v2.Args.Names[l_v13_0] = l_v11_0;
                                v2.Args.Defaults[l_v13_0] = l_v12_0 or "";
                            end;
                            l_v10_0();
                            l_v11_0 = nil;
                            l_v12_0 = nil;
                            l_v14_0.Visible = false;
                        end
                    }
                }
            });
            local v20 = {
                Class = "TextButton", 
                Text = "Remove", 
                Position = UDim2.new(0, 10, 1, -30), 
                Size = UDim2.new(0.5, -20, 0, 20), 
                BackgroundTransparency = 1, 
                OnClicked = function() --[[ Line: 94 ]] --[[ Name: OnClicked ]]
                    -- upvalues: l_v13_0 (ref), v2 (copy), l_v10_0 (ref), l_v11_0 (ref), l_v12_0 (ref), l_v14_0 (ref)
                    if l_v13_0 ~= 0 then
                        table.remove(v2.Args.Names, l_v13_0);
                        table.remove(v2.Args.Defaults, l_v13_0);
                    end;
                    l_v10_0();
                    l_v11_0 = nil;
                    l_v12_0 = nil;
                    l_v14_0.Visible = false;
                end
            };
            local v21 = l_v14_0:Add(v20);
            local v22 = "TextBox";
            local v26 = {
                Text = l_v11_0 or "name", 
                Position = UDim2.new(0, 10, 0, 35), 
                Size = UDim2.new(1, -20, 0, 20), 
                TextChanged = function(v23, _, _) --[[ Line: 110 ]] --[[ Name: TextChanged ]]
                    -- upvalues: l_v11_0 (ref)
                    l_v11_0 = v23;
                end
            };
            local v27 = l_v14_0:Add(v22, v26);
            v26 = "TextBox";
            local v31 = {
                Text = l_v12_0 or "", 
                Position = UDim2.new(0, 10, 0, 90), 
                Size = UDim2.new(1, -20, 0, 20), 
                TextChanged = function(v28, _, _) --[[ Line: 119 ]] --[[ Name: TextChanged ]]
                    -- upvalues: l_v12_0 (ref)
                    l_v12_0 = v28;
                end
            };
            v20 = l_v14_0:Add(v26, v31);
            l_v14_0.BackgroundColor3 = l_v14_0.BackgroundColor3:lerp(Color3.new(1, 1, 1), 0.05);
            v27.BackgroundColor3 = v27.BackgroundColor3:lerp(Color3.new(1, 1, 1), 0.1);
            v20.BackgroundColor3 = v27.BackgroundColor3;
            v22 = function(v32) --[[ Line: 128 ]] --[[ Name: showArgBox ]]
                -- upvalues: l_v14_0 (ref), l_v11_0 (ref), l_v12_0 (ref), l_v13_0 (ref), v21 (copy), v27 (copy), v20 (copy)
                if not l_v14_0.Visible then
                    if v32 then
                        l_v11_0 = v32.Name;
                        l_v12_0 = v32.Default;
                    end;
                    if l_v13_0 == 0 then
                        v21.Text = "Cancel";
                    else
                        v21.Text = "Remove";
                    end;
                    v27.Text = l_v11_0 or "name";
                    v20.Text = l_v12_0 or "";
                    l_v14_0.Visible = true;
                end;
            end;
            l_v10_0 = function() --[[ Line: 145 ]] --[[ Name: draw ]]
                -- upvalues: v9 (copy), v2 (copy), l_v13_0 (ref), v22 (copy), v8 (copy), v5 (copy)
                v9:ClearAllChildren();
                local v33 = 1;
                v9:Add("TextLabel", {
                    Text = "  Alias: ", 
                    ToolTip = "Set the alias Adonis should check for in chat", 
                    BackgroundTransparency = v33 % 2 == 0 and 0 or 0.2, 
                    Size = UDim2.new(1, -10, 0, 30), 
                    Position = UDim2.new(0, 5, 0, (v33 - 1) * 30 + 5), 
                    TextXAlignment = "Left", 
                    Children = {
                        [v2.ExistingAlias and "TextLabel" or "TextBox"] = {
                            Text = v2.Alias or "", 
                            Size = UDim2.new(0, 200, 1, 0), 
                            Position = UDim2.new(1, -200, 0, 0), 
                            BackgroundTransparency = 1, 
                            TextChanged = not v2.ExistingAlias and function(v34, _, _) --[[ Line: 162 ]]
                                -- upvalues: v2 (ref)
                                v2.Alias = v34;
                            end or nil
                        }
                    }
                });
                v33 = v33 + 1;
                v9:Add("TextLabel", {
                    Text = "  Command: ", 
                    ToolTip = "Set the command(s) Adonis should execute when finding the alias", 
                    BackgroundTransparency = v33 % 2 == 0 and 0 or 0.2, 
                    Size = UDim2.new(1, -10, 0, 30), 
                    Position = UDim2.new(0, 5, 0, (v33 - 1) * 30 + 5), 
                    TextXAlignment = "Left", 
                    Children = {
                        TextBox = {
                            Text = v2.Command or "", 
                            Size = UDim2.new(0, 200, 1, 0), 
                            Position = UDim2.new(1, -200, 0, 0), 
                            BackgroundTransparency = 1, 
                            TextChanged = function(v37, _, _) --[[ Line: 182 ]] --[[ Name: TextChanged ]]
                                -- upvalues: v2 (ref)
                                v2.Command = v37;
                            end
                        }
                    }
                });
                v33 = v33 + 1;
                v9:Add("TextLabel", {
                    Text = "  Description: ", 
                    ToolTip = "What does the alias do?", 
                    BackgroundTransparency = v33 % 2 == 0 and 0 or 0.2, 
                    Size = UDim2.new(1, -10, 0, 30), 
                    Position = UDim2.new(0, 5, 0, (v33 - 1) * 30 + 5), 
                    TextXAlignment = "Left", 
                    Children = {
                        TextBox = {
                            Text = v2.Description or "", 
                            Size = UDim2.new(0, 200, 1, 0), 
                            Position = UDim2.new(1, -200, 0, 0), 
                            BackgroundTransparency = 1, 
                            TextChanged = function(v40, _, _) --[[ Line: 202 ]] --[[ Name: TextChanged ]]
                                -- upvalues: v2 (ref)
                                v2.Description = v40;
                            end
                        }
                    }
                });
                v33 = v33 + 2;
                v9:Add("TextButton", {
                    Text = "Add Argument", 
                    BackgroundTransparency = v33 % 2 == 0 and 0 or 0.2, 
                    Size = UDim2.new(1, -10, 0, 30), 
                    Position = UDim2.new(0, 5, 0, (v33 - 1) * 30 + 5), 
                    OnClicked = function(_) --[[ Line: 214 ]] --[[ Name: OnClicked ]]
                        -- upvalues: l_v13_0 (ref), v22 (ref)
                        l_v13_0 = 0;
                        v22();
                    end
                });
                for v44, v45 in ipairs(v2.Args.Names) do
                    v33 = v33 + 1;
                    v9:Add("TextButton", {
                        Text = ("Argument: %* | Default: %*"):format(v45, v2.Args.Defaults[v44]), 
                        BackgroundTransparency = v33 % 2 == 0 and 0 or 0.2, 
                        Size = UDim2.new(1, -10, 0, 30), 
                        Position = UDim2.new(0, 5, 0, (v33 - 1) * 30 + 5), 
                        OnClicked = function(_) --[[ Line: 226 ]] --[[ Name: OnClicked ]]
                            -- upvalues: l_v13_0 (ref), v44 (copy), v22 (ref), v45 (copy), v2 (ref)
                            l_v13_0 = v44;
                            v22({
                                Name = v45, 
                                Default = v2.Args.Defaults[v44]
                            });
                        end
                    });
                end;
                v9:ResizeCanvas(false, true, false, false, 5, 5);
                v8:Add("TextButton", {
                    Text = "Cancel", 
                    Position = UDim2.new(0, 5, 1, -25), 
                    Size = UDim2.new(0.3333333333333333, -8, 0, 20), 
                    OnClicked = function(_) --[[ Line: 239 ]] --[[ Name: OnClicked ]]
                        -- upvalues: v5 (ref)
                        v5:Close();
                    end
                });
                v8:Add("TextButton", {
                    Text = "Remove", 
                    Position = UDim2.new(0.3333333333333333, 3, 1, -25), 
                    Size = UDim2.new(0.3333333333333333, -7, 0, 20), 
                    OnClicked = function(_) --[[ Line: 248 ]] --[[ Name: OnClicked ]]
                        -- upvalues: v2 (ref), v5 (ref)
                        if v2.ExistingAlias then
                            client.Functions.RemoveAlias(v2.Alias);
                            client.UI.Remove("UserPanel");
                            client.UI.Make("UserPanel", {
                                Tab = "Aliases"
                            });
                        end;
                        v5:Close();
                    end
                });
                v8:Add("TextButton", {
                    Text = "Save", 
                    Position = UDim2.new(0.6666666666666666, 3, 1, -25), 
                    Size = UDim2.new(0.3333333333333333, -8, 0, 20), 
                    OnClicked = function(_) --[[ Line: 262 ]] --[[ Name: OnClicked ]]
                        -- upvalues: v2 (ref), v5 (ref)
                        if v2.Alias == "" or v2.Command == "" then
                            client.UI.Make("Output", {
                                Message = "A required field is missing!"
                            });
                            return;
                        else
                            client.Functions.SetAlias(v2.Alias, v2);
                            client.UI.Remove("UserPanel");
                            client.UI.Make("UserPanel", {
                                Tab = "Aliases"
                            });
                            v5:Close();
                            return;
                        end;
                    end
                });
            end;
            l_v10_0();
            v4 = v5.gTable;
            v5:Ready();
        end;
    end;
end;