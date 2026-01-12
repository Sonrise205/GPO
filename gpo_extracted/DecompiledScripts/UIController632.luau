local l_Players_0 = game:GetService("Players");
local _ = game:GetService("ReplicatedStorage");
local _ = game:GetService("UserInputService");
local _ = game:GetService("TweenService");
local l_CollectionService_0 = game:GetService("CollectionService");
local l_ReplicatedStorage_1 = game:GetService("ReplicatedStorage");
local l_Modules_0 = l_ReplicatedStorage_1:WaitForChild("Modules");
local l_Shared_0 = l_Modules_0:WaitForChild("Shared");
local l_Signals_0 = l_Shared_0:WaitForChild("Signals");
local l_GoodSignal_0 = require(l_Signals_0:WaitForChild("GoodSignal"));
local l_RunService_0 = game:GetService("RunService");
local l_Promises_0 = l_Shared_0:WaitForChild("Promises");
local l_Promise_0 = require(l_Promises_0:WaitForChild("Promise"));
local v13 = require(l_ReplicatedStorage_1.Modules.Trove);
local l_GamePlaceInfo_0 = require(l_Shared_0:WaitForChild("GamePlaceInfo"));
local v15 = require(l_Shared_0.GameUtils);
local _ = require(l_ReplicatedStorage_1.Modules.MEnterLeave);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_PlayerGui_0 = l_LocalPlayer_0:WaitForChild("PlayerGui");
local v19 = {
    GuiModules = {}, 
    UIStrokes = {}, 
    Whitelist = {
        [73169236] = true, 
        [38079729] = true, 
        [100195140] = true
    }, 
    StatsFolder = nil, 
    OnStatsFolderLoaded = l_GoodSignal_0.new(), 
    ItemRotation = true
};
v19.GetWhitelist = function(_) --[[ Line: 49 ]] --[[ Name: GetWhitelist ]]
    -- upvalues: v19 (copy)
    return v19.Whitelist;
end;
v19.GetStatsFolder = function(_) --[[ Line: 53 ]] --[[ Name: GetStatsFolder ]]
    -- upvalues: v19 (copy)
    return v19.StatsFolder or v19.OnStatsFolderLoaded:Wait();
end;
v19.Initialize = function(_) --[[ Line: 57 ]] --[[ Name: Initialize ]]
    -- upvalues: l_ReplicatedStorage_1 (copy), l_LocalPlayer_0 (copy), l_Promise_0 (copy), v19 (copy), v15 (copy), l_PlayerGui_0 (copy), l_GamePlaceInfo_0 (copy), v13 (copy), l_RunService_0 (copy), l_CollectionService_0 (copy)
    local l_reservedCode_0 = l_ReplicatedStorage_1:WaitForChild("reservedCode");
    while l_reservedCode_0.Value == "checking" do
        task.wait(1);
    end;
    local l_Children_0 = l_ReplicatedStorage_1.GUIS:GetChildren();
    if #l_Children_0 == 0 then
        l_Children_0 = l_ReplicatedStorage_1.GUIS.ChildAdded:Wait() and l_ReplicatedStorage_1.GUIS:GetChildren();
    end;
    local function v27() --[[ Line: 70 ]] --[[ Name: createUI ]]
        -- upvalues: l_Children_0 (ref), l_LocalPlayer_0 (ref)
        for _, v26 in l_Children_0 do
            if not l_LocalPlayer_0.PlayerGui:FindFirstChild(v26.Name) then
                v26:Clone().Parent = l_LocalPlayer_0.PlayerGui;
            end;
        end;
    end;
    l_LocalPlayer_0.CharacterAdded:Connect(v27);
    v27();
    local function v28() --[[ Line: 85 ]] --[[ Name: PromiseStatsFolder ]]
        -- upvalues: l_Promise_0 (ref), l_ReplicatedStorage_1 (ref), l_LocalPlayer_0 (ref), v19 (ref), v28 (copy)
        l_Promise_0.spawn(function(v29, v30) --[[ Line: 86 ]]
            -- upvalues: l_ReplicatedStorage_1 (ref), l_LocalPlayer_0 (ref)
            local l_l_ReplicatedStorage_1_FirstChild_0 = l_ReplicatedStorage_1:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
            if not l_l_ReplicatedStorage_1_FirstChild_0 then
                v30(l_l_ReplicatedStorage_1_FirstChild_0);
            end;
            v29(l_l_ReplicatedStorage_1_FirstChild_0);
        end):Then(function(v32) --[[ Line: 95 ]]
            -- upvalues: v19 (ref)
            v32:WaitForChild("Stats");
            v19.StatsFolder = v32;
            v19.OnStatsFolderLoaded:Fire(v32);
        end):Catch(function(_) --[[ Line: 100 ]]
            -- upvalues: v28 (ref)
            task.wait(1);
            v28();
        end);
    end;
    v28();
    l_ReplicatedStorage_1:WaitForChild("Stats" .. l_LocalPlayer_0.Name):WaitForChild("Stats");
    local l_Guis_0 = script:WaitForChild("Guis");
    local function _(v35) --[[ Line: 112 ]] --[[ Name: SetupGui ]]
        -- upvalues: v19 (ref)
        v19.GuiModules[v35.Name] = require(v35);
        task.spawn(v19.GuiModules[v35.Name].Initialize, v19);
    end;
    local function v40(v37) --[[ Line: 117 ]] --[[ Name: SetupGuis ]]
        -- upvalues: v19 (ref)
        for _, v39 in ipairs(v37:GetChildren()) do
            print("initializng", v39);
            v19.GuiModules[v39.Name] = require(v39);
            task.spawn(v19.GuiModules[v39.Name].Initialize, v19);
        end;
    end;
    if not l_LocalPlayer_0.Character then
        local _ = l_LocalPlayer_0.CharacterAdded:Wait();
    end;
    while _G.hideUI == nil or _G.HasBaseItem == nil do
        task.wait();
    end;
    if v15.GetInputType() ~= "PC" and v15.GetInputType() ~= "Console" then
        local l_l_PlayerGui_0_Descendants_0 = l_PlayerGui_0:GetDescendants();
        for v43 = 1, #l_l_PlayerGui_0_Descendants_0 do
            if l_l_PlayerGui_0_Descendants_0[v43].Name == "DeviceUIScale" then
                l_l_PlayerGui_0_Descendants_0[v43].Scale = l_l_PlayerGui_0_Descendants_0[v43]:GetAttribute("CustomScale") or 1.3;
                warn("scaled", l_l_PlayerGui_0_Descendants_0[v43]:GetFullName(), l_l_PlayerGui_0_Descendants_0[v43].Scale);
            elseif l_l_PlayerGui_0_Descendants_0[v43]:GetAttribute("DeviceScale") then
                local l_Attribute_0 = l_l_PlayerGui_0_Descendants_0[v43]:GetAttribute("DeviceScale");
                local l_Size_0 = l_l_PlayerGui_0_Descendants_0[v43].Size;
                l_l_PlayerGui_0_Descendants_0[v43].Size = UDim2.new(l_Size_0.X.Scale * l_Attribute_0, l_Size_0.X.Offset * l_Attribute_0, l_Size_0.Y.Scale * l_Attribute_0, l_Size_0.Y.Offset * l_Attribute_0);
                warn("scaled", l_l_PlayerGui_0_Descendants_0[v43]:GetFullName(), l_Attribute_0);
            end;
        end;
        pcall(function() --[[ Line: 147 ]]
            -- upvalues: l_PlayerGui_0 (ref)
            l_PlayerGui_0:WaitForChild("Compass", 5).IgnoreGuiInset = false;
        end);
        warn("not pc", v15.GetInputType());
    end;
    v40(l_Guis_0:WaitForChild("Core"));
    task.spawn(function() --[[ Line: 158 ]]
        -- upvalues: l_GamePlaceInfo_0 (ref), v40 (copy), l_Guis_0 (copy)
        local v46 = l_GamePlaceInfo_0:GetPlaceIds()[game.PlaceId];
        if v46 ~= nil and (v46 == "Trade Hub" or v46 == "VC Trade Hub") then
            v40(l_Guis_0:WaitForChild("TradeHub"));
        end;
    end);
    local l_Mouse_0 = game.Players.LocalPlayer:GetMouse();
    local function v60(v48, v49) --[[ Line: 170 ]] --[[ Name: addHoverEffect ]]
        -- upvalues: l_PlayerGui_0 (ref), l_Mouse_0 (copy), v13 (ref), l_RunService_0 (ref)
        if v49 == nil then
            if v48:GetAttribute("EnableMouseSelectionHoverEnabled") then
                return;
            end;
        else
            local l_SelectionStroke_0 = v48:FindFirstChild("SelectionStroke");
            if l_SelectionStroke_0 then
                l_SelectionStroke_0:Destroy();
            end;
        end;
        if v48:IsDescendantOf(l_PlayerGui_0) == false then
            return;
        else
            v48:SetAttribute("EnableMouseSelectionHoverEnabled", true);
            local v51 = script.SelectionStroke:Clone();
            v51.Parent = v48;
            v48.MouseEnter:Connect(function() --[[ Line: 193 ]]
                -- upvalues: v51 (copy), l_Mouse_0 (ref), v13 (ref), l_RunService_0 (ref), v48 (copy)
                v51.Enabled = true;
                script.HoverUI:Play();
                local function _(v52) --[[ Line: 197 ]] --[[ Name: IsInFrame ]]
                    -- upvalues: l_Mouse_0 (ref)
                    local l_X_0 = l_Mouse_0.X;
                    local l_Y_0 = l_Mouse_0.Y;
                    if v52.AbsolutePosition.X < l_X_0 and v52.AbsolutePosition.Y < l_Y_0 and l_X_0 < v52.AbsolutePosition.X + v52.AbsoluteSize.X and l_Y_0 < v52.AbsolutePosition.Y + v52.AbsoluteSize.Y then
                        return true;
                    else
                        return false;
                    end;
                end;
                local v56 = v13.new();
                v56:Add(l_RunService_0.Heartbeat:Connect(function() --[[ Line: 210 ]]
                    -- upvalues: v48 (ref), l_Mouse_0 (ref), v51 (ref), v56 (ref)
                    local l_v48_0 = v48;
                    local l_X_1 = l_Mouse_0.X;
                    local l_Y_1 = l_Mouse_0.Y;
                    if (l_v48_0.AbsolutePosition.X < l_X_1 and l_v48_0.AbsolutePosition.Y < l_Y_1 and l_X_1 < l_v48_0.AbsolutePosition.X + l_v48_0.AbsoluteSize.X and l_Y_1 < l_v48_0.AbsolutePosition.Y + l_v48_0.AbsoluteSize.Y) == false then
                        v51.Enabled = false;
                        v56:Destroy();
                        v56 = nil;
                        return;
                    else
                        return;
                    end;
                end));
            end);
            return;
        end;
    end;
    l_CollectionService_0:GetInstanceAddedSignal("EnableMouseSelectionHover"):Connect(function(v61) --[[ Line: 235 ]]
        -- upvalues: v60 (copy)
        v60(v61, true);
    end);
    for _, v63 in pairs(l_CollectionService_0:GetTagged("EnableMouseSelectionHover")) do
        v60(v63);
    end;
end;
v19.UIUtils = require(l_Modules_0.Client.UIUtils);
return v19;