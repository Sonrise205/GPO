local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local l_PlayerGui_0 = l_LocalPlayer_0.PlayerGui;
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script.Parent;
local l_Minimap_0 = require(l_Parent_0:WaitForChild("Minimap"));
local l_GuiElements_0 = l_Parent_0:WaitForChild("GuiElements");
local l_Blips_0 = l_GuiElements_0:WaitForChild("Blips");
local l_Map_0 = l_GuiElements_0:WaitForChild("Map");
local l_LocalPlayer_1 = l_Blips_0:WaitForChild("LocalPlayer");
local v9 = {
    Marker = l_Blips_0:WaitForChild("Marker"), 
    stormCenter = l_Blips_0:WaitForChild("stormCenter"), 
    Player = l_Blips_0:WaitForChild("Player"), 
    hotZone = l_Blips_0:WaitForChild("hotZone"), 
    busRoute = l_Blips_0:WaitForChild("busRoute"), 
    campfire = l_Blips_0:WaitForChild("campfire"), 
    areaLabel = l_Blips_0:WaitForChild("areaLabel"), 
    phoLabel = l_Blips_0:WaitForChild("phoLabel"), 
    customBlip = l_Blips_0:WaitForChild("customBlip")
};
local l_script_Attribute_0 = script:GetAttribute("Center");
local v11 = game:GetService("HttpService"):JSONDecode(script:GetAttribute("Resolution"));
local v12 = l_Minimap_0.CreateMinimap(false, false, false, l_script_Attribute_0, 2, v11, true, false, "Minimap");
v12:ImportMap(l_Map_0:Clone());
local v13 = nil;
v13 = (l_LocalPlayer_0.Character or l_LocalPlayer_0.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart");
local _ = v13;
v12:ImportMainBlip(l_LocalPlayer_1:Clone(), v13, true);
v12:Run();
local l_LocalPlayer_2 = game.Players.LocalPlayer;
local v16 = nil;
game.Players.LocalPlayer.CharacterAdded:Connect(function(v17) --[[ Line: 54 ]]
    -- upvalues: l_LocalPlayer_2 (copy), v16 (ref), v12 (copy)
    local l_HumanoidRootPart_0 = v17:WaitForChild("HumanoidRootPart");
    if l_LocalPlayer_2.Team == game.Teams.Eliminated then
        if v16 == nil then
            v16 = script.camPart:Clone();
            v16.Parent = workspace.Effects;
            game["Run Service"].RenderStepped:Connect(function() --[[ Line: 60 ]]
                -- upvalues: v16 (ref)
                v16.CFrame = workspace.CurrentCamera.CFrame;
            end);
            v12:UpdateMainBlipPart(v16);
            return;
        end;
    else
        v12:UpdateMainBlipPart(l_HumanoidRootPart_0);
    end;
end);
v12.ScreenGui.Enabled = false;
game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false);
l_UserInputService_0.InputBegan:Connect(function(v19, v20) --[[ Line: 74 ]]
    -- upvalues: v12 (copy), l_UserInputService_0 (copy)
    if v20 then
        return;
    elseif v19.KeyCode == Enum.KeyCode.Tab then
        v12.ScreenGui.Enabled = true;
        repeat
            task.wait();
        until l_UserInputService_0:IsKeyDown(Enum.KeyCode.Tab) == false;
        v12.ScreenGui.Enabled = false;
        return;
    else
        if v19.KeyCode == Enum.KeyCode.CapsLock and game:GetService("GuiService"):IsTenFootInterface() == true then
            v12.ScreenGui.Enabled = true;
            repeat
                task.wait();
            until l_UserInputService_0:IsKeyDown(Enum.KeyCode.CapsLock) == false;
            v12.ScreenGui.Enabled = false;
        end;
        return;
    end;
end);
local l_BattleRoyaleMiniMap_0 = l_PlayerGui_0:WaitForChild("BattleRoyaleMiniMap");
local l_MiniMap_0 = l_BattleRoyaleMiniMap_0.MiniMap;
local l_PlayerScripts_0 = l_LocalPlayer_0:WaitForChild("PlayerScripts");
l_BattleRoyaleMiniMap_0.Enabled = require(l_PlayerScripts_0:WaitForChild("InputHandler")):GetCurrentInput() == "Mobile";
l_MiniMap_0.Activated:Connect(function() --[[ Line: 101 ]]
    -- upvalues: v12 (copy)
    v12.ScreenGui.Enabled = not v12.ScreenGui.Enabled;
end);
local v24 = {};
local l_LocalPlayer_3 = game.Players.LocalPlayer;
local function v32() --[[ Line: 108 ]] --[[ Name: updatePartyBlips ]]
    -- upvalues: l_LocalPlayer_3 (copy), v24 (copy), v12 (copy), v9 (copy)
    if l_LocalPlayer_3.Party.Value == nil then
        return;
    else
        local l_Children_0 = game.ReplicatedStorage.currentParty:FindFirstChild(l_LocalPlayer_3.Party.Value.Name):GetChildren();
        for v27 = 1, #l_Children_0 do
            local l_FirstChild_0 = game.Players:FindFirstChild(l_Children_0[v27].Name);
            if v24[l_FirstChild_0] == nil and l_FirstChild_0 ~= game.Players.LocalPlayer and l_FirstChild_0.Team == game.Teams.Players and l_Children_0[v27]:FindFirstChild("playerColor") then
                task.spawn(function() --[[ Line: 116 ]]
                    -- upvalues: l_FirstChild_0 (copy), v12 (ref), v9 (ref), l_Children_0 (copy), v27 (copy), v24 (ref)
                    local l_Character_0 = l_FirstChild_0.Character;
                    if l_Character_0 == nil then
                        return;
                    else
                        local v30 = l_Character_0:WaitForChild("HumanoidRootPart", 100000000000);
                        v12:ImportBlip(v9.Player:Clone(), v30, false, true).ImageColor3 = l_Children_0[v27].playerColor.Value;
                        v12:EnableBlip(v30);
                        v24[l_FirstChild_0] = v30;
                        local v31 = nil;
                        v31 = l_FirstChild_0:GetPropertyChangedSignal("Team"):Connect(function() --[[ Line: 127 ]]
                            -- upvalues: l_FirstChild_0 (ref), v12 (ref), v30 (copy), v24 (ref), v31 (ref)
                            if l_FirstChild_0.Team ~= game.Teams.Players then
                                warn("eliminated");
                                v12:RemoveBlip(v30);
                                v24[l_FirstChild_0] = nil;
                                v31:Disconnect();
                            end;
                        end);
                        v30.Destroying:Connect(function() --[[ Line: 136 ]]
                            -- upvalues: v12 (ref), v30 (copy), v24 (ref), l_FirstChild_0 (ref)
                            warn("root destryoed removing blip");
                            v12:RemoveBlip(v30);
                            v24[l_FirstChild_0] = nil;
                            warn("removed blip!");
                        end);
                        return;
                    end;
                end);
            end;
        end;
        return;
    end;
end;
task.spawn(function() --[[ Line: 147 ]]
    -- upvalues: v32 (copy)
    while true do
        v32();
        task.wait(1);
    end;
end);
local l_l_PlayerScripts_0_FirstChild_0 = l_PlayerScripts_0:FindFirstChild("MarkerMenu", true);
_G.addBlip = function(v34, v35, v36, v37) --[[ Line: 156 ]]
    -- upvalues: v12 (copy), v9 (copy), l_l_PlayerScripts_0_FirstChild_0 (copy)
    v35 = _G.awaitObject(v35);
    local v38 = v12:ImportBlip(v9[v34]:Clone(), v35, false, true);
    v12:EnableBlip(v35);
    if v36 and l_l_PlayerScripts_0_FirstChild_0:FindFirstChild(v36) then
        local l_l_l_PlayerScripts_0_FirstChild_0_FirstChild_0 = l_l_PlayerScripts_0_FirstChild_0:FindFirstChild(v36);
        v38.Image = l_l_l_PlayerScripts_0_FirstChild_0_FirstChild_0.Image;
        v38.ImageColor3 = l_l_l_PlayerScripts_0_FirstChild_0_FirstChild_0.ImageColor3;
    end;
    if v34 == "hotZone" then
        local v40 = script.Parent.Minimap.hotZoneRing:Clone();
        v40.Parent = v38;
        local v41 = v35.Mesh.Scale.X / 5.25;
        v40.Size = UDim2.new(0, v41, 0, v41);
    elseif v34 == "areaLabel" then
        v38.Text = v35.Name;
    end;
    if v37 then
        v37 = game:GetService("HttpService"):JSONDecode(v37);
        v38.areaLabel.Text = v37.Text;
        v38.Image = v37.Image;
        if v37.Color then
            v38.areaLabel.TextColor3 = Color3.new(v37.Color[1], v37.Color[2], v37.Color[3]);
        end;
        if v37.Size then
            v38.Size = UDim2.new(0, v37.Size, 0, v37.Size);
        end;
    end;
    return v38;
end;
_G.addBusRoute = function(_, _, v44, v45) --[[ Line: 192 ]]
    -- upvalues: v12 (copy), v9 (copy)
    warn("new hotzone added!");
    local v46 = v12:ImportBlip(v9.busRoute:Clone(), v45, false, true);
    v12:EnableBlip(v45);
    local v47 = v44 / 5.25;
    v46.Size = UDim2.new(0, 2, 0, v47);
    v46.Rotation = -v45.Orientation.Y;
end;
_G.attachMinimapToMarker(v12, v9);
repeat
    task.wait();
until _G.stormPart ~= nil;
v12:ImportBlip(v9.stormCenter:Clone(), _G.stormPart, false, true);
v12:EnableBlip(_G.stormPart);