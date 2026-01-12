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
        Texture = "http://www.roblox.com/asset/?id=17062995746", 
        Name = script.Name
    });
    v7.PickUpRadius = 15;
    return v7;
end;
v5.Activated = function(_) --[[ Line: 31 ]] --[[ Name: Activated ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    require(l_LocalPlayer_0.Backpack:WaitForChild("InputCallbacks")).Callbacks.Carry:Mobile_Activate();
end;
v5._uiVisibility = function(v9) --[[ Line: 36 ]] --[[ Name: _uiVisibility ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    if v9.Mobile.EditMode.Editting then
        return true;
    else
        for _, v11 in workspace.Ragdolls:GetChildren() do
            local l_Character_0 = l_LocalPlayer_0.Character;
            if v11 ~= l_Character_0 and v11.PrimaryPart ~= nil then
                local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                if l_HumanoidRootPart_0 and (v11.HumanoidRootPart.Position - l_HumanoidRootPart_0.Position).Magnitude < v9.PickUpRadius then
                    return true;
                end;
            end;
        end;
        return;
    end;
end;
v5.Update = function(v14) --[[ Line: 49 ]] --[[ Name: Update ]]
    v14.Button.Visible = v14:_uiVisibility();
end;
return v5;