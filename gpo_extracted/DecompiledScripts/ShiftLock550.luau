local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_Modules_0 = l_ReplicatedStorage_0.Modules;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_PlayerScripts_0 = l_LocalPlayer_0:WaitForChild("PlayerScripts");
local l_PlayerModule_0 = require(l_PlayerScripts_0:WaitForChild("PlayerModule"));
local l_MobileMouseIcon_0 = l_LocalPlayer_0:WaitForChild("PlayerGui"):WaitForChild("MobileMouseIcon");
local v7 = require(l_Modules_0.ContextActionService);
local v8 = setmetatable({}, (require(script.Parent.Shared)));
v8.__index = v8;
v8.new = function(v9) --[[ Line: 21 ]] --[[ Name: new ]]
    -- upvalues: v8 (copy), l_PlayerModule_0 (copy)
    local v10 = setmetatable({}, v8);
    l_PlayerModule_0.cameras.CameraModule:ConstructMobileShiftLock();
    v10.Button = v8:_createButton({
        ButtonData = v9.SavedButtons[script.Name], 
        Texture = "rbxassetid://17604463768", 
        Name = script.Name
    });
    return v10;
end;
v8.Activated = function(_) --[[ Line: 35 ]] --[[ Name: Activated ]]
    -- upvalues: l_PlayerModule_0 (copy), l_MobileMouseIcon_0 (copy), v7 (copy)
    l_PlayerModule_0.cameras.CameraModule:ToggleMobileShiftLock();
    local l_IsMouseLocked_0 = l_PlayerModule_0.cameras.CameraModule.activeMouseLockController:GetIsMouseLocked();
    l_MobileMouseIcon_0.Enabled = l_IsMouseLocked_0;
    v7:UpdateTexture({
        ButtonName = "ShiftLock", 
        Texture = l_IsMouseLocked_0 and "http://www.roblox.com/asset/?id=15938966453" or "rbxassetid://17604463768"
    });
end;
return v8;