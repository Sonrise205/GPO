local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_Modules_0 = l_ReplicatedStorage_0.Modules;
local _ = l_Players_0.LocalPlayer;
local _ = require(l_Modules_0.ContextActionService);
local v5 = setmetatable({}, (require(script.Parent.Shared)));
v5.__index = v5;
v5.new = function(v6) --[[ Line: 16 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy)
    local v7 = setmetatable({}, v5);
    v7.Mobile = v6;
    v7.Button = v7:_createButton({
        ButtonData = v6.SavedButtons[script.Name], 
        Texture = "rbxassetid://17653706771", 
        Name = script.Name
    });
    return v7;
end;
v5.Activated = function(_) --[[ Line: 29 ]] --[[ Name: Activated ]]
    _G.swimmingDecension = true;
end;
v5.Deactivated = function(_) --[[ Line: 33 ]] --[[ Name: Deactivated ]]
    _G.swimmingDecension = false;
end;
v5.Update = function(v10) --[[ Line: 37 ]] --[[ Name: Update ]]
    v10.Button.Visible = _G.swimming or v10.Mobile.EditMode.Editting;
end;
return v5;