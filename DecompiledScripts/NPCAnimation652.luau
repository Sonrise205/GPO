local l_Players_0 = game:GetService("Players");
if not l_Players_0.LocalPlayer then
    l_Players_0.PlayerAdded:Wait();
end;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v2 = {};
local v3 = require(game.ReplicatedStorage.Modules.NPCInteractions);
local v4 = {};
local v5 = {};
local v6 = v3:getquests();
local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
local l_HttpService_0 = game:GetService("HttpService");
local v9 = {};
local v10 = {};
local v11 = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, -1, true, 0);
local v12 = {
    Transparency = 0.5
};
v2.animate = function(_, v14, v15) --[[ Line: 19 ]] --[[ Name: animate ]]
    -- upvalues: l_FirstChild_0 (ref), l_LocalPlayer_0 (copy), v9 (copy), v5 (copy), v6 (copy), v2 (copy), v10 (copy), v11 (copy), v12 (copy), v4 (copy)
    if not l_FirstChild_0 then
        l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
    end;
    task.spawn(function() --[[ Line: 23 ]]
        -- upvalues: v14 (ref), l_LocalPlayer_0 (ref), v9 (ref), v15 (copy), v5 (ref), v6 (ref), v2 (ref), v10 (ref), v11 (ref), v12 (ref), v4 (ref)
        local v16 = v14:WaitForChild("Head", 100000000000);
        local l_FirstChild_1 = game.ReplicatedStorage:FindFirstChild("Stats" .. l_LocalPlayer_0.Name);
        if not v9[v14] then
            v9[v14] = {};
        end;
        if script.Animations:FindFirstChild(v15) and not v14:FindFirstChild("animated") and v14:FindFirstChild("Info") and v14:FindFirstChild("Head") then
            local l_BoolValue_0 = Instance.new("BoolValue");
            l_BoolValue_0.Name = "animated";
            l_BoolValue_0.Parent = v14;
            if v5[v14] then
                v5[v14]:Destroy();
                v5[v14] = nil;
            end;
            local v19 = nil;
            if v14.Name == "Captain Zhen" then
                if v14:WaitForChild("Cape", 10):WaitForChild("AnimationController", 10) then
                    v14.Cape.AnimationController:LoadAnimation(script.whiteCape):Play();
                end;
            elseif v14.Name == "Pharaoh Akshan" and v14:WaitForChild("Cape", 10):WaitForChild("AnimationController", 10) then
                v14.Cape.AnimationController:LoadAnimation(script.crocCape):Play();
            end;
            if v14:FindFirstChild("Marine Captain CapeHat") then
                v14:FindFirstChild("Marine Captain CapeHat").AnimationController:LoadAnimation(script.whiteCape):Play();
            end;
            do
                local l_v19_0 = v19;
                if not v5[v14] then
                    for _, v22 in v9[v14] do
                        v22:Disconnect();
                        v22 = nil;
                    end;
                    v9[v14] = {};
                    local v23 = nil;
                    do
                        local l_v23_0 = v23;
                        if v14:FindFirstChild("noOverhead") == nil then
                            l_v23_0 = script.Overhead:Clone();
                            l_v23_0.NameT.Text = v14.Name;
                            if v14.Name == "Robo" then
                                l_v23_0.NameT.Text = "Robo <br/>[Set Spawn Point]";
                            end;
                            l_v23_0.Health.Frame.Script.char.Value = v14;
                            task.spawn(function() --[[ Line: 73 ]]
                                -- upvalues: v14 (ref), l_v23_0 (ref)
                                v14:WaitForChild("HumanoidRootPart");
                                if v14.PrimaryPart ~= nil and l_v23_0.StudsOffset.Y > v14:GetModelSize().Y / 2 + 3 then
                                    l_v23_0.StudsOffset = Vector3.new(0, v14:GetModelSize().Y / 2 + 3, 0);
                                end;
                            end);
                            l_v23_0.Health.Frame.Script.playerName.Value = v14.Name;
                            l_v23_0.Health.Frame.Script.Disabled = false;
                            l_v23_0.Adornee = v14.Head;
                            l_v23_0.Name = v14.Name;
                            l_v23_0.Parent = v14.Head;
                            v5[v14] = l_v23_0;
                            if v6[v14.Name] and v6[v14.Name].lvlReq ~= nil and l_FirstChild_1.Stats.Level.Value < v6[v14.Name].lvlReq then
                                l_v23_0.Level.Visible = true;
                                l_v23_0.Level.Text = "Level " .. math.ceil(v6[v14.Name].lvlReq) .. "+";
                                l_v19_0 = l_FirstChild_1.Stats.Level.Changed:Connect(function() --[[ Line: 102 ]]
                                    -- upvalues: l_FirstChild_1 (copy), v6 (ref), v14 (ref), l_v23_0 (ref), l_v19_0 (ref)
                                    if l_FirstChild_1.Stats.Level.Value < v6[v14.Name].lvlReq then
                                        l_v23_0.Level.Visible = true;
                                        l_v23_0.Level.Text = "Level " .. math.ceil(v6[v14.Name].lvlReq) .. "+";
                                        return;
                                    else
                                        if l_v19_0 then
                                            l_v19_0:Disconnect();
                                            l_v19_0 = nil;
                                        end;
                                        l_v23_0.Level.Visible = false;
                                        return;
                                    end;
                                end);
                                table.insert(v9[v14], l_v19_0);
                            end;
                            if v14:FindFirstChild("Info") and v14.Info:FindFirstChild("Hostile") and v14.Info.Hostile.Value == false then
                                l_v23_0.Health.Visible = false;
                            else
                                l_v23_0.MaxDistance = 50;
                            end;
                        end;
                        if v14.Humanoid:IsA("Humanoid") then
                            local v25 = nil;
                            do
                                local l_v25_0 = v25;
                                l_v25_0 = v14.AncestryChanged:Connect(function(_, v28) --[[ Line: 127 ]]
                                    -- upvalues: l_v19_0 (ref), l_v25_0 (ref), l_v23_0 (ref), v5 (ref), v14 (ref), v2 (ref)
                                    if v28 ~= workspace.Effects.DeadNPCs then
                                        return;
                                    else
                                        if l_v19_0 then
                                            l_v19_0:Disconnect();
                                            l_v19_0 = nil;
                                        end;
                                        if l_v25_0 then
                                            l_v25_0:Disconnect();
                                            l_v25_0 = nil;
                                        end;
                                        if l_v23_0 then
                                            l_v23_0:Destroy();
                                        end;
                                        if v5[v14] then
                                            v5[v14]:Destroy();
                                        end;
                                        v5[v14] = nil;
                                        v2:remove(v14);
                                        _G.destroy(v14, 1);
                                        v14 = nil;
                                        return;
                                    end;
                                end);
                                table.insert(v9[v14], l_v25_0);
                            end;
                        end;
                    end;
                end;
                if v14.Info:FindFirstChild("noAnims") == nil then
                    if v14.Info:FindFirstChild("Idle") then
                        local l_Humanoid_0 = v14:FindFirstChild("Humanoid");
                        if l_Humanoid_0 == nil then
                            l_Humanoid_0 = v14:FindFirstChild("AnimationController");
                        end;
                        local v30 = l_Humanoid_0:LoadAnimation(v14.Info.Idle);
                        v30:Play();
                        v30.Looped = true;
                        v30.Priority = Enum.AnimationPriority.Idle;
                        if v14:FindFirstChild("Duck") then
                            v14.Duck.AnimationController:LoadAnimation(v14.Duck.Idle):Play();
                        end;
                    else
                        local v31 = script.Animations:FindFirstChild(v15):Clone();
                        v31.Character.Value = v14;
                        v31.Disabled = false;
                        v31.Name = v14.Name;
                        v31.Parent = script.CurrentAnimations;
                        v10[v14] = v31;
                        local l_v31_0 = v31 --[[ copy: 4 -> 9 ]];
                        v14.Destroying:Connect(function() --[[ Line: 176 ]]
                            -- upvalues: l_v31_0 (copy)
                            l_v31_0:Destroy();
                        end);
                    end;
                    if v14.Info:FindFirstChild("Hostile") and v14.Info.Hostile.Value == false and v14.Info:FindFirstChild("Idle") == nil then
                        local v33 = v14.Humanoid:LoadAnimation(script.Idle);
                        v33:Play();
                        v33.Priority = Enum.AnimationPriority.Action;
                        v33.Looped = true;
                    end;
                end;
            end;
        end;
        if v14:FindFirstChild("QuestMark") then
            v14:FindFirstChild("QuestMark"):Destroy();
        end;
        if v6[v14.Name] and v6[v14.Name].QuestName and not v14:FindFirstChild("QuestMark") then
            local v34 = script.MeshPart:Clone();
            v34.Parent = workspace.Env;
            v34.Name = "QuestMark";
            Instance.new("BoolValue", v14).Name = "QuestMark";
            game:GetService("TweenService"):Create(v34, v11, v12):Play();
            v4[v34] = {
                v16, 
                0
            };
        end;
    end);
    return nil;
end;
v2.remove = function(_, v36) --[[ Line: 207 ]] --[[ Name: remove ]]
    -- upvalues: v5 (copy), v9 (copy), v10 (copy), v4 (copy)
    if v5[v36] then
        v5[v36]:Destroy();
    end;
    v5[v36] = nil;
    if v9[v36] then
        for _, v38 in v9[v36] do
            v38:Disconnect();
            v38 = nil;
        end;
        v9[v36] = nil;
    end;
    if v10[v36] then
        v10[v36]:Destroy();
        v10[v36] = nil;
    end;
    local l_PlayingAnimationTracks_0 = v36.Humanoid:GetPlayingAnimationTracks();
    for v40 = 1, #l_PlayingAnimationTracks_0 do
        l_PlayingAnimationTracks_0[v40]:Stop();
    end;
    for v41, v42 in v4 do
        if v36:findFirstChild("Head") and v42[1] == v36.Head then
            v41:Destroy();
        end;
    end;
end;
local v43 = {};
local function v45() --[[ Line: 236 ]] --[[ Name: updateQuests ]]
    -- upvalues: l_FirstChild_0 (ref), v43 (ref), l_HttpService_0 (copy)
    local l_Value_0 = l_FirstChild_0.Quest.CompletedQuests.Value;
    v43 = l_HttpService_0:JSONDecode(l_Value_0);
end;
v43 = l_HttpService_0:JSONDecode(l_FirstChild_0.Quest.CompletedQuests.Value);
l_FirstChild_0.Quest.CompletedQuests.Changed:Connect(v45);
local function v55() --[[ Line: 243 ]] --[[ Name: renderFunction ]]
    -- upvalues: v4 (copy), v6 (copy), v43 (ref)
    for v46, v47 in v4 do
        local v48 = v47[1];
        local v49 = v47[2];
        local l_Parent_0 = v47[1].Parent;
        if l_Parent_0 ~= nil and l_Parent_0.Parent == workspace.NPCs then
            local l_Name_0 = l_Parent_0.Name;
            if l_Parent_0 and v6[l_Name_0] and v6[l_Name_0].QuestName ~= nil then
                local v52 = false;
                for v53, _ in v43 do
                    if v43[v53] == v6[l_Parent_0.Name].QuestName then
                        v52 = true;
                        break;
                    end;
                end;
                if v52 == true then
                    v4[v46] = nil;
                    v46:Destroy();
                end;
            end;
            v46.CFrame = CFrame.new(v48.Position) * CFrame.new(0, v46.Size.Y / 2 + 2, 0) * CFrame.Angles(0, math.rad(v49), 0);
            v47[2] = v47[2] + 2;
        elseif l_Parent_0 == nil then
            v46:Destroy();
            v4[v46] = nil;
        end;
    end;
end;
game:GetService("RunService").Heartbeat:Connect(v55);
return v2;