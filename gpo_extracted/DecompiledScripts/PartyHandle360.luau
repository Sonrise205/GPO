repeat
    task.wait();
until game.Players.LocalPlayer;
local l_LocalPlayer_0 = game.Players.LocalPlayer;
l_LocalPlayer_0:WaitForChild("Party");
local v1 = {};
local v2 = 0;
local l_partyMembers_0 = l_LocalPlayer_0.PlayerGui:WaitForChild("globalFeed"):WaitForChild("partyMembers");
local function v6() --[[ Line: 10 ]] --[[ Name: clearPartyUI ]]
    -- upvalues: l_partyMembers_0 (copy)
    local l_l_partyMembers_0_Children_0 = l_partyMembers_0:GetChildren();
    for v5 = 1, #l_l_partyMembers_0_Children_0 do
        if l_l_partyMembers_0_Children_0[v5]:IsA("Frame") then
            l_l_partyMembers_0_Children_0[v5]:Destroy();
        end;
    end;
end;
local _ = function(v7) --[[ Line: 18 ]] --[[ Name: countTable ]]
    local v8 = 0;
    for _, _ in pairs(v7) do
        v8 = v8 + 1;
    end;
    return v8;
end;
game["Run Service"].Heartbeat:Connect(function() --[[ Line: 26 ]]
    -- upvalues: l_LocalPlayer_0 (copy), v1 (copy), v2 (ref), v6 (copy), l_partyMembers_0 (copy)
    local v12 = nil;
    if l_LocalPlayer_0.Party.Value ~= nil then
        v12 = game.ReplicatedStorage.currentParty:FindFirstChild(l_LocalPlayer_0.Party.Value.Name);
    end;
    local l_v1_0 = v1;
    local v14 = 0;
    for _, _ in pairs(l_v1_0) do
        v14 = v14 + 1;
    end;
    if v14 > 0 and v12 ~= nil then
        for v17, v18 in v1 do
            if v12:FindFirstChild(v18.Name) == nil or game.Players:FindFirstChild(v18.Name) == nil then
                pcall(function() --[[ Line: 34 ]]
                    -- upvalues: v17 (copy)
                    v17:Destroy();
                end);
                v1[v17] = nil;
            end;
        end;
    end;
    if tick() - v2 < 1 then
        return;
    else
        v2 = tick();
        if l_LocalPlayer_0.Party.Value ~= nil then
            local _ = l_LocalPlayer_0.Party.Value;
            if v12 == nil then
                v6();
                return;
            else
                l_v1_0 = v12:GetChildren();
                for v20 = 1, #l_v1_0 do
                    local l_FirstChild_0 = game.Players:FindFirstChild(l_v1_0[v20].Name);
                    local v22 = l_v1_0[v20];
                    if l_FirstChild_0 then
                        local l_Character_0 = l_FirstChild_0.Character;
                        if l_Character_0 and l_Character_0 ~= game.Players.LocalPlayer.Character then
                            local l_FirstChild_1 = game.Players.LocalPlayer.PlayerGui.HealthBars:FindFirstChild(l_FirstChild_0.Name .. "PartyCircle");
                            if l_FirstChild_1 == nil then
                                local v25 = script.PartyCircle:Clone();
                                v25.targetPlayer.Value = l_FirstChild_0;
                                v25.Name = l_FirstChild_0.Name .. "PartyCircle";
                                v25.Parent = game.Players.LocalPlayer.PlayerGui.HealthBars;
                                v25.LocalScript.Disabled = false;
                                local l_v25_0 = v25 --[[ copy: 10 -> 11 ]];
                                task.spawn(function() --[[ Line: 71 ]]
                                    -- upvalues: l_v1_0 (copy), v20 (copy), l_v25_0 (copy)
                                    local v27 = l_v1_0[v20]:WaitForChild("playerColor", 10);
                                    if v27 == nil then
                                        return;
                                    else
                                        l_v25_0.Frame.BackgroundColor3 = v27.Value;
                                        l_v25_0.Frame.UIGradient.Color = ColorSequence.new(v27.Value);
                                        return;
                                    end;
                                end);
                                v1[v25] = l_FirstChild_0;
                            else
                                l_FirstChild_1.targetPlayer.Value = l_FirstChild_0;
                            end;
                            if l_partyMembers_0 ~= nil and l_partyMembers_0:FindFirstChild(l_FirstChild_0.Name) == nil and v22:FindFirstChild("playerColor") then
                                local v28 = script.Health:Clone();
                                v28.Name = l_FirstChild_0.Name;
                                v28.Bars.LocalScript.char.Value = l_Character_0;
                                v28.TextLabel.Text = l_FirstChild_0.Name;
                                v28.playerColor.BackgroundColor3 = v22.playerColor.Value;
                                v28.Parent = l_partyMembers_0;
                                v28.Bars.LocalScript.Disabled = false;
                            end;
                        end;
                    end;
                end;
                if v12 then
                    v14 = l_partyMembers_0:GetChildren();
                    for v29 = 1, #v14 do
                        if v14[v29]:IsA("Frame") and v12:FindFirstChild(string.gsub(v14[v29].Name, "PartyCircle", "")) == nil then
                            v14[v29]:Destroy();
                        end;
                    end;
                    return;
                end;
            end;
        else
            l_v1_0 = v1;
            v14 = 0;
            for _, _ in pairs(l_v1_0) do
                v14 = v14 + 1;
            end;
            if v14 > 0 then
                for v32, _ in v1 do
                    pcall(function() --[[ Line: 109 ]]
                        -- upvalues: v32 (copy)
                        v32:Destroy();
                    end);
                    v1[v32] = nil;
                end;
                v6();
                table.clear(v1);
            end;
        end;
        return;
    end;
end);