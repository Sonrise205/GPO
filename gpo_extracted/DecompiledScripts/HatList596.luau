local v0 = nil;
local v1 = nil;
client = v0;
service = v1;
return function(v2, v3) --[[ Line: 3 ]]
    if v3 then
        setfenv(1, v3);
    end;
    local l_LocalPlayer_0 = service.Players.LocalPlayer;
    local v5 = client.UI.Make("Window", {
        Name = "HatList", 
        Title = "Hats", 
        Icon = client.MatIcons["Format list bulleted"], 
        Size = {
            320, 
            220
        }, 
        MinSize = {
            280, 
            150
        }
    });
    local v6 = {};
    local function v7() --[[ Line: 20 ]] --[[ Name: generate ]]
        -- upvalues: v5 (copy), l_LocalPlayer_0 (copy), v6 (copy), v7 (copy), v2 (copy)
        task.wait(0.3);
        v5:ClearAllChildren();
        if not l_LocalPlayer_0.Character then
            return;
        else
            for _, v9 in pairs(v6) do
                if v9 then
                    v9:Disconnect();
                end;
            end;
            table.insert(v6, l_LocalPlayer_0.Character.ChildAdded:Connect(v7));
            table.insert(v6, l_LocalPlayer_0.Character.ChildRemoved:Connect(v7));
            local v10 = 0;
            for _, v12 in pairs(service.Players.LocalPlayer.Character:GetChildren()) do
                if v12:IsA("Accoutrement") then
                    v5:Add("TextLabel", {
                        Name = v12.Name, 
                        Size = UDim2.new(1, -10, 0, 30), 
                        Position = UDim2.fromOffset(5, v10 * 30), 
                        BackgroundTransparency = 1, 
                        TextXAlignment = "Left", 
                        Text = ("  %*"):format(if v12.Name:sub(-9) == "Accessory" then v12.Name:sub(1, -10) else v12.Name), 
                        ToolTip = v12.ClassName, 
                        Children = {
                            {
                                Class = "TextButton", 
                                Size = UDim2.new(0, 80, 1, -4), 
                                Position = UDim2.new(1, -82, 0, 2), 
                                Text = "Remove", 
                                OnClick = function(v13) --[[ Line: 44 ]] --[[ Name: OnClick ]]
                                    -- upvalues: v2 (ref), v12 (copy)
                                    if not v13.Active then
                                        return;
                                    else
                                        v13.Active = false;
                                        client.Remote.Send("ProcessCommand", (("%*removehat%*%*"):format(v2.PlayerPrefix, v2.SplitKey, v12.Name)));
                                        v13.Parent:TweenSize(UDim2.fromOffset(0, 30), "Out", "Quint", 0.4);
                                        task.wait(0.3);
                                        if v13 and not v12 then
                                            v13.Parent:Destroy();
                                            return;
                                        else
                                            v13.Parent:TweenSize(UDim2.new(1, -10, 0, 30), "Out", "Quint", 0.4);
                                            return;
                                        end;
                                    end;
                                end
                            }
                        }
                    });
                    v10 = v10 + 1;
                end;
            end;
            v5:SetTitle((("Hats (%*)"):format(v10)));
            if v10 > 0 then
                v5:Add("TextButton", {
                    Size = UDim2.new(1, -10, 0, 25), 
                    Position = UDim2.fromOffset(5, v10 * 30 + 5), 
                    Text = "Remove All", 
                    OnClick = function() --[[ Line: 67 ]] --[[ Name: OnClick ]]
                        -- upvalues: v2 (ref)
                        client.Remote.Send("ProcessCommand", (("%*removehats"):format(v2.PlayerPrefix)));
                    end
                });
            end;
            v5:ResizeCanvas(false, true, false, false, 5, 5);
            return;
        end;
    end;
    v7();
    l_LocalPlayer_0.CharacterAdded:Connect(v7);
    l_LocalPlayer_0.CharacterRemoving:Connect(v7);
    v5:Ready();
end;