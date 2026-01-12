local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Client_0 = l_ReplicatedStorage_0:WaitForChild("Modules"):WaitForChild("Client");
local l_UIController_0 = require(l_Client_0:WaitForChild("UIController"));
local v3 = l_ReplicatedStorage_0:WaitForChild("Stats" .. game.Players.LocalPlayer.Name);
v3:WaitForChild("Stats");
v3:WaitForChild("Quest");
l_UIController_0:Initialize();