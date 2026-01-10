local v0 = false;
local v1 = {};
_G.UIEnabled = v0;
_G.hideUI = function(v2) --[[ Line: 4 ]]
    -- upvalues: v0 (ref), v1 (ref)
    if v2 ~= nil then
        v0 = v2;
    end;
    if not v0 then
        for _, v4 in v1 do
            v4.Enabled = true;
        end;
        _G.UIEnabled = true;
        v1 = {};
        return;
    else
        for _, v6 in game.Players.LocalPlayer.PlayerGui:GetDescendants() do
            if v6:IsA("ScreenGui") and v6.Enabled and string.lower(v6.Name):match("topbar") == nil and v6:GetAttribute("unhideable") == nil then
                table.insert(v1, v6);
                v6.Enabled = false;
            end;
        end;
        _G.UIEnabled = false;
        return;
    end;
end;
local l_Icon_0 = require(game.ReplicatedStorage:WaitForChild("Modules"):WaitForChild("TopbarPlus"):WaitForChild("Icon"));
l_Icon_0.setDisplayOrder(50000);
game.ReplicatedStorage.Events:WaitForChild("coffinTween");
game.ReplicatedStorage.Events.coffinTween.OnClientEvent:Connect(function(v8, v9, v10, v11) --[[ Line: 29 ]]
    if v8 == nil then
        return;
    else
        local v12 = tick();
        if v8.PrimaryPart == nil then
            repeat
                task.wait(0.1);
            until v8.PrimaryPart ~= nil or v10 <= tick() - v12;
        end;
        if v8.PrimaryPart == nil then
            return;
        else
            local v13 = Instance.new("CFrameValue", game.ReplicatedStorage);
            v13.Value = v8:GetPrimaryPartCFrame();
            if v11 ~= nil then
                v10 = v11 - workspace:GetServerTimeNow();
            end;
            v13:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 48 ]]
                -- upvalues: v8 (copy), v13 (copy)
                if v8 and v8.Parent ~= nil and v8.PrimaryPart ~= nil then
                    v8.PrimaryPart.CFrame = v13.Value;
                end;
            end);
            local _ = _G.tween(v13, {
                v10, 
                Enum.EasingStyle.Quad, 
                Enum.EasingDirection.Out, 
                0, 
                false, 
                0
            }, {
                Value = v9
            });
            _G.destroy(v13, v10);
            return;
        end;
    end;
end);
local v15 = game.ReplicatedStorage:WaitForChild("Stats" .. game.Players.LocalPlayer.Name);
v15:WaitForChild("Stats"):WaitForChild("CurrentSea");
repeat
    task.wait();
until _G.arena ~= nil;
local l_TeleportService_0 = game:GetService("TeleportService");
local _ = game:GetService("ReplicatedStorage");
local v18 = l_Icon_0.new();
v18:setLeft();
v18:disableStateOverlay(true);
v18:setCaption("Exit to");
v18:setImage("13868790754");
v18:setImageScale(0.7);
local v19 = v18.new();
v19:setLabel("Main Menu");
local v20 = 1730877806;
local v21 = 6360478118;
local v22 = 6811831486;
if game.GameId == 2097989947 then
    v20 = 7422493775;
    v21 = 6175058954;
    v22 = 6729320818;
end;
v19.selected:Connect(function() --[[ Line: 90 ]]
    -- upvalues: l_TeleportService_0 (copy), v20 (ref)
    if game.Players.LocalPlayer.Character:FindFirstChild("inCombat") then
        _G.displayMessage("<Color=Red>Cannot leave while in-combat!");
        return;
    else
        _G.displayMessage("<Color=Green>Teleporting to MAIN MENU...");
        l_TeleportService_0:Teleport(v20, game.Players.LocalPlayer);
        return;
    end;
end);
local v23 = v18.new();
v23:setLabel("Universe HUB");
v23.selected:Connect(function() --[[ Line: 104 ]]
    -- upvalues: l_TeleportService_0 (copy), v21 (ref)
    if game.Players.LocalPlayer.Character:FindFirstChild("inCombat") and _G.arenaMatchStarted ~= nil then
        _G.displayMessage("<Color=Red>Cannot leave while in-combat!");
        return;
    else
        _G.displayMessage("<Color=Green>Teleporting to UNIVERSE HUB...");
        l_TeleportService_0:Teleport(v21, game.Players.LocalPlayer);
        return;
    end;
end);
local v24 = v15:WaitForChild("Stats").CurrentSea.Value .. " Sea";
local v25 = {
    test = {
        first = 5875630735, 
        second = 7122743591, 
        tradeHub = 6729320818
    }, 
    real = {
        first = 3978370137, 
        second = 7465136166, 
        tradeHub = 6811831486
    }
};
local l_real_0 = v25.real;
if game.GameId ~= 648454481 then
    l_real_0 = v25.test;
end;
local v27 = nil;
v27 = if v24 == "First Sea" then l_real_0.first else l_real_0.second;
if game.PlaceId ~= v27 then
    local v28 = v18.new();
    v28:setLabel(v24);
    v28.selected:Connect(function() --[[ Line: 147 ]]
        -- upvalues: v24 (copy), l_TeleportService_0 (copy), v27 (ref)
        local l_Character_0 = game.Players.LocalPlayer.Character;
        if l_Character_0 and l_Character_0:FindFirstChild("inCombat") then
            _G.displayMessage("<Color=Red>Cannot leave while in-combat!");
            return;
        else
            _G.displayMessage("<Color=Green>Teleporting to " .. string.upper(v24) .. "...");
            l_TeleportService_0:Teleport(v27, game.Players.LocalPlayer);
            return;
        end;
    end);
    v18:setDropdown({
        v19, 
        v23, 
        v28
    });
else
    local v30 = v18.new();
    v30:setLabel("Trade HUB");
    v30.selected:Connect(function() --[[ Line: 163 ]]
        -- upvalues: l_TeleportService_0 (copy), v22 (ref)
        if game.Players.LocalPlayer.Character:FindFirstChild("inCombat") then
            _G.displayMessage("<Color=Red>Cannot leave while in-combat!");
            return;
        else
            _G.displayMessage("<Color=Green>Teleporting to TRADE HUB...");
            l_TeleportService_0:Teleport(v22, game.Players.LocalPlayer);
            return;
        end;
    end);
    v18:setDropdown({
        v19, 
        v23, 
        v30
    });
end;
if _G.arena == true then
    task.spawn(function() --[[ Line: 177 ]]
        -- upvalues: v18 (copy)
        local l_matchStarted_0 = game.ReplicatedStorage:WaitForChild("Matchinfo"):WaitForChild("matchStarted");
        l_matchStarted_0:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 180 ]]
            -- upvalues: l_matchStarted_0 (copy), v18 (ref)
            if l_matchStarted_0.Value == true then
                v18:destroy();
            end;
        end);
    end);
end;
local v32 = l_Icon_0.new();
v32:setName("Misc Menu");
v32:setImage(13868240933);
v32:setImageScale(0.7);
local v33 = v32.new();
v33:setLeft();
v33:disableStateOverlay(true);
v33:setCaption("Hide UIs");
v33:setImage("13858661978", "deselected");
v33:setImage("13858672956", "selected");
v33:setImageScale(0.7);
v33.toggled:Connect(function() --[[ Line: 202 ]]
    -- upvalues: v0 (ref)
    v0 = not v0;
    _G.hideUI();
end);
local v34 = nil;
if _G.arena == false then
    v34 = v32.new():setName("ServerList"):setCaption("View Servers"):setImage(14897649708):setImageScale(0.7):oneClick():bindEvent("selected", function(_) --[[ Line: 217 ]]
        local l_ServerList_0 = game.Players.LocalPlayer.PlayerGui:FindFirstChild("ServerList");
        if l_ServerList_0 then
            l_ServerList_0.Enabled = not l_ServerList_0.Enabled;
        end;
    end);
end;
local v39 = l_Icon_0.new():setName("Emote"):setCaption("Emote [U]"):setImage(14930205724):setImageScale(0.7):oneClick():bindEvent("selected", function(_) --[[ Line: 233 ]]
    local l_EmoteGui_0 = game.Players.LocalPlayer.PlayerGui:FindFirstChild("EmoteGui");
    if not l_EmoteGui_0 then
        return;
    else
        warn("fire emote");
        l_EmoteGui_0.ToggleUI:Fire();
        return;
    end;
end);
local v40 = nil;
local v41 = nil;
if _G.arena == false then
    v40 = v32.new():setName("Controls"):setCaption("Controls/Tips"):setImage(14897440793):setImageScale(0.7):oneClick():bindEvent("selected", function(_) --[[ Line: 253 ]]
        local l_Tips_0 = game.Players.LocalPlayer.PlayerGui:FindFirstChild("Tips");
        if l_Tips_0 then
            l_Tips_0.Enabled = not l_Tips_0.Enabled;
        end;
    end);
    local l_SocialService_0 = game:GetService("SocialService");
    local v45 = false;
    local l_l_SocialService_0_0 = l_SocialService_0 --[[ copy: 22 -> 28 ]];
    do
        local l_v45_0 = v45;
        pcall(function() --[[ Line: 262 ]]
            -- upvalues: l_v45_0 (ref), l_l_SocialService_0_0 (copy)
            l_v45_0 = l_l_SocialService_0_0:CanSendGameInviteAsync(game.Players.LocalPlayer);
        end);
        if l_v45_0 then
            local l_l_SocialService_0_1 = l_SocialService_0 --[[ copy: 22 -> 29 ]];
            v41 = v32.new():setName("InviteFriends"):setCaption("Invite Friends"):setImage(13868688758):setImageScale(0.7):oneClick():bindEvent("selected", function(_) --[[ Line: 273 ]]
                -- upvalues: l_l_SocialService_0_1 (copy)
                l_l_SocialService_0_1:PromptGameInvite(game.Players.LocalPlayer);
            end);
        end;
    end;
end;
v32:setMenu({
    v33, 
    v34, 
    v39, 
    v40, 
    v41
});
if game.ReplicatedStorage:FindFirstChild("tradingHUB") == nil then
    script.BRReport.Enabled = true;
end;
local l_LocalPlayer_0 = game.Players.LocalPlayer;
local v51 = game.ReplicatedStorage:WaitForChild("reservedCode", 10);
local v52 = nil;
if v51 then
    repeat
        task.wait();
    until v51.Value ~= "checking";
    if v51.Value ~= "" then
        repeat
            task.wait();
        until v51:GetAttribute("ownerID") ~= nil;
        v52 = v51:GetAttribute("ownerID");
    end;
elseif l_LocalPlayer_0.Name ~= "Phoeating" then
    return;
end;
if l_LocalPlayer_0.Name == "Phoeating" or l_LocalPlayer_0.UserId == v52 then
    local v53 = l_Icon_0.new();
    v53:setLeft();
    v53:disableStateOverlay(true);
    v53:setCaption("Private Server Settings");
    v53:setImage("14923131291");
    v53:setImageScale(0.7);
    local l_privateServerSettings_0 = game.ReplicatedStorage.Events.privateServerSettings;
    local function v65(v55, v56, v57) --[[ Line: 357 ]] --[[ Name: setItemIcon ]]
        -- upvalues: l_privateServerSettings_0 (copy)
        v57 = v57 or Color3.fromRGB(255, 75, 75);
        v55:setName(v56);
        v55:autoDeselect(false);
        v55:setLabel(("\240\159\159\169  %*"):format(v56), "Selected");
        v55:setLabel(("\240\159\159\165  %* "):format(v56), "Deselected");
        if l_privateServerSettings_0:InvokeServer({
            checkSettingName = v56
        }) == true then
            v55:select();
        else
            v55:deselect();
        end;
        v55.toggled:Connect(function(v58, _) --[[ Line: 371 ]]
            -- upvalues: v55 (copy), v56 (copy), l_privateServerSettings_0 (ref)
            local _ = v58 and "selected" or "deselected";
            v55:lock();
            if v56 == "No Cooldowns" and v58 then
                local v61 = false;
                local v62 = false;
                _G.promptQuestion(game.Players.LocalPlayer, "Are you sure you want to <font color=\"rgb(255,0,0)\">turn off cooldowns?</font> You will <font color=\"rgb(255,0,0)\">not be able to turn off PVP Pads afterwards, a server restart would be required.</font>", {
                    [true] = function() --[[ Line: 378 ]]
                        -- upvalues: v61 (ref)
                        v61 = true;
                    end, 
                    [false] = function() --[[ Line: 381 ]]
                        -- upvalues: v62 (ref), v61 (ref)
                        v62 = true;
                        v61 = true;
                    end
                });
                repeat
                    task.wait();
                until v61 == true;
                v55:unlock();
                if v62 == true then
                    v55:setLabel((("\240\159\159\165  %*"):format(v56)));
                    return;
                else
                    --[[ close >= 3 ]]
                end;
            end;
            local v63, _ = l_privateServerSettings_0:InvokeServer({
                Toggle = v58, 
                settingName = v56
            });
            if v63 == true then
                v55:setLabel((("\240\159\159\169  %*"):format(v56)));
            else
                v55:setLabel((("\240\159\159\165  %*"):format(v56)));
            end;
            v55:unlock();
        end);
    end;
    v53:setDropdown({
        l_Icon_0.new():call(v65, "PVP Pads"), 
        l_Icon_0.new():call(v65, "No Cooldowns"), 
        l_Icon_0.new():call(v65, "Lock Server"), 
        l_Icon_0.new():call(function(v66, v67, _) --[[ Line: 410 ]] --[[ Name: banButton ]]
            -- upvalues: l_privateServerSettings_0 (copy)
            v66:setName(v67);
            v66:autoDeselect(false);
            v66:setLabel(("\240\159\147\150  %*"):format(v67), "Selected");
            v66:setLabel(("\240\159\147\152  %* "):format(v67), "Deselected");
            v66.toggled:Connect(function(v69, _) --[[ Line: 416 ]]
                -- upvalues: v66 (copy), l_privateServerSettings_0 (ref), v67 (copy)
                local _ = v69 and "selected" or "deselected";
                v66:lock();
                local v72, _ = l_privateServerSettings_0:InvokeServer({
                    Toggle = v69, 
                    settingName = v67
                });
                if v72 == true then
                    v66:setLabel((("\240\159\147\150  %*"):format(v67)));
                else
                    v66:setLabel((("\240\159\147\152  %*"):format(v67)));
                end;
                v66:unlock();
            end);
        end, "Ban List"), 
        l_Icon_0.new():call(function(v74, v75, _) --[[ Line: 435 ]] --[[ Name: invitePartyButton ]]
            v74:setName(v75);
            v74:autoDeselect(true);
            v74:setLabel(v75);
            v74:oneClick();
            v74:bindEvent("selected", function(_) --[[ Line: 441 ]]
                local l_Players_0 = game.Players:GetPlayers();
                for v79 = 1, #l_Players_0 do
                    if l_Players_0[v79] ~= game.Players.LocalPlayer then
                        local l_Party_0 = l_Players_0[v79]:FindFirstChild("Party");
                        if l_Party_0 and l_Party_0.Value == nil then
                            game.ReplicatedStorage.Events.PartySystem:FireServer({
                                action = "invite", 
                                ply = l_Players_0[v79]
                            });
                        end;
                    end;
                end;
                _G.displayMessage("<Color=Green>Party invites sent!");
            end);
        end, "\240\159\145\165  Party Invite All")
    });
end;