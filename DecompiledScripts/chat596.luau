repeat
    task.wait();
until game.Players.LocalPlayer ~= nil and game.Players.LocalPlayer.Character ~= nil;
local l_Chat_0 = game:GetService("Chat");
local v1 = {};
local function v2() --[[ Line: 12 ]] --[[ Name: update ]]
    -- upvalues: l_Chat_0 (copy), v1 (copy)
    l_Chat_0:SetBubbleChatSettings({
        BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
        TextColor3 = Color3.fromRGB(48, 48, 48), 
        MaxDistance = 80, 
        CornerRadius = UDim.new(1, 0), 
        CornerEnabled = true, 
        AdorneeName = "HumanoidRootPart", 
        LocalPlayerStudsOffset = Vector3.new(0, 1, 0, 0), 
        VerticalStudsOffset = 1, 
        SizeAnimation = {
            SpringDampingRatio = 0.25
        }, 
        TransparencyAnimation = {
            SpringFrequency = 2
        }, 
        UserSpecificSettings = v1
    });
end;
local function _(v3) --[[ Line: 32 ]] --[[ Name: playerUpdate ]]
    -- upvalues: v1 (copy)
    task.spawn(function() --[[ Line: 33 ]]
        -- upvalues: v3 (copy), v1 (ref)
        local v4 = game.ReplicatedStorage:WaitForChild("Stats" .. v3.Name, 600);
        if v4 then
            v4:WaitForChild("Stats", 10):WaitForChild("DF");
            local function v7() --[[ Line: 37 ]] --[[ Name: check ]]
                -- upvalues: v4 (copy), v3 (ref), v1 (ref)
                if v4:FindFirstChild("Stats") == nil then
                    return;
                else
                    local v5 = Vector3.new(0, 1, 1, 0);
                    local v6 = 1;
                    if v4.Stats.DF.Value == "Tori-Tori" then
                        v5 = Vector3.new(0, 1, -25, 0);
                    end;
                    if v3 ~= game.Players.LocalPlayer then
                        v6 = v6 + 2;
                    end;
                    if v1[v3.UserId] == nil then
                        v1[v3.UserId] = {
                            VerticalStudsOffset = v6
                        };
                    end;
                    v1[v3.UserId].LocalPlayerStudsOffset = v5;
                    v1[v3.UserId].VerticalStudsOffset = v6;
                    return;
                end;
            end;
            v7();
            v4.Stats.DF.Changed:Connect(v7);
        end;
    end);
end;
local function _(v9) --[[ Line: 61 ]] --[[ Name: playerRemoved ]]
    -- upvalues: v1 (copy)
    if v1[v9.UserId] then
        v1[v9.UserId] = nil;
    end;
end;
game.Players.PlayerAdded:Connect(function(v11) --[[ Line: 67 ]]
    -- upvalues: v1 (copy), v2 (copy)
    task.spawn(function() --[[ Line: 33 ]]
        -- upvalues: v11 (copy), v1 (ref)
        local v12 = game.ReplicatedStorage:WaitForChild("Stats" .. v11.Name, 600);
        if v12 then
            v12:WaitForChild("Stats", 10):WaitForChild("DF");
            local function v15() --[[ Line: 37 ]] --[[ Name: check ]]
                -- upvalues: v12 (copy), v11 (ref), v1 (ref)
                if v12:FindFirstChild("Stats") == nil then
                    return;
                else
                    local v13 = Vector3.new(0, 1, 1, 0);
                    local v14 = 1;
                    if v12.Stats.DF.Value == "Tori-Tori" then
                        v13 = Vector3.new(0, 1, -25, 0);
                    end;
                    if v11 ~= game.Players.LocalPlayer then
                        v14 = v14 + 2;
                    end;
                    if v1[v11.UserId] == nil then
                        v1[v11.UserId] = {
                            VerticalStudsOffset = v14
                        };
                    end;
                    v1[v11.UserId].LocalPlayerStudsOffset = v13;
                    v1[v11.UserId].VerticalStudsOffset = v14;
                    return;
                end;
            end;
            v15();
            v12.Stats.DF.Changed:Connect(v15);
        end;
    end);
    v2();
end);
game.Players.PlayerRemoving:Connect(function(v16) --[[ Line: 72 ]]
    -- upvalues: v1 (copy), v2 (copy)
    if v1[v16.UserId] then
        v1[v16.UserId] = nil;
    end;
    v2();
end);
local l_Players_0 = game.Players:GetPlayers();
for v18 = 1, #l_Players_0 do
    local v19 = l_Players_0[v18];
    task.spawn(function() --[[ Line: 33 ]]
        -- upvalues: v19 (copy), v1 (copy)
        local v20 = game.ReplicatedStorage:WaitForChild("Stats" .. v19.Name, 600);
        if v20 then
            v20:WaitForChild("Stats", 10):WaitForChild("DF");
            local function v23() --[[ Line: 37 ]] --[[ Name: check ]]
                -- upvalues: v20 (copy), v19 (ref), v1 (ref)
                if v20:FindFirstChild("Stats") == nil then
                    return;
                else
                    local v21 = Vector3.new(0, 1, 1, 0);
                    local v22 = 1;
                    if v20.Stats.DF.Value == "Tori-Tori" then
                        v21 = Vector3.new(0, 1, -25, 0);
                    end;
                    if v19 ~= game.Players.LocalPlayer then
                        v22 = v22 + 2;
                    end;
                    if v1[v19.UserId] == nil then
                        v1[v19.UserId] = {
                            VerticalStudsOffset = v22
                        };
                    end;
                    v1[v19.UserId].LocalPlayerStudsOffset = v21;
                    v1[v19.UserId].VerticalStudsOffset = v22;
                    return;
                end;
            end;
            v23();
            v20.Stats.DF.Changed:Connect(v23);
        end;
    end);
end;
v2();
local l_TextChatService_0 = game:GetService("TextChatService");
l_TextChatService_0.MessageReceived:Connect(function(v25) --[[ Line: 87 ]]
    local l_TextSource_0 = v25.TextSource;
    local l_Text_0 = v25.Text;
    if l_TextSource_0 and l_TextSource_0.Name == game.Players.LocalPlayer.Name then
        if l_Text_0 == "/hideChat" then
            game:GetService("TextChatService").ChatWindowConfiguration.Enabled = false;
            return;
        elseif l_Text_0 == "/showChat" then
            game:GetService("TextChatService").ChatWindowConfiguration.Enabled = true;
        end;
    end;
end);
local l_Players_1 = game:GetService("Players");
local v29 = require(game.ReplicatedStorage.Modules.Titles);
l_TextChatService_0.OnIncomingMessage = function(v30) --[[ Line: 102 ]]
    -- upvalues: l_Players_1 (copy), v29 (copy)
    local l_TextChatMessageProperties_0 = Instance.new("TextChatMessageProperties");
    if v30.TextSource then
        local l_l_Players_1_PlayerByUserId_0 = l_Players_1:GetPlayerByUserId(v30.TextSource.UserId);
        local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. l_l_Players_1_PlayerByUserId_0.Name);
        local v34 = "";
        if l_l_Players_1_PlayerByUserId_0:GetAttribute("partyChat") and l_l_Players_1_PlayerByUserId_0.Party.Value == game.Players.LocalPlayer.Party.Value and l_l_Players_1_PlayerByUserId_0.Party.Value ~= nil then
            v34 = "<b>[PARTY]</b> ";
        end;
        if l_FirstChild_0 and l_FirstChild_0.Titles.EquipedTitle.Value ~= "" then
            local l_Value_0 = l_FirstChild_0.Titles.EquipedTitle.Value;
            local v36 = Color3.fromRGB(0, 0, 0);
            if v29[l_Value_0] then
                v36 = v29[l_Value_0].RoleColor;
            end;
            local v37 = "";
            local v38 = "";
            if v29[l_Value_0] and v29[l_Value_0].StartText ~= nil then
                v37 = v29[l_Value_0].StartText .. v37;
                v38 = v38 .. v29[l_Value_0].EndText;
            end;
            l_TextChatMessageProperties_0.PrefixText = v34 .. ("<font color=\"#" .. tostring(v36:ToHex()) .. "\"><b>" .. "[" .. l_Value_0 .. "]" .. "</b></font>") .. " " .. v30.PrefixText;
            return l_TextChatMessageProperties_0;
        else
            l_TextChatMessageProperties_0.PrefixText = v34 .. v30.PrefixText;
        end;
    end;
    return l_TextChatMessageProperties_0;
end;