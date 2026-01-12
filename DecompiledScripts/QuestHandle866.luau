local v0, _, _, v3, v4 = require(game.ReplicatedStorage.Modules.ScriptSet).get();
local v5 = require(game.ReplicatedStorage.Modules.Shared.Maids.Maid);
local v6 = require(game.ReplicatedStorage.Modules.NPCInteractions);
game.ReplicatedStorage:WaitForChild("NPCCache");
pointToScreen = function(v7, v8, v9, v10) --[[ Line: 6 ]] --[[ Name: pointToScreen ]]
    local v11 = 1 / math.tan(v10 / 2);
    local v12 = v9.y / v9.x;
    local v13 = v7:pointToObjectSpace(v8);
    local v14 = Vector2.new(v13.x, v13.y) / -v13.z;
    v14 = Vector2.new(v14.x * v12, v14.y) * v11 / 2 * v9 + v9 / 2;
    return Vector2.new(v14.x, v9.y - v14.y), -v13.z;
end;
local v15 = nil;
local function v36() --[[ Line: 18 ]] --[[ Name: update ]]
    -- upvalues: v4 (copy), v6 (copy), v3 (copy), v0 (copy), v15 (ref)
    local l_Value_0 = v4.Quest.CurrentQuest.Value;
    local _, v18 = v6:getmob_formquest(l_Value_0, v4.Quest.MultiQuestProgress.Value);
    local l_Character_0 = game.Players.LocalPlayer.Character;
    if v18 and l_Character_0 then
        v18 = v18.QuestInfo;
        if v18.Type == "Find" then
            if workspace:FindFirstChild("RItem") == nil and v4.Quest.QuestProgress.Value == 0 then
                local l_FirstChild_0 = game.ReplicatedStorage.RItems:FindFirstChild(v18.MobName);
                if l_FirstChild_0 then
                    local v21 = l_FirstChild_0:Clone();
                    v21.Name = "RItem";
                    local v22 = game.ReplicatedStorage.Events.Quest:InvokeServer({
                        "requestposition"
                    });
                    v21.CFrame = v22;
                    v21.Parent = workspace.Effects;
                    local l_Highlight_0 = Instance.new("Highlight");
                    l_Highlight_0.DepthMode = Enum.HighlightDepthMode.Occluded;
                    l_Highlight_0.FillTransparency = 1;
                    l_Highlight_0.OutlineTransparency = 0.5;
                    l_Highlight_0.Parent = v21;
                    if v21:FindFirstChild("hint") then
                        v21.hint:Play();
                    end;
                    local v24 = script.Prompt:Clone();
                    v24.ActionText = "Pick up";
                    v24.ObjectText = v18.MobName;
                    v24.Parent = v21;
                    local v25 = nil;
                    do
                        local l_v25_0 = v25;
                        l_v25_0 = v24.Triggered:Connect(function() --[[ Line: 52 ]]
                            -- upvalues: l_Character_0 (ref), v22 (copy), l_v25_0 (ref), v24 (copy)
                            l_Character_0 = game.Players.LocalPlayer.Character;
                            if (l_Character_0.HumanoidRootPart.Position - v22.p).magnitude <= 10 then
                                game.ReplicatedStorage.Events.Quest:InvokeServer({
                                    "founditem"
                                });
                                l_v25_0:disconnect();
                                v24:Destroy();
                                l_v25_0 = nil;
                            end;
                        end);
                        task.spawn(function() --[[ Line: 63 ]]
                            -- upvalues: v24 (copy), v21 (copy), v22 (copy), l_Character_0 (ref), v3 (ref)
                            while v24:IsDescendantOf(v21) == true do
                                game["Run Service"].RenderStepped:Wait();
                                v21.Name = "Part";
                                local _, v28 = workspace.CurrentCamera:WorldToScreenPoint(v22.p);
                                if v28 then
                                    v21.Parent = workspace.Effects;
                                else
                                    v21.Parent = game.ReplicatedStorage;
                                end;
                                l_Character_0 = game.Players.LocalPlayer.Character;
                            end;
                            v21:Destroy();
                            v3:Destroy();
                        end);
                    end;
                end;
            elseif v4.Quest.QuestProgress.Value == 1 and v0.Backpack:FindFirstChild(v18.MobName) == nil then
                game.ReplicatedStorage.Events.Quest:InvokeServer({
                    "requestitem"
                });
            end;
        elseif v18.Type == "Deliver" then
            if v0.Backpack:FindFirstChild(v18.MobName) == nil and l_Character_0:FindFirstChild(v18.MobName) == nil then
                game.ReplicatedStorage.Events.Quest:InvokeServer({
                    "requestitem"
                });
            end;
            if v15 == nil and v18.block == nil then
                l_Character_0:WaitForChild("UpperTorso");
                local _, v30 = v6:getmob_formquest(v4.Quest.CurrentQuest.Value);
                local _ = game.ReplicatedStorage:FindFirstChild("NPCCache"):FindFirstChild(v30.QuestInfo.EndNPC);
                local v32 = Instance.new("Attachment", l_Character_0.UpperTorso);
                local v33 = Instance.new("Attachment", workspace.Terrain);
                local v34 = script.Beam:Clone();
                v34.Parent = l_Character_0.UpperTorso;
                v34.Attachment0 = v32;
                v34.Attachment1 = v33;
                v15 = v34;
                local v35 = game.ReplicatedStorage.Events.Quest:InvokeServer({
                    "requestEndCFrame"
                });
                if v35 == nil then
                    if v15 then
                        v15:Destroy();
                        v15 = nil;
                    end;
                    v32:Destroy();
                    return;
                else
                    task.spawn(function() --[[ Line: 135 ]]
                        -- upvalues: l_Character_0 (ref), v33 (copy), v35 (copy), v34 (copy), v15 (ref), v32 (copy)
                        while l_Character_0.Parent ~= nil do
                            game["Run Service"].Heartbeat:Wait();
                            v33.WorldCFrame = v35;
                            v34.TextureLength = math.clamp((l_Character_0.HumanoidRootPart.Position - v33.WorldCFrame.Position).magnitude / 10, 1, 5);
                        end;
                        if v15 then
                            v15:Destroy();
                            v15 = nil;
                        end;
                        v32:Destroy();
                    end);
                end;
            end;
        end;
    end;
    if v18 == nil then
        l_Character_0 = game.Players.LocalPlayer.Character;
        if workspace:FindFirstChild("RItem") then
            workspace:FindFirstChild("RItem"):Destroy();
        end;
        if l_Character_0:FindFirstChild("DeliverItem") then
            l_Character_0:FindFirstChild("DeliverItem"):Destroy();
        end;
        if v15 then
            v15:Destroy();
            v15 = nil;
        end;
    end;
end;
v36();
local v37 = {};
local _ = function() --[[ Line: 170 ]] --[[ Name: questMarkers ]]
    -- upvalues: v4 (copy), v6 (copy), v37 (copy)
    local l_Value_1 = v4.Quest.CurrentQuest.Value;
    if l_Value_1 ~= "None" then
        local v39, _ = v6:getmob_formquest(l_Value_1);
        if v39 then
            local l_Children_0 = workspace.NPCs:GetChildren();
            for v42 = 1, #l_Children_0 do
                local v43 = l_Children_0[v42];
                if v43.Name == v39 then
                    task.spawn(function() --[[ Line: 179 ]]
                        -- upvalues: v43 (copy), v37 (ref)
                        local l_questMarker_0 = v43:FindFirstChild("questMarker");
                        local v45 = v43:WaitForChild("Head", 3);
                        if v45 then
                            if l_questMarker_0 == nil then
                                local v46 = game.ReplicatedStorage.Assets.NPCCircle:Clone();
                                v46.Name = "questMarker";
                                v46.Parent = v43;
                                v46.Adornee = v45;
                                table.insert(v37, v46);
                                return;
                            else
                                l_questMarker_0.Adornee = nil;
                                l_questMarker_0.Adornee = v43.Head;
                            end;
                        end;
                    end);
                end;
            end;
        end;
    end;
end;
local v48, v49 = v6:getmob_formquest(v4.Quest.CurrentQuest.Value, v4.Quest.MultiQuestProgress.Value);
local function v56() --[[ Line: 204 ]] --[[ Name: refreshQuestInfo ]]
    -- upvalues: v36 (copy), v4 (copy), v37 (copy), v48 (ref), v49 (ref), v6 (copy)
    v36();
    if v4.Quest.CurrentQuest.Value == "None" then
        for _, v51 in pairs(v37) do
            v51.Maid:Destroy();
        end;
        table.clear(v37);
        local v52 = nil;
        local v53 = nil;
        v48 = v52;
        v49 = v53;
        return;
    else
        local v54, v55 = v6:getmob_formquest(v4.Quest.CurrentQuest.Value, v4.Quest.MultiQuestProgress.Value);
        v48 = v54;
        v49 = v55;
        return;
    end;
end;
v4.Quest.CurrentQuest.Changed:Connect(function() --[[ Line: 218 ]]
    -- upvalues: v56 (copy)
    if workspace:FindFirstChild("RItem") then
        workspace:FindFirstChild("RItem"):Destroy();
    end;
    v56();
end);
v4.Quest.MultiQuestProgress.Changed:Connect(function() --[[ Line: 226 ]]
    -- upvalues: v37 (copy), v56 (copy)
    for _, v58 in pairs(v37) do
        v58.Maid:Destroy();
    end;
    v56();
end);
game.Players.LocalPlayer.CharacterAdded:Connect(v36);
local function v63(v59, v60, v61) --[[ Line: 235 ]] --[[ Name: aglinMarker ]]
    -- upvalues: v37 (copy)
    if v60 == nil then
        v60 = v59:GetAttribute("NPCID");
    end;
    local v62 = v37[v60];
    if v62 then
        v62 = v62.markerAttachment:WaitForChild("questMarker", 1);
    end;
    if v62 == nil then
        return;
    else
        if v59 and v59:IsDescendantOf(workspace) then
            if v59:WaitForChild("Head", 3) then
                v62.StudsOffsetWorldSpace = Vector3.new();
                v62.Adornee = nil;
                v62.Adornee = v59.Head;
                return;
            end;
        elseif v61 then
            v62.Adornee = nil;
            v62.StudsOffsetWorldSpace = v61;
        end;
        return;
    end;
end;
workspace.NPCs.ChildAdded:Connect(v63);
while true do
    if v4.Quest.CurrentQuest.Value ~= "None" then
        local _ = tick();
        if v48 then
            local v65 = game.ReplicatedStorage.Events.Quest:InvokeServer("getNPCQuestLocations");
            for v66, v67 in pairs(v65) do
                local l_Position_0 = v67.Position;
                task.spawn(function() --[[ Line: 274 ]]
                    -- upvalues: v67 (copy), v37 (copy), v66 (copy), v5 (copy), v63 (copy), l_Position_0 (copy)
                    local l_npcModel_0 = v67.npcModel;
                    local v70 = v37[v66];
                    if v70 then
                        v70 = v70.markerAttachment:FindFirstChild("questMarker");
                    end;
                    if l_npcModel_0 and l_npcModel_0:IsDescendantOf(workspace.Effects) then
                        return;
                    else
                        if v37[v66] == nil then
                            local v71 = v5.new();
                            local v72 = Instance.new("Attachment", workspace.Terrain);
                            v70 = game.ReplicatedStorage.Assets.NPCCircle:Clone();
                            v70.Name = "questMarker";
                            v70.Parent = v72;
                            local v73 = Instance.new("ObjectValue", v70);
                            v73.Name = "attachmentObject";
                            v73.Value = v72;
                            v37[v66] = {
                                Maid = v71, 
                                markerAttachment = v72
                            };
                            v71:AddTask(v72);
                            v71:AddTask(v70);
                        end;
                        if l_npcModel_0 and v37[v66].deathConnection == nil then
                            v37[v66].Maid:AddTask(l_npcModel_0:GetPropertyChangedSignal("Parent"):Connect(function() --[[ Line: 302 ]]
                                -- upvalues: l_npcModel_0 (copy), v37 (ref), v66 (ref)
                                if l_npcModel_0:IsDescendantOf(workspace.Effects) then
                                    v37[v66].Maid:Destroy();
                                    v37[v66] = nil;
                                end;
                            end));
                        end;
                        v63(l_npcModel_0, v66, l_Position_0);
                        return;
                    end;
                end);
            end;
        end;
    end;
    task.wait(1);
end;