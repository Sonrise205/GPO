local _ = game:GetService("ReplicatedStorage");
local l_ReplicatedStorage_1 = game:GetService("ReplicatedStorage");
local l_LocalPlayer_0 = game.Players.LocalPlayer;
if not l_LocalPlayer_0.Character then
    local _ = l_LocalPlayer_0.CharacterAdded:Wait();
end;
local l_NPCs_0 = workspace.NPCs;
local v5 = require(game.ReplicatedStorage.Modules.NPCInteractions);
local v6 = v5:getquests();
local v7 = require(l_ReplicatedStorage_1.Modules.Shared.Signals.GoodSignal).new();
local _ = function(v8) --[[ Line: 19 ]] --[[ Name: ValidateTalkingNPC ]]
    -- upvalues: v6 (copy)
    if v6[v8.Name] then
        return true;
    else
        for _, v10 in v6 do
            if v10.NPC == v8.Name then
                return true;
            end;
        end;
        return false;
    end;
end;
local function v14(v12, v13) --[[ Line: 31 ]] --[[ Name: CanInteractWithNPC ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    if v12:FindFirstChild("busy") then
        warn("Busy NPC");
        return false;
    elseif v12:FindFirstChild("Info") then
        if v12.Info.Hostile.Value == true and v12.Info:FindFirstChild("RoamingNPC") == nil then
            warn("NPC is hostile");
            return false;
        elseif v12.Info:FindFirstChild("RoamingNPC") and not v12.Info.RoamingNPC.Value then
            warn("Not roaming npc??");
            return false;
        elseif (v12.LowerTorso.Position - l_LocalPlayer_0.Character.HumanoidRootPart.Position).Magnitude >= v13 + 10 then
            warn("Too far away");
            return false;
        elseif game.Players.LocalPlayer.Character and _G.canuse == false then
            _G.displayMessage("<Color=Red>You are stunned, cant interact with NPCs!");
            return false;
        else
            return true;
        end;
    else
        warn("No Info Folder in NPC");
        return false;
    end;
end;
local function v27(v15) --[[ Line: 71 ]] --[[ Name: AddPrompt ]]
    -- upvalues: v6 (copy), v7 (copy), l_LocalPlayer_0 (copy), v14 (copy), v5 (copy)
    local v16 = false;
    local v17;
    if v6[v15.Name] then
        v17 = true;
    else
        for _, v19 in v6 do
            if v19.NPC == v15.Name then
                v17 = true;
                v16 = true;
            end;
            if v16 then
                break;
            end;
        end;
        if not v16 then
            v17 = false;
        end;
    end;
    v16 = false;
    if not v17 then
        return;
    else
        v17 = v15:WaitForChild("Info", 60);
        local l_UpperTorso_0 = v15:WaitForChild("UpperTorso");
        task.wait(1);
        local v21 = script.Prompt:Clone();
        v21.MaxActivationDistance = 3 + v15:GetModelSize().Magnitude / 2;
        v21.ObjectText = v15.Name;
        if v15.Name == "Robo" then
            v21.ActionText = "Set Spawn";
        end;
        v21.Parent = l_UpperTorso_0;
        local v22 = nil;
        local function v23() --[[ Line: 84 ]] --[[ Name: updateVisible ]]
            -- upvalues: v22 (ref), v7 (ref), v23 (copy), v17 (copy), l_LocalPlayer_0 (ref), v21 (copy)
            if v22 then
                v22:Disconnect();
                v22 = nil;
            end;
            v22 = v7:Connect(v23);
            local l_Hostile_0 = v17:FindFirstChild("Hostile");
            local l_Character_0 = l_LocalPlayer_0.Character;
            if not l_Character_0 then
                return;
            elseif (l_Hostile_0 and l_Hostile_0.Value == false or v17:FindFirstChild("RoamingNPC") and v17:FindFirstChild("RoamingNPC").Value == true) and _G.canuse == true and (_G.check:inspect(l_Character_0) == true or l_Character_0:FindFirstChild("Barrel") or l_Character_0:FindFirstChild("ragcarry")) then
                v21.Enabled = true;
                return;
            else
                v21.Enabled = false;
                return;
            end;
        end;
        v21.Triggered:Connect(function() --[[ Line: 103 ]]
            -- upvalues: v14 (ref), v15 (copy), v21 (copy), v5 (ref)
            if not v14(v15, v21.MaxActivationDistance) then
                warn("Cannot interact with NPC");
                return;
            elseif _G.UIEnabled == false then
                return;
            else
                v21.Enabled = false;
                task.spawn(function() --[[ Line: 111 ]]
                    game.ReplicatedStorage.Events.Quest:InvokeServer({
                        "npcChat", 
                        true
                    });
                end);
                v5:startchat(v15);
                v21.Enabled = true;
                game.ReplicatedStorage.Events.Quest:InvokeServer({
                    "npcChat", 
                    false
                });
                return;
            end;
        end);
        v21.PromptShown:Connect(v23);
        v23();
        task.spawn(function() --[[ Line: 123 ]]
            -- upvalues: v17 (copy), v23 (copy)
            local v26 = v17:WaitForChild("Hostile", 3);
            if v26 then
                v26.Changed:Connect(v23);
            end;
        end);
        v21.Destroying:Connect(function() --[[ Line: 130 ]]
            -- upvalues: v22 (ref)
            if v22 then
                v22:Disconnect();
            end;
        end);
        return;
    end;
end;
for _, v29 in l_NPCs_0:GetChildren() do
    task.spawn(v27, v29);
end;
l_NPCs_0.ChildAdded:Connect(v27);
local l_canuse_0 = _G.canuse;
local v31 = false;
while true do
    task.wait(0.1);
    local l_Character_1 = l_LocalPlayer_0.Character;
    if _G.check and l_Character_1 then
        local v33 = _G.check:inspect(l_Character_1);
        if v31 ~= v33 then
            v31 = v33;
        end;
        v7:Fire();
    end;
    if l_canuse_0 ~= _G.canuse then
        l_canuse_0 = _G.canuse;
        v7:Fire();
    end;
end;