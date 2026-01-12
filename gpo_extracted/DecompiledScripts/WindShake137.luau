local _ = workspace.CurrentCamera;
local _ = game:GetService("RunService");
local v2 = require(script.WindShake);
v2:SetDefaultSettings({
    WindSpeed = 20, 
    WindDirection = Vector3.new(1, 0, 0.30000001192092896, 0), 
    WindPower = 0.5
});
v2:Init();