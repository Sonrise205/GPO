local l__SoftShutdownClientPackages_0 = game:GetService("ReplicatedFirst"):WaitForChild("_SoftShutdownClientPackages");
local v1 = require(l__SoftShutdownClientPackages_0.SoftShutdownServiceClient);
local v2 = require(l__SoftShutdownClientPackages_0.ServiceBag).new();
v2:GetService(v1);
v2:Init();
v2:Start();