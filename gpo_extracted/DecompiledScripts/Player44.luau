local l_TweenService_0 = game:GetService("TweenService");
local _ = game:GetService("ReplicatedStorage");
local v2 = require(game.ReplicatedStorage.Modules.Shared.Maids.Maid);
local v3 = require(game.ReplicatedStorage.Modules.Titles);
local l_LocalPlayer_0 = game.Players.LocalPlayer;
local v5 = {};
v5.__index = v5;
local function v7(v6) --[[ Line: 14 ]] --[[ Name: getDisplayWithTitle ]]
    -- upvalues: v3 (copy)
    return v6.DisplayName;
end;
v5.new = function(v8, v9) --[[ Line: 62 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy), v2 (copy)
    local v10 = setmetatable({}, v5);
    v10.Player = v9;
    v10.Playerlist = v8;
    v10.Team = nil;
    v10.Cleaner = v2.new();
    v10.UI = v10:_createUI();
    v10.MainLeaderstat = v10.UI.Main.LeaderStats;
    return v10;
end;
v5._createUI = function(v11) --[[ Line: 76 ]] --[[ Name: _createUI ]]
    -- upvalues: v7 (copy)
    local v12 = script.UI:Clone();
    v12.Name = v11.Player.DisplayName;
    v12.Main.TextLabel.Text = v7(v11.Player);
    return v12;
end;
v5._load = function(v13) --[[ Line: 83 ]] --[[ Name: _load ]]
    -- upvalues: l_TweenService_0 (copy)
    local l_UI_0 = v13.UI;
    l_UI_0.Size = UDim2.fromOffset();
    l_TweenService_0:Create(l_UI_0, TweenInfo.new(0.5), {
        Size = UDim2.fromOffset(0, 20)
    }):Play();
end;
v5.Remove = function(v15) --[[ Line: 94 ]] --[[ Name: Remove ]]
    -- upvalues: l_TweenService_0 (copy)
    if v15.Team then
        v15.Team:RemoveMember(v15);
    end;
    local v16 = l_TweenService_0:Create(v15.UI, TweenInfo.new(0.5), {
        Size = UDim2.fromScale(0, 0)
    });
    v16:Play();
    task.delay(v16.TweenInfo.Time, v15.Destroy, v15);
end;
v5._handleTeams = function(v17) --[[ Line: 107 ]] --[[ Name: _handleTeams ]]
    local l_Player_0 = v17.Player;
    local l_Playerlist_0 = v17.Playerlist;
    local function v21() --[[ Line: 111 ]] --[[ Name: OnTeamChanged ]]
        -- upvalues: l_Player_0 (copy), l_Playerlist_0 (copy), v17 (copy)
        local l_Team_0 = l_Player_0.Team;
        l_Playerlist_0:SetTeam(v17, l_Team_0);
    end;
    l_Playerlist_0:SetTeam(v17, l_Player_0.Team);
    l_Player_0:GetPropertyChangedSignal("Team"):Connect(v21);
end;
v5._handleLeaderstats = function(v22) --[[ Line: 120 ]] --[[ Name: _handleLeaderstats ]]
    -- upvalues: v7 (copy), l_LocalPlayer_0 (copy)
    local l_Player_1 = v22.Player;
    local l_Playerlist_1 = v22.Playerlist;
    local l_Cleaner_0 = v22.Cleaner;
    local l_Leaderstats_0 = l_Playerlist_1.Leaderstats;
    local v27 = nil;
    local v28 = nil;
    local function v39(v29) --[[ Line: 128 ]] --[[ Name: ChildAdded ]]
        -- upvalues: l_Leaderstats_0 (copy), v22 (copy), l_Cleaner_0 (copy)
        if not l_Leaderstats_0:IsValidStat(v29) then
            return;
        else
            local l_Name_0 = v29.Name;
            l_Leaderstats_0:AddStat(v22, l_Name_0, v29:GetAttribute("Priority"));
            local function v32() --[[ Line: 134 ]] --[[ Name: Changed ]]
                -- upvalues: v29 (copy), l_Leaderstats_0 (ref), v22 (ref)
                local l_Value_0 = v29.Value;
                l_Leaderstats_0.StatChanged:Fire(v22);
                l_Leaderstats_0:UpdateStat(v22, v29.Name, l_Value_0);
            end;
            local function v35() --[[ Line: 140 ]] --[[ Name: NameChanged ]]
                -- upvalues: v29 (copy), l_Name_0 (ref), l_Leaderstats_0 (ref), v22 (ref)
                local l_Name_1 = v29.Name;
                if l_Name_0 == l_Name_1 then
                    return;
                else
                    l_Leaderstats_0:RemoveStat(v22, l_Name_0);
                    l_Leaderstats_0:AddStat(v22, l_Name_1);
                    local l_Value_1 = v29.Value;
                    l_Leaderstats_0.StatChanged:Fire(v22);
                    l_Leaderstats_0:UpdateStat(v22, v29.Name, l_Value_1);
                    l_Name_0 = l_Name_1;
                    return;
                end;
            end;
            local function v36() --[[ Line: 151 ]] --[[ Name: PriorityChanged ]]
                -- upvalues: l_Leaderstats_0 (ref), v29 (copy)
                l_Leaderstats_0:SetPriority(v29.Name, v29:GetAttribute("Priority"));
            end;
            local l_Value_2 = v29.Value;
            l_Leaderstats_0.StatChanged:Fire(v22);
            l_Leaderstats_0:UpdateStat(v22, v29.Name, l_Value_2);
            l_Value_2 = v29.Name;
            if l_Name_0 ~= l_Value_2 then
                l_Leaderstats_0:RemoveStat(v22, l_Name_0);
                l_Leaderstats_0:AddStat(v22, l_Value_2);
                local l_Value_3 = v29.Value;
                l_Leaderstats_0.StatChanged:Fire(v22);
                l_Leaderstats_0:UpdateStat(v22, v29.Name, l_Value_3);
                l_Name_0 = l_Value_2;
            end;
            l_Cleaner_0[("%*Changed"):format(v29)] = v29.Changed:Connect(v32);
            l_Cleaner_0[("%*NameChanged"):format(v29)] = v29:GetPropertyChangedSignal("Name"):Connect(v35);
            l_Cleaner_0[("%*PriorityChanged"):format(v29)] = v29:GetAttributeChangedSignal("Priority"):Connect(v36);
            return;
        end;
    end;
    local function v41(v40) --[[ Line: 163 ]] --[[ Name: ChildRemoved ]]
        -- upvalues: l_Leaderstats_0 (copy), v22 (copy), l_Cleaner_0 (copy)
        if not l_Leaderstats_0:IsValidStat(v40) then
            return;
        else
            l_Leaderstats_0:RemoveStat(v22, v40.Name);
            l_Cleaner_0[("%*Changed"):format(v40)] = nil;
            l_Cleaner_0[("%*NameChanged"):format(v40)] = nil;
            l_Cleaner_0[("%*PriorityChanged"):format(v40)] = nil;
            return;
        end;
    end;
    local _ = function() --[[ Line: 173 ]] --[[ Name: LeaderstatsRemoved ]]
        -- upvalues: v27 (ref), l_Leaderstats_0 (copy), v22 (copy), l_Cleaner_0 (copy)
        for _, v43 in v27:GetChildren() do
            if l_Leaderstats_0:IsValidStat(v43) then
                l_Leaderstats_0:RemoveStat(v22, v43.Name);
                l_Cleaner_0[("%*Changed"):format(v43)] = nil;
                l_Cleaner_0[("%*NameChanged"):format(v43)] = nil;
                l_Cleaner_0[("%*PriorityChanged"):format(v43)] = nil;
            end;
        end;
        l_Cleaner_0.LeaderstatsChildAdded = nil;
        l_Cleaner_0.LeaderstatsChildRemoved = nil;
    end;
    local function v50(v45) --[[ Line: 180 ]] --[[ Name: LeaderstatsInitialized ]]
        -- upvalues: v27 (ref), l_Leaderstats_0 (copy), v22 (copy), l_Cleaner_0 (copy), v39 (copy), v41 (copy)
        if v45.Name ~= "leaderstats" then
            if v27 == v45 then
                for _, v47 in v27:GetChildren() do
                    if l_Leaderstats_0:IsValidStat(v47) then
                        l_Leaderstats_0:RemoveStat(v22, v47.Name);
                        l_Cleaner_0[("%*Changed"):format(v47)] = nil;
                        l_Cleaner_0[("%*NameChanged"):format(v47)] = nil;
                        l_Cleaner_0[("%*PriorityChanged"):format(v47)] = nil;
                    end;
                end;
                l_Cleaner_0.LeaderstatsChildAdded = nil;
                l_Cleaner_0.LeaderstatsChildRemoved = nil;
            end;
            return;
        elseif v27 then
            return;
        else
            v27 = v45;
            for _, v49 in v45:GetChildren() do
                v39(v49);
            end;
            l_Cleaner_0.LeaderstatsChildAdded = v45.ChildAdded:Connect(v39);
            l_Cleaner_0.LeaderstatsChildRemoved = v45.ChildRemoved:Connect(v41);
            return;
        end;
    end;
    local function v53(v51) --[[ Line: 197 ]] --[[ Name: FolderAdded ]]
        -- upvalues: v50 (copy), l_Cleaner_0 (copy)
        if not v51:IsA("Folder") then
            return;
        else
            local function v52() --[[ Line: 200 ]] --[[ Name: LeaderstatsCheck ]]
                -- upvalues: v50 (ref), v51 (copy)
                v50(v51);
            end;
            l_Cleaner_0[("%*NameChanged"):format(v51)] = v51:GetPropertyChangedSignal("Name"):Connect(v52);
            v50(v51);
            return;
        end;
    end;
    local function v57(v54) --[[ Line: 208 ]] --[[ Name: FolderRemoved ]]
        -- upvalues: l_Cleaner_0 (copy), v27 (ref), l_Leaderstats_0 (copy), v22 (copy)
        if not v54:IsA("Folder") then
            return;
        else
            l_Cleaner_0[("%*NameChanged"):format(v54)] = nil;
            if v27 == v54 then
                for _, v56 in v27:GetChildren() do
                    if l_Leaderstats_0:IsValidStat(v56) then
                        l_Leaderstats_0:RemoveStat(v22, v56.Name);
                        l_Cleaner_0[("%*Changed"):format(v56)] = nil;
                        l_Cleaner_0[("%*NameChanged"):format(v56)] = nil;
                        l_Cleaner_0[("%*PriorityChanged"):format(v56)] = nil;
                    end;
                end;
                l_Cleaner_0.LeaderstatsChildAdded = nil;
                l_Cleaner_0.LeaderstatsChildRemoved = nil;
            end;
            return;
        end;
    end;
    for _, v59 in l_Player_1:GetChildren() do
        v53(v59);
    end;
    l_Player_1.ChildAdded:Connect(v53);
    l_Player_1.ChildRemoved:Connect(v57);
    task.defer(function() --[[ Line: 220 ]]
        -- upvalues: v28 (ref), l_Player_1 (copy), v22 (copy), v7 (ref)
        v28 = game.ReplicatedStorage:WaitForChild("Stats" .. l_Player_1.Name, 600);
        v28:WaitForChild("Stats"):WaitForChild("Crew");
        v28:WaitForChild("Titles");
        local l_CrewsInServer_0 = game.ReplicatedStorage:WaitForChild("CrewsInServer");
        local l_TextLabel_0 = v22.UI.Main.TextLabel;
        local function v67() --[[ Line: 227 ]] --[[ Name: updateCrew ]]
            -- upvalues: v28 (ref), v22 (ref), l_CrewsInServer_0 (copy), l_TextLabel_0 (copy), v7 (ref), l_Player_1 (ref)
            if v28:FindFirstChild("Stats") == nil then
                return;
            else
                local l_Value_4 = v28.Stats.Crew.Value;
                local l_Icon_0 = v22.UI.Crew.Icon;
                if l_Value_4 ~= "" then
                    l_Icon_0.Image = "https://www.roblox.com/asset-thumbnail/image?assetId=" .. game.ReplicatedStorage.CrewRemote:InvokeServer({
                        Method = "GetImage", 
                        CrewName = l_Value_4
                    }) .. "&width=420&height=420&format=png";
                    v22.UI.Crew.CrewName.Text = v28.Stats.Crew.Value;
                    if l_CrewsInServer_0 and l_CrewsInServer_0:GetAttribute("CurrentTop50") then
                        local v64 = game:GetService("HttpService"):JSONDecode(l_CrewsInServer_0:GetAttribute("CurrentTop50"));
                        for v65, v66 in pairs(v64) do
                            if v66.CrewName == l_Value_4 then
                                v22.UI.Crew.CrewName.Text = "<b><font color=\"rgb(255,176,0)\">" .. "[#" .. v65 .. "] " .. "</font></b>" .. l_Value_4;
                                break;
                            end;
                        end;
                    end;
                    v22.UI.Crew.Visible = true;
                else
                    v22.UI.Crew.Visible = false;
                end;
                l_TextLabel_0.Text = v7(l_Player_1);
                return;
            end;
        end;
        v67();
        local v68 = nil;
        v68 = l_CrewsInServer_0.AttributeChanged:Connect(function(v69) --[[ Line: 261 ]]
            -- upvalues: l_Player_1 (ref), v68 (ref), v67 (copy)
            if l_Player_1:IsDescendantOf(game.Players) == false then
                v68:Disconnect();
                return;
            else
                if v69 == "CurrentTop50" then
                    v67();
                end;
                return;
            end;
        end);
        v28.Stats.Crew.Changed:Connect(v67);
        v28.Titles.EquipedTitle.Changed:Connect(function() --[[ Line: 272 ]]
            -- upvalues: l_TextLabel_0 (copy), v7 (ref), l_Player_1 (ref)
            l_TextLabel_0.Text = v7(l_Player_1);
        end);
        while true do
            task.wait(60);
            if l_Player_1:IsDescendantOf(game.Players) ~= false then
                v67();
            else
                break;
            end;
        end;
    end);
    task.defer(function() --[[ Line: 284 ]]
        -- upvalues: v22 (copy), l_LocalPlayer_0 (ref), l_Player_1 (copy)
        local l_friendIcon_0 = v22.UI.Main.TextLabel.friendIcon;
        local function _() --[[ Line: 286 ]] --[[ Name: updateFriendIcon ]]
            -- upvalues: l_LocalPlayer_0 (ref), l_Player_1 (ref), l_friendIcon_0 (copy)
            if l_LocalPlayer_0:IsFriendsWith(l_Player_1.UserId) then
                l_friendIcon_0.Visible = true;
                return;
            else
                l_friendIcon_0.Visible = false;
                return;
            end;
        end;
        while l_Player_1:IsDescendantOf(game.Players) ~= false do
            if l_LocalPlayer_0:IsFriendsWith(l_Player_1.UserId) then
                l_friendIcon_0.Visible = true;
            else
                l_friendIcon_0.Visible = false;
            end;
            task.wait(60);
        end;
    end);
end;
v5._hoverName = function(v72) --[[ Line: 305 ]] --[[ Name: _hoverName ]]
    -- upvalues: v7 (copy)
    local l_Player_2 = v72.Player;
    local l_UI_1 = v72.UI;
    local l_TextLabel_1 = l_UI_1.Main.TextLabel;
    l_UI_1.MouseEnter:Connect(function() --[[ Line: 310 ]]
        -- upvalues: l_TextLabel_1 (copy), l_Player_2 (copy)
        l_TextLabel_1.Text = l_Player_2.Name;
    end);
    l_UI_1.MouseLeave:Connect(function() --[[ Line: 314 ]]
        -- upvalues: l_TextLabel_1 (copy), v7 (ref), l_Player_2 (copy)
        l_TextLabel_1.Text = v7(l_Player_2);
    end);
end;
v5.Initialize = function(v76) --[[ Line: 319 ]] --[[ Name: Initialize ]]
    v76:_load();
    v76:_handleTeams();
    v76:_handleLeaderstats();
    v76:_hoverName();
end;
v5.Destroy = function(v77) --[[ Line: 326 ]] --[[ Name: Destroy ]]
    v77.UI:Destroy();
    setmetatable(v77, nil);
end;
return v5;