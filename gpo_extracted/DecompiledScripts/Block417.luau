local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local l_Modules_0 = l_ReplicatedStorage_0.Modules;
local v3 = require(l_Modules_0.ContextActionService);
local v4 = setmetatable({}, (require(script.Parent.Shared)));
v4.__index = v4;
local v5 = game.ReplicatedStorage:WaitForChild("Stats" .. l_LocalPlayer_0.Name, 5);
v4.new = function(v6) --[[ Line: 20 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy)
    local v7 = setmetatable({}, v4);
    v7.Button = v7:_createButton({
        ButtonData = v6.SavedButtons[script.Name], 
        Texture = "http://www.roblox.com/asset/?id=17628061408", 
        Name = script.Name
    });
    v7:_main();
    return v7;
end;
v4.Activated = function(_) --[[ Line: 33 ]] --[[ Name: Activated ]]
    -- upvalues: v5 (copy)
    if v5.Settings.MobileBlockToggle.Value then
        _G.HoldingBlockKey = not _G.HoldingBlockKey;
        return;
    else
        _G.HoldingBlockKey = true;
        return;
    end;
end;
v4.Deactivated = function(_) --[[ Line: 44 ]] --[[ Name: Deactivated ]]
    -- upvalues: v5 (copy)
    if not v5.Settings.MobileBlockToggle.Value then
        _G.HoldingBlockKey = false;
    end;
end;
v4._main = function(v10) --[[ Line: 52 ]] --[[ Name: _main ]]
    -- upvalues: l_LocalPlayer_0 (copy), v3 (copy)
    local l_Button_0 = v10.Button;
    local function v13(v12) --[[ Line: 55 ]] --[[ Name: UpdateVisibility ]]
        -- upvalues: l_Button_0 (copy), l_LocalPlayer_0 (ref)
        if v12 and not v12:IsA("Tool") then
            return;
        else
            l_Button_0.Visible = v12.Parent == l_LocalPlayer_0.Character;
            return;
        end;
    end;
    local function v15(v14) --[[ Line: 61 ]] --[[ Name: Update ]]
        -- upvalues: l_Button_0 (copy), v13 (copy)
        l_Button_0.Visible = false;
        v14.ChildAdded:Connect(v13);
        v14.ChildRemoved:Connect(v13);
    end;
    local function v17() --[[ Line: 68 ]] --[[ Name: UpdateTexture ]]
        -- upvalues: v3 (ref)
        while task.wait() do
            local v16 = {
                ButtonName = "Block", 
                Texture = not _G.blocking and "rbxassetid://17628061604" or "http://www.roblox.com/asset/?id=17628061408", 
                Title = _G.blocking and "Unblock" or "Block"
            };
            v3:UpdateTitle(v16);
            v3:UpdateTexture(v16);
        end;
    end;
    task.spawn(v17);
    local v18 = l_LocalPlayer_0.Character or l_LocalPlayer_0.CharacterAdded:Wait();
    l_Button_0.Visible = false;
    v18.ChildAdded:Connect(v13);
    v18.ChildRemoved:Connect(v13);
    l_LocalPlayer_0.CharacterAdded:Connect(v15);
end;
return v4;