local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_Modules_0 = l_ReplicatedStorage_0.Modules;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_PlayerGui_0 = l_LocalPlayer_0.PlayerGui;
local _ = require(l_Modules_0.ContextActionService);
local v6 = setmetatable({}, (require(script.Parent.Shared)));
v6.__index = v6;
v6.new = function(v7) --[[ Line: 17 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy)
    local v8 = setmetatable({}, v6);
    v8.Button = v8:_createButton({
        ButtonData = v7.SavedButtons[script.Name], 
        Button = v8:_getButton(), 
        Name = script.Name
    });
    return v8;
end;
v6._getButton = function(_) --[[ Line: 29 ]] --[[ Name: _getButton ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_PlayerGui_0 (copy)
    if not l_LocalPlayer_0.Character then
        local _ = l_LocalPlayer_0.CharacterAdded:Wait();
    end;
    return (l_PlayerGui_0:WaitForChild("Modes"):WaitForChild("Frame"):WaitForChild("GeneralBars"):WaitForChild("Ken"));
end;
v6.Activated = function(_) --[[ Line: 39 ]] --[[ Name: Activated ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    require(l_LocalPlayer_0.Backpack:WaitForChild("InputCallbacks")).Callbacks.Ken:Mobile_Activate();
end;
return v6;