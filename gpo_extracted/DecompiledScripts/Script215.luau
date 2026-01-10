local l_Humanoid_0 = script.char.Value:WaitForChild("Humanoid");
local l_BackgroundColor3_0 = script.Parent.BackgroundColor3;
local l_Parent_0 = script.Parent.Parent.Parent;
local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. l_Humanoid_0.Parent.Name);
task.wait();
local l_Value_0 = script.char.Value;
local l_CrewsInServer_0 = game.ReplicatedStorage:WaitForChild("CrewsInServer");
local l_PlayerFromCharacter_0 = game.Players:GetPlayerFromCharacter(l_Value_0);
local l_Info_0 = l_Value_0:FindFirstChild("Info");
local l_device_0 = script.Parent.Parent.Parent.device;
local function v23() --[[ Line: 14 ]] --[[ Name: updateTitle ]]
    -- upvalues: l_Value_0 (copy), l_PlayerFromCharacter_0 (copy), l_Parent_0 (copy), l_CrewsInServer_0 (copy)
    local l_FirstChild_1 = game.ReplicatedStorage:FindFirstChild("Stats" .. l_Value_0.Name);
    local v10 = require(game.ReplicatedStorage.Modules.Titles);
    local v11 = nil;
    local v12 = Color3.fromRGB(0, 0, 0);
    v11 = if l_FirstChild_1 then l_FirstChild_1.Titles.EquipedTitle.Value else l_Value_0:GetAttribute("Title") or "";
    if v10[v11] then
        v12 = v10[v11].RoleColor;
    end;
    local l_Value_1 = script.playerName.Value;
    local v14 = "[";
    local v15 = "]";
    local l_v11_0 = v11;
    if v11 ~= "" then
        if v10[v11] and v10[v11].StartText ~= nil then
            v14 = v10[v11].StartText .. v14;
            v15 = v15 .. v10[v11].EndText;
        end;
        if l_FirstChild_1 then
            if l_FirstChild_1.Titles.EquipedTitle.Value == "Content Creator" and game.ReplicatedStorage:FindFirstChild("Matchinfo") ~= nil then
                l_Value_1 = l_PlayerFromCharacter_0.UserId;
                v11 = "Cabin Boy";
                v12 = Color3.fromRGB(255, 255, 255);
            else
                l_Value_1 = script.playerName.Value;
            end;
        end;
        l_v11_0 = v14 .. v11 .. v15;
        local v17 = "<font color=\"#" .. tostring(v12:ToHex()) .. "\"><b>" .. l_v11_0 .. "</b></font><br/>" .. l_Value_1;
        script.Parent.Parent.Parent.NameT.Text = v17;
    end;
    if l_FirstChild_1 == nil then
        return;
    else
        local l_Value_2 = l_FirstChild_1.Stats.Crew.Value;
        if l_Value_2 ~= "" then
            local v19 = game.ReplicatedStorage.CrewRemote:InvokeServer({
                Method = "GetImage", 
                CrewName = l_Value_2
            });
            l_Parent_0.CrewFlag.Image = "https://www.roblox.com/asset-thumbnail/image?assetId=" .. v19 .. "&width=420&height=420&format=png";
            l_Parent_0.CrewName.Text = l_FirstChild_1.Stats.Crew.Value;
            if l_CrewsInServer_0 and l_CrewsInServer_0:GetAttribute("CurrentTop50") then
                local v20 = game:GetService("HttpService"):JSONDecode(l_CrewsInServer_0:GetAttribute("CurrentTop50"));
                for v21, v22 in pairs(v20) do
                    if v22.CrewName == l_FirstChild_1.Stats.Crew.Value then
                        l_Parent_0.CrewName.Text = "<b><font color=\"rgb(255,176,0)\">" .. "[#" .. v21 .. "] " .. "</font></b>" .. l_FirstChild_1.Stats.Crew.Value;
                        return;
                    end;
                end;
            end;
        end;
        return;
    end;
end;
local v24 = {
    Mobile = "rbxassetid://14942108734", 
    Controller = "rbxassetid://14959700721"
};
local function v26() --[[ Line: 83 ]] --[[ Name: updateDevice ]]
    -- upvalues: l_PlayerFromCharacter_0 (copy), l_PlayerFromCharacter_0 (copy), v24 (copy), l_device_0 (copy)
    if l_PlayerFromCharacter_0 and (_G.arena == false or _G.arena == true and _G.arenaMatchStarted == nil) then
        local l_l_PlayerFromCharacter_0_Attribute_0 = l_PlayerFromCharacter_0:GetAttribute("Device");
        if v24[l_l_PlayerFromCharacter_0_Attribute_0] then
            l_device_0.Image = v24[l_l_PlayerFromCharacter_0_Attribute_0];
            l_device_0.shadow.Image = v24[l_l_PlayerFromCharacter_0_Attribute_0];
            l_device_0.Visible = true;
            return;
        else
            l_device_0.Visible = false;
            return;
        end;
    else
        l_device_0.Visible = false;
        return;
    end;
end;
local v27 = false;
if l_Info_0 and l_Info_0:FindFirstChild("Hostile") and l_Info_0:FindFirstChild("Hostile").Value == false then
    v27 = true;
end;
v26();
if not l_Humanoid_0:IsA("Humanoid") or v27 == true then
    v23();
    l_Parent_0.Enabled = true;
    script:Destroy();
    return;
else
    local v28 = false;
    if game.ReplicatedStorage:FindFirstChild("tradingHUB") then
        v28 = true;
        script.Parent.Parent.Visible = false;
    end;
    local function v31(_) --[[ Line: 121 ]] --[[ Name: change ]]
        -- upvalues: l_Humanoid_0 (copy), l_BackgroundColor3_0 (copy), l_FirstChild_0 (copy), l_Parent_0 (copy)
        if script.Parent == nil then
            return;
        else
            local v30 = l_Humanoid_0.Health / l_Humanoid_0.MaxHealth;
            script.Parent.BackgroundColor3 = BrickColor.new("Bright red").Color:Lerp(l_BackgroundColor3_0, v30);
            script.Parent:TweenSize(UDim2.new(v30, 0, 1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true);
            if l_FirstChild_0 then
                if l_FirstChild_0.Stats.Crew.Value ~= "" then
                    l_Parent_0.CrewName.Visible = true;
                    l_Parent_0.CrewFlag.Visible = true;
                    l_Parent_0.TotalBounty.Visible = true;
                    return;
                else
                    l_Parent_0.TotalBounty.Visible = false;
                    l_Parent_0.CrewName.Visible = false;
                    l_Parent_0.CrewFlag.Visible = false;
                end;
            end;
            return;
        end;
    end;
    v31();
    l_Humanoid_0.HealthChanged:Connect(v31);
    if not l_FirstChild_0 then
        return;
    else
        if l_PlayerFromCharacter_0 then
            l_PlayerFromCharacter_0:GetAttributeChangedSignal("Device", v26);
        end;
        l_FirstChild_0.Stats.Crew.Changed:Connect(v31);
        local function _() --[[ Line: 157 ]] --[[ Name: destroyUI ]]
            -- upvalues: l_Parent_0 (copy)
            l_Parent_0:Destroy();
        end;
        (function() --[[ Line: 162 ]] --[[ Name: updateCrewInfo ]]
            -- upvalues: l_PlayerFromCharacter_0 (copy), l_Value_0 (copy), l_FirstChild_0 (copy), v23 (copy)
            if l_PlayerFromCharacter_0 ~= nil then
                script.playerName.Value = l_Value_0.Name;
                l_FirstChild_0.Titles.EquipedTitle.Changed:Connect(v23);
                l_FirstChild_0.Stats.Crew.Changed:Connect(v23);
                script.playerName.Changed:Connect(v23);
                v23();
            end;
        end)();
        l_CrewsInServer_0.AttributeChanged:Connect(function(v33) --[[ Line: 175 ]]
            -- upvalues: v23 (copy)
            if v33 == "CurrentTop50" then
                v23();
            end;
        end);
        l_Parent_0.Enabled = true;
        local l_inCombat_0 = script.Parent.Parent.Parent.inCombat;
        while true do
            if l_PlayerFromCharacter_0 == true and l_Value_0:findFirstChild("Head") then
                l_Parent_0.Adornee = l_Value_0.Head;
            end;
            if l_Parent_0.Adornee == nil then
                l_Parent_0.Adornee = workspace.Terrain;
            end;
            if (l_Value_0:WaitForChild("Head", 100000000000).Position - workspace.CurrentCamera.CFrame.Position).magnitude > 30 then
                task.wait(1);
                continue;
            end;
            if not l_Humanoid_0:IsDescendantOf(game) and (script:FindFirstChild("char") == nil or script.char.Value ~= nil and script.char.Value.Parent == nil) then
                l_Parent_0:Destroy();
                return;
            elseif l_Humanoid_0 and l_Humanoid_0:IsDescendantOf(workspace.Effects) then
                l_Parent_0:Destroy();
                return;
            else
                if l_Value_0:FindFirstChild("inCombat") then
                    l_inCombat_0.Visible = true;
                else
                    l_inCombat_0.Visible = false;
                end;
                task.wait(0.1);
            end;
        end;
    end;
end;