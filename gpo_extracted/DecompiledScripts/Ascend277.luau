local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local _ = game:GetService("UserInputService");
local l_Modules_0 = l_ReplicatedStorage_0.Modules;
local _ = l_Players_0.LocalPlayer;
local v5 = require(l_Modules_0.ContextActionService);
local v6 = setmetatable({}, (require(script.Parent.Shared)));
v6.__index = v6;
v6.new = function(_) --[[ Line: 17 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy), v5 (copy)
    local v8 = setmetatable({}, v6);
    local function v9() --[[ Line: 20 ]] --[[ Name: Activated ]]
        _G.swimmingAscension = true;
    end;
    local function v10() --[[ Line: 25 ]] --[[ Name: Deactivated ]]
        _G.swimmingAscension = false;
    end;
    local _, _, v13 = v5:GetMobileUI();
    v13.MouseButton1Down:Connect(v9);
    v13.MouseButton1Up:Connect(v10);
    return v8;
end;
return v6;