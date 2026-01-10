local _, _, _, _ = require(game.ReplicatedStorage.Modules.ScriptSet).get();
repeat
    task.wait();
until game.Players.LocalPlayer.PlayerGui;
repeat
    task.wait();
until game.Players.LocalPlayer.PlayerGui:FindFirstChild("HealthBars");
repeat
    task.wait();
until game.Players.LocalPlayer.Character;
task.wait(2);
local v4 = require(script.HealthBar);
local v5 = require(script.NPCAnimation);
local v6 = {};
local function v16(v7) --[[ Line: 10 ]] --[[ Name: setupaniamtion ]]
    -- upvalues: v5 (copy)
    if v7:WaitForChild("Info", 3) == nil then
        return;
    else
        local l_Info_0 = v7:FindFirstChild("Info");
        if l_Info_0:FindFirstChild("SeaNPC") ~= nil then
            return;
        else
            v7:WaitForChild("Humanoid");
            if l_Info_0 == nil then
                return;
            elseif l_Info_0:FindFirstChild("AnimationStyle") == nil then
                return;
            else
                v5:animate(v7, l_Info_0.AnimationStyle.Value);
                if v7.Humanoid:IsA("Humanoid") and v7.Humanoid:GetAttribute("deadSet") == nil then
                    v7.Humanoid:SetAttribute("deadSet", true);
                    local v9 = nil;
                    do
                        local l_v9_0 = v9;
                        l_v9_0 = v7.Humanoid.HealthChanged:Connect(function(v11) --[[ Line: 31 ]]
                            -- upvalues: v7 (copy), l_v9_0 (ref)
                            if v11 > 0 then
                                return;
                            else
                                local l_damageHighlight_0 = v7:FindFirstChild("damageHighlight");
                                if l_damageHighlight_0 then
                                    l_damageHighlight_0:Destroy();
                                end;
                                l_v9_0:Disconnect();
                                l_v9_0 = nil;
                                local l_v7_Descendants_0 = v7:GetDescendants();
                                for v14 = 1, #l_v7_Descendants_0 do
                                    if l_v7_Descendants_0[v14]:IsA("BasePart") then
                                        l_v7_Descendants_0[v14].Transparency = 1;
                                        l_v7_Descendants_0[v14].Anchored = true;
                                        if l_v7_Descendants_0[v14].Parent == v7 then
                                            local v15 = script.ParticleEmitter:Clone();
                                            v15.Name = "deathVFX";
                                            v15.Parent = l_v7_Descendants_0[v14];
                                            _G.customEmit(v15);
                                            _G.destroy(v15, 1);
                                        end;
                                    elseif l_v7_Descendants_0[v14]:IsA("ParticleEmitter") and l_v7_Descendants_0[v14].Name ~= "deathVFX" and l_v7_Descendants_0[v14].Enabled == true then
                                        l_v7_Descendants_0[v14]:Clear();
                                        l_v7_Descendants_0[v14]:Destroy();
                                    elseif l_v7_Descendants_0[v14]:IsA("BillboardGui") or l_v7_Descendants_0[v14]:IsA("Beam") or l_v7_Descendants_0[v14]:IsA("Decal") then
                                        l_v7_Descendants_0[v14]:Destroy();
                                    end;
                                end;
                                return;
                            end;
                        end);
                    end;
                end;
                return;
            end;
        end;
    end;
end;
local l_Children_0 = workspace.NPCs:GetChildren();
for v18 = 1, #l_Children_0 do
    task.spawn(v16, l_Children_0[v18]);
end;
local l_NPCCache_0 = game.ReplicatedStorage:FindFirstChild("NPCCache");
workspace.NPCs.ChildAdded:Connect(function(v20) --[[ Line: 73 ]]
    -- upvalues: v16 (copy)
    local v21 = v20:WaitForChild("Info", 10);
    if v21 == nil then
        return;
    else
        local _ = v20:WaitForChild("HumanoidRootPart", 10);
        if v21 == nil then
            return;
        elseif v21:FindFirstChild("SeaNPC") ~= nil then
            return;
        else
            if v20:FindFirstChild("animated") then
                v20:FindFirstChild("animated"):Destroy();
            end;
            v16(v20);
            return;
        end;
    end;
end);
workspace.NPCs.ChildRemoved:Connect(function(v23) --[[ Line: 92 ]]
    -- upvalues: v6 (copy), v5 (copy)
    if v23:FindFirstChild("animated") then
        v23:FindFirstChild("animated"):Destroy();
    end;
    if v6[v23] then
        v6[v23]:Stop();
        v6[v23]:Destroy();
        v6[v23] = nil;
    end;
    pcall(function() --[[ Line: 102 ]]
        -- upvalues: v23 (copy)
        local l_v23_Descendants_0 = v23:GetDescendants();
        for v25 = 1, #l_v23_Descendants_0 do
            if l_v23_Descendants_0[v25]:IsA("BodyVelocity") or l_v23_Descendants_0[v25]:IsA("BodyGyro") then
                l_v23_Descendants_0[v25]:Destroy();
            end;
        end;
    end);
    pcall(function() --[[ Line: 110 ]]
        -- upvalues: v5 (ref), v23 (copy)
        v5:remove(v23);
    end);
end);
local v26 = {};
local function v27(v28) --[[ Line: 116 ]] --[[ Name: tagBar ]]
    -- upvalues: v26 (copy), v27 (copy)
    v28:WaitForChild("Head", 300);
    local v29 = script.NPCAnimation.Overhead:Clone();
    v29.Name = v28.Name;
    v29.NameT.Text = v28.Name;
    v29.Health.Frame.Script.char.Value = v28;
    v29.Adornee = v28.Head;
    v29.Parent = game.Players.LocalPlayer.PlayerGui.HealthBars;
    v29.Health.Frame.Script.Disabled = false;
    local v30 = Instance.new("ObjectValue", v28.Head);
    v30.Name = "Overhead";
    v30.Value = v29;
    table.insert(v26, {
        v28, 
        v29
    });
    local v31 = nil;
    v31 = v28.ChildAdded:Connect(function(v32) --[[ Line: 131 ]]
        -- upvalues: v26 (ref), v28 (copy), v31 (ref), v27 (ref)
        if v32.Name == "Head" then
            for v33 = 1, #v26 do
                pcall(function() --[[ Line: 134 ]]
                    -- upvalues: v26 (ref), v33 (copy), v28 (ref)
                    local v34, v35 = unpack(v26[v33]);
                    if v34 == v28 then
                        v35:Destroy();
                        table.remove(v26, v33);
                    end;
                end);
            end;
            v31:Disconnect();
            v31 = nil;
            v27(v28);
        end;
    end);
end;
local function v38(v36) --[[ Line: 149 ]] --[[ Name: setupHp ]]
    -- upvalues: v4 (copy)
    if v36:FindFirstChild("noOverhead") then
        return;
    else
        if v36 == game.Players.LocalPlayer.Character or v36.Name == game.Players.LocalPlayer.Character.Name then
            local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. game.Players.LocalPlayer.Name);
            if l_FirstChild_0 and l_FirstChild_0.Settings.ShowLocalPlayerBar.Value == false then
                return;
            end;
        end;
        v4:addBar(v36);
        return;
    end;
end;
workspace.PlayerCharacters.ChildAdded:Connect(function(v39) --[[ Line: 163 ]]
    -- upvalues: v38 (copy)
    v38(v39);
end);
local l_Children_1 = workspace.PlayerCharacters:GetChildren();
for v41 = 1, #l_Children_1 do
    if l_Children_1[v41]:IsA("Model") then
        print("estting for " .. l_Children_1[v41].Name);
        v38(l_Children_1[v41]);
    end;
end;
game.ReplicatedStorage.Events.clientCommand.OnClientEvent:Connect(function(v42, v43) --[[ Line: 177 ]]
    local l_Children_2 = game.Players.LocalPlayer.PlayerGui.HealthBars:GetChildren();
    for v45 = 1, #l_Children_2 do
        if l_Children_2[v45].Name == v42 then
            l_Children_2[v45].Health.Frame.Script.playerName.Value = v43;
            warn("CHANGED NAME!!");
        end;
    end;
end);
local _ = require(game.ReplicatedStorage.Modules.NPCInteractions):getquests();
if l_NPCCache_0 == nil then
    Instance.new("Folder", game.ReplicatedStorage).Name = "NPCCache";
end;
local _ = {};
local _ = {};