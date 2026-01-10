local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_PlayerGui_0 = l_LocalPlayer_0:WaitForChild("PlayerGui");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local v5 = require(l_Modules_0.Trove);
local l_Shared_0 = l_Modules_0.Shared;
local _ = require(l_Shared_0.GameUtils);
local l_Events_0 = l_ReplicatedStorage_0:WaitForChild("Events");
local v9 = {
    Initialized = false
};
v9.Initialize = function(v10) --[[ Line: 18 ]] --[[ Name: Initialize ]]
    -- upvalues: v9 (copy), l_PlayerGui_0 (copy), l_LocalPlayer_0 (copy), l_Events_0 (copy), v5 (copy)
    if v9.Initialized then
        return;
    else
        local _ = v10:GetStatsFolder():WaitForChild("Gamepasses"):WaitForChild("FruitBag");
        local l_Store_0 = l_PlayerGui_0:WaitForChild("StoreFruit", 360):WaitForChild("Store");
        local l_Text_0 = l_Store_0:WaitForChild("Text");
        l_Store_0.Visible = false;
        local function v16() --[[ Line: 33 ]] --[[ Name: Refresh ]]
            -- upvalues: l_LocalPlayer_0 (ref), l_Text_0 (copy), l_Store_0 (copy)
            local l_Tool_0 = l_LocalPlayer_0.Character:FindFirstChildOfClass("Tool");
            local v15 = "Store Fruit";
            if l_Tool_0 and l_Tool_0.Name == "Dark Root" then
                v15 = "Store Dark Root";
            end;
            l_Text_0.Text = v15;
            if l_Tool_0 and l_Tool_0:FindFirstChild("FruitEater") then
                l_Store_0.Visible = true;
                return;
            else
                l_Store_0.Visible = false;
                return;
            end;
        end;
        l_Store_0.MouseButton1Click:Connect(function() --[[ Line: 50 ]]
            -- upvalues: l_LocalPlayer_0 (ref), l_Text_0 (copy), l_Events_0 (ref)
            local l_Character_0 = l_LocalPlayer_0.Character;
            if l_Character_0 == nil then
                return;
            else
                local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                if l_Humanoid_0 == nil then
                    return;
                elseif l_Humanoid_0.Health <= 0 then
                    return;
                else
                    local l_Tool_1 = l_Character_0:FindFirstChildOfClass("Tool");
                    local v20 = l_Tool_1 and l_Tool_1:FindFirstChild("FruitEater");
                    local v21 = "Store Fruit";
                    if l_Tool_1 and l_Tool_1.Name == "Dark Root" then
                        v21 = "Store Dark Root";
                    end;
                    local v22 = _G.HasItem(l_LocalPlayer_0, "Prestige Fruitbag");
                    local v23 = "One";
                    local v24 = "";
                    local v25 = _G.fruitsInStorage(l_LocalPlayer_0, l_Tool_1.Name);
                    if v22 == false then
                        v24 = "<Color=/> Discard your <Color=Orange>{fruitsStored[1]}<Color=/> in inventory by equiping it and dropping or buy a <Color=Green>Fruit Bag<Color=/> to store another fruit!";
                    else
                        v23 = "Two";
                    end;
                    if #v25 >= 1 and v22 == false then
                        _G.displayMessage((("<Color=Red>You can only store %* fruit at a time.<Color=/> Discard your <Color=Orange>%*<Color=/> in inventory by equiping it and dropping or buy a <Color=Green>Fruit Bag<Color=/> to store another fruit!"):format(v23, v25[1])));
                        return;
                    elseif l_Tool_1 and v20 and v20.Busy.Value == true then
                        l_Text_0.Text = "BUSY";
                        task.wait(0.2);
                        l_Text_0.Text = v21;
                        return;
                    else
                        l_Text_0.Text = "Storing...";
                        l_Events_0.FruitStorage:InvokeServer(true);
                        l_Text_0.Text = v21;
                        return;
                    end;
                end;
            end;
        end);
        local v26 = v5.new();
        local function v28(v27) --[[ Line: 93 ]] --[[ Name: CharacterAdded ]]
            -- upvalues: l_Store_0 (copy), v26 (copy), v16 (copy)
            l_Store_0.Visible = false;
            v26:Clean();
            v26:Add(v27.ChildAdded:Connect(v16));
            v26:Add(v27.ChildRemoved:Connect(v16));
        end;
        local v29 = l_LocalPlayer_0.Character or l_LocalPlayer_0.CharacterAdded:Wait();
        l_Store_0.Visible = false;
        v26:Clean();
        v26:Add(v29.ChildAdded:Connect(v16));
        v26:Add(v29.ChildRemoved:Connect(v16));
        l_LocalPlayer_0.CharacterAdded:Connect(v28);
        v9.Initialized = true;
        return;
    end;
end;
return v9;