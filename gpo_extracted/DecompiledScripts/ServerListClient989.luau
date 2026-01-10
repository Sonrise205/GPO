local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("TeleportService");
local l_Players_0 = game:GetService("Players");
local l_Client_0 = l_ReplicatedStorage_0:WaitForChild("Modules").Client;
local l_UIUtils_0 = require(l_Client_0:WaitForChild("UIUtils"));
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Main_0 = script.Parent:WaitForChild("Main");
local l_List_0 = l_Main_0:WaitForChild("List");
local l_Refresh_0 = l_Main_0:WaitForChild("Refresh");
local l_CanCapture_0 = l_Main_0:WaitForChild("CanCapture");
local l_ListedServers_0 = l_Main_0:WaitForChild("ListedServers");
local l_SearchBox_0 = l_Main_0:WaitForChild("SearchBox");
local l_Region_0 = l_Main_0:WaitForChild("Region");
local l_List_1 = l_Region_0:WaitForChild("List");
local l_ServerListRemote_0 = l_ReplicatedStorage_0:WaitForChild("ServerListRemote");
local v15 = l_ReplicatedStorage_0:WaitForChild("Stats" .. l_LocalPlayer_0.Name, 360);
local v16 = v15 and v15:WaitForChild("Stats");
local v17 = v16 and v16:WaitForChild("Crew");
local v18 = nil;
local v19 = {};
local v20 = false;
local function v26() --[[ Line: 35 ]] --[[ Name: UpdateSearchList ]]
    -- upvalues: l_SearchBox_0 (copy), l_List_0 (copy), v18 (ref), v20 (ref)
    local l_Text_0 = l_SearchBox_0.Text;
    local v22 = string.lower(l_Text_0);
    for _, v24 in pairs(l_List_0:GetChildren()) do
        if v24:IsA("Frame") then
            local v25 = not v18 or v18 == v24:GetAttribute("Region");
            if v20 == true then
                if v24:GetAttribute("CanCaptureIslands") == true then
                    v24.Visible = v25 and string.find(string.lower(v24.Name), v22) and true or false;
                else
                    v24.Visible = false;
                end;
            else
                v24.Visible = v25 and string.find(string.lower(v24.Name), v22) and true or false;
            end;
        end;
    end;
end;
l_List_1.ChildAdded:Connect(function(v27) --[[ Line: 63 ]]
    -- upvalues: v18 (ref), v26 (copy)
    v27.Activated:Connect(function() --[[ Line: 64 ]]
        -- upvalues: v18 (ref), v27 (copy), v26 (ref)
        v18 = v27:GetAttribute("Region");
        v26();
    end);
end);
local v28 = script.RegionTemplate:Clone();
v28.Name = "Any";
v28.Text = "Any";
v28.LayoutOrder = -1;
v28.Parent = l_List_1;
l_Region_0.Activated:Connect(function() --[[ Line: 76 ]]
    -- upvalues: l_List_1 (copy)
    l_List_1.Visible = not l_List_1.Visible;
end);
l_SearchBox_0:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 80 ]]
    -- upvalues: v26 (copy)
    v26();
end);
l_CanCapture_0.MouseButton1Click:Connect(function() --[[ Line: 84 ]]
    -- upvalues: l_UIUtils_0 (copy), v20 (ref), l_CanCapture_0 (copy), v26 (copy)
    l_UIUtils_0.ButtonEffect();
    v20 = not v20;
    l_CanCapture_0.Text = v20 and "X" or "";
    v26();
end);
l_Refresh_0.MouseButton1Click:Connect(function() --[[ Line: 94 ]]
    -- upvalues: l_UIUtils_0 (copy), l_ServerListRemote_0 (copy)
    l_UIUtils_0.ButtonEffect();
    _G.displayMessage("Refreshing...");
    l_ServerListRemote_0:InvokeServer({
        Method = "Refresh"
    });
    _G.displayMessage("<Color=Green>Refreshed!");
end);
local v29 = {};
local v30 = false;
l_ServerListRemote_0.OnClientInvoke = function(v31) --[[ Line: 104 ]]
    -- upvalues: v30 (ref), v29 (copy), l_List_0 (copy), l_ServerListRemote_0 (copy), l_LocalPlayer_0 (copy), v17 (copy), v19 (copy), l_List_1 (copy), l_ListedServers_0 (copy), v28 (copy), v26 (copy)
    if v30 == true then
        return;
    else
        v30 = true;
        local l_ServerInfo_0 = v31.ServerInfo;
        local l_Listings_0 = v31.Listings;
        local v34 = {};
        local v35 = 0;
        local v36 = {};
        for _, v38 in pairs(l_Listings_0) do
            v35 = v35 + 1;
            local l_key_0 = v38.key;
            local l_value_0 = v38.value;
            local v41 = nil;
            if v29[l_key_0] == nil then
                v41 = script.ServerFrameTemplate:Clone();
                v41.Name = l_value_0.ServerName .. l_value_0.Region .. (l_value_0.CanCaptureIslands and " \240\159\143\180\226\128\141" or "");
                v41.Parent = l_List_0;
                v41:SetAttribute("CanCaptureIslands", l_value_0.CanCaptureIslands or false);
                local l_Join_0 = v41.Join;
                if l_value_0.JobId == l_ServerInfo_0.JobId then
                    v41.LayoutOrder = -1;
                    l_Join_0.Visible = false;
                end;
                l_Join_0.MouseButton1Click:Connect(function() --[[ Line: 139 ]]
                    -- upvalues: l_ServerListRemote_0 (ref), l_value_0 (copy)
                    l_ServerListRemote_0:InvokeServer({
                        Method = "Teleport", 
                        JobId = l_value_0.JobId, 
                        PlaceId = l_value_0.PlaceId
                    });
                end);
                v29[l_key_0] = v41;
                v34[l_key_0] = v38;
            elseif v29[l_key_0] ~= nil then
                v41 = v29[l_key_0];
                v34[l_key_0] = v38;
            end;
            do
                local l_v41_0 = v41;
                if l_v41_0 ~= nil then
                    l_v41_0:SetAttribute("CanCaptureIslands", l_value_0.CanCaptureIslands or false);
                    local l_Info_0 = l_v41_0.Info;
                    local l_ServerName_0 = l_v41_0.ServerName;
                    local v46 = false;
                    if l_value_0.JobId == l_ServerInfo_0.JobId then
                        l_ServerName_0.Text = "[CURRENT SERVER] ";
                        l_v41_0.LayoutOrder = -1000;
                        v46 = true;
                    else
                        l_ServerName_0.Text = "";
                    end;
                    l_ServerName_0.Text = l_ServerName_0.Text .. l_value_0.ServerName .. (l_value_0.CanCaptureIslands and " \240\159\143\180\226\128\141" or "");
                    local v47 = os.time() - l_value_0.ServerStartTime or 0;
                    local v48 = math.floor(v47 % 60);
                    local v49 = math.floor(v47 / 60 % 60);
                    local v50 = math.floor(v47 / 3600 % 24);
                    local v51 = math.floor(v47 / 86400);
                    local v52 = "";
                    v52 = if v51 > 0 then string.format("%d days %.2d:%.2d:%.2d", v51, v50, v49, v48) else string.format("%.2d:%.2d:%.2d", v50, v49, v48);
                    l_Info_0.Text = ("Region: <font color=\"rgb(177,167,255)\">%s</font> Players: <font color=\"rgb(255,176,0)\">%s/%s</font> <font color=\"rgb(255,176,0)\">%s</font> Age: <font color=\"rgb(255,176,0)\">%s</font>"):format(l_value_0.Region, l_value_0.TotalPlayers, l_value_0.MaxPlayers, l_value_0.Version or "???", v52);
                    l_v41_0:SetAttribute("Region", l_value_0.Region);
                    l_v41_0.LayoutOrder = l_v41_0.LayoutOrder - l_value_0.TotalPlayers;
                    if v36[l_value_0.Region] == nil then
                        v36[l_value_0.Region] = 0;
                    end;
                    local l_Region_1 = l_value_0.Region;
                    v36[l_Region_1] = v36[l_Region_1] + 1;
                    l_Region_1 = l_value_0.UserIds;
                    do
                        local l_v46_0 = v46;
                        task.spawn(function() --[[ Line: 208 ]]
                            -- upvalues: l_Region_1 (copy), l_LocalPlayer_0 (ref), l_v41_0 (ref), v17 (ref), l_v46_0 (ref)
                            local v55 = {};
                            local v56 = 0;
                            for v57, v58 in pairs(l_Region_1) do
                                if v55[v58] == nil then
                                    v55[v58] = 1;
                                else
                                    v55[v58] = v55[v58] + 1;
                                end;
                                pcall(function() --[[ Line: 221 ]]
                                    -- upvalues: l_LocalPlayer_0 (ref), v57 (copy), v56 (ref), l_v41_0 (ref)
                                    if l_LocalPlayer_0:IsFriendsWith((tonumber(v57))) then
                                        v56 = v56 + 1;
                                        local l_l_v41_0_0 = l_v41_0;
                                        l_l_v41_0_0.LayoutOrder = l_l_v41_0_0.LayoutOrder - 100;
                                    end;
                                end);
                            end;
                            local _ = l_v41_0:WaitForChild("friendInfo");
                            if v56 >= 1 then
                                l_v41_0.friendInfo.Text = "+" .. v56 .. " Friends";
                            else
                                l_v41_0.friendInfo.Text = "";
                            end;
                            if v55[v17.Value] ~= nil and v17.Value ~= "" then
                                if l_v46_0 == true and v55[v17.Value] > 1 or l_v46_0 == false then
                                    local v61 = v55[v17.Value];
                                    if l_v46_0 == true then
                                        v61 = v61 - 1;
                                    end;
                                    l_v41_0.crewInfo.Text = "+" .. v61 .. " Crewmates";
                                    local l_l_v41_0_1 = l_v41_0;
                                    l_l_v41_0_1.LayoutOrder = l_l_v41_0_1.LayoutOrder - v61 * 100;
                                end;
                            else
                                l_v41_0.crewInfo.Text = "";
                            end;
                        end);
                    end;
                end;
            end;
        end;
        local v63 = table.clone(v19);
        for v64, v65 in pairs(v36) do
            if v64 ~= "Unknown, Unknown" then
                local v66 = v19[v64] or l_List_1:FindFirstChild(v64);
                if v66 == nil then
                    v66 = script.RegionTemplate:Clone();
                end;
                v66.Text = ("%* (%*)"):format(v64, v65);
                v66.Name = v64;
                v66:SetAttribute("Region", v64);
                v66.Parent = l_List_1;
                v19[v64] = v66;
                v63[v64] = nil;
            end;
        end;
        for v67, _ in pairs(v63) do
            v19[v67]:Destroy();
            v19[v67] = nil;
        end;
        for v69, v70 in pairs(v29) do
            if v34[v69] == nil then
                v70:Destroy();
                v29[v69] = nil;
            end;
        end;
        l_ListedServers_0.Text = string.format("[%s] Listed Servers: %s", l_ServerInfo_0.Sea, v35);
        v28.Text = ("Any (%*)"):format(v35);
        v26();
        v30 = false;
        return;
    end;
end;