local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_LocalPlayer_0 = game.Players.LocalPlayer;
local l_PlayerGui_0 = l_LocalPlayer_0.PlayerGui;
local l_Modules_0 = l_ReplicatedStorage_0.Modules;
local l_Shared_0 = l_Modules_0.Shared;
local l_GamePlaceInfo_0 = require(l_Shared_0:WaitForChild("GamePlaceInfo"));
local l_NPCInteractions_0 = require(l_Modules_0:WaitForChild("NPCInteractions"));
local v7 = require(game.ReplicatedStorage.Modules.Trove);
local v8 = l_NPCInteractions_0:getquests();
local v9 = {
    Initialized = false
};
local _ = function(v10) --[[ Line: 18 ]] --[[ Name: FindQuestData ]]
    -- upvalues: v8 (copy)
    for _, v12 in v8 do
        if v10 == v12.QuestName then
            return v12;
        end;
    end;
    return nil;
end;
v9.Initialize = function(v14) --[[ Line: 28 ]] --[[ Name: Initialize ]]
    -- upvalues: v9 (copy), l_PlayerGui_0 (copy), l_ReplicatedStorage_0 (copy), v8 (copy), l_LocalPlayer_0 (copy), v7 (copy), l_GamePlaceInfo_0 (copy)
    if v9.Initialized then
        return;
    else
        local v15 = l_PlayerGui_0:WaitForChild("Quest", 360);
        local l_Main_0 = v15:WaitForChild("Main");
        local l_Info_0 = l_Main_0:WaitForChild("Info");
        local l_Fill_0 = l_Info_0:WaitForChild("Bar"):WaitForChild("Fill");
        local l_Top_0 = l_Info_0:WaitForChild("Top");
        local l_QuestName_0 = l_Top_0:WaitForChild("QuestName");
        local l_Progress_0 = l_Top_0:WaitForChild("Progress");
        local l_Misc_0 = l_Main_0:WaitForChild("Misc");
        local l_Quit_0 = l_Misc_0:WaitForChild("Quit");
        if l_ReplicatedStorage_0:FindFirstChild("tradingHUB") or _G.arena == true then
            v15.Enabled = false;
            return;
        else
            local l_v14_StatsFolder_0 = v14:GetStatsFolder();
            local l_Quest_0 = l_v14_StatsFolder_0.Quest;
            local l_CurrentQuest_0 = l_Quest_0.CurrentQuest;
            local l_QuestProgress_0 = l_Quest_0.QuestProgress;
            local v28 = nil;
            local function _() --[[ Line: 60 ]] --[[ Name: resetQuest ]]
                -- upvalues: v28 (ref)
                print("reset quest");
                if v28 then
                    v28:Destroy();
                    v28 = nil;
                end;
            end;
            l_Quit_0.MouseButton1Click:Connect(function() --[[ Line: 72 ]]
                -- upvalues: v14 (copy), l_CurrentQuest_0 (copy), l_ReplicatedStorage_0 (ref), l_Quit_0 (copy), l_Main_0 (copy), v28 (ref)
                v14.UIUtils.ButtonEffect();
                if l_CurrentQuest_0.Value == "None" then
                    return;
                else
                    l_ReplicatedStorage_0.Events.Quest:InvokeServer({
                        "quit"
                    });
                    l_Quit_0.Visible = false;
                    l_Main_0.Visible = false;
                    print("reset quest");
                    if v28 then
                        v28:Destroy();
                        v28 = nil;
                    end;
                    return;
                end;
            end);
            local function v53(v30) --[[ Line: 85 ]] --[[ Name: UpdateQuest ]]
                -- upvalues: v8 (ref), l_Main_0 (copy), l_Quit_0 (copy), v15 (copy), v28 (ref), l_v14_StatsFolder_0 (copy), l_QuestName_0 (copy), l_Misc_0 (copy), l_QuestProgress_0 (copy), l_LocalPlayer_0 (ref), l_Progress_0 (copy), l_Fill_0 (copy), v7 (ref)
                local v31 = false;
                warn("update quest");
                local v32;
                for _, v34 in v8 do
                    if v30 == v34.QuestName then
                        v32 = v34;
                        v31 = true;
                    end;
                    if v31 then
                        break;
                    end;
                end;
                if not v31 then
                    v32 = nil;
                end;
                v31 = false;
                l_Main_0.Visible = v32 ~= nil;
                if v30 ~= "None" then
                    l_Main_0.Visible = true;
                end;
                l_Quit_0.Visible = l_Main_0.Visible;
                v15.Enabled = false;
                if v30 == "None" then
                    print("reset quest");
                    if v28 then
                        v28:Destroy();
                        v28 = nil;
                    end;
                    return;
                else
                    print("reset quest");
                    if v28 then
                        v28:Destroy();
                        v28 = nil;
                    end;
                    if v32 then
                        local l_Value_0 = l_v14_StatsFolder_0.Quest.MultiQuestProgress.Value;
                        local l_QuestInfo_0 = v32.QuestInfo;
                        if l_Value_0 > 0 and v32.QuestInfo.MultiQuest ~= nil then
                            l_QuestInfo_0 = v32.QuestInfo.MultiQuest[l_Value_0];
                        end;
                        l_QuestName_0.Text = l_QuestInfo_0.Type;
                        if l_QuestInfo_0.MiscType ~= nil then
                            l_QuestName_0.Text = l_QuestInfo_0.MiscType;
                        end;
                        l_QuestName_0.Shadow.Text = l_QuestName_0.Text;
                        local l_Rewards_0 = l_QuestInfo_0.Rewards;
                        local l_l_Misc_0_Children_0 = l_Misc_0:GetChildren();
                        for v39 = 1, #l_l_Misc_0_Children_0 do
                            if l_l_Misc_0_Children_0[v39]:GetAttribute("reward") then
                                l_l_Misc_0_Children_0[v39]:Destroy();
                            end;
                        end;
                        if l_Rewards_0 and l_QuestInfo_0.hideRewards == nil then
                            l_Misc_0.title.Visible = true;
                            for v40, v41 in pairs(l_Rewards_0) do
                                if v40 ~= "Items" then
                                    local v42 = script.title:Clone();
                                    v42.Name = v40;
                                    v42.Text = v41 .. " " .. v40;
                                    v42.Parent = l_Misc_0;
                                else
                                    for v43, v44 in pairs(v41) do
                                        local v45 = script.title:Clone();
                                        v45.Name = v43;
                                        v45.Text = v44 .. "x " .. v43;
                                        v45.Parent = l_Misc_0;
                                    end;
                                end;
                            end;
                        else
                            l_Misc_0.title.Visible = false;
                        end;
                        if true then
                            local l_l_QuestInfo_0_0 = l_QuestInfo_0;
                            local function v52() --[[ Line: 145 ]] --[[ Name: UpdateProgress ]]
                                -- upvalues: l_QuestProgress_0 (ref), l_l_QuestInfo_0_0 (ref), l_LocalPlayer_0 (ref), l_Progress_0 (ref), l_Fill_0 (ref)
                                if l_QuestProgress_0 == nil or l_l_QuestInfo_0_0 == nil then
                                    return;
                                else
                                    local l_Value_1 = l_QuestProgress_0.Value;
                                    local l_Ammount_0 = l_l_QuestInfo_0_0.Ammount;
                                    if l_l_QuestInfo_0_0.customProgress ~= nil then
                                        local v49, v50 = l_l_QuestInfo_0_0.customProgress(l_LocalPlayer_0);
                                        l_Value_1 = v49;
                                        l_Ammount_0 = v50;
                                        if l_Value_1 == nil then
                                            l_Value_1 = 0;
                                        end;
                                        if l_Ammount_0 == nil then
                                            l_Ammount_0 = 1;
                                        end;
                                        l_Value_1 = math.floor(l_Value_1);
                                    end;
                                    local v51 = l_Value_1 / l_Ammount_0;
                                    l_Progress_0.Text = ("%* / %* %*"):format(l_Value_1, l_Ammount_0, l_l_QuestInfo_0_0.MobName);
                                    l_Progress_0.Shadow.Text = l_Progress_0.Text;
                                    l_Fill_0:TweenSize(UDim2.new(v51, 0, 1, 0), "Out", "Quad", 0.25, true);
                                    return;
                                end;
                            end;
                            v28 = v7.new();
                            v28:Connect(l_QuestProgress_0.Changed, v52);
                            v28:Add(task.spawn(function() --[[ Line: 178 ]]
                                -- upvalues: v52 (copy)
                                while true do
                                    v52();
                                    task.wait(0.3);
                                end;
                            end));
                            v52();
                        end;
                    end;
                    v15.Enabled = true;
                    return;
                end;
            end;
            l_v14_StatsFolder_0.Quest.MultiQuestProgress.Changed:Connect(function() --[[ Line: 191 ]]
                -- upvalues: v53 (copy), l_CurrentQuest_0 (copy)
                v53(l_CurrentQuest_0.Value);
            end);
            l_CurrentQuest_0.Changed:Connect(v53);
            v53(l_CurrentQuest_0.Value);
            local v54 = l_GamePlaceInfo_0:GetPlaceIds()[game.PlaceId];
            if v54 ~= nil and v54 == "Trade Hub" then
                v15.Enabled = false;
            end;
            warn("Quest Initialized");
            v9.Initialized = true;
            return;
        end;
    end;
end;
return v9;