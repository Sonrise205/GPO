--!native
script.Parent:RemoveDefaultLoadingScreen();
local v0 = Instance.new("HopperBin", nil);
script.Parent = v0;
local _ = game:GetService("Chat");
local _ = game.Players.LocalPlayer:WaitForChild("PlayerGui");
game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false);
game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false);
game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Health, false);
game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Captures, false);
if game:GetService("TeleportService"):GetArrivingTeleportGui() == nil then
    local v3 = game.ReplicatedFirst:WaitForChild("lodascreen"):WaitForChild("LoadingGUI"):Clone();
    v3.Parent = game.Players.LocalPlayer.PlayerGui;
    v3.CanvasGroup.LocalScript.Disabled = false;
end;
game.ReplicatedFirst:RemoveDefaultLoadingScreen();
repeat
    game["Run Service"].Heartbeat:Wait();
until game.Players.LocalPlayer;
repeat
    game["Run Service"].Heartbeat:Wait();
until game.Players.LocalPlayer.PlayerGui;
game.ReplicatedStorage:WaitForChild("Modules");
game.ReplicatedStorage.Modules:WaitForChild("FastSpawn", 5);
game.ReplicatedStorage.Modules:WaitForChild("CustomDeb");
_G.destroy = require(game.ReplicatedStorage.Modules.CustomDeb);
local v4 = tick();
warn("Inting", "SharedGlobals");
warn("Took " .. tick() - v4, "SharedGlobals");
_G.fastsp = require(game.ReplicatedStorage.Modules.FastSpawn);
_G.checkRenderDistance = function(v5, v6) --[[ Line: 42 ]]
    local v7 = 1024;
    if _G.mobile == true then
        v7 = 600;
    end;
    if _G.fastmode == true then
        v7 = 400;
    end;
    if _G.omegabooster == true then
        v7 = 200;
    end;
    if v6 then
        v7 = v6;
    end;
    if typeof(v5) == "CFrame" then
        v5 = v5.Position;
    end;
    if v7 < (v5 - workspace.CurrentCamera.CFrame.Position).magnitude then
        return false;
    else
        return true;
    end;
end;
local v8 = {};
local v9 = nil;
local v10 = 0;
local l_Effects_0 = game.ReplicatedStorage:WaitForChild("Effects");
local function v14() --[[ Line: 79 ]] --[[ Name: fetchEffectModules ]]
    -- upvalues: v9 (ref), l_Effects_0 (copy)
    local v12 = {};
    v9 = l_Effects_0:GetDescendants();
    for v13 = 1, #v9 do
        if v9[v13]:IsA("ModuleScript") and v9[v13].Parent:IsA("Folder") then
            table.insert(v12, v9[v13]);
        end;
    end;
    table.clear(v9);
    v9 = v12;
end;
local v15 = game["Run Service"]:IsStudio();
_G.getEffect = function(v16) --[[ Line: 93 ]]
    -- upvalues: v9 (ref), v14 (copy), v8 (copy), v15 (copy), v10 (ref)
    if v9 == nil then
        v14();
    end;
    if v8[v16] and v15 == false then
        return v8[v16];
    else
        if v15 == true and tick() - v10 >= 1 then
            v14();
            v10 = tick();
        end;
        if game.Players.LocalPlayer == nil then
            repeat
                task.wait();
            until game.Players.LocalPlayer;
        end;
        local v17 = nil;
        local l_v9_0 = v9;
        for v19 = 1, #l_v9_0 do
            if l_v9_0[v19] ~= nil and l_v9_0[v19]:IsA("ModuleScript") and l_v9_0[v19].Name == v16 and l_v9_0[v19].Parent.Name ~= "Modules" then
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 113 ]]
                    -- upvalues: v8 (ref), v16 (copy), l_v9_0 (copy), v19 (copy), v17 (ref)
                    v8[v16] = require(l_v9_0[v19]);
                    v17 = v8[v16];
                end);
                if l_status_0 == false then
                    warn("error: " .. l_result_0);
                    break;
                else
                    break;
                end;
            end;
        end;
        return v17;
    end;
end;
require(game.ReplicatedStorage.Modules.SharedGlobals)();
_G.clientEffectsFolder = l_Effects_0;