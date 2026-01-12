local v0, _, _, _, v4 = require(game.ReplicatedStorage.Modules.ScriptSet).get();
local v5 = require(game.ReplicatedStorage.Util.WaterLogia.rougelineage);
local v6 = {};
task.wait(1);
game.ReplicatedStorage:WaitForChild("Stats" .. v0.Name);
local l_Players_0 = game.Players:GetPlayers();
for v8 = 1, #l_Players_0 do
    local v9 = l_Players_0[v8];
    local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. v9.Name);
    if l_FirstChild_0 and game.ReplicatedStorage.Util.WaterLogia:FindFirstChild(l_FirstChild_0.Stats.DF.Value) then
        table.insert(v6, v9);
    end;
end;
local function _() --[[ Line: 16 ]] --[[ Name: checker ]]
    -- upvalues: v5 (copy), v6 (copy)
    if v5:solans() == false then
        for v11 = 1, #v6 do
            if v6[v11] == game.Players.LocalPlayer then
                table.remove(v6, v11);
            end;
        end;
    end;
end;
local v13 = {};
local l_Children_0 = game.ReplicatedStorage.Util.WaterLogia:GetChildren();
for v15 = 1, #l_Children_0 do
    if l_Children_0[v15].Name:match("-") then
        v13[l_Children_0[v15].Name] = require(l_Children_0[v15]);
    end;
end;
local l_Y_0 = workspace.Env.WaterStuff.Falls.Position.Y;
local v17 = 0;
if game.ReplicatedStorage:FindFirstChild("raidMode") or game.ReplicatedStorage:FindFirstChild("tradingHUB") then
    return;
else
    local l_Character_0 = game.Players.LocalPlayer.Character;
    v4.Stats.DF.Changed:Connect(function() --[[ Line: 42 ]]
        -- upvalues: v4 (copy), v6 (copy)
        if v4 and game.ReplicatedStorage.Util.WaterLogia:FindFirstChild(v4.Stats.DF.Value) and table.find(v6, game.Players.LocalPlayer) == nil then
            table.insert(v6, game.Players.LocalPlayer);
        end;
    end);
    local v19 = RaycastParams.new();
    v19.FilterDescendantsInstances = {
        workspace.Effects, 
        workspace.Env.FruitFloors, 
        workspace.CurrentCamera, 
        workspace.NPCs, 
        workspace.PlayerCharacters
    };
    v19.FilterType = Enum.RaycastFilterType.Exclude;
    v19.CollisionGroup = "Default";
    local v20 = nil;
    v20 = game["Run Service"].Heartbeat:Connect(function() --[[ Line: 55 ]]
        -- upvalues: l_Character_0 (copy), v0 (copy), v4 (copy), v17 (ref), v20 (ref), v6 (copy), l_Y_0 (copy), v19 (copy), v13 (copy)
        if l_Character_0:FindFirstChild("HumanoidRootPart") and _G.playerFruitPassiveEnabled and _G.playerFruitPassiveEnabled(v0) == true and v4.Settings.Logia.Value == true then
            local l_Y_1 = l_Character_0.HumanoidRootPart.Position.Y;
            if l_Character_0.Parent == workspace.PlayerCharacters and l_Y_1 < workspace.Env.WaterStuff.Falls.Position.Y and workspace.Env.WaterStuff.Sand.Position.Y - 5 < l_Y_1 and workspace.Env.WaterStuff.Falls.Position.Y - 10 < l_Y_1 and l_Character_0.Parent == workspace.PlayerCharacters and game.ReplicatedStorage.Util.WaterLogia:FindFirstChild(v4.Stats.DF.Value) then
                local v22 = true;
                if (l_Character_0.HumanoidRootPart.Position - Vector3.new(1837.97705078125, 2.690999984741211, -12196.6884765625, 0)).Magnitude < 25 and l_Character_0:FindFirstChild("coatBubble") ~= nil then
                    v22 = false;
                end;
                if l_Character_0:FindFirstChild("inCombat") and l_Character_0.Humanoid:GetAttribute("isRagdolled") == true then
                    v22 = false;
                end;
                if v22 == true then
                    local v23, _, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34 = l_Character_0.HumanoidRootPart.CFrame:components();
                    l_Character_0.HumanoidRootPart.Velocity = Vector3.new();
                    l_Character_0.HumanoidRootPart.CFrame = CFrame.new(v23, workspace.Env.WaterStuff.Falls.Position.Y + l_Character_0.Humanoid.HipHeight * 2.25, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34);
                end;
            end;
        end;
        if tick() - v17 <= 0.1 then
            return;
        else
            v17 = tick();
            if workspace:GetAttribute("DisableFruitFloors") then
                v20:Disconnect();
                v20 = nil;
                return;
            else
                local l_Players_1 = game.Players:GetPlayers();
                for v36 = 1, #l_Players_1 do
                    local v37 = l_Players_1[v36];
                    local l_FirstChild_1 = game.ReplicatedStorage:FindFirstChild("Stats" .. v37.Name);
                    if l_FirstChild_1 and l_FirstChild_1:FindFirstChild("Stats") and l_FirstChild_1:FindFirstChild("Stats"):FindFirstChild("DF") and game.ReplicatedStorage.Util.WaterLogia:FindFirstChild(l_FirstChild_1.Stats.DF.Value) and table.find(v6, v37) == nil then
                        table.insert(v6, v37);
                    end;
                end;
                for v39 = 1, #v6 do
                    local v40 = v6[v39];
                    local _, l_result_0 = pcall(function() --[[ Line: 99 ]]
                        -- upvalues: v40 (copy), l_Y_0 (ref), v19 (ref), v13 (ref), v6 (ref), v39 (copy)
                        if v40 then
                            local l_Character_1 = v40.Character;
                            local l_FirstChild_2 = game.ReplicatedStorage:FindFirstChild("Stats" .. v40.Name);
                            if l_FirstChild_2 == nil then
                                return;
                            else
                                local l_Value_0 = l_FirstChild_2.Stats.DF.Value;
                                if l_FirstChild_2 and v40 and game.ReplicatedStorage.Util.WaterLogia:FindFirstChild(l_Value_0) and l_Character_1 and l_Character_1.Parent ~= nil and l_Character_1:FindFirstChild("HumanoidRootPart") and _G.checkRenderDistance ~= nil and _G.checkRenderDistance(l_Character_1.HumanoidRootPart.Position) and v40.Parent == game.Players then
                                    if _G.playerFruitPassiveEnabled(v40) == false or l_FirstChild_2.Settings.Logia.Value == false then
                                        return;
                                    else
                                        local l_Y_2 = l_Character_1.HumanoidRootPart.Position.Y;
                                        if l_FirstChild_2 and l_Y_0 <= l_Y_2 and l_Y_2 < l_Y_0 + 10 and (l_Character_1.Humanoid.SeatPart == nil or l_Character_1.Humanoid.SeatPart and l_Character_1.Humanoid.SeatPart.Parent:FindFirstChild("Owner")) then
                                            if l_Character_1:FindFirstChild("Rag") and l_Character_1.Rag.Value ~= nil then
                                                return;
                                            elseif (l_Character_1.HumanoidRootPart.Position - Vector3.new(1837.97705078125, 2.690999984741211, -12196.6884765625, 0)).Magnitude < 25 and l_Character_1:FindFirstChild("coatBubble") ~= nil then
                                                return;
                                            elseif l_Character_1.Parent == workspace.Ragdolls and l_Character_1:FindFirstChild("inCombat") then
                                                return;
                                            else
                                                local v45 = CFrame.new(l_Character_1.HumanoidRootPart.Position);
                                                local v46 = workspace:Raycast(v45.Position, v45.UpVector * -15, v19);
                                                local v47 = nil;
                                                local v48 = nil;
                                                if v46 then
                                                    v47 = v46.Instance;
                                                    v48 = v46.Position;
                                                else
                                                    v48 = Vector3.new(l_Character_1.HumanoidRootPart.Position.X, l_Y_0, l_Character_1.HumanoidRootPart.Position.Z);
                                                end;
                                                if v46 == nil or v46 and (v47 == nil or v48.Y <= l_Y_0) and game.ReplicatedStorage.Util.WaterLogia:FindFirstChild(l_Value_0) and l_Character_1.HumanoidRootPart.Position.Y >= l_Y_0 then
                                                    v13[l_Value_0]:start(v40, CFrame.new(v48));
                                                    return;
                                                end;
                                            end;
                                        end;
                                    end;
                                elseif l_Character_1 == nil or v40.Parent ~= game.Players then
                                    table.remove(v6, v39);
                                end;
                            end;
                        end;
                    end);
                    if l_result_0 then
                        warn("er " .. l_result_0);
                    end;
                end;
                return;
            end;
        end;
    end);
    return;
end;