local l_UserInputService_0 = game:GetService("UserInputService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_HttpService_0 = game:GetService("HttpService");
local l_Players_0 = game:GetService("Players");
local l_Shared_0 = l_ReplicatedStorage_0:WaitForChild("Modules"):WaitForChild("Shared");
local l_QueueTask_0 = require(l_Shared_0:WaitForChild("Queues"):WaitForChild("QueueTask"));
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v7 = nil;
local v8 = nil;
local v9 = {
    One = 1, 
    Two = 2, 
    Three = 3, 
    Four = 4, 
    Five = 5, 
    Six = 6, 
    Seven = 7, 
    Eight = 8, 
    Nine = 9, 
    Zero = 10
};
local v10 = {
    SelectedHotbarButton = nil, 
    KeyCodeDictionary = {}, 
    HotbarSlotNumber = {}
};
v10.GetSelectedHotbarButton = function(_) --[[ Line: 35 ]] --[[ Name: GetSelectedHotbarButton ]]
    -- upvalues: v10 (copy)
    return v10.SelectedHotbarButton;
end;
v10.UnequipCurrentTool = function(_) --[[ Line: 39 ]] --[[ Name: UnequipCurrentTool ]]
    -- upvalues: v10 (copy)
    if v10:GetSelectedHotbarButton() ~= nil then
        v10.SelectedHotbarButton:SetAttribute("Selected", false);
        v10.SelectedHotbarButton = nil;
        v10.BackpackService:UnequipTools();
    end;
end;
v10.SelectTool = function(_, v14) --[[ Line: 52 ]] --[[ Name: SelectTool ]]
    -- upvalues: v10 (copy)
    local l_BackpackService_0 = v10.BackpackService;
    if l_BackpackService_0.Humanoid == nil then
        return;
    elseif l_BackpackService_0.Backpack == nil then
        return;
    elseif l_BackpackService_0.Character == nil then
        return;
    elseif v10.SelectedHotbarButton == v14 then
        v10:UnequipCurrentTool();
        return;
    else
        v10:UnequipCurrentTool();
        local l_Value_0 = v14.ToolObject.Value;
        if l_Value_0 ~= nil and l_Value_0:IsA("Tool") and l_BackpackService_0:EquipTool(l_Value_0) == true then
            v10.SelectedHotbarButton = v14;
            v10.SelectedHotbarButton:SetAttribute("Selected", true);
        end;
        return;
    end;
end;
v10.GetKeyCode = function(_, v18) --[[ Line: 90 ]] --[[ Name: GetKeyCode ]]
    -- upvalues: v10 (copy)
    if v10.KeyCodeDictionary[v18] then
        return v10.KeyCodeDictionary[v18];
    else
        return nil;
    end;
end;
v10.SelectKeyCode = function(_, v20) --[[ Line: 99 ]] --[[ Name: SelectKeyCode ]]
    -- upvalues: v10 (copy)
    local l_v10_KeyCode_0 = v10:GetKeyCode(v20);
    if l_v10_KeyCode_0 ~= nil then
        local l_ImageButton_0 = l_v10_KeyCode_0.HotbarFrame:FindFirstChildOfClass("ImageButton");
        if l_ImageButton_0 then
            v10:SelectTool(l_ImageButton_0);
        end;
    end;
end;
v10.GetEmptyHotbar = function(_) --[[ Line: 111 ]] --[[ Name: GetEmptyHotbar ]]
    -- upvalues: v10 (copy)
    for v24, v25 in ipairs(v10.HotbarSlotNumber) do
        if not v25:FindFirstChildOfClass("ImageButton") then
            return v24;
        end;
    end;
    return nil;
end;
v10.GetFrameSlot = function(_, v27) --[[ Line: 123 ]] --[[ Name: GetFrameSlot ]]
    -- upvalues: v10 (copy)
    return v10.HotbarSlotNumber[v27];
end;
v10.SetHotbarNumbersVisible = function(_, _) --[[ Line: 127 ]] --[[ Name: SetHotbarNumbersVisible ]]
    -- upvalues: v8 (ref)
    for _, v31 in ipairs(v8:GetChildren()) do
        if v31:IsA("Frame") then
            local l_Number_0 = v31:FindFirstChild("Number");
            if l_Number_0 then
                l_Number_0.Visible = false;
            end;
        end;
    end;
end;
v10.Initialize = function(_, v34) --[[ Line: 138 ]] --[[ Name: Initialize ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), v10 (copy), v7 (ref), v8 (ref), l_LocalPlayer_0 (copy), l_HttpService_0 (copy), v9 (copy), l_QueueTask_0 (copy), l_UserInputService_0 (copy)
    local l_Hotbar_0 = l_ReplicatedStorage_0.Events:WaitForChild("Hotbar");
    v10.BackpackService = v34;
    local l_BackpackGui_0 = v34.BackpackGui;
    v7 = l_BackpackGui_0:WaitForChild("Backpack");
    v8 = l_BackpackGui_0:WaitForChild("Hotbar");
    v10.BackpackGui = l_BackpackGui_0;
    local l_UIScale_0 = v8:WaitForChild("UIScale");
    local l_AbsoluteSize_0 = l_BackpackGui_0.AbsoluteSize;
    if math.min(l_AbsoluteSize_0.X, l_AbsoluteSize_0.Y) <= 500 then
        l_UIScale_0.Scale = 1.5;
    end;
    task.spawn(function() --[[ Line: 161 ]]
        -- upvalues: l_LocalPlayer_0 (ref), l_UIScale_0 (copy)
        local v39 = l_LocalPlayer_0.PlayerGui:WaitForChild("TouchGui", 60);
        if not v39 then
            return;
        else
            if v39:WaitForChild("TouchControlFrame"):WaitForChild("JumpButton").Size == UDim2.new(0, 120, 0, 120) then
                l_UIScale_0.Scale = 1.5;
            end;
            return;
        end;
    end);
    local l_HotbarOrder_0 = l_ReplicatedStorage_0:WaitForChild("Stats" .. l_LocalPlayer_0.Name):WaitForChild("Inventory"):WaitForChild("HotbarOrder");
    local v41 = os.clock();
    local function v43(_) --[[ Line: 179 ]] --[[ Name: CharacterStateChanged ]]
        -- upvalues: v41 (ref)
        print("this was suppose to run");
        v41 = os.clock();
    end;
    if not l_LocalPlayer_0.Character then
        local _ = l_LocalPlayer_0.CharacterAdded:Wait();
    end;
    print("this was suppose to run");
    v41 = os.clock();
    l_LocalPlayer_0.CharacterAdded:Connect(v43);
    l_LocalPlayer_0.CharacterRemoving:Connect(v43);
    v10.GetClientHotbar = function(_, v46) --[[ Line: 196 ]] --[[ Name: GetClientHotbar ]]
        -- upvalues: v8 (ref), l_HttpService_0 (ref), l_HotbarOrder_0 (copy), v9 (ref)
        local v47 = {};
        for _, v49 in pairs(v8:GetChildren()) do
            if v49:IsA("Frame") then
                local l_ImageButton_1 = v49:FindFirstChildOfClass("ImageButton");
                if l_ImageButton_1 then
                    local l_Value_1 = l_ImageButton_1.ToolObject.Value;
                    v47[v49.Name] = l_Value_1.Name;
                else
                    v47[v49.Name] = "None";
                    if v49 ~= v46 then
                        local v52 = l_HttpService_0:JSONDecode(l_HotbarOrder_0.Value)[v9[v49.Name]];
                        if v52 and v52 ~= "None" then
                            v47[v49.Name] = v52;
                        end;
                    end;
                end;
            end;
        end;
        return v47;
    end;
    for _, v54 in pairs(v8:GetChildren()) do
        if v54:IsA("Frame") then
            v54:SetAttribute("Disabled", false);
            local l_Design_0 = v54:WaitForChild("Design");
            v54.Visible = false;
            local v56 = false;
            local v57 = nil;
            do
                local l_v56_0, l_v57_0 = v56, v57;
                v7:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 233 ]]
                    -- upvalues: v54 (copy), v7 (ref), l_v56_0 (ref)
                    if v54:GetAttribute("Disabled") == true then
                        return;
                    elseif v7.Visible == true and l_v56_0 == false then
                        v54.Visible = true;
                        return;
                    else
                        if v7.Visible == false and l_v56_0 == false then
                            v54.Visible = false;
                        end;
                        return;
                    end;
                end);
                local v60 = l_QueueTask_0.new();
                v54.ChildAdded:Connect(function(v61) --[[ Line: 244 ]]
                    -- upvalues: v60 (copy), l_v57_0 (ref), l_v56_0 (ref), v54 (copy), l_Design_0 (copy), l_HttpService_0 (ref), l_HotbarOrder_0 (copy), v9 (ref), l_Hotbar_0 (copy), v10 (ref)
                    if v61:IsA("ImageButton") then
                        v60:QueueTask(function() --[[ Line: 246 ]]
                            -- upvalues: l_v57_0 (ref), v61 (copy), l_v56_0 (ref), v54 (ref), l_Design_0 (ref), l_HttpService_0 (ref), l_HotbarOrder_0 (ref), v9 (ref), l_Hotbar_0 (ref), v10 (ref)
                            l_v57_0 = v61;
                            l_v56_0 = true;
                            v54.Visible = true;
                            l_Design_0.ImageTransparency = 1;
                            local l_Value_2 = v61.ToolObject.Value;
                            local v63 = l_HttpService_0:JSONDecode(l_HotbarOrder_0.Value);
                            if table.find(v63, l_Value_2.Name) ~= v9[v54.Name] then
                                l_Hotbar_0:FireServer(v10:GetClientHotbar());
                                return;
                            else
                                return;
                            end;
                        end);
                    end;
                end);
                v54.ChildRemoved:Connect(function(v64) --[[ Line: 270 ]]
                    -- upvalues: v60 (copy), l_v57_0 (ref), l_v56_0 (ref), l_Design_0 (copy), v7 (ref), v54 (copy)
                    if v64:IsA("ImageButton") then
                        v60:QueueTask(function() --[[ Line: 272 ]]
                            -- upvalues: l_v57_0 (ref), v64 (copy), l_v56_0 (ref), l_Design_0 (ref), v7 (ref), v54 (ref)
                            if l_v57_0 ~= v64 then
                                return;
                            else
                                l_v56_0 = false;
                                l_Design_0.ImageTransparency = 0.5;
                                if v7.Visible == false then
                                    v54.Visible = false;
                                    return;
                                else
                                    if v7.Visible == true then
                                        v54.Visible = true;
                                    end;
                                    return;
                                end;
                            end;
                        end);
                    end;
                end);
            end;
        end;
    end;
    v10.KeyCodeDictionary = {
        [Enum.KeyCode.One] = {
            HotbarFrame = v8.One
        }, 
        [Enum.KeyCode.Two] = {
            HotbarFrame = v8.Two
        }, 
        [Enum.KeyCode.Three] = {
            HotbarFrame = v8.Three
        }, 
        [Enum.KeyCode.Four] = {
            HotbarFrame = v8.Four
        }, 
        [Enum.KeyCode.Five] = {
            HotbarFrame = v8.Five
        }, 
        [Enum.KeyCode.Six] = {
            HotbarFrame = v8.Six
        }, 
        [Enum.KeyCode.Seven] = {
            HotbarFrame = v8.Seven
        }, 
        [Enum.KeyCode.Eight] = {
            HotbarFrame = v8.Eight
        }, 
        [Enum.KeyCode.Nine] = {
            HotbarFrame = v8.Nine
        }, 
        [Enum.KeyCode.Zero] = {
            HotbarFrame = v8.Zero
        }
    };
    v10.HotbarSlotNumber = {
        [1] = v8.One, 
        [2] = v8.Two, 
        [3] = v8.Three, 
        [4] = v8.Four, 
        [5] = v8.Five, 
        [6] = v8.Six, 
        [7] = v8.Seven, 
        [8] = v8.Eight, 
        [9] = v8.Nine, 
        [10] = v8.Zero
    };
    local l_InputHandler_0 = l_LocalPlayer_0:WaitForChild("PlayerScripts"):WaitForChild("InputHandler");
    local l_GetPreferredInput_0 = require(l_InputHandler_0:WaitForChild("GetPreferredInput"));
    print("preferredinput", l_GetPreferredInput_0);
    if l_GetPreferredInput_0.Current == "Mobile" then
        print("its mobile, disable buttons");
        for v67 = 6, 10 do
            print("Disabled", v67);
            local v68 = v10.HotbarSlotNumber[v67];
            v68:SetAttribute("Disabled", true);
            v68.Visible = false;
        end;
    end;
    if l_UserInputService_0.KeyboardEnabled == false then
        v10:SetHotbarNumbersVisible(false);
    end;
end;
return v10;