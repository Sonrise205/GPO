local l_RunService_0 = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_HttpService_0 = game:GetService("HttpService");
local l_LocalPlayer_0 = game.Players.LocalPlayer;
local l_PlayerGui_0 = l_LocalPlayer_0.PlayerGui;
local l_CurrentCamera_0 = workspace.CurrentCamera;
local v6 = require(script.Recommended);
local v7 = require(l_ReplicatedStorage_0.Modules.NPCInteractions):getquests();
local v8 = require(l_ReplicatedStorage_0.Modules.Client.UIUtils);
local v9 = require(l_ReplicatedStorage_0.Modules.Leveling);
local v10 = {
    Initialized = false
};
v10.Initialize = function(v11) --[[ Line: 18 ]] --[[ Name: Initialize ]]
    -- upvalues: v10 (copy), l_ReplicatedStorage_0 (copy), l_PlayerGui_0 (copy), l_HttpService_0 (copy), v7 (copy), v6 (copy), l_LocalPlayer_0 (copy), v9 (copy), l_RunService_0 (copy), l_CurrentCamera_0 (copy), v8 (copy)
    if v10.Initialized then
        return;
    else
        local l_reservedCode_0 = l_ReplicatedStorage_0:WaitForChild("reservedCode");
        local v13 = l_PlayerGui_0:WaitForChild("QuestTracker", 360);
        local function v14() --[[ Line: 26 ]] --[[ Name: ReservedCodeUpdated ]]
            -- upvalues: l_reservedCode_0 (copy), l_ReplicatedStorage_0 (ref), v13 (copy)
            if l_reservedCode_0.Value == "arena" or l_ReplicatedStorage_0:FindFirstChild("tradingHUB") or _G.arena == true then
                v13.Enabled = false;
            end;
        end;
        if l_reservedCode_0.Value == "arena" or l_ReplicatedStorage_0:FindFirstChild("tradingHUB") or _G.arena == true then
            v13.Enabled = false;
        end;
        l_reservedCode_0:GetPropertyChangedSignal("Value"):Connect(v14);
        local l_v11_StatsFolder_0 = v11:GetStatsFolder();
        local l_Level_0 = l_v11_StatsFolder_0.Stats.Level;
        local v17 = l_ReplicatedStorage_0.Events.Quest:InvokeServer({
            "getQuestLocations"
        });
        local l_Marker_0 = script:WaitForChild("Marker");
        local v19 = l_PlayerGui_0:WaitForChild("UIIndicator", 360);
        local l_QuestTracker_0 = v13.QuestTracker;
        local l_Main_0 = v13.Main;
        local l_QuestDescription_0 = l_Main_0.QuestDescription;
        local l_Reccommended_0 = l_Main_0.Reccommended;
        local _ = l_QuestTracker_0.ItemNum;
        local l_Track_0 = l_Main_0.Track;
        local l_Compass_0 = l_Main_0.CompassOutline.Compass;
        local l_Arrow_0 = l_Compass_0.Arrow;
        local v28 = false;
        local v29 = nil;
        local v30 = false;
        local v31 = nil;
        local v32 = game.ReplicatedStorage:FindFirstChild("2ndSea") == nil and "FirstSea" or "SecondSea";
        local function v36(v33) --[[ Line: 60 ]] --[[ Name: isAQuest ]]
            -- upvalues: v17 (copy), l_HttpService_0 (ref), l_v11_StatsFolder_0 (copy)
            if not v33 then
                return;
            elseif not v33.lvlReq then
                return;
            elseif not v33.QuestInfo then
                return;
            elseif not v33.QuestInfo.Rewards then
                return;
            elseif not v17[v33.NPC] then
                return;
            elseif v33.noNPC ~= nil then
                return;
            elseif v33.MiscQuest ~= nil then
                return;
            else
                for _, v35 in (l_HttpService_0:JSONDecode(l_v11_StatsFolder_0.Quest.CompletedQuests.Value)) do
                    if v33.QuestName == v35 then
                        return;
                    end;
                end;
                return true;
            end;
        end;
        for _, v38 in v7 do
            if v38.NPC and v36(v38) ~= nil then
                local v39 = v38.customQuestPosition or nil;
                if v39 then
                    v17[v38.NPC] = CFrame.new(v39);
                end;
                table.insert(v6.Quests, {
                    NPC = v38.NPC, 
                    Description = ("Find %* and do their quest!"):format(v38.NPC), 
                    LevelRequirement = v38.lvlReq, 
                    QuestName = v38.QuestName, 
                    Position = v39 and v39 or v17[v38.NPC].Position
                });
            end;
        end;
        local function _() --[[ Line: 98 ]] --[[ Name: updateSort ]]
            -- upvalues: v6 (ref)
            table.sort(v6.Quests, function(v40, v41) --[[ Line: 99 ]]
                return v40.LevelRequirement < v41.LevelRequirement;
            end);
        end;
        table.sort(v6.Quests, function(v43, v44) --[[ Line: 99 ]]
            return v43.LevelRequirement < v44.LevelRequirement;
        end);
        local function v51() --[[ Line: 106 ]] --[[ Name: GrabRecommendedQuest ]]
            -- upvalues: v6 (ref), v32 (copy), l_Level_0 (copy), v11 (copy), l_LocalPlayer_0 (ref)
            if v6.MaxLevel[v32] and v6.MaxLevel[v32].LevelRequirement <= l_Level_0.Value then
                return v6.MaxLevel[v32];
            else
                local _ = v11:GetStatsFolder();
                local v46 = v6.Quests[1];
                local v47 = 1e999;
                for _, v49 in v6.Quests do
                    if v49.LevelRequirement > l_Level_0.Value then
                        return v46;
                    else
                        local l_Magnitude_0 = (l_LocalPlayer_0.Character.HumanoidRootPart.Position - v49.Position).Magnitude;
                        if v49.LevelRequirement > v46.LevelRequirement or v49.LevelRequirement == v46.LevelRequirement and l_Magnitude_0 < v47 then
                            v47 = l_Magnitude_0;
                            v46 = v49;
                        end;
                    end;
                end;
                return v46;
            end;
        end;
        local v52 = nil;
        local function v74() --[[ Line: 129 ]] --[[ Name: UpdateQuest ]]
            -- upvalues: v31 (ref), v51 (copy), l_QuestDescription_0 (copy), v13 (copy), l_v11_StatsFolder_0 (copy), v9 (ref), l_reservedCode_0 (copy), l_ReplicatedStorage_0 (ref), l_Reccommended_0 (copy), v52 (ref), v17 (copy), v28 (ref), l_Compass_0 (copy), l_Main_0 (copy), v30 (ref), v29 (ref), l_RunService_0 (ref), l_CurrentCamera_0 (ref), l_Arrow_0 (copy), l_Marker_0 (copy)
            v31 = v51();
            if not v31 then
                l_QuestDescription_0.Text = "No quests ATM";
                v13.Enabled = false;
                return;
            elseif l_v11_StatsFolder_0.Stats.Level.Value >= v9.MaxLevel then
                v13.Enabled = false;
                return;
            else
                v13.Enabled = true;
                if l_reservedCode_0.Value == "arena" or l_ReplicatedStorage_0:FindFirstChild("tradingHUB") or _G.arena == true then
                    v13.Enabled = false;
                end;
                if v13.Enabled == false then
                    return;
                else
                    l_QuestDescription_0.Text = v31.Description;
                    l_Reccommended_0.Text = v31.QuestName;
                    if v52 ~= v31 then
                        _G.displayMessage("<Color=Green>New recommended quest ready!");
                    end;
                    v52 = v31;
                    local v53 = v17[v31.NPC];
                    if not v53 then
                        return;
                    else
                        if v28 then
                            l_Compass_0.Parent = l_Main_0.CompassOutline;
                        elseif not v30 and v29 then
                            v29:Disconnect();
                            v29 = nil;
                        elseif v30 then
                            l_Compass_0.Parent = v13.QuestTracker.Compass;
                        end;
                        if v30 then
                            if v29 then
                                v29:Disconnect();
                                v29 = nil;
                            end;
                            v29 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 171 ]]
                                -- upvalues: l_CurrentCamera_0 (ref), v53 (copy), l_Arrow_0 (ref), l_Marker_0 (ref)
                                local v54 = l_CurrentCamera_0.CFrame:ToObjectSpace(v53);
                                l_Arrow_0.Rotation = math.deg(math.atan2(v54.Z, v54.X) + 3.141592653589793);
                                if l_Marker_0.Parent == script then
                                    return;
                                else
                                    local l_X_0 = l_CurrentCamera_0.ViewportSize.X;
                                    local l_Y_0 = l_CurrentCamera_0.ViewportSize.Y;
                                    local l_X_1 = l_Marker_0.AbsoluteSize.X;
                                    local v58 = l_X_0 - l_X_1 * 2;
                                    local v59 = l_Y_0 - l_X_1 * 2;
                                    local l_CFrame_0 = l_CurrentCamera_0.CFrame;
                                    local v61 = math.sqrt((v58 / 2) ^ 2 + (v59 / 2) ^ 2);
                                    local l_LookVector_0 = l_CFrame_0.LookVector;
                                    local _ = Vector2.new(l_LookVector_0.X, l_LookVector_0.Z).Unit;
                                    local l_Position_0 = v53.Position;
                                    local v65, v66 = l_CurrentCamera_0:WorldToViewportPoint(l_Position_0);
                                    local v67 = math.clamp(v65.X, l_X_1, l_X_0 - l_X_1);
                                    local v68 = math.clamp(v65.Y, l_X_1, l_Y_0 - l_X_1);
                                    if v67 ~= v65.X or v68 ~= v65.Y or not v66 then
                                        local v69 = l_CFrame_0:VectorToObjectSpace(l_Position_0 - l_CFrame_0.Position);
                                        local l_Unit_1 = Vector2.new(v69.X, v69.Y).Unit;
                                        local v71 = l_Unit_1 * v61;
                                        local _ = math.atan2(l_Unit_1.X, l_Unit_1.Y);
                                        local v73 = nil;
                                        v73 = if math.abs(v71.Y) > v59 / 2 then l_Unit_1 * math.abs(v59 / 2 / l_Unit_1.Y) else l_Unit_1 * math.abs(v58 / 2 / l_Unit_1.X);
                                        v67 = l_X_0 / 2 + v73.X;
                                        v68 = l_Y_0 / 2 - v73.Y;
                                    end;
                                    l_Marker_0.Position = UDim2.fromOffset(v67, v68);
                                    l_Marker_0.Distance.Text = ("%*m"):format((math.ceil(v54.Position.Magnitude)));
                                    return;
                                end;
                            end);
                        end;
                        return;
                    end;
                end;
            end;
        end;
        l_Track_0.MouseButton1Click:Connect(function() --[[ Line: 229 ]]
            -- upvalues: v30 (ref), v8 (ref), v31 (ref), l_Track_0 (copy), l_Marker_0 (copy), v19 (copy), v74 (copy)
            v30 = not v30;
            v8.ButtonEffect();
            if not v30 or not v31 then
                l_Track_0.InsideText.Text = "Track Quest";
                l_Track_0.ImageColor3 = Color3.fromRGB(115, 255, 0);
                l_Marker_0.Parent = script;
            else
                l_Track_0.InsideText.Text = "Stop Tracking";
                l_Track_0.ImageColor3 = Color3.fromRGB(255, 14, 14);
                l_Marker_0.Parent = v19;
            end;
            v74();
        end);
        l_QuestTracker_0.MouseButton1Click:Connect(function() --[[ Line: 248 ]]
            -- upvalues: v28 (ref), l_Main_0 (copy), v74 (copy)
            v28 = not v28;
            l_Main_0.Visible = v28;
            v74();
        end);
        local function v75() --[[ Line: 255 ]] --[[ Name: markerVisiblity ]]
            -- upvalues: v30 (ref), l_Marker_0 (copy), l_v11_StatsFolder_0 (copy), v74 (copy)
            if not v30 then
                return;
            else
                l_Marker_0.Visible = l_v11_StatsFolder_0.Quest.CurrentQuest.Value == "None";
                v74();
                return;
            end;
        end;
        l_v11_StatsFolder_0.Quest.CurrentQuest.Changed:Connect(v75);
        l_Level_0.Changed:Connect(v74);
        v74();
        v10.Initialized = true;
        return;
    end;
end;
return v10;