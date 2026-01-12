local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_Shared_0 = l_ReplicatedStorage_0:WaitForChild("Modules"):WaitForChild("Shared");
local l_CrewUtils_0 = require(l_Shared_0:WaitForChild("CrewUtils"));
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v5 = l_ReplicatedStorage_0:WaitForChild("CrewRemote", 300);
local v6 = {
    Captain = "<font color=\"#bdbebe\">By</font> <b>%s</b>", 
    Member = "<b>%s</b> <font color=\"#bdbebe\">Members</font>", 
    Rank = "<b>%s</b> <font color=\"#bdbebe\">Rank</font>", 
    TotalInfamy = "<font color=\"rgb(255,176,0)\">%s Infamy</font>", 
    CrewName = "<b>%s</b>", 
    ConquestPoints = "%s <b><font color=\"rgb(209, 255, 6)\">Conquest Points</font></b>", 
    Infamy = "%s <b><font color=\"rgb(255,176,0)\">Infamy</font></b> ", 
    Marine = "Faction <b><font color=\"rgb(51, 184, 255)\">Marine</font></b> ", 
    Pirate = "Faction <b><font color=\"rgb(255, 0, 0)\">Pirate</font></b>"
};
local v7 = {};
local _ = function(v8) --[[ Line: 28 ]] --[[ Name: GetUsernameFromUserId ]]
    -- upvalues: v7 (copy), l_Players_0 (copy)
    local v9 = v7[v8];
    if v9 then
        return v9;
    else
        local v10 = "";
        local l_status_0, _ = pcall(function() --[[ Line: 36 ]]
            -- upvalues: v10 (ref), l_Players_0 (ref), v8 (copy)
            v10 = l_Players_0:GetNameFromUserIdAsync(v8);
        end);
        if not l_status_0 then
            v10 = "Failed to load!";
        else
            v7[v8] = v10;
        end;
        return v10;
    end;
end;
local v15 = {
    LastestData = nil, 
    GetRemote = function(_) --[[ Line: 53 ]] --[[ Name: GetRemote ]]
        -- upvalues: v5 (copy)
        return v5;
    end
};
v15.GetLastestData = function(_) --[[ Line: 57 ]] --[[ Name: GetLastestData ]]
    -- upvalues: v15 (copy)
    return v15.LastestData;
end;
v15.Initialize = function(_, v18) --[[ Line: 61 ]] --[[ Name: Initialize ]]
    -- upvalues: l_Players_0 (copy), v15 (copy), v6 (copy), v7 (copy), l_CrewUtils_0 (copy), l_LocalPlayer_0 (copy), v5 (copy)
    local v46 = {
        ReceiveAllyRequest = function(v19) --[[ Line: 65 ]] --[[ Name: ReceiveAllyRequest ]]
            -- upvalues: v18 (copy)
            v18.Frames.Allies:ReceiveAllyRequest(v19);
        end, 
        AddMember = function(v20) --[[ Line: 71 ]] --[[ Name: AddMember ]]
            -- upvalues: v18 (copy)
            local l_Member_0 = v20.Member;
            v18.Frames.Default:AddMember(l_Member_0);
        end, 
        RemoveMember = function(v22) --[[ Line: 80 ]] --[[ Name: RemoveMember ]]
            -- upvalues: v18 (copy)
            local l_Member_1 = v22.Member;
            v18.Frames.Default:RemoveMember(l_Member_1);
        end, 
        RemoveAllMember = function() --[[ Line: 89 ]] --[[ Name: RemoveAllMember ]]
            -- upvalues: v18 (copy)
            v18.Frames.Default:RemoveAllMembers();
        end, 
        UpdateMembersList = function(v24) --[[ Line: 95 ]] --[[ Name: UpdateMembersList ]]
            -- upvalues: v18 (copy), l_Players_0 (ref)
            local l_Members_0 = v24.Members;
            local l_Default_0 = v18.Frames.Default;
            for v27, v28 in pairs(l_Members_0) do
                local l_l_Players_0_FirstChild_0 = l_Players_0:FindFirstChild(v27);
                if l_l_Players_0_FirstChild_0 then
                    l_Default_0:AddMember(l_l_Players_0_FirstChild_0, v28);
                end;
            end;
        end, 
        UpdateClientCachedData = function(v30) --[[ Line: 108 ]] --[[ Name: UpdateClientCachedData ]]
            -- upvalues: v18 (copy)
            local l_CachedData_0 = v30.CachedData;
            v18.Frames.Default:UpdateCachedData(l_CachedData_0);
        end, 
        UpdateLogoImage = function(v32) --[[ Line: 115 ]] --[[ Name: UpdateLogoImage ]]
            -- upvalues: v18 (copy), v15 (ref)
            local l_CrewData_0 = v32.CrewData;
            local l_CrewImage_0 = l_CrewData_0.CrewImage;
            local l_Default_1 = v18.Frames.Default;
            v15.LastestData = l_CrewData_0;
            l_Default_1:UpdateLogoImage(l_CrewImage_0 and "https://www.roblox.com/asset-thumbnail/image?assetId=" .. l_CrewImage_0 .. "&width=420&height=420&format=png" or "");
            l_Default_1:UpdateViewInfo("Logo", "Image", l_CrewImage_0 and "https://www.roblox.com/asset-thumbnail/image?assetId=" .. l_CrewImage_0 .. "&width=420&height=420&format=png" or "");
        end, 
        UpdateViewInfo = function(v36) --[[ Line: 138 ]] --[[ Name: UpdateViewInfo ]]
            -- upvalues: v18 (copy), v6 (ref)
            local l_UIObject_0 = v36.UIObject;
            local l_Property_0 = v36.Property;
            local l_Format_0 = v36.Format;
            local l_NewValue_0 = v36.NewValue;
            v18.Frames.Default:UpdateViewInfo(l_UIObject_0, l_Property_0, v6[l_Format_0]:format(l_NewValue_0));
        end, 
        UpdateConfigureInfo = function(v41) --[[ Line: 154 ]] --[[ Name: UpdateConfigureInfo ]]
            -- upvalues: v18 (copy), v6 (ref)
            local l_UIObject_1 = v41.UIObject;
            local l_Property_1 = v41.Property;
            local l_Format_1 = v41.Format;
            local l_NewValue_1 = v41.NewValue;
            v18.Frames.Default:UpdateConfigureInfo(l_UIObject_1, l_Property_1, v6[l_Format_1]:format(l_NewValue_1));
        end
    };
    v46.UpdateAllFrames = function(v47) --[[ Line: 170 ]] --[[ Name: UpdateAllFrames ]]
        -- upvalues: v15 (ref), v18 (copy), v6 (ref), v7 (ref), l_Players_0 (ref), l_CrewUtils_0 (ref), l_LocalPlayer_0 (ref), v46 (copy)
        local l_CrewName_0 = v47.CrewName;
        local l_CrewData_1 = v47.CrewData;
        local l_IsMarineFaction_0 = l_CrewData_1.IsMarineFaction;
        local _ = l_CrewData_1.CrewImage;
        v15.LastestData = l_CrewData_1;
        local l_Default_2 = v18.Frames.Default;
        l_Default_2:UpdateViewInfo("CrewName", "Text", v6.CrewName:format(l_CrewName_0));
        local v53 = "Captain";
        local v54 = "Text";
        local l_Captain_0 = v6.Captain;
        local l_OwnerId_0 = l_CrewData_1.OwnerId;
        local v57 = v7[l_OwnerId_0];
        local v58;
        if v57 then
            v58 = v57;
        else
            local v59 = "";
            local l_l_OwnerId_0_0 = l_OwnerId_0 --[[ copy: 13 -> 19 ]];
            do
                local l_v59_0 = v59;
                local l_status_1, _ = pcall(function() --[[ Line: 36 ]]
                    -- upvalues: l_v59_0 (ref), l_Players_0 (ref), l_l_OwnerId_0_0 (copy)
                    l_v59_0 = l_Players_0:GetNameFromUserIdAsync(l_l_OwnerId_0_0);
                end);
                if not l_status_1 then
                    l_v59_0 = "Failed to load!";
                else
                    v7[l_OwnerId_0] = l_v59_0;
                end;
                v58 = l_v59_0;
            end;
        end;
        l_Default_2:UpdateViewInfo(v53, v54, l_Captain_0:format(v58));
        l_Default_2:UpdateViewInfo("Faction", "Text", l_IsMarineFaction_0 and v6.Marine or v6.Pirate);
        l_Default_2:UpdateViewInfo("Member", "Text", v6.Member:format(l_CrewData_1.MembersCount .. "/" .. l_CrewData_1.MaxMembers));
        local v64 = l_CrewUtils_0.GetRankInCrew(l_LocalPlayer_0, l_CrewData_1);
        l_Default_2:UpdateViewInfo("Rank", "Text", v6.Rank:format(v64 or "Failed to get rank"));
        l_Default_2:UpdateViewInfo("ConquestPoints", "Text", v6.ConquestPoints:format(l_CrewData_1.ConquestPoints));
        l_Default_2:UpdateViewInfo("Infamy", "Text", v6.Infamy:format(l_CrewData_1.Infamy));
        v54 = "ConfigCaptain";
        l_Captain_0 = "Text";
        local l_Captain_1 = v6.Captain;
        v57 = l_CrewData_1.OwnerId;
        local v66 = v7[v57];
        if v66 then
            l_OwnerId_0 = v66;
        else
            local v67 = "";
            do
                local l_v67_0 = v67;
                local l_status_2, _ = pcall(function() --[[ Line: 36 ]]
                    -- upvalues: l_v67_0 (ref), l_Players_0 (ref), v57 (copy)
                    l_v67_0 = l_Players_0:GetNameFromUserIdAsync(v57);
                end);
                if not l_status_2 then
                    l_v67_0 = "Failed to load!";
                else
                    v7[v57] = l_v67_0;
                end;
                l_OwnerId_0 = l_v67_0;
            end;
        end;
        l_Default_2:UpdateConfigureInfo(v54, l_Captain_0, l_Captain_1:format(l_OwnerId_0));
        l_Default_2:UpdateConfigureInfo("Title", "Text", "Configure " .. l_CrewName_0);
        l_Default_2:UpdateLeaveFrameText(l_CrewData_1.OwnerId == l_LocalPlayer_0.UserId);
        v46.UpdateLogoImage(v47);
        v18.Frames.Contribution:UpdateList(l_CrewData_1);
        v18.Frames.Shop:UpdateShop(l_CrewData_1);
        v18.Frames.Allies:RefreshAllyList(l_CrewData_1);
    end;
    v46.UpdateCrewShop = function(v71) --[[ Line: 270 ]] --[[ Name: UpdateCrewShop ]]
        -- upvalues: v18 (copy)
        local l_CrewData_2 = v71.CrewData;
        v18.Frames.Shop:UpdateShop(l_CrewData_2);
    end;
    v46.UpdateConfigureMembersPage = function(v73) --[[ Line: 275 ]] --[[ Name: UpdateConfigureMembersPage ]]
        -- upvalues: v18 (copy)
        v18.Frames.Default:AddMembersToConfigure(v73.CrewMembers);
    end;
    v46.UpdatePermissionsPage = function(v74) --[[ Line: 280 ]] --[[ Name: UpdatePermissionsPage ]]
        -- upvalues: v18 (copy)
        local l_CrewData_3 = v74.CrewData;
        local l_Default_3 = v18.Frames.Default;
        l_Default_3:CreateRankButtons(l_CrewData_3);
        l_Default_3:CreateAvailableRanks(l_CrewData_3);
    end;
    v46.ReceiveInvite = function(v77) --[[ Line: 292 ]] --[[ Name: ReceiveInvite ]]
        -- upvalues: v18 (copy)
        v18.Frames.Invites:ReceiveInvite(v77);
    end;
    v5.OnClientInvoke = function(v78) --[[ Line: 302 ]]
        -- upvalues: v46 (copy)
        local l_Method_0 = v78.Method;
        if l_Method_0 == nil then
            warn("Missing Method Argument!");
            return;
        else
            local v80 = v46[l_Method_0];
            if v80 then
                v80(v78);
                return;
            else
                warn("Missing Method!");
                return;
            end;
        end;
    end;
    return v15;
end;
return v15;