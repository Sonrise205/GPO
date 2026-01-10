local l_TeleportService_0 = game:GetService("TeleportService");
local l_Players_0 = game:GetService("Players");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_l_TeleportService_0_ArrivingTeleportGui_0 = l_TeleportService_0:GetArrivingTeleportGui();
if l_l_TeleportService_0_ArrivingTeleportGui_0 then
    local l_PlayerGui_0 = l_Players_0.LocalPlayer:WaitForChild("PlayerGui");
    l_ReplicatedFirst_0:RemoveDefaultLoadingScreen();
    l_l_TeleportService_0_ArrivingTeleportGui_0.Parent = l_PlayerGui_0;
    local v5 = script.LoadingGUI:Clone();
    v5.Parent = game.Players.LocalPlayer.PlayerGui;
    v5.CanvasGroup.LocalScript.Disabled = false;
    l_l_TeleportService_0_ArrivingTeleportGui_0:Destroy();
end;
game:GetService("TeleportService"):SetTeleportGui(script:WaitForChild("LoadingGUI"));