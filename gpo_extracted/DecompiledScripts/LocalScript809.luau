repeat
    task.wait();
until game.Players.LocalPlayer;
local l_LocalPlayer_0 = game.Players.LocalPlayer;
local v1 = nil;
local v2 = 0;
task.spawn(function() --[[ Line: 6 ]]
    -- upvalues: v1 (ref), l_LocalPlayer_0 (copy)
    v1 = l_LocalPlayer_0:WaitForChild("Loaded");
end);
task.spawn(function() --[[ Line: 9 ]]
    game:GetService("ContentProvider"):PreloadAsync({
        script.Parent
    });
end);
task.spawn(function() --[[ Line: 12 ]]

end);
script.Parent.LogoText.UIGradient.Enabled = true;
local function v6(v3, v4) --[[ Line: 32 ]] --[[ Name: loadingText ]]
    -- upvalues: v2 (ref)
    local v5 = 0;
    repeat
        if tick() - v5 >= 0.2 then
            script.Parent.TextLabel.Text = v3 .. string.rep(".", v2);
            v2 = v2 + 1;
            if v2 >= 4 then
                v2 = 0;
            end;
            v5 = tick();
        end;
        game["Run Service"].Heartbeat:Wait();
    until v4() == true;
end;
if workspace:FindFirstChild("Islands") then
    v6("Server Initializing", function() --[[ Line: 50 ]]
        return workspace.Islands:GetAttribute("ready") == true;
    end);
end;
v6("Loading Player Info", function() --[[ Line: 56 ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    return l_LocalPlayer_0:GetAttribute("banLoaded") ~= nil;
end);
v6("Loading Data", function() --[[ Line: 60 ]]
    -- upvalues: v1 (ref), l_LocalPlayer_0 (copy)
    local v7 = false;
    if v1 ~= nil then
        v7 = false;
        if v1.Value == true then
            v7 = l_LocalPlayer_0:GetAttribute("banLoaded") ~= nil;
        end;
    end;
    return v7;
end);
local _ = game.ReplicatedStorage:WaitForChild("Stats" .. l_LocalPlayer_0.Name, 300);
if game.ReplicatedStorage:WaitForChild("AFKHUB", 2) == nil then
    script.Parent.hint.Visible = true;
    v6("Processing Inventory", function() --[[ Line: 69 ]]
        -- upvalues: l_LocalPlayer_0 (copy)
        return l_LocalPlayer_0:GetAttribute("inventoryVerified") == true;
    end);
    script.Parent.hint.Visible = false;
end;
if l_LocalPlayer_0:GetAttribute("royaleDataLoaded") ~= nil then
    local v9 = tick();
    local l_v9_0 = v9 --[[ copy: 5 -> 21 ]];
    v6("Loading Battle Royale Data", function() --[[ Line: 79 ]]
        -- upvalues: l_v9_0 (copy), l_LocalPlayer_0 (copy)
        if tick() - l_v9_0 >= 30 then
            script.Parent.hint.Visible = true;
            script.Parent.hint.Text = "(may take up to 2 mins)";
        end;
        return l_LocalPlayer_0:GetAttribute("royaleDataLoaded") == true;
    end);
    script.Parent.hint.Visible = false;
end;
local l_NPCs_0 = workspace:FindFirstChild("NPCs");
if l_NPCs_0 and l_NPCs_0:GetAttribute("fullyLoaded") == nil then
    v6("Loading NPCs", function() --[[ Line: 92 ]]
        -- upvalues: l_NPCs_0 (copy)
        return l_NPCs_0:GetAttribute("fullyLoaded") ~= nil;
    end);
end;
script.Parent.TextLabel.Text = "Loaded!";
local v12 = workspace:WaitForChild("Env", 3);
if v12 then
    v12:WaitForChild("WaterStuff");
end;
if game.ReplicatedStorage:FindFirstChild("playerLoaded") then
    repeat
        task.wait();
    until game:IsLoaded() == true;
    local v13, _, _, _, _ = require(game.ReplicatedStorage.Modules.ScriptSet).get(true);
    local v18 = nil;
    local v19 = nil;
    local v20 = nil;
    if not v13.Character then
        v13.CharacterAdded:Wait();
    end;
    local v21 = tick();
    local l_ModelSize_0 = game.Players.LocalPlayer.Character:GetModelSize();
    repeat
        task.wait();
        if _G.getRayFloor and game.Players.LocalPlayer.Character ~= nil and game.Players.LocalPlayer.Character.PrimaryPart ~= nil then
            local v23, v24, v25 = _G.getRayFloor(game.Players.LocalPlayer.Character.PrimaryPart.CFrame, l_ModelSize_0.Y / 2 + 1);
            v18 = v23;
            v19 = v24;
            v20 = v25;
            if game.Players.LocalPlayer.Character.PrimaryPart.Position.Y < workspace.Env.WaterStuff.Falls.Position.Y + 5 then
                break;
            end;
        end;
    until tick() - v21 >= 30 or game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character.PrimaryPart ~= nil and game.Players.LocalPlayer.Character.Humanoid.FloorMaterial ~= Enum.Material.Air;
    game.ReplicatedStorage.playerLoaded:FireServer();
elseif game.Players.LocalPlayer.Character == nil and game.ReplicatedStorage:FindFirstChild("HUB") == nil then
    game.Players.LocalPlayer.CharacterAdded:Wait();
    task.wait(1);
end;
local v26 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0);
local v27 = {
    ImageTransparency = 1
};
game:GetService("TweenService"):Create(script.Parent.LogoText, v26, v27):Play();
local v28 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0);
local v29 = {
    TextTransparency = 1
};
game:GetService("TweenService"):Create(script.Parent.TextLabel, v28, v29):Play();
_G.destroy(script.Parent, 1);
_G.loadingFinished = true;