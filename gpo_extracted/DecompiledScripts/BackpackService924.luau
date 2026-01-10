local l_Players_0 = game:GetService("Players");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_HttpService_0 = game:GetService("HttpService");
local _ = game:GetService("RunService");
local l_Shared_0 = l_ReplicatedStorage_0:WaitForChild("Modules").Shared;
local l_Promise_0 = require(l_Shared_0:WaitForChild("Promises"):WaitForChild("Promise"));
local l_Maid_0 = require(l_Shared_0:WaitForChild("Maids"):WaitForChild("Maid"));
local l_ToolService_0 = require(script:WaitForChild("ToolService"));
local l_Hotbar_0 = require(script:WaitForChild("Hotbar"));
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_PlayerGui_0 = l_LocalPlayer_0:WaitForChild("PlayerGui");
local l_BackpackGui_0 = l_PlayerGui_0:WaitForChild("BackpackGui");
local l_Hotbar_1 = l_BackpackGui_0:WaitForChild("Hotbar");
local l_Backpack_0 = l_BackpackGui_0:WaitForChild("Backpack");
local l_Search_0 = l_Backpack_0:WaitForChild("Search");
local l_Hotbar_2 = l_ReplicatedStorage_0.Events:WaitForChild("Hotbar");
local l_ItemNum_0 = l_PlayerGui_0:WaitForChild("HUD"):WaitForChild("Main"):WaitForChild("Buttons"):WaitForChild("Backpack"):WaitForChild("ItemNum");
local l_InputHandler_0 = l_LocalPlayer_0:WaitForChild("PlayerScripts"):WaitForChild("InputHandler");
local l_GetPreferredInput_0 = require(l_InputHandler_0:WaitForChild("GetPreferredInput"));
print("preferredinput", l_GetPreferredInput_0);
local v21 = {
    Debug = true, 
    Initialized = false, 
    BackpackGui = l_BackpackGui_0, 
    Backpack = nil, 
    Character = nil, 
    Humanoid = nil, 
    BackpackKey = Enum.KeyCode.Backquote, 
    CurrentDraggedButton = nil, 
    Tools = {}
};
v21.DebugMessage = function(_, ...) --[[ Line: 59 ]] --[[ Name: DebugMessage ]]
    -- upvalues: v21 (copy)
    if v21.Debug == true then
        warn("[Inventory]:", ...);
    end;
end;
local l_Inventory_0 = l_Backpack_0:WaitForChild("Inventory");
local l_UncategorizedInventory_0 = l_Inventory_0:WaitForChild("UncategorizedInventory");
local v25 = Vector2.new(1920, 1080);
local function _(v26) --[[ Line: 71 ]] --[[ Name: GetVectorAverage ]]
    return (v26.X + v26.Y) / 2;
end;
local function _() --[[ Line: 75 ]] --[[ Name: GetScreenRatio ]]
    -- upvalues: v25 (copy)
    local l_ViewportSize_0 = workspace.Camera.ViewportSize;
    local v29 = (l_ViewportSize_0.X + l_ViewportSize_0.Y) / 2;
    local l_v25_0 = v25;
    return v29 / ((l_v25_0.X + l_v25_0.Y) / 2);
end;
local v32 = 0;
local function v34(_) --[[ Line: 88 ]] --[[ Name: ItemAddedCount ]]
    -- upvalues: v32 (ref), l_ItemNum_0 (copy)
    v32 = v32 + 1;
    l_ItemNum_0.Text = v32;
    if v32 >= 1 then
        l_ItemNum_0.Visible = true;
    end;
end;
local function v36(_) --[[ Line: 96 ]] --[[ Name: ItemRemovedCount ]]
    -- upvalues: v32 (ref), l_ItemNum_0 (copy)
    v32 = v32 - 1;
    l_ItemNum_0.Text = v32;
    if v32 == 0 then
        l_ItemNum_0.Visible = false;
    end;
end;
local function v62(v37) --[[ Line: 104 ]] --[[ Name: SetupInventory ]]
    -- upvalues: v25 (copy), v34 (copy), v36 (copy)
    local l_Camera_0 = workspace.Camera;
    local l_UIGridLayout_0 = v37:WaitForChild("UIGridLayout");
    local function v45() --[[ Line: 110 ]] --[[ Name: Update ]]
        -- upvalues: v25 (ref), l_UIGridLayout_0 (copy)
        local v40 = 73;
        local l_ViewportSize_1 = workspace.Camera.ViewportSize;
        local v42 = (l_ViewportSize_1.X + l_ViewportSize_1.Y) / 2;
        local l_v25_1 = v25;
        local v44 = v40 * (v42 / ((l_v25_1.X + l_v25_1.Y) / 2));
        l_UIGridLayout_0.CellSize = UDim2.new(0, v44, 0, v44);
    end;
    l_Camera_0:GetPropertyChangedSignal("ViewportSize"):Connect(v45);
    local v46 = 73;
    local l_ViewportSize_2 = workspace.Camera.ViewportSize;
    local v48 = (l_ViewportSize_2.X + l_ViewportSize_2.Y) / 2;
    local l_v25_2 = v25;
    local v50 = v46 * (v48 / ((l_v25_2.X + l_v25_2.Y) / 2));
    l_UIGridLayout_0.CellSize = UDim2.new(0, v50, 0, v50);
    v50 = 1;
    v46 = function() --[[ Line: 119 ]] --[[ Name: UpdateSize ]]
        -- upvalues: l_UIGridLayout_0 (copy), v50 (ref), v25 (ref), v37 (copy)
        local l_AbsoluteCellCount_0 = l_UIGridLayout_0.AbsoluteCellCount;
        if l_AbsoluteCellCount_0.Y ~= v50 then
            v50 = l_AbsoluteCellCount_0.Y;
            local v52 = 73;
            local l_ViewportSize_3 = workspace.Camera.ViewportSize;
            local v54 = (l_ViewportSize_3.X + l_ViewportSize_3.Y) / 2;
            local l_v25_3 = v25;
            local v56 = v52 * (v54 / ((l_v25_3.X + l_v25_3.Y) / 2));
            v37.Size = UDim2.new(0.98, 0, 0, (v56 + 8) * v50);
        end;
    end;
    l_UIGridLayout_0:GetPropertyChangedSignal("AbsoluteCellCount"):Connect(v46);
    local l_AbsoluteCellCount_1 = l_UIGridLayout_0.AbsoluteCellCount;
    if l_AbsoluteCellCount_1.Y ~= v50 then
        v50 = l_AbsoluteCellCount_1.Y;
        v48 = 73;
        local l_ViewportSize_4 = workspace.Camera.ViewportSize;
        local v59 = (l_ViewportSize_4.X + l_ViewportSize_4.Y) / 2;
        local l_v25_4 = v25;
        local v61 = v48 * (v59 / ((l_v25_4.X + l_v25_4.Y) / 2));
        v37.Size = UDim2.new(0.98, 0, 0, (v61 + 8) * v50);
    end;
    v37.ChildAdded:Connect(v34);
    v37.ChildRemoved:Connect(v36);
end;
for _, v64 in ipairs(l_Inventory_0:GetChildren()) do
    if v64.Name:find("Inventory") then
        v62(v64);
    end;
end;
local v65 = {};
v21.AutoPlaceToolButton = function(v66) --[[ Line: 148 ]] --[[ Name: AutoPlaceToolButton ]]
    -- upvalues: l_UncategorizedInventory_0 (copy), v65 (copy), l_Inventory_0 (copy), l_Search_0 (copy)
    local l_ToolButton_0 = v66.ToolButton;
    local l_Attribute_0 = v66.Tool:GetAttribute("Category");
    if l_Attribute_0 == nil then
        l_ToolButton_0.Parent = l_UncategorizedInventory_0;
    else
        local v69 = l_Attribute_0 .. "Inventory";
        local v70 = v65[v69];
        if v70 then
            l_ToolButton_0.Parent = v70;
            return;
        else
            local l_l_Inventory_0_FirstChild_0 = l_Inventory_0:FindFirstChild(v69);
            if l_l_Inventory_0_FirstChild_0 then
                l_ToolButton_0.Parent = l_l_Inventory_0_FirstChild_0;
                v65[v69] = l_l_Inventory_0_FirstChild_0;
            else
                l_ToolButton_0.Parent = l_UncategorizedInventory_0;
            end;
        end;
    end;
    local l_Text_0 = l_Search_0.Text;
    if l_Text_0 ~= "" then
        l_ToolButton_0.Visible = string.find(string.lower(l_ToolButton_0.Name), l_Text_0) and true or false;
    end;
end;
local l_SkillCallbacks_0 = l_ReplicatedStorage_0:WaitForChild("SkillCallbacks");
local l_DevilFruit_0 = l_SkillCallbacks_0:WaitForChild("DevilFruit");
local l_FistStyles_0 = l_SkillCallbacks_0:WaitForChild("FistStyles");
v21.AddTool = function(v76, v77) --[[ Line: 183 ]] --[[ Name: AddTool ]]
    -- upvalues: v21 (copy), l_ToolService_0 (copy), l_ReplicatedStorage_0 (copy), l_LocalPlayer_0 (copy), l_HttpService_0 (copy), l_DevilFruit_0 (copy), l_FistStyles_0 (copy), l_Hotbar_0 (copy), l_GetPreferredInput_0 (copy), l_Hotbar_1 (copy), l_Hotbar_2 (copy), l_Backpack_0 (copy), l_PlayerGui_0 (copy)
    if not v76:IsA("Tool") then
        return;
    elseif v21.Tools[v76] ~= nil then
        return;
    else
        local v78 = l_ToolService_0.new(v76);
        v78:UpdateLayoutOrder();
        if not l_ReplicatedStorage_0:FindFirstChild("battleRoyaleDrop") then
            local l_HotbarOrder_0 = l_ReplicatedStorage_0:WaitForChild("Stats" .. l_LocalPlayer_0.Name):WaitForChild("Inventory"):WaitForChild("HotbarOrder");
            local v80 = l_HttpService_0:JSONDecode(l_HotbarOrder_0.Value);
            v77 = table.find(v80, v76.Name) or v77;
            local v81 = l_DevilFruit_0:FindFirstChild(v76.Name) or l_FistStyles_0:FindFirstChild(v76.Name);
            if v81 then
                for v82, v83 in pairs(v80) do
                    if v81.Parent:FindFirstChild(v83) and v83 ~= v76.Name then
                        v77 = v82;
                        break;
                    end;
                end;
            end;
            if v77 == nil and v76:GetAttribute("StarterTool") == true then
                v77 = l_Hotbar_0:GetEmptyHotbar();
            end;
            if v77 == nil and v21.LastRefresh and os.clock() - v21.LastRefresh > 2 then
                v77 = v77 or l_Hotbar_0:GetEmptyHotbar();
            end;
        else
            v77 = v77 or l_Hotbar_0:GetEmptyHotbar();
        end;
        local v84 = false;
        if v77 ~= nil and v77 <= 10 then
            v84 = true;
            if l_GetPreferredInput_0.Current == "Mobile" and v77 >= 6 then
                v84 = false;
            end;
        end;
        if v84 then
            local l_l_Hotbar_0_FrameSlot_0 = l_Hotbar_0:GetFrameSlot(v77);
            local l_ImageButton_0 = l_l_Hotbar_0_FrameSlot_0:FindFirstChildOfClass("ImageButton");
            if not l_ImageButton_0 then
                local l_ToolButton_1 = v78.ToolButton;
                l_ToolButton_1.Parent = l_l_Hotbar_0_FrameSlot_0;
                l_ToolButton_1.Position = UDim2.new(0.5, 0, 0.5, 0);
                l_ToolButton_1.Size = UDim2.new(1, 0, 1, 0);
                v78.HotbarObject.Value = l_l_Hotbar_0_FrameSlot_0;
            else
                print("Existing? why?", l_ImageButton_0, "in", v77, "instead of", v76);
                v21.AutoPlaceToolButton(v78);
            end;
        else
            v21.AutoPlaceToolButton(v78);
        end;
        local l_ToolButton_2 = v78.ToolButton;
        local l_Parent_0 = v78.ToolButton.Parent;
        l_ToolButton_2:GetPropertyChangedSignal("Parent"):Connect(function() --[[ Line: 281 ]]
            -- upvalues: l_Parent_0 (ref), l_Hotbar_1 (ref), l_ToolButton_2 (copy), v76 (copy), l_Hotbar_0 (ref), l_Hotbar_2 (ref)
            if l_Parent_0 and l_Parent_0:IsA("Frame") and l_Parent_0.Parent == l_Hotbar_1 and l_ToolButton_2.Parent ~= nil and l_ToolButton_2.Parent ~= l_Hotbar_1 then
                print("previous tool parent", l_Parent_0, "new parent", v76.Parent);
                print("client hotbar", l_Hotbar_0:GetClientHotbar(l_Parent_0));
                l_Hotbar_2:FireServer(l_Hotbar_0:GetClientHotbar(l_Parent_0));
            end;
            l_Parent_0 = l_ToolButton_2.Parent;
        end);
        local v90 = os.clock();
        l_ToolButton_2.MouseButton1Click:Connect(function() --[[ Line: 297 ]]
            -- upvalues: l_Hotbar_0 (ref), v78 (copy), v90 (ref), v77 (ref)
            l_Hotbar_0:SelectTool(v78.ToolButton);
            if os.clock() - v90 < 0.25 and v78.ToolButton.Parent.Name:find("Inventory") then
                v77 = l_Hotbar_0:GetEmptyHotbar();
                if v77 ~= nil and v77 <= 10 then
                    local l_l_Hotbar_0_FrameSlot_1 = l_Hotbar_0:GetFrameSlot(v77);
                    if l_l_Hotbar_0_FrameSlot_1 and not l_l_Hotbar_0_FrameSlot_1:FindFirstChildOfClass("ImageButton") then
                        local l_ToolButton_3 = v78.ToolButton;
                        l_ToolButton_3.Parent = l_l_Hotbar_0_FrameSlot_1;
                        l_ToolButton_3.Position = UDim2.new(0.5, 0, 0.5, 0);
                        l_ToolButton_3.Size = UDim2.new(1, 0, 1, 0);
                        v78.HotbarObject.Value = l_l_Hotbar_0_FrameSlot_1;
                    end;
                end;
            end;
            v90 = os.clock();
        end);
        v78.Drag.DragStarted = function() --[[ Line: 350 ]]
            -- upvalues: v78 (copy), v21 (ref)
            local l_ToolButton_4 = v78.ToolButton;
            v21.CurrentDraggedButton = l_ToolButton_4;
            l_ToolButton_4.Size = UDim2.new(0, l_ToolButton_4.AbsoluteSize.X, 0, l_ToolButton_4.AbsoluteSize.Y);
            l_ToolButton_4.Parent = v21.BackpackGui;
        end;
        v78.Drag.Dragged = function() --[[ Line: 357 ]]
            -- upvalues: l_Backpack_0 (ref), l_Hotbar_0 (ref), v78 (copy)
            if l_Backpack_0.Visible == false then
                return;
            else
                if l_Hotbar_0:GetSelectedHotbarButton() == v78.ToolButton then
                    l_Hotbar_0:UnequipCurrentTool();
                end;
                return;
            end;
        end;
        v78.Drag.DragEnded = function(v94) --[[ Line: 365 ]]
            -- upvalues: l_PlayerGui_0 (ref), l_Hotbar_1 (ref), v78 (copy), v21 (ref)
            if v94 == nil then
                return;
            else
                local l_Position_0 = v94.Position;
                local l_l_PlayerGui_0_GuiObjectsAtPosition_0 = l_PlayerGui_0:GetGuiObjectsAtPosition(l_Position_0.X, l_Position_0.Y);
                local v97 = nil;
                for _, v99 in ipairs(l_l_PlayerGui_0_GuiObjectsAtPosition_0) do
                    if v99:IsA("Frame") and v99.Parent == l_Hotbar_1 then
                        v97 = v99;
                        break;
                    end;
                end;
                if v97 then
                    local l_ToolButton_5 = v78.ToolButton;
                    local l_ImageButton_1 = v97:FindFirstChildOfClass("ImageButton");
                    l_ToolButton_5.Position = UDim2.new(0.5, 0, 0.5, 0);
                    l_ToolButton_5.Size = UDim2.new(1, 0, 1, 0);
                    if l_ImageButton_1 then
                        local l_HotbarObject_0 = l_ImageButton_1.HotbarObject;
                        local l_Value_0 = v78.HotbarObject.Value;
                        if v78.HotbarObject.Value == nil then
                            v78.HotbarObject.Value = v97;
                            l_ToolButton_5.Parent = v97;
                            l_HotbarObject_0.Value = nil;
                            v21.AutoPlaceToolButton(v21.Tools[l_ImageButton_1.ToolObject.Value]);
                        else
                            v78.HotbarObject.Value = v97;
                            l_ToolButton_5.Parent = v97;
                            l_HotbarObject_0.Value = l_Value_0;
                            l_ImageButton_1.Parent = l_Value_0;
                        end;
                    else
                        v78.HotbarObject.Value = v97;
                        l_ToolButton_5.Parent = v97;
                    end;
                else
                    v78.HotbarObject.Value = nil;
                    v21.AutoPlaceToolButton(v78);
                end;
                v21.CurrentDraggedButton = nil;
                return;
            end;
        end;
        v21.Tools[v76] = v78;
        return;
    end;
end;
v21.RemoveTool = function(v104) --[[ Line: 426 ]] --[[ Name: RemoveTool ]]
    -- upvalues: v21 (copy), l_Hotbar_0 (copy)
    if not v104:IsA("Tool") then
        return;
    else
        local v105 = v21.Tools[v104];
        local l_Parent_1 = v104.Parent;
        if l_Parent_1 == v21.Character then
            return;
        elseif l_Parent_1 == v21.Backpack then
            if v105.ToolButton == l_Hotbar_0:GetSelectedHotbarButton() then
                l_Hotbar_0:UnequipCurrentTool();
            end;
            return;
        else
            if v105 ~= nil then
                if v105.ToolButton == l_Hotbar_0:GetSelectedHotbarButton() then
                    l_Hotbar_0:UnequipCurrentTool();
                end;
                v105:Destroy();
                v105 = nil;
                v21.Tools[v104] = nil;
            end;
            return;
        end;
    end;
end;
v21.AssignSlot = function(_, v108, v109) --[[ Line: 461 ]] --[[ Name: AssignSlot ]]
    -- upvalues: v21 (copy)
    if v108 <= 0 or v108 >= 11 then
        v21:DebugMessage(("Invalid Slot Number! Must be a number between 1-10. Received [%s]"):format(v108));
        return;
    else
        local v110 = typeof(v109) == "Instance" and v109:IsA("Tool") and v109.Name or typeof(v109) == "string" and v109 or nil;
        if v110 == nil then
            v21:DebugMessage("Invalid Object/Name");
            return;
        else
            v21.SavedSlots[v108] = v110;
            return;
        end;
    end;
end;
v21.GetSavedSlots = function(_) --[[ Line: 479 ]] --[[ Name: GetSavedSlots ]]
    -- upvalues: v21 (copy)
    return v21.SavedSlots;
end;
v21.ClearAllTools = function(_) --[[ Line: 483 ]] --[[ Name: ClearAllTools ]]
    -- upvalues: v21 (copy), l_Hotbar_0 (copy)
    for v113, v114 in pairs(v21.Tools) do
        if v114.ToolButton == l_Hotbar_0:GetSelectedHotbarButton() then
            l_Hotbar_0:UnequipCurrentTool();
        end;
        if v114.Destroy then
            v114:Destroy();
        end;
        v21.Tools[v113] = nil;
    end;
end;
local v115 = 0;
local v116 = 0;
v21.EquipTool = function(v117, v118) --[[ Line: 501 ]] --[[ Name: EquipTool ]]
    -- upvalues: v116 (ref), v115 (ref), v21 (copy)
    local v119 = tick();
    if v119 - v116 >= 0.1 then
        v115 = 0;
    end;
    v115 = v115 + 1;
    if v115 > 6 then
        _G.displayMessage("<Color=Red>Too many equip attempts! Please wait.");
        return false;
    else
        v116 = v119;
        if v118.Parent == nil then
            print("Invalid Tool, Refresh", v118);
            v117:Refresh();
            return false;
        else
            if v21.Humanoid then
                v21.Humanoid:EquipTool(v118);
            end;
            return true;
        end;
    end;
end;
v21.UnequipTools = function(_) --[[ Line: 530 ]] --[[ Name: UnequipTools ]]
    -- upvalues: v21 (copy)
    if v21.Humanoid then
        v21.Humanoid:UnequipTools();
    end;
end;
v21.SetVisible = function(_, v122) --[[ Line: 537 ]] --[[ Name: SetVisible ]]
    -- upvalues: l_Inventory_0 (copy)
    l_Inventory_0.Visible = v122 ~= nil and v122 or not l_Inventory_0.Visible;
end;
v21.SetBackpackVisible = function(_, v124) --[[ Line: 541 ]] --[[ Name: SetBackpackVisible ]]
    -- upvalues: l_Backpack_0 (copy)
    l_Backpack_0.Visible = v124 ~= nil and v124 or not l_Backpack_0.Visible;
end;
v21.Initialize = function() --[[ Line: 546 ]] --[[ Name: Initialize ]]
    -- upvalues: v21 (copy), l_Maid_0 (copy), l_Promise_0 (copy), l_LocalPlayer_0 (copy), l_StarterGui_0 (copy), l_PlayerGui_0 (copy), l_Hotbar_0 (copy), l_UserInputService_0 (copy), l_BackpackGui_0 (copy), l_ReplicatedStorage_0 (copy)
    if v21.Initialized == true then
        v21:DebugMessage("Already Initialized!");
        return;
    else
        v21.Maid = l_Maid_0.new();
        local function v130() --[[ Line: 551 ]] --[[ Name: PromiseDisableSetCoreBackpack ]]
            -- upvalues: l_Promise_0 (ref), l_LocalPlayer_0 (ref), l_StarterGui_0 (ref), v21 (ref)
            l_Promise_0.spawn(function(v125, v126) --[[ Line: 552 ]]
                -- upvalues: l_LocalPlayer_0 (ref), l_StarterGui_0 (ref)
                if l_LocalPlayer_0 == nil then
                    v126("Player Probably Left During Initialize");
                end;
                local l_status_0, _ = pcall(function() --[[ Line: 558 ]]
                    -- upvalues: l_StarterGui_0 (ref)
                    l_StarterGui_0:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false);
                end);
                v125(l_status_0);
            end):Catch(function(v129) --[[ Line: 563 ]]
                -- upvalues: v21 (ref)
                v21:DebugMessage(v129);
            end);
        end;
        v130();
        local function v134(v131) --[[ Line: 571 ]] --[[ Name: CharacterAdded ]]
            -- upvalues: v21 (ref), l_PlayerGui_0 (ref), l_LocalPlayer_0 (ref)
            v21.LastRefresh = os.clock();
            v21:Refresh();
            v21.BackpackGui = l_PlayerGui_0:WaitForChild("BackpackGui");
            v21.Backpack = l_LocalPlayer_0:FindFirstChild("Backpack") or l_LocalPlayer_0:WaitForChild("Backpack");
            v21.Character = v131;
            v21.Humanoid = v131:WaitForChild("Humanoid");
            while v131:GetAttribute("backpackLoaded") ~= true do
                task.wait();
            end;
            task.wait();
            for _, v133 in ipairs(v21.Backpack:GetChildren()) do
                if v133:IsA("Tool") then
                    v21.AddTool(v133);
                end;
            end;
            v21.Maid:AddTask(v131.ChildAdded:Connect(v21.AddTool));
            v21.Maid:AddTask(v131.ChildRemoved:Connect(v21.RemoveTool));
            v21.Maid:AddTask(v21.Backpack.ChildAdded:Connect(v21.AddTool));
            v21.Maid:AddTask(v21.Backpack.ChildRemoved:Connect(v21.RemoveTool));
        end;
        v21.Refresh = function(_) --[[ Line: 610 ]] --[[ Name: Refresh ]]
            -- upvalues: v21 (ref)
            v21:ClearAllTools();
            v21.Maid:Destroy();
            v21.Backpack = nil;
            v21.Character = nil;
            v21.Humanoid = nil;
            v21.Tools = nil;
            v21.Tools = {};
        end;
        l_Hotbar_0:Initialize(v21);
        l_LocalPlayer_0.CharacterAdded:Connect(v134);
        v134(l_LocalPlayer_0.Character or l_LocalPlayer_0.CharacterAdded:Wait());
        l_UserInputService_0.InputBegan:Connect(function(v136, v137) --[[ Line: 628 ]]
            -- upvalues: l_BackpackGui_0 (ref), v21 (ref), l_Hotbar_0 (ref), l_UserInputService_0 (ref)
            if v137 or l_BackpackGui_0.Enabled == false then
                return;
            else
                if v136.UserInputType == Enum.UserInputType.Keyboard then
                    local l_KeyCode_0 = v136.KeyCode;
                    if l_KeyCode_0 == v21.BackpackKey then
                        v21:SetBackpackVisible();
                    end;
                    if l_Hotbar_0:GetKeyCode(l_KeyCode_0) ~= nil and not l_UserInputService_0:GetFocusedTextBox() then
                        l_Hotbar_0:SelectKeyCode(l_KeyCode_0);
                    end;
                end;
                return;
            end;
        end);
        v21.Initialized = true;
        local l_reservedCode_0 = l_ReplicatedStorage_0:WaitForChild("reservedCode");
        repeat
            task.wait(0.03333333333333333);
        until l_reservedCode_0.Value ~= "checking";
        if l_reservedCode_0.Value == "arena" then
            v130();
            local l_matchStarted_0 = l_ReplicatedStorage_0:WaitForChild("Matchinfo"):WaitForChild("matchStarted");
            l_BackpackGui_0.Enabled = false;
            repeat
                task.wait(0.03333333333333333);
            until l_matchStarted_0.Value == true;
            warn("enlaging backpack!");
        end;
        l_BackpackGui_0.Enabled = true;
        return v21;
    end;
end;
return v21;