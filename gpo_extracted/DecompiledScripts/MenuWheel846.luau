local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_PlayerGui_0 = l_Players_0.LocalPlayer:WaitForChild("PlayerGui");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local _ = require(l_Modules_0.Leveling);
local l_Shared_0 = l_Modules_0.Shared;
local _ = require(l_Shared_0.GameUtils);
local l_SoundUtils_0 = require(l_Shared_0:WaitForChild("SoundUtils"));
local v10 = require(l_Modules_0.Client.Notification);
local l_Events_0 = l_ReplicatedStorage_0:WaitForChild("Events");
local v12 = {
    Initialized = false
};
v12.Initialize = function(v13) --[[ Line: 23 ]] --[[ Name: Initialize ]]
    -- upvalues: v12 (copy), l_PlayerGui_0 (copy), l_SoundUtils_0 (copy), l_TweenService_0 (copy), v10 (copy), l_Events_0 (copy), l_UserInputService_0 (copy)
    if v12.Initialized then
        return;
    else
        local v14 = l_PlayerGui_0:WaitForChild("MenuWheel", 360);
        local l_Main_0 = v14:WaitForChild("Main");
        local l_Background_0 = l_Main_0:WaitForChild("Background");
        local l_Buttons_0 = l_Main_0:WaitForChild("Buttons");
        local l_Middle_0 = l_Buttons_0:WaitForChild("Middle");
        local l_Title_0 = l_Main_0:WaitForChild("Title");
        local v20 = {};
        local v21 = os.clock();
        local v22 = false;
        local v23 = false;
        local v24 = "None";
        local v25 = nil;
        local v26 = {};
        local function v29() --[[ Line: 46 ]] --[[ Name: OpenWheelMenu ]]
            -- upvalues: v14 (copy), l_SoundUtils_0 (ref), l_Main_0 (copy), l_TweenService_0 (ref), l_Background_0 (copy), l_Middle_0 (copy), l_Title_0 (copy), v20 (copy)
            v14.Enabled = true;
            l_SoundUtils_0.PlaySound("MenuOpen", {
                SoundCategory = "UI"
            });
            l_Main_0.Rotation = math.random(90, 180);
            l_TweenService_0:Create(l_Main_0, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0), {
                Rotation = 0
            }):Play();
            l_TweenService_0:Create(l_Background_0, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                Size = UDim2.new(0.35, 0, 0.35, 0)
            }):Play();
            task.wait(0.1);
            l_Middle_0:TweenSize(UDim2.new(0.3, 0, 0.3, 0), "Out", "Quad", 0.1, true);
            task.wait(0.1);
            l_TweenService_0:Create(l_Title_0, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                Size = UDim2.new(0.1, 0, 0.039, 0)
            }):Play();
            for v27, v28 in pairs(v20) do
                if v27 ~= l_Middle_0 then
                    v27.Visible = true;
                    v27:TweenSizeAndPosition(v28.OriginalSize, v28.OriginalPosition, "Out", "Quad", 0.25, true);
                end;
            end;
        end;
        local function v32() --[[ Line: 94 ]] --[[ Name: CloseWheelMenu ]]
            -- upvalues: l_SoundUtils_0 (ref), l_TweenService_0 (ref), l_Main_0 (copy), l_Title_0 (copy), v20 (copy), l_Middle_0 (copy), l_Background_0 (copy), v14 (copy)
            l_SoundUtils_0.PlaySound("MenuClose", {
                SoundCategory = "UI"
            });
            l_TweenService_0:Create(l_Main_0, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0), {
                Rotation = -math.random(90, 180)
            }):Play();
            l_TweenService_0:Create(l_Title_0, TweenInfo.new(0.1, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                Size = UDim2.new(0, 0, 0, 0)
            }):Play();
            for v30, _ in pairs(v20) do
                if v30 ~= l_Middle_0 then
                    v30:TweenSizeAndPosition(UDim2.new(0, 0, 0, 0), l_Middle_0.Position, "Out", "Quad", 0.1, true);
                    task.delay(0.1, function() --[[ Line: 122 ]]
                        -- upvalues: v30 (copy)
                        v30.Visible = false;
                    end);
                end;
            end;
            task.wait(0.1);
            l_Middle_0:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Quad", 0.1, true);
            l_Background_0:TweenSizeAndPosition(UDim2.new(0, 0, 0, 0), l_Background_0.Position, "Out", "Quad", 0.1, true);
            task.delay(0.1, function() --[[ Line: 130 ]]
                -- upvalues: v14 (ref)
                v14.Enabled = false;
            end);
        end;
        local function _() --[[ Line: 135 ]] --[[ Name: CloseCurrentOpenedFrame ]]
            -- upvalues: v23 (ref), v26 (copy), v24 (ref), l_SoundUtils_0 (ref), v25 (ref)
            v23 = true;
            if v26[v24] then
                l_SoundUtils_0.PlaySound("MenuClose", {
                    SoundCategory = "UI"
                });
                v26[v24].Close();
            end;
            v24 = "None";
            v23 = false;
            v25 = nil;
        end;
        local function v34() --[[ Line: 154 ]] --[[ Name: SetMenuState ]]
            -- upvalues: v23 (ref), v24 (ref), v26 (copy), l_SoundUtils_0 (ref), v25 (ref), v21 (ref), v22 (ref), v32 (copy), v29 (copy)
            if v23 == true then
                return;
            elseif v24 ~= "None" then
                v23 = true;
                if v26[v24] then
                    l_SoundUtils_0.PlaySound("MenuClose", {
                        SoundCategory = "UI"
                    });
                    v26[v24].Close();
                end;
                v24 = "None";
                v23 = false;
                v25 = nil;
                return;
            elseif os.clock() - v21 < 0.25 then
                return;
            else
                v21 = os.clock();
                v22 = not v22;
                if v22 == false then
                    v32();
                    return;
                else
                    if v22 == true then
                        v29();
                    end;
                    return;
                end;
            end;
        end;
        local l_Statistics_0 = l_PlayerGui_0:WaitForChild("Statistics");
        local l_Main_1 = l_Statistics_0:WaitForChild("Main");
        local l_Size_0 = l_Main_1.Size;
        l_Main_1.Size = UDim2.new(0, 0, 0, 0);
        l_Statistics_0.Enabled = false;
        v26.Stats = {
            Open = function() --[[ Line: 184 ]] --[[ Name: Open ]]
                -- upvalues: v25 (ref), l_Main_1 (copy), l_Statistics_0 (copy), l_Size_0 (copy)
                v25 = l_Main_1;
                l_Statistics_0.Enabled = true;
                l_Main_1.Visible = true;
                l_Main_1.Size = UDim2.new(l_Size_0.X.Scale / 2, 0, l_Size_0.Y.Scale / 2, 0);
                l_Main_1:TweenSize(l_Size_0, "Out", "Quad", 0.25, true);
            end, 
            Close = function() --[[ Line: 193 ]] --[[ Name: Close ]]
                -- upvalues: l_Main_1 (copy), l_Statistics_0 (copy)
                l_Main_1:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Quad", 0.25, true);
                task.wait(0.25);
                l_Statistics_0.Enabled = false;
                l_Main_1.Visible = false;
            end
        };
        local l_Inventory_0 = l_PlayerGui_0:WaitForChild("Inventory");
        local l_Main_2 = l_Inventory_0:WaitForChild("Main");
        local l_Size_1 = l_Main_2.Size;
        l_Inventory_0.Enabled = false;
        task.spawn(function() --[[ Line: 209 ]]
            -- upvalues: l_PlayerGui_0 (ref)
            if l_PlayerGui_0:WaitForChild("TouchGui"):WaitForChild("TouchControlFrame"):WaitForChild("JumpButton").Size == UDim2.new(0, 120, 0, 120) then

            end;
        end);
        v26.Inventory = {
            Open = function() --[[ Line: 220 ]] --[[ Name: Open ]]
                -- upvalues: v25 (ref), l_Main_2 (copy), l_Inventory_0 (copy), l_Size_1 (copy)
                v25 = l_Main_2;
                l_Inventory_0.Enabled = true;
                l_Main_2.Visible = true;
                l_Main_2.Size = UDim2.new(l_Size_1.X.Scale / 2, 0, l_Size_1.Y.Scale / 2, 0);
                l_Main_2:TweenSize(l_Size_1, "Out", "Quad", 0.25, true);
            end, 
            Close = function() --[[ Line: 229 ]] --[[ Name: Close ]]
                -- upvalues: l_Main_2 (copy), l_Inventory_0 (copy)
                l_Main_2:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Quad", 0.25, true);
                task.wait(0.25);
                l_Inventory_0.Enabled = false;
                l_Main_2.Visible = false;
            end
        };
        local l_Settings_0 = l_PlayerGui_0:WaitForChild("Settings");
        local l_Main_3 = l_Settings_0:WaitForChild("Main");
        local l_Size_2 = l_Main_3.Size;
        l_Settings_0.Enabled = false;
        v26.Settings = {
            Open = function() --[[ Line: 247 ]] --[[ Name: Open ]]
                -- upvalues: v25 (ref), l_Main_3 (copy), l_Settings_0 (copy), l_Size_2 (copy)
                v25 = l_Main_3;
                l_Settings_0.Enabled = true;
                l_Main_3.Visible = true;
                l_Main_3.Size = UDim2.new(l_Size_2.X.Scale / 2, 0, l_Size_2.Y.Scale / 2, 0);
                l_Main_3:TweenSize(l_Size_2, "Out", "Quad", 0.25, true);
            end, 
            Close = function() --[[ Line: 256 ]] --[[ Name: Close ]]
                -- upvalues: l_Main_3 (copy), l_Settings_0 (copy)
                l_Main_3:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Quad", 0.25, true);
                task.wait(0.25);
                l_Settings_0.Enabled = false;
                l_Main_3.Visible = false;
            end
        };
        local l_Shop_0 = l_PlayerGui_0:WaitForChild("Shop");
        local l_Main_4 = l_Shop_0:WaitForChild("Main");
        local l_Size_3 = l_Main_4.Size;
        l_Main_4.Size = UDim2.new(0, 0, 0, 0);
        l_Shop_0.Enabled = false;
        v26.Shop = {
            Open = function() --[[ Line: 274 ]] --[[ Name: Open ]]
                -- upvalues: v10 (ref), v25 (ref), l_Main_4 (copy), l_Shop_0 (copy), l_Size_3 (copy)
                repeat
                    task.wait();
                until _G.arena ~= nil;
                if _G.arena == true then
                    v10.DisplayMessage("Can not use shop in this universe!");
                    return;
                else
                    v25 = l_Main_4;
                    l_Shop_0.Enabled = true;
                    l_Main_4.Visible = true;
                    l_Main_4.Size = UDim2.new(l_Size_3.X.Scale / 2, 0, l_Size_3.Y.Scale / 2, 0);
                    l_Main_4:TweenSize(l_Size_3, "Out", "Quad", 0.25, true);
                    return;
                end;
            end, 
            Close = function() --[[ Line: 292 ]] --[[ Name: Close ]]
                -- upvalues: l_Main_4 (copy), l_Shop_0 (copy)
                l_Main_4:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Quad", 0.25, true);
                task.wait(0.25);
                l_Shop_0.Enabled = false;
                l_Main_4.Visible = false;
            end
        };
        local l_Crews_0 = l_PlayerGui_0:WaitForChild("Crews");
        local l_Main_5 = l_Crews_0:WaitForChild("Main");
        local l_Size_4 = l_Main_5.Size;
        l_Main_5.Size = UDim2.new(0, 0, 0, 0);
        l_Crews_0.Enabled = false;
        v26.Crew = {
            Open = function() --[[ Line: 310 ]] --[[ Name: Open ]]
                -- upvalues: v10 (ref), v25 (ref), l_Main_5 (copy), l_Crews_0 (copy), l_Size_4 (copy)
                repeat
                    task.wait();
                until _G.arena ~= nil;
                if _G.arena == true then
                    v10.DisplayMessage("Can not use crews in this universe!");
                    return;
                else
                    v25 = l_Main_5;
                    l_Crews_0.Enabled = true;
                    l_Main_5.Visible = true;
                    l_Main_5.Size = UDim2.new(l_Size_4.X.Scale / 2, 0, l_Size_4.Y.Scale / 2, 0);
                    l_Main_5:TweenSize(l_Size_4, "Out", "Quad", 0.25, true);
                    return;
                end;
            end, 
            Close = function() --[[ Line: 328 ]] --[[ Name: Close ]]
                -- upvalues: l_Main_5 (copy), l_Crews_0 (copy)
                l_Main_5:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Quad", 0.25, true);
                task.wait(0.25);
                l_Crews_0.Enabled = false;
                l_Main_5.Visible = false;
            end
        };
        v26.Boat = {
            OneClick = function() --[[ Line: 339 ]] --[[ Name: OneClick ]]
                -- upvalues: l_Events_0 (ref)
                l_Events_0.ShipEvents.Spawn:InvokeServer("true");
            end
        };
        l_Background_0.Size = UDim2.new(0, 0, 0, 0);
        l_Middle_0.Size = UDim2.new(0, 0, 0, 0);
        l_Title_0.Size = UDim2.new(0, 0, 0, 0);
        l_Main_0.Visible = true;
        local v50 = false;
        local v51 = false;
        for _, v53 in ipairs(l_Buttons_0:GetChildren()) do
            if v53:IsA("ImageButton") then
                local l_ImageLabel_0 = v53.ImageLabel;
                v53.MouseButton1Click:Connect(function() --[[ Line: 357 ]]
                    -- upvalues: v53 (copy), v51 (ref), v13 (copy), v32 (copy), v22 (ref), v50 (ref), v26 (copy), v24 (ref)
                    if v53.Size == UDim2.new(0, 0, 0, 0) then
                        return;
                    elseif v51 == true then
                        return;
                    else
                        v51 = true;
                        v13.UIUtils.ButtonEffect();
                        v32();
                        v22 = false;
                        v50 = true;
                        task.spawn(function() --[[ Line: 368 ]]
                            -- upvalues: v26 (ref), v53 (ref), v24 (ref)
                            if v26[v53.Name] then
                                if v26[v53.Name].OneClick then
                                    v26[v53.Name].OneClick();
                                    return;
                                else
                                    v24 = v53.Name;
                                    v26[v53.Name].Open();
                                    return;
                                end;
                            else
                                print("no menu func for", v53.Name);
                                return;
                            end;
                        end);
                        v51 = false;
                        task.wait(0.25);
                        v50 = false;
                        return;
                    end;
                end);
                l_ImageLabel_0.MouseEnter:Connect(function() --[[ Line: 387 ]]
                    -- upvalues: l_Title_0 (copy), v53 (copy)
                    l_Title_0.TextLabel.Text = v53.Name;
                    v53.Image = "http://www.roblox.com/asset/?id=15888186036";
                end);
                l_ImageLabel_0.MouseLeave:Connect(function() --[[ Line: 392 ]]
                    -- upvalues: v53 (copy)
                    v53.Image = "http://www.roblox.com/asset/?id=15913312197";
                end);
                v20[v53] = {
                    OriginalSize = v53.Size, 
                    OriginalPosition = v53.Position
                };
                v53.Position = l_Middle_0.Position;
                if v53 ~= l_Middle_0 then
                    v53.Size = UDim2.new(0, 0, 0, 0);
                    v53.Visible = false;
                end;
            end;
        end;
        local function v60(v55) --[[ Line: 407 ]] --[[ Name: IsClickPositionValid ]]
            -- upvalues: v25 (ref), v23 (ref), v50 (ref), v34 (copy)
            if v25 ~= nil and v23 == false and v50 == false then
                local v56 = v25.Parent:FindFirstChild("MouseFrame") or v25;
                local l_Position_0 = v55.Position;
                local l_AbsoluteSize_0 = v56.AbsoluteSize;
                local l_AbsolutePosition_0 = v56.AbsolutePosition;
                if l_Position_0.X > l_AbsolutePosition_0.X and l_Position_0.X < l_AbsolutePosition_0.X + l_AbsoluteSize_0.X and l_Position_0.Y > l_AbsolutePosition_0.Y and l_Position_0.Y < l_AbsolutePosition_0.Y + l_AbsoluteSize_0.Y then
                    return;
                else
                    v34();
                end;
            end;
        end;
        local v62 = {
            [Enum.UserInputType.MouseButton1] = v60, 
            [Enum.KeyCode.M] = function(_) --[[ Line: 428 ]]
                -- upvalues: v34 (copy)
                v34();
            end
        };
        l_UserInputService_0.InputBegan:Connect(function(v63, v64) --[[ Line: 433 ]]
            -- upvalues: v62 (copy)
            if v64 then
                return;
            else
                local l_UserInputType_0 = v63.UserInputType;
                local l_KeyCode_0 = v63.KeyCode;
                if v62[l_UserInputType_0] then
                    v62[l_UserInputType_0](v63);
                    return;
                else
                    if v62[l_KeyCode_0] then
                        v62[l_KeyCode_0](v63);
                    end;
                    return;
                end;
            end;
        end);
        v12.SetMenuState = v34;
        v12.Initialized = true;
        return;
    end;
end;
return v12;