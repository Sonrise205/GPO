local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_Maid_0 = require(l_Modules_0:WaitForChild("Maid"));
local v4 = require(script.DraggableObject);
local l_Shared_0 = l_Modules_0.Shared;
local v6 = require(l_Shared_0.GameUtils);
local l_ToolTemplate_0 = script.ToolTemplate;
local _ = require(script.SortTypes);
local l_ToolDesc_0 = require(l_Modules_0:WaitForChild("ToolDesc"));
local l_Client_0 = l_Modules_0.Client;
local l_ItemDisplay_0 = require(l_Client_0:WaitForChild("ItemDisplay"));
local l_PlayerGui_0 = l_Players_0.LocalPlayer:WaitForChild("PlayerGui");
local v13 = {};
v13.__index = v13;
local v14 = {
    Gun = "Weapons", 
    Katana = "Weapons", 
    Katana2 = "Weapons", 
    Artifact = "Items", 
    Back2 = "Items", 
    Baloon = "Items", 
    Book = "Items", 
    Core = "Items", 
    Display = "Items", 
    Drink = "Items", 
    ETPose = "Items", 
    Egg = "Items", 
    Essence = "Items", 
    Food = "Items", 
    FruitBag = "Items", 
    FruitChest = "Items", 
    FruitRemover = "Items", 
    Hammer = "Items", 
    Item = "Items", 
    Key = "Items", 
    Mount = "Items", 
    Pet = "Items", 
    Fruit = "Special", 
    Back = "Wearables", 
    Cap = "Wearables", 
    Cape = "Wearables", 
    Ears = "Wearables", 
    Glasses = "Wearables", 
    Headband = "Wearables", 
    Jaw = "Wearables", 
    NormalOutfit = "Wearables", 
    Outfit = "Wearables", 
    Waist = "Wearables"
};
v13.new = function(v15) --[[ Line: 69 ]] --[[ Name: new ]]
    -- upvalues: v13 (copy), l_Maid_0 (copy), l_ToolTemplate_0 (copy), l_ToolDesc_0 (copy), v14 (copy), v6 (copy), l_Players_0 (copy), l_ReplicatedStorage_0 (copy), l_ItemDisplay_0 (copy), l_PlayerGui_0 (copy), v4 (copy)
    if v15 == nil then
        warn("Invalid Tool, Received:", v15);
        return;
    else
        local v16 = setmetatable({}, v13);
        v16.Maid = l_Maid_0.new();
        v16.Tool = v15;
        v16.LastDrag = false;
        local v17 = l_ToolTemplate_0:Clone();
        v17.Name = v15.Name;
        v17:SetAttribute("Selected", false);
        local l_ToolImage_0 = v17.ToolImage;
        local l_ToolText_0 = v17.ToolText;
        local l_ItemCount_0 = v17.ItemCount;
        local l_ToolTip_0 = v17.ToolTip;
        local l_ToolObject_0 = v17.ToolObject;
        local l_HotbarObject_0 = v17.HotbarObject;
        local v24 = nil;
        local function v30(v25) --[[ Line: 91 ]] --[[ Name: UpdateToolCategory ]]
            -- upvalues: v24 (ref), l_ToolObject_0 (copy), l_ToolTip_0 (copy), l_Maid_0 (ref), l_ToolDesc_0 (ref), v14 (ref), v6 (ref), l_Players_0 (ref), l_ItemCount_0 (copy)
            if v24 then
                v24:Destroy();
                v24 = nil;
            end;
            v25 = v25 or l_ToolObject_0.Value;
            if v25 == nil then
                return;
            else
                l_ToolTip_0.Text = v25.ToolTip;
                v24 = l_Maid_0.new();
                v24:AddTask(v25:GetPropertyChangedSignal("ToolTip"):Connect(function() --[[ Line: 103 ]]
                    -- upvalues: l_ToolTip_0 (ref), v25 (ref)
                    l_ToolTip_0.Text = v25.ToolTip;
                end));
                local v26 = l_ToolDesc_0[v25.Name];
                if v26 ~= nil then
                    local v27 = "Category";
                    local v28 = v14[v26.Type] or "";
                    v25:SetAttribute(v27, v28);
                    if v26.OneTime == nil then
                        local v29 = v6.CheckItemAmount(l_Players_0.LocalPlayer, v25.Name);
                        if v29 > 1 then
                            l_ItemCount_0.Visible = true;
                            l_ItemCount_0.Text = ("x%*"):format(v29);
                        else
                            l_ItemCount_0.Visible = false;
                        end;
                    else
                        l_ItemCount_0.Visible = false;
                    end;
                else
                    if v25:GetAttribute("MeleeTool") then
                        v25:SetAttribute("Category", "Weapons");
                    end;
                    l_ItemCount_0.Visible = false;
                end;
                return;
            end;
        end;
        v30(v15);
        local l_Inventory_0 = l_ReplicatedStorage_0:WaitForChild("Stats" .. l_Players_0.LocalPlayer.Name):WaitForChild("Inventory"):WaitForChild("Inventory");
        v16.Maid:AddTask(l_Inventory_0.Changed:Connect(function() --[[ Line: 137 ]]
            -- upvalues: v30 (copy)
            v30();
        end));
        v16.Maid:AddTask(v17:GetAttributeChangedSignal("Selected"):Connect(function() --[[ Line: 141 ]]
            -- upvalues: v17 (copy)
            if v17:GetAttribute("Selected") then
                v17.ImageTransparency = 0.3;
                v17.Outline.ImageTransparency = 0;
                return;
            else
                v17.ImageTransparency = 0.55;
                v17.Outline.ImageTransparency = 0.55;
                return;
            end;
        end));
        v16.Maid:AddTask(v17:GetPropertyChangedSignal("Parent"):Connect(function() --[[ Line: 152 ]]
            -- upvalues: v17 (copy)
            if v17.Parent then
                if v17.Parent:IsA("ScrollingFrame") then
                    return;
                elseif v17.Parent:IsA("Frame") then

                end;
            end;
        end));
        v16.Maid:AddTask(v17.MouseEnter:Connect(function() --[[ Line: 164 ]]
            -- upvalues: l_ToolTip_0 (copy)
            l_ToolTip_0.Visible = true;
        end));
        v16.Maid:AddTask(v17.MouseLeave:Connect(function() --[[ Line: 168 ]]
            -- upvalues: l_ToolTip_0 (copy)
            l_ToolTip_0.Visible = false;
        end));
        l_ToolObject_0.Value = v15;
        v16.ItemDisplay = l_ItemDisplay_0.new({
            Gui = l_PlayerGui_0:WaitForChild("BackpackGui"), 
            Trade = false
        });
        local function v33(v32) --[[ Line: 176 ]] --[[ Name: UpdateDisplay ]]
            -- upvalues: v16 (copy), l_ToolObject_0 (copy), v17 (copy), l_ToolText_0 (copy), l_ToolDesc_0 (ref)
            v16.ItemDisplay:StopRotation();
            v16.ItemDisplay:RemoveAllItems();
            if v32 == nil then
                return;
            elseif l_ToolObject_0.Value.TextureId ~= "" then
                v17.ToolImage.Image = l_ToolObject_0.Value.TextureId;
                l_ToolText_0.Text = "";
                return;
            elseif l_ToolDesc_0[v32.Name] ~= nil then
                v16.ItemDisplay:StartRotation();
                v16.ItemDisplay:AddToolItem(v17.ItemDisplay, v32.Name, 1);
                v17.ToolImage.Image = "";
                l_ToolText_0.Text = "";
                return;
            else
                v17.ToolImage.Image = "";
                l_ToolText_0.Text = v32.Name;
                return;
            end;
        end;
        v33(l_ToolObject_0.Value);
        v16.Maid:AddTask(l_ToolObject_0:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 202 ]]
            -- upvalues: l_ToolObject_0 (copy), v17 (copy), v30 (copy), l_ToolText_0 (copy), v33 (copy)
            if l_ToolObject_0.Value ~= nil then
                v17.Name = l_ToolObject_0.Value.Name;
                v30(l_ToolObject_0.Value);
            else
                l_ToolText_0.Text = "";
                v17.ToolImage.Image = "";
            end;
            v33(l_ToolObject_0.Value);
        end));
        v16.ToolButton = v17;
        v16.ToolImage = l_ToolImage_0;
        v16.ToolText = l_ToolText_0;
        v16.ToolObject = l_ToolObject_0;
        v16.HotbarObject = l_HotbarObject_0;
        v16.Maid:AddTask(v16.ToolButton);
        v16.Drag = v4.new(v17);
        v16.Drag:Enable();
        return v16;
    end;
end;
v13.UpdateLayoutOrder = function(v34) --[[ Line: 240 ]] --[[ Name: UpdateLayoutOrder ]]
    local _ = v34.Tool;
    v34.ToolButton.LayoutOrder = 100;
end;
v13.Destroy = function(v36) --[[ Line: 248 ]] --[[ Name: Destroy ]]
    if v36.ItemDisplay then
        v36.ItemDisplay:RemoveAllItems();
        v36.ItemDisplay:Destroy();
    end;
    v36.Drag:Destroy();
    v36.Maid:Clean();
    setmetatable(v36, nil);
    v36 = nil;
end;
return v13;