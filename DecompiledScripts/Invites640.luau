local _ = game:GetService("TweenService");
local _ = game:GetService("MarketplaceService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Shared_0 = l_ReplicatedStorage_0.Modules.Shared;
local _ = require(l_Shared_0.CrewUtils);
return {
    Setup = function(v7, v8) --[[ Line: 14 ]] --[[ Name: Setup ]]
        -- upvalues: l_Players_0 (copy), l_LocalPlayer_0 (copy)
        local l_CrewsUI_0 = v7.CrewsUI;
        local l_Frame_0 = v7.Frame;
        local l_Invite_0 = l_Frame_0:WaitForChild("Invite");
        local l_TextBox_0 = l_Invite_0:WaitForChild("Input"):WaitForChild("TextBox");
        local l_Invite_1 = l_Invite_0:WaitForChild("Invite");
        local l_Find_0 = l_Invite_0:WaitForChild("Find");
        local v15 = "";
        local v16 = nil;
        local function v22(v17) --[[ Line: 28 ]] --[[ Name: GetPlayerNameFromText ]]
            -- upvalues: l_Players_0 (ref), l_LocalPlayer_0 (ref)
            local l_l_Players_0_FirstChild_0 = l_Players_0:FindFirstChild(v17);
            if l_l_Players_0_FirstChild_0 then
                return l_l_Players_0_FirstChild_0.Name;
            else
                local v19 = v17:len();
                for _, v21 in ipairs(l_Players_0:GetPlayers()) do
                    if v21 ~= l_LocalPlayer_0 and v21.Name:lower():sub(1, v19) == v17:lower() then
                        return v21.Name;
                    end;
                end;
                return nil;
            end;
        end;
        l_TextBox_0:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 46 ]]
            -- upvalues: l_TextBox_0 (copy), v15 (ref), v16 (ref), v22 (copy), l_Find_0 (copy)
            local l_Text_0 = l_TextBox_0.Text;
            if l_Text_0 == "" or l_Text_0 == v15 then
                return;
            else
                v16 = nil;
                local v24 = v22(l_Text_0);
                if v24 == nil then
                    l_Find_0.Text = "";
                    return;
                else
                    v16 = v24;
                    l_Find_0.Text = "Found: " .. v24;
                    l_TextBox_0.Text = v24:sub(1, l_Text_0:len());
                    v15 = v24;
                    return;
                end;
            end;
        end);
        l_TextBox_0.FocusLost:Connect(function(v25) --[[ Line: 67 ]]
            -- upvalues: v16 (ref), l_TextBox_0 (copy)
            if v16 then
                l_TextBox_0.Text = v16;
            end;
            if v25 == false then
                return;
            else
                return;
            end;
        end);
        local v26 = {};
        v7.RemoveInvite = function(_, v28) --[[ Line: 79 ]] --[[ Name: RemoveInvite ]]
            -- upvalues: v26 (copy)
            if v26[v28] ~= nil then
                v26[v28] = true;
            end;
        end;
        l_Invite_1.MouseButton1Click:Connect(function() --[[ Line: 85 ]]
            -- upvalues: v8 (copy), v16 (ref), l_Players_0 (ref), l_CrewsUI_0 (copy), v26 (copy)
            v8.UIUtils.ButtonEffect();
            if v16 == nil then
                return;
            else
                local l_l_Players_0_FirstChild_1 = l_Players_0:FindFirstChild(v16);
                if l_l_Players_0_FirstChild_1 == nil then
                    l_CrewsUI_0.Notify("Information", "Could not find player!");
                    return;
                else
                    task.spawn(function() --[[ Line: 104 ]]
                        -- upvalues: v26 (ref), l_l_Players_0_FirstChild_1 (copy), l_CrewsUI_0 (ref)
                        v26[l_l_Players_0_FirstChild_1] = true;
                        local v30 = l_CrewsUI_0.Notify("Information", "Sending Invite to" .. l_l_Players_0_FirstChild_1.Name);
                        local v31, v32 = l_CrewsUI_0.UIClient:GetRemote():InvokeServer({
                            Method = "Invite", 
                            InvitedPlayer = l_l_Players_0_FirstChild_1
                        });
                        l_CrewsUI_0.RemoveNotification(v30, true);
                        l_CrewsUI_0.Notify(v32 == nil and "Error" or "Success", v31);
                    end);
                    return;
                end;
            end;
        end);
        local l_Invites_0 = l_Frame_0:WaitForChild("Invited"):WaitForChild("Invites");
        local v34 = {};
        local v35 = false;
        v7.ReceiveInvite = function(_, v37) --[[ Line: 130 ]] --[[ Name: ReceiveInvite ]]
            -- upvalues: v34 (copy), l_Invites_0 (copy), v8 (copy), v35 (ref), l_CrewsUI_0 (copy)
            local l_InvitationData_0 = v37.InvitationData;
            if l_InvitationData_0 == nil then
                return;
            else
                local l_CrewName_0 = l_InvitationData_0.CrewName;
                local l_CrewImage_0 = l_InvitationData_0.CrewImage;
                local _ = l_InvitationData_0.Inviter;
                if v34[l_CrewName_0] ~= nil then
                    return;
                else
                    local v42 = script.InviteTemplate:Clone();
                    v42.Name = l_CrewName_0;
                    v42.Parent = l_Invites_0;
                    local l_Invitation_0 = v42.Invitation;
                    l_Invitation_0.CrewName.Text = l_CrewName_0;
                    l_Invitation_0.Logo.Image = l_CrewImage_0 and "https://www.roblox.com/asset-thumbnail/image?assetId=" .. l_CrewImage_0 .. "&width=420&height=420&format=png";
                    l_Invitation_0.Accept.MouseButton1Click:Connect(function() --[[ Line: 149 ]]
                        -- upvalues: v8 (ref), v35 (ref), l_CrewsUI_0 (ref), l_CrewName_0 (copy), v34 (ref), v42 (copy)
                        v8.UIUtils.ButtonEffect();
                        if v35 == true then
                            l_CrewsUI_0.Notify("Information", "Game is still processing previous action");
                            return;
                        else
                            v35 = true;
                            local v44 = l_CrewsUI_0.Notify("Information", "Joining " .. l_CrewName_0);
                            local v45, v46 = l_CrewsUI_0.UIClient:GetRemote():InvokeServer({
                                Method = "AcceptInvite", 
                                CrewName = l_CrewName_0
                            });
                            l_CrewsUI_0.RemoveNotification(v44, true);
                            l_CrewsUI_0.Notify(v46 == nil and "Error" or "Success", v45);
                            if v46 and v46 == true then
                                v34[l_CrewName_0] = nil;
                                v42:Destroy();
                            end;
                            v35 = false;
                            return;
                        end;
                    end);
                    l_Invitation_0.Ignore.MouseButton1Click:Connect(function() --[[ Line: 177 ]]
                        -- upvalues: v8 (ref), v35 (ref), l_CrewsUI_0 (ref), l_CrewName_0 (copy), v34 (ref), v42 (copy)
                        v8.UIUtils.ButtonEffect();
                        if v35 == true then
                            return;
                        else
                            local _, v48 = l_CrewsUI_0.UIClient:GetRemote():InvokeServer({
                                Method = "DeclineInvite", 
                                CrewName = l_CrewName_0
                            });
                            if v48 and v48 == true then
                                v34[l_CrewName_0] = nil;
                                v42:Destroy();
                            end;
                            return;
                        end;
                    end);
                    v34[l_CrewName_0] = v42;
                    return;
                end;
            end;
        end;
        l_Players_0.PlayerRemoving:Connect(function(v49) --[[ Line: 196 ]]
            -- upvalues: v7 (copy)
            v7:RemoveInvite(v49);
        end);
    end
};