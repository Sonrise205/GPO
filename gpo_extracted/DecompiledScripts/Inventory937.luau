local l_Players_0 = game:GetService("Players");
local _ = game:GetService("ReplicatedStorage");
local _ = game:GetService("TweenService");
local _ = game:GetService("UserInputService");
local l_HttpService_0 = game:GetService("HttpService");
local _ = game:GetService("RunService");
local l_ReplicatedStorage_1 = game:GetService("ReplicatedStorage");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_PlayerGui_0 = l_LocalPlayer_0:WaitForChild("PlayerGui");
local l_Modules_0 = l_ReplicatedStorage_1:WaitForChild("Modules");
local l_Shared_0 = l_Modules_0.Shared;
local l_Client_0 = l_Modules_0.Client;
local l_ToolDesc_0 = l_Modules_0:WaitForChild("ToolDesc");
local _ = require(l_Modules_0.Leveling);
local _ = require(l_Shared_0.GameUtils);
local _ = require(l_Shared_0.SoundUtils);
local v16 = require(l_ToolDesc_0);
local v17 = require(l_Shared_0.Queues.QueueTask);
local v18 = require(l_Modules_0.Module3D);
local v19 = require(l_Modules_0.RichText);
local _ = require(l_Shared_0.Maids.Maid);
local v21 = require(l_Modules_0.Titles);
local v22 = require(game.ReplicatedStorage.Modules.Trove);
local l_Events_0 = l_ReplicatedStorage_1:WaitForChild("Events");
local v24 = require(l_ReplicatedStorage_1.Modules.Shared.Signals.GoodSignal);
local l_RainbowGradient_0 = require(l_Client_0:WaitForChild("RainbowGradient"));
local l_Gradients_0 = script:WaitForChild("Gradients");
local v27 = {
    Uncommon = l_Gradients_0:WaitForChild("Uncommon"), 
    Rare = l_Gradients_0:WaitForChild("Rare"), 
    Epic = l_Gradients_0:WaitForChild("Epic"), 
    Legendary = l_Gradients_0:WaitForChild("Legendary"), 
    Mythical = l_Gradients_0:WaitForChild("Mythical"), 
    Collectable = l_Gradients_0:WaitForChild("Collectable")
};
local v28 = {
    Common = 0, 
    Uncommon = -200, 
    Rare = -400, 
    Epic = -600, 
    Legendary = -800, 
    Mythical = -1000, 
    Collectable = -1200
};
local v29 = {
    Mythical = 0, 
    Legendary = 1, 
    Epic = 2, 
    Rare = 3, 
    Common = 4
};
local l_Tools_0 = l_ReplicatedStorage_1:WaitForChild("Tools");
local v31 = {
    Initialized = false
};
local v32 = {
    HP = {
        Display = "Extra Health", 
        UsePercentValue = false, 
        Color = Color3.fromRGB(170, 255, 0)
    }, 
    Regen = {
        Display = "Health Regen", 
        UsePercentValue = false, 
        Color = Color3.fromRGB(170, 255, 127)
    }, 
    Stam = {
        Display = "Stamina Regen", 
        UsePercentValue = false, 
        Color = Color3.fromRGB(85, 255, 255)
    }, 
    MaxStam = {
        Display = "Extra Stamina", 
        UsePercentValue = false, 
        Color = Color3.fromRGB(0, 255, 255)
    }, 
    swordMultiplier = {
        Display = "Sword DMG Mult", 
        UsePercentValue = true, 
        Color = Color3.fromRGB(85, 85, 255)
    }, 
    strengthMultiplier = {
        Display = "STR DMG Mult", 
        UsePercentValue = true, 
        Color = Color3.fromRGB(255, 170, 127)
    }, 
    damageMultiplier = {
        Display = "DMG Multiplier", 
        UsePercentValue = true, 
        Color = Color3.fromRGB(255, 85, 0)
    }, 
    ReducedDMG = {
        Display = "Reduced DMG", 
        UsePercentValue = true, 
        Color = Color3.fromRGB(170, 170, 255)
    }, 
    BurnResistance = {
        Display = "Reduced Burn", 
        UsePercentValue = true, 
        Color = Color3.fromRGB(255, 85, 0)
    }, 
    FreezeResistance = {
        Display = "Reduced Freeze", 
        UsePercentValue = true, 
        Color = Color3.fromRGB(170, 255, 255)
    }, 
    AntiHeal = {
        Display = "Grevious Wounds", 
        UsePercentValue = true, 
        Color = Color3.fromRGB(57, 113, 0)
    }
};
local function _(v33, v34) --[[ Line: 92 ]] --[[ Name: roundNumber ]]
    return math.floor(v33 * 10 ^ v34) / 10 ^ v34;
end;
local function v42(v36, v37, v38) --[[ Line: 96 ]] --[[ Name: UpdateStatText ]]
    -- upvalues: v32 (copy)
    local v39 = v32[v37];
    local l_Color_0 = v39.Color;
    if typeof(v38) == "number" and v38 <= 0 then
        v36.Visible = false;
        return;
    else
        v36.Visible = true;
        local v41 = v39.UsePercentValue == true and math.floor(v38 * 100 * 100) / 100 .. "%" or math.floor(v38 * 100) / 100;
        v36.Text = ("%*: <font color=\"rgb(%*, %*, %*)\"><b>%*</b></font>"):format(v39.Display, math.floor(l_Color_0.R * 255), math.floor(l_Color_0.G * 255), math.floor(l_Color_0.B * 255), v41);
        return;
    end;
end;
v31.DisplayItemStats = function(v43, v44) --[[ Line: 114 ]] --[[ Name: DisplayItemStats ]]
    -- upvalues: l_ToolDesc_0 (copy), v16 (copy), v42 (copy)
    local l_FirstChild_0 = l_ToolDesc_0.ItemStats:FindFirstChild(v44);
    if l_FirstChild_0 == nil and v16[v44] and v16[v44].BaseItem ~= nil then
        l_FirstChild_0 = l_ToolDesc_0.ItemStats:FindFirstChild(v16[v44].BaseItem);
    end;
    local v46 = l_FirstChild_0 and l_FirstChild_0:GetAttributes() or {};
    for _, v48 in ipairs(v43:GetChildren()) do
        if v48:IsA("TextLabel") then
            local v49 = v46[v48.Name];
            v42(v48, v48.Name, v49 or 0);
        end;
    end;
end;
v31.Initialize = function(v50) --[[ Line: 131 ]] --[[ Name: Initialize ]]
    -- upvalues: v31 (copy), l_ReplicatedStorage_1 (copy), l_PlayerGui_0 (copy), v16 (copy), l_RainbowGradient_0 (copy), l_HttpService_0 (copy), l_Events_0 (copy), v19 (copy), l_LocalPlayer_0 (copy), v27 (copy), v29 (copy), v17 (copy), l_Tools_0 (copy), v18 (copy), v28 (copy), v21 (copy), l_ToolDesc_0 (copy), v42 (copy), v24 (copy), v22 (copy)
    if v31.Initialized then
        return;
    else
        local _ = l_ReplicatedStorage_1:WaitForChild("reservedCode");
        local l_v50_StatsFolder_0 = v50:GetStatsFolder();
        local l_Stats_0 = l_v50_StatsFolder_0:WaitForChild("Stats");
        local l_Inventory_0 = l_v50_StatsFolder_0:WaitForChild("Inventory");
        local l_Inventory_1 = l_Inventory_0:WaitForChild("Inventory");
        local l_Equiped_0 = l_Inventory_0:WaitForChild("Equiped");
        local l_VanitySlots_0 = l_Inventory_0:WaitForChild("VanitySlots");
        local l_FightingStyle_0 = l_Stats_0:WaitForChild("FightingStyle");
        local l_KatanaOrder_0 = l_Inventory_0:WaitForChild("KatanaOrder");
        local l_EquipedShip_0 = l_Inventory_0:WaitForChild("EquipedShip");
        local l_Titles_0 = l_v50_StatsFolder_0:WaitForChild("Titles");
        local l_AllTitles_0 = l_Titles_0:WaitForChild("AllTitles");
        local l_EquipedTitle_0 = l_Titles_0:WaitForChild("EquipedTitle");
        local l_AutoEquip_0 = l_v50_StatsFolder_0:WaitForChild("Settings"):WaitForChild("AutoEquip");
        local l_EquipedGrip_0 = l_v50_StatsFolder_0:WaitForChild("Grips"):WaitForChild("EquipedGrip");
        local l_Main_0 = l_PlayerGui_0:WaitForChild("Inventory", 360):WaitForChild("Main");
        local l_Inventory_2 = l_Main_0:WaitForChild("Inventory");
        local l_List_0 = l_Inventory_2:WaitForChild("List");
        local l_TopTabs_0 = l_Main_0:WaitForChild("TopTabs");
        local l_UIGridLayout_0 = l_List_0:WaitForChild("UIGridLayout");
        local l_UIPadding_0 = l_List_0:WaitForChild("UIPadding");
        local l_Search_0 = l_Inventory_2:WaitForChild("Search");
        local l_Input_0 = l_Search_0:WaitForChild("Input");
        local l_Clear_0 = l_Search_0:WaitForChild("Clear");
        local l_ItemMenu_0 = l_Main_0:WaitForChild("ItemMenu");
        local l_Health_0 = l_ItemMenu_0:WaitForChild("Health");
        local l_Bar_0 = l_Health_0:WaitForChild("Bar");
        local l_Equip_0 = l_ItemMenu_0:WaitForChild("Equip");
        local l_Usage_0 = l_Equip_0:WaitForChild("Usage");
        local l_Drop_0 = l_ItemMenu_0:WaitForChild("Drop");
        local l_MiscButtons_0 = l_ItemMenu_0:WaitForChild("MiscButtons");
        local _ = l_MiscButtons_0:WaitForChild("Vanity");
        local l_Vanity_1 = l_MiscButtons_0:WaitForChild("Vanity");
        local l_CustomTailoredToggle_0 = l_MiscButtons_0:WaitForChild("CustomTailoredToggle");
        local l_SwordButtons_0 = l_ItemMenu_0:WaitForChild("SwordButtons");
        local l_Stats_1 = l_ItemMenu_0:WaitForChild("Stats");
        local l_Boosts_0 = l_Main_0:WaitForChild("StatusBoosts"):WaitForChild("Boosts");
        local l_Frames_0 = l_Main_0:WaitForChild("Selections"):WaitForChild("Frames");
        local l_RarityFilter_0 = l_Main_0:WaitForChild("RarityFilter");
        local l_Grips_0 = l_Main_0:WaitForChild("Grips");
        local l_List_1 = l_Grips_0:WaitForChild("List");
        local l_LoadoutFrame_0 = l_Main_0:WaitForChild("LoadoutFrame");
        l_Main_0.Visible = false;
        local v93 = {};
        local v94 = {};
        local v95 = {};
        local v96 = {};
        local v97 = 1;
        local v98 = nil;
        local _ = function(v99, v100) --[[ Line: 214 ]] --[[ Name: BindRainbowGradient ]]
            -- upvalues: v16 (ref), l_RainbowGradient_0 (ref)
            local l_Text_0 = v99.Parent.Text;
            local v102 = "";
            if v16[l_Text_0] then
                v102 = v16[l_Text_0].Rare;
            end;
            task.spawn(function() --[[ Line: 222 ]]
                -- upvalues: v100 (copy), v99 (copy), l_Text_0 (copy), v16 (ref), v102 (ref), l_RainbowGradient_0 (ref)
                while true do
                    local _ = task.wait(0.02);
                    if v100 then
                        v100();
                    end;
                    if v99.Parent ~= nil then
                        if v99.Parent.Text ~= l_Text_0 then
                            if v16[v99.Parent.Text] == nil then
                                return;
                            elseif v16[v99.Parent.Text].Rare ~= v102 then
                                break;
                            end;
                        end;
                        v99.Color = l_RainbowGradient_0:GetColor();
                    else
                        break;
                    end;
                end;
            end);
        end;
        local v105 = Vector2.new(1920, 1080);
        local function _(v106) --[[ Line: 250 ]] --[[ Name: GetVectorAverage ]]
            return (v106.X + v106.Y) / 2;
        end;
        local function _() --[[ Line: 254 ]] --[[ Name: GetScreenRatio ]]
            -- upvalues: v105 (copy)
            local l_ViewportSize_0 = workspace.Camera.ViewportSize;
            local v109 = (l_ViewportSize_0.X + l_ViewportSize_0.Y) / 2;
            local l_v105_0 = v105;
            return v109 / ((l_v105_0.X + l_v105_0.Y) / 2);
        end;
        local v112 = 5;
        local l_ViewportSize_1 = workspace.Camera.ViewportSize;
        v112 = math.round(v112 * ((l_ViewportSize_1.X + l_ViewportSize_1.Y) / 2 / ((v105.X + v105.Y) / 2)));
        l_UIGridLayout_0.CellPadding = UDim2.new(0, v112, 0, v112);
        local l_battleRoyaleDrop_0 = l_ReplicatedStorage_1:FindFirstChild("battleRoyaleDrop");
        local l_tradingHUB_0 = l_ReplicatedStorage_1:FindFirstChild("tradingHUB");
        local function _() --[[ Line: 268 ]] --[[ Name: EnableDropButton ]]
            -- upvalues: l_battleRoyaleDrop_0 (ref), l_Drop_0 (copy)
            if not l_battleRoyaleDrop_0 then
                l_Drop_0.Visible = false;
                return;
            else
                l_Drop_0.Visible = true;
                return;
            end;
        end;
        local v117 = nil;
        local function _(v118, v119) --[[ Line: 278 ]] --[[ Name: IsItemEquipped ]]
            -- upvalues: v16 (ref), l_EquipedShip_0 (copy)
            local v120 = table.find(v118, v119);
            local v121 = v16[v119];
            if v121 and v121.Type == "Ship" then
                v120 = l_EquipedShip_0.Value == v119;
            end;
            return v120;
        end;
        l_ViewportSize_1 = function(v123, v124, v125) --[[ Line: 290 ]] --[[ Name: UpdateItemButton ]]
            -- upvalues: v16 (ref), l_HttpService_0 (ref), l_Equiped_0 (copy), l_EquipedShip_0 (copy)
            local l_Border_0 = v123.Border;
            local _ = v16[v124];
            local v128 = l_HttpService_0:JSONDecode(l_Equiped_0.Value);
            local v129 = table.find(v128, v124);
            local v130 = v16[v124];
            if v130 and v130.Type == "Ship" then
                v129 = l_EquipedShip_0.Value == v124;
            end;
            if (v129 and true or false) == true then
                l_Border_0.ImageTransparency = 0;
            else
                l_Border_0.ImageTransparency = 0.9;
            end;
            v123.Amount.Text = ("x%*"):format(v125);
        end;
        local function v144(v131, v132) --[[ Line: 315 ]] --[[ Name: UpdateUsageButton ]]
            -- upvalues: v98 (ref), l_HttpService_0 (ref), l_Equiped_0 (copy), v16 (ref), l_EquipedShip_0 (copy), l_Equip_0 (copy), l_Usage_0 (copy)
            v131 = v131 or v98;
            if v131 == nil then
                return;
            else
                v132 = v132 or v131:GetAttribute("itemName");
                if v132 == nil then
                    return;
                else
                    local v133 = l_HttpService_0:JSONDecode(l_Equiped_0.Value);
                    local l_v132_0 = v132;
                    local v135 = table.find(v133, l_v132_0);
                    local v136 = v16[l_v132_0];
                    if v136 and v136.Type == "Ship" then
                        v135 = l_EquipedShip_0.Value == l_v132_0;
                    end;
                    local v137 = v135 and true or false;
                    local v138 = v16[v132];
                    l_Equip_0.Visible = v138.Type ~= "Display";
                    if v137 == true then
                        l_Usage_0.Text = "Unequip";
                    elseif v138.OneTime then
                        if v138.Type == "Fruit" then
                            l_Usage_0.Text = "Equip";
                        else
                            l_Usage_0.Text = "Use";
                        end;
                    else
                        l_Usage_0.Text = "Equip";
                    end;
                    if v138 and v138.Type == "Ship" then
                        l_v132_0 = v131;
                        v135 = v132;
                        v136 = v131:GetAttribute("amountOwned") or 1;
                        local l_Border_1 = l_v132_0.Border;
                        local _ = v16[v135];
                        local v141 = l_HttpService_0:JSONDecode(l_Equiped_0.Value);
                        local v142 = table.find(v141, v135);
                        local v143 = v16[v135];
                        if v143 and v143.Type == "Ship" then
                            v142 = l_EquipedShip_0.Value == v135;
                        end;
                        if (v142 and true or false) == true then
                            l_Border_1.ImageTransparency = 0;
                        else
                            l_Border_1.ImageTransparency = 0.9;
                        end;
                        l_v132_0.Amount.Text = ("x%*"):format(v136);
                    end;
                    return;
                end;
            end;
        end;
        local function v150(v145) --[[ Line: 348 ]] --[[ Name: UpdateSwordButtons ]]
            -- upvalues: v16 (ref), l_SwordButtons_0 (copy), l_FightingStyle_0 (copy), l_HttpService_0 (ref), l_KatanaOrder_0 (copy)
            local v146 = v16[v145];
            if v145:match("Katana") ~= nil or v146.isKatana ~= nil then
                l_SwordButtons_0.Visible = true;
            else
                l_SwordButtons_0.Visible = false;
            end;
            if l_FightingStyle_0.Value ~= "2SS" and l_FightingStyle_0.Value ~= "3SS" then
                l_SwordButtons_0.Visible = false;
                return;
            else
                if l_FightingStyle_0.Value ~= "3SS" then
                    l_SwordButtons_0.Head.Visible = false;
                else
                    l_SwordButtons_0.Head.Visible = true;
                end;
                for v147, v148 in pairs(l_HttpService_0:JSONDecode(l_KatanaOrder_0.Value)) do
                    local v149 = v148 == v145 and Color3.fromRGB(170, 170, 255) or Color3.fromRGB(255, 255, 255);
                    l_SwordButtons_0[v147].TextColor3 = v149;
                end;
                return;
            end;
        end;
        local v151 = {
            Cap = true, 
            Cape = true, 
            Glasses = true, 
            Jaw = true, 
            Back = true, 
            Outfit = true, 
            Headband = true, 
            Ears = true, 
            NormalOutfit = true, 
            Head = true, 
            Waist = true, 
            ASESlot = true, 
            TorsoScarf = true
        };
        local function v159(v152, v153) --[[ Line: 390 ]] --[[ Name: UpdateVanityButton ]]
            -- upvalues: v98 (ref), v16 (ref), v151 (copy), l_Vanity_1 (copy), l_HttpService_0 (ref), l_VanitySlots_0 (copy), l_EquipedShip_0 (copy)
            v152 = v152 or v98;
            if v152 == nil then
                return;
            else
                v153 = v153 or v152:GetAttribute("itemName");
                if v153 == nil then
                    return;
                else
                    local v154 = v16[v153];
                    if v154 == nil or v151[v154.Type] == nil then
                        l_Vanity_1.Visible = false;
                        return;
                    else
                        l_Vanity_1.Visible = true;
                        local v155 = l_HttpService_0:JSONDecode(l_VanitySlots_0.Value);
                        local l_v153_0 = v153;
                        local v157 = table.find(v155, l_v153_0);
                        local v158 = v16[l_v153_0];
                        if v158 and v158.Type == "Ship" then
                            v157 = l_EquipedShip_0.Value == l_v153_0;
                        end;
                        l_Vanity_1.Text = "Set Vanity: " .. ((v157 and true or false) and "<b><font color=\"rgb(170,255,0)\">ON</font></b>" or "<b><font color=\"rgb(255, 0, 0)\">OFF</font></b>");
                        return;
                    end;
                end;
            end;
        end;
        local function v164(v160, v161) --[[ Line: 414 ]] --[[ Name: UpdateTailoredButton ]]
            -- upvalues: v98 (ref), v16 (ref), l_HttpService_0 (ref), l_v50_StatsFolder_0 (copy), l_CustomTailoredToggle_0 (copy)
            v160 = v160 or v98;
            if v160 == nil then
                return;
            else
                v161 = v161 or v160:GetAttribute("itemName");
                if v161 == nil then
                    return;
                else
                    local v162 = v16[v161];
                    local v163 = l_HttpService_0:JSONDecode(l_v50_StatsFolder_0.Inventory.CustomTailoredOutfitsToggle.Value);
                    if v162 == nil or v163[v161] == nil then
                        l_CustomTailoredToggle_0.Visible = false;
                        return;
                    else
                        l_CustomTailoredToggle_0.Visible = true;
                        l_CustomTailoredToggle_0.Text = "Tailored: " .. (v163[v161] == true and "<b><font color=\"rgb(170,255,0)\">ON</font></b>" or "<b><font color=\"rgb(255, 0, 0)\">OFF</font></b>");
                        return;
                    end;
                end;
            end;
        end;
        local function v181(v165, v166, _) --[[ Line: 439 ]] --[[ Name: UpdateItemMenu ]]
            -- upvalues: v16 (ref), v98 (ref), l_ItemMenu_0 (copy), l_RainbowGradient_0 (ref), v117 (ref), l_tradingHUB_0 (ref), l_Health_0 (copy), l_Events_0 (ref), l_Bar_0 (copy), v144 (copy), v150 (copy), v159 (copy), v164 (copy), v31 (ref), l_Stats_1 (copy), v19 (ref)
            local v168 = v16[v166];
            if v168 == nil then
                return;
            elseif v165 == v98 then
                l_ItemMenu_0.Visible = false;
                v98 = nil;
                return;
            else
                local l_UIGradient_0 = v165.Border.UIGradient;
                l_ItemMenu_0.Visible = true;
                v98 = v165;
                l_ItemMenu_0.ItemName.Text = v166;
                l_ItemMenu_0.Rarity.Text = v168.Chroma and v168.Rare .. " Chroma" or v168.Rare;
                l_ItemMenu_0.Rarity.UIGradient.Color = l_UIGradient_0.Color;
                if v168.Rare == "Legendary" or v168.Chroma ~= nil then
                    local l_UIGradient_1 = l_ItemMenu_0.Rarity.UIGradient;
                    local l_Text_1 = l_UIGradient_1.Parent.Text;
                    local v172 = "";
                    if v16[l_Text_1] then
                        v172 = v16[l_Text_1].Rare;
                    end;
                    local l_spawn_0 = task.spawn;
                    local v174 = nil;
                    do
                        local l_v172_0 = v172;
                        l_spawn_0(function() --[[ Line: 222 ]]
                            -- upvalues: v174 (copy), l_UIGradient_1 (copy), l_Text_1 (copy), v16 (ref), l_v172_0 (ref), l_RainbowGradient_0 (ref)
                            while true do
                                local _ = task.wait(0.02);
                                if v174 then
                                    v174();
                                end;
                                if l_UIGradient_1.Parent ~= nil then
                                    if l_UIGradient_1.Parent.Text ~= l_Text_1 then
                                        if v16[l_UIGradient_1.Parent.Text] == nil then
                                            return;
                                        elseif v16[l_UIGradient_1.Parent.Text].Rare ~= l_v172_0 then
                                            break;
                                        end;
                                    end;
                                    l_UIGradient_1.Color = l_RainbowGradient_0:GetColor();
                                else
                                    break;
                                end;
                            end;
                        end);
                    end;
                end;
                if v117 ~= nil and coroutine.status(v117) ~= "dead" then
                    task.cancel(v117);
                    v117 = nil;
                end;
                v117 = task.spawn(function() --[[ Line: 471 ]]
                    -- upvalues: v168 (copy), l_tradingHUB_0 (ref), l_Health_0 (ref), l_Events_0 (ref), v166 (copy), v98 (ref), v165 (copy), l_Bar_0 (ref)
                    if v168.Type == "Ship" and l_tradingHUB_0 == nil then
                        l_Health_0.Visible = true;
                        local v177 = l_Events_0.ShipEvents.Spawn:InvokeServer({
                            action = "getHP", 
                            ship = v166
                        });
                        if v98 ~= v165 then
                            return;
                        elseif v177 then
                            local v178, v179 = unpack(v177);
                            v178 = math.clamp(v178, 0, v179);
                            local v180 = v178 / v179;
                            l_Bar_0.BackgroundColor3 = Color3.fromRGB(255, 0, 0):Lerp(Color3.fromRGB(170, 255, 0), v180);
                            l_Bar_0.Size = UDim2.new(v180, 0, 1, 0);
                            l_Health_0.Display.Text = v178 .. "/" .. v179;
                            return;
                        end;
                    else
                        l_Health_0.Visible = false;
                    end;
                end);
                v144(v165, v166);
                v150(v166);
                v159(v165, v166);
                v164(v165, v166);
                v31.DisplayItemStats(l_Stats_1, v166);
                v19:New(l_ItemMenu_0.Desc, v168.Desc, {
                    ZIndex = 10, 
                    TextScale = 0.2, 
                    AnimateStepFrequency = 3
                }):Animate(true);
                return;
            end;
        end;
        local v182 = {};
        for _, v184 in ipairs(l_SwordButtons_0:GetChildren()) do
            if v182[v184.Name] ~= true and v184:IsA("TextButton") then
                v184.MouseButton1Click:Connect(function() --[[ Line: 517 ]]
                    -- upvalues: v98 (ref), v16 (ref), l_Events_0 (ref), v184 (copy), v150 (copy)
                    if v98 == nil then
                        return;
                    else
                        local l_v98_Attribute_0 = v98:GetAttribute("itemName");
                        if l_v98_Attribute_0 == nil then
                            warn("Missing ItemName");
                            return;
                        else
                            local v186 = v16[l_v98_Attribute_0];
                            if l_v98_Attribute_0:match("Katana") ~= nil or v186.isKatana ~= nil then
                                l_Events_0.Tools:InvokeServer("katanaOrder", v184.Name, l_v98_Attribute_0);
                            end;
                            v150(l_v98_Attribute_0);
                            return;
                        end;
                    end;
                end);
            end;
        end;
        local v187 = false;
        l_Equip_0.MouseButton1Click:Connect(function() --[[ Line: 537 ]]
            -- upvalues: v187 (ref), l_LocalPlayer_0 (ref), v98 (ref), l_HttpService_0 (ref), l_Equiped_0 (copy), v16 (ref), l_EquipedShip_0 (copy), l_Events_0 (ref), v144 (copy)
            if v187 == true then
                return;
            else
                local l_Character_0 = l_LocalPlayer_0.Character;
                if l_Character_0 == nil then
                    return;
                else
                    local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                    if not l_Humanoid_0 then
                        return;
                    elseif l_Humanoid_0.Health <= 0 then
                        return;
                    elseif _G.check:inspect(l_Character_0) == false and l_Humanoid_0.Sit == false and l_Character_0:FindFirstChild("Disabled") == nil or _G.canuse == false then
                        return;
                    else
                        local l_v98_0 = v98;
                        if l_v98_0 == nil then
                            return;
                        else
                            local l_l_v98_0_Attribute_0 = l_v98_0:GetAttribute("itemName");
                            if l_l_v98_0_Attribute_0 == nil then
                                return;
                            else
                                local v192 = l_HttpService_0:JSONDecode(l_Equiped_0.Value);
                                local v193 = table.find(v192, l_l_v98_0_Attribute_0);
                                local v194 = v16[l_l_v98_0_Attribute_0];
                                if v194 and v194.Type == "Ship" then
                                    v193 = l_EquipedShip_0.Value == l_l_v98_0_Attribute_0;
                                end;
                                local v195 = v193 and true or false;
                                v187 = true;
                                if v195 == false and l_EquipedShip_0.Value ~= l_l_v98_0_Attribute_0 then
                                    script.equipSFX:Play();
                                    l_Events_0.Tools:InvokeServer("equip", l_l_v98_0_Attribute_0);
                                else
                                    script.unequipSFX:Play();
                                    l_Events_0.Tools:InvokeServer("unequip", l_l_v98_0_Attribute_0);
                                end;
                                v187 = false;
                                v144();
                                return;
                            end;
                        end;
                    end;
                end;
            end;
        end);
        l_Vanity_1.MouseButton1Click:Connect(function() --[[ Line: 573 ]]
            -- upvalues: v98 (ref), l_Events_0 (ref), v159 (copy)
            local l_v98_1 = v98;
            if l_v98_1 == nil then
                return;
            else
                local l_l_v98_1_Attribute_0 = l_v98_1:GetAttribute("itemName");
                if l_l_v98_1_Attribute_0 == nil then
                    return;
                else
                    l_Events_0.Tools:InvokeServer("vanitySlot", l_l_v98_1_Attribute_0);
                    v159();
                    return;
                end;
            end;
        end);
        l_CustomTailoredToggle_0.MouseButton1Click:Connect(function() --[[ Line: 585 ]]
            -- upvalues: v98 (ref), l_Events_0 (ref), v164 (copy)
            local l_v98_2 = v98;
            if l_v98_2 == nil then
                return;
            else
                local l_l_v98_2_Attribute_0 = l_v98_2:GetAttribute("itemName");
                if l_l_v98_2_Attribute_0 == nil then
                    return;
                else
                    l_Events_0.Tools:InvokeServer("toggleCustomTailored", l_l_v98_2_Attribute_0);
                    v164();
                    return;
                end;
            end;
        end);
        l_Drop_0.MouseButton1Click:Connect(function() --[[ Line: 597 ]]
            -- upvalues: l_battleRoyaleDrop_0 (ref), v98 (ref)
            if l_battleRoyaleDrop_0 and v98 then
                l_battleRoyaleDrop_0:FireServer(v98:GetAttribute("itemName"));
            end;
        end);
        local function v209(v200, v201, v202) --[[ Line: 604 ]] --[[ Name: UpdateGradientColor ]]
            -- upvalues: v16 (ref), v27 (ref), l_RainbowGradient_0 (ref)
            local v203 = v16[v200];
            if v203 == nil then
                return;
            else
                local v204 = v27[v203.Rare];
                if v204 == nil then
                    return;
                else
                    v201.Enabled = true;
                    v201.Color = v204.Color;
                    if v203.Rare == "Legendary" or v203.Chroma ~= nil then
                        local l_Text_2 = v201.Parent.Text;
                        local v206 = "";
                        if v16[l_Text_2] then
                            v206 = v16[l_Text_2].Rare;
                        end;
                        do
                            local l_v206_0 = v206;
                            task.spawn(function() --[[ Line: 222 ]]
                                -- upvalues: v202 (copy), v201 (copy), l_Text_2 (copy), v16 (ref), l_v206_0 (ref), l_RainbowGradient_0 (ref)
                                while true do
                                    local _ = task.wait(0.02);
                                    if v202 then
                                        v202();
                                    end;
                                    if v201.Parent ~= nil then
                                        if v201.Parent.Text ~= l_Text_2 then
                                            if v16[v201.Parent.Text] == nil then
                                                return;
                                            elseif v16[v201.Parent.Text].Rare ~= l_v206_0 then
                                                break;
                                            end;
                                        end;
                                        v201.Color = l_RainbowGradient_0:GetColor();
                                    else
                                        break;
                                    end;
                                end;
                            end);
                        end;
                    end;
                    return;
                end;
            end;
        end;
        warn("Todo: REPLACE THIS");
        _G.displayRareItem = v209;
        local v210 = {};
        local function v211() --[[ Line: 627 ]] --[[ Name: ExtraCallback ]]
            -- upvalues: l_Grips_0 (copy)
            if l_Grips_0.Visible == false then
                task.wait(1);
            end;
        end;
        local function v224(v212, v213) --[[ Line: 633 ]] --[[ Name: AddGripToInventory ]]
            -- upvalues: v16 (ref), v210 (copy), v29 (ref), v211 (copy), v27 (ref), l_RainbowGradient_0 (ref), l_Events_0 (ref), v19 (ref), l_Grips_0 (copy), l_List_1 (copy)
            local v214 = v16[v212];
            local v215 = v210[v212];
            if v215 == nil then
                v215 = script.GripTemplate:Clone();
                v215.Name = v212;
                v215.LayoutOrder = v29[v214.Rare];
                v210[v212] = v215;
                v215.GripName.Text = v212;
                local l_Gradient_0 = v215.GripName.Gradient;
                local l_v211_0 = v211;
                local v218 = v16[v212];
                if v218 ~= nil then
                    local v219 = v27[v218.Rare];
                    if v219 ~= nil then
                        l_Gradient_0.Enabled = true;
                        l_Gradient_0.Color = v219.Color;
                        if v218.Rare == "Legendary" or v218.Chroma ~= nil then
                            local l_Text_3 = l_Gradient_0.Parent.Text;
                            local v221 = "";
                            if v16[l_Text_3] then
                                v221 = v16[l_Text_3].Rare;
                            end;
                            do
                                local l_v221_0 = v221;
                                task.spawn(function() --[[ Line: 222 ]]
                                    -- upvalues: l_v211_0 (copy), l_Gradient_0 (copy), l_Text_3 (copy), v16 (ref), l_v221_0 (ref), l_RainbowGradient_0 (ref)
                                    while true do
                                        local _ = task.wait(0.02);
                                        if l_v211_0 then
                                            l_v211_0();
                                        end;
                                        if l_Gradient_0.Parent ~= nil then
                                            if l_Gradient_0.Parent.Text ~= l_Text_3 then
                                                if v16[l_Gradient_0.Parent.Text] == nil then
                                                    return;
                                                elseif v16[l_Gradient_0.Parent.Text].Rare ~= l_v221_0 then
                                                    break;
                                                end;
                                            end;
                                            l_Gradient_0.Color = l_RainbowGradient_0:GetColor();
                                        else
                                            break;
                                        end;
                                    end;
                                end);
                            end;
                        end;
                    end;
                end;
                v215.MouseButton1Click:Connect(function() --[[ Line: 648 ]]
                    -- upvalues: l_Events_0 (ref), v212 (copy), v19 (ref), l_Grips_0 (ref), v214 (copy)
                    l_Events_0.Tools:InvokeServer("equipGrip", v212);
                    v19:New(l_Grips_0.Description, v214.Desc, {
                        ZIndex = 10, 
                        TextScale = 0.15, 
                        AnimateStepFrequency = 3
                    }):Animate(true);
                end);
                v215.Parent = l_List_1;
            end;
            v215.Owned.Text = ("x%*"):format(v213);
        end;
        local function v234() --[[ Line: 663 ]] --[[ Name: EquipGripUpdated ]]
            -- upvalues: l_EquipedGrip_0 (copy), l_Grips_0 (copy), v211 (copy), v16 (ref), v27 (ref), l_RainbowGradient_0 (ref)
            if l_EquipedGrip_0.Value == "" then
                l_Grips_0.Current.Text = "None";
                return;
            else
                l_Grips_0.Current.Text = l_EquipedGrip_0.Value;
                local l_Value_0 = l_EquipedGrip_0.Value;
                local l_Gradient_1 = l_Grips_0.Current.Gradient;
                local l_v211_1 = v211;
                local v228 = v16[l_Value_0];
                if v228 == nil then
                    return;
                else
                    local v229 = v27[v228.Rare];
                    if v229 == nil then
                        return;
                    else
                        l_Gradient_1.Enabled = true;
                        l_Gradient_1.Color = v229.Color;
                        if v228.Rare == "Legendary" or v228.Chroma ~= nil then
                            local l_Text_4 = l_Gradient_1.Parent.Text;
                            local v231 = "";
                            if v16[l_Text_4] then
                                v231 = v16[l_Text_4].Rare;
                            end;
                            do
                                local l_v231_0 = v231;
                                task.spawn(function() --[[ Line: 222 ]]
                                    -- upvalues: l_v211_1 (copy), l_Gradient_1 (copy), l_Text_4 (copy), v16 (ref), l_v231_0 (ref), l_RainbowGradient_0 (ref)
                                    while true do
                                        local _ = task.wait(0.02);
                                        if l_v211_1 then
                                            l_v211_1();
                                        end;
                                        if l_Gradient_1.Parent ~= nil then
                                            if l_Gradient_1.Parent.Text ~= l_Text_4 then
                                                if v16[l_Gradient_1.Parent.Text] == nil then
                                                    return;
                                                elseif v16[l_Gradient_1.Parent.Text].Rare ~= l_v231_0 then
                                                    break;
                                                end;
                                            end;
                                            l_Gradient_1.Color = l_RainbowGradient_0:GetColor();
                                        else
                                            break;
                                        end;
                                    end;
                                end);
                            end;
                        end;
                        return;
                    end;
                end;
            end;
        end;
        local v235 = {};
        local function v239(v236) --[[ Line: 675 ]] --[[ Name: UpdateVanityFrame ]]
            -- upvalues: v93 (copy), v235 (copy)
            local v237 = v93[v236];
            if v237 == nil then
                return;
            else
                v237.vanityDisplay.Visible = false;
                local v238 = v235[v236];
                if v238 == nil then
                    return;
                else
                    v237.vanityDisplay.Visible = true;
                    if v238 == true then
                        v237.vanityDisplay.ImageColor3 = Color3.fromRGB(255, 0, 0);
                        return;
                    else
                        v237.vanityDisplay.ImageColor3 = Color3.fromRGB(255, 255, 255);
                        return;
                    end;
                end;
            end;
        end;
        local function v246() --[[ Line: 694 ]] --[[ Name: UpdateVanityItems ]]
            -- upvalues: l_HttpService_0 (ref), l_v50_StatsFolder_0 (copy), v235 (copy), v239 (copy)
            local v240 = l_HttpService_0:JSONDecode(l_v50_StatsFolder_0.Inventory.VanitySlots.Value);
            local v241 = table.clone(v235);
            for _, v243 in pairs(v240) do
                v241[v243] = nil;
                v235[v243] = true;
                v239(v243);
            end;
            for v244, _ in pairs(v241) do
                v235[v244] = nil;
                v239(v244);
            end;
        end;
        l_v50_StatsFolder_0.Inventory.VanitySlots.Changed:Connect(v246);
        v246();
        local v247 = v17.new();
        local v248 = "None";
        local v249 = {
            Wearables = {
                Back = true, 
                Cap = true, 
                Cape = true, 
                Ears = true, 
                Glasses = true, 
                Headband = true, 
                Jaw = true, 
                NormalOutfit = true, 
                Outfit = true, 
                Waist = true, 
                ASESlot = true
            }, 
            Weapons = {
                Gun = true, 
                Katana = true, 
                Katana2 = true
            }, 
            Fruit = {
                Fruit = true
            }, 
            Items = {
                Artifact = true, 
                Back2 = true, 
                Baloon = true, 
                Book = true, 
                Core = true, 
                Display = true, 
                Drink = true, 
                ETPose = true, 
                Egg = true, 
                Essence = true, 
                Food = true, 
                FruitBag = true, 
                FruitChest = true, 
                FruitRemover = true, 
                Hammer = true, 
                Item = true, 
                Key = true, 
                Mount = true, 
                Pet = true, 
                ["Fishing Rod"] = true
            }, 
            Ships = {
                Ship = true
            }, 
            Fish = {
                Fish = true
            }, 
            Cosmetics = {
                Head = true, 
                NormalOutfit = true, 
                BattlePassItem = true
            }
        };
        local v250 = {};
        local v251 = {};
        local v252 = Vector2.one * -20;
        local l_AbsoluteCellSize_0 = l_UIGridLayout_0.AbsoluteCellSize;
        local l_AbsoluteWindowSize_0 = l_List_0.AbsoluteWindowSize;
        local v255 = l_AbsoluteWindowSize_0 / l_AbsoluteCellSize_0;
        v255 = Vector2.new(math.floor(v255.X), (math.ceil(v255.Y)));
        local v256 = false;
        local v257 = "";
        local v258 = "None";
        local function v268() --[[ Line: 792 ]] --[[ Name: RecalculateCells ]]
            -- upvalues: v256 (ref), l_List_0 (copy), v252 (ref), v255 (ref), l_AbsoluteCellSize_0 (ref), l_UIGridLayout_0 (copy), l_AbsoluteWindowSize_0 (ref), v251 (copy), v95 (copy), v250 (ref), l_UIPadding_0 (copy)
            if v256 == true then
                return;
            elseif l_List_0.ScrollingEnabled == false then
                return;
            elseif (l_List_0.CanvasPosition - v252).Magnitude < v255.Y then
                return;
            else
                l_AbsoluteCellSize_0 = l_UIGridLayout_0.AbsoluteCellSize;
                v252 = l_List_0.CanvasPosition;
                l_AbsoluteWindowSize_0 = l_List_0.AbsoluteWindowSize;
                v255 = l_AbsoluteWindowSize_0 / l_AbsoluteCellSize_0;
                v255 = Vector2.new(math.floor(v255.X), (math.ceil(v255.Y)));
                local v259 = l_List_0.CanvasPosition / l_AbsoluteCellSize_0;
                v259 = Vector2.new(math.floor(v259.X), (math.floor(v259.Y)));
                for v260, v261 in pairs(v251) do
                    if v256 == true then
                        return;
                    else
                        local l_Y_0 = v261.Y;
                        local v263 = false;
                        if v259.Y <= l_Y_0 then
                            v263 = l_Y_0 <= v259.Y + v255.Y;
                        end;
                        if not v263 then
                            v95[v261.Object].Visible = false;
                            v261.Object.Parent = nil;
                            v251[v260] = nil;
                        end;
                    end;
                end;
                for v264 = v259.X, v259.X + v255.X do
                    if v256 == true then
                        return;
                    else
                        for v265 = v259.Y, v259.Y + v255.Y do
                            if v256 == true then
                                return;
                            else
                                local v266 = ("%*, %*"):format(v264, v265);
                                local v267 = v250[v266];
                                if v267 and v251[v266] == nil then
                                    v95[v267].Visible = true;
                                    v267.Parent = l_List_0;
                                    v251[v266] = {
                                        X = v264, 
                                        Y = v265, 
                                        Object = v267
                                    };
                                end;
                            end;
                        end;
                    end;
                end;
                l_UIPadding_0.PaddingTop = UDim.new(0, l_AbsoluteCellSize_0.Y * v259.Y);
                return;
            end;
        end;
        l_List_0:GetPropertyChangedSignal("CanvasPosition"):Connect(function() --[[ Line: 849 ]]
            -- upvalues: v256 (ref), v268 (copy)
            if v256 == true then
                return;
            else
                v268();
                return;
            end;
        end);
        local function v330(v269) --[[ Line: 854 ]] --[[ Name: RefreshInventory ]]
            -- upvalues: v257 (ref), l_List_0 (copy), l_UIPadding_0 (copy), v256 (ref), l_HttpService_0 (ref), l_Inventory_1 (copy), l_Equiped_0 (copy), v93 (copy), v210 (copy), l_AbsoluteCellSize_0 (ref), l_UIGridLayout_0 (copy), l_AbsoluteWindowSize_0 (ref), v255 (ref), l_Input_0 (copy), v16 (ref), v224 (copy), l_Tools_0 (ref), v248 (ref), v258 (ref), v249 (copy), l_EquipedShip_0 (copy), v94 (copy), v97 (ref), l_RainbowGradient_0 (ref), v27 (ref), v96 (copy), v18 (ref), v95 (copy), v181 (copy), v239 (copy), v28 (ref), v251 (copy), v250 (ref), v112 (ref), v98 (ref), l_ItemMenu_0 (copy)
            v269 = v257 ~= "";
            if v269 == true then
                l_List_0.ScrollingEnabled = false;
                l_List_0.CanvasPosition = Vector2.new(0, 0);
                l_UIPadding_0.PaddingTop = UDim.new(0, 0);
            end;
            v256 = true;
            local v270 = l_HttpService_0:JSONDecode(l_Inventory_1.Value);
            local _ = l_HttpService_0:JSONDecode(l_Equiped_0.Value);
            local v272 = 0;
            local v273 = table.clone(v93);
            local v274 = table.clone(v210);
            local v275 = {};
            local v276 = {
                Common = 0, 
                Uncommon = 0, 
                Rare = 0, 
                Epic = 0, 
                Legendary = 0, 
                Mythical = 0, 
                Collectable = 0, 
                Equipped = 0
            };
            l_AbsoluteCellSize_0 = l_UIGridLayout_0.AbsoluteCellSize;
            l_AbsoluteWindowSize_0 = l_List_0.AbsoluteWindowSize;
            v255 = l_AbsoluteWindowSize_0 / l_AbsoluteCellSize_0;
            v255 = Vector2.new(math.floor(v255.X), (math.ceil(v255.Y)));
            local l_Text_5 = l_Input_0.Text;
            local v278 = string.lower(l_Text_5);
            for v279, v280 in pairs(v270) do
                local v281 = v16[v279];
                if v281 ~= nil then
                    if v281.Type == "Grip" then
                        v224(v279, v280);
                        if v274[v279] ~= nil then
                            v274[v279] = nil;
                        end;
                    else
                        local v282 = v279:match("Eternal Pose") and l_Tools_0:FindFirstChild("Eternal Pose") and l_Tools_0["Eternal Pose"]:Clone() or l_Tools_0:FindFirstChild(v279);
                        if v282 ~= nil then
                            local v283 = v93[v279];
                            local l_Rare_0 = v281.Rare;
                            local v285 = false;
                            if v248 == "None" then
                                v285 = v269 ~= true or string.find(string.lower(v279), string.lower(v278), 1, true) and true or false;
                                if v258 ~= "None" and l_Rare_0 ~= v258 then
                                    v285 = false;
                                end;
                            else
                                local v286 = v249[v248];
                                local v287 = v286 and v286[v281.Type];
                                if v248 == "Cosmetics" and (v281.Cosmetic ~= nil or v281.Rare == "Collectable" or v281.BattlePassItem ~= nil) then
                                    v287 = true;
                                end;
                                v285 = if v287 then v269 ~= true or string.find(string.lower(v279), string.lower(v278), 1, true) and true or false else false;
                                if v248 ~= "None" and v278 ~= "" then
                                    v285 = string.find(string.lower(v279), string.lower(v278), 1, true) and true or false;
                                end;
                                if v258 ~= "None" and l_Rare_0 ~= v258 then
                                    v285 = false;
                                end;
                            end;
                            if v285 == false then
                                if v283 then
                                    v283.Parent = nil;
                                end;
                                v273[v279] = nil;
                                --[[ close >= 17 ]]
                            else
                                local v288 = v16[v279];
                                local v289 = l_HttpService_0:JSONDecode(l_Equiped_0.Value);
                                local v290 = table.find(v289, v279);
                                local v291 = v16[v279];
                                if v291 and v291.Type == "Ship" then
                                    v290 = l_EquipedShip_0.Value == v279;
                                end;
                                local v292 = v290 and true or false;
                                do
                                    local l_v283_0 = v283;
                                    if l_v283_0 == nil then
                                        if v272 == 10 then
                                            v272 = 0;
                                            task.wait();
                                        end;
                                        v272 = v272 + 1;
                                        l_v283_0 = script.EmptyTemplate:Clone();
                                        l_v283_0.Name = v279;
                                        v93[v279] = l_v283_0;
                                        l_v283_0:SetAttribute("itemName", v279);
                                        l_v283_0:SetAttribute("itemType", v288.Type);
                                        l_v283_0:SetAttribute("itemRarity", v288.Rare);
                                        l_v283_0:SetAttribute("amountOwned", v280);
                                        l_v283_0.ItemName.Text = v279;
                                        l_v283_0.ItemName.ZIndex = 10;
                                        local l_Border_2 = l_v283_0.Border;
                                        v290 = l_Border_2.UIGradient;
                                        if v94[v288.Type] == nil then
                                            v94[v288.Type] = v97 + 1;
                                            v97 = v97 + 1;
                                        end;
                                        v291 = l_v283_0.ItemName.ItemRare;
                                        local v295 = nil;
                                        local function v298() --[[ Line: 1011 ]] --[[ Name: UpdateTextRarity ]]
                                            -- upvalues: v291 (copy), l_RainbowGradient_0 (ref)
                                            local l_Text_6 = v291.Parent.Text;
                                            while true do
                                                local _ = task.wait(0.02);
                                                if v291.Parent ~= nil and v291.Parent.Text == l_Text_6 then
                                                    v291.Color = l_RainbowGradient_0:GetColor();
                                                else
                                                    break;
                                                end;
                                            end;
                                        end;
                                        local v299 = v27[v288.Rare];
                                        do
                                            local l_v295_0 = v295;
                                            if v299 then
                                                v291.Enabled = true;
                                                v291.Color = v299.Color;
                                                if v288.Rare == "Legendary" or v288.Chroma ~= nil then
                                                    if l_v283_0.Parent ~= nil then
                                                        l_v295_0 = task.spawn(v298);
                                                    end;
                                                    l_v283_0:GetPropertyChangedSignal("Parent"):Connect(function() --[[ Line: 1045 ]]
                                                        -- upvalues: l_v283_0 (ref), l_v295_0 (ref), v298 (copy)
                                                        if l_v283_0.Parent == nil then
                                                            if l_v295_0 ~= nil and coroutine.status(l_v295_0) ~= "dead" then
                                                                task.cancel(l_v295_0);
                                                            end;
                                                            l_v295_0 = nil;
                                                            return;
                                                        else
                                                            if l_v295_0 == nil then
                                                                l_v295_0 = task.spawn(v298);
                                                            end;
                                                            return;
                                                        end;
                                                    end);
                                                end;
                                                v290.Enabled = true;
                                                v290.Color = v299.Color;
                                                v96[l_v283_0] = v290;
                                                local l_l_Border_2_0 = l_Border_2 --[[ copy: 23 -> 34 ]];
                                                local l_v290_0 = v290 --[[ copy: 24 -> 35 ]];
                                                l_Border_2:GetPropertyChangedSignal("ImageTransparency"):Connect(function() --[[ Line: 1063 ]]
                                                    -- upvalues: l_l_Border_2_0 (copy), v96 (ref), l_v283_0 (ref), l_v290_0 (copy)
                                                    if l_l_Border_2_0.ImageTransparency == 0 then
                                                        v96[l_v283_0] = l_v290_0;
                                                        return;
                                                    else
                                                        v96[l_v283_0] = nil;
                                                        return;
                                                    end;
                                                end);
                                            end;
                                            v282 = v282:Clone();
                                            local v303 = v18:Attach3D(l_v283_0.Display, v282);
                                            v303:SetDepthMultiplier(1);
                                            v303.Camera.FieldOfView = 30;
                                            v303.Visible = true;
                                            v303:SetCFrame(CFrame.Angles(0, os.clock() % 6.283185307179586, 0) * CFrame.Angles(-0.03490658503988659, 0, 0));
                                            v95[l_v283_0] = v303;
                                            local l_ViewportFrame_0 = l_v283_0.Display:FindFirstChild("ViewportFrame");
                                            if l_ViewportFrame_0 then
                                                l_ViewportFrame_0.ZIndex = 6;
                                                l_ViewportFrame_0.BackgroundTransparency = 0;
                                                l_ViewportFrame_0.BorderSizePixel = 0;
                                                l_ViewportFrame_0.BackgroundColor3 = Color3.fromRGB(79, 79, 79);
                                            end;
                                            local l_Button_0 = l_v283_0.Button;
                                            l_Button_0.MouseEnter:Connect(function() --[[ Line: 1100 ]]
                                                -- upvalues: l_v283_0 (ref)
                                                l_v283_0.ItemName.Visible = true;
                                            end);
                                            l_Button_0.MouseLeave:Connect(function() --[[ Line: 1104 ]]
                                                -- upvalues: l_v283_0 (ref)
                                                l_v283_0.ItemName.Visible = false;
                                            end);
                                            local function v306() --[[ Line: 1108 ]] --[[ Name: ItemPressed ]]
                                                -- upvalues: v181 (ref), l_v283_0 (ref), v279 (copy), v280 (copy)
                                                v181(l_v283_0, v279, v280);
                                            end;
                                            l_Button_0.Activated:Connect(v306);
                                            v239(v279);
                                        end;
                                    end;
                                    l_v283_0:SetAttribute("amountOwned", v280);
                                    l_v283_0.Amount.Text = ("x%*"):format(v280);
                                    local l_Rare_1 = v288.Rare;
                                    v276[l_Rare_1] = v276[l_Rare_1] + 1;
                                    l_Rare_1 = l_v283_0.Border;
                                    if v292 == true then
                                        l_Rare_1.ImageTransparency = 0;
                                        v276.Equipped = v276.Equipped + 1;
                                        v290 = -10000 + v28[v288.Rare] + v276.Equipped;
                                        l_v283_0.LayoutOrder = v290;
                                    else
                                        l_Rare_1.ImageTransparency = 0.9;
                                        v290 = v28[v288.Rare] + v276[v288.Rare];
                                        l_v283_0.LayoutOrder = v290;
                                    end;
                                    table.insert(v275, l_v283_0);
                                    v273[v279] = nil;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
            table.sort(v275, function(v308, v309) --[[ Line: 1146 ]]
                return v308.LayoutOrder < v309.LayoutOrder;
            end);
            local v310 = 0;
            local v311 = 0;
            local v312 = {};
            local v313 = 0;
            local v314 = 0;
            for _, v316 in ipairs(v275) do
                if v313 == 6 then
                    v314 = v314 + 1;
                    v313 = 1;
                else
                    v313 = v313 + 1;
                end;
                local v317 = ("%*, %*"):format(v313, v314);
                local v318 = l_List_0.CanvasPosition / l_AbsoluteCellSize_0;
                v318 = Vector2.new(math.floor(v318.X), (math.floor(v318.Y)));
                local v319 = false;
                if v318.Y <= v314 then
                    v319 = v314 <= v318.Y + v255.Y;
                end;
                v312[v316] = {
                    IsPossible = v319, 
                    CellPosition = v317
                };
            end;
            v313 = {};
            for _, v321 in ipairs(v275) do
                if v310 == 6 then
                    v311 = v311 + 1;
                    v310 = 1;
                else
                    v310 = v310 + 1;
                end;
                local v322 = ("%*, %*"):format(v310, v311);
                v313[v322] = v321;
                local v323 = l_List_0.CanvasPosition / l_AbsoluteCellSize_0;
                v323 = Vector2.new(math.floor(v323.X), (math.floor(v323.Y)));
                local v324 = false;
                if v323.Y <= v311 then
                    v324 = v311 <= v323.Y + v255.Y;
                end;
                if v251[v322] ~= nil then
                    if v251[v322].Object ~= v321 then
                        local v325 = v312[v321];
                        if v325 and v325.IsPossible == false then
                            v251[v322].Object.Parent = nil;
                        end;
                    end;
                    v251[v322] = nil;
                end;
                if v324 then
                    if v321.Parent == nil then
                        v321.Parent = l_List_0;
                    end;
                    v95[v321].Visible = true;
                    v251[v322] = {
                        X = v310, 
                        Y = v311, 
                        Object = v321
                    };
                else
                    v95[v321].Visible = false;
                    v321.Parent = nil;
                end;
                v321.LayoutOrder = v311 .. v310;
                v321:SetAttribute("CellPosition", v322);
                v313[v322] = v321;
            end;
            table.clear(v250);
            v250 = v313;
            l_AbsoluteCellSize_0 = l_UIGridLayout_0.AbsoluteCellSize;
            v311 = v311 + 1;
            l_List_0.CanvasSize = UDim2.new(0, 0, 0, l_AbsoluteCellSize_0.Y * v311 + v112 * v311);
            for v326, v327 in pairs(v273) do
                if v327 == v98 then
                    l_ItemMenu_0.Visible = false;
                    v98 = nil;
                end;
                v327:Destroy();
                v93[v326] = nil;
            end;
            for v328, v329 in pairs(v274) do
                v329:Destroy();
                v210[v328] = nil;
            end;
            if v269 == true then
                l_List_0.ScrollingEnabled = true;
            end;
            v256 = false;
        end;
        local v331 = false;
        local function v333(v332) --[[ Line: 1264 ]] --[[ Name: QueueRefreshInventory ]]
            -- upvalues: l_Main_0 (copy), v331 (ref), v247 (copy), v330 (copy)
            if l_Main_0.Visible == false then
                v331 = true;
                return;
            else
                v247:QueueTask(v330, v332 or false);
                return;
            end;
        end;
        local v334 = nil;
        l_Main_0:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 1274 ]]
            -- upvalues: l_Main_0 (copy), v331 (ref), v247 (copy), v330 (copy), v334 (ref)
            if l_Main_0.Visible then
                if v331 then
                    v331 = false;
                    if l_Main_0.Visible == false then
                        v331 = true;
                    else
                        v247:QueueTask(v330, false);
                    end;
                end;
                v334 = task.delay(0.25, function() --[[ Line: 1280 ]]
                    -- upvalues: l_Main_0 (ref), v331 (ref), v247 (ref), v330 (ref), v334 (ref)
                    if l_Main_0.Visible == false then
                        v331 = true;
                    else
                        v247:QueueTask(v330, false);
                    end;
                    v334 = nil;
                end);
                return;
            else
                if v334 and coroutine.status(v334) ~= "dead" then
                    task.cancel(v334);
                    v334 = nil;
                end;
                return;
            end;
        end);
        l_Input_0.FocusLost:Connect(function(_) --[[ Line: 1293 ]]
            -- upvalues: v257 (ref), l_Input_0 (copy), l_Main_0 (copy), v331 (ref), v247 (copy), v330 (copy), l_Clear_0 (copy)
            v257 = l_Input_0.Text;
            if v257 ~= "" then
                if l_Main_0.Visible == false then
                    v331 = true;
                else
                    v247:QueueTask(v330, true);
                end;
            elseif l_Main_0.Visible == false then
                v331 = true;
            else
                v247:QueueTask(v330, false);
            end;
            l_Clear_0.Visible = v257 ~= "";
        end);
        l_Clear_0.MouseButton1Click:Connect(function() --[[ Line: 1303 ]]
            -- upvalues: v257 (ref), l_Input_0 (copy), l_Clear_0 (copy), l_Main_0 (copy), v331 (ref), v247 (copy), v330 (copy)
            v257 = "";
            l_Input_0.Text = v257;
            l_Clear_0.Visible = false;
            if l_Main_0.Visible == false then
                v331 = true;
                return;
            else
                v247:QueueTask(v330, false);
                return;
            end;
        end);
        for _, v337 in ipairs(l_Frames_0:GetChildren()) do
            if v337:IsA("ImageButton") then
                v337.MouseButton1Click:Connect(function() --[[ Line: 1312 ]]
                    -- upvalues: v248 (ref), v337 (copy), l_Frames_0 (copy), l_List_0 (copy), l_UIPadding_0 (copy), l_Main_0 (copy), v331 (ref), v247 (copy), v330 (copy)
                    if v248 == v337.Name then
                        l_Frames_0[v248].Text.TextColor3 = Color3.fromRGB(255, 255, 255);
                        v248 = "None";
                    else
                        if v248 ~= "None" then
                            l_Frames_0[v248].Text.TextColor3 = Color3.fromRGB(255, 255, 255);
                        end;
                        v337.Text.TextColor3 = Color3.fromRGB(247, 202, 24);
                        v248 = v337.Name;
                    end;
                    l_List_0.CanvasPosition = Vector2.new(0, 0);
                    l_UIPadding_0.PaddingTop = UDim.new(0, 0);
                    if l_Main_0.Visible == false then
                        v331 = true;
                        return;
                    else
                        v247:QueueTask(v330, false);
                        return;
                    end;
                end);
            end;
        end;
        for _, v339 in pairs(l_RarityFilter_0:GetChildren()) do
            if v339:IsA("TextButton") then
                v339.MouseButton1Click:Connect(function() --[[ Line: 1334 ]]
                    -- upvalues: v258 (ref), v339 (copy), l_RarityFilter_0 (copy), l_List_0 (copy), l_UIPadding_0 (copy), l_Main_0 (copy), v331 (ref), v247 (copy), v330 (copy)
                    if v258 == v339.Name then
                        v339.BackgroundTransparency = 0.8;
                        v258 = "None";
                    else
                        if v258 ~= "None" then
                            l_RarityFilter_0[v258].BackgroundTransparency = 0.8;
                        end;
                        v339.BackgroundTransparency = 0;
                        v258 = v339.Name;
                    end;
                    l_List_0.CanvasPosition = Vector2.new(0, 0);
                    l_UIPadding_0.PaddingTop = UDim.new(0, 0);
                    if l_Main_0.Visible == false then
                        v331 = true;
                        return;
                    else
                        v247:QueueTask(v330, false);
                        return;
                    end;
                end);
            end;
        end;
        if not l_battleRoyaleDrop_0 then
            l_Drop_0.Visible = false;
        else
            l_Drop_0.Visible = true;
        end;
        if not l_battleRoyaleDrop_0 then
            local v340 = nil;
            v340 = l_ReplicatedStorage_1.ChildAdded:Connect(function(v341) --[[ Line: 1360 ]]
                -- upvalues: l_battleRoyaleDrop_0 (ref), l_Drop_0 (copy), l_tradingHUB_0 (ref)
                if v341.Name == "battleRoyaleDrop" then
                    l_battleRoyaleDrop_0 = v341;
                    if not l_battleRoyaleDrop_0 then
                        l_Drop_0.Visible = false;
                        return;
                    else
                        l_Drop_0.Visible = true;
                        return;
                    end;
                else
                    if v341.Name == "tradingHUB" then
                        l_tradingHUB_0 = v341;
                    end;
                    return;
                end;
            end);
        end;
        l_Inventory_1:GetPropertyChangedSignal("Value"):Connect(v333);
        l_Equiped_0:GetPropertyChangedSignal("Value"):Connect(v333);
        if l_EquipedGrip_0.Value == "" then
            l_Grips_0.Current.Text = "None";
        else
            l_Grips_0.Current.Text = l_EquipedGrip_0.Value;
            local l_Value_1 = l_EquipedGrip_0.Value;
            local l_Gradient_2 = l_Grips_0.Current.Gradient;
            local v344 = v16[l_Value_1];
            if v344 ~= nil then
                local v345 = v27[v344.Rare];
                if v345 ~= nil then
                    l_Gradient_2.Enabled = true;
                    l_Gradient_2.Color = v345.Color;
                    if v344.Rare == "Legendary" or v344.Chroma ~= nil then
                        local l_Text_7 = l_Gradient_2.Parent.Text;
                        local v347 = "";
                        if v16[l_Text_7] then
                            v347 = v16[l_Text_7].Rare;
                        end;
                        local l_l_Gradient_2_0 = l_Gradient_2 --[[ copy: 98 -> 129 ]];
                        local l_l_Text_7_0 = l_Text_7 --[[ copy: 102 -> 130 ]];
                        do
                            local l_v347_0 = v347;
                            task.spawn(function() --[[ Line: 222 ]]
                                -- upvalues: v211 (copy), l_l_Gradient_2_0 (copy), l_l_Text_7_0 (copy), v16 (ref), l_v347_0 (ref), l_RainbowGradient_0 (ref)
                                while true do
                                    local _ = task.wait(0.02);
                                    if v211 then
                                        v211();
                                    end;
                                    if l_l_Gradient_2_0.Parent ~= nil then
                                        if l_l_Gradient_2_0.Parent.Text ~= l_l_Text_7_0 then
                                            if v16[l_l_Gradient_2_0.Parent.Text] == nil then
                                                return;
                                            elseif v16[l_l_Gradient_2_0.Parent.Text].Rare ~= l_v347_0 then
                                                break;
                                            end;
                                        end;
                                        l_l_Gradient_2_0.Color = l_RainbowGradient_0:GetColor();
                                    else
                                        break;
                                    end;
                                end;
                            end);
                        end;
                    end;
                end;
            end;
        end;
        l_EquipedGrip_0:GetPropertyChangedSignal("Value"):Connect(v234);
        local l_Buttons_0 = l_TopTabs_0:WaitForChild("Categories"):WaitForChild("Buttons");
        local l_Grips_1 = l_Main_0:WaitForChild("Grips");
        local l_Titles_1 = l_Main_0:WaitForChild("Titles");
        local l_List_2 = l_Titles_1:WaitForChild("List");
        local v356 = {
            Inventory = {
                InventoryFrame = true, 
                SectionsFrameParent = true, 
                RarityFilterFrame = true, 
                GripsFrame = false, 
                TitlesFrame = false, 
                LoadoutFrame = false
            }, 
            Titles = {
                ItemMenuFrame = false, 
                RarityFilterFrame = false, 
                InventoryFrame = false, 
                SectionsFrameParent = false, 
                GripsFrame = false, 
                TitlesFrame = true, 
                ClearSelectedButton = true, 
                HackyBugFix = l_List_2, 
                LoadoutFrame = false
            }, 
            Grips = {
                ItemMenuFrame = false, 
                RarityFilterFrame = false, 
                InventoryFrame = false, 
                SectionsFrameParent = false, 
                GripsFrame = true, 
                TitlesFrame = false, 
                ClearSelectedButton = true, 
                LoadoutFrame = false, 
                HackyBugFix = l_List_1
            }, 
            LoadoutSlots = {
                ItemMenuFrame = false, 
                RarityFilterFrame = false, 
                InventoryFrame = false, 
                SectionsFrameParent = false, 
                GripsFrame = false, 
                TitlesFrame = false, 
                ClearSelectedButton = false, 
                LoadoutFrame = true
            }
        };
        local v357 = {
            InventoryFrame = l_Inventory_2, 
            SectionsFrameParent = l_Frames_0.Parent, 
            RarityFilterFrame = l_RarityFilter_0, 
            GripsFrame = l_Grips_1, 
            TitlesFrame = l_Titles_1, 
            ItemMenuFrame = l_ItemMenu_0, 
            LoadoutFrame = l_LoadoutFrame_0
        };
        local function v362(v358) --[[ Line: 1444 ]] --[[ Name: ApplyCategoryConfig ]]
            -- upvalues: l_ItemMenu_0 (copy), v98 (ref), v357 (copy)
            for v359, v360 in pairs(v358) do
                if v359 == "ClearSelectedButton" then
                    if v360 then
                        l_ItemMenu_0.Visible = false;
                        v98 = nil;
                    end;
                elseif v359 == "HackyBugFix" then
                    v360.Visible = true;
                else
                    local v361 = v357[v359];
                    if v361 then
                        v361.Visible = v360;
                    end;
                end;
            end;
        end;
        for _, v364 in ipairs(l_Buttons_0:GetChildren()) do
            if v364:IsA("ImageButton") then
                v364.MouseButton1Click:Connect(function() --[[ Line: 1464 ]]
                    -- upvalues: v356 (copy), v364 (copy), v362 (copy)
                    local v365 = v356[v364.Name];
                    if v365 then
                        v362(v365);
                    end;
                end);
            end;
        end;
        task.spawn(function() --[[ Line: 1474 ]]
            -- upvalues: l_Main_0 (copy), v50 (copy), v96 (copy), v251 (copy), v95 (copy)
            local v366 = 0;
            while task.wait() do
                if l_Main_0.Visible == true and v50.ItemRotation == true then
                    v366 = v366 + 1;
                    for _, v368 in pairs(v96) do
                        v368.Rotation = v366;
                    end;
                    for _, v370 in pairs(v251) do
                        local l_Object_0 = v370.Object;
                        if l_Object_0.Parent ~= nil and l_Object_0.Visible ~= false then
                            local v372 = v95[l_Object_0];
                            if v372 then
                                v372:SetCFrame(CFrame.Angles(0, os.clock() % 6.283185307179586, 0) * CFrame.Angles(-0.03490658503988659, 0, 0));
                            end;
                        end;
                    end;
                else
                    v366 = 0;
                end;
            end;
        end);
        local function _(v373) --[[ Line: 1513 ]] --[[ Name: HasTitle ]]
            -- upvalues: l_HttpService_0 (ref), l_AllTitles_0 (copy)
            if l_HttpService_0:JSONDecode(l_AllTitles_0.Value)[v373] then
                return true;
            else
                return false;
            end;
        end;
        local function v378(v375, v376) --[[ Line: 1519 ]] --[[ Name: UpdateTitleButton ]]
            -- upvalues: v21 (ref), l_HttpService_0 (ref), l_AllTitles_0 (copy)
            local v377 = v21[v376];
            if l_HttpService_0:JSONDecode(l_AllTitles_0.Value)[v376] and true or false then
                v375.LayoutOrder = v377.ID;
                v375.TitleText.Text = v376;
                v375.TitleText.TextColor3 = v377.RoleColor;
                return;
            else
                v375.LayoutOrder = 1000 + v377.ID;
                v375.TitleText.Text = "? ? ?";
                v375.TitleText.TextColor3 = Color3.fromRGB(255, 255, 255);
                return;
            end;
        end;
        local function v389(v379) --[[ Line: 1535 ]] --[[ Name: UpdateTitleFrame ]]
            -- upvalues: v21 (ref), l_LocalPlayer_0 (ref), l_Titles_1 (copy)
            local v380 = v21[v379];
            if not v380 then
                return;
            else
                local v381 = ("%*%*%*"):format(v380.StartText and v380.StartText .. "[" or "[", v379, v380.EndText and "]" .. v380.EndText or "]");
                local v382 = ("<font color=\"#%*\"><b>%*</b></font><br/>%*"):format(tostring(v380.RoleColor:ToHex()), v381, l_LocalPlayer_0.Name);
                if l_Titles_1.CurrentTitle.Text ~= v382 then
                    for _, v384 in ipairs(l_Titles_1.PerksList:GetChildren()) do
                        if v384:IsA("TextLabel") then
                            v384:Destroy();
                        end;
                    end;
                    if v380.Perks then
                        if #v380.Perks <= 0 then
                            local v385 = script.PerkTemplate:Clone();
                            v385.Text = "None";
                            v385.Parent = l_Titles_1.PerksList;
                        else
                            for _, v387 in pairs(v380.Perks) do
                                local v388 = script.PerkTemplate:Clone();
                                v388.Text = v387;
                                v388.Parent = l_Titles_1.PerksList;
                            end;
                        end;
                    end;
                end;
                l_Titles_1.CurrentTitle.Text = v382;
                return;
            end;
        end;
        task.spawn(function() --[[ Line: 1574 ]]
            -- upvalues: v21 (ref), l_List_2 (copy), v378 (copy), l_HttpService_0 (ref), l_AllTitles_0 (copy), l_Events_0 (ref), l_EquipedTitle_0 (copy), l_Titles_1 (copy), l_LocalPlayer_0 (ref), v389 (copy)
            local v390 = {};
            for v391, v392 in pairs(v21) do
                local v393 = script.TitleTemplate:Clone();
                v393.Name = v391;
                v393.Parent = l_List_2;
                v390[v391] = v393;
                v393:SetAttribute("ID", v392.ID);
                v393.Number.Text = ("#%*"):format(v392.ID);
                v378(v393, v391);
                v393.MouseButton1Click:Connect(function() --[[ Line: 1589 ]]
                    -- upvalues: v391 (copy), l_HttpService_0 (ref), l_AllTitles_0 (ref), l_Events_0 (ref)
                    local l_v391_0 = v391;
                    if l_HttpService_0:JSONDecode(l_AllTitles_0.Value)[l_v391_0] and true or false then
                        l_Events_0.Titles:InvokeServer(v391);
                    end;
                end);
                task.wait();
            end;
            l_AllTitles_0:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 1598 ]]
                -- upvalues: v390 (copy), v378 (ref)
                for v395, v396 in pairs(v390) do
                    v378(v396, v395);
                end;
            end);
            local function v397() --[[ Line: 1604 ]] --[[ Name: EquippedTitleChanged ]]
                -- upvalues: l_EquipedTitle_0 (ref), l_Titles_1 (ref), l_LocalPlayer_0 (ref), v389 (ref)
                if l_EquipedTitle_0.Value == "" then
                    l_Titles_1.CurrentTitle.Text = l_LocalPlayer_0.Name;
                    return;
                else
                    v389(l_EquipedTitle_0.Value);
                    return;
                end;
            end;
            if l_EquipedTitle_0.Value == "" then
                l_Titles_1.CurrentTitle.Text = l_LocalPlayer_0.Name;
            else
                v389(l_EquipedTitle_0.Value);
            end;
            l_EquipedTitle_0:GetPropertyChangedSignal("Value"):Connect(v397);
        end);
        local l_ItemRotation_0 = l_TopTabs_0:WaitForChild("ItemRotation");
        local l_DefaultColors_0 = l_TopTabs_0:WaitForChild("DefaultColors");
        local l_AutoEquip_1 = l_Main_0:WaitForChild("AutoEquip");
        local l_Value_2 = l_AutoEquip_0.Value;
        local function v402() --[[ Line: 1624 ]] --[[ Name: AutoEquipUpdated ]]
            -- upvalues: l_AutoEquip_1 (copy), l_AutoEquip_0 (copy)
            l_AutoEquip_1.Text = l_AutoEquip_0.Value == true and "Auto Equip: <b><font color=\"rgb(170,255,0)\">ON</font></b>" or "Auto Equip: <b><font color=\"rgb(255,0,0)\">OFF</font></b>";
        end;
        l_AutoEquip_1.MouseButton1Click:Connect(function() --[[ Line: 1628 ]]
            -- upvalues: l_Value_2 (ref), l_Events_0 (ref)
            l_Value_2 = not l_Value_2;
            l_Events_0.Settings:InvokeServer("AutoEquip", l_Value_2);
        end);
        l_AutoEquip_1.Text = l_AutoEquip_0.Value == true and "Auto Equip: <b><font color=\"rgb(170,255,0)\">ON</font></b>" or "Auto Equip: <b><font color=\"rgb(255,0,0)\">OFF</font></b>";
        l_AutoEquip_0:GetPropertyChangedSignal("Value"):Connect(v402);
        local l_FirstChild_1 = game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
        local function _() --[[ Line: 1638 ]] --[[ Name: updateItemRotation ]]
            -- upvalues: l_FirstChild_1 (copy), l_ItemRotation_0 (copy), v50 (copy)
            local l_Value_3 = l_FirstChild_1.Settings.ItemRotation.Value;
            l_ItemRotation_0.Text = l_Value_3 == true and "Item Rotation: <b><font color=\"rgb(170,255,0)\">ON</font></b>" or "Item Rotation: <b><font color=\"rgb(255,0,0)\">OFF</font></b>";
            v50.ItemRotation = l_Value_3;
        end;
        l_ItemRotation_0.MouseButton1Click:Connect(function() --[[ Line: 1644 ]]
            -- upvalues: l_FirstChild_1 (copy), l_ItemRotation_0 (copy), v50 (copy)
            game.ReplicatedStorage.Events.Settings:InvokeServer("ItemRotation", not l_FirstChild_1.Settings.ItemRotation.Value);
            local l_Value_4 = l_FirstChild_1.Settings.ItemRotation.Value;
            l_ItemRotation_0.Text = l_Value_4 == true and "Item Rotation: <b><font color=\"rgb(170,255,0)\">ON</font></b>" or "Item Rotation: <b><font color=\"rgb(255,0,0)\">OFF</font></b>";
            v50.ItemRotation = l_Value_4;
        end);
        local l_Value_5 = l_FirstChild_1.Settings.ItemRotation.Value;
        l_ItemRotation_0.Text = l_Value_5 == true and "Item Rotation: <b><font color=\"rgb(170,255,0)\">ON</font></b>" or "Item Rotation: <b><font color=\"rgb(255,0,0)\">OFF</font></b>";
        v50.ItemRotation = l_Value_5;
        l_Value_5 = function() --[[ Line: 1651 ]] --[[ Name: updateDefaultColors ]]
            -- upvalues: l_FirstChild_1 (copy), l_DefaultColors_0 (copy)
            l_DefaultColors_0.Text = l_FirstChild_1.Settings.DefaultOutfitColors.Value == true and "Default Outfit Colors: <b><font color=\"rgb(170,255,0)\">ON</font></b>" or "Default Outfit Colors: <b><font color=\"rgb(255,0,0)\">OFF</font></b>";
        end;
        l_DefaultColors_0.MouseButton1Click:Connect(function() --[[ Line: 1656 ]]
            -- upvalues: l_FirstChild_1 (copy), l_DefaultColors_0 (copy)
            game.ReplicatedStorage.Events.Settings:InvokeServer("DefaultOutfitColors", not l_FirstChild_1.Settings.DefaultOutfitColors.Value);
            l_DefaultColors_0.Text = l_FirstChild_1.Settings.DefaultOutfitColors.Value == true and "Default Outfit Colors: <b><font color=\"rgb(170,255,0)\">ON</font></b>" or "Default Outfit Colors: <b><font color=\"rgb(255,0,0)\">OFF</font></b>";
        end);
        l_DefaultColors_0.Text = l_FirstChild_1.Settings.DefaultOutfitColors.Value == true and "Default Outfit Colors: <b><font color=\"rgb(170,255,0)\">ON</font></b>" or "Default Outfit Colors: <b><font color=\"rgb(255,0,0)\">OFF</font></b>";
        local l_LoadoutSlots_0 = l_Events_0:WaitForChild("LoadoutSlots");
        local l_LoadoutListFrame_0 = l_LoadoutFrame_0:FindFirstChild("LoadoutListFrame");
        local l_LoadoutSlotsTable_0 = l_v50_StatsFolder_0.Inventory.LoadoutSlotsTable;
        local l_Stats_2 = l_PlayerGui_0:WaitForChild("Statistics"):WaitForChild("Main"):WaitForChild("Stats");
        local v412 = 0;
        local _ = game.GameId == 2097989947;
        local v414 = l_HttpService_0:JSONDecode(l_LoadoutSlotsTable_0.Value);
        for _, _ in pairs(v414) do
            v412 = v412 + 1;
        end;
        task.spawn(function() --[[ Line: 1679 ]]
            -- upvalues: l_LoadoutSlots_0 (copy), l_LoadoutListFrame_0 (copy), l_ReplicatedStorage_1 (ref), l_LoadoutFrame_0 (copy), l_Stats_2 (copy), l_Stats_1 (copy), l_ToolDesc_0 (ref), v42 (ref), l_LocalPlayer_0 (ref), v24 (ref), v412 (ref), l_HttpService_0 (ref), l_LoadoutSlotsTable_0 (copy)
            local v417 = {};
            local function v487(v418) --[[ Line: 1682 ]] --[[ Name: AddSlot ]]
                -- upvalues: l_LoadoutSlots_0 (ref), l_LoadoutListFrame_0 (ref), l_ReplicatedStorage_1 (ref), l_LoadoutFrame_0 (ref), l_Stats_2 (ref), l_Stats_1 (ref), l_ToolDesc_0 (ref), v42 (ref), l_LocalPlayer_0 (ref), v24 (ref), v417 (copy)
                local v419 = 0;
                local v420 = nil;
                local v421 = nil;
                repeat
                    local v422, v423 = l_LoadoutSlots_0:InvokeServer({
                        actionType = "fetchLoadoutModel", 
                        requestedSlot = v418
                    });
                    v420 = v422;
                    v421 = v423;
                    v419 = v419 + 1;
                    task.wait(1);
                until v420 ~= nil or v419 >= 3;
                if v420 == nil or v419 >= 3 then
                    _G.displayMessage("<Color=Red>Failed to load a loadout slot!");
                    return;
                else
                    local v424 = script.LoadoutTemplate:Clone();
                    v424.SlotNumber.Text = ("Slot #%*"):format(v418);
                    v424.Parent = l_LoadoutListFrame_0;
                    local function v441(v425) --[[ Line: 1704 ]] --[[ Name: updateDisplayModel ]]
                        -- upvalues: v424 (copy), l_ReplicatedStorage_1 (ref), l_LoadoutFrame_0 (ref)
                        local l_ViewFrame_0 = v424:FindFirstChild("ViewFrame");
                        local l_ViewportFrame_1 = l_ViewFrame_0:FindFirstChild("ViewportFrame");
                        l_ViewportFrame_1:ClearAllChildren();
                        local l_Camera_0 = Instance.new("Camera");
                        l_ViewportFrame_1.CurrentCamera = l_Camera_0;
                        v425:SetPrimaryPartCFrame(CFrame.new(0, 0, 0));
                        local v429 = v425:GetExtentsSize().Magnitude / 1.75;
                        l_Camera_0.CFrame = v425.PrimaryPart.CFrame * CFrame.Angles(0, 3.141592653589793, 0) * CFrame.new(0, 0, v429);
                        local l_WorldModel_0 = Instance.new("WorldModel");
                        l_WorldModel_0.Parent = l_ViewportFrame_1;
                        v425.Parent = l_WorldModel_0;
                        local function _() --[[ Line: 1724 ]] --[[ Name: enableHatAnimations ]]
                            -- upvalues: v425 (copy)
                            local l_v425_Descendants_0 = v425:GetDescendants();
                            for v432 = 1, #l_v425_Descendants_0 do
                                if l_v425_Descendants_0[v432].Name == "AnimateAccessory" then
                                    l_v425_Descendants_0[v432].Enabled = true;
                                end;
                            end;
                        end;
                        local l_Humanoid_1 = v425.Humanoid;
                        local l_v425_Attribute_0 = v425:GetAttribute("IdleName");
                        local v436 = nil;
                        v436 = if l_v425_Attribute_0 == "Normal" then script.IdleAnim else l_ReplicatedStorage_1.Modules.SwordHandle.Swords[l_v425_Attribute_0].Idle;
                        l_Humanoid_1.EvaluateStateMachine = false;
                        local v437 = l_Humanoid_1:LoadAnimation(script.IdleAnim);
                        local v438 = l_Humanoid_1:LoadAnimation(v436);
                        local l_v425_Descendants_1 = v425:GetDescendants();
                        for v440 = 1, #l_v425_Descendants_1 do
                            if l_v425_Descendants_1[v440].Name == "AnimateAccessory" then
                                l_v425_Descendants_1[v440].Enabled = true;
                            end;
                        end;
                        l_v425_Descendants_1 = function() --[[ Line: 1750 ]] --[[ Name: Update ]]
                            -- upvalues: l_LoadoutFrame_0 (ref), v437 (copy), v438 (copy), l_ViewportFrame_1 (copy), l_ViewFrame_0 (copy)
                            if l_LoadoutFrame_0.Visible then
                                v437:Play();
                                v438:Play();
                                l_ViewportFrame_1.Parent = l_ViewFrame_0;
                                return;
                            else
                                v437:Stop();
                                v438:Stop();
                                l_ViewportFrame_1.Parent = nil;
                                return;
                            end;
                        end;
                        if l_LoadoutFrame_0.Visible then
                            v437:Play();
                            v438:Play();
                            l_ViewportFrame_1.Parent = l_ViewFrame_0;
                        else
                            v437:Stop();
                            v438:Stop();
                            l_ViewportFrame_1.Parent = nil;
                        end;
                        l_LoadoutFrame_0:GetPropertyChangedSignal("Visible"):Connect(l_v425_Descendants_1);
                    end;
                    v441(v420);
                    local l_Override_0 = v424.ButtonOptions.Override;
                    local l_Wear_0 = v424.ButtonOptions.Wear;
                    local l_Stats_3 = v424.ButtonOptions.Stats;
                    local l_LoadStats_0 = v424.ButtonOptions.LoadStats;
                    local l_Stats_4 = v424.Stats;
                    local l_ViewFrame_1 = v424.ViewFrame;
                    local function v471(v448) --[[ Line: 1779 ]] --[[ Name: setupStatValues ]]
                        -- upvalues: l_Stats_4 (copy), l_Stats_2 (ref), l_Stats_1 (ref), l_ToolDesc_0 (ref), v42 (ref)
                        local v449 = {
                            "StatTemplate"
                        };
                        if v448.StatPoints == nil then
                            warn("nil stat points");
                            return;
                        else
                            for v450, v451 in pairs(v448.StatPoints) do
                                if v451 > 0 then
                                    local l_l_Stats_4_FirstChild_0 = l_Stats_4:FindFirstChild(v450);
                                    local l_Stat_0 = l_Stats_2:FindFirstChild(v450).Stat;
                                    if l_Stats_4:FindFirstChild(v450) == nil then
                                        l_l_Stats_4_FirstChild_0 = l_Stats_4.StatTemplate:Clone();
                                        l_l_Stats_4_FirstChild_0.Name = v450;
                                        l_l_Stats_4_FirstChild_0.Visible = true;
                                        l_Stat_0.UIGradient:Clone().Parent = l_l_Stats_4_FirstChild_0.Stat;
                                        l_Stat_0.UIGradient:Clone().Parent = l_l_Stats_4_FirstChild_0.Amount;
                                        l_l_Stats_4_FirstChild_0.LayoutOrder = l_Stat_0.Parent.LayoutOrder - 400;
                                        l_l_Stats_4_FirstChild_0:SetAttribute("IsStatPoint", true);
                                        l_l_Stats_4_FirstChild_0.Parent = l_Stats_4;
                                    end;
                                    l_l_Stats_4_FirstChild_0.Stat.Text = l_Stat_0.Text;
                                    l_l_Stats_4_FirstChild_0.Amount.Text = v451;
                                    table.insert(v449, v450);
                                end;
                            end;
                            local l_l_Stats_1_Children_0 = l_Stats_1:GetChildren();
                            for v455 = 1, #l_l_Stats_1_Children_0 do
                                local v456 = l_l_Stats_1_Children_0[v455];
                                if v456:IsA("TextLabel") and l_Stats_4:FindFirstChild(v456.Name) == nil then
                                    local v457 = v456:Clone();
                                    v457.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
                                    v457.BackgroundTransparency = 0;
                                    v457.TextXAlignment = Enum.TextXAlignment.Center;
                                    v457.Size = l_Stats_4.StatTemplate.Size;
                                    v457:SetAttribute("ForceStay", true);
                                    v457:SetAttribute("IsItemStat", true);
                                    v457.Parent = l_Stats_4;
                                end;
                            end;
                            local l_l_Stats_4_Children_0 = l_Stats_4:GetChildren();
                            for v459 = 1, #l_l_Stats_4_Children_0 do
                                if l_l_Stats_4_Children_0[v459]:IsA("Frame") and table.find(v449, l_l_Stats_4_Children_0[v459].Name) == nil and l_l_Stats_4_Children_0[v459]:GetAttribute("ForceStay") == nil then
                                    l_l_Stats_4_Children_0[v459]:Destroy();
                                end;
                            end;
                            local v460 = {};
                            local l_Items_0 = v448.Items;
                            for v462 = 1, #l_Items_0 do
                                local v463 = l_Items_0[v462];
                                local l_FirstChild_2 = l_ToolDesc_0.ItemStats:FindFirstChild(v463);
                                local v465 = l_FirstChild_2 and l_FirstChild_2:GetAttributes() or {};
                                for v466, v467 in pairs(v465) do
                                    v460[v466] = (v460[v466] or 0) + v467;
                                end;
                            end;
                            for _, v469 in ipairs(l_Stats_4:GetChildren()) do
                                if v469:IsA("TextLabel") and v469:GetAttribute("IsItemStat") == true then
                                    local v470 = v460[v469.Name];
                                    v42(v469, v469.Name, v470 or 0);
                                end;
                            end;
                            return;
                        end;
                    end;
                    local l_SlotNumber_0 = v424.SlotNumber;
                    local function _(v473) --[[ Line: 1859 ]] --[[ Name: updateCustomName ]]
                        -- upvalues: l_SlotNumber_0 (copy)
                        local l_CustomName_0 = v473.CustomName;
                        if l_CustomName_0 then
                            l_SlotNumber_0.Text = l_CustomName_0;
                            l_SlotNumber_0.PlaceholderText = l_CustomName_0;
                        end;
                    end;
                    local l_EditName_0 = v424.SlotNumber.EditName;
                    l_EditName_0.MouseButton1Click:Connect(function() --[[ Line: 1869 ]]
                        -- upvalues: l_SlotNumber_0 (copy), v421 (ref), v418 (copy), l_EditName_0 (copy)
                        l_SlotNumber_0.TextEditable = not l_SlotNumber_0.TextEditable;
                        if l_SlotNumber_0.TextEditable == true then
                            l_SlotNumber_0.Text = "";
                            l_SlotNumber_0.PlaceholderText = v421.CustomName or "Slot #" .. v418;
                            l_EditName_0.ImageColor3 = Color3.fromRGB(255, 170, 0);
                            return;
                        else
                            l_EditName_0.ImageColor3 = Color3.fromRGB(255, 255, 255);
                            l_SlotNumber_0.PlaceholderText = "";
                            l_SlotNumber_0.Text = v421.CustomName or "Slot #" .. v418;
                            return;
                        end;
                    end);
                    l_SlotNumber_0.FocusLost:Connect(function() --[[ Line: 1882 ]]
                        -- upvalues: l_SlotNumber_0 (copy), v421 (ref), v418 (copy), l_LoadoutSlots_0 (ref)
                        local l_Text_8 = l_SlotNumber_0.Text;
                        if l_Text_8 == "" then
                            l_SlotNumber_0.Text = v421.CustomName or "Slot #" .. v418;
                            return;
                        else
                            if v421.CustomName ~= l_Text_8 then
                                l_LoadoutSlots_0:InvokeServer({
                                    actionType = "UpdateName", 
                                    requestedSlot = v418, 
                                    Name = l_Text_8
                                });
                            end;
                            return;
                        end;
                    end);
                    l_LoadStats_0.MouseButton1Click:Connect(function() --[[ Line: 1899 ]]
                        -- upvalues: l_LocalPlayer_0 (ref), l_LoadoutSlots_0 (ref), v418 (copy)
                        if _G.HasItem(l_LocalPlayer_0, "SP Reset Essence") == false then
                            _G.displayMessage("<Color=Red>You need a SP Reset Essence to load stats!");
                            return;
                        else
                            l_LoadoutSlots_0:InvokeServer({
                                actionType = "LoadStats", 
                                requestedSlot = v418
                            });
                            return;
                        end;
                    end);
                    l_Override_0.MouseButton1Click:Connect(function() --[[ Line: 1911 ]]
                        -- upvalues: l_LocalPlayer_0 (ref), v421 (ref), v418 (copy), l_LoadoutSlots_0 (ref), v441 (copy), v471 (copy)
                        _G.promptQuestion(l_LocalPlayer_0, ("<font color=\"#FF0000\">Override Loadout %* with current?</font>"):format(v421.CustomName or ("Slot #%*"):format(v418)), {
                            [true] = function() --[[ Line: 1913 ]]
                                -- upvalues: l_LoadoutSlots_0 (ref), v418 (ref), v421 (ref), v441 (ref), v471 (ref)
                                local v478, v479 = l_LoadoutSlots_0:InvokeServer({
                                    actionType = "Override", 
                                    requestedSlot = v418
                                });
                                if v478 and v479 then
                                    v421 = v479;
                                    v441(v478);
                                    v471(v421);
                                end;
                            end
                        });
                    end);
                    l_Wear_0.MouseButton1Click:Connect(function() --[[ Line: 1929 ]]
                        -- upvalues: l_LocalPlayer_0 (ref), l_LoadoutSlots_0 (ref), v418 (copy)
                        _G.promptQuestion(l_LocalPlayer_0, "Wear this loadout? <font color=\"#ffaa00\">Overrides your accessories,outfits, and equipped items</font>.", {
                            [true] = function() --[[ Line: 1931 ]]
                                -- upvalues: l_LoadoutSlots_0 (ref), v418 (ref)
                                l_LoadoutSlots_0:InvokeServer({
                                    actionType = "Wear", 
                                    requestedSlot = v418
                                });
                            end
                        });
                    end);
                    l_Stats_3.MouseButton1Click:Connect(function() --[[ Line: 1940 ]]
                        -- upvalues: l_Stats_4 (copy), l_ViewFrame_1 (copy), l_Stats_3 (copy)
                        local v480 = not l_Stats_4.Visible;
                        l_Stats_4.Visible = v480;
                        l_ViewFrame_1.Visible = not v480;
                        if v480 == true then
                            l_Stats_3.Usage.Text = "Hide Stats";
                            return;
                        else
                            l_Stats_3.Usage.Text = "Show Stats";
                            return;
                        end;
                    end);
                    v471(v421);
                    local l_CustomName_1 = v421.CustomName;
                    if l_CustomName_1 then
                        l_SlotNumber_0.Text = l_CustomName_1;
                        l_SlotNumber_0.PlaceholderText = l_CustomName_1;
                    end;
                    local v482 = v24.new();
                    v417[v418] = v482;
                    v482:Connect(function(v483, v484) --[[ Line: 1958 ]]
                        -- upvalues: v421 (ref), l_SlotNumber_0 (copy), l_LoadoutSlots_0 (ref), v418 (copy), v441 (copy), v471 (copy)
                        v421 = v484;
                        local l_CustomName_2 = v484.CustomName;
                        if l_CustomName_2 then
                            l_SlotNumber_0.Text = l_CustomName_2;
                            l_SlotNumber_0.PlaceholderText = l_CustomName_2;
                        end;
                        if v483 == "Name" then
                            return;
                        else
                            local v486;
                            l_CustomName_2, v486 = l_LoadoutSlots_0:InvokeServer({
                                actionType = "fetchLoadoutModel", 
                                requestedSlot = v418
                            });
                            v441(l_CustomName_2);
                            v471(v486);
                            return;
                        end;
                    end);
                    return;
                end;
            end;
            for v488 = 1, v412 do
                v487(v488);
                task.wait(v488);
            end;
            local v489 = l_HttpService_0:JSONDecode(l_LoadoutSlotsTable_0.Value);
            l_LoadoutSlotsTable_0.Changed:Connect(function() --[[ Line: 1983 ]]
                -- upvalues: l_HttpService_0 (ref), l_LoadoutSlotsTable_0 (ref), v489 (ref), v417 (copy), v487 (copy)
                local v490 = l_HttpService_0:JSONDecode(l_LoadoutSlotsTable_0.Value);
                for v491, v492 in pairs(v490) do
                    local v493 = tonumber(string.match(v491, "%d+"));
                    local v494 = v489[v491];
                    if v494 then
                        if v494.UID == v492.UID and v494.CustomName ~= v492.CustomName then
                            v417[v493]:Fire("Name", v492);
                        end;
                    elseif v494 == nil then
                        v487(v493);
                    end;
                end;
                v489 = v490;
            end);
        end);
        local v495 = v22.new();
        local function v501(v496) --[[ Line: 2009 ]] --[[ Name: BindBoostsToText ]]
            -- upvalues: v495 (copy), l_Boosts_0 (copy), v42 (ref)
            v495:Clean();
            for _, v498 in ipairs(v496:GetChildren()) do
                local l_l_Boosts_0_FirstChild_0 = l_Boosts_0:FindFirstChild(v498.Name);
                if l_l_Boosts_0_FirstChild_0 then
                    local function v500() --[[ Line: 2017 ]] --[[ Name: OnBoostUpdated ]]
                        -- upvalues: v42 (ref), l_l_Boosts_0_FirstChild_0 (copy), v498 (copy)
                        v42(l_l_Boosts_0_FirstChild_0, v498.Name, v498.Value);
                    end;
                    v42(l_l_Boosts_0_FirstChild_0, v498.Name, v498.Value);
                    v495:Add(v498:GetPropertyChangedSignal("Value"):Connect(v500));
                else
                    print("could not find", v498.Name);
                end;
            end;
        end;
        local function v503(v502) --[[ Line: 2033 ]] --[[ Name: CharacterAdded ]]
            -- upvalues: v501 (copy)
            v501(v502:WaitForChild("Boosts", 360));
        end;
        task.delay(1, function() --[[ Line: 2037 ]]
            -- upvalues: l_LocalPlayer_0 (ref), v501 (copy)
            if l_LocalPlayer_0.Character == nil then
                repeat
                    task.wait();
                until l_LocalPlayer_0.Character;
            end;
            local l_Character_1 = l_LocalPlayer_0.Character;
            v501(l_Character_1:WaitForChild("Boosts", 360));
        end);
        l_LocalPlayer_0.CharacterAdded:Connect(v503);
        v31.Initialized = true;
        return;
    end;
end;
return v31;