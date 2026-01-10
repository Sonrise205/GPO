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
    v7.Mobile = v6;
    v7.Button = v7:_createButton({
        ButtonData = v6.SavedButtons[script.Name], 
        Texture = "http://www.roblox.com/asset/?id=17062994173", 
        Name = script.Name
    });
    return v7;
end;
v5.Activated = function(_) --[[ Line: 29 ]] --[[ Name: Activated ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    if l_LocalPlayer_0.Character:FindFirstChild("gripweld") then
        warn("cancel grip");
        game.ReplicatedStorage.Events.KnockedOut:FireServer("grip", nil);
        return;
    else
        require(l_LocalPlayer_0.Backpack:WaitForChild("InputCallbacks")).Callbacks.Grip:Mobile_Activate();
        return;
    end;
end;
v5.Update = function(v9) --[[ Line: 42 ]] --[[ Name: Update ]]
    v9.Button.Visible = v9.Mobile.Buttons.Carry:_uiVisibility();
end;
return v5;