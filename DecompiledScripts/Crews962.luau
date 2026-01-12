local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("TweenService");
local _ = game:GetService("UserInputService");
local _ = l_Players_0.LocalPlayer:WaitForChild("PlayerGui");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local _ = require(l_Modules_0.Leveling);
local l_Shared_0 = l_Modules_0.Shared;
local _ = require(l_Shared_0.GameUtils);
local _ = require(l_Shared_0:WaitForChild("SoundUtils"));
local _ = l_ReplicatedStorage_0:WaitForChild("Events");
local v11 = {
    Initialized = false
};
v11.Initialize = function(v12) --[[ Line: 21 ]] --[[ Name: Initialize ]]
    -- upvalues: v11 (copy)
    if v11.Initialized then
        return;
    else
        local _ = v12:GetStatsFolder();
        v11.CrewsUI = require(script.CrewsUI);
        v11.CrewsUI:Initialize(v12);
        v11.Initialized = true;
        return;
    end;
end;
return v11;