local v0 = {};
local v1 = require(game.ReplicatedStorage.Modules.RichText);
local _ = {};
local v3 = nil;
if game["Run Service"]:IsServer() == false then
    v3 = require(game.ReplicatedStorage.Modules.MEnterLeave);
end;
local v4 = {};
local l_Descendants_0 = script.Talks:GetDescendants();
for v6 = 1, #l_Descendants_0 do
    if l_Descendants_0[v6]:IsA("ModuleScript") then
        task.spawn(function() --[[ Line: 13 ]]
            -- upvalues: v4 (copy), l_Descendants_0 (copy), v6 (copy)
            v4[l_Descendants_0[v6].Name] = require(l_Descendants_0[v6]);
        end);
    end;
end;
local function _(v7) --[[ Line: 19 ]] --[[ Name: convertRGB ]]
    local v8 = Color3.fromRGB(v7);
    return (tostring(v8.r .. "," .. v8.g .. "," .. v8.b));
end;
local function _(v10, v11, v12) --[[ Line: 24 ]] --[[ Name: questHandle ]]
    if v12 == nil then
        v12 = game.Players.LocalPlayer;
    end;
    local l_FirstChild_0 = game.ReplicatedStorage:FindFirstChild("Stats" .. v12.Name);
    if l_FirstChild_0 == nil then
        return;
    else
        if v11 == "takequest" and l_FirstChild_0.Quest.CurrentQuest.Value == "None" then
            game.ReplicatedStorage.Events.Quest:InvokeServer({
                "takequest", 
                v10
            });
        end;
        return;
    end;
end;
local function v21(v15, v16) --[[ Line: 37 ]] --[[ Name: button ]]
    if v16 == true then
        local v17 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0);
        local v18 = {
            Size = script.ScreenGui.Frame.go.Size, 
            TextTransparency = 0
        };
        game:GetService("TweenService"):Create(v15, v17, v18):Play();
        return;
    else
        local v19 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0);
        local v20 = {
            Size = UDim2.new(0, 0, script.ScreenGui.Frame.go.Size.Y.Scale, 0), 
            TextTransparency = 1
        };
        game:GetService("TweenService"):Create(v15, v19, v20):Play();
        v15.Text = "";
        return;
    end;
end;
local function v29(v22) --[[ Line: 56 ]] --[[ Name: buttoneffects ]]
    -- upvalues: v3 (ref)
    local v23, v24 = v3.MouseEnterLeaveEvent(v22);
    v23:Connect(function() --[[ Line: 58 ]]
        -- upvalues: v22 (copy)
        local v25 = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0);
        local v26 = {
            ImageTransparency = 0.25
        };
        game:GetService("TweenService"):Create(v22.ImageLabel, v25, v26):Play();
    end);
    v24:Connect(function() --[[ Line: 66 ]]
        -- upvalues: v22 (copy)
        local v27 = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0);
        local v28 = {
            ImageTransparency = 0.5
        };
        game:GetService("TweenService"):Create(v22.ImageLabel, v27, v28):Play();
    end);
end;
local function v35(v30, v31) --[[ Line: 76 ]] --[[ Name: questCompleted ]]
    local v32 = false;
    local v33 = game:GetService("HttpService"):JSONDecode(v30.Quest.CompletedQuests.Value);
    for v34 = 1, #v33 do
        if v33[v34] == v31 then
            return true;
        end;
    end;
    return v32;
end;
local function v41(v36) --[[ Line: 89 ]] --[[ Name: fadetext ]]
    local l_v36_Descendants_0 = v36:GetDescendants();
    for v38 = 1, #l_v36_Descendants_0 do
        if l_v36_Descendants_0[v38]:IsA("TextLabel") then
            local v39 = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0);
            local v40 = {
                TextTransparency = 1
            };
            game:GetService("TweenService"):Create(l_v36_Descendants_0[v38], v39, v40):Play();
        end;
    end;
end;
local function v48(v42, v43) --[[ Line: 103 ]] --[[ Name: checkItemAmmount ]]
    local v44 = 0;
    local l_FirstChild_1 = game.ReplicatedStorage:FindFirstChild("Stats" .. v42.Name);
    for v46, v47 in (game:GetService("HttpService"):JSONDecode(l_FirstChild_1.Inventory.Inventory.Value)) do
        if v46 == v43 then
            v44 = v47;
        end;
    end;
    return v44;
end;
deepcopy = function(v49) --[[ Line: 115 ]] --[[ Name: deepcopy ]]
    local v50 = type(v49);
    local v51 = nil;
    if v50 == "table" then
        v51 = {};
        for v52, v53 in next, v49 do
            v51[deepcopy(v52)] = deepcopy(v53);
        end;
        setmetatable(v51, deepcopy((getmetatable(v49))));
        return v51;
    else
        return v49;
    end;
end;
local function v61(v54, v55) --[[ Line: 130 ]] --[[ Name: shallowCopy ]]
    local v56 = v55 or {};
    local v57 = type(v54);
    local v58 = nil;
    if v57 == "table" then
        if v56[v54] then
            return v56[v54];
        else
            v58 = {};
            v56[v54] = v58;
            for v59, v60 in next, v54 do
                v58[deepcopy(v59, v56)] = deepcopy(v60, v56);
            end;
            setmetatable(v58, deepcopy(getmetatable(v54), v56));
            return v58;
        end;
    else
        return v54;
    end;
end;
local l_UserInputService_0 = game:GetService("UserInputService");
local _ = require(game.ReplicatedStorage.Modules.ToolDesc);
v0.startchat = function(_, v65, v66, v67, v68, v69, v70, v71) --[[ Line: 152 ]] --[[ Name: startchat ]]
    -- upvalues: v61 (copy), v4 (copy), v48 (copy), v29 (copy), v1 (copy), v35 (copy), l_UserInputService_0 (copy), v21 (copy), v41 (copy)
    if v65 == nil then
        v65 = game.Players.LocalPlayer.Character;
    end;
    local v72 = v61(v4);
    local v73 = nil;
    if v67 == nil then
        v73 = v72[v65.Name];
    end;
    local l_v70_0 = v70;
    if v66 == true and v70 then
        local v75 = require(game.ReplicatedStorage.Modules.ToolDesc);
        if v75[v67].Max then
            local v76 = v48(game.Players.LocalPlayer, v67);
            if v76 + v70 > v75[v67].Max then
                l_v70_0 = v70 - math.abs(v75[v67].Max - (v76 + v70));
            end;
        end;
    end;
    if v70 == nil then
        v70 = 0;
        l_v70_0 = 0;
    end;
    if v71 == nil then
        v71 = 0;
    end;
    if v66 then
        warn("IS A BUY ITEM");
        v73 = {
            TalkAmmount = 2, 
            NPC = "Shop", 
            Talk1 = {
                Text = "Would you like to purchase a <Color=Green>" .. v67 .. "<Color=/> for <Color=255,255,126>" .. v68 .. " Peli<Color=/>?", 
                go = "Yes", 
                stop = "No", 
                stoptext = "...", 
                endtext = false
            }, 
            Talk5 = {
                Text = "Would you like to purchase <Color=Blue>" .. v70 .. " <Color=/><Color=Green>" .. v67 .. "s" .. "<Color=/> for <Color=255,255,126>" .. v68 .. " Peli<Color=/>?", 
                go = "Yes", 
                stop = "No", 
                stoptext = "...", 
                endtext = false
            }, 
            Talk52 = {
                Text = "You've bought " .. l_v70_0 .. " <AnimateStyle=Rainbow><AnimateStepFrequency=1><AnimateStyleTime=0.5>" .. v67 .. "s" .. "<AnimateStyle=/><AnimateStepFrequency=/><AnimateStyleTime=/><Color=/>!", 
                go = "..", 
                stop = "..", 
                stoptext = "...", 
                endtext = true, 
                excu = function(_) --[[ Line: 205 ]] --[[ Name: excu ]]
                    -- upvalues: v69 (copy)
                    script.Item_Box_Get2:Play();
                    game.ReplicatedStorage.Events.Shop:InvokeServer(v69);
                end
            }, 
            Talk2 = {
                Text = "You've bought a <AnimateStyle=Rainbow><AnimateStepFrequency=1><AnimateStyleTime=0.5>" .. v67 .. "<AnimateStyle=/><AnimateStepFrequency=/><AnimateStyleTime=/><Color=/>!", 
                go = "..", 
                stop = "..", 
                stoptext = "...", 
                endtext = true, 
                excu = function(_) --[[ Line: 216 ]] --[[ Name: excu ]]
                    -- upvalues: v69 (copy)
                    script.Item_Box_Get2:Play();
                    game.ReplicatedStorage.Events.Shop:InvokeServer(v69, 1);
                end
            }, 
            Talk4 = {
                Text = "<Color=Red>You have reached the maxium ammount of copies you can have for this item.<Color=/><AnimateYield=1>", 
                go = "..", 
                stop = "..", 
                stoptext = "...", 
                endtext = true
            }, 
            HowMany = {
                Text = "", 
                go = "", 
                stop = "", 
                stoptext = "", 
                endtext = true, 
                yield = true, 
                excu = function(_) --[[ Line: 235 ]] --[[ Name: excu ]]
                    -- upvalues: v67 (copy), v69 (copy)
                    local v80 = script.Shop:Clone();
                    v80.LocalScript:SetAttribute("Item", v67);
                    v80.LocalScript.itemProp.Value = v69;
                    v80.Parent = game.Players.LocalPlayer.PlayerGui;
                    repeat
                        task.wait();
                    until v80.LocalScript.done.Value == true;
                end
            }, 
            TeamTalk = {
                Text = "<Color=Red>This item can only be bought by people in " .. v71 .. "s" .. ".<Color=/><AnimateYield=1>", 
                go = "..", 
                stop = "..", 
                stoptext = "...", 
                endtext = true
            }, 
            notLevel = {
                Text = "<Color=Red>You dont meet the level requirements to take this quest.<Color=/><AnimateYield=1>", 
                go = "..", 
                stop = "..", 
                stoptext = "...", 
                endtext = true
            }
        };
    end;
    if v66 == true then
        local l_Max_0 = require(game.ReplicatedStorage.Modules.ToolDesc)[v67].Max;
        if v70 ~= 0 then
            v73.Talk1 = v73.Talk5;
            v73.Talk2 = v73.Talk52;
        end;
        if l_Max_0 and l_Max_0 <= v48(game.Players.LocalPlayer, v67) then
            v73.Talk2 = v73.Talk4;
        elseif l_Max_0 > 1 then
            v73.Talk2 = v73.HowMany;
        end;
    end;
    if v73 == nil then
        return;
    elseif game.Players.LocalPlayer.PlayerGui:FindFirstChild("NPCCHAT") then
        return;
    else
        local l_Character_0 = game.Players.LocalPlayer.Character;
        local v83 = Instance.new("ObjectValue", l_Character_0);
        _G.canuse = false;
        local l_FirstChild_2 = game.ReplicatedStorage:FindFirstChild("Stats" .. game.Players.LocalPlayer.Name);
        _G.hideUI(true);
        local v85 = script.ScreenGui:Clone();
        v85.Parent = game.Players.LocalPlayer.PlayerGui;
        v85.Name = "NPCCHAT";
        if v73.Team ~= nil and l_FirstChild_2.Stats.Team.Value == v73.Team then
            v73.TalkAmmount = 1;
            v73.Talk1 = v73.TalkTeam;
        end;
        if v71 ~= 0 and l_FirstChild_2.Stats.Team.Value ~= v71 then
            v73.TalkAmmount = 1;
            v73.Talk1 = v73.TeamTalk;
        end;
        local v86 = UDim2.new(0, 0, script.ScreenGui.Frame.go.Size.Y.Scale, 0);
        v85.Frame.go.TextTransparency = 1;
        v85.Frame.stop.TextTransparency = 1;
        v85.Frame.endChat.TextTransparency = 1;
        v85.Frame.stop.Size = v86;
        v85.Frame.go.Size = v86;
        v85.Frame.endChat.Size = v86;
        if script.Conditions:FindFirstChild(v65.Name) and v67 == nil then
            local v87 = require(script.Conditions:FindFirstChild(v65.Name));
            if v87.adjust ~= nil then
                local v88 = v87:adjust(v65);
                if v88 then
                    for v89 = 1, #v88 do
                        local v90 = v88[v89];
                        local l_talkname_0 = v90.talkname;
                        local l_new_0 = v90.new;
                        v73[l_talkname_0].Text = l_new_0;
                    end;
                end;
            end;
            local v93 = v87:check(v65);
            if v93 then
                for v94 = 1, #v93 do
                    local v95 = v93[v94];
                    local l_talkname_1 = v95.talkname;
                    local l_talknumber_0 = v95.talknumber;
                    local l_talkend_0 = v95.talkend;
                    v73["Talk" .. l_talknumber_0] = v73[l_talkname_1];
                    v73.TalkAmmount = l_talkend_0;
                end;
            end;
        end;
        if v73.lvlReq ~= nil and l_FirstChild_2.Stats.Level.Value < v73.lvlReq then
            v73 = v72.notreq;
        end;
        local v99 = nil;
        local v100 = nil;
        if v65:IsA("Model") and v65.Parent == workspace.NPCs and v66 == nil and v65.Info:FindFirstChild("Idle") == nil then
            v99 = v65.Humanoid:LoadAnimation(script.Talk);
            v99.Priority = Enum.AnimationPriority.Action2;
            v99:Play();
            v100 = v65.HumanoidRootPart.CFrame;
            local l_Position_0 = v65.HumanoidRootPart.Position;
            local v102 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0);
            local v103 = {
                CFrame = CFrame.new(Vector3.new(l_Position_0.X, l_Position_0.Y, l_Position_0.Z), (Vector3.new(l_Character_0.HumanoidRootPart.Position.X, l_Position_0.Y, l_Character_0.HumanoidRootPart.Position.Z)))
            };
            game:GetService("TweenService"):Create(v65.HumanoidRootPart, v102, v103):Play();
        end;
        if v66 == nil and v65.Info:FindFirstChild("InteractSFX") then
            v65.Info.InteractSFX:Play();
        elseif v66 == true and l_FirstChild_2.Stats.Peli.Value < v68 then
            v73.Talk2 = {
                Text = "<Color=Red>You dont have enough Peli!<Color=/><AnimateYield=.45>", 
                go = "..", 
                stop = "..", 
                stoptext = "...", 
                endtext = true
            };
        end;
        v29(v85.Frame.go);
        v29(v85.Frame.stop);
        v29(v85.Frame.endChat);
        v1:New(v85.Frame.npcname, v65.Name .. "", {
            TextScale = 1, 
            AnimateStyle = "Fade"
        }):Animate(true);
        l_Character_0.Humanoid.WalkSpeed = 0;
        task.wait(0.25);
        local l_TalkAmmount_0 = v73.TalkAmmount;
        local v105 = false;
        local v106 = false;
        local v107 = nil;
        local v108 = nil;
        local v109 = false;
        local v110 = v35(l_FirstChild_2, v73.QuestName);
        if v66 == nil then
            if v110 == true and v73.bypassComplete == nil then
                l_TalkAmmount_0 = 1;
                v73 = v72["quest completed"];
                v109 = true;
            end;
            if v109 == false and v73.QuestInfo and v73.QuestInfo.Type == "DeliverEnd" and l_FirstChild_2.Quest.CurrentQuest.Value == v73.QuestInfo.QuestDeliveryName then
                warn("evierley ending");
                v73 = v61(v72)[v65.Name];
                v109 = true;
            elseif v109 == false and v73.QuestInfo and v73.QuestInfo.Type == "DeliverEnd" and l_FirstChild_2.Quest.CurrentQuest.Value ~= v73.QuestInfo.QuestDeliveryName then
                l_TalkAmmount_0 = 1;
                v109 = true;
                v73 = if v35(l_FirstChild_2, v73.QuestInfo.QuestDeliveryName) == true then v72[v65.Name].TalkFinished else v72[v65.Name].TalkMissing;
            end;
            if v73.QuestInfo and v73.QuestInfo.Type ~= nil and v109 == false then
                if l_FirstChild_2.Quest.CurrentQuest.Value ~= "None" and v73.QuestInfo.Type ~= "Find" then
                    l_TalkAmmount_0 = 1;
                    v73 = v72["already have quest"];
                elseif v73.QuestInfo.Type == "Find" and l_FirstChild_2.Quest.CurrentQuest.Value == v73.QuestName and (game.Players.LocalPlayer.Backpack:FindFirstChild(v73.QuestInfo.MobName) or game.Players.LocalPlayer.Character:FindFirstChild(v73.QuestInfo.MobName)) then
                    l_TalkAmmount_0 = 1;
                    v73 = v72["return item"];
                    game.ReplicatedStorage.Events.Quest:InvokeServer({
                        "returnitem"
                    });
                elseif l_FirstChild_2.Quest.CurrentQuest.Value ~= "None" then
                    l_TalkAmmount_0 = 1;
                    v73 = v72["already have quest"];
                end;
            end;
            if game.Players.LocalPlayer.QuestCD.Value == true and v73 ~= v72["return item"] and v73.QuestInfo ~= nil then
                l_TalkAmmount_0 = 1;
                v73 = v72["quest cooldown"];
            end;
        end;
        local _, l_result_0 = pcall(function() --[[ Line: 432 ]]
            -- upvalues: l_TalkAmmount_0 (ref), l_Character_0 (copy), v107 (ref), v108 (ref), v105 (ref), v106 (ref), v73 (ref), v1 (ref), v85 (copy), v65 (ref), l_UserInputService_0 (ref), v21 (ref)
            for v111 = 1, l_TalkAmmount_0 do
                l_Character_0.Humanoid.WalkSpeed = 0;
                if v107 then
                    v107:disconnect();
                    v107 = nil;
                end;
                if v108 then
                    v108:disconnect();
                    v108 = nil;
                end;
                v105 = false;
                v106 = false;
                local v112 = v73["Talk" .. v111];
                if v112 ~= nil then
                    local v113 = {
                        SFX = true
                    };
                    local v114 = v1:New(v85.Frame.ImageLabel.desc, v112.Text, v113);
                    if v112.excu then
                        if v112.yield == nil then
                            task.spawn(function() --[[ Line: 454 ]]
                                -- upvalues: v112 (copy), v65 (ref)
                                v112.excu(v65);
                            end);
                        else
                            v112.excu(v65);
                        end;
                    end;
                    v85.Frame.go.Visible = true;
                    v85.Frame.stop.Visible = true;
                    v85.Frame.go.Text = v112.go;
                    v85.Frame.stop.Text = v112.stop;
                    if v112.endtext == true then
                        v85.Frame.go.Text = "";
                        v85.Frame.stop.Text = "";
                        task.delay(1, function() --[[ Line: 468 ]]
                            -- upvalues: v85 (ref), v105 (ref)
                            if v85:FindFirstChild("Frame") and v85.Frame.endChat.Visible == false then
                                v105 = true;
                            end;
                        end);
                    end;
                    local v115 = nil;
                    v115 = l_UserInputService_0.InputBegan:Connect(function(v116) --[[ Line: 477 ]]
                        -- upvalues: v115 (ref), v114 (copy)
                        if v116.UserInputType == Enum.UserInputType.MouseButton1 or v116.UserInputType == Enum.UserInputType.Touch then
                            v115:Disconnect();
                            v114:Show();
                        end;
                    end);
                    v114:Animate(true);
                    if l_TalkAmmount_0 <= v111 then
                        v85.Frame.endChat.Visible = true;
                        v21(v85.Frame.endChat, true);
                        v85.Frame.endChat.MouseButton1Click:Connect(function() --[[ Line: 487 ]]
                            -- upvalues: v105 (ref), v21 (ref), v85 (ref)
                            v105 = true;
                            v21(v85.Frame.endChat, false);
                        end);
                    end;
                    v115:Disconnect();
                    if v112.endtext == false then
                        task.wait(0.25);
                        v21(v85.Frame.go, true);
                        v21(v85.Frame.stop, true);
                    end;
                    v107 = v85.Frame.go.MouseButton1Click:Connect(function() --[[ Line: 498 ]]
                        -- upvalues: v105 (ref), v112 (copy), v65 (ref)
                        v105 = true;
                        if v112.result then
                            v112.result(v65);
                        end;
                    end);
                    v108 = v85.Frame.stop.MouseButton1Click:Connect(function() --[[ Line: 505 ]]
                        -- upvalues: v105 (ref), v106 (ref)
                        v105 = true;
                        v106 = true;
                    end);
                    if l_TalkAmmount_0 <= v111 then
                        task.wait(1);
                    end;
                    repeat
                        game["Run Service"].Heartbeat:Wait();
                    until v105 == true;
                    v21(v85.Frame.go, false);
                    v21(v85.Frame.stop, false);
                    task.wait(0.25);
                    if v106 == true then
                        v1:New(v85.Frame.ImageLabel.desc, v112.stoptext, v113):Animate(true);
                        task.wait(0.5);
                        return;
                    else
                        if v112.afterEnd ~= nil then
                            v112.afterEnd(v65);
                        end;
                        --[[ close >= 6 ]]
                    end;
                end;
            end;
        end);
        if l_result_0 then
            warn(l_result_0);
        end;
        local v119 = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0);
        local v120 = {
            ImageTransparency = 1
        };
        game:GetService("TweenService"):Create(v85.Frame.ImageLabel, v119, v120):Play();
        v41(v85);
        if v99 then
            v99:Stop(0.25);
            if v65 and v65.PrimaryPart then
                local v121 = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0);
                local v122 = {
                    CFrame = v100
                };
                game:GetService("TweenService"):Create(v65.PrimaryPart, v121, v122):Play();
            end;
        end;
        v73 = {};
        v72 = {};
        v73 = nil;
        v72 = nil;
        task.wait(0.25);
        if v65 and v65.PrimaryPart and v65.Parent == workspace.NPCs and v65.Info:FindFirstChild("RoamingNPC") then
            warn("invoked server!");
            game.ReplicatedStorage.Events.NPCChat:InvokeServer(v65);
        end;
        _G.canuse = true;
        v83:Destroy();
        l_Character_0.Humanoid.WalkSpeed = 16;
        _G.hideUI(false);
        v85:Destroy();
        return;
    end;
end;
v0.getquests = function(_) --[[ Line: 572 ]] --[[ Name: getquests ]]
    -- upvalues: v4 (copy)
    return v4;
end;
local function v124(v125) --[[ Line: 576 ]] --[[ Name: deepCopy ]]
    -- upvalues: v124 (copy)
    local v126 = {};
    for v127, v128 in pairs(v125) do
        if type(v128) == "table" then
            v128 = v124(v128);
        end;
        v126[v127] = v128;
    end;
    return v126;
end;
v0.getmob_formquest = function(_, v130, v131) --[[ Line: 587 ]] --[[ Name: getmob_formquest ]]
    -- upvalues: v4 (copy), v124 (copy)
    local v132 = nil;
    local v133 = nil;
    local v134 = nil;
    for _, v136 in v4 do
        if v136.QuestName == v130 then
            local l_QuestInfo_0 = v136.QuestInfo;
            if v131 and l_QuestInfo_0.MultiQuest ~= nil then
                l_QuestInfo_0 = l_QuestInfo_0.MultiQuest[v131];
            end;
            if l_QuestInfo_0 ~= nil then
                v132 = l_QuestInfo_0.MobName;
                if v131 ~= nil and l_QuestInfo_0.MultiQuest ~= nil then
                    v133 = v124(v136);
                    v133.QuestInfo = l_QuestInfo_0;
                else
                    v133 = v136;
                end;
                if v136.noNPC == nil then
                    local l_FirstChild_3 = workspace.NPCs:FindFirstChild(v136.NPC);
                    if l_FirstChild_3 == nil then
                        if game["Run Service"]:IsClient() then
                            return v132, v133, (workspace.NPCs:WaitForChild(v136.NPC, 2));
                        else
                            return v132, v133, (_G.npcStorageFolder:FindFirstChild(v136.NPC));
                        end;
                    else
                        return v132, v133, l_FirstChild_3;
                    end;
                else
                    break;
                end;
            end;
        end;
    end;
    return v132, v133, v134;
end;
v0.getquest_formname = function(_, v140) --[[ Line: 626 ]] --[[ Name: getquest_formname ]]
    -- upvalues: v4 (copy)
    local v141 = nil;
    local v142 = nil;
    for _, v144 in v4 do
        if v144.NPC == v140 then
            return v144.QuestInfo.MobName, v144;
        end;
    end;
    return v141, v142;
end;
return v0;