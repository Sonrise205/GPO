local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_Modules_0 = l_ReplicatedStorage_0.Modules;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v4 = RaycastParams.new();
v4.FilterDescendantsInstances = {
    workspace.Ships
};
v4.FilterType = Enum.RaycastFilterType.Include;
local _ = require(l_Modules_0.ContextActionService);
local v6 = setmetatable({}, (require(script.Parent.Shared)));
v6.__index = v6;
v6.new = function(v7) --[[ Line: 19 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy)
    local v8 = setmetatable({}, v6);
    v8.Mobile = v7;
    v8.Button = v8:_createButton({
        ButtonData = v7.SavedButtons[script.Name], 
        Texture = "rbxassetid://17594682814", 
        Name = script.Name
    });
    return v8;
end;
v6.Activated = function(_) --[[ Line: 32 ]] --[[ Name: Activated ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    require(l_LocalPlayer_0.Backpack:WaitForChild("InputCallbacks")).Callbacks.ShipSeat:Mobile_Activate();
end;
v6._groundDetection = function(_) --[[ Line: 37 ]] --[[ Name: _groundDetection ]]
    -- upvalues: l_LocalPlayer_0 (copy), v4 (copy)
    local l_Character_0 = l_LocalPlayer_0.Character;
    local l_PrimaryPart_0 = l_Character_0.PrimaryPart;
    local l_Humanoid_0 = l_Character_0.Humanoid;
    if l_PrimaryPart_0 == nil then
        return nil;
    else
        local v14 = l_Humanoid_0.HipHeight + l_PrimaryPart_0.Size.Y * 0.5 + 1;
        return (workspace:Raycast(l_PrimaryPart_0.Position, l_PrimaryPart_0.CFrame.UpVector * -v14, v4));
    end;
end;
v6.Update = function(v15) --[[ Line: 50 ]] --[[ Name: Update ]]
    v15.Button.Visible = v15:_groundDetection() or v15.Mobile.EditMode.Editting;
end;
return v6;