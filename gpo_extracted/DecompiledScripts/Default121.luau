local l_TweenService_0 = game:GetService("TweenService");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_Shared_0 = l_ReplicatedStorage_0.Modules.Shared;
local v5 = require(l_Shared_0.CrewUtils);
local v6 = require(l_Shared_0.Marketplace.Products);
local v7 = {};
local v8 = {};
GetNameFromUserId = function(v9) --[[ Line: 15 ]] --[[ Name: GetNameFromUserId ]]
    -- upvalues: v8 (copy), l_Players_0 (copy)
    local l_UserId_0 = v9.UserId;
    if l_UserId_0 == nil then
        return nil;
    elseif typeof(l_UserId_0) ~= "number" then
        return nil;
    else
        local v11 = v8[l_UserId_0];
        if v11 then
            return v11;
        else
            local v12 = nil;
            local l_status_0, _ = pcall(function() --[[ Line: 27 ]]
                -- upvalues: v12 (ref), l_Players_0 (ref), l_UserId_0 (copy)
                v12 = l_Players_0:GetNameFromUserIdAsync(l_UserId_0);
            end);
            if l_status_0 then
                v8[l_UserId_0] = v12;
            end;
            return v12;
        end;
    end;
end;
v7.Setup = function(v15, v16) --[[ Line: 38 ]] --[[ Name: Setup ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), l_Players_0 (copy), l_MarketplaceService_0 (copy), v6 (copy), v5 (copy), l_TweenService_0 (copy)
    local l_CrewsUI_0 = v15.CrewsUI;
    local l_Frame_0 = v15.Frame;
    local l_Crew_0 = l_Frame_0:WaitForChild("Crew");
    local l_View_0 = l_Crew_0:WaitForChild("View");
    local l_Info_0 = l_View_0:WaitForChild("Info");
    local l_Members_0 = l_View_0:WaitForChild("Members");
    local l_RankSelection_0 = l_Members_0:WaitForChild("RankSelection");
    local l_AvailableRanks_0 = l_RankSelection_0:WaitForChild("AvailableRanks");
    local l_RankListButton_0 = l_RankSelection_0:WaitForChild("RankListButton");
    local l_CurrentRank_0 = l_RankSelection_0:WaitForChild("CurrentRank");
    local v27 = nil;
    local l_Configure_0 = l_Crew_0:WaitForChild("Configure");
    local l_Info_1 = l_Configure_0:WaitForChild("Info");
    local l_Pages_0 = l_Configure_0:WaitForChild("Pages");
    local l_Options_0 = l_Pages_0:WaitForChild("Options");
    local l_Tabs_0 = l_Pages_0:WaitForChild("Tabs");
    local l_ConfigureButton_0 = l_Crew_0:WaitForChild("ConfigureButton");
    local l_NoCrew_0 = l_Frame_0:WaitForChild("NoCrew");
    local l_TextBox_0 = l_NoCrew_0:WaitForChild("Input"):WaitForChild("TextBox");
    local l_Create_0 = l_NoCrew_0:WaitForChild("Create");
    local l_CreateWithRobux_0 = l_NoCrew_0:WaitForChild("CreateWithRobux");
    local l_Tokens_0 = l_CreateWithRobux_0:WaitForChild("Tokens");
    local v39 = {};
    local v40 = {};
    local _ = os.clock();
    local v42 = false;
    l_Create_0.MouseButton1Click:Connect(function() --[[ Line: 78 ]]
        -- upvalues: v16 (copy), l_TextBox_0 (copy), l_CrewsUI_0 (copy), v42 (ref), l_Create_0 (copy), l_CreateWithRobux_0 (copy)
        v16.UIUtils.ButtonEffect();
        local v43 = l_TextBox_0.Text or "";
        if v43 == "" then
            l_CrewsUI_0.Notify("Error", "Invalid Input (Empty)");
            return;
        else
            local v44 = v43:len();
            if v44 > 20 then
                l_CrewsUI_0.Notify("Error", "Invalid Input (Too many Characters - 20 Max)");
                return;
            elseif v44 < 3 then
                l_CrewsUI_0.Notify("Error", "Invalid Input (Too little Characters - 3 Min)");
                return;
            elseif v42 == true then
                l_CrewsUI_0.Notify("Error", "Wait for previous action to finish");
                return;
            else
                v42 = true;
                l_Create_0.Visible = false;
                l_CreateWithRobux_0.Visible = false;
                task.delay(10, function() --[[ Line: 112 ]]
                    -- upvalues: l_Create_0 (ref), l_CreateWithRobux_0 (ref)
                    l_Create_0.Visible = true;
                    l_CreateWithRobux_0.Visible = true;
                end);
                local v45 = l_CrewsUI_0.Notify("Information", "Creating Crew");
                local v46, v47 = l_CrewsUI_0.UIClient:GetRemote():InvokeServer({
                    Method = "CreateCrew", 
                    CrewName = l_TextBox_0.Text
                });
                l_CrewsUI_0.RemoveNotification(v45, true);
                print("success", v47);
                print("msg", v46);
                if v46 then
                    l_CrewsUI_0.Notify(v47 == nil and "Error" or "Success", v46);
                end;
                l_Create_0.Visible = true;
                l_CreateWithRobux_0.Visible = true;
                v42 = false;
                return;
            end;
        end;
    end);
    task.spawn(function() --[[ Line: 136 ]]
        -- upvalues: l_ReplicatedStorage_0 (ref), l_Players_0 (ref), l_CrewsUI_0 (copy), l_Tokens_0 (copy)
        local v48 = l_ReplicatedStorage_0:WaitForChild("Stats" .. l_Players_0.LocalPlayer.Name);
        if not v48 then
            l_CrewsUI_0.Notify("Information", "Data not loaded yet!");
            return;
        else
            local l_Stats_0 = v48:WaitForChild("Stats");
            if not l_Stats_0 then
                l_CrewsUI_0.Notify("Information", "Stats data not loaded yet!");
                return;
            else
                local l_CrewToken_0 = l_Stats_0:WaitForChild("CrewToken");
                if not l_CrewToken_0 then
                    l_CrewsUI_0.Notify("Information", "Crew token data not loaded yet!");
                    return;
                else
                    l_Tokens_0.Text = "Crew Tokens: " .. l_CrewToken_0.Value;
                    l_CrewToken_0:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 157 ]]
                        -- upvalues: l_Tokens_0 (ref), l_CrewToken_0 (copy)
                        l_Tokens_0.Text = "Crew Tokens: " .. l_CrewToken_0.Value;
                    end);
                    return;
                end;
            end;
        end;
    end);
    l_CreateWithRobux_0.MouseButton1Click:Connect(function() --[[ Line: 162 ]]
        -- upvalues: v16 (copy), l_ReplicatedStorage_0 (ref), l_Players_0 (ref), l_CrewsUI_0 (copy), l_MarketplaceService_0 (ref), v6 (ref), l_TextBox_0 (copy), v42 (ref), l_Create_0 (copy), l_CreateWithRobux_0 (copy)
        v16.UIUtils.ButtonEffect();
        local l_l_ReplicatedStorage_0_FirstChild_0 = l_ReplicatedStorage_0:FindFirstChild("Stats" .. l_Players_0.LocalPlayer.Name);
        if not l_l_ReplicatedStorage_0_FirstChild_0 then
            l_CrewsUI_0.Notify("Information", "Data not loaded yet!");
            return;
        else
            local l_Stats_1 = l_l_ReplicatedStorage_0_FirstChild_0:FindFirstChild("Stats");
            if not l_Stats_1 then
                l_CrewsUI_0.Notify("Information", "Stats data not loaded yet!");
                return;
            else
                local l_CrewToken_1 = l_Stats_1:FindFirstChild("CrewToken");
                if not l_CrewToken_1 then
                    l_CrewsUI_0.Notify("Information", "Crew token data not loaded yet!");
                    return;
                elseif l_CrewToken_1.Value == 0 then
                    l_MarketplaceService_0:PromptProductPurchase(l_Players_0.LocalPlayer, v6:GetProductIdByPlace("Create Crew"));
                    return;
                else
                    local v54 = l_TextBox_0.Text or "";
                    if v54 == "" then
                        l_CrewsUI_0.Notify("Error", "Invalid Input (Empty)");
                        return;
                    else
                        local v55 = v54:len();
                        if v55 > 20 then
                            l_CrewsUI_0.Notify("Error", "Invalid Input (Too many Characters - 20 Max)");
                            return;
                        elseif v55 < 3 then
                            l_CrewsUI_0.Notify("Error", "Invalid Input (Too little Characters - 3 Min)");
                            return;
                        elseif v42 == true then
                            l_CrewsUI_0.Notify("Error", "Wait for previous action to finish");
                            return;
                        else
                            v42 = true;
                            l_Create_0.Visible = false;
                            l_CreateWithRobux_0.Visible = false;
                            task.delay(10, function() --[[ Line: 219 ]]
                                -- upvalues: l_Create_0 (ref), l_CreateWithRobux_0 (ref)
                                l_Create_0.Visible = true;
                                l_CreateWithRobux_0.Visible = true;
                            end);
                            local v56 = l_CrewsUI_0.Notify("Information", "Creating Crew");
                            local v57, v58 = l_CrewsUI_0.UIClient:GetRemote():InvokeServer({
                                Method = "CreateCrew", 
                                CrewName = l_TextBox_0.Text, 
                                WithRobux = true
                            });
                            l_CrewsUI_0.RemoveNotification(v56, true);
                            print("success", v58);
                            print("msg", v57);
                            if v58 and v57 then
                                l_CrewsUI_0.Notify(v58 == nil and "Error" or "Success", v57);
                            end;
                            l_Create_0.Visible = true;
                            l_CreateWithRobux_0.Visible = true;
                            v42 = false;
                            return;
                        end;
                    end;
                end;
            end;
        end;
    end);
    v15.AddMember = function(_, _, _) --[[ Line: 246 ]] --[[ Name: AddMember ]]
        print("todo remove method");
    end;
    v15.RemoveMember = function(_, _) --[[ Line: 265 ]] --[[ Name: RemoveMember ]]
        print("todo remove method");
    end;
    v15.RemoveAllMembers = function(_) --[[ Line: 273 ]] --[[ Name: RemoveAllMembers ]]
        print("todo remove method");
    end;
    l_RankListButton_0.MouseButton1Click:Connect(function() --[[ Line: 281 ]]
        -- upvalues: v16 (copy), l_AvailableRanks_0 (copy)
        v16.UIUtils.ButtonEffect();
        l_AvailableRanks_0.Visible = not l_AvailableRanks_0.Visible;
        if l_AvailableRanks_0.Visible == true then
            l_AvailableRanks_0.Parent.Arrow.Rotation = 180;
            return;
        else
            l_AvailableRanks_0.Parent.Arrow.Rotation = 0;
            return;
        end;
    end);
    local v65 = {};
    v15.UpdateViewInfo = function(_, v67, v68, v69) --[[ Line: 307 ]] --[[ Name: UpdateViewInfo ]]
        -- upvalues: v65 (copy), l_Info_0 (copy)
        if v65[v67] ~= nil then
            v65[v67][v68] = v69;
            return;
        else
            local l_l_Info_0_FirstChild_0 = l_Info_0:FindFirstChild(v67);
            if l_l_Info_0_FirstChild_0 then
                v65[v67] = l_l_Info_0_FirstChild_0;
                v65[v67][v68] = v69;
            end;
            return;
        end;
    end;
    v15.UpdateConfigureInfo = function(_, v72, v73, v74) --[[ Line: 320 ]] --[[ Name: UpdateConfigureInfo ]]
        -- upvalues: v65 (copy), l_Info_1 (copy)
        if v65[v72] ~= nil then
            v65[v72][v73] = v74;
            return;
        else
            local l_l_Info_1_FirstChild_0 = l_Info_1:FindFirstChild(v72);
            if l_l_Info_1_FirstChild_0 then
                v65[v72] = l_l_Info_1_FirstChild_0;
                v65[v72][v73] = v74;
                return;
            else
                print("Missing UIObject", l_l_Info_1_FirstChild_0);
                return;
            end;
        end;
    end;
    local v76 = nil;
    v15.UpdateCachedData = function(_, v78) --[[ Line: 338 ]] --[[ Name: UpdateCachedData ]]
        -- upvalues: v76 (ref), l_Info_0 (copy), v5 (ref)
        warn(v76);
        if v78.ConquestPoints then
            l_Info_0.ConquestPoints.Cache.Text = ("(%s)"):format(v78.ConquestPoints);
        else
            l_Info_0.ConquestPoints.Cache.Text = "";
        end;
        if v78.Infamy then
            l_Info_0.Infamy.Cache.Text = ("(%s)"):format(v78.Infamy);
        else
            l_Info_0.Infamy.Cache.Text = "";
        end;
        if v78.MemberContribution then
            local v79 = os.date("!*t");
            local v80 = v79.month .. "_" .. v79.year;
            for v81, v82 in pairs(v78.MemberContribution) do
                local v83 = v5.GetRankInCrewById(v81, v76);
                if v83 then
                    local v84 = v76.Members[v83][v81];
                    if v84 ~= nil and v84.Infamy ~= nil and v84.Infamy[v80] ~= nil and v84.Gain ~= nil and v84.Lost ~= nil then
                        if v82 > 0 then
                            v84.Gain = v84.Gain + v82;
                        else
                            v84.Lost = v84.Lost - math.abs(v82);
                        end;
                    end;
                end;
            end;
        end;
    end;
    local v85 = {};
    local l_Logo_0 = l_Tabs_0:WaitForChild("Logo");
    local l_LogoImage_0 = l_Logo_0:WaitForChild("LogoImage");
    local l_Update_0 = l_Logo_0:WaitForChild("Update");
    local l_TextBox_1 = l_Logo_0:WaitForChild("Input"):WaitForChild("TextBox");
    v85.Logo = l_Logo_0;
    l_TextBox_1:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 389 ]]
        -- upvalues: l_TextBox_1 (copy)
        l_TextBox_1.Text = l_TextBox_1.Text:gsub("%D+", "");
    end);
    l_Update_0.MouseButton1Click:Connect(function() --[[ Line: 393 ]]
        -- upvalues: v16 (copy), l_TextBox_1 (copy), l_CrewsUI_0 (copy), v5 (ref)
        v16.UIUtils.ButtonEffect();
        local v90 = l_TextBox_1.Text or "";
        if v90 == "" then
            l_CrewsUI_0.Notify("Error", "Invalid Input (Empty)");
            return;
        else
            local l_LastestData_0 = l_CrewsUI_0.UIClient:GetLastestData();
            if l_LastestData_0 == nil then
                l_CrewsUI_0.Notify("Error", "Please wait for crew data to load first");
                return;
            elseif tonumber(v90) == l_LastestData_0.CrewImage then
                l_CrewsUI_0.Notify("Error", "Inputted crew image is the same as the current image");
                return;
            else
                local v92, v93 = v5.IsImageIdValid((tonumber(v90)));
                if v92 == false then
                    l_CrewsUI_0.Notify("Error", v93 or "Invalid Image Id");
                    return;
                else
                    local v94 = l_CrewsUI_0.Notify("Information", "Updating Crew Image");
                    local v95, v96 = l_CrewsUI_0.UIClient:GetRemote():InvokeServer({
                        Method = "UpdateCrewLogo", 
                        CrewImage = v90
                    });
                    l_CrewsUI_0.RemoveNotification(v94, true);
                    l_CrewsUI_0.Notify(v96 == nil and "Error" or "Success", v95);
                    return;
                end;
            end;
        end;
    end);
    v15.UpdateLogoImage = function(_, v98) --[[ Line: 432 ]] --[[ Name: UpdateLogoImage ]]
        -- upvalues: l_LogoImage_0 (copy)
        l_LogoImage_0.Image = v98;
    end;
    local l_MemberTemplateButton_0 = script:WaitForChild("MemberTemplateButton");
    local l_Members_1 = l_Tabs_0:WaitForChild("Members");
    local l_List_0 = l_Members_1:WaitForChild("List");
    local l_ConfigureMember_0 = l_Members_1:WaitForChild("ConfigureMember");
    local l_Close_0 = l_ConfigureMember_0:WaitForChild("Close");
    local l_MemberInfo_0 = l_ConfigureMember_0:WaitForChild("MemberInfo");
    local l_Kick_0 = l_MemberInfo_0:WaitForChild("Kick");
    local l_Confirmation_0 = l_MemberInfo_0:WaitForChild("Confirmation");
    local l_TextBox_2 = l_Members_1:WaitForChild("Search"):WaitForChild("TextBox");
    local v108 = false;
    local v109 = nil;
    l_Kick_0.MouseButton1Click:Connect(function() --[[ Line: 452 ]]
        -- upvalues: v16 (copy), v108 (ref), v109 (ref), l_Confirmation_0 (copy), l_CrewsUI_0 (copy), l_ConfigureMember_0 (copy)
        v16.UIUtils.ButtonEffect();
        if v108 == true then
            return;
        elseif v109 == nil then
            return;
        elseif l_Confirmation_0.Visible == true then
            v108 = true;
            local v110 = l_CrewsUI_0.Notify("Information", "Kicking player...");
            local v111, v112 = l_CrewsUI_0.UIClient:GetRemote():InvokeServer({
                Method = "KickMember", 
                UserIdToKick = v109
            });
            l_CrewsUI_0.RemoveNotification(v110, true);
            l_CrewsUI_0.Notify(v112 == nil and "Error" or "Success", v111);
            if v112 then
                l_ConfigureMember_0.Visible = false;
                v109 = nil;
            end;
            v108 = false;
            l_Confirmation_0.Visible = false;
            return;
        else
            l_Confirmation_0.Visible = true;
            return;
        end;
    end);
    l_Close_0.MouseButton1Click:Connect(function() --[[ Line: 482 ]]
        -- upvalues: v16 (copy), l_ConfigureMember_0 (copy), v109 (ref)
        v16.UIUtils.ButtonEffect();
        l_ConfigureMember_0.Visible = false;
        v109 = nil;
    end);
    local l_RankSelection_1 = l_MemberInfo_0:WaitForChild("RankSelection");
    local l_AvailableRanks_1 = l_RankSelection_1:WaitForChild("AvailableRanks");
    local l_RankListButton_1 = l_RankSelection_1:WaitForChild("RankListButton");
    local l_Infamy_0 = l_MemberInfo_0:WaitForChild("Infamy");
    l_RankListButton_1.MouseButton1Click:Connect(function() --[[ Line: 495 ]]
        -- upvalues: v16 (copy), l_AvailableRanks_1 (copy)
        v16.UIUtils.ButtonEffect();
        l_AvailableRanks_1.Visible = not l_AvailableRanks_1.Visible;
    end);
    local function v124(v117, v118) --[[ Line: 500 ]] --[[ Name: UpdateConfigureMemberFrame ]]
        -- upvalues: l_ConfigureMember_0 (copy), v109 (ref), v5 (ref), v76 (ref), l_MemberInfo_0 (copy), l_RankSelection_1 (copy), l_Infamy_0 (copy)
        l_ConfigureMember_0.Visible = true;
        v109 = v117;
        local v119, v120 = v5.GetRankInCrewById(tostring(v117), v76 or {});
        l_MemberInfo_0.DisplayName.Text = v118;
        l_MemberInfo_0.Portrait.Image = ("rbxthumb://type=AvatarHeadShot&id=%*&w=420&h=420"):format(v117);
        l_RankSelection_1.CurrentRank.Text = v119 or "Unknown";
        if v120 then
            local v121 = os.date("!*t");
            local v122 = v121.month .. "_" .. v121.year;
            if v120.Infamy then
                local v123 = v120.Infamy[v122];
                if v123 then
                    l_Infamy_0.Text = ("Gained: %s | Lost: %s"):format(v123.Gain, v123.Lost);
                    return;
                else
                    l_Infamy_0.Text = "";
                    return;
                end;
            else
                l_Infamy_0.Text = "";
                return;
            end;
        else
            l_Infamy_0.Text = "";
            return;
        end;
    end;
    local v125 = {};
    local l_PageOptions_0 = l_Members_0:WaitForChild("PageOptions");
    local l_Left_0 = l_PageOptions_0:WaitForChild("Left");
    local l_Right_0 = l_PageOptions_0:WaitForChild("Right");
    local l_Current_0 = l_PageOptions_0:WaitForChild("Current");
    local l_Pages_1 = l_Members_0:WaitForChild("Pages");
    local v131 = nil;
    local function _() --[[ Line: 540 ]] --[[ Name: ResetPage ]]
        -- upvalues: v131 (ref), l_Current_0 (copy)
        v131:JumpToIndex(0);
        l_Current_0.Text = "Page " .. v131.CurrentPage.LayoutOrder;
    end;
    l_Left_0.MouseButton1Click:Connect(function() --[[ Line: 545 ]]
        -- upvalues: v131 (ref), l_Current_0 (copy)
        v131:Previous();
        l_Current_0.Text = "Page " .. v131.CurrentPage.LayoutOrder;
    end);
    l_Right_0.MouseButton1Click:Connect(function() --[[ Line: 550 ]]
        -- upvalues: v131 (ref), l_Current_0 (copy)
        v131:Next();
        l_Current_0.Text = "Page " .. v131.CurrentPage.LayoutOrder;
    end);
    v15.RemoveAllViewPageObjects = function(_) --[[ Line: 555 ]] --[[ Name: RemoveAllViewPageObjects ]]
        -- upvalues: v40 (copy), v125 (copy)
        for _, v135 in pairs(v40) do
            v135:Destroy();
        end;
        for _, v137 in pairs(v125) do
            v137:Destroy();
        end;
    end;
    v15.CreateViewPageMembers = function(v138, v139) --[[ Line: 565 ]] --[[ Name: CreateViewPageMembers ]]
        -- upvalues: l_AvailableRanks_0 (copy), v40 (copy), l_Pages_1 (copy), v125 (copy), v131 (ref), l_CurrentRank_0 (copy), v27 (ref), v16 (copy), l_Current_0 (copy)
        local l_Members_2 = v139.Members;
        local l_Ranks_0 = v139.Ranks;
        v138:RemoveAllViewPageObjects();
        local _ = nil;
        for v143, v144 in pairs(l_Members_2) do
            local v145 = l_Ranks_0[v143];
            local v146 = script.ChangeRankTemplate:Clone();
            v146.Name = v143;
            v146.LayoutOrder = v145.Id;
            v146.Text = v143;
            v146.Parent = l_AvailableRanks_0;
            v40[v143] = v146;
            local v147 = script.PageTemplate:Clone();
            v147.Name = v143;
            v147.Parent = l_Pages_1;
            v147.Visible = v145.IsDefault;
            v125[v143] = v147;
            if v145.IsDefault then
                v131 = v147.UIPageLayout;
                l_CurrentRank_0.Text = v143;
                v27 = v146;
                v27.UIStroke.Enabled = true;
            end;
            local v148 = 0;
            local v149 = 0;
            local v150 = 0;
            local v151 = nil;
            do
                local l_v150_0, l_v151_0 = v150, v151;
                local function _() --[[ Line: 604 ]] --[[ Name: CreateMemberPage ]]
                    -- upvalues: l_v150_0 (ref), v147 (copy), l_v151_0 (ref)
                    l_v150_0 = l_v150_0 + 1;
                    local v154 = script.MemberPageTemplate:Clone();
                    v154.Name = l_v150_0;
                    v154.LayoutOrder = l_v150_0;
                    v154.Parent = v147;
                    l_v151_0 = v154;
                end;
                l_v150_0 = l_v150_0 + 1;
                local v156 = script.MemberPageTemplate:Clone();
                v156.Name = l_v150_0;
                v156.LayoutOrder = l_v150_0;
                v156.Parent = v147;
                l_v151_0 = v156;
                for v157, _ in pairs(v144) do
                    if v149 == 5 then
                        l_v150_0 = l_v150_0 + 1;
                        local v159 = script.MemberPageTemplate:Clone();
                        v159.Name = l_v150_0;
                        v159.LayoutOrder = l_v150_0;
                        v159.Parent = v147;
                        l_v151_0 = v159;
                        v149 = 0;
                    end;
                    local v160 = script.MemberTemplate:Clone();
                    v160.Name = v157;
                    v160.Parent = l_v151_0;
                    v160.PortraitFrame.Portrait.Image = ("rbxthumb://type=AvatarHeadShot&id=%*&w=420&h=420"):format(v157);
                    task.spawn(function() --[[ Line: 629 ]]
                        -- upvalues: v160 (copy), v157 (copy)
                        v160.NameFrame.Username.Text = GetNameFromUserId({
                            UserId = tonumber(v157)
                        }) or "Failed to load name";
                    end);
                    v148 = v148 + 1;
                    v149 = v149 + 1;
                end;
                v146.Text = v143 .. " (" .. v148 .. ")";
                v146.MouseButton1Click:Connect(function() --[[ Line: 645 ]]
                    -- upvalues: v16 (ref), v27 (ref), v146 (copy), v131 (ref), v147 (copy), l_Current_0 (ref)
                    v16.UIUtils.ButtonEffect();
                    if v27 == v146 then
                        return;
                    else
                        if v27 ~= nil then
                            v27.UIStroke.Enabled = false;
                        end;
                        v27 = v146;
                        v27.UIStroke.Enabled = true;
                        v131.Parent.Visible = false;
                        v131 = v147.UIPageLayout;
                        v147.Visible = true;
                        v131:JumpToIndex(0);
                        l_Current_0.Text = "Page " .. v131.CurrentPage.LayoutOrder;
                        return;
                    end;
                end);
            end;
        end;
    end;
    v15.CreateAvailableRanks = function(v161, v162) --[[ Line: 681 ]] --[[ Name: CreateAvailableRanks ]]
        -- upvalues: v76 (ref), v39 (copy), l_AvailableRanks_1 (copy), v16 (copy), v108 (ref), v109 (ref), l_RankSelection_1 (copy), l_CrewsUI_0 (copy)
        v76 = v162;
        local l_Ranks_1 = v162.Ranks;
        for v164, v165 in pairs(l_Ranks_1) do
            if v39[v164] == nil and v165.IsAdministrator ~= true then
                local v166 = script.ChangeRankTemplate:Clone();
                v166.Parent = l_AvailableRanks_1;
                v166.Name = v164;
                v166.LayoutOrder = v165.Id;
                v166.Text = v164;
                v166.MouseButton1Click:Connect(function() --[[ Line: 697 ]]
                    -- upvalues: v16 (ref), v108 (ref), v109 (ref), l_RankSelection_1 (ref), v164 (copy), l_CrewsUI_0 (ref), l_AvailableRanks_1 (ref)
                    v16.UIUtils.ButtonEffect();
                    if v108 == true then
                        return;
                    elseif v109 == nil then
                        return;
                    elseif l_RankSelection_1.CurrentRank.Text == v164 then
                        return;
                    else
                        v108 = true;
                        local l_v109_0 = v109;
                        local v168 = l_CrewsUI_0.Notify("Information", "Adjusting player rank...");
                        local v169, v170 = l_CrewsUI_0.UIClient:GetRemote():InvokeServer({
                            Method = "AdjustMemberRank", 
                            UserIdToAdjust = v109, 
                            NewRank = v164
                        });
                        l_CrewsUI_0.RemoveNotification(v168, true);
                        l_CrewsUI_0.Notify(v170 == nil and "Error" or "Success", v169);
                        if v170 then
                            if l_v109_0 == v109 then
                                l_RankSelection_1.CurrentRank.Text = v164;
                            end;
                            l_AvailableRanks_1.Visible = false;
                        end;
                        v108 = false;
                        return;
                    end;
                end);
                v39[v164] = v166;
            end;
        end;
        for v171, v172 in pairs(v39) do
            if l_Ranks_1[v171] == nil then
                v172:Destroy();
                v39[v171] = nil;
            end;
        end;
        v161:CreateViewPageMembers(v162);
    end;
    local v173 = {};
    l_TextBox_2:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 751 ]]
        -- upvalues: v173 (copy), l_TextBox_2 (copy)
        for _, v175 in pairs(v173) do
            v175.Visible = string.find(string.lower(v175.Name), string.lower(l_TextBox_2.Text));
        end;
    end);
    v15.AddConfigureMember = function(_, v177, v178) --[[ Line: 757 ]] --[[ Name: AddConfigureMember ]]
        -- upvalues: v173 (copy), l_MemberTemplateButton_0 (copy), l_List_0 (copy), v16 (copy), v109 (ref), l_ConfigureMember_0 (copy), v124 (copy)
        if v173[v177] ~= nil then
            return;
        else
            local v179 = l_MemberTemplateButton_0:Clone();
            v179.Parent = l_List_0;
            v179.Name = v178 .. " (" .. v177 .. ")";
            v179.Portrait.Image = ("rbxthumb://type=AvatarHeadShot&id=%*&w=420&h=420"):format(v177);
            v179.Username.Text = v178;
            v179.MouseButton1Click:Connect(function() --[[ Line: 770 ]]
                -- upvalues: v16 (ref), v109 (ref), v177 (copy), l_ConfigureMember_0 (ref), v124 (ref), v178 (copy)
                v16.UIUtils.ButtonEffect();
                if v109 == v177 then
                    l_ConfigureMember_0.Visible = false;
                    v109 = nil;
                    return;
                else
                    v124(v177, v178);
                    return;
                end;
            end);
            v173[v177] = v179;
            return;
        end;
    end;
    v15.RemoveConfigureMember = function(_, v181) --[[ Line: 783 ]] --[[ Name: RemoveConfigureMember ]]
        -- upvalues: v173 (copy)
        if v173[v181] then
            v173[v181]:Destroy();
            v173[v181] = nil;
        end;
    end;
    v15.AddMembersToConfigure = function(v182, v183) --[[ Line: 791 ]] --[[ Name: AddMembersToConfigure ]]
        -- upvalues: v173 (copy)
        for v184, v185 in pairs(v183) do
            v182:AddConfigureMember(v184, v185);
        end;
        for v186, _ in pairs(v173) do
            if v183[v186] == nil then
                v182:RemoveConfigureMember(v186);
            end;
        end;
    end;
    v15.RemoveAllConfigureMembers = function(_) --[[ Line: 803 ]] --[[ Name: RemoveAllConfigureMembers ]]
        -- upvalues: v173 (copy)
        for v189, v190 in pairs(v173) do
            v190:Destroy();
            v173[v189] = nil;
        end;
    end;
    l_Members_1:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 810 ]]
        -- upvalues: l_Members_1 (copy), l_ConfigureMember_0 (copy), v109 (ref)
        if l_Members_1.Visible == false then
            l_ConfigureMember_0.Visible = false;
            v109 = nil;
        end;
    end);
    local l_RankTemplate_0 = script:WaitForChild("RankTemplate");
    local l_Ranks_2 = l_Tabs_0:WaitForChild("Ranks");
    local l_RankList_0 = l_Ranks_2:WaitForChild("RankList");
    local l_RankInfo_0 = l_Ranks_2:WaitForChild("RankInfo");
    local l_Delete_0 = l_RankInfo_0:WaitForChild("Delete");
    local l_Members_3 = l_RankInfo_0:WaitForChild("Members");
    local l_Name_0 = l_RankInfo_0:WaitForChild("Name");
    local l_Rank_0 = l_RankInfo_0:WaitForChild("Rank");
    local l_Apply_0 = l_Name_0:WaitForChild("Apply");
    local l_Apply_1 = l_Rank_0:WaitForChild("Apply");
    local l_CanKick_0 = l_Members_3.Frame:WaitForChild("CanKick");
    local l_CanRank_0 = l_Members_3.Frame:WaitForChild("CanRank");
    local l_SpendFunds_0 = l_Members_3.Frame:WaitForChild("SpendFunds");
    local l_Create_1 = l_Ranks_2:WaitForChild("Create");
    local l_CreateBox_0 = l_Ranks_2:WaitForChild("CreateBox");
    local v206 = {};
    local v207 = nil;
    local v208 = nil;
    local function v213(v209, v210) --[[ Line: 842 ]] --[[ Name: UpdateRankInfoPage ]]
        -- upvalues: l_Name_0 (copy), l_Rank_0 (copy), l_Apply_0 (copy), l_Apply_1 (copy), l_CanKick_0 (copy), l_CanRank_0 (copy), l_SpendFunds_0 (copy), l_Delete_0 (copy)
        local v211 = v210.IsDefault and true or if v210.IsAdministrator then not v210.IsDefault and not v210.IsAdministrator and true else not v210.IsDefault and not v210.IsAdministrator and true;
        local v212 = if v210.IsDefault then if v210.IsAdministrator then not v210.IsDefault and not v210.IsAdministrator and true else not v210.IsDefault and not v210.IsAdministrator and true else if v210.IsAdministrator then not v210.IsDefault and not v210.IsAdministrator and true else not v210.IsDefault and not v210.IsAdministrator and true;
        l_Name_0.Frame.Input.PlaceholderText = not v211 and "Cant Change" or v209.Name;
        l_Name_0.Frame.Input.Text = not v211 and "Cant Change" or v209.Name;
        l_Name_0.Frame.Input.TextEditable = v211;
        l_Rank_0.Frame.Input.PlaceholderText = not v212 and "Cant Change" or v210.Id;
        l_Rank_0.Frame.Input.Text = not v212 and "Cant Change" or v210.Id;
        l_Rank_0.Frame.Input.TextEditable = v212;
        l_Apply_0.Visible = false;
        l_Apply_1.Visible = false;
        l_CanKick_0.Button.Visible = v212;
        l_CanRank_0.Button.Visible = v212;
        l_SpendFunds_0.Button.Visible = v212;
        l_CanKick_0.ValueHolder.Visible = v212;
        l_CanRank_0.ValueHolder.Visible = v212;
        l_SpendFunds_0.ValueHolder.Visible = v212;
        l_SpendFunds_0.ValueHolder.ButtonVisual.Position = v210.ManageFunds == true and UDim2.new(0.5, 0, 0.5, 0) or UDim2.new(0, 0, 0.5, 0);
        l_SpendFunds_0.ValueHolder.BackgroundColor3 = v210.ManageFunds == true and Color3.fromRGB(0, 170, 0) or Color3.fromRGB(170, 4, 12);
        l_CanKick_0.ValueHolder.ButtonVisual.Position = v210.ManageMembers == true and UDim2.new(0.5, 0, 0.5, 0) or UDim2.new(0, 0, 0.5, 0);
        l_CanKick_0.ValueHolder.BackgroundColor3 = v210.ManageMembers == true and Color3.fromRGB(0, 170, 0) or Color3.fromRGB(170, 4, 12);
        l_CanRank_0.ValueHolder.ButtonVisual.Position = v210.ManageMemberRank == true and UDim2.new(0.5, 0, 0.5, 0) or UDim2.new(0, 0, 0.5, 0);
        l_CanRank_0.ValueHolder.BackgroundColor3 = v210.ManageMemberRank == true and Color3.fromRGB(0, 170, 0) or Color3.fromRGB(170, 4, 12);
        l_Delete_0.Visible = v212;
    end;
    local v214 = false;
    local l_Input_0 = l_Name_0:WaitForChild("Frame"):WaitForChild("Input");
    l_Input_0:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 886 ]]
        -- upvalues: l_Input_0 (copy), l_Apply_0 (copy)
        l_Input_0.Text = l_Input_0.Text:sub(1, 40);
        l_Apply_0.Visible = l_Input_0.Text ~= l_Input_0.PlaceholderText;
    end);
    l_Input_0.FocusLost:Connect(function() --[[ Line: 891 ]]
        -- upvalues: l_Input_0 (copy)
        if (l_Input_0.Text or "") == "" then
            l_Input_0.Text = l_Input_0.PlaceholderText;
        end;
    end);
    l_Apply_0.MouseButton1Click:Connect(function() --[[ Line: 898 ]]
        -- upvalues: v16 (copy), v214 (ref), v208 (ref), l_Input_0 (copy), l_CrewsUI_0 (copy)
        v16.UIUtils.ButtonEffect();
        if v214 == true then
            return;
        elseif v208 == nil then
            return;
        else
            local v216 = l_Input_0.Text or "";
            if v216 == "" then
                l_CrewsUI_0.Notify("Error", "Invalid Input (Empty)");
                return;
            elseif v216 == v208.Name then
                l_CrewsUI_0.Notify("Information", "New rank name can not be the same as previous rank name!");
                return;
            else
                local v217 = v216:len();
                if v217 > 40 then
                    l_CrewsUI_0.Notify("Error", "Invalid Input (Too many Characters - 40 Max)");
                    return;
                elseif v217 < 1 then
                    l_CrewsUI_0.Notify("Error", "Invalid Input (Too little Characters - 3 Min)");
                    return;
                else
                    v214 = true;
                    local v218 = l_CrewsUI_0.Notify("Information", "Updating rank name...");
                    local v219, v220 = l_CrewsUI_0.UIClient:GetRemote():InvokeServer({
                        Method = "UpdateRankInfo", 
                        Rank = v208.Name, 
                        Action = "ChangeName", 
                        NewValue = v216
                    });
                    l_CrewsUI_0.RemoveNotification(v218, true);
                    l_CrewsUI_0.Notify(v220 == nil and "Error" or "Success", v219);
                    v214 = false;
                    return;
                end;
            end;
        end;
    end);
    local l_Input_1 = l_Rank_0:WaitForChild("Frame"):WaitForChild("Input");
    l_Apply_1.MouseButton1Click:Connect(function() --[[ Line: 947 ]]
        -- upvalues: v16 (copy), v214 (ref), v208 (ref), l_Input_1 (copy), l_CrewsUI_0 (copy), v207 (ref)
        v16.UIUtils.ButtonEffect();
        if v214 == true then
            return;
        elseif v208 == nil then
            return;
        else
            local v222 = l_Input_1.Text or "";
            if v222 == "" then
                l_CrewsUI_0.Notify("Error", "Invalid Input (Empty)");
                return;
            else
                local v223 = tonumber(v222);
                if v223 then
                    local v224 = v207[v208.Name];
                    if v224 == nil then
                        l_CrewsUI_0.Notify("Error", "Issue occured with getting ranks information!");
                        return;
                    elseif v224.Id == v223 then
                        l_CrewsUI_0.Notify("Information", "New rank Id can not be the same as previous rank Id!");
                        return;
                    else
                        v214 = true;
                        local v225 = l_CrewsUI_0.Notify("Information", "Updating rank id...");
                        local v226, v227 = l_CrewsUI_0.UIClient:GetRemote():InvokeServer({
                            Method = "UpdateRankInfo", 
                            Rank = v208.Name, 
                            Action = "ChangeRankId", 
                            NewValue = v223
                        });
                        l_CrewsUI_0.RemoveNotification(v225, true);
                        l_CrewsUI_0.Notify(v227 == nil and "Error" or "Success", v226);
                        v214 = false;
                        return;
                    end;
                else
                    l_CrewsUI_0.Notify("Error", "Invalid Input (Numbers Only)");
                    return;
                end;
            end;
        end;
    end);
    l_Input_1:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 995 ]]
        -- upvalues: l_Input_1 (copy), l_Apply_1 (copy)
        l_Input_1.Text = l_Input_1.Text:gsub("%D+", ""):sub(1, 3);
        l_Apply_1.Visible = l_Input_1.Text ~= l_Input_1.PlaceholderText;
    end);
    l_Input_1.FocusLost:Connect(function() --[[ Line: 1001 ]]
        -- upvalues: l_Input_1 (copy)
        if (l_Input_1.Text or "") == "" then
            l_Input_1.Text = l_Input_1.PlaceholderText;
        end;
    end);
    l_CanKick_0.Button.MouseButton1Click:Connect(function() --[[ Line: 1008 ]]
        -- upvalues: v16 (copy), v214 (ref), v208 (ref), l_CrewsUI_0 (copy)
        v16.UIUtils.ButtonEffect();
        if v214 == true then
            return;
        elseif v208 == nil then
            return;
        else
            v214 = true;
            local v228 = l_CrewsUI_0.Notify("Information", "Updating rank data...");
            local v229, v230 = l_CrewsUI_0.UIClient:GetRemote():InvokeServer({
                Method = "UpdateRankInfo", 
                Rank = v208.Name, 
                Action = "ManageMembers", 
                NewValue = "[ignore]"
            });
            l_CrewsUI_0.RemoveNotification(v228, true);
            l_CrewsUI_0.Notify(v230 == nil and "Error" or "Success", v229);
            v214 = false;
            return;
        end;
    end);
    l_CanRank_0.Button.MouseButton1Click:Connect(function() --[[ Line: 1030 ]]
        -- upvalues: v16 (copy), v214 (ref), v208 (ref), l_CrewsUI_0 (copy)
        v16.UIUtils.ButtonEffect();
        if v214 == true then
            return;
        elseif v208 == nil then
            return;
        else
            v214 = true;
            local v231 = l_CrewsUI_0.Notify("Information", "Updating rank data...");
            local v232, v233 = l_CrewsUI_0.UIClient:GetRemote():InvokeServer({
                Method = "UpdateRankInfo", 
                Rank = v208.Name, 
                Action = "ManageMemberRank", 
                NewValue = "[ignore]"
            });
            l_CrewsUI_0.RemoveNotification(v231, true);
            l_CrewsUI_0.Notify(v233 == nil and "Error" or "Success", v232);
            v214 = false;
            return;
        end;
    end);
    l_SpendFunds_0.Button.MouseButton1Click:Connect(function() --[[ Line: 1052 ]]
        -- upvalues: v16 (copy), v214 (ref), v208 (ref), l_CrewsUI_0 (copy)
        v16.UIUtils.ButtonEffect();
        if v214 == true then
            return;
        elseif v208 == nil then
            return;
        else
            v214 = true;
            local v234 = l_CrewsUI_0.Notify("Information", "Updating rank data...");
            local v235, v236 = l_CrewsUI_0.UIClient:GetRemote():InvokeServer({
                Method = "UpdateRankInfo", 
                Rank = v208.Name, 
                Action = "ManageFunds", 
                NewValue = "[ignore]"
            });
            l_CrewsUI_0.RemoveNotification(v234, true);
            l_CrewsUI_0.Notify(v236 == nil and "Error" or "Success", v235);
            v214 = false;
            return;
        end;
    end);
    local l_Delete_1 = l_Delete_0:WaitForChild("Delete");
    local l_TextBox_3 = l_Delete_0:WaitForChild("Confirmation"):WaitForChild("TextBox");
    l_Delete_1.MouseButton1Click:Connect(function() --[[ Line: 1078 ]]
        -- upvalues: v16 (copy), v214 (ref), l_TextBox_3 (copy), l_CrewsUI_0 (copy), v208 (ref)
        v16.UIUtils.ButtonEffect();
        if v214 == true then
            return;
        elseif l_TextBox_3.Text == "Yes" then
            v214 = true;
            local v239 = l_CrewsUI_0.Notify("Information", "Deleting rank...");
            local v240, v241 = l_CrewsUI_0.UIClient:GetRemote():InvokeServer({
                Method = "UpdateRankInfo", 
                Rank = v208.Name, 
                Action = "DeleteRank", 
                NewValue = "[Deleted Rank]"
            });
            l_CrewsUI_0.RemoveNotification(v239, true);
            l_CrewsUI_0.Notify(v241 == nil and "Error" or "Success", v240);
            if v241 then
                l_TextBox_3.Text = "";
            end;
            v214 = false;
            return;
        else
            l_CrewsUI_0.Notify("Error", "Please type \"Yes\" to confirm the action");
            return;
        end;
    end);
    l_Create_1.MouseButton1Click:Connect(function() --[[ Line: 1107 ]]
        -- upvalues: v16 (copy), l_CreateBox_0 (copy)
        v16.UIUtils.ButtonEffect();
        l_CreateBox_0.Visible = not l_CreateBox_0.Visible;
    end);
    l_CreateBox_0.Cancel.MouseButton1Click:Connect(function() --[[ Line: 1112 ]]
        -- upvalues: v16 (copy), l_CreateBox_0 (copy)
        v16.UIUtils.ButtonEffect();
        l_CreateBox_0.Visible = false;
    end);
    local l_Input_2 = l_CreateBox_0:WaitForChild("Frame"):WaitForChild("Input");
    l_Input_2:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 1119 ]]
        -- upvalues: l_Input_2 (copy)
        l_Input_2.Text = l_Input_2.Text:sub(1, 40);
    end);
    l_CreateBox_0.Create.MouseButton1Click:Connect(function() --[[ Line: 1123 ]]
        -- upvalues: v16 (copy), v214 (ref), l_Input_2 (copy), l_CrewsUI_0 (copy), v206 (copy), l_CreateBox_0 (copy)
        v16.UIUtils.ButtonEffect();
        if v214 == true then
            return;
        else
            local v243 = l_Input_2.Text or "";
            if v243 == "" then
                l_CrewsUI_0.Notify("Error", "Invalid Input (Empty)");
                return;
            elseif v206[v243] ~= nil then
                l_CrewsUI_0.Notify("Information", "A rank with the name " .. v243 .. " already exist!");
                return;
            else
                local v244 = v243:len();
                if v244 > 40 then
                    l_CrewsUI_0.Notify("Error", "Invalid Input (Too many Characters - 40 Max)");
                    return;
                elseif v244 < 1 then
                    l_CrewsUI_0.Notify("Error", "Invalid Input (Too little Characters - 3 Min)");
                    return;
                else
                    v214 = true;
                    local v245 = l_CrewsUI_0.Notify("Information", "Creating rank...");
                    local v246, v247 = l_CrewsUI_0.UIClient:GetRemote():InvokeServer({
                        Method = "UpdateRankInfo", 
                        Rank = "", 
                        Action = "CreateRank", 
                        NewValue = v243
                    });
                    l_CrewsUI_0.RemoveNotification(v245, true);
                    l_CrewsUI_0.Notify(v247 == nil and "Error" or "Success", v246);
                    if v247 then
                        l_Input_2.Text = "";
                        l_CreateBox_0.Visible = false;
                    end;
                    v214 = false;
                    return;
                end;
            end;
        end;
    end);
    local function v250(v248, v249) --[[ Line: 1176 ]] --[[ Name: SelectRankButton ]]
        -- upvalues: v208 (ref), v213 (copy)
        if v208 ~= v248 then
            if v208 ~= nil then
                v208.TextColor3 = Color3.fromRGB(214, 214, 214);
            end;
            v248.TextColor3 = Color3.fromRGB(255, 255, 255);
            v213(v248, v249);
            v208 = v248;
        end;
    end;
    v15.CreateRankButton = function(_, v252, v253) --[[ Line: 1190 ]] --[[ Name: CreateRankButton ]]
        -- upvalues: v206 (copy), l_RankTemplate_0 (copy), l_RankList_0 (copy), v16 (copy), v214 (ref), v250 (copy), v207 (ref), v208 (ref), v213 (copy)
        if v206[v252] == nil then
            local v254 = l_RankTemplate_0:Clone();
            v254.Name = v252;
            v254.Text = v252;
            v254.LayoutOrder = -v253.Id;
            v254.Parent = l_RankList_0;
            v254.MouseButton1Click:Connect(function() --[[ Line: 1200 ]]
                -- upvalues: v16 (ref), v214 (ref), v250 (ref), v254 (copy), v207 (ref), v252 (copy)
                v16.UIUtils.ButtonEffect();
                if v214 == true then
                    return;
                else
                    v250(v254, v207[v252]);
                    return;
                end;
            end);
            if v253.Id == 1 then
                v250(v254, v253);
            end;
            v206[v252] = v254;
            return;
        else
            local v255 = v206[v252];
            v255.Name = v252;
            v255.Text = v252;
            v255.LayoutOrder = -v253.Id;
            if v255 == v208 then
                v213(v255, v253);
            end;
            return;
        end;
    end;
    v15.CreateRankButtons = function(v256, v257) --[[ Line: 1224 ]] --[[ Name: CreateRankButtons ]]
        -- upvalues: v207 (ref), v206 (copy), v208 (ref), v250 (copy)
        local l_Ranks_3 = v257.Ranks;
        v207 = l_Ranks_3;
        local v259 = nil;
        local v260 = nil;
        for v261, v262 in pairs(l_Ranks_3) do
            v256:CreateRankButton(v261, v262);
            if v262.Id == 1 then
                v259 = v261;
                v260 = v262;
            end;
        end;
        for v263, v264 in pairs(v206) do
            if l_Ranks_3[v263] == nil then
                if v208 == v264 then
                    v250(v206[v259], v260);
                end;
                v264:Destroy();
                v206[v263] = nil;
            end;
        end;
    end;
    local l_Leave_0 = l_Tabs_0:WaitForChild("Leave");
    local l_TextBox_4 = l_Leave_0:WaitForChild("Confirmation"):WaitForChild("TextBox");
    local l_Button_0 = l_Leave_0:WaitForChild("Button");
    local l_Display_0 = l_Leave_0:WaitForChild("Display");
    local l_Title_0 = l_Leave_0:WaitForChild("Title");
    v15.UpdateLeaveFrameText = function(_, v271) --[[ Line: 1260 ]] --[[ Name: UpdateLeaveFrameText ]]
        -- upvalues: l_Button_0 (copy), l_Title_0 (copy), l_Display_0 (copy)
        l_Button_0.TextLabel.Text = v271 and "DISBAND" or "LEAVE";
        l_Title_0.Text = v271 and "Disband Crew" or "Leave Crew";
        l_Display_0.Text = v271 and "Are you sure you want to disband?" or "Are you sure you want to leave?";
    end;
    l_Button_0.MouseButton1Click:Connect(function() --[[ Line: 1268 ]]
        -- upvalues: v16 (copy), l_TextBox_4 (copy), l_CrewsUI_0 (copy), v15 (copy)
        v16.UIUtils.ButtonEffect();
        if l_TextBox_4.Text == "Yes" then
            local v272 = l_CrewsUI_0.Notify("Information", "Disbanding/Leaving Crew...");
            local v273, v274 = l_CrewsUI_0.UIClient:GetRemote():InvokeServer({
                Method = "LeaveCrew"
            });
            l_CrewsUI_0.RemoveNotification(v272, true);
            l_CrewsUI_0.Notify(v274 == nil and "Error" or "Success", v273);
            if v274 then
                l_TextBox_4.Text = "";
                v15:RemoveAllMembers();
                return;
            end;
        else
            l_CrewsUI_0.Notify("Error", "Please type \"Yes\" to confirm the action");
        end;
    end);
    local l_TabLine_0 = l_Options_0.Logo.TabLine;
    local v276 = nil;
    local function _(v277) --[[ Line: 1295 ]] --[[ Name: GetTab ]]
        -- upvalues: v85 (copy), l_Tabs_0 (copy)
        local v278 = v85[v277] or l_Tabs_0:WaitForChild(v277);
        if v85[v277] == nil then
            v85[v277] = v278;
        end;
        return v278;
    end;
    local function _(v280) --[[ Line: 1305 ]] --[[ Name: OpenConfigureTab ]]
        -- upvalues: v85 (copy), l_Tabs_0 (copy), v276 (ref)
        local v281 = v85[v280] or l_Tabs_0:WaitForChild(v280);
        if v85[v280] == nil then
            v85[v280] = v281;
        end;
        local l_v281_0 = v281;
        if l_v281_0 then
            if v276 then
                v276.Visible = false;
            end;
            l_v281_0.Visible = true;
            v276 = l_v281_0;
            return;
        else
            warn("Could not find tab with the name of", v280);
            return;
        end;
    end;
    for _, v285 in ipairs(l_Options_0:GetChildren()) do
        if v285:IsA("Frame") then
            local l_TextButton_0 = v285:FindFirstChildOfClass("TextButton");
            if l_TextButton_0 then
                l_TextButton_0.MouseButton1Click:Connect(function() --[[ Line: 1328 ]]
                    -- upvalues: v16 (copy), l_TabLine_0 (copy), v285 (copy), v85 (copy), l_Tabs_0 (copy), v276 (ref)
                    v16.UIUtils.ButtonEffect();
                    l_TabLine_0.Parent = v285;
                    local l_Name_1 = v285.Name;
                    local v288 = v85[l_Name_1] or l_Tabs_0:WaitForChild(l_Name_1);
                    if v85[l_Name_1] == nil then
                        v85[l_Name_1] = v288;
                    end;
                    local l_v288_0 = v288;
                    if l_v288_0 then
                        if v276 then
                            v276.Visible = false;
                        end;
                        l_v288_0.Visible = true;
                        v276 = l_v288_0;
                        return;
                    else
                        warn("Could not find tab with the name of", l_Name_1);
                        return;
                    end;
                end);
                if v285.Name == "Logo" then
                    local v290 = v85.Logo or l_Tabs_0:WaitForChild("Logo");
                    if v85.Logo == nil then
                        v85.Logo = v290;
                    end;
                    local l_v290_0 = v290;
                    if l_v290_0 then
                        if v276 then
                            v276.Visible = false;
                        end;
                        l_v290_0.Visible = true;
                        v276 = l_v290_0;
                    else
                        warn("Could not find tab with the name of", "Logo");
                    end;
                else
                    local l_Name_2 = v285.Name;
                    local v293 = v85[l_Name_2] or l_Tabs_0:WaitForChild(l_Name_2);
                    if v85[l_Name_2] == nil then
                        v85[l_Name_2] = v293;
                    end;
                    v293.Visible = false;
                end;
            else
                warn("Failed to load option button");
            end;
        end;
    end;
    l_ConfigureButton_0.MouseButton1Click:Connect(function() --[[ Line: 1345 ]]
        -- upvalues: v16 (copy), l_TweenService_0 (ref), l_ConfigureButton_0 (copy), l_View_0 (copy), l_Configure_0 (copy)
        v16.UIUtils.ButtonEffect();
        l_TweenService_0:Create(l_ConfigureButton_0, TweenInfo.new(0.2), {
            Rotation = l_ConfigureButton_0.Rotation + 180
        }):Play();
        l_View_0.Visible = not l_View_0.Visible;
        l_Configure_0.Visible = not l_View_0.Visible;
    end);
end;
return v7;