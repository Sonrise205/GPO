local l_Players_0 = game:GetService("Players");
local _ = game:GetService("ReplicatedStorage");
local _ = l_Players_0.LocalPlayer:WaitForChild("PlayerGui");
local v3 = {
    Initialized = false
};
v3.Initialize = function(_) --[[ Line: 10 ]] --[[ Name: Initialize ]]
    -- upvalues: v3 (copy)
    v3.Initialized = true;
end;
return v3;