local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_TweenService_0 = game:GetService("TweenService");
local l_Teams_0 = game:GetService("Teams");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_StarterPlayer_0 = game:GetService("StarterPlayer");
local l_CurrentCamera_0 = workspace.CurrentCamera;
local l_Main_0 = l_Players_0.LocalPlayer.PlayerGui:WaitForChild("Playerlist"):WaitForChild("Main");
local l_Leaderstats_0 = l_Main_0:WaitForChild("ScrollingFrame"):WaitForChild("Leaderstats");
local l_Container_0 = l_Leaderstats_0:WaitForChild("Container");
local v11 = require(script.Team);
local v12 = require(script.Player);
local v13 = require(script.Leaderstats);
local v14 = require(l_ReplicatedStorage_0.Modules.Shared.Signals.GoodSignal);
local _ = require(l_ReplicatedStorage_0.Modules.Shared.Maids.Maid);
local v16 = {};
v16.__index = v16;
local v17 = require(l_StarterPlayer_0.StarterPlayerScripts.InputHandler);
v16.new = function() --[[ Line: 33 ]] --[[ Name: new ]]
    -- upvalues: v16 (copy), v14 (copy), v13 (copy), v17 (copy)
    local v18 = setmetatable({}, v16);
    v18.PlayerAdded = v14.new();
    v18.PlayerRemoved = v14.new();
    v18.Leaderstats = v13.new(v18);
    v18.Players = {};
    v18.Teams = {};
    v18.Opened = true;
    v18:_main();
    local l_Icon_0 = require(game.ReplicatedStorage:WaitForChild("Modules"):WaitForChild("TopbarPlus"):WaitForChild("Icon"));
    if v17:GetCurrentInput() == "Mobile" then
        warn("MOBILE PLAYER LIST!");
        l_Icon_0.new():setName("PlayerList"):setCaption("View Player List"):setImage(14899301735):setImageScale(0.7):oneClick():bindEvent("selected", function(_) --[[ Line: 58 ]]
            -- upvalues: v18 (copy)
            if v18.Opened == true then
                v18:Hide();
                return;
            else
                v18:Open();
                return;
            end;
        end);
    end;
    return v18;
end;
v16._disableCoreGUI = function(_) --[[ Line: 70 ]] --[[ Name: _disableCoreGUI ]]
    -- upvalues: l_StarterGui_0 (copy)
    local v22 = os.clock();
    while os.clock() - v22 <= 2 do
        pcall(l_StarterGui_0.SetCoreGuiEnabled, l_StarterGui_0, Enum.CoreGuiType.PlayerList, false);
        task.wait();
    end;
    print("PLAYER LIST DISABLED?");
end;
v16.Initialize = function() --[[ Line: 85 ]] --[[ Name: Initialize ]]
    -- upvalues: l_UserInputService_0 (copy), l_CurrentCamera_0 (copy), v16 (copy)
    local function _() --[[ Line: 87 ]] --[[ Name: isTablet ]]
        -- upvalues: l_UserInputService_0 (ref), l_CurrentCamera_0 (ref)
        if not l_UserInputService_0.TouchEnabled then
            return false;
        else
            local l_ViewportSize_0 = l_CurrentCamera_0.ViewportSize;
            return math.min(l_ViewportSize_0.X, l_ViewportSize_0.Y) <= 500;
        end;
    end;
    v16:_disableCoreGUI();
    v16.new();
end;
v16.Open = function(v25) --[[ Line: 103 ]] --[[ Name: Open ]]
    -- upvalues: l_Leaderstats_0 (copy), l_TweenService_0 (copy), l_Main_0 (copy)
    v25.Opened = true;
    l_Leaderstats_0.Open.Interactable = false;
    l_TweenService_0:Create(l_Main_0, TweenInfo.new(0.5), {
        AnchorPoint = Vector2.new(1, 0)
    }):Play();
    l_TweenService_0:Create(l_Leaderstats_0.Open, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {
        TextTransparency = 1, 
        TextStrokeTransparency = 1
    }):Play();
end;
v16.Hide = function(v26) --[[ Line: 121 ]] --[[ Name: Hide ]]
    -- upvalues: l_Leaderstats_0 (copy), l_TweenService_0 (copy), l_Main_0 (copy)
    v26.Opened = false;
    l_Leaderstats_0.Open.Interactable = true;
    l_TweenService_0:Create(l_Main_0, TweenInfo.new(0.5), {
        AnchorPoint = Vector2.new(0, 0)
    }):Play();
    l_TweenService_0:Create(l_Leaderstats_0.Open, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {
        TextTransparency = 0, 
        TextStrokeTransparency = 0
    }):Play();
end;
v16.GetTeam = function(v27, v28) --[[ Line: 139 ]] --[[ Name: GetTeam ]]
    return v27.Teams[v28];
end;
v16.GetPlayer = function(v29, v30) --[[ Line: 143 ]] --[[ Name: GetPlayer ]]
    return v29.Players[v30];
end;
v16._displayNeutralTitle = function(v31) --[[ Line: 147 ]] --[[ Name: _displayNeutralTitle ]]
    local v32 = 0;
    for _ in v31.Teams do
        v32 = v32 + 1;
        if v32 >= 2 then
            break;
        end;
    end;
    v31.Teams.Neutral:DisplayTitle(v32 >= 2);
end;
v16.SetTeam = function(v34, v35, v36) --[[ Line: 156 ]] --[[ Name: SetTeam ]]
    v36 = v36 or "Neutral";
    local l_v34_Team_0 = v34:GetTeam(v36);
    if not l_v34_Team_0 then
        warn((("[Playerlist]: %* is not a valid team!"):format(v36)));
        return;
    else
        local _ = v35.Player;
        local l_Team_0 = v35.Team;
        if l_Team_0 then
            l_Team_0:RemoveMember(v35);
        end;
        v35.Team = l_v34_Team_0;
        v35.UI.Parent = l_v34_Team_0.UI.Container;
        l_v34_Team_0:AddMember(v35);
        return;
    end;
end;
v16._handleTeams = function(v40) --[[ Line: 175 ]] --[[ Name: _handleTeams ]]
    -- upvalues: v11 (copy), l_Teams_0 (copy)
    local v41 = v11.new(v40, {
        TeamColor = BrickColor.White(), 
        Name = "Neutral"
    });
    v40.Teams.Neutral = v41;
    local function v43(v42) --[[ Line: 184 ]] --[[ Name: AddTeam ]]
        -- upvalues: v40 (copy), v11 (ref)
        if v40:GetTeam(v42) then
            return;
        else
            v40.Teams[v42] = v11.new(v40, v42);
            v40:_displayNeutralTitle();
            return;
        end;
    end;
    local function v45(v44) --[[ Line: 191 ]] --[[ Name: RemoveTeam ]]
        -- upvalues: v40 (copy)
        if not v40:GetTeam(v44) then
            return;
        else
            v40.Teams[v44]:Destroy();
            v40.Teams[v44] = nil;
            v40:_displayNeutralTitle();
            return;
        end;
    end;
    for _, v47 in l_Teams_0:GetTeams() do
        if not v40:GetTeam(v47) then
            v40.Teams[v47] = v11.new(v40, v47);
            v40:_displayNeutralTitle();
        end;
    end;
    l_Teams_0.ChildAdded:Connect(v43);
    l_Teams_0.ChildRemoved:Connect(v45);
end;
v16._handlePlayers = function(v48) --[[ Line: 207 ]] --[[ Name: _handlePlayers ]]
    -- upvalues: v12 (copy), l_Players_0 (copy)
    local function v51(v49) --[[ Line: 208 ]] --[[ Name: RemovePlayer ]]
        -- upvalues: v48 (copy)
        local l_v48_Player_0 = v48:GetPlayer(v49);
        if not l_v48_Player_0 then
            return;
        else
            v48.PlayerRemoved:Fire(l_v48_Player_0);
            v48.Players[v49]:Remove();
            v48.Players[v49] = nil;
            return;
        end;
    end;
    local function v52(v53) --[[ Line: 218 ]] --[[ Name: AddPlayer ]]
        -- upvalues: v48 (copy), v12 (ref), v52 (copy)
        task.spawn(function() --[[ Line: 219 ]]
            -- upvalues: v48 (ref), v53 (copy), v12 (ref), v52 (ref)
            if v48:GetPlayer(v53) then
                return;
            else
                local v54 = tick();
                if v53.Character == nil then
                    repeat
                        task.wait();
                    until v53.Character ~= nil or tick() - v54 >= 30;
                end;
                if v53:IsDescendantOf(game.Players) == false then
                    return;
                elseif v53:GetAttribute("hidePlayerList") == true then
                    return;
                else
                    local v55 = v12.new(v48, v53);
                    v48.Players[v53] = v55;
                    v55:Initialize();
                    v48.PlayerAdded:Fire(v55);
                    local v56 = nil;
                    v56 = v53.AttributeChanged:Connect(function(v57) --[[ Line: 244 ]]
                        -- upvalues: v53 (ref), v48 (ref), v56 (ref), v52 (ref)
                        if v57 == "hidePlayerList" then
                            if v53:GetAttribute("hidePlayerList") then
                                local l_v53_0 = v53;
                                local l_v48_Player_1 = v48:GetPlayer(l_v53_0);
                                if not l_v48_Player_1 then
                                    return;
                                else
                                    v48.PlayerRemoved:Fire(l_v48_Player_1);
                                    v48.Players[l_v53_0]:Remove();
                                    v48.Players[l_v53_0] = nil;
                                    return;
                                end;
                            else
                                v56:Disconnect();
                                v56 = nil;
                                v52(v53);
                            end;
                        end;
                    end);
                    return;
                end;
            end;
        end);
    end;
    l_Players_0.PlayerAdded:Connect(v52);
    l_Players_0.PlayerRemoving:Connect(v51);
    for _, v61 in l_Players_0:GetPlayers() do
        task.spawn(function() --[[ Line: 219 ]]
            -- upvalues: v48 (copy), v61 (copy), v12 (ref), v52 (copy)
            if v48:GetPlayer(v61) then
                return;
            else
                local v62 = tick();
                if v61.Character == nil then
                    repeat
                        task.wait();
                    until v61.Character ~= nil or tick() - v62 >= 30;
                end;
                if v61:IsDescendantOf(game.Players) == false then
                    return;
                elseif v61:GetAttribute("hidePlayerList") == true then
                    return;
                else
                    local v63 = v12.new(v48, v61);
                    v48.Players[v61] = v63;
                    v63:Initialize();
                    v48.PlayerAdded:Fire(v63);
                    local v64 = nil;
                    v64 = v61.AttributeChanged:Connect(function(v65) --[[ Line: 244 ]]
                        -- upvalues: v61 (ref), v48 (ref), v64 (ref), v52 (ref)
                        if v65 == "hidePlayerList" then
                            if v61:GetAttribute("hidePlayerList") then
                                local l_v61_0 = v61;
                                local l_v48_Player_2 = v48:GetPlayer(l_v61_0);
                                if not l_v48_Player_2 then
                                    return;
                                else
                                    v48.PlayerRemoved:Fire(l_v48_Player_2);
                                    v48.Players[l_v61_0]:Remove();
                                    v48.Players[l_v61_0] = nil;
                                    return;
                                end;
                            else
                                v64:Disconnect();
                                v64 = nil;
                                v52(v61);
                            end;
                        end;
                    end);
                    return;
                end;
            end;
        end);
        task.wait();
    end;
end;
v16._handleInputs = function(v68) --[[ Line: 267 ]] --[[ Name: _handleInputs ]]
    -- upvalues: l_UserInputService_0 (copy), l_Leaderstats_0 (copy), l_Container_0 (copy)
    local function v69() --[[ Line: 268 ]] --[[ Name: Open ]]
        -- upvalues: v68 (copy)
        v68:Open();
    end;
    local function v70() --[[ Line: 272 ]] --[[ Name: Hide ]]
        -- upvalues: v68 (copy)
        v68:Hide();
    end;
    l_UserInputService_0.InputBegan:Connect(function(v71, v72) --[[ Line: 276 ]]
        -- upvalues: v68 (copy)
        if v72 then
            return;
        else
            if v71.KeyCode == Enum.KeyCode.Tab then
                if not v68.Opened then
                    v68:Open();
                    return;
                else
                    v68:Hide();
                end;
            end;
            return;
        end;
    end);
    l_Leaderstats_0.Open.MouseButton1Down:Connect(v69);
    l_Container_0.Hide.MouseButton1Down:Connect(v70);
end;
v16._main = function(v73) --[[ Line: 295 ]] --[[ Name: _main ]]
    v73:_handleTeams();
    v73:_handlePlayers();
    v73:_handleInputs();
end;
return v16;