local _ = game:GetService("TweenService");
local _ = game:GetService("MarketplaceService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("Players").LocalPlayer;
local l_Shared_0 = l_ReplicatedStorage_0.Modules.Shared;
local _ = require(l_Shared_0.CrewUtils);
return {
    Setup = function(v6, v7) --[[ Line: 14 ]] --[[ Name: Setup ]]
        local l_CrewsUI_0 = v6.CrewsUI;
        local l_Inner_0 = v6.Frame:WaitForChild("Inner");
        local l_Categories_0 = l_Inner_0:WaitForChild("Categories");
        local l_SendRequests_0 = l_Categories_0:WaitForChild("SendRequests");
        local l_TextBox_0 = l_SendRequests_0:WaitForChild("Input"):WaitForChild("TextBox");
        local l_Send_0 = l_SendRequests_0:WaitForChild("Send");
        local l_Requests_0 = l_Categories_0:WaitForChild("Requests");
        local l_Allies_0 = l_Categories_0:WaitForChild("Allies");
        local l_CategoryButtons_0 = l_Inner_0:WaitForChild("CategoryButtons");
        local l_Allies_1 = l_CategoryButtons_0:WaitForChild("Allies");
        local l_Requests_1 = l_CategoryButtons_0:WaitForChild("Requests");
        local l_SendRequests_1 = l_CategoryButtons_0:WaitForChild("SendRequests");
        local v20 = false;
        l_Send_0.MouseButton1Click:Connect(function() --[[ Line: 37 ]]
            -- upvalues: v7 (copy), v20 (ref), l_CrewsUI_0 (copy), l_TextBox_0 (copy)
            v7.UIUtils.ButtonEffect();
            if v20 == true then
                l_CrewsUI_0.Notify("Information", "Game is still processing previous action");
                return;
            else
                v20 = true;
                local v21 = l_CrewsUI_0.Notify("Information", "Attempting to send Invite to");
                local v22, v23 = l_CrewsUI_0.UIClient:GetRemote():InvokeServer({
                    Method = "SendAllyRequest", 
                    AllyCrewName = l_TextBox_0.Text
                });
                l_CrewsUI_0.RemoveNotification(v21, true);
                l_CrewsUI_0.Notify(v23 == nil and "Error" or "Success", v22);
                v20 = false;
                return;
            end;
        end);
        local v24 = nil;
        local v25 = {};
        for _, v27 in ipairs(l_Categories_0:GetChildren()) do
            v25[v27.Name] = v27;
            v27.Visible = false;
        end;
        local function _(v28) --[[ Line: 69 ]] --[[ Name: UpdateCategoryFrame ]]
            -- upvalues: v24 (ref), v25 (copy)
            if v24 then
                v24.Visible = false;
                v24 = nil;
            end;
            v25[v28.Name].Visible = true;
            v24 = v25[v28.Name];
        end;
        local function _(v30) --[[ Line: 80 ]] --[[ Name: BindCategoryButton ]]
            -- upvalues: v7 (copy), v24 (ref), v25 (copy), l_Allies_1 (copy)
            local function v32() --[[ Line: 82 ]] --[[ Name: OnButtonPressed ]]
                -- upvalues: v7 (ref), v30 (copy), v24 (ref), v25 (ref)
                v7.UIUtils.ButtonEffect();
                local l_v30_0 = v30;
                if v24 then
                    v24.Visible = false;
                    v24 = nil;
                end;
                v25[l_v30_0.Name].Visible = true;
                v24 = v25[l_v30_0.Name];
            end;
            v30.MouseButton1Click:Connect(v32);
            if v30 == l_Allies_1 then
                if v24 then
                    v24.Visible = false;
                    v24 = nil;
                end;
                v25[v30.Name].Visible = true;
                v24 = v25[v30.Name];
            end;
        end;
        local function v35() --[[ Line: 82 ]] --[[ Name: OnButtonPressed ]]
            -- upvalues: v7 (copy), l_Allies_1 (copy), v24 (ref), v25 (copy)
            v7.UIUtils.ButtonEffect();
            local l_l_Allies_1_0 = l_Allies_1;
            if v24 then
                v24.Visible = false;
                v24 = nil;
            end;
            v25[l_l_Allies_1_0.Name].Visible = true;
            v24 = v25[l_l_Allies_1_0.Name];
        end;
        l_Allies_1.MouseButton1Click:Connect(v35);
        if l_Allies_1 == l_Allies_1 then
            if v24 then
                v24.Visible = false;
                v24 = nil;
            end;
            v25[l_Allies_1.Name].Visible = true;
            v24 = v25[l_Allies_1.Name];
        end;
        v35 = function() --[[ Line: 82 ]] --[[ Name: OnButtonPressed ]]
            -- upvalues: v7 (copy), l_Requests_1 (copy), v24 (ref), v25 (copy)
            v7.UIUtils.ButtonEffect();
            local l_l_Requests_1_0 = l_Requests_1;
            if v24 then
                v24.Visible = false;
                v24 = nil;
            end;
            v25[l_l_Requests_1_0.Name].Visible = true;
            v24 = v25[l_l_Requests_1_0.Name];
        end;
        l_Requests_1.MouseButton1Click:Connect(v35);
        if l_Requests_1 == l_Allies_1 then
            if v24 then
                v24.Visible = false;
                v24 = nil;
            end;
            v25[l_Requests_1.Name].Visible = true;
            v24 = v25[l_Requests_1.Name];
        end;
        v35 = function() --[[ Line: 82 ]] --[[ Name: OnButtonPressed ]]
            -- upvalues: v7 (copy), l_SendRequests_1 (copy), v24 (ref), v25 (copy)
            v7.UIUtils.ButtonEffect();
            local l_l_SendRequests_1_0 = l_SendRequests_1;
            if v24 then
                v24.Visible = false;
                v24 = nil;
            end;
            v25[l_l_SendRequests_1_0.Name].Visible = true;
            v24 = v25[l_l_SendRequests_1_0.Name];
        end;
        l_SendRequests_1.MouseButton1Click:Connect(v35);
        if l_SendRequests_1 == l_Allies_1 then
            if v24 then
                v24.Visible = false;
                v24 = nil;
            end;
            v25[l_SendRequests_1.Name].Visible = true;
            v24 = v25[l_SendRequests_1.Name];
        end;
        v35 = {};
        v6.RefreshAllyList = function(_, v39) --[[ Line: 98 ]] --[[ Name: RefreshAllyList ]]
            -- upvalues: l_Allies_0 (copy), v35 (copy), l_CrewsUI_0 (copy)
            local l_Allies_2 = v39.Allies;
            for v41, _ in pairs(l_Allies_2) do
                if not l_Allies_0:FindFirstChild(v41) then
                    local v43 = script.AllyTemplate:Clone();
                    v43.Name = v41;
                    v43.Parent = l_Allies_0;
                    v35[v41] = v43;
                    local l_Info_0 = v43.Info;
                    l_Info_0.CrewName.Text = v41;
                    local v45 = false;
                    local v46 = false;
                    do
                        local l_v45_0, l_v46_0 = v45, v46;
                        l_Info_0.Revoke.MouseButton1Click:Connect(function() --[[ Line: 114 ]]
                            -- upvalues: l_v46_0 (ref), l_v45_0 (ref), l_Info_0 (copy), v43 (copy), l_CrewsUI_0 (ref), v41 (copy)
                            if l_v46_0 == true then
                                return;
                            elseif l_v45_0 == false then
                                l_v45_0 = true;
                                l_Info_0.Revoke.Text = "Press again to confirm remove";
                                task.delay(2.5, function() --[[ Line: 120 ]]
                                    -- upvalues: v43 (ref), l_Info_0 (ref), l_v45_0 (ref)
                                    if v43.Parent ~= nil then
                                        l_Info_0.Revoke.Text = "Remove";
                                        l_v45_0 = false;
                                    end;
                                end);
                                return;
                            else
                                if l_v45_0 == true then
                                    l_v46_0 = true;
                                    local v49 = l_CrewsUI_0.Notify("Information", "Removing ally...");
                                    local v50, v51 = l_CrewsUI_0.UIClient:GetRemote():InvokeServer({
                                        Method = "RemoveAlly", 
                                        AllyCrewName = v41
                                    });
                                    l_v46_0 = false;
                                    l_CrewsUI_0.RemoveNotification(v49, true);
                                    l_CrewsUI_0.Notify(v51 == nil and "Error" or "Success", v50);
                                end;
                                return;
                            end;
                        end);
                    end;
                end;
            end;
            for v52, v53 in pairs(v35) do
                if l_Allies_2[v52] == nil then
                    v53:Destroy();
                    v35[v52] = nil;
                end;
            end;
        end;
        v6.ReceiveAllyRequest = function(_, v55) --[[ Line: 153 ]] --[[ Name: ReceiveAllyRequest ]]
            -- upvalues: l_Requests_0 (copy), l_CrewsUI_0 (copy)
            local l_AllyCrewName_0 = v55.AllyCrewName;
            local l_AllyCrewImage_0 = v55.AllyCrewImage;
            if not l_Requests_0:FindFirstChild(l_AllyCrewName_0) then
                local v58 = script.AllyRequestTemplate:Clone();
                v58.Name = l_AllyCrewName_0;
                v58.Parent = l_Requests_0;
                local l_Main_0 = v58.Main;
                l_Main_0.CrewName.Text = l_AllyCrewName_0;
                l_Main_0.Logo.Image = l_AllyCrewImage_0 and "https://www.roblox.com/asset-thumbnail/image?assetId=" .. l_AllyCrewImage_0 .. "&width=420&height=420&format=png";
                local v60 = false;
                do
                    local l_v60_0 = v60;
                    l_Main_0.Accept.MouseButton1Click:Connect(function() --[[ Line: 170 ]]
                        -- upvalues: l_v60_0 (ref), l_CrewsUI_0 (ref), l_AllyCrewName_0 (copy), v58 (copy)
                        if l_v60_0 == true then
                            return;
                        else
                            l_v60_0 = true;
                            local v62 = l_CrewsUI_0.Notify("Information", "Declining ally request");
                            local v63, v64 = l_CrewsUI_0.UIClient:GetRemote():InvokeServer({
                                Method = "AcceptAllyRequest", 
                                AllyCrewName = l_AllyCrewName_0
                            });
                            l_v60_0 = false;
                            l_CrewsUI_0.RemoveNotification(v62, true);
                            l_CrewsUI_0.Notify(v64 == nil and "Error" or "Success", v63);
                            if v64 then
                                v58:Destroy();
                            end;
                            return;
                        end;
                    end);
                    l_Main_0.Ignore.MouseButton1Click:Connect(function() --[[ Line: 191 ]]
                        -- upvalues: l_v60_0 (ref), l_CrewsUI_0 (ref), l_AllyCrewName_0 (copy), v58 (copy)
                        if l_v60_0 == true then
                            return;
                        else
                            l_v60_0 = true;
                            local v65 = l_CrewsUI_0.Notify("Information", "Declining ally request");
                            local v66, v67 = l_CrewsUI_0.UIClient:GetRemote():InvokeServer({
                                Method = "DeclineAllyRequest", 
                                AllyCrewName = l_AllyCrewName_0
                            });
                            l_v60_0 = false;
                            l_CrewsUI_0.RemoveNotification(v65, true);
                            l_CrewsUI_0.Notify(v67 == nil and "Error" or "Success", v66);
                            if v67 then
                                v58:Destroy();
                            end;
                            return;
                        end;
                    end);
                end;
            end;
        end;
    end
};