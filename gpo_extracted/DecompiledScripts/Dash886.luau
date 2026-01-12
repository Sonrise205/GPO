local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_Modules_0 = l_ReplicatedStorage_0.Modules;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local _ = require(l_Modules_0.ContextActionService);
local v5 = setmetatable({}, (require(script.Parent.Shared)));
v5.__index = v5;
v5.new = function(v6) --[[ Line: 16 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy)
    local v7 = setmetatable({}, v5);
    v7.Button = v7:_createButton({
        ButtonData = v6.SavedButtons[script.Name], 
        Texture = "http://www.roblox.com/asset/?id=15938960818", 
        Name = script.Name
    });
    return v7;
end;
v5.Activated = function(_) --[[ Line: 28 ]] --[[ Name: Activated ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    require(l_LocalPlayer_0.Backpack:WaitForChild("InputCallbacks")).Callbacks.Dash:Mobile_Activate();
end;
return v5;