local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local _ = game:GetService("RunService");
local l_Modules_0 = l_ReplicatedStorage_0.Modules;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v5 = RaycastParams.new();
v5.FilterDescendantsInstances = {
    workspace.Islands, 
    workspace.Ships, 
    workspace.Env
};
v5.FilterType = Enum.RaycastFilterType.Include;
local _ = require(l_Modules_0.ContextActionService);
local v7 = setmetatable({}, (require(script.Parent.Shared)));
v7.__index = v7;
v7.new = function(v8) --[[ Line: 20 ]] --[[ Name: new ]]
    -- upvalues: v7 (copy)
    local v9 = setmetatable({}, v7);
    v9.Mobile = v8;
    v9.Button = v9:_createButton({
        ButtonData = v8.SavedButtons[script.Name], 
        Texture = "http://www.roblox.com/asset/?id=15938962139", 
        Name = script.Name
    });
    v9.Detect = nil;
    return v9;
end;
v7.Activated = function(_) --[[ Line: 35 ]] --[[ Name: Activated ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    require(l_LocalPlayer_0.Backpack:WaitForChild("InputCallbacks")).Callbacks.Climb:Mobile_Activate();
end;
v7._frontDetection = function(_) --[[ Line: 40 ]] --[[ Name: _frontDetection ]]
    -- upvalues: l_LocalPlayer_0 (copy), v5 (copy)
    local l_HumanoidRootPart_0 = l_LocalPlayer_0.Character.HumanoidRootPart;
    return (workspace:Raycast(l_HumanoidRootPart_0.Position, l_HumanoidRootPart_0.CFrame.LookVector * 3, v5));
end;
v7.Update = function(v13) --[[ Line: 48 ]] --[[ Name: Update ]]
    local l_Button_0 = v13.Button;
    local v15 = true;
    if v13:_frontDetection() == nil then
        v15 = v13.Mobile.EditMode.Editting;
    end;
    l_Button_0.Visible = v15;
end;
return v7;